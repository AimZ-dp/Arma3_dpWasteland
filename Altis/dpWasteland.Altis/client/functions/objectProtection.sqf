// Name:			objectProtection.sqf
// Author:			AimZ =(dp)=
// Date:			29th September 2014
// Description:  	Stops all damage to buildings. 

/*
[] spawn {

	_centerPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
	_mapSize =  getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize");

	_objects = nearestObjects [_centerPos, ["House_F"], _mapSize/2];
	{
		_x allowDamage false;
		_x setVariable ["R3F_LOG_disabled", true, true];
	} foreach _objects;
	sleep 0.1;
};
*/

/*
[] spawn {
	while {true} do
	{
		_objects = nearestObjects [position player, ["Car","Helicopter","Ship"], 10];
		{
			_x enableSimulationGlobal true;
		} foreach _objects;
		sleep 0.1;
	};
};
*/