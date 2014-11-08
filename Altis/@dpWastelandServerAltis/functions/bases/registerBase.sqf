// Name:			registerBase.sqf
// Author:			AimZ =(dp)=
// Date:			23th October 2014
// Description:  	change ownership of the base. 
//
// params:
// 					[<target>, <caller>, <ID>, <arguments>]

"*** registerBase Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run registerBase.sqf on client!"] call BIS_fnc_error; false};

private ["_target", "_caller", "_ID", "_arguments"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// update its variables
_baseSide = _target getVariable ["BASE_SIDE", "NONE"];	
_baseOwner = _target getVariable ["BASE_OWNER", -1];	
_baseUsers = _target getVariable ["BASE_USERS", []];	
_playerID = getPlayerUID _caller;

if (_playerID in _baseUsers) then
{
	// already part of the list
} 
else 
{
	// make sure he is removed from any other base flag
	{
		_localBaseUsers = _x getVariable ["BASE_USERS", []];
		_localBaseUsers = _localBaseUsers - [_playerID];
		_x setVariable ["BASE_USERS", _localBaseUsers, true];	
	} forEach pvar_baseFlags;

	// add the player id to the base_users list
	_baseUsers set [count _baseUsers, _playerID];
};

"*** registerBase Finished ***" call BIS_fnc_log;

true