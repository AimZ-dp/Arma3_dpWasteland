// Name:		onPlayerRespawn.sqf
// Author:		AimZ =(dp)=
// Date:		25th August 2013
// Descrition:		Executed locally when player repawns on all respawn types except 0 (NONE).
//
// params:
// 			[<newUnit>, <oldUnit>, <respawn>, <respawnDelay>]

"*** onPlayerRespawn Started ***" call BIS_fnc_log;

if (isServer) exitWith {["Warning: Shouldn't run onPlayerRespawn.sqf on server!"] call BIS_fnc_error; false};

private ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
_newUnit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;  
_corpse = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_respawn = [_this, 2, 3] call BIS_fnc_param;
_respawnDelay = [_this, 3, 0] call BIS_fnc_param;

["playing %1 just respawned!",name _newUnit] call BIS_fnc_logFormat;

titleText ["You were born to respawn...", "BLACK", 0];

// remove everything
//{player removeWeapon _x;} foreach weapons player;
//player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
//player playMove "aidlpercmstpsraswrfldnon_idlesteady01n";

//sleep 2;

// Player setup
[] call PlayerSetup;				// initialise players gear
[] spawn createMenuActions;			// add player menu items
[] spawn initSurvival; 

// **************************************
[] spawn 
{
	sleep 2;
	//waitUntil{!respawnDialogActive};
	
	if(!isNull pvar_PlayerTeamKiller) then 
	{
		pDialogTeamkiller = pvar_PlayerTeamKiller;
		pvar_PlayerTeamKiller = objNull;
		if (allowPlayerIcons == "ON") then
		{
			[] execVM "client\functions\createTeamKillDialog.sqf";
		};
	};
};
// **************************************

"*** onPlayerRespawn Finished ***" call BIS_fnc_log;

true