//	@file Version: 1.0
//	@file Name: loadServerAdministratorMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define serverAdminMenu_option 50007
disableSerialization;

private ["_start","_displayServerAdmin","_serverAdminSelect","_panelOptions"];
_uid = getPlayerUID player;
if (_uid in serverdpAdministrators) then 
{
	//hint "Welcome =(dp)= Owner";
	
	_start = createDialog "ServerAdminMenu";
	
	_displayServerAdmin = uiNamespace getVariable "ServerAdminMenu";
	_serverAdminSelect = _displayServerAdmin displayCtrl serverAdminMenu_option;
	
	_panelOptions = ["Player Management",
					"Object Management",
					"Debugging Tags",
					"Teleport",
	                "Money",
					"Allow Player Icons",
					"Allow Groups",
					"Day Cycle"];
	
	{
		_serverAdminSelect lbAdd _x;
	} forEach _panelOptions;
} 
else 
{
  exit;  
};