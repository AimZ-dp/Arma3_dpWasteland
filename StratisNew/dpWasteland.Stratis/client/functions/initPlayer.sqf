
diag_log format["*** initialisePlayer Started ***"];

// Create the blackout
//titleText ["Welcome to dp Wasteland, please wait for your player to setup", "BLACK", 0];

// Remove player from Group
if(count units group player > 1) then
{  
	[player] joinSilent grpNull;    
};

// Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};



diag_log format["*** initialisePlayer Finished ***"];