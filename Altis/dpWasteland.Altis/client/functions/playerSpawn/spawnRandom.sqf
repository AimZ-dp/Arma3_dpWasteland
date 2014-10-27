//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

diag_log format["*** spawnRandom Started ***"];

waituntil {!isnil "bis_fnc_init"};

private ["_areaArray","_areaName","_townName","_randomLoc","_pos","_townPos","_townNumber","_ZoneRestricted","_mins","_attempts"];

_areaArray = cityArray;
if (random 10 > 8) then {
	_areaArray = marineArray;	
};
_city = _areaArray select (floor (random (count _areaArray)));
_pos = [_city select 2,10,_city select 3,1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
player setPos _pos;

// CLOSE THE RESPAWN DIALOG
respawnDialogActive = false;
closeDialog 0;

// DISPLAY TOWN NAME 
_mins = floor(60 * (daytime - floor(daytime)));
_townName = _city select 0;
["dp Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

diag_log format["*** spawnRandom Finished ***"];