//	@file Version: 1.0
//	@file Name: mission_CivHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};

diag_log format["****** mission_CivHeli Started ******"];

#include "sideMissionDefines.sqf";

[sideMissionDelayTime] call createWaitCondition;

//Mission Initialization.
private ["_missionMarkerName","_missionType"];
_missionMarkerName = format["%1_CivHeli_Marker", _this select 0];
_missionType = "Immobile Civilian Helicopter";

//Get Mission Location
private ["_zoneData","_zonePos","_zoneWidth","_zoneHeight","_randomEndPos","_randomStartPos"];
_zoneData = [true] call createMissionLocation;
_zonePos = _zoneData select 0;
_zoneWidth = _zoneData select 1;
_zoneHeight = _zoneData select 2;
_randomEndPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
_randomEndPos set [2, 500];

// ---- CREATE VEHICLE AND UNITS, SEND TO WAYPOINT ----

private ["_vehicle","_CivGrpM","_pilot","_soldier","_waypoint"];
// Create the vehicle FLYING
_vehicle = [_randomEndPos, LightHelicopters, true, 3000, false, false, 2, "FLY"] call HeliCreation;	
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];

// Create the group and place in heli
_CivGrpM = createGroup civilian;
_CivGrpM addVehicle _vehicle;
_pilot = [_CivGrpM, _randomEndPos] call createRandomSoldier; 
_CivGrpM selectLeader _pilot;
_pilot moveInDriver _vehicle;

_randomEndPos set [2, 0];
_soldier = [_CivGrpM, _randomEndPos] call createRandomSoldier; 
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _randomEndPos] call createRandomSoldier; 
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _randomEndPos] call createRandomSoldier; 
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpM, _randomEndPos] call createRandomSoldier; 
_soldier moveInCargo _vehicle;

sleep 2;

//_waypoint = _CivGrpM addWaypoint [_randomEndPos, 0];
//_waypoint setWaypointType "MOVE";
//_waypoint setWaypointCompletionRadius 100;
//_waypoint setWaypointCombatMode "GREEN"; 
//_waypoint setWaypointBehaviour "SAFE"; 
//_waypoint setWaypointFormation "NO CHANGE";
//_waypoint setWaypointSpeed "FULL";
_waypoint = _CivGrpM addWaypoint [_randomEndPos, 0];
_waypoint setWaypointType "GETOUT";
_waypoint setWaypointCompletionRadius 10;
_waypoint setWaypointCombatMode "GREEN"; 
_waypoint setWaypointBehaviour "SAFE"; 
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "FULL";

[_vehicle, _CivGrpM, _pilot] spawn {
	private ["_vehicle", "_group", "_pilot"];
	_vehicle = _this select 0;
	_group = _this select 1;
	_pilot = _this select 2;

	// wait until vehicle is close to end position and cause damage...	
	waituntil {currentWaypoint _group > 1};
	_vehicle setDamage 0.35;
};

// ---- MARKERS ----

private ["_marker","_marker2"];
_marker = createMarker [format["%1_current", _missionMarkerName], position _vehicle];
_marker setMarkerType "n_air";
_marker setMarkerColor "ColorBlack";

_marker2 = createMarker [format["%1_watpoint", _missionMarkerName], _randomEndPos];
_marker2 setMarkerType "waypoint";
_marker2 setMarkerColor "ColorBlack";
_marker2 setMarkerText "Civ Heli LZ";

// ---- HINT TO CLIENTS ----

private ["_picture","_vehicleName","_hint"];
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been immobilized go get it for your team.</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
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

    if(_currTime - _startTime >= sideMissionTimeout || (damage _vehicle) == 1) then {_result = 1;};
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

diag_log format["****** mission_CivHeli Finished ******"];
