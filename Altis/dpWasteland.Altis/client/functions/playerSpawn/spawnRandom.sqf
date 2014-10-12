//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

diag_log format["*** spawnRandom Started ***"];

waituntil {!isnil "bis_fnc_init"};

private ["_areaArray","_areaName","_townName","_randomLoc","_pos","_townPos","_townNumber","_ZoneRestricted","_mins","_attempts"];

// MAKE THIS A FUNCTION - PASS IN AN ARRAY OF LOCATION ARRAYS, THEN PICK RANDOM LIST
_areaArray = pvar_cityList;
_areaName = "Town";
if (random 10 > 5) then {
	_areaArray = pvar_bayList;	
	_areaName = "Bay";
};
_townNumber = 0;
_ZoneRestricted = true;
_attempts = 0;
while {(_ZoneRestricted && _attempts < 1000)} do
{
	_townNumber = floor (random (count _areaArray));
	_townPos = getMarkerPos format ["%1_%2",_areaName, _townNumber+1];
	_ZoneRestricted = [_townPos] call isPosRestricted;
	_attempts = _attempts + 1;
};
_randomLoc = _areaArray select _townNumber;

// RANDOM POSITION IN SELECTED TOWN
_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,10,_randomLoc select 1,1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
player setPos _pos;

// CLOSE THE RESPAWN DIALOG
respawnDialogActive = false;
closeDialog 0;

// DISPLAY TOWN NAME 
_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
["dp Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

diag_log format["*** spawnRandom Finished ***"];