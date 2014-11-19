//	@file Version: 1.0
//	@file Name: spawnOnBaseFlag.sqf
//	@file Author: AimZ =(dp)=
//	@file Created: 1/11/2014
//	@file Args:


waituntil {!isnil "bis_fnc_init"};

private ["_townName","_objPos","_mins","_para","_randomPos"];

_baseFlags = [];
{
	_baseUsers = _x getVariable ["BASE_USERS",[]];
	if (getPlayerUID player in _baseUsers) then
	{
		_baseFlags set [count _baseFlags, _x];
	};
} forEach pvar_baseFlags;

if (count _baseFlags > 0) then
{
	_baseFlag = _baseFlags select (floor (random (count _baseFlags)));
	_baseFlagPos = position _baseFlag;
	
	// if inside building spawn in building safe pos
	/*
	_nBuilding = nearestBuilding _baseFlagPos;
    _bbr = boundingBoxReal vehicle player; 
	_p1 = _bbr select 0; 
	_p2 = _bbr select 1; 
	_maxWidth = abs ((_p2 select 0) - (_p1 select 0)); 
	_maxLength = abs ((_p2 select 1) - (_p1 select 1)); 
	_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
	BIS_fnc_buildingPositions - Get all available positions within a building or structu
	*/
	// otherwise SafePos
	_randomPos = [_baseFlagPos,1,20,1,0,10,0] call BIS_fnc_findSafePos;
	
	player setPos (_randomPos);
}
else
{
	[] spawn spawnRandom;
};

// CLOSE THE RESPAWN DIALOG
respawnDialogActive = false;
closeDialog 0;

// DISPLAY TOWN NAME 
_mins = floor(60 * (daytime - floor(daytime)));
_townName = "Base Flag";
["dp Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

