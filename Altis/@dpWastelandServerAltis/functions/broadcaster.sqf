//	@file Version: 1.0
//	@file Name: broadcaster.sqf
//	@file Author: [404] Deadbeat, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** broadcaster Started ***"];

_localAllowPlayerIcons = "update";
_localAllowGroups = "update";
_localClockCycle = "update";

while {true} do 
{
	publicVariable "currentInvites";

    sleep 2; 
};

diag_log format["*** broadcaster Finished ***"];