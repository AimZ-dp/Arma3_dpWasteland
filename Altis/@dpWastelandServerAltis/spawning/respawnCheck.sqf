if (!isServer) exitWith {};

diag_log format["****** repawnCheck Started ******"];

private ["_unit","_delay","_deserted","_position","_type","_damage","_alive","_curtime","_timeout","_respawn","_num","_objectDistance","_radius"];

// Define variables

_delay = burningTimeLimit;
_deserted = desertedTimeLimit;

while {true} do
{
	{
		if (!(isNull _x)) then
		{
			_unit = _x;
			_type = typeOf _unit;
			_status = _unit getVariable ["status", "unknown"];
			
			_unit setVariable ["last_timeout", time, true];
			
			switch (_status) do
			{
				case "alive": 
				{
					_damage = damage _unit;	
					_alive = {alive _x} count crew _unit;
					_curtime = time;
					_timeout = _unit getVariable ["timeout", -1];

					if (_timeout > -1) then 
					{
						if (_alive == 0 and _damage <= 0.90) then 
						{
							if (_curtime > _timeout) then
							{
								_unit setVariable ["status", "respawn", true];
							};
						}
						else
						{
							_unit setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
						};
					};

					// check for badly broken
					if ((_damage > 0.90 and _alive == 0) or !alive _unit) then 
					{
						_unit setDamage 1;
						_unit setVariable ["status", "burn", true];
						_unit setVariable ["timeout", (time + burningTimeLimit), true];
					};
				}; 
				case "burn": 
				{
					_curtime = time;
					_timeout = _unit getVariable ["timeout", (time + burningTimeLimit)];
				
					if (_curtime > _timeout) then
					{
						_unit setVariable ["status", "respawn", true];
					};
				}; 
				case "respawn": 
				{
					_respawn = _unit getVariable ["respawn", false];
					if (!_respawn) then
					{
						_unit removeAllEventHandlers "GetIn";
						_unit removeAllEventHandlers "killed";
						_unit removeAllEventHandlers "HandleDamage";
						deleteVehicle _unit;
					}
					else
					{
						if (_unit isKindOf "Car") then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							// TODO: MAKE THIS A FUNCTION - PASS IN AN ARRAY OF MARKER ARRAYS (CITY & BAY), RANDOM WHERE
							private ["_townPos","_townNumber","_ZoneRestricted","_attempts"];
							_townNumber = 0;
							_ZoneRestricted = true;
							_attempts = 0;
							while {(_ZoneRestricted && _attempts < 1000)} do
							{
								// GET A RANDOM TOWN POSITION
								_townNumber = floor (random (count cityList));
								_townPos = getMarkerPos format ["Town_%1", _townNumber+1];

								_ZoneRestricted = [_townPos] call isPosRestricted;
								
								_attempts = _attempts + 1;
							};
							//-----------------------------------------------------
							_position = getMarkerPos format ["Town_%1", _townNumber+1];
							_radius = (cityList select _townNumber) select 1;
	
							_type = floor (random 4);
							switch (_type) do 
							{ 
							  case 0: {[_position, Quadbikes, true, _radius, true] call vehicleCreation;}; 
							  case 1: {[_position, Cars, true, _radius, true] call vehicleCreation;}; 
							  case 2: {[_position, Trucks, true, _radius, true] call vehicleCreation;}; 
							  case 3: {[_position, UnarmedMRAPVehicles, true, _radius, true] call vehicleCreation;}; 
							};
						};
						if (_unit isKindOf "Ship") then		// Ship or Boat_F - could be wrong - TEST IT! Update: Think Ship works fine.
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							private ["_townPos","_townNumber","_ZoneRestricted","_attempts"];
							_townNumber = 0;
							_ZoneRestricted = true;
							_attempts = 0;
							while {(_ZoneRestricted && _attempts < 1000)} do
							{
								// GET A RANDOM TOWN POSITION
								_townNumber = floor (random (count bayList));
								_townPos = getMarkerPos format ["Bay_%1", _townNumber+1];

								_ZoneRestricted = [_townPos] call isPosRestricted;
								
								_attempts = _attempts + 1;
							};
							_position = getMarkerPos format ["Bay_%1", _townNumber+1];
							_radius = (bayList select _townNumber) select 1;
	
							_type = floor (random 3);
							switch (_type) do
							{
								case 0: {[_position, Rubber_duck_base_F, true, _radius, true] call boatCreation;};
								case 1: {[_position, Boat_Civil_01_base_F, true, _radius, true] call boatCreation;};
								case 2: {[_position, SDV_01_base_F, true, _radius, true] call boatCreation;};
							};
						};
						if (_unit isKindOf "ReammoBox_F") then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							private ["_townPos","_townNumber","_ZoneRestricted","_attempts"];
							_townNumber = 0;
							_ZoneRestricted = true;
							_attempts = 0;
							while {(_ZoneRestricted && _attempts < 1000)} do
							{
								// GET A RANDOM TOWN POSITION
								_townNumber = floor (random (count cityList));
								_townPos = getMarkerPos format ["Town_%1", _townNumber+1];

								_ZoneRestricted = [_townPos] call isPosRestricted;
								
								_attempts = _attempts + 1;
							};
							_position = getMarkerPos format ["Town_%1", _townNumber+1];
							_radius = (cityList select _townNumber) select 1;
							
							[_position, ammoBoxes, true, _radius, true] call boxCreation;	
						};
						if (_unit isKindOf "Helicopter") then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							_position = getMarkerPos format ["Airport_%1", floor(random (count airportList))+1];							
							_type = floor (random 2);
							switch (_type) do 
							{ 
							  case 0: {[_position, LightHelicopters, true, 50, true] call vehicleCreation;}; 
							  case 1: {[_position, TransportHelicopters, true, 50, true] call vehicleCreation;}; 
							};
						};
						if ((typeof _unit) in survivalObjectList) then
						{
							_unit removeAllEventHandlers "GetIn";
							_unit removeAllEventHandlers "killed";
							_unit removeAllEventHandlers "HandleDamage";
							deleteVehicle _unit;
							
							private ["_townPos","_townNumber","_ZoneRestricted","_attempts"];
							_townNumber = 0;
							_ZoneRestricted = true;
							_attempts = 0;
							while {(_ZoneRestricted && _attempts < 1000)} do
							{
								// GET A RANDOM TOWN POSITION
								_townNumber = floor (random (count cityList));
								_townPos = getMarkerPos format ["Town_%1", _townNumber+1];

								_ZoneRestricted = [_townPos] call isPosRestricted;
								
								_attempts = _attempts + 1;
							};
							_position = getMarkerPos format ["Town_%1", _townNumber+1];
							_radius = (cityList select _townNumber) select 1;
							
							[_position, survivalObjectList, true, _radius, true] call survivalObjectCreation;	
						};
					};
				}; 
				case "unknown": 
				{
					//diag_log format["SPAWN - unknown state for vehicle: %1", _type];
				}; 
			};
		};
	} foreach vehicles;

	sleep 1;
};

diag_log format["****** repawnCheck Finished ******"];
