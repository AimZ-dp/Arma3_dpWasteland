//	Name: JetCreation.sqf
//	Author: [CAD] Krycek

if(!isDedicated) exitWith {};

//diag_log format["*** JetCreation Started ***"];

private ["_position","_objectList","_restrictContent","_coverArea","_respawn"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;
_wreck = false;
if (count _this > 5) then 
{
	_wreck = _this select 5;
};

private ["_newPos", "_jettype","_jet","_type"];
// Get the random position
_newPos = [_position,1,_coverArea,5,0,1,0] call BIS_fnc_findSafePos;

// Get the random vehicle type to spawn
_type = floor (random (count _objectList));
_jettype = _objectList select _type;

// Create the object at the found new position
_jet = createVehicle [_jettype,_newPos,[],5,"NONE"];
_jet setDir (random 360);

// Add variables to allow the server to control the respawn, burning times and remove hacked vehicles
_jet setVariable["newVehicle",vChecksum,true];
_jet setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_jet setVariable ["last_timeout", time, true];
_jet setVariable ["status", "alive", true];
_jet setVariable ["respawn", _respawn, true];

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _jet;
	clearWeaponCargoGlobal _jet;

	// Set Attributes
	// set status of vehicle
	_jet setFuel (0.75 + (random 0.25));
	_jet setDamage (0.75 + (random 0.25));

	if (count(configFile >> "CfgVehicles" >> (typeOf _jet) >> "Turrets") > 0) then
	{
		_jet setVehicleAmmo (0.75 + (random 0.25));
	};
};


if (_wreck) then 
{
	_jet setDamage 1;
	_jet setVariable ["status", "unknown", true];
};

/*
	_markerName = format["jet_marker_%1",_newPos];
	_marker = createMarker [_markerName, _newPos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType  "mil_dot";
	_marker setMarkerColor "ColorRed";
	_marker setMarkerAlpha 0.5; 
*/

_jet
//diag_log format["*** JetCreation finished ***"];
