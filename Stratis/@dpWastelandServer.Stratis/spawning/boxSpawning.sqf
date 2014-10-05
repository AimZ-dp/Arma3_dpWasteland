//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** boxSpawning Started ******"];

private ["_counter","_position","_type","_start","_step","_end"];

_counter = 0;
_step = 4;
_start = floor (random _step) + 1;
_end = 24;

for "_i" from _start to _end step _step do
{
	_position = getMarkerPos format ["Town_%1", _i];
	[_position, ammoBoxes, true, 30, true] call boxCreation;	

    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];
diag_log format["****** boxSpawning Finished ******"];