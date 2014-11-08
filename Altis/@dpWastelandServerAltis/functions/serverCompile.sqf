//	@file Version: 1.0
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** serverCompile Started ***"];

//Server Config
serverInit = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\serverInit.sqf";
serverAdminList = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\serverAdminList.sqf";
serverVars = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\serverVars.sqf";
relations = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\relations.sqf";
serverTimeSync = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\serverTimeSync.sqf";
createBaseObject = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\createBaseObject.sqf";

//Spawning Compiles
boxSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\boxSpawning.sqf";
boxCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\boxCreation.sqf";
baseObjectCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\baseObjectCreation.sqf";
survivalObjectSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\survivalObjectSpawning.sqf";
survivalObjectCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\survivalObjectCreation.sqf";
HeliSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\HeliSpawning.sqf";
HeliCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\HeliCreation.sqf";
JetCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\JetCreation.sqf";
vehicleSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\vehicleSpawning.sqf";
vehicleCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\vehicleCreation.sqf";
boatSpawning = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\boatSpawning.sqf";
boatCreation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\boatCreation.sqf";
randomWeapons = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\randomWeapon.sqf";
respawnCheck = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\spawning\respawnCheck.sqf";

//Player Management
//server_playerDied = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\serverPlayerDied.sqf";

//Object Management
cleanObjects = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\cleanObjects.sqf";
cleanDead = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\cleanDead.sqf";

//Main Mission Compiles
mainMissionController = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissionController.sqf";
mission_Jet = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_Jet.sqf";
mission_ArmedHeli = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_ArmedHeli.sqf";
mission_Convoy = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_Convoy.sqf";
mission_LightArmVeh = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_LightArmVeh.sqf";
mission_APC = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_APC.sqf";
mission_LightTank = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_LightTank.sqf";
mission_DuelHeli = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\mainMissions\mission_DuelHeli.sqf";

//Side Mission Compiles
sideMissionController = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissionController.sqf";
mission_AirWreck = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_AirWreck.sqf";
mission_WepCache = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_WepCache.sqf";
mission_CivHeli = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_CivHeli.sqf";
mission_AbandonedVehicle = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_AbandonedVehicle.sqf";
mission_UAV = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_UAV.sqf";
mission_Boat = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_Boat.sqf";
mission_RichGuy = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\sideMissions\mission_RichGuy.sqf";

//Factory Compiles
createMissionLocation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createMissionLocation.sqf";
createSeaMissionLocation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createSeaMissionLocation.sqf";
createJetMissionLocation = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createJetMissionLocation.sqf";
createClientMarker = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createClientMarker.sqf";
createWaitCondition = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\deleteClientMarker.sqf";
createRandomSoldier = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createUnits\createRandomSoldier.sqf";
createSmallGroup = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\createUnits\midGroup.sqf";
defendArea = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\missions\factoryMethods\defendArea.sqf";

//Restricted Zones
isPosRestricted = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\RestrictedZone\isPosRestricted.sqf";
findSafeRectPos = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\RestrictedZone\findSafeRectPos.sqf";

//Store Guys
createGunStores = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\StoreGuys\createGunStores.sqf";
createGeneralStores = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\StoreGuys\createGeneralStores.sqf";
createConstructionStores = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\StoreGuys\createConstructionStores.sqf";
controlStoreGuy = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\StoreGuys\controlStoreGuy.sqf";

// Locations
createLocations = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\locations\createLocations.sqf";
drawLocations = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\locations\drawLocations.sqf";
createRespawnHelicopter = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\locations\createRespawnHelicopter.sqf";

// clean server
objectProtection = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\objectProtection.sqf";

// bases
dp_fnc_abandonBase = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\bases\abandonBase.sqf";
dp_fnc_captureBase = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\bases\captureBase.sqf";
dp_fnc_registerBase = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\bases\registerBase.sqf";
dp_fnc_processAction = compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\bases\processAction.sqf";


serverCompiledScripts = true;

diag_log format["*** serverCompile Finished ***"];
