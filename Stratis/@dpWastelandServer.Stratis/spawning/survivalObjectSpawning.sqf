//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** survivalObjectSpawning Started ******"];

private ["_counter","_position","_type","_start","_step","_end"];

_counter = 0;
_step = 1;//2;
_start = floor (random _step) + 1;
_end = 5;//24;

for "_i" from _start to _end step _step do
{
    _position = getMarkerPos format ["Town_%1", _i];
	[_position, survivalObjectList, true, 50, true] call survivalObjectCreation;	

    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Objects Spawned",_counter];
diag_log format["****** survivalObjectSpawning Finished ******"];
