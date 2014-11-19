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


_nearestFlag = nearestObject [player, 'FlagPole_F']; 

// Start the animation and wait
_timeDelay = 0;
_timeDelayMessage = "";
switch (_arguments select 0) do 
{
	case "ABANDON": {_timeDelay = 15;
						_timeDelayMessage = "Abandon base flag... %1%2";};
	case "CAPTURE": {_timeDelay = 30;
						_timeDelayMessage = "Capture base flag... %1%2";};
	case "ACTIVATE": {_timeDelay = 5;
						_timeDelayMessage = "Activating spawn on base flag... %1%2";};
	case "DEACTIVATE": {_timeDelay = 5;
						_timeDelayMessage = "Deactivating spawn on base flag... %1%2";};
	default {};
};

_delay = _timeDelay / 100;
_interrupted = false;

player playAction "Crouch";
_i = 0;
while {_i <= 100 && !_interrupted} do
{
	1 cutText [format[_timeDelayMessage,_i,"%"], "PLAIN DOWN", 0];
	sleep _delay;
	
	if (player distance _nearestFlag > 5) then
	{
		player playAction "gestureHi";
		_interrupted = true;
	};
	_i = _i + 1;
};
	
if (!_interrupted) then
{
	1 cutText [format[_timeDelayMessage,100,"%"], "PLAIN DOWN", 0.1];
	player playAction "Salute";
	
	// send message to the server if there were no interruptions
	[[_nearestFlag,player,_arguments],"dp_fnc_processAction",false,false] call BIS_fnc_MP;
};

"*** baseAction Finished ***" call BIS_fnc_log;

true