
if(!isServer) exitwith {};

//diag_log format["****** mission_ArmedHeli Started ******"];

#include "mainMissionDefines.sqf";

[mainMissionDelayTime] call createWaitCondition;

//Mission Initialization.
private ["_missionMarkerName","_missionType","_marker"];
_missionMarkerName = format ["%1_DuelHeli_Assault", _this select 0];
_missionType = "Armed Helicopters Engaged";

//Get Mission Location
private ["_zoneData","_zonePos","_zoneWidth","_zoneHeight","_randomEndPos","_randomStartPos"];
_zoneData = [true] call createMissionLocation;
_zonePos = _zoneData select 0;
_zoneWidth = _zoneData select 1;
_zoneHeight = _zoneData select 2;
_randomEndPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
_randomEndPos set [2,  300];

// ---- CREATE VEHICLE AND UNITS, SEND TO WAYPOINT ----

private ["_vehicle1","_vehicle2","_CivGrp","_pilot","_soldier","_waypoint"];
// Create 2 vehicles FLYING
_vehicle1 = [_randomEndPos, AttackHelicopters, true, 3000, false, false, 2, "FLY"] call HeliCreation;	
_vehicle1 setDamage 0;

_vehicle2 = [_randomEndPos, AttackHelicopters, true, 3000, false, false, 2, "FLY"] call HeliCreation;	
_vehicle2 setDamage 0;

// Create the group and place in heli
_CivGrp = createGroup civilian;
_CivGrp addVehicle _vehicle1;
_CivGrp addVehicle _vehicle2;

_pilot1 = [_CivGrp, _randomEndPos] call createRandomSoldier; 
_pilot1 moveInDriver _vehicle1;
_CivGrp selectLeader _pilot1;
_pilot2 = [_CivGrp, _randomEndPos] call createRandomSoldier; 
_pilot2 moveInDriver _vehicle2;
_CivGrp selectLeader _pilot2;

_copilot1 = [_CivGrp, _randomEndPos] call createRandomSoldier; 
_copilot1 moveInGunner _vehicle1;
_copilot2 = [_CivGrp, _randomEndPos] call createRandomSoldier; 
_copilot2 moveInGunner _vehicle2;

_waypoint = _CivGrp addWaypoint [_randomEndPos, 0];
_waypoint setWaypointType "DESTROY";
_waypoint setWaypointCompletionRadius 100;
_waypoint setWaypointCombatMode "RED"; // Defensive behaviour
_waypoint setWaypointBehaviour "COMBAT"; // Force convoy to normally drive on the street.
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "FULL";

// ---- MARKERS ----

[_missionMarkerName,position _vehicle,_missionType] call createClientMarker;
	
// ---- HINT TO CLIENTS ----

private ["_picture","_vehicleName","_hint"];
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t> heli has been spotted, prepare to be engaged. Be warned there may be more than one.</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// ---- MISSION LOOP,  ---- 

private ["_result","_startTime","_missionEnd","_currTime","_playerPresent","_unitsAlive"];
_result = 0;
_startTime = floor(time);
_missionEnd = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);

    if(_currTime - _startTime >= mainMissionTimeout || (damage _vehicle) == 1) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
    _unitsAlive = ({alive _x} count units _CivGrp);
    if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1))) then
	{
		_missionEnd = true;
	};

	_vehicle1 setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
	_vehicle1 setVariable ["last_timeout", time, true];
	_vehicle2 setVariable ["timeout", (time + ammoDesertedTimeLimit + random maxRandomTimeLimit), true];
	_vehicle2 setVariable ["last_timeout", time, true];
};

if(_result == 1) then
{
	//Mission Failed.
	
	_vehicle1 setDamage 1;
	_vehicle2 setDamage 1;
	
	{
		_x removeAllEventHandlers "killed";
		deleteVehicle _x;
	}forEach units _CivGrp;
    deleteGroup _CivGrp;
    
	_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	pvar_messageSystem = _hint;
	publicVariable "pvar_messageSystem";
} 
else 
{
	//Mission Complete.
	
	_vehicle1 setDamage 1;
	_vehicle2 setDamage 1;
	
    deleteGroup _CivGrp;

    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The helicopter has been captured, now go destroy the enemy</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	pvar_messageSystem = _hint;
	publicVariable "pvar_messageSystem";
};

//Reset Mission Spot.
[_missionMarkerName] call deleteClientMarker;

//diag_log format["****** mission_ArmedHeli Finished ******"];
