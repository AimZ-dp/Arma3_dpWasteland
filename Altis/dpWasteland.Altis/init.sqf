// Name:		init.sqf
// Author:		AimZ =(dp)=
// Date:		25th August 2013
// Description:  	Executed when mission is started (before briefing screen)

"*** init Started ***" call BIS_fnc_log;

versionName = "v2.7.7";

if(!isDedicated) then 
{
    diag_log format["*** Client Setup ***"];
	
	// Run Anti Hack Scripts	
	"THISISSPARTA" addPublicVariableEventHandler { [] spawn (_this select 1); };
	dat4ClientStarted = player;
	publicVariableServer "dat4ClientStarted";
	
	enableSaving[false,false]; 

	playerCompiledScripts = false;
	[] call compileFinal preprocessFileLineNumbers "client\functions\clientCompile.sqf";
	waitUntil{playerCompiledScripts};
	[] call clientInit;
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";

"*** init Finished ***" call BIS_fnc_log;

true