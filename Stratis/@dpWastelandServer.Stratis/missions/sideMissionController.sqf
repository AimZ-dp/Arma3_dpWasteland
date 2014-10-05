//	@file Version: 1.0
//	@file Name: sideMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "sideMissions\sideMissionDefines.sqf";

//diag_log format["****** sideMissionController Started ******"];

private ["_SMarray","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission"];

//Side Mission Array
_SMarray = [
	[mission_WepCache,"mission_WepCache"],
	[mission_AirWreck,"mission_AirWreck"],
	[mission_CivHeli,"mission_CivHeli"],
	[mission_AbandonedVehicle,"mission_AbandonedVehicle"],
	[mission_Boat,"mission_Boat"]
	//[mission_UAV,"mission_UAV"]
];
			
_lastMission = "nomission";
while {true} do
{
	//Select Mission
    _randomIndex = floor (random (count _SMarray));
    _mission = _SMarray select _randomIndex select 0;
    _missionType = _SMarray select _randomIndex select 1;

	//Select new mission if the same
    if(str(_missionType) == _lastMission) then
    {
        _newMissionArray = _SMarray;
        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
        _randomIndex = floor (random (count _newMissionArray));
        _missionType = _newMissionArray select _randomIndex select 1;
        _mission = _newMissionArray select _randomIndex select 0;   
    };
	
	_missionRunning = [] spawn _mission;

    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", sideMissionDelayTime / 60, sideMissionColor, subTextColor];
	messageSystem = _hint;
	publicVariable "messageSystem";
	
    _lastMission = _missionType;
	waitUntil{scriptDone _missionRunning};
    sleep 5;
};

//diag_log format["****** sideMissionController Finished ******"];