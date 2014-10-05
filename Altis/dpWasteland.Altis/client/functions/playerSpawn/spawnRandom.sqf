//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

diag_log format["*** spawnRandom Started ***"];

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos","_townPos","_townNumber","_ZoneRestricted","_mins","_attempts"];

// pick a spawn town within a valid zone
_townNumber = 0;
_ZoneRestricted = true;
_attempts = 0;

while {(_ZoneRestricted && _attempts < 1000)} do
{
	// GET A RANDOM TOWN POSITION
	_townNumber = floor (random (count cityList));
	_townPos = getMarkerPos format ["Town_%1", _townNumber+1];

	_ZoneRestricted = [_townPos] call isPosRestricted;
	
	_attempts = _attempts + 1;
};

_randomLoc = cityList select _townNumber;

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