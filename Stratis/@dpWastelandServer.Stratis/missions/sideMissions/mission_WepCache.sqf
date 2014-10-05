//	@file Version: 1.0
//	@file Name: mission_WepCache.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:
if(!isServer) exitwith {};

//diag_log format["****** mission_WepCache Started ******"];

#include "sideMissionDefines.sqf";

private ["_CivGrpS","_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_boxtype","_box","_box1","_box2","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive","_missionEnd"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "WeaponCache_Marker";
_missionType = "Weapon Cache";
_startTime = floor(time);

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

[sideMissionDelayTime] call createWaitCondition;

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;


_box1 = [[(_randomPos select 0),(_randomPos select 1),0], missionAmmoBoxes, true, 2, false] call boxCreation;	
_box2 = [[(_randomPos select 0),(_randomPos select 1)-10,0], missionAmmoBoxes, true, 2, false] call boxCreation;	

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>A supply drop has been spotted near the marker</t>", _missionType,  sideMissionColor, subTextColor];
messageSystem = _hint;
publicVariable "messageSystem";

_CivGrpS = createGroup civilian;
[_CivGrpS,_randomPos] spawn createSmallGroup;

_startTime = floor(time);

_missionEnd = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _box1 <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
    _unitsAlive = ({alive _x} count units _CivGrpS);
    if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _box1) == 1)) then
	{
		_missionEnd = true;
	};
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box1;
    deleteVehicle _box2;
	{
		_x removeAllEventHandlers "killed";
		deleteVehicle _x;
	}forEach units _CivGrpS;
    deleteGroup _CivGrpS;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1</t><br/><t align='center' color='%3'>Objective failed, better luck next time</t>", _missionType, failMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
} else {
	//Mission Complete.
	if ((damage _box1) == 1) then {
		    deleteVehicle _box1;
	};
	if ((damage _box2) == 1) then {
		    deleteVehicle _box2;
	};
    deleteGroup _CivGrpS;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>The ammo caches have been collected well done team</t>", _missionType, successMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;

//diag_log format["****** mission_WepCache Finished ******"];
