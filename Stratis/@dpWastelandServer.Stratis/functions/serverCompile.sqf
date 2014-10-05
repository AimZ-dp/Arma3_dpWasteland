//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** serverCompile Started ***"];

//Server Config
serverInit = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\serverInit.sqf";
serverAdminList = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\serverAdminList.sqf";
serverVars = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\serverVars.sqf";
relations = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\relations.sqf";
serverTimeSync = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\serverTimeSync.sqf";
broadcaster = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\broadcaster.sqf";
createBaseObject = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\createBaseObject.sqf";

//Spawning Compiles
boxSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\boxSpawning.sqf";
boxCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\boxCreation.sqf";
baseObjectSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\baseObjectSpawning.sqf";
baseObjectCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\baseObjectCreation.sqf";
survivalObjectSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\survivalObjectSpawning.sqf";
survivalObjectCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\survivalObjectCreation.sqf";
HeliSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\HeliSpawning.sqf";
HeliCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\HeliCreation.sqf";
//JetSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\JetSpawning.sqf";		// Disabled since it is only used in Missions atm.
JetCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\JetCreation.sqf";
vehicleSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\vehicleSpawning.sqf";
vehicleCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\vehicleCreation.sqf";
boatSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\boatSpawning.sqf";
boatCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\boatCreation.sqf";
randomWeapons = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\randomWeapon.sqf";
respawnCheck = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\spawning\respawnCheck.sqf";

//Player Management
//server_playerDied = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\serverPlayerDied.sqf";
controlStoreGuy = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\controlStoreGuy.sqf";

//Object Management
cleanObjects = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\cleanObjects.sqf";
cleanDead = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\functions\cleanDead.sqf";

//Main Mission Compiles
mainMissionController = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissionController.sqf";
mission_Jet = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissions\mission_Jet.sqf";
mission_ArmedHeli = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissions\mission_ArmedHeli.sqf";
mission_Convoy = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissions\mission_Convoy.sqf";
mission_LightArmVeh = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissions\mission_LightArmVeh.sqf";
mission_APC = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissions\mission_APC.sqf";
mission_LightTank = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\mainMissions\mission_LightTank.sqf";

//Side Mission Compiles
sideMissionController = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissionController.sqf";
mission_AirWreck = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissions\mission_AirWreck.sqf";
mission_WepCache = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissions\mission_WepCache.sqf";
mission_CivHeli = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissions\mission_CivHeli.sqf";
mission_AbandonedVehicle = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissions\mission_AbandonedVehicle.sqf";
mission_UAV = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissions\mission_UAV.sqf";
mission_Boat = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\sideMissions\mission_Boat.sqf";

//Factory Compiles
createMissionLocation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createMissionLocation.sqf";
createSeaMissionLocation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createSeaMissionLocation.sqf";
createJetMissionLocation = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createJetMissionLocation.sqf";
createClientMarker = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\deleteClientMarker.sqf";
createRandomSoldier = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createUnits\createRandomSoldier.sqf";
createSmallGroup = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createUnits\midGroup.sqf";
//createMissionVehicle = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\createMissionVehicle.sqf";
defendArea = compileFinal preprocessFileLineNumbers "\@dpWastelandServer\missions\factoryMethods\defendArea.sqf";

serverCompiledScripts = true;

diag_log format["*** serverCompile Finished ***"];
