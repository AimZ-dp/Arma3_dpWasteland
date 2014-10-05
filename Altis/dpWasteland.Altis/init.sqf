// Name:		init.sqf
// Author:		AimZ =(dp)=
// Date:		25th August 2013
// Description:  	Executed when mission is started (before briefing screen)

"*** init Started ***" call BIS_fnc_log;

versionName = "v2.7";

modVersion = "build-2sgrd95";
vChecksum = 1;
{vChecksum = vChecksum + _x;} forEach (toArray modVersion); 


if(isServer) then 
{
	[] execVM "\@dpWastelandServerAltis\functions\PartialAntiCheats.sqf";
	
	diag_log format["*** Server Setup ***"];
	serverCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "\@dpWastelandServerAltis\functions\serverCompile.sqf";
	waitUntil{serverCompiledScripts};
	[] call serverInit;
};

if(!isDedicated) then 
{
    diag_log format["*** Client Setup ***"];
	enableSaving[false,false]; 

	playerCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "client\functions\clientCompile.sqf";
	waitUntil{playerCompiledScripts};
	[] call clientInit;
		
	"THISISSPARTA" addPublicVariableEventHandler { [] spawn (_this select 1); };
	dat4ClientStarted = player;
	publicVariableServer "dat4ClientStarted";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

"*** init Finished ***" call BIS_fnc_log;

true