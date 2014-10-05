//	Name: JetCreation.sqf
//	Author: [CAD] Krycek

if(!isDedicated) exitWith {};

//diag_log format["*** JetCreation Started ***"];

private ["_jettype","_jet","_type","_position"];
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

_type = floor (random (count _objectList));
_jettype = _objectList select _type;

_jet = createVehicle [_jettype,[7094,5961,0],[],40,"NONE"];
_jet setVariable["newVehicle",vChecksum,true];
_jet setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_jet setVariable ["last_timeout", time, true];
_jet setVariable ["status", "alive", true];
_jet setVariable ["respawn", _respawn, true];
_jet setDir (random 360);
_position = [_position, 1, _coverArea, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
_jet setPos _position;

//_jet allowDamage false;
//_jet enableSimulation false;

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

sleep 1;

if (_wreck) then 
{
	_jet setDamage 1;
	_jet setVariable ["status", "unknown", true];
};

_jet
//diag_log format["*** JetCreation finished ***"];
