//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!isDedicated) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addUniform "U_B_CombatUniform_mcam_vest";
_leader addVest "V_PlateCarrier1_blk";
_leader addBackpack "B_AssaultPack_blk";			// CAD Added - He kinda needs a backpack if he should hold two rockets no? ;)
_leader addMagazine "RPG32_F";
_leader addMagazine "RPG32_HE_F";
_leader addWeapon "launch_RPG32_F";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addWeapon "arifle_TRG20_F";
_leader addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_leader setVariable["cmoney",floor(random 500),true];
_leader setVariable["canfood",floor(random 3),true];
_leader setVariable["medkits",floor(random 2),true];
_leader setVariable["water",floor(random 3),true];
_leader setVariable["repairkits",floor(random 2),true];


//Support
_man2 = _group createunit ["C_man_polo_1_F", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addUniform "U_B_CombatUniform_mcam_tshirt";
_man2 addVest "V_PlateCarrier1_blk";
_man2 addMagazine "200Rnd_65x39_cased_Box";
_man2 addMagazine "200Rnd_65x39_cased_Box";
_man2 addWeapon "LMG_Mk200_F";
_man2 addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_man2 setVariable["cmoney",floor(random 500),true];
_man2 setVariable["canfood",floor(random 3),true];
_man2 setVariable["medkits",floor(random 2),true];
_man2 setVariable["water",floor(random 3),true];
_man2 setVariable["repairkits",floor(random 2),true];

//Rifleman
_man3 = _group createunit ["C_man_polo_1_F", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addUniform "U_B_CombatUniform_mcam";
_man3 addVest "V_PlateCarrier1_blk";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "arifle_TRG20_F";
_man3 addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_man3 setVariable["cmoney",floor(random 500),true];
_man3 setVariable["canfood",floor(random 3),true];
_man3 setVariable["medkits",floor(random 2),true];
_man3 setVariable["water",floor(random 3),true];
_man3 setVariable["repairkits",floor(random 2),true];

//Rifleman
_man4 = _group createunit ["C_man_polo_1_F", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addUniform "U_B_CombatUniform_mcam";
_man4 addVest "V_PlateCarrier1_blk";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "arifle_TRG20_F";
_man4 addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_man4 setVariable["cmoney",floor(random 500),true];
_man4 setVariable["canfood",floor(random 3),true];
_man4 setVariable["medkits",floor(random 2),true];
_man4 setVariable["water",floor(random 3),true];
_man4 setVariable["repairkits",floor(random 2),true];

//Rifleman
_man5 = _group createunit ["C_man_polo_1_F", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man5 addUniform "U_B_CombatUniform_mcam";
_man5 addVest "V_PlateCarrier1_blk";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addMagazine "30Rnd_556x45_Stanag";
_man5 addWeapon "arifle_TRG20_F";
_man5 addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_man5 setVariable["cmoney",floor(random 500),true];
_man5 setVariable["canfood",floor(random 3),true];
_man5 setVariable["medkits",floor(random 2),true];
_man5 setVariable["water",floor(random 3),true];
_man5 setVariable["repairkits",floor(random 2),true];

//Marksman
_man6 = _group createunit ["C_man_polo_1_F", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man6 addUniform "U_B_CombatUniform_mcam_vest";
_man6 addVest "V_PlateCarrier1_blk";
_man6 addMagazine "30Rnd_65x39_caseless_mag";
_man6 addMagazine "30Rnd_65x39_caseless_mag";
_man6 addWeapon "arifle_MXM_Black_F";
_man6 addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_man6 setVariable["cmoney",floor(random 500),true];
_man6 setVariable["canfood",floor(random 3),true];
_man6 setVariable["medkits",floor(random 2),true];
_man6 setVariable["water",floor(random 3),true];
_man6 setVariable["repairkits",floor(random 2),true];

//Grenadier
_man7 = _group createunit ["C_man_polo_1_F", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man7 addUniform "U_B_CombatUniform_mcam";
_man7 addVest "V_PlateCarrier1_blk";
_man7 addMagazine "30Rnd_65x39_caseless_mag";
_man7 addMagazine "30Rnd_65x39_caseless_mag";
_man7 addMagazine "30Rnd_65x39_caseless_mag";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addMagazine "1Rnd_HE_Grenade_shell";
_man7 addWeapon "arifle_MX_GL_Black_F";
_man7 addEventHandler ["killed", {_this execVM "\@dpWastelandServerAltis\functions\enemyKilled.sqf"}];
_man7 setVariable["cmoney",floor(random 500),true];
_man7 setVariable["canfood",floor(random 3),true];
_man7 setVariable["medkits",floor(random 2),true];
_man7 setVariable["water",floor(random 3),true];
_man7 setVariable["repairkits",floor(random 2),true];

_leader = leader _group;
[_group, _pos] call defendArea;