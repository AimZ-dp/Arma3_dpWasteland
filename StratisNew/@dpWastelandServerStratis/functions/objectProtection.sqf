// Name:			objectProtection.sqf
// Author:			AimZ =(dp)=
// Date:			29th September 2014
// Description:  	Stops all damage to buildings. 

[] spawn {

	private ["_centerPos","_mapSize","_objects"];
	_centerPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_mapSize =  getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize");

	_objects = nearestObjects [_centerPos, ["House_F"], _mapSize/2];
	{
		//_x allowDamage false;
		_x enableSimulationGlobal true;
		_x setVariable ["R3F_LOG_disabled", true, true];
		sleep 0.1;
	} foreach _objects;
};

[] spawn {

	private ["_centerPos","_mapSize","_objects","_cars","_players","_vel","_status"];
	_centerPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_mapSize =  getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize");

	while {true} do
	{
		_objects = vehicles;
		{
			_veh = _x;
			if (!(isNull _veh)) then
			{
				_cars = _veh nearEntities ["Car", 50];
				{
					if (count (crew _x) <= 0) then
					{
						_cars set [_forEachIndex, -1];
					};
				} forEach _cars;
				_cars = _cars - [-1]; 
				
				_players = _veh nearEntities ["Man", 50];
				_vel = velocity _veh; 
				_status = _veh getVariable ["status", "unknown"];
							
				if ((count _players > 0 || count _cars > 0) 
					|| ((_vel select 0) != 0 || (_vel select 1) != 0 || (_vel select 2) != 0)
					|| ((getPos _veh select 2) > 0.1)
					|| (count (crew _veh) > 0 || isEngineOn _veh)
					|| (_status == "burn")) then
				{
					if (_veh isKindOf "Helicopter") then
					{
						// heli = 40 secs for engine to stop
						_veh setVariable ["SIM_TIME", time + 50];
					}
					else
					{
						// cars = 8 secs for engine to stop
						_veh setVariable ["SIM_TIME", time + 8];
					};
					
					if !(simulationEnabled _veh) then
					{
						_veh enableSimulationGlobal true;

						//_veh setVariable ["BIS_enableRandomization", false];
						//_textures = getArray (configFile >> "cfgVehicles" >> typeOf _veh >> "hiddenSelectionsTextures");
						//{
						//	_veh setObjectTextureGlobal [_forEachIndex,_x];
						//} forEach _textures;
					};
				}
				else
				{
					_simTime = _veh getVariable ["SIM_TIME", time - 10];
					if (_simTime < time) then
					{						
						if (simulationEnabled _veh) then
						{
							_veh enableSimulationGlobal false;
							
							//_veh setVariable ["BIS_enableRandomization", false];
							//_textures = getArray (configFile >> "cfgVehicles" >> typeOf _veh >> "hiddenSelectionsTextures");
							//{
							//	_veh setObjectTextureGlobal [_forEachIndex,"#(ARGB,8,8,6)color(0.8,0.8,0.8,0.5)"];
							//} forEach _textures;
						};
					};
				};
										
				if (count (crew _veh) <= 0 && isEngineOn _veh) then
				{
					[[[_veh],"client\functions\serverFunc\engineOff.sqf"],"BIS_fnc_execVM",_veh,false] spawn BIS_fnc_MP;
				};
			};
		} forEach _objects;
		sleep 0.1;
	};
};