
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

private ["_vehicle1","_vehicle2","_CivGrp","_pilot1","_pilot2","_copilot1","_copilot2","_soldier","_waypoint"];
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

_areaArray = cityArray;
_area = _areaArray select (floor (random (count _areaArray)));
_newPosition = _area select 2;

_waypoint = _CivGrp addWaypoint [_newPosition, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint setWaypointCombatMode "RED"; 
_waypoint setWaypointBehaviour "AWARE"; 
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "FULL";

_waypoint setWaypointType "SAD";
_waypoint setWaypointCompletionRadius 10;
_waypoint setWaypointCombatMode "RED"; 
_waypoint setWaypointBehaviour "AWARE"; 
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "NORMAL";

// ---- MARKERS ----

private ["_marker1","_marker2"];
_marker1 = createMarker [format["%1_current_1", _missionMarkerName],  position _vehicle1];
_marker1 setMarkerType "n_air";
_marker1 setMarkerColor "ColorBlack";

private ["_marker","_marker2"];
_marker2 = createMarker [format["%1_current_2", _missionMarkerName],  position _vehicle2];
_marker2 setMarkerType "n_air";
_marker2 setMarkerColor "ColorBlack";

[_missionMarkerName,_randomEndPos,_missionType] call createClientMarker;
	
// ---- HINT TO CLIENTS ----

private ["_picture","_vehicleName","_hint"];
_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle1 >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle1 >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t> heli has been spotted, prepare to be engaged. Be warned there may be more than one.</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
pvar_messageSystem = _hint;
publicVariable "pvar_messageSystem";

// ---- MISSION LOOP,  ---- 

private ["_result","_startTime","_missionEnd","_currTime","_unitsAlive"];
_result = 0;
_startTime = floor(time);
_missionEnd = false;
while {!_missionEnd} do
{
    sleep 1; 
    _currTime = floor(time);

    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    _unitsAlive = ({alive _x} count units _CivGrp);
    if ((_result == 1) OR (_unitsAlive < 1)) then
	{
		_missionEnd = true;
	};
	
	if (damage _vehicle1 < 0.9) then 
	{
		_marker1 setMarkerPos (position _vehicle1);
	}
	else
	{
		deleteMarker _marker1;	
	};
	
	if (damage _vehicle2 < 0.9) then 
	{
		_marker2 setMarkerPos (position _vehicle2);
	}
	else
	{
		deleteMarker _marker2;	
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
