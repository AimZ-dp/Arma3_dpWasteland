//	@file Version: 1.0
//	@file Name:boatSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** boatSpawning Started ******"];

private ["_counter","_position","_type","_num","_radius"];

_counter= 0;

for "_i" from 1 to maxBoats step 1 do
{
	private ["_areaArray","_areaName","_townPos","_townNumber","_ZoneRestricted","_attempts"];

	_areaArray = marineArray;	
	_area = _areaArray select (floor (random (count _areaArray)));
	_position = _area select 2;
	_radius = _area select 3;
	
	_type = floor (random 3);
	switch (_type) do
	{ 
	  case 0: {[_position, Rubber_duck_base_F, true, _radius, true] call boatCreation;};
	  case 1: {[_position, Boat_Civil_01_base_F, true, _radius, true] call boatCreation;};
	  case 2: {[_position, SDV_01_base_F, true, _radius, true] call boatCreation;};
	};
	_counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Boats Spawned",_counter];
diag_log format["****** boatSpawning Finished ******"];
