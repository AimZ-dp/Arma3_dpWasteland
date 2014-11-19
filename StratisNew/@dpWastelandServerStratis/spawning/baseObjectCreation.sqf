
if(!isDedicated) exitWith {};

//diag_log format["*** baseObjectCreation Started ***"];

private ["_position","_objectList","_restrictContent","_coverArea","_respawn","_type","_objtype","_obj"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _objectList));
_objtype = _objectList select _type;

_position = [_position,1,_coverArea,1,0,1,0] call BIS_fnc_findSafePos;
_obj = createVehicle [_objtype,_position,[],0,"NONE"]; 
_obj setVariable["newVehicle",vChecksum,true];
_obj setVariable ["timeout", time + baseObjectTimeOut, true];
_obj setVariable ["last_timeout", time, true];
_obj setDir (random 360);

_obj setVariable["R3F_LOG_disabled", false, true];

_obj

//diag_log format["*** baseObjectCreation Finished ***"];
