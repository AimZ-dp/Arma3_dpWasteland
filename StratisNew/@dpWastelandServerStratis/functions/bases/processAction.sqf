// Name:			processAction.sqf
// Author:			AimZ =(dp)=
// Date:			23th October 2014
// Description:  	Sets the owner of the base to the player side. 
//
// params:
// 					[<target>, <caller>, <ID>, <arguments>]

"*** processAction Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run processAction.sqf on client!"] call BIS_fnc_error; false};

private ["_target", "_caller", "_arguments"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_arguments = [_this, 2, []] call BIS_fnc_param;

["_target: %1, %2", typeof _target] call BIS_fnc_logFormat;
["_caller: %1, %2", name _caller, typeof _caller] call BIS_fnc_logFormat;
["_arguments: %1, %2", _arguments select 0] call BIS_fnc_logFormat;

switch (_arguments select 0) do 
{
	case "ABANDON": {[_target,_caller] call dp_fnc_abandonBase};
	case "CAPTURE": {[_target,_caller] call dp_fnc_captureBase};
	case "ACTIVATE": {[_target,_caller] call dp_fnc_activateBase};
	case "DEACTIVATE": {[_target,_caller] call dp_fnc_deactivateBase};
	default {};
};


"*** processAction Finished ***" call BIS_fnc_log;

true