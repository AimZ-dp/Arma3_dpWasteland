//	@file Version: 1.0
//	@file Name: HeliSpawning.sqf
//	@file Author: [404] Costlyy, AimZ =(dp)=, [CAD] Krycek
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["****** heliSpawning Started ******"];

private ["_counter","_position","_type"];

_counter = 0;

for "_i" from 1 to 20 step 1 do
{
	_position = getMarkerPos format ["Airport_%1", floor(random (count pvar_airportList))+1];
	
	_type = floor (random 2);
	switch (_type) do 
	{ 
	  case 0: {[_position, LightHelicopters, true, 200, true] call HeliCreation;}; 
	  case 1: {[_position, TransportHelicopters, true, 200, true] call HeliCreation;}; 
	};

	_counter = _counter + 1;
	
	sleep 0.1;
};

diag_log format["WASTELAND SERVER - %1 Static helis Spawned",_counter];
diag_log format["****** heliSpawning Finished ******"];
