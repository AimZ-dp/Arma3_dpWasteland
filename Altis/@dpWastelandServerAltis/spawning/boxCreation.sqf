//	Name: boxCreation.sqf
//	Author: AimZ =(dp)=

if(!isDedicated) exitWith {};

//diag_log format["*** boxCreation Started ***"];

private ["_position","_ammoBoxList","_restrictContent","_coverArea","_respawn"];
_position = _this select 0;
_ammoBoxList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

private ["_newPos", "_boxtype","_box","_type"];

// Get the random position
_newPos = [_position,1,_coverArea,5,0,1,0] call BIS_fnc_findSafePos;

// Get the random vehicle type to spawn
_type = floor (random (count _ammoBoxList));
_boxtype = _ammoBoxList select _type;

// Create the object at the found new position
_box = createVehicle [_boxtype,_newPos,[],0,"NONE"];
_box setDir (random 360);

// move into building
_houses = nearestObjects [_position, ["house"], _coverArea];
// if house valid then _houses
if (count _houses > 0) then 
{
	_positions = [_houses select 0] call BIS_fnc_buildingPositions;
	if (count _positions > 0) then
	{
		_newPos = _positions select (floor (random (count _positions)));
		_box setPos _newPos;
	};
};

// Add variables to allow the server to control the respawn, burning times and remove hacked vehicles
_box setVariable ["newVehicle",vChecksum,true];
_box setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
_box setVariable ["last_timeout", time, true];
_box setVariable ["status", "alive", true];
_box setVariable ["respawn", _respawn, true];

if (_restrictContent) then
{
	// remove weapons
	_weapons = getWeaponCargo _box;
	_weapontype = _weapons select 0;
	_weaponcount = _weapons select 1;
	clearWeaponCargoGlobal _box;
	{
		if (!(_x in removeWeapons)) then {
			_box addWeaponCargoGlobal [_x, _weaponcount select _forEachIndex];
		};
	} foreach _weapontype;

	// remove ammo
	_ammos = getMagazineCargo _box;
	_ammotype = _ammos select 0;
	_ammocount = _ammos select 1;

	clearMagazineCargoGlobal _box;
	{
		if (!(_x in removeAmmo)) then {
			_box addMagazineCargoGlobal [_x, _ammocount select _forEachIndex];
		};
	} foreach _ammotype;
};

/*
	_markerName = format["box_marker_%1",_newPos];
	_marker = createMarker [_markerName, _newPos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType  "mil_dot";
	_marker setMarkerColor "ColorWhite";
	_marker setMarkerAlpha 0.5; 
*/

_box
//diag_log format["*** boxCreation Finished ***"];
