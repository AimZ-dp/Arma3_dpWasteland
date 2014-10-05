//	@file Version: 1.0
//	@file Name: vehicleSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** vehicleSpawning Started ******"];

private ["_counter","_position","_type","_radius"];

_counter = 0;

for "_i" from 1 to 60 step 1 do
{
	// TODO: MAKE THIS A FUNCTION - PASS IN AN ARRAY OF MARKER ARRAYS (CITY & BAY), RANDOM WHERE
	private ["_townPos","_townNumber","_ZoneRestricted","_attempts"];
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
	// ----------------------------------------------------------
	
	_position = getMarkerPos format ["Town_%1", _townNumber+1];
	_radius = (cityList select _townNumber) select 1;
	
	_type = floor (random 4);
	switch (_type) do 
	{ 
	  case 0: {[_position, Quadbikes, true, _radius, true] call vehicleCreation;}; 
	  case 1: {[_position, Cars, true, _radius, true] call vehicleCreation;}; 
	  case 2: {[_position, Trucks, true, _radius, true] call vehicleCreation;}; 
	  case 3: {[_position, UnarmedMRAPVehicles, true, _radius, true] call vehicleCreation;}; 
	};
		
	_counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_counter];
diag_log format["****** vehicleSpawning Finished ******"];
