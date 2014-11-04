
diag_log format["****** clientCompile Started ******"];

// Initialise
clientInit = compileFinal preprocessFileLineNumbers "client\clientInit.sqf";
clientVars = compileFinal preprocessFileLineNumbers "client\clientVars.sqf";
briefing = compileFinal preprocessFileLineNumbers "client\briefing.sqf";

// Event handlers
onKeyPress = compileFinal preprocessFileLineNumbers "client\clientEvents\onKeyPress.sqf";

// Admin Panel
checkAdmin = compileFinal preprocessFileLineNumbers "client\gui\adminPanel\checkAdmin.sqf";
checkAdmin2 = compileFinal preprocessFileLineNumbers "client\gui\adminPanel\checkAdmin2.sqf";
loadServerModeratorMenu = compileFinal preprocessFileLineNumbers "client\gui\adminPanel\loadServerModeratorMenu.sqf";
loadServerAdministratorMenu = compileFinal preprocessFileLineNumbers "client\gui\adminPanel\loadServerAdministratorMenu.sqf";

// Player Initialise
createKeyboardEvent = compileFinal preprocessFileLineNumbers "client\functions\createKeyboardEvent.sqf";
createMenuActions = compileFinal preprocessFileLineNumbers "client\functions\createMenuActions.sqf";
initPlayer = compileFinal preprocessFileLineNumbers "client\functions\initPlayer.sqf";
playerSetup = compileFinal preprocessFileLineNumbers "client\functions\playerSetup.sqf";
initSurvival = compileFinal preprocessFileLineNumbers "client\functions\initSurvival.sqf";
cleanLocalObjects = compileFinal preprocessFileLineNumbers "client\functions\cleanLocalObjects.sqf";

// Player spawn functionality
playerSpawn = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\playerSpawn.sqf";
spawnAction = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\spawnAction.sqf";
welcomeMessage = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\welcomeMessage.sqf";
client_respawnDialog = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\loadRespawnDialog.sqf";
spawnRandom = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\spawnRandom.sqf";
spawnInTown = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\spawnInTown.sqf";
spawnInHeli = compileFinal preprocessFileLineNumbers "client\functions\playerSpawn\spawnInHeli.sqf";

// Player Menu Panel
loadPlayerMenu = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\loadPlayerMenu.sqf";
itemfnc = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\itemfnc.sqf";
takeMoney = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\takeMoney.sqf";
takeItem = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\takeItem.sqf";
giveMoney = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\giveMoney.sqf";
refuel = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\refuel.sqf";
repairVehicle = compileFinal preprocessFileLineNumbers "client\gui\playerMenu\repair.sqf";

useScanner = compileFinal preprocessFileLineNumbers "client\actions\useScanner.sqf";
rechargeScanner = compileFinal preprocessFileLineNumbers "client\actions\rechargeScanner.sqf";

// Groups Panel
loadGroupManagement = compileFinal preprocessFileLineNumbers "client\gui\groups\loadGroupManagement.sqf";

// Sync client with server time
timeSync = compileFinal preprocessFileLineNumbers "client\functions\serverFunc\clientTimeSync.sqf";
serverMessage = compileFinal preprocessFileLineNumbers "client\functions\serverFunc\serverMessage.sqf";
engineOff = compileFinal preprocessFileLineNumbers "client\functions\serverFunc\engineOff.sqf";

// Update scripts
updateMissionsMarkers = compileFinal preprocessFileLineNumbers "client\functions\updatePlayerMissionMarkers.sqf";
updateTeamKiller = compileFinal preprocessFileLineNumbers "client\functions\updateTeamKiller.sqf";

// Team-kill system
teamkillAction = compileFinal preprocessFileLineNumbers "client\functions\doTeamKillAction.sqf";
teamkillMessage = compileFinal preprocessFileLineNumbers "client\functions\showTeamKillMessage.sqf";
spawnDefence = compileFinal preprocessFileLineNumbers "client\functions\spawnDefence.sqf";

// Restricted Zones
detectRestrictedZones = compileFinal preprocessFileLineNumbers "client\functions\RestrictedZone\detectRestrictedZones.sqf";
displayRestrictedZones = compileFinal preprocessFileLineNumbers "client\functions\RestrictedZone\DisplayRestrictedZones.sqf";
isPosRestricted = compileFinal preprocessFileLineNumbers "client\functions\RestrictedZone\isPosRestricted.sqf";

// Store Panels
loadGeneralStore = compileFinal preprocessFileLineNumbers "client\gui\generalStore\loadGenStore.sqf";
loadGunStore = compileFinal preprocessFileLineNumbers "client\gui\gunStore\loadGunStore.sqf";
loadConstructionStore = compileFinal preprocessFileLineNumbers "client\gui\constructionStore\loadConstructionStore.sqf";

// HUD graphics
playerHud = compileFinal preprocessFileLineNumbers "client\gui\hud\playerHud.sqf";
drawPlayerIcons = compileFinal preprocessFileLineNumbers "client\gui\hud\playerIcons.sqf";
getPlayerData = compileFinal preprocessFileLineNumbers "client\gui\hud\getPlayerData.sqf";
getDebugData = compileFinal preprocessFileLineNumbers "client\gui\hud\getDebugData.sqf";

// Update markers
createTownMarkers = compileFinal preprocessFileLineNumbers "client\functions\createTownMarkers.sqf";
updateStoreMarkers = compileFinal preprocessFileLineNumbers "client\functions\updateStoreMarkers.sqf";

// Fuelling
refuelVehicle = compileFinal preprocessFileLineNumbers "client\functions\Fuelling\refuelVehicle.sqf";
defuelVehicle = compileFinal preprocessFileLineNumbers "client\functions\Fuelling\defuelVehicle.sqf";

objectProtection = compileFinal preprocessFileLineNumbers "client\functions\objectProtection.sqf";

playerCompiledScripts = true;

diag_log format["****** clientCompile Finished ******"];
