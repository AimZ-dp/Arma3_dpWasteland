//	@file Version: 1.0
//	@file Name: mission_Jet.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [CAD] Krycek
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};

diag_log format["****** mission_Jet Started ******"];

#include "mainMissionDefines.sqf";

private ["_CivGrpM","_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive","_missionEnd"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "Jet_Marker";
_missionType = "Immobile Fighter Plane";
_startTime = floor(time);

//Get Mission Location
_returnData = call createJetMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

[mainMissionDelayTime] call createWaitCondition;

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

_vehicle = [_randomPos, ArmedFighterPlanes, true, 1, false] call JetCreation;	
_vehicle setVehicleLock "LOCKED";
_vehicle setVariable ["R3F_LOG_disabled", true, true];

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been immobilized go get it for your team Pilot.</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
messageSystem = _hint;
    publicVariable "messageSystem";

_CivGrpM = createGroup civilian;
[_CivGrpM,_randomPos] spawn createMidGroup;

_startTime = floor(time);

private ["_playerPresent"];
_missionEnd = false;
while {!_missionEnd} do
{
    sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};sleep 0.1;}forEach playableUnits;
    _unitsAlive = ({alive _x} count units _CivGrpM);
    if ((_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _vehicle) == 1)) then 
	{
		_missionEnd = true;
	};
};

_vehicle setVehicleLock "UNLOCKED";
//_vehicle disableTIEquipment true;					// Will disable Thermal Optic in the vehicle. Don't believe a Jet has it, so no need for it here in any case.
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
	{
		_x removeAllEventHandlers "killed";
		deleteVehicle _x;
	}forEach units _CivGrpM;
    deleteGroup _CivGrpM;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
} else {
	//Mission Complete.
	deleteGroup _CivGrpM;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The Jet has been captured, now take it right into the Danger Zone</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
};

//Reset Mission Spot.
JetMissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;

diag_log format["****** mission_Jet Finished ******"];
