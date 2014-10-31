//	@file Version: 1.0
//	@file Name: mission_AirWreck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};

diag_log format["****** mission_AirWreck Started ******"];

#include "sideMissionDefines.sqf";

[sideMissionDelayTime] call createWaitCondition;

//Mission Initialization.
private ["_missionMarkerName","_missionType"];
_missionMarkerName = format["%1_AirWreck_Marker", _this select 0];
_missionType = "Aircraft Wreck";

//Get Mission Location
private ["_zoneData","_zonePos","_zoneWidth","_zoneHeight","_randomEndPos","_randomStartPos"];
_zoneData = [true] call createMissionLocation;
_zonePos = _zoneData select 0;
_zoneWidth = _zoneData select 1;
_zoneHeight = _zoneData select 2;
_randomEndPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
_randomEndPos set [2, 300];

// ---- CREATE VEHICLE AND UNITS, SEND TO WAYPOINT ----

private ["_vehicle","_CivGrpS","_pilot","_waypoint"];
// Create the vehicle FLYING
_vehicle = [_randomEndPos, TransportHelicopters, true, 3000, false, false, 2, "FLY"] call HeliCreation;	
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];
_vehicle setDamage 0;

// Create the group and place in heli
_CivGrpS = createGroup civilian;
_CivGrpS addVehicle _vehicle;

_heliPos = getPos _vehicle;
_pilot = [_CivGrpS, _heliPos] call createRandomSoldier; 
_pilot setPos _heliPos;
_pilot moveInDriver _vehicle;

_waypoint = _CivGrpS addWaypoint [_randomEndPos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 500;
_waypoint setWaypointCombatMode "GREEN"; // Defensive behaviour
_waypoint setWaypointBehaviour "SAFE"; // Force convoy to normally drive on the street.
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "FULL";
_waypoint = _CivGrpS addWaypoint [[0,0,250], 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 300;
_waypoint setWaypointCombatMode "GREEN"; // Defensive behaviour
_waypoint setWaypointBehaviour "SAFE"; // Force convoy to normally drive on the street.
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "NORMAL";

[_vehicle, _pilot, _CivGrpS] spawn {
	private ["_vehicle", "_group", "_pilot"];
	_vehicle = _this select 0;
	_pilot = _this select 1;
	_group = _this select 2;
	
	waituntil {currentWaypoint _group > 1};

	_pilot setDamage 1;
	_vehicle setDamage 0.75;
	_vel = velocity _vehicle;
	_vel set [2, (_vel select 2) - 10];
	_vehicle setDamage 0.75;
	_vehicle setVelocity _vel;
};

// ---- MARKERS ----

private ["_marker","_marker2"];
// Markers for start and destination
_marker = createMarker [format["%1_current", _missionMarkerName], position _vehicle];
_marker setMarkerType "n_air";
_marker setMarkerColor "ColorBlack";

_marker2 = createMarker [format["%1_watpoint", _missionMarkerName], _randomEndPos];
_marker2 setMarkerType "waypoint";
_marker2 setMarkerColor "ColorBlack";
_marker2 setMarkerText "Wreckage LZ";

// ---- HINT TO CLIENTS ----

private ["_picture","_vehicleName","_hint"];
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has come down under enemy fire!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// ---- MISSION LOOP,  ---- 

private ["_result","_startTime","_missionEnd","_currTime","_playerPresent","_unitsAlive","_hasSpawned","_box1","_box2"];
_result = 0;
_startTime = floor(time);
_missionEnd = false;
_box1 = objNull;
_box2 = objNull;
_hasSpawned = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
	
	if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
	{if((isPlayer _x) AND (_x distance _randomEndPos <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
	_unitsAlive = ({alive _x} count units _CivGrpS);
	if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1) && _hasSpawned)) then
	{
		_missionEnd = true;
	};

	// update the start position
	if (alive _vehicle) then
	{
		_marker setMarkerPos (position _vehicle);
	}
	else
	{	
		if (!_hasSpawned) then
		{
			_randomEndPos = position _vehicle;
				
			// Create these on crash!  Para them!
			_box1 = [[(_randomEndPos select 0) + 10, (_randomEndPos select 1), 0], missionAmmoBoxes, true, 10, false] call boxCreation;	
			_box2 = [[(_randomEndPos select 0) - 10, (_randomEndPos select 1), 0], missionAmmoBoxes, true, 10, false] call boxCreation;	
			[_CivGrpS,[(_randomEndPos select 0) + 10, (_randomEndPos select 1) + 10, 0]] spawn createSmallGroup;
			
			[_missionMarkerName,_randomEndPos,_missionType] call createClientMarker;
			deleteMarker _marker;
			deleteMarker _marker2;
			
			_hasSpawned = true;
		};
	};
	
	_vehicle setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
	_vehicle setVariable ["last_timeout", time, true];
	
	if (!(isNull _box1)) then
	{
		_box1 setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
		_box1 setVariable ["last_timeout", time, true];
	};
	if (!(isNull _box2)) then	
	{
		_box2 setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
		_box2 setVariable ["last_timeout", time, true];
	};
};

if(_result == 1) then
{
	//Mission Failed.

	_box1 setDamage 1;
	_box2 setDamage 1;
	deleteVehicle _vehicle;
		
	{
		_x removeAllEventHandlers "killed";
		deleteVehicle _x;
	}forEach units _CivGrpS;
    deleteGroup _CivGrpS;
	
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	pvar_messageSystem = _hint;
    publicVariable "pvar_messageSystem";
} 
else 
{
	//Mission Complete.
	
	deleteVehicle _vehicle;
	
    deleteGroup _CivGrpS;
	
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The ammo caches have been collected well done team</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	pvar_messageSystem = _hint;
    publicVariable "pvar_messageSystem";
};

//Reset Mission Spot.
[_missionMarkerName] call deleteClientMarker;


diag_log format["****** mission_AirWreck Finished ******"];
