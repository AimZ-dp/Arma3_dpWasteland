
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (isServer) exitWith {}; 

diag_log format["*** playerSetup Started ***"];

//Player initialisation
player setskill 0;
player addrating 1000000;
player disableAI "move";
player disableAI "anim";
player disableAI "target";
player disableAI "autotarget";
player disableConversation true;
enableSentences false;

player setVariable["thirst",100,true];
player setVariable["hunger",100,true];
player setVariable["cmoney",250,true];
player setVariable["canfood",1,true];
player setVariable["medkits",1,true];
player setVariable["water",1,true];
player setVariable["repairkits",1,true];
player setVariable["fuelFull", 0, true];
player setVariable["fuelEmpty", 1, true];
player setVariable["spawnBeacon",0,true];

// remove everything
{player removeWeapon _x;} foreach weapons player;
player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
player playMove "aidlpercmstpsraswrfldnon_idlesteady01n";

removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

removeAllAssignedItems player;

switch (playerSide) do
{
	case west:
	{
		player addUniform "U_B_CTRG_3";
		player addHeadgear "H_Beret_blk";
		//player addBackpack "B_AssaultPack_mcamo";
	};
	case east:
	{
		player addUniform "U_O_CombatUniform_oucamo";
		player addHeadgear "H_Watchcap_camo";
		//player addBackpack "B_AssaultPack_blk";
	};
	case resistance:
	{
		player addUniform "U_IG_Guerilla1_1";
		player addHeadgear "H_Cap_grn";
		//player addBackpack "B_AssaultPack_ocamo";
	};
};

player addVest "V_Rangemaster_belt";
player addBackpack "B_AssaultPack_blk";					// Moved to individual factions for variety.

player addItem "ItemMap"; 
player assignItem "ItemMap"; 
player addItem "ItemCompass"; 
player assignItem "ItemCompass";
player addItem "ItemWatch"; 
player assignItem "ItemWatch"; 

// start the spawn dialog
sleep 2;
[] call playerSpawn;	
[] spawn spawnDefence;

player enableFatigue false;

player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_Rook40_F";
player selectWeapon "hgun_Rook40_F";
player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
player playMove "aidlpercmstpsraswrfldnon_idlesteady01n";

diag_log format["*** playerSetup Finished ***"];
