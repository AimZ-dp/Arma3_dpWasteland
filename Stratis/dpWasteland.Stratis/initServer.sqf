// Name:			initServer.sqf
// Author:			AimZ =(dp)=
// Date:			9th Febuary 2014
// Description:  	Executed only on server when mission is started. 

"*** initServer Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run initServer.sqf on client!"] call BIS_fnc_error; false};

"*** initServer Finished ***" call BIS_fnc_log;

true