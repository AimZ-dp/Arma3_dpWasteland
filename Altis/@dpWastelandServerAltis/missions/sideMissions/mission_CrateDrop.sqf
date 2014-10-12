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
private ["_missionMarkerName","_missionType","_marker","_marker2"];
_missionMarkerName = format["%1_AirWreck_Marker", _this select 0];
_missionType = "Aircraft Wreck";

//Get Mission Location
private ["_zoneData","_zonePos","_zoneWidth","_zoneHeight","_randomEndPos","_randomStartPos"];
_zoneData = [true] call createMissionLocation;
_zonePos = _zoneData select 0;
_zoneWidth = _zoneData select 1;
_zoneHeight = _zoneData select 2;
_randomEndPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
_randomEndPos set [2, 150];
_randomStartPos = [_zonePos,1,2000,2,2,1,0] call BIS_fnc_findSafePos;
_randomStartPos set [2, 150];

// Markers for start and destination
_marker = createMarker [format["%1_current", _missionMarkerName], _randomStartPos];
_marker setMarkerType "n_air";
_marker setMarkerColor "ColorBlack";
_marker setMarkerText "Helicopter";
_marker2 = createMarker [format["%1_watpoint", _missionMarkerName], _randomEndPos];
_marker2 setMarkerType "waypoint";
_marker2 setMarkerColor "ColorBlack";
_marker2 setMarkerText "Mission Destination";

// ---- CREATE VEHICLE AND UNITS, SEND TO WAYPOINT ----

private ["_vehicle","_CivGrpS","_pilot","_soldier","_waypoint"];
// Create the vehicle FLYING
_vehicle = [_randomStartPos, TransportHelicopters, true, 10, false, false, 2, "FLY"] call HeliCreation;	
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];
_vehicle setDamage 0;

// Create the group and place in heli
_CivGrpS = createGroup civilian;
_CivGrpS addVehicle _vehicle;
_pilot = [_CivGrpS, _randomEndPos] call createRandomSoldier; 
_pilot moveInDriver _vehicle;
_CivGrpS selectLeader _pilot;
_soldier = [_CivGrpS, _randomEndPos] call createRandomSoldier; 
_soldier addBackpack "B_Parachute";	
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpS, _randomEndPos] call createRandomSoldier; 
_soldier addBackpack "B_Parachute";	
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpS, _randomEndPos] call createRandomSoldier; 
_soldier addBackpack "B_Parachute";	
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpS, _randomEndPos] call createRandomSoldier; 
_soldier addBackpack "B_Parachute";	
_soldier moveInCargo _vehicle;
_soldier = [_CivGrpS, _randomEndPos] call createRandomSoldier; 
_soldier addBackpack "B_Parachute";	
_soldier moveInCargo _vehicle;

_waypoint = _CivGrpS addWaypoint [_randomEndPos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_waypoint setWaypointCombatMode "GREEN"; // Defensive behaviour
_waypoint setWaypointBehaviour "SAFE"; // Force convoy to normally drive on the street.
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint = _CivGrpS addWaypoint [_randomStartPos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_waypoint setWaypointCombatMode "GREEN"; // Defensive behaviour
_waypoint setWaypointBehaviour "SAFE"; // Force convoy to normally drive on the street.
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "LIMITED";

private ["_box1","_box2","_para","_spawnPos"];
_box1 = objNull;
_box2 = objNull;

[_vehicle, _randomEndPos, _pilot, _CivGrpS] spawn {
	private ["_vehicle", "_randomEndPos", "_pilot"];
	_vehicle = _this select 0;
	_randomEndPos = _this select 1;
	_pilot = _this select 2;
	_group = _this select 3;
	_box1 = _this select 4;
	_box2 = _this select 5;
	
	waituntil {currentWaypoint _group > 1};
	
	// Create these on crash!  Para them!
	_spawnPos = getPos _vehicle;
	_spawnPos set [2, (_spawnPos select 2) - 5];
	_box1 = [_spawnPos, missionAmmoBoxes, true, 10, false, "FLY"] call boxCreation;	
	_box1 setPos _spawnPos;
	_box2 = [_spawnPos, missionAmmoBoxes, true, 10, false, "FLY"] call boxCreation;	
	_box2 setPos _spawnPos;
	
	_para = createVehicle ["B_Parachute_02_F", _spawnPos, [], 10, "FLY"];
	_para setDir getDir _box1;
	_para setPos getPos _box1;
	_box1 attachTo [_para, [0,2,0]];
	[_box1, _para] spawn {_veh = _this select 0;_para = _this select 1;waitUntil {getPos _veh select 2 < 4};
		_vel = velocity _veh;detach _veh;_veh setVelocity _vel;_time = time + 5;waitUntil {time > _time};
		if (!isNull _para) then {deleteVehicle _para};};
	
	_para = createVehicle ["B_Parachute_02_F", _spawnPos, [], 10, "FLY"];
	_para setDir getDir _box2;
	_para setPos getPos _box2;
	_box2 attachTo [_para, [0,1,0]];
	0 = [_box2, _para] spawn {_veh = _this select 0;_para = _this select 1;waitUntil {getPos _veh select 2 < 4};
		_vel = velocity _veh;detach _veh;_veh setVelocity _vel;_time = time + 5;waitUntil {time > _time};
		if (!isNull _para) then {deleteVehicle _para};};

	// Eject all the crew		
	{
		//sleep 1;
		_x action ["eject",_vehicle];
	} foreach units _group;
	
	_pilot setDamage 1;	
	
	deleteWaypoint [_CivGrpS, 1];
	deleteWaypoint [_CivGrpS, 2];
	_waypoint = _CivGrpS addWaypoint [_box1, 0];	
	_waypoint setWaypointType "HOLD";
	_waypoint setWaypointCompletionRadius 50;
	_waypoint setWaypointCombatMode "GREEN"; // Defensive behaviour
	_waypoint setWaypointBehaviour "SAFE"; // Force convoy to normally drive on the street.
	_waypoint setWaypointFormation "NO CHANGE";
	_waypoint setWaypointSpeed "FULL";	
};

// ---- HINT TO CLIENTS ----

private ["_picture","_vehicleName","_hint"];
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has come down under enemy fire!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// ---- MISSION LOOP,  ---- 

private ["_result","_startTime","_missionEnd","_currTime","_playerPresent","_unitsAlive","_hasSpawned"];
_result = 0;
_startTime = floor(time);
_missionEnd = false;
_hasSpawned = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
	
	// update the start position
	_marker setMarkerPos (position _vehicle);

	if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
	{if((isPlayer _x) AND (_x distance _randomEndPos <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
	_unitsAlive = ({alive _x} count units _CivGrpS);
	if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1))) then
	{
		_missionEnd = true;
	};

	if (!(alive _pilot)) then
	{	
		[_missionMarkerName,getpos _box1,_missionType] call createClientMarker;
		
		_vehicle setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
		_vehicle setVariable ["last_timeout", time, true];
		_box1 setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
		_box1 setVariable ["last_timeout", time, true];
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
deleteMarker _marker;
deleteMarker _marker2;

diag_log format["****** mission_AirWreck Finished ******"];
