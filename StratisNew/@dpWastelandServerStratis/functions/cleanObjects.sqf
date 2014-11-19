//	@file Version: 1.0
//	@file Name: cleanObjects.sqf
//	@file Author: AimZ =(dp)=
//	@file Created: 24/06/2013
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** cleanObjects Started ***"];

private ["_check","_checkCount","_allMObjects","_mapbuilding","_timeout"];

_check = 0;
_checkCount = 0;

while {true} do 
{
	_allMObjects = allMissionObjects "All"; 
	{
		if (!(isNull _x)) then 
		{
			_x setVariable ["last_timeout", time, true];
		
			// Clean up mines, hacked vehicles, dropped weapons, etc (ignore playableUnits)
			if(!(_x isKindOf "CAManBase") && !(_x isKindOf "Logic")) then 
			{
				_check = _x getVariable ["newVehicle",0];
				_checkCount = _x getVariable ["newVehicleCount",0];
				_timeout = _x getVariable ["timeout", time + objectTimeOut];	
				
				// REGISTER HACKED OBJECT
				if (_check != vChecksum && _checkCount == 0) then 
				{
					_checkCount = _checkCount + 1;
					_x setVariable ["newVehicleCount",_checkCount,true];
					_x setVariable ["timeout", time + objectTimeOut, true];
				};

				// REMOVE HACKED OBJECT
				if(_check != vChecksum && time > _timeout) then
				{
					_x removeAllEventHandlers "GetIn";
					_x removeAllEventHandlers "killed";
					_x removeAllEventHandlers "HandleDamage";
					deleteVehicle _x;
				};
				
				// REMOVE BASE OBJECTS
				if(_check == vChecksum && time > _timeout) then
				{
					_obj = _x;
					_found = false;
					{
						if ((typeof _obj) == _x select 1) then
						{
							_found = true;
						};
					} forEach pvar_baseObjectList;
				
					if (_found) then
					{
						// if close to a Base Flag extend the time 
						_flags = nearestObjects [_obj, ["FlagPole_F"], baseRadius];
						if (count _flags > 0) then
						{
							_obj setVariable ["timeout", time + baseObjectTimeOut, true];
						}
						else 
						{
							deleteVehicle _obj;
						};
					};
				};
			};
		};
		
		sleep 1;
	} forEach _allMObjects; 
	sleep 1;
};

diag_log format["*** cleanObjects Finished ***"];