//	@file Version: 1.0
//	@file Name:boatSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** boatSpawning Started ******"];

private ["_counter","_position","_type","_num","_start","_step","_end"];

_counter= 0;
_step = 2;	// Remember to set this to 2 for instance, so not all 10 spawn locations will be filled.
_start = floor (random _step) + 1;
_end = 10;

for "_i" from _start to _end step _step do
{
	_position = getMarkerPos format ["boatSpawn_%1", _i];
	_type = floor (random 3);
	switch (_type) do
	{ 
	  case 0: {[_position, Rubber_duck_base_F, true, 40, true] call boatCreation;};
	  case 1: {[_position, Boat_Civil_01_base_F, true, 40, true] call boatCreation;};
	  case 2: {[_position, SDV_01_base_F, true, 40, true] call boatCreation;};
	};
	_counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Boats Spawned",_counter];
diag_log format["****** boatSpawning Finished ******"];
