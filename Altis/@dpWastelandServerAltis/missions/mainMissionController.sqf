//	@file Version: 1.0
//	@file Name: mainMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
if(!isServer) exitWith {};

diag_log format["****** mainMissionController Started ******"];

#include "mainMissions\mainMissionDefines.sqf";

private ["_controllerName","_MMarray","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission"];

_controllerName = _this select 0;

//Main Mission Array
_MMarray = [
	[mission_APC,"mission_APC"],
	[mission_LightTank,"mission_LightTank"],
	[mission_ArmedHeli,"mission_ArmedHeli"],
	[mission_LightArmVeh,"mission_LightArmVeh"],
	//[mission_DuelHeli,"mission_DuelHeli"],
	[mission_Jet,"mission_Jet"]
];
_lastMission = "nomission";

while {true} do
{
    //Select Mission
    _randomIndex = floor (random (count _MMarray));
    _mission = _MMarray select _randomIndex select 0;
    _missionType = _MMarray select _randomIndex select 1;

	//Select new mission if the same
    if(_missionType == _lastMission) then
    {
        _newMissionArray = + _MMarray;
        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
        _randomIndex = floor (random (count _newMissionArray));
        _missionType = _newMissionArray select _randomIndex select 1;
        _mission = _newMissionArray select _randomIndex select 0;    
    };
	
	_missionRunning = [_controllerName] spawn _mission;

    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", mainMissionDelayTime / 60, mainMissionColor, subTextColor];
	pvar_messageSystem = _hint;
	publicVariable "pvar_messageSystem";
	
    _lastMission = _missionType;
    waitUntil{scriptDone _missionRunning};
    sleep 5; 
};

diag_log format["****** mainMissionController Finished ******"];