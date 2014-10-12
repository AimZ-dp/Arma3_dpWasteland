//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** survivalObjectSpawning Started ******"];

private ["_counter","_position","_type","_radius"];

_counter = 0;

for "_i" from 1 to 20 step 1 do
{
	private ["_areaArray","_areaName","_townPos","_townNumber","_ZoneRestricted","_attempts"];
	
	// MAKE THIS A FUNCTION - PASS IN AN ARRAY OF LOCATION ARRAYS, THEN PICK RANDOM LIST
	_areaArray = pvar_cityList;
	_areaName = "Town";
	if (random 10 > 8) then {
		_areaArray = pvar_bayList;	
		_areaName = "Bay";
	};
	_townNumber = 0;
	_ZoneRestricted = true;
	_attempts = 0;
	while {(_ZoneRestricted && _attempts < 1000)} do
	{
		_townNumber = floor (random (count _areaArray));
		_townPos = getMarkerPos format ["%1_%2", _areaName, _townNumber+1];
		_ZoneRestricted = [_townPos] call isPosRestricted;
		_attempts = _attempts + 1;
	};
	_position = _townPos;
	_radius = (_areaArray select _townNumber) select 1;
	
	[_position, survivalObjectList, true, _radius, true] call survivalObjectCreation;	

    _counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Objects Spawned",_counter];
diag_log format["****** survivalObjectSpawning Finished ******"];
