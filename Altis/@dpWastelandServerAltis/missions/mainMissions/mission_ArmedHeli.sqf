//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};

//diag_log format["****** mission_ArmedHeli Started ******"];

#include "mainMissionDefines.sqf";

[mainMissionDelayTime] call createWaitCondition;

//Mission Initialization.
private ["_missionMarkerName","_missionType","_marker"];
_missionMarkerName = format ["%1_ArmedHeli_Vehicle", _this select 0];
_missionType = "Immobile Armed Helicopter";

//Get Mission Location
private ["_zoneData","_zonePos","_zoneWidth","_zoneHeight","_randomEndPos","_randomStartPos"];
_zoneData = [true] call createMissionLocation;
_zonePos = _zoneData select 0;
_zoneWidth = _zoneData select 1;
_zoneHeight = _zoneData select 2;
_randomEndPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
_randomEndPos set [2,  300];

// ---- CREATE VEHICLE AND UNITS, SEND TO WAYPOINT ----

private ["_vehicle","_CivGrpM","_pilot","_soldier","_waypoint"];
// Create the vehicle FLYING
_heliArray = ArmedTransportHelicopters;
if (random 10 > 5) then
{
	_heliArray = ArmedLightHelicopters;
	if (random 10 > 5) then
	{
		_heliArray = AttackHelicopters;
	};
};
_vehicle = [_randomEndPos, ArmedTransportHelicopters, true, 3000, false, false, 2, "FLY"] call HeliCreation;	
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];

// Create the group and place in heli
_CivGrpM = createGroup civilian;
_CivGrpM addVehicle _vehicle;

_heliPos = getPos _vehicle;
_pilot = [_CivGrpM, _heliPos] call createRandomSoldier; 
_pilot setPos _heliPos;
_pilot moveInDriver _vehicle;
_CivGrpM selectLeader _pilot;

_soldier = [_CivGrpM, _heliPos] call createRandomSoldier; 
_soldier setPos _heliPos;
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _heliPos] call createRandomSoldier; 
_soldier setPos _heliPos;
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _heliPos] call createRandomSoldier; 
_soldier setPos _heliPos;
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _heliPos] call createRandomSoldier; 
_soldier setPos _heliPos;
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _heliPos] call createRandomSoldier; 
_soldier setPos _heliPos;
_soldier moveInCargo _vehicle;

_waypoint = _CivGrpM addWaypoint [_randomEndPos, 0];
_waypoint setWaypointType "GETOUT";
_waypoint setWaypointCompletionRadius 10;
_waypoint setWaypointCombatMode "BLUE"; 
_waypoint setWaypointBehaviour "CARELESS"; 
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "FULL";

sleep 2;

[_vehicle, _pilot, _CivGrpM] spawn {
	private ["_vehicle", "_group", "_pilot"];
	_vehicle = _this select 0;
	_pilot = _this select 1;
	_group = _this select 2;
		
	waituntil {currentWaypoint _group > 1};
	_vehicle setDamage 0.35;
};

// ---- MARKERS ----

private ["_marker","_marker2"];
_marker = createMarker [format["%1_current", _missionMarkerName],  position _vehicle];
_marker setMarkerType "n_air";
_marker setMarkerColor "ColorBlack";

_marker2 = createMarker [format["%1_watpoint", _missionMarkerName], _randomEndPos];
_marker2 setMarkerType "waypoint";
_marker2 setMarkerColor "ColorBlack";
_marker2 setMarkerText "Armed LZ";

// ---- HINT TO CLIENTS ----

private ["_picture","_vehicleName","_hint"];
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been immobilized go get it for your team.</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// ---- MISSION LOOP,  ---- 

private ["_result","_startTime","_missionEnd","_currTime","_playerPresent","_unitsAlive","_hasLanded"];
_result = 0;
_startTime = floor(time);
_missionEnd = false;
_hasLanded = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);

    if(_currTime - _startTime >= mainMissionTimeout || (damage _vehicle) == 1) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
    _unitsAlive = ({alive _x} count units _CivGrpM);
    if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1))) then
	{
		_missionEnd = true;
	};
	
	// update the start position
	if (isEngineOn _vehicle) then 
	{
		_marker setMarkerPos (position _vehicle);
    }
	else
	{
		if (!_hasLanded) then
		{
			[_missionMarkerName,position _vehicle,_missionType] call createClientMarker;
			deleteMarker _marker;
			deleteMarker _marker2;	
			
			[_CivGrpM, position _vehicle] call defendArea;
			
			_hasLanded = true;
		};
	};
	
	_vehicle setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
	_vehicle setVariable ["last_timeout", time, true];
};

if(_result == 1) then
{
	//Mission Failed.
	
	_vehicle setDamage 1;
	
	{
		_x removeAllEventHandlers "killed";
		deleteVehicle _x;
	}forEach units _CivGrpM;
    deleteGroup _CivGrpM;
    
	_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	pvar_messageSystem = _hint;
	publicVariable "pvar_messageSystem";
} 
else 
{
	//Mission Complete.
	
	_vehicle setVehicleLock "UNLOCKED";
	_vehicle setVariable ["R3F_LOG_disabled", false, true];

    deleteGroup _CivGrpM;

    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The helicopter has been captured, now go destroy the enemy</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	pvar_messageSystem = _hint;
	publicVariable "pvar_messageSystem";
};

//Reset Mission Spot.
[_missionMarkerName] call deleteClientMarker;
deleteMarker _marker;
deleteMarker _marker2;

//diag_log format["****** mission_ArmedHeli Finished ******"];
