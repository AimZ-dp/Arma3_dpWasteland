//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** boxSpawning Started ******"];

private ["_counter","_position","_type"];

_counter = 0;

for "_i" from 1 to maxAmmoBoxes step 1 do
{
	private ["_areaArray","_areaName","_townPos","_townNumber","_ZoneRestricted","_attempts","_radius"];

	_areaArray = militaryArray;
	_area = _areaArray select (floor (random (count _areaArray)));
	_position = _area select 2;
	_radius = _area select 3;
	
	[_position, ammoBoxes, true, _radius, true] call boxCreation;	

    _counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];
diag_log format["****** boxSpawning Finished ******"];