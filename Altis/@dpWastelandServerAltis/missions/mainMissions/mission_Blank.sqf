//	@file Version: 1.0
//	@file Name: mission_Blank.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:
if(!isServer) exitwith {};

diag_log format["****** mission_Blank Started ******"];

#include "mainMissionDefines.sqf";

private ["_CivGrpM","_missionMarkerName","_missionType","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_unitsAlive"];

//Mission Initialization.
_missionMarkerName = format ["%1_Blank", _this select 0];
_missionType = "Blank";


//Get Mission Location
_randomPos = [false] call createMissionLocation;
[mainMissionDelayTime] call createWaitCondition;
[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

// Create a Vehicle
//_vehicle = [_randomPos, ArmedMRAPVehicles, true, 10, false] call vehicleCreation;
//_vehicle setVehicleLock "LOCKED";
//_vehicle setVariable ["R3F_LOG_disabled", true, true];
// Create some units
//_CivGrpM = createGroup civilian;
//[_CivGrpM,_randomPos] spawn createMidGroup;

// Format the hint and send to all clients
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
// 			"Main Objective", 
//	"------------------------------",
//			_missionType,
//			_picture,
//	"A",_vehicleName,", has been spoted in the area marked"
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been spoted in the area marked</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// ---- MAIN PROCESS ----
private ["_startTime","_missionEnd","_playerPresent","_currTime","_result"];
_startTime = floor(time);
_missionEnd = false;
_result = 0;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
	 _currTime = floor(time);
   
    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
    _unitsAlive = ({alive _x} count units _CivGrpM);
    if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _vehicle) == 1)) then
	{
		_missionEnd = true;
	};
	
	//_vehicle setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
	//_vehicle setVariable ["last_timeout", time, true];
};

// 
if(_result == 1) then
{
	//Mission Failed.
	
	// Remove the vehicle to stop players using it, blow it up instead of vanish
    //_vehicle setDamage 1;

    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
} 
else 
{
	//Mission Complete.

	// Allow the players to use the vehicle
	//_vehicle setVehicleLock "UNLOCKED";
	//_vehicle setVariable ["R3F_LOG_disabled", false, true];

    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The light armored vehicle has been captured</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
};

// Make sure all enemy and group is deleted
{
	_x removeAllEventHandlers "killed";
	deleteVehicle _x;
} forEach units _CivGrpM;
deleteGroup _CivGrpM;

// Send the message to the clients
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// Delete Mission Marker
[_missionMarkerName] call deleteClientMarker;

diag_log format["****** mission_Blank Finished ******"];
