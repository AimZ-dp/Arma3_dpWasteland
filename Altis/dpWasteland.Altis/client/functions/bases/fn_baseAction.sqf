// Name:			baseAction.sqf
// Author:			AimZ =(dp)=
// Date:			24th October 2014
// Description:  	Process the action menu for all base actions. 
//
// params:
// 					[<target>, <caller>, <ID>, <arguments>]

"*** baseAction Started ***" call BIS_fnc_log;
		
private ["_target", "_caller", "_ID", "_arguments"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_ID = [_this, 2, 0] call BIS_fnc_param;
_arguments = [_this, 3, []] call BIS_fnc_param;		

// send message to the server
_nearestFlag = nearestObject [player, 'FlagPole_F']; 
[[_nearestFlag,player,_arguments],"dp_fnc_processAction",false,false] call BIS_fnc_MP;

"*** baseAction Finished ***" call BIS_fnc_log;

true