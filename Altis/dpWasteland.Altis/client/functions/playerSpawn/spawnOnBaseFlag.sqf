//	@file Version: 1.0
//	@file Name: spawnOnBaseFlag.sqf
//	@file Author: AimZ =(dp)=
//	@file Created: 1/11/2014
//	@file Args:


waituntil {!isnil "bis_fnc_init"};

private ["_townName","_objPos","_mins","_para"];

_baseFlag = objNull;
{
	_baseUsers = _x getVariable ["BASE_USERS",[]];
	if (getPlayerUID player in _baseUsers) then
	{
		_baseFlag = _x;
	};
} forEach pvar_baseFlags;

if !(isNull _baseFlag) then
{
	player setPos (position _baseFlag);
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

