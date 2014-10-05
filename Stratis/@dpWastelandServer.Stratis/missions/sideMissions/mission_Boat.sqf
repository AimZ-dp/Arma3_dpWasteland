//	@file Version: 1.0
//	@file Name: mission_Boat.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [CAD] Krycek
//	@file Created: 08/12/2012 15:19

if(!isServer) exitwith {};

//diag_log format["****** mission_Boat Started ******"];

#include "sideMissionDefines.sqf";

private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_missionEnd"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "Boat_Marker";
_missionType = "Abandoned Armed Boat";
_startTime = floor(time);

//Get Mission Location
_returnData = call createSeaMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

[sideMissionDelayTime] call createWaitCondition;

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

_type = floor (random 2);
switch (_type) do 
{
	case 0: {_vehicle = [_randomPos, Boat_Armed_01_base_F, true, 10, false] call boatCreation;};
	case 1: {_vehicle = [_randomPos, Boat_Armed_01_minigun_base_F, true, 10, false] call boatCreation;};
};
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been spotted at the marker go get it for your team.</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
messageSystem = _hint;
publicVariable "messageSystem";

_startTime = floor(time);

_missionEnd = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= sideMissionTimeout || (damage _vehicle >= 0.99)) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
    if ((_result == 1) OR (_playerPresent) OR ((damage _vehicle) == 1)) then
	{
		_missionEnd = true;
	};
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
} else {
	//Mission Complete.
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The vehicle has been captured, should help the team</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
};

//Reset Mission Spot.
SeaMissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;

//diag_log format["****** mission_Boat Finished ******"];
