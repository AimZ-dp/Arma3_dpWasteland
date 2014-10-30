//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

diag_log format["*** spawnRandom Started ***"];

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_objPos","_mins","_para"];

if !(isNull respawnHelicopter) then
{
	_objPos = position respawnHelicopter;
	if (respawnHelicopter emptypositions "cargo" > 0) then 
	{
		player setPos _objPos;
		player setdir direction respawnHelicopter;
		player moveincargo respawnHelicopter;
	} 
	else 
	{
		_para = createvehicle ["Steerable_Parachute_F",_objPos,[],0,"none"];
		_para setpos _objPos;
		_para setdir direction respawnHelicopter;
		player moveindriver _para;
	};
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
_townName = "Para Drop";
["dp Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]] spawn BIS_fnc_infoText;

diag_log format["*** spawnRandom Finished ***"];