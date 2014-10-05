
//	@file Version: 1.0
//	@file Name: populateSwitch.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

_dialog = findDisplay genstore_DIALOG;
_iteminv = _dialog displayCtrl genstore_iteminventory;

_switchText = Ctrltext _iteminv;

if(_switchText == "Inventory") then
{
	[_switch] execVM "client\gui\generalStore\getInventory.sqf";
} else {	
	[_switch] execVM "client\gui\generalStore\populateGenStore.sqf";
};