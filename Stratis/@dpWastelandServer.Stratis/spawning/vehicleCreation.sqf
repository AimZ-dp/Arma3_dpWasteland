
//	@file Version: 2.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

//diag_log format["*** vehicleCreation Started ***"];

private ["_cartype","_car","_type","_position"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _objectList));
_cartype = _objectList select _type;

_car = createVehicle [_cartype,[7094,5961,0],[],40,"NONE"];
_car setVariable ["newVehicle",vChecksum,true];
_car setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_car setVariable ["last_timeout", time, true];
_car setVariable ["status", "alive", true];
_car setVariable ["respawn", _respawn, true];
_car setDir (random 360);
_position = [_position,1,_coverArea,1,0,1,0] call BIS_fnc_findSafePos;
_car setPos _position;

//_car allowDamage false;
//_car enableSimulation false;

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _car;
	clearWeaponCargoGlobal _car;

	//Set Cars Attributes
	_car setFuel (random 0.50) + 0.10;
	_car setDamage (random 0.25) + 0.50;

	if (count(configFile >> "CfgVehicles" >> (typeOf _car) >> "Turrets") > 0) then
	{
		_car setVehicleAmmo (random 0.75) + 0.25;
	};

	//_car disableTIEquipment true;
	[_car] call randomWeapons;
};

_car

//diag_log format["*** vehicleCreation Finished ***"];
