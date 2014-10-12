
if(!isDedicated) exitWith {};

diag_log format["****** SERVER init Started ******"];

// ---- MOVED TO SERVER FOR SECURITY, NEED TO SORT AND PUT IN FUNCTIONS ----
modVersion = "hiddenfromclients";
vChecksum = 1;
{vChecksum = vChecksum + _x;} forEach (toArray modVersion); 

// On cr?e le point d'attache qui servira aux attachTo pour les objets ? charger virtuellement dans les v?hicules
R3F_LOG_PUBVAR_point_attache = "Land_HelipadEmpty_F" createVehicle [0, 0, 0];
R3F_LOG_PUBVAR_point_attache setVariable["newVehicle",vChecksum,true];
publicVariable "R3F_LOG_PUBVAR_point_attache";
// -------------------------------

"pvars_allowPlayerIcons" addPublicVariableEventHandler {	
	if (pvar_allowPlayerIcons != pvars_allowPlayerIcons) then
	{
		pvar_allowPlayerIcons = pvars_allowPlayerIcons;
		publicVariable "pvar_allowPlayerIcons";
	};
};
"pvars_allowGroups" addPublicVariableEventHandler {	
	if (pvar_allowGroups != pvars_allowGroups) then
	{
		pvar_allowGroups = pvars_allowGroups;
		publicVariable "pvar_allowGroups";
	};
};
"pvars_clockCycle" addPublicVariableEventHandler {	
	if (pvar_clockCycle != pvars_clockCycle) then
	{
		pvar_clockCycle = pvars_clockCycle;
		publicVariable "pvar_clockCycle";
	};
};

"pvar_createBaseObject" addPublicVariableEventHandler {[_this select 1] call createBaseObject};
"pvar_refuelVehicle" addPublicVariableEventHandler {[_this select 1] call refuelVehicle};
"pvar_defuelVehicle" addPublicVariableEventHandler {[_this select 1] call refuelVehicle};

//Execute Server Side Scripts.
[] call serverAdminList;
[] call serverVars;
[] call relations;
[] spawn serverTimeSync;
[] spawn broadcaster;

//Create the store guys
[storesPerActiveZone] call createGunStores;
[storesPerActiveZone] call createGeneralStores;
[storesPerActiveZone] call createConstructionStores;

//Execute Server Cleanup.
[] spawn cleanObjects;
[] spawn cleanDead;

//Execute Server Spawning.
[] call vehicleSpawning;
[] call HeliSpawning;
[] call boxSpawning;
[] call boatSpawning;
[] call survivalObjectSpawning;
[] spawn respawnCheck;

//Execute Server Missions.
["controller1"] spawn sideMissionController;
["controller1"] spawn mainMissionController;
//sleep 150;
//["controller2"] spawn sideMissionController;
//["controller2"] spawn mainMissionController;

/*
[] spawn {
	_objects = nearestObjects [getMarkerPos "Town_1", ["House_F"], 28000];
	{
		_x allowDamage false;
		_x enableSimulation false;
		_x setVariable ["R3F_LOG_disabled", true, true];
		sleep 0.01;
	} foreach _objects;
};
*/

diag_log format["****** SERVER init Finshed ******"];