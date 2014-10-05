//	@file Version: 1.1
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** boxSpawning Started ******"];

private ["_counter","_position","_type"];

_counter = 0;

for "_i" from 1 to 20 step 1 do
{
	private ["_townPos","_townNumber","_ZoneRestricted","_attempts","_radius"];

	// pick a spawn town within a valid zone
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
	_position = getMarkerPos format ["Town_%1", _townNumber+1];
	_radius = (cityList select _townNumber) select 1;

	[_position, ammoBoxes, true, _radius, true] call boxCreation;	

    _counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_counter];
diag_log format["****** boxSpawning Finished ******"];