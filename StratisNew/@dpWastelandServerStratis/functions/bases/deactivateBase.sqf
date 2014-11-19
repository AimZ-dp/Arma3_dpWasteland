// Name:			deactivateBase.sqf
// Author:			AimZ =(dp)=
// Date:			23th October 2014
// Description:  	change ownership of the base. 
//
// params:
// 					[<target>, <caller>, <ID>, <arguments>]

"*** deactivateBase Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run deactivateBase.sqf on client!"] call BIS_fnc_error; false};

private ["_target", "_caller", "_ID", "_arguments"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// update its variables
_baseSide = _target getVariable ["BASE_SIDE", "NONE"];	
_baseOwner = _target getVariable ["BASE_OWNER", -1];	
_baseUsers = _target getVariable ["BASE_USERS", []];	
_playerID = getPlayerUID _caller;

_baseUsers = _baseUsers - [_playerID];
_target setVariable ["BASE_USERS", _baseUsers, true];	

"*** deactivateBase Finished ***" call BIS_fnc_log;

true