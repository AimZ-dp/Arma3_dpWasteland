//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** baseObjectSpawning Started ******"];

private ["_counter","_pos","_type","_start","_step","_end"];

_counter = 0;
_step = 1;
_start = floor (random _step) + 1;
_end = 24;

for "_i" from _start to _end step _step do
{
    _pos = getMarkerPos format ["Town_%1", _i];
	//_type = floor (random (count baseObjectList));
	//[_pos, _type] call baseObjectCreation;	
	[_position, survivalObjectList, true, 50, true] call baseObjectCreation;	
	
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Base Objects Spawned",_counter];
diag_log format["****** baseObjectSpawning Finished ******"];