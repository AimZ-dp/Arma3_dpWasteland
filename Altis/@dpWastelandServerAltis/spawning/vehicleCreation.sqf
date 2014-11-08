
//	@file Version: 2.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

//diag_log format["*** vehicleCreation Started ***"];

private ["_position","_objectList","_restrictContent","_coverArea","_respawn"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;
_byRoad = false;
if (count _this > 5) then 
{
	_byRoad = _this select 5;
};

// Get the random position
private ["_newPos", "_posX", "_posY","_pos"];
_newPos = [];
_posX = _position select 0;
_posY = _position select 1;

private ["_newX", "_newY"];
_isOnWater = true;
_count = 0;
while {_isOnWater && _count < 1000} do 
{
	_newX = _posX + (_coverArea - (random (_coverArea * 2)));
	_newY = _posY + (_coverArea - (random (_coverArea * 2)));
	_newPos = [_newX, _newY];
	_pos = _newPos;
	
	_isOnWater = surfaceIsWater _pos;
	
	_count = _count + 1;
};

if (_byRoad) then
{
	// move point to the nearest road
	_roads = _pos nearRoads _coverArea*2;
	_minDist = _coverArea*2;
	{
		_dist = _x distance _pos;
		if (_dist < _minDist) then
		{
			_newPos = position _x;
			_minDist = _dist;
		};
	} foreach _roads;
};

// Get the random vehicle type to spawn
private ["_cartype","_car","_type"];
_type = floor (random (count _objectList));
_cartype = _objectList select _type;

// Create the object at the found new position
_car = createVehicle [_cartype,_newPos,[],0,"NONE"];
_car setDir (random 360);

// Add variables to allow the server to control the respawn, burning times and remove hacked vehicles
_car setVariable ["newVehicle",vChecksum,true];
_car setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_car setVariable ["last_timeout", time, true];
_car setVariable ["status", "alive", true];
_car setVariable ["respawn", _respawn, true];


if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _car;
	clearWeaponCargoGlobal _car;

	//Set Cars Attributes
	_car setFuel (random 0.50) + 0.25;
	_car setDamage (random 0.50) + 0.25;

	if (count(configFile >> "CfgVehicles" >> (typeOf _car) >> "Turrets") > 0) then
	{
		_car setVehicleAmmo (random 0.75) + 0.25;
	};

	//_car disableTIEquipment true;
	[_car] call randomWeapons;
};

if (_isOnWater) then {
	_car setDamage 1;
};

/*
	_markerName = format["vehicle_marker_%1",_newPos];
	_marker = createMarker [_markerName, _newPos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType  "mil_dot";
	_marker setMarkerColor "ColorOrange";
	_marker setMarkerAlpha 0.5; 
*/
_car


//diag_log format["*** vehicleCreation Finished ***"];
