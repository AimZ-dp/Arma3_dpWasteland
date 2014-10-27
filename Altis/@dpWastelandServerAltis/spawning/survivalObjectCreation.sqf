//	Name: survivalObjectCreation.sqf
//	Author: AimZ =(dp)=

if(!isDedicated) exitWith {};

//diag_log format["*** survivalObjectCreation Started ***"];

private ["_position","_objectList","_restrictContent","_coverArea","_respawn"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

private ["_newPos", "_objtype","_obj","_type"];
// Get the random position
_newPos = [_position,1,_coverArea,5,0,1,0] call BIS_fnc_findSafePos;

// Get the random vehicle type to spawn
_type = floor (random (count _objectList));
_objtype = _objectList select _type;

// Create the object at the found new position
_obj = createVehicle [_objtype,_newPos,[],0,"NONE"];
_obj setDir (random 360);

// Add variables to allow the server to control the respawn, burning times and remove hacked vehicles
_obj setVariable["newVehicle",vChecksum,true];
_obj setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_obj setVariable ["last_timeout", time, true];
_obj setVariable ["status", "alive", true];
_obj setVariable ["respawn", _respawn, true];


// Set Attributes
if(_objtype == "Land_CanisterPlastic_F") then 
{
    _obj setVariable["water",20,true];
};
if(_objtype == "Land_Sacks_goods_F") then 
{
    _obj setVariable["food",20,true];
};

_obj setVariable["R3F_LOG_disabled",false];

/*
	_markerName = format["survival_marker_%1",_newPos];
	_marker = createMarker [_markerName, _newPos];
	_marker setMarkerShape "ICON";
	_marker setMarkerType  "mil_dot";
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerAlpha 0.5; 
*/

//diag_log format["*** survivalObjectCreation Finished ***"];