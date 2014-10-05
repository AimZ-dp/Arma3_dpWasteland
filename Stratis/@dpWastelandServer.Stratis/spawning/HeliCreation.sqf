//	Name: HeliCreation.sqf
//	Author: AimZ =(dp)=, [CAD] Krycek

if(!isDedicated) exitWith {};

//diag_log format["*** heliCreation Started ***"];

private ["_helitype","_heli","_type","_position"];
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
_helitype = _objectList select _type;

_heli = createVehicle [_helitype,[7094,5961,0],[],40,"NONE"];
_heli setVariable["newVehicle",vChecksum,true];
_heli setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_heli setVariable ["last_timeout", time, true];
_heli setVariable ["status", "alive", true];
_heli setVariable ["respawn", _respawn, true];
_heli setDir (random 360);
_position = [_position,1,_coverArea,2,0,1,0] call BIS_fnc_findSafePos;
_heli setPos _position;

//_heli allowDamage false;
//_heli enableSimulation false;

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _heli;
	clearWeaponCargoGlobal _heli;

	//Set Attributes
	// set status of vehicle
	_heli setFuel (random 0.50) + 0.10;
	_heli setDamage (random 0.25) + 0.50;

	if (count(configFile >> "CfgVehicles" >> (typeOf _heli) >> "Turrets") > 0) then
	{
		_heli setVehicleAmmo (random 0.75) + 0.25;
	};
};

if (_wreck) then 
{
	_heli setDamage 1;
	_heli setVariable ["status", "unknown", true];
};

_heli
//diag_log format["*** heliCreation finished ***"];
