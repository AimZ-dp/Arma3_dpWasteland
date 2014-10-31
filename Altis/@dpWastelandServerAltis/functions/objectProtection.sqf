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
		// allMines
		//_objects = allMissionObjects "All";
		_objects = vehicles;
		// entities "All";
		//_objects = nearestObjects [_centerPos, ["Car","Helicopter","Ship"], _mapSize/2];
		{
			//_players = nearestObjects [_x, ["SoldierWB","SoldierEB","SoldierGB","Civilian"], 30];
			_players = _x nearEntities ["Man", 20];
			if (count _players > 0 || count (crew _x) > 0) then
			{
				if !(simulationEnabled _x) then
				{
					_x enableSimulationGlobal true;
				};
			}
			else
			{
				if (simulationEnabled _x) then
				{
					_x enableSimulationGlobal false;
					_pos = position _x;
					_pos set [2, (_pos select 2) + 0.1];
					_x setPos _pos;
				};
			};
		} foreach _objects;
		sleep 0.1;
	};
};