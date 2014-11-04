// Name:			objectProtection.sqf
// Author:			AimZ =(dp)=
// Date:			29th September 2014
// Description:  	Stops all damage to buildings. 

[] spawn {

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

	_centerPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_mapSize =  getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize");

	while {true} do
	{
		_objects = vehicles;
		{
			_cars = _x nearEntities ["Car", 50];
			{
				if (count (crew _x) <= 0) then
				{
					_cars set [_forEachIndex, -1];
				};
			} foreach _cars;
			_cars = _cars - [-1]; 
			
			_players = _x nearEntities ["Man", 50];
			_vel = velocity _x; 
			_status = _x getVariable ["status", "unknown"];
						
			if ((count _players > 0 || count _cars > 0) 
				|| ((_vel select 0) > 0 || (_vel select 1) > 0 || (_vel select 2) > 0) 
				|| (count (crew _x) > 0 || isEngineOn _x)
				|| (_status == "burn")) then
			{
				if !(simulationEnabled _x) then
				{
					_x enableSimulationGlobal true;
				};
			}
			else
			{
				// need a delay before it locks
				[_x] spawn {
					_x = _this select 0;
					
					if (simulationEnabled _x) then
					{
						sleep 5;
						
						_x enableSimulationGlobal false;
						
						//_pos = position _x;
						//_pos set [2, (_pos select 2) + 0.2];
						//_x setPos _pos;
					};
				};
			};
			
						
			if (count (crew _x) <= 0 && isEngineOn _x) then
			{
				[[[_x],"client\functions\serverFunc\engineOff.sqf"],"BIS_fnc_execVM",_x,false] spawn BIS_fnc_MP;
			};
			
		} foreach _objects;
		sleep 0.1;
	};
};