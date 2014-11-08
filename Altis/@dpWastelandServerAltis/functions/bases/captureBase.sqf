// Name:			captureBase.sqf
// Author:			AimZ =(dp)=
// Date:			23th October 2014
// Description:  	change ownership of the base. 
//
// params:
// 					[<target>, <caller>, <ID>, <arguments>]

"*** captureBase Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run captureBase.sqf on client!"] call BIS_fnc_error; false};

private ["_target", "_caller", "_ID", "_arguments"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// create the new flag colour
_flagType = "\A3\Data_F\Flags\Flag_white_CO.paa";
if (side _caller == west) then
{
	_flagType = "\A3\Data_F\Flags\Flag_blue_CO.paa";
};
if (side _caller == east) then
{
	_flagType = "\A3\Data_F\Flags\Flag_red_CO.paa";
};
if (side _caller == resistance) then
{
	_flagType = "\A3\Data_F\Flags\Flag_green_CO.paa";
};
_target setFlagTexture _flagType;

// create new spawn position
_spawnSide = side _caller;
_target setVariable ["BASE_SIDE", _spawnSide, true];	
_target setVariable ["BASE_OWNER", getPlayerUID _caller, true];	
_target setVariable ["BASE_USERS", [getPlayerUID _caller], true];	

"*** captureBase Finished ***" call BIS_fnc_log;

true