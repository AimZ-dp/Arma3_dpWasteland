//	@file Version: 2.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19

if(!isDedicated) exitWith {};

private ["_position","_objectList","_restrictContent","_coverArea","_respawn","_type","_boattype","_boat"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _objectList));
_boattype = _objectList select _type;

_boat = createVehicle [_boattype, [0,0,0], [], 40, "None"];	//Original spawn was pos. at Pythos. [7094,5961,0]
_boat setVariable ["newVehicle",vChecksum,true];
_boat setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_boat setVariable ["last_timeout", time, true];
_boat setVariable ["status", "alive", true];
_boat setVariable ["respawn", _respawn, true];
_boat setDir (random 360);

_position = [_position, 1, _coverArea, 1, 2, 0, 1] call BIS_fnc_findSafePos;	
_boat setPos _position;

//_boat allowDamage false;
//_boat enableSimulation false;

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _boat;
	clearWeaponCargoGlobal _boat;

	//Set Boat Attributes
	// set status of vehicle
	_boat setFuel (0.20 + (random 0.05));
	//_boat setDamage (0.0 + (random 0.25)); // (0 - 1) = 0.5 -> 0.75

	if (count(configFile >> "CfgVehicles" >> (typeOf _boat) >> "Turrets") > 0) then
	{
		_boat setVehicleAmmo (0.25 + (random 0.75));
	};

	//_boat disableTIEquipment true;		// Disabling this allows for Thermal Imagaging Equipment in Boats.
	//[_boat] call randomWeapons;			// Disabling this disallows for weapons to spawn in Boats (Believe Boats do not have inventory so guess this need to be disabled).
};

_boat
//diag_log format["*** boatCreation Finished ***"];
