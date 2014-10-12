//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.
            
diag_log format["*** clientVars Started ***"];
		
// Client global variable - Actions
mutexScriptInProgress = false;		// Used by all actions, this is a mutex which is used to stop other actions from being perform when another is in progress
doCancelAction = false;				// Used by all actions,
JumpStarted = false;				// State of the jump action

// Client global variable - Respawn Functionality
respawnDialogActive = false;
pvar_PlayerTeamKiller = objNull;  // this is not a public variable!  its just a global variable used to remember the Team Killer on respawn

// Client global variable - Group Management
groupManagmentActive = false;

// Client global variable - Missions
currentMissionsMarkers = [];

// Client global variable - Administrator (only the admin need this)
camadm = objNull;
camPos = 0;

// Need to remove this from the player icons
scannerBattery = 100;
ScannerProgress = 0;
scanningInProgress = false;

pvar_refuelVehicle = ["",0];
pvar_defuelVehicle = ["",0];

diag_log format["*** clientVars Finished ***"];
