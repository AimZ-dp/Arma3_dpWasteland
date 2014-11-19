// Name:			abandonBase.sqf
// Author:			AimZ =(dp)=
// Date:			23th October 2014
// Description:  	abandon base by setting to no owner and removing all base objects. 
//
// params:
// 					[<target>, <caller>, <ID>, <arguments>]

"*** abandonBase Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run abandonBase.sqf on client!"] call BIS_fnc_error; false};

private ["_target", "_caller", "_ID", "_arguments"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// create the new flag colour
_flagType = "\A3\Data_F\Flags\Flag_white_CO.paa";
_target setFlagTexture _flagType;

// update its variables
_target setVariable ["BASE_SIDE", civilian, true];	
_target setVariable ["BASE_OWNER", -1, true];	
_target setVariable ["BASE_USERS", [], true];	

// remove any left over markers
_arrows = nearestObjects [_target, ["Sign_Arrow_F"], baseRadius + 2];
{
	deleteVehicle _x;
} forEach _arrows;

"*** abandonBase Finished ***" call BIS_fnc_log;

true