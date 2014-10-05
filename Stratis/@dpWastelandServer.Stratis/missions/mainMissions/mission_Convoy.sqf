// TODO: Fix that convoy get sometimes stuck on objects on the road.
if(!isServer) exitwith {};

//diag_log format["****** mission_Convoy Started ******"];

#include "mainMissionDefines.sqf"

private ["_missionMarkerName","_missionType","_picture","_vehicleName","_target","_hint","_waypoint","_waypoints","_group","_vehicles","_marker","_failed","_startTime","_numWaypoints","_boxtype","_ammobox","_createVehicle","_leader","_missionEnd"];

_missionMarkerName = "Convoy_Marker";
_missionType = "Convoy";

[mainMissionDelayTime] call createWaitCondition;

_group = createGroup civilian;

// Factory function for vehicle creation
_createVehicle = {
    private ["_type","_turret","_position","_direction","_group","_vehicle","_soldier"];
    
    _type = _this select 0;
	_turret = _this select 1;
    _position = _this select 2;
    _direction = _this select 3;
    _group = _this select 4;
    
    _vehicle = _type createVehicle _position;
	_vehicle setVariable["newVehicle",vChecksum,true];
	
    _vehicle setDir _direction;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    _group addVehicle _vehicle;
    
    // Spawn crew
    _soldier = [_group, _position] call createRandomSoldier; 
    _soldier moveInDriver _vehicle;
    _soldier = [_group, _position] call createRandomSoldier; 
    _soldier moveInCargo [_vehicle, 0];
    _soldier = [_group, _position] call createRandomSoldier; 
    _soldier moveInCargo [_vehicle, 1];
    _soldier = [_group, _position] call createRandomSoldier; 
    if (_turret == 0) then {
        _soldier moveInCargo [_vehicle, 2];
    } else {
        _soldier moveInTurret [_vehicle, [0]];
    };
    
    _vehicle
};

// Create vehicles
_target = ArmouredPersonnelCarriers call BIS_fnc_selectRandom;
_vehicles = [];
_vehicles set [0, [ArmedMRAPVehicles call BIS_fnc_selectRandom, 1, [6011.5811,5580.3062,18.278307], 110, _group] call _createVehicle];
_vehicles set [1, [_target, 0, [6018.4683,5593.3691,17.673149], 110, _group] call _createVehicle];
_vehicles set [2, [ArmedMRAPVehicles call BIS_fnc_selectRandom, 1, [6035.0527,5600.4419,18.384674], 110, _group] call _createVehicle];

// Set the driver of the first vehicle as leader
_leader = driver (_vehicles select 0);
_group selectLeader _leader;
_leader setRank "LIEUTENANT";

// Set default group behaviour
_group setCombatMode "GREEN";
_group setBehaviour "SAFE";
_group setFormation "STAG COLUMN";
_group setSpeedMode "LIMITED";

