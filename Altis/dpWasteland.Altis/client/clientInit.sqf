//	Name: init.sqf
//	Author: AimZ =(dp)=

if(isServer) exitWith {};

diag_log format["****** clientInit Started ******"];

// Public variable events
"currentDate" addPublicVariableEventHandler {[] call timeSync};

// Mission Events: 
"pvar_messageSystem" addPublicVariableEventHandler {[] call serverMessage};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};

"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"pvar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

// ---- ARE THESE USED! CHANGE TIME DOES ----
"pvar_allowPlayerIcons" addPublicVariableEventHandler {pvars_allowPlayerIcons = pvar_allowPlayerIcons; hint format["Player Icons %1", pvar_allowPlayerIcons];};
"pvar_allowGroups" addPublicVariableEventHandler {pvars_allowGroups = pvar_allowGroups; if(pvar_allowGroups == "OFF") then {[player] joinSilent grpNull;}; hint format["Groups %1", pvar_allowGroups];};
"pvar_clockCycle" addPublicVariableEventHandler {pvars_clockCycle = pvar_clockCycle; hint format["Day Night Cycle %1", pvar_clockCycle];};

// Initialise
[] call clientVars;

// --- IS THERE NOT A BIS_FNC for checking init
// wait for the player to be ingame before continuing
waitUntil {!(isNull player)};
waitUntil {vehicle player == player};
waitUntil {!visibleMap};
sleep 2;

// One time only setup
[] call briefing;				// Logs and rules
[] call initPlayer;				
[] call createKeyboardEvent; 	// Define keyboard shortcuts


// Start HUD drawing
[] spawn playerHud;
[] spawn drawPlayerIcons;
[] spawn getPlayerData;
[] spawn getDebugData;

//[] spawn rechargeScanner;
//[] spawn cleanLocalObjects;
//[] call objectProtection;

0 setOvercast 0;

diag_log format["******** clientInit Finished ********"];
