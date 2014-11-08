if (isServer) exitWith {};  

diag_log format["*** createMenuActions Started ***"];

aActionsIDs = [];

aActionsIDs = aActionsIDs + [player addAction["Holster Weapon", {player action ["SwitchWeapon", player, player, 999];},[], 1, false, false, "", 'currentWeapon player != ""']];

//aActionsIDs = aActionsIDs + [player addAction["Scanner", "client\actions\useScanner.sqf", [], 1, false, false, "", 'scannerBattery > 60 && !scanningInProgress']];
aActionsIDs = aActionsIDs + [player addAction["Loot Dead Body", "client\gui\playerMenu\loadLootPlayerMenu.sqf", [], 1, false, false, "", '_object = nearestobjects [player, ["SoldierWB","SoldierEB","SoldierGB","Civilian_F"], 5]; if (count _object > 1) then {_object = _object select 1;} else {_object = player;}; player distance _object < 5 && !alive _object']];
aActionsIDs = aActionsIDs + [player addAction["Use The Gun Store", "client\gui\gunStore\loadGunStore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["C_man_polo_4_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Use The General Store", "client\gui\generalStore\loadGenStore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["C_man_polo_6_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Use The Construction Store", "client\gui\constructionStore\loadConstructionStore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["C_man_polo_5_F"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", '((player distance (nearestobjects [player, ["Land_fs_feed_F","Land_FuelStation_Feed_F", "Land_MetalBarrel_F"], 5] select 0)) < 5) AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];
aActionsIDs = aActionsIDs + [player addAction["Syphon Fuel", "client\actions\SyphonFuelTank.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Car", "Helicopter", "Tank"], 4] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1) AND vehicle player == player']];
aActionsIDs = aActionsIDs + [player addAction["Take food from Sack", "noscript.sqf", '_nobj = (nearestObjects [player, ["Land_Sacks_goods_F"],  5] select 0); _nobj setVariable["food",(_nobj getVariable "food")-1,true]; player setVariable["canfood",(player getVariable "canfood")+1,true]; player playmove "AinvPknlMstpSlayWrflDnon"; if(_nobj getVariable "food" < 1) then {hint "You have taken some food.\nFood sack is empty.";} else {hint format["You have taken some food.\n(Food left: %1)", (_nobj getVariable "food")];};',0,false,false,"",'player distance (nearestObjects [player, ["Land_Sacks_goods_F"],  5] select 0) < 5 and (player getVariable "canfood") < 3 and (nearestObjects [player, ["Land_Sacks_goods_F"],  5] select 0) getVariable "food" > 0']];
aActionsIDs = aActionsIDs + [player addAction["Take water from Canister","noscript.sqf",'_nobj = (nearestObjects [player, ["Land_CanisterPlastic_F"],  5] select 0);_nobj setVariable["water",(_nobj getVariable "water")-1,true];player setVariable["water",(player getVariable "water")+1,true];player playmove "AinvPknlMstpSlayWrflDnon";if(_nobj getVariable "water" < 1) then {hint "You have taken some water.\nCanister is empty.";}else{hint format["You have taken some water.\n(Water left: %1)", (_nobj getVariable "water")];};',0,false,false,"",'player distance (nearestObjects [player, ["Land_CanisterPlastic_F"],  5] select 0) < 5 and (player getVariable "water") < 4 and (nearestObjects [player, ["Land_CanisterPlastic_F"],  5] select 0) getVariable "water" > 0']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 1, false, false, "", 'mutexScriptInProgress']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FF0000"">Para Jump</t>"), "client\functions\paraJump.sqf", [], 10, false, false, "", "(vehicle player) isKindOf 'Helicopter' && ((getPos vehicle player) select 2) > 15"]];

// Flag Actions
aActionsIDs = aActionsIDs + [player addAction["<t color='#FFFF00'>Capture Base</t>","client\functions\bases\fn_baseAction.sqf",["CAPTURE"],1.5,true,true,"",'_nearestFlag = nearestObject [player, "FlagPole_F"]; _baseSide = _nearestFlag getVariable ["BASE_SIDE", civilian]; !(isNull _nearestFlag) && (_nearestFlag distance player < 5) && _baseSide != playerSide']];
aActionsIDs = aActionsIDs + [player addAction["<t color='#FFFF00'>Abandon Base</t>","client\functions\bases\fn_baseAction.sqf",["ABANDON"],1.5,true,true,"",'_nearestFlag = nearestObject [player, "FlagPole_F"]; _baseSide = _nearestFlag getVariable ["BASE_SIDE", civilian]; !(isNull _nearestFlag) && (_nearestFlag distance player < 5) && _baseSide == playerSide']];
aActionsIDs = aActionsIDs + [player addAction["<t color='#FFFF00'>Register Spawn</t>","client\functions\bases\fn_baseAction.sqf",["REGISTER"],1.5,true,true,"",'_nearestFlag = nearestObject [player, "FlagPole_F"];  _baseSide = _nearestFlag getVariable ["BASE_SIDE", civilian]; !(isNull _nearestFlag) && (_nearestFlag distance player < 5) && _baseSide == playerSide']];

playerMenuId = player addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], loadPlayerMenu,[],-10,false,false,"","local player"];	

// primary weapon after holster
private ["_currentPrimary"];
_currentPrimary = primaryWeapon player;
WeaponActionsId = player addAction[format ["Weapon %1", getText (configFile >> "cfgWeapons" >> (primaryWeapon player) >> "displayName")], {player action ["SwitchWeapon", player, player, 1];},[], 1, false, false, "", 'currentWeapon player == "" && primaryWeapon player != ""'];
while {alive player} do
{
	if (primaryWeapon player != _currentPrimary) then
	{
		player removeAction WeaponActionsId;
		WeaponActionsId = player addAction[format ["Weapon %1", getText (configFile >> "cfgWeapons" >> (primaryWeapon player) >> "displayName")], {player action ["SwitchWeapon", player, player, 1];},[], 1, false, false, "", 'currentWeapon player == "" && primaryWeapon player != ""'];
		_currentPrimary = primaryWeapon player;
	};
	sleep 1;
};
diag_log format["*** createMenuActions Finished ***"];