// Name:			initServer.sqf
// Author:			AimZ =(dp)=
// Date:			9th Febuary 2014
// Description:  	Executed only on server when mission is started. 

"*** initServer Started ***" call BIS_fnc_log;

if (!isDedicated) exitWith {["Warning: Shouldn't run initServer.sqf on client!"] call BIS_fnc_error; false};

if(isServer) then 
{
	[] execVM "\@dpWastelandServerAltis\functions\PartialAntiCheats.sqf";
	
	diag_log format["*** Server Setup ***"];
	serverCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\serverCompile.sqf";
	waitUntil{serverCompiledScripts};
	[] call serverInit;
};

"*** initServer Finished ***" call BIS_fnc_log;

true