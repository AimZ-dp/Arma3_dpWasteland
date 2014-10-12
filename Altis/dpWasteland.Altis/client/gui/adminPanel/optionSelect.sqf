//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define serverAdminMenu_option 50007
#define dpModMenu_option 50005
disableSerialization;

private ["_uid","_panelType","_displaydpMod","_displayServerAdmin","_dpModSelect","_serverAdminSelect","_pos"];
_uid = getPlayerUID player;
if (_uid in dpModerators || _uid in serverdpAdministrators) then 
{
	_panelType = _this select 0;
	
	_displaydpMod = uiNamespace getVariable "dpModMenu";
	_displayServerAdmin = uiNamespace getVariable "ServerAdminMenu";
	
	if not(isNil "_displaydpMod") then {_dpModSelect = _displaydpMod displayCtrl dpModMenu_option;};
	if not(isNil "_displayServerAdmin") then {_serverAdminSelect = _displayServerAdmin displayCtrl serverAdminMenu_option;};
		
	switch (_panelType) do
	{
		case 0: //dpModerator panel
		{
			switch (lbCurSel _dpModSelect) do
			{
			    case 0: //Player Management
				{
	                closeDialog 0;
					execVM "client\gui\adminPanel\playerManagement.sqf";
				};
				case 1: //Object Management
				{
					closeDialog 0;
					execVM "client\gui\adminPanel\vehicleManagement.sqf";
				};
			};
		};
	    case 2: //Server dp Administrator panel
	    {
			switch (lbCurSel _serverAdminSelect) do
			{
			    case 0: //Player Management
				{
	                closeDialog 0;
					execVM "client\gui\adminPanel\playerManagement.sqf";
				};
				case 1: //Object Management
				{
	                closeDialog 0;
					execVM "client\gui\adminPanel\vehicleManagement.sqf";
				};
			    case 2: //Debugging Tags
			    {
					execVM "client\gui\adminPanel\playerTags.sqf";
			    };
			    case 3: //Teleport
			    {
	                closeDialog 0;    
	                hint "Click on map to teleport";
	                onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
			    };
	            case 4: //Money
			    {      
					player setVariable["cmoney", (player getVariable "cmoney")+500,true];
			    };
			    case 5: //Allow Player Icons
			    {      
					if (pvar_allowPlayerIcons == "ON") then
					{
						pvars_allowPlayerIcons = "OFF";					
					}
					else
					{
						pvars_allowPlayerIcons = "ON";
					};
					publicVariableServer "pvars_allowPlayerIcons";
				};
				case 6: //Allow Groups
			    {      
					if (pvar_allowGroups == "ON") then
					{
						pvars_allowGroups = "OFF";					
					}
					else
					{
						pvars_allowGroups = "ON";
					};
					publicVariableServer "pvars_allowGroups";
			    };
				case 7: //Day Cycle
			    {      
					if (pvar_clockCycle == "DAY ONLY") then
					{
						pvars_clockCycle = "DAY AND NIGHT";					
					}
					else
					{
						if (pvar_clockCycle == "DAY AND NIGHT") then
						{
							pvars_clockCycle = "NIGHT ONLY";					
						}
						else
						{
							pvars_clockCycle = "DAY ONLY";	
						};
					};
					publicVariableServer "pvars_clockCycle";
			    };
			};
	    };
	};
} else {
  exit;  
};