// Add waypoints
_waypoints = [
    [6010.8496,5572.2354,19.232994],
    [6013.0288,5549.208,22.404259],
    [5984.7109,5517.4683,28.23354],
    [5859.9292,5331.6963,60.606529],
    [5769.2129,5242.2676,100.02244],
    [5726.3804,5288.9355,99.472961],
    [5701.4482,5292.1318,100.7569],
    [5532.0356,5456.4297,115.06959],
    [5490.4824,5496.7046,122.51913],
    [5462.354,5606.0234,124.90921],
    [5428.4712,5644.3813,134.44418],
    [5413.7671,5701.9175,137.42122],
    [5388.1958,5726.8496,138.92596],
    [5319.1509,5758.1753,151.76012],
    [5273.7622,5809.3184,154.57024],
    [5257.1411,5820.8252,154.55704],
    [5237.3228,5811.2363,156.19037],
    [5243.7153,5762.0107,154.88901],
    [5244.9941,5717.8994,156.23193],
    [5230.2905,5664.1992,159.17253],
    [5229.6514,5604.7451,167.41731],
    [5342.1665,5477.5264,172.64011],
    [5367.0986,5414.2363,174.75784],
    [5278.2373,5330.4888,191.32828],
    [5182.9829,5321.5386,190.4222],
    [5165.7217,5301.0811,191.34062],
    [5186.1792,5268.4775,195.61554],
    [5270.0298,5179.6904,208.54974],
    [5293.3311,5123.2002,215.96788],
    [5297.7915,5058.0815,217.53033],
    [5336.1484,4977.7979,204.05174],
    [5329.0122,4943.0093,201.56023],
    [5213.4937,4905.5435,201.13528],
    [5149.2666,4833.2896,194.62895],
    [5061.8159,4771.2617,171.02904],
    [5061.2725,4663.0615,179.64809],
    [5068.1187,4626.3428,180.112],
    [5018.3301,4527.3887,178.03094],
    [4970.7188,4499.1543,178.13374],
    [4907.7817,4478.7422,180.39085],
    [4826.1338,4466.2681,178.04259],
    [4777.9385,4427.1455,184.62383],
    [4675.8784,4387.4551,183.19516],
    [4616.9111,4347.7651,190.3116],
    [4579.4888,4326.7861,189.13708],
    [4495.0059,4312.6113,189.72147],
    [4453.0483,4263.2822,192.61714],
    [4455.8931,4228.5073,195.22217],
    [4438.7944,4178.2188,200.54451],
    [4439.8003,4146.5376,203.37],
    [4415.1597,4083.6772,201.30048],
    [4368.894,4015.2842,206.20345],
    [4332.1836,3999.1919,204.8188],
    [4232.6123,3986.6201,204.97206],
    [4211.4912,3971.5337,206.43538],
    [4209.479,3914.7075,207.30072],
    [4221.0459,3874.4775,205.51711],
    [4273.3452,3804.0732,206.86307],
    [4278.8779,3707.0171,210.91055],
    [4269.8262,3658.2373,213.08755],
    [4278.8779,3617.001,216.12012],
    [4272.8428,3587.3311,214.59283],
    [4229.5957,3555.1455,211.677],
    [4089.2913,3470.1592,211.04219],
    [4006.0576,3458.2607,199.2294],
    [3894.8174,3399.7612,185.70465],
    [3878.3147,3378.3521,179.93759],
    [3850.2151,3362.7417,174.04576],
    [3819.886,3360.0654,169.82652],
    [3799.3691,3343.1167,166.59842],
    [3793.125,3305.2061,161.63013],
    [3757.8896,3238.749,165.28528],
    [3737.8191,3160.6963,176.70767],
    [3747.6311,3092.0088,179.77129],
    [3751.1992,3060.3418,177.75587],
    [3783.313,2997.4526,164.42339],
    [3779.7444,2976.4897,161.99518],
    [3758.782,2959.9868,161.75108],
    [3712.8416,2940.3628,164.07759],
    [3676.7139,2908.6953,159.79079],
    [3623.6375,2877.0283,158.87183],
    [3589.7402,2846.6992,155.22374],
    [3535.7727,2826.1826,153.3045],
    [3528.6362,2786.9316,150.05869],
    [3504.5515,2760.6167,148.37357],
    [3531.7585,2679.8882,141.27533],
    [3517.0403,2652.2349,142.91168],
    [3457.72,2638.4077,143.03265],
    [3462.2549,2620.189,142.81012],
    [3449.781,2586.1685,142.69345],
    [3424.2659,2553.2827,143.43736],
    [3392.5139,2475.604,145.7547],
    [3333.5457,2397.9253,150.02211],
    [3209.9397,2300.4009,158.75577],
    [3167.4148,2234.0625,160.45987],
    [3061.3857,2133.7036,167.75574],
    [3042.1077,2033.3447,166.45193],
    [3000.1494,1986.2842,165.84009],
    [2792.0605,1812.2153,150.23816],
    [2786.3013,1781.6255,146.07935],
    [2809.9778,1759.3691,143.93187],
    [2917.1201,1741.1987,136.81172],
    [3014.46,1750.9316,128.54433],
    [3065.2932,1728.7881,119.45032],
    [3121.3252,1677.7622,107.49362],
    [3139.8101,1650.2275,100.47182],
    [3146.1643,1622.6924,94.042763],
    [3140.1951,1604.3999,91.389023],
    [3126.1392,1590.1509,90.373833],
    [3070.9749,1568.8965,86.169441],
    [2900.5881,1452.9756,58.671822],
    [2873.5154,1408.166,49.497711],
    [2797.5884,1323.8374,35.179008],
    [2755.5793,1292.0967,29.997046],
    [2671.5615,1252.2661,16.019455],
    [2606.2144,1213.9912,7.7718349],
    [2575.719,1202.4775,6.2643886],
    [2528.1089,1175.0942,3.5770361],
    [2493.2571,1171.3599,3.1864021],
    [2429.1548,1144.9097,2.9939172]
];
{
    _waypoint = _group addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "GREEN"; // Defensive behaviour
    _waypoint setWaypointBehaviour "SAFE"; // Force convoy to normally drive on the street.
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

// Create marker
_marker = createMarker [_missionMarkerName, position leader _group];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Convoy";

// Display mission message
_picture = getText (configFile >> "CfgVehicles" >> _target >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> _target >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> is convoyed by two armored vehicles. Stop them!</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _group;
_missionEnd = false;
while {!_missionEnd} do
{
    private ["_unitsAlive"];
    sleep 1; 
    
    _marker setMarkerPos (position leader _group);
    
    if ((floor time) - _startTime >= mainMissionTimeout) then { _failed = true };
    if (currentWaypoint _group >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    _unitsAlive = { alive _x } count units _group;
    
    if (_unitsAlive == 0 || _failed) then
	{
		_missionEnd = true;
	};
};

if(_failed) then
{
    // Mission failed
	{deleteVehicle _x;} foreach _vehicles;
	{
		_x removeAllEventHandlers "killed";
		deleteVehicle _x;
	}forEach units _group;
	deleteGroup _group;
		
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
} else {
    // Mission complete
    deleteGroup _group;
	
    // Spawn loot at last marker position
    _ammobox = [getMarkerPos _marker, missionAmmoBoxes, true, 2, false] call boxCreation;	
    
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The convoy has been successfully stopped. Now the weapons and cars are yours.</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
};

deleteMarker _marker;

//diag_log format["****** mission_Convoy Finished ******"];

