//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** survivalObjectSpawning Started ******"];

private ["_counter","_position","_type","_radius"];

_counter = 0;

for "_i" from 1 to maxSurvivalObjects step 1 do
{
	private ["_areaArray","_areaName","_townPos","_townNumber","_ZoneRestricted","_attempts"];

	_areaArray = cityArray;
	_area = _areaArray select (floor (random (count _areaArray)));
	_position = _area select 2;
	_radius = _area select 3;	
	
	[_position, survivalObjectList, true, _radius, true] call survivalObjectCreation;	

    _counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Objects Spawned",_counter];
diag_log format["****** survivalObjectSpawning Finished ******"];
