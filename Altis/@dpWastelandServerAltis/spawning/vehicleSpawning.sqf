//	@file Version: 1.0
//	@file Name: vehicleSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** vehicleSpawning Started ******"];

private ["_counter","_position","_type","_radius"];

_counter = 0;

for "_i" from 1 to maxVehicles step 1 do
{
	private ["_areaArray","_areaName","_townPos","_townNumber","_ZoneRestricted","_attempts"];
	
	_areaArray = cityArray;
	if (random 10 > 8) then {
		_areaArray = marineArray;	
	};
	
	_area = _areaArray select (floor (random (count _areaArray)));
	_position = _area select 2;
	_radius = _area select 3;
	
	_type = floor (random 4);
	switch (_type) do 
	{ 
	  case 0: {[_position, Quadbikes, true, _radius, true, true] call vehicleCreation;}; 
	  case 1: {[_position, Cars, true, _radius, true, true] call vehicleCreation;}; 
	  case 2: {[_position, Trucks, true, _radius, true, true] call vehicleCreation;}; 
	  case 3: {[_position, UnarmedMRAPVehicles, true, _radius, true, true] call vehicleCreation;}; 
	};
		
	_counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_counter];
diag_log format["****** vehicleSpawning Finished ******"];
