// Name:			initPlayerLocal.sqf
// Author:			AimZ =(dp)=
// Date:			9th Febuary 2014
// Description:  	Executed locally when player joins mission (includes both mission start and JIP).
//
// 					1. Functions with recompile param set to 1 are recompiled
// 					2. Functions with preInit param set to 1 are called
// 					3. Object Init Event Handlers are called
// 					4. Object initialization fields are called
// 					5. init.sqs is executed in singleplayer
// 					6. init.sqf is executed in singleplayer
// 					7. Persistent multiplayer functions are called (client only)
// 					8. Modules are initialized
// 					9. initServer.sqf is executed (server only)
// 					10. initPlayerLocal.sqf is executed
// 					11. initPlayerServer.sqf is executed (server only)
// 					12. Functions with postInit param set to 1 are called
// 					13. "BIS_fnc_init" variable is set to true
// 					14. init.sqs is executed in multiplayer
// 					15. init.sqf is executed in multiplayer
//
// params:
// 					[player:Object, didJIP:Boolean]

"*** initPlayerLocal Started ***" call BIS_fnc_log;

if (isServer) exitWith {["Warning: Shouldn't run initPlayerLocal.sqf on server!"] call BIS_fnc_error; false};

private ["_player", "_didJIP"];
_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_didJIP = [_this, 1, false] call BIS_fnc_param;   

["playing %1 just joined (%2)",name _player,_didJIP] call BIS_fnc_logFormat;

"*** initPlayerLocal Finished ***" call BIS_fnc_log;

true