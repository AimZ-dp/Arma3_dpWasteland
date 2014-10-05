//	Name: survivalObjectCreation.sqf
//	Author: AimZ =(dp)=

if(!isDedicated) exitWith {};

//diag_log format["*** survivalObjectCreation Started ***"];

private ["_objtype","_obj","_type","_position","_objectList"];
_position = _this select 0;
_objectList = _this select 1;
_restrictContent = _this select 2;
_coverArea = _this select 3;
_respawn = _this select 4;

_type = floor (random (count _objectList));
_objtype = _objectList select _type;

_obj = createVehicle [_objtype,[7094,5961,0],[],40,"NONE"]; 
_obj setVariable["newVehicle",vChecksum,true];
_obj setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_obj setVariable ["last_timeout", time, true];
_obj setVariable ["status", "alive", true];
_obj setVariable ["respawn", _respawn, true];
_obj setDir (random 360);
_position = [_position,1,_coverArea,1,0,1,0] call BIS_fnc_findSafePos;
_obj setPos _position;
	
//_obj allowDamage false;
//_obj enableSimulation false;

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

//diag_log format["*** survivalObjectCreation Finished ***"];