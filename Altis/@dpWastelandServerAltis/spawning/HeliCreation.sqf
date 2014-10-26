//	Name: HeliCreation.sqf
//	Author: AimZ =(dp)=, [CAD] Krycek

if(!isDedicated) exitWith {};

//diag_log format["*** heliCreation Started ***"];

private ["_position","_objectList","_restrictContent","_coverArea","_respawn","_wreck","_inSea","_flying"];

_position = _this select 0;			// Position of rough location
_objectList = _this select 1;		// Object List to choose from
_restrictContent = _this select 2;	// Empty inventory or not
_coverArea = _this select 3;		// Radius for random placement
_respawn = _this select 4;			// Respawn after destroyed or not
_wreck = false;						
if (count _this > 5) then 
{
	_wreck = _this select 5;		// Spawn in full destroyed
};
_inSea = 0;
if (count _this > 6) then 
{
	_inSea = _this select 6; 		// Should the position be in the sea 0=Land,1=Either,2=Water
};
_flying = "NONE";
if (count _this > 7) then 
{
	_flying = _this select 7;		// Flying or on the ground
};

private ["_newPos", "_heliType","_heli","_type","_altitude"];

// Get the random position, depending on _inSea and _CoverArea
_newPos = [_position,1,_coverArea,5,_inSea,0.5,0] call BIS_fnc_findSafePos;
if (_flying == "FLY") then {_newPos set [2, _position select 2];};

// Get the random vehicle type to spawn
_type = floor (random (count _objectList));
_helitype = _objectList select _type;

// Create the object at the found new position
_heli = createVehicle [_helitype,_newPos,[],0,_flying];
_heli setDir (random 360);

// Add variables to allow the server to control the respawn, burning times and remove hacked vehicles
_heli setVariable["newVehicle",vChecksum,true];
_heli setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_heli setVariable ["last_timeout", time, true];
_heli setVariable ["status", "alive", true];
_heli setVariable ["respawn", _respawn, true];

// Open the doors
_heli animateDoor ['door_R', 1]; 
_heli animateDoor ['door_L', 1];
_heli animateDoor ['door_back_R', 1];
_heli animateDoor ['door_back_L', 1];

if (_restrictContent) then
{
	//Clear Inventory
	clearMagazineCargoGlobal _heli;
	clearWeaponCargoGlobal _heli;

	//Set Attributes
	// set status of vehicle
	if (_flying != "FLY") then 
	{
		_heli setFuel (random 0.50) + 0.10;
		_heli setDamage (random 0.25) + 0.50;
	}
	else
	{
		_heli setFuel 1;
		_heli setDamage 0;	
	};

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
