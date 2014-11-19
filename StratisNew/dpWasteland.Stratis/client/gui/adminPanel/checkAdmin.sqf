//	@file Version: 1.0
//	@file Name: checkAdmin.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_uid"];

_uid = getPlayerUID player;
if ((_uid in dpModerators) || (_uid in serverdpAdministrators)) then
{
    if ((_uid in dpModerators)) then
    {

	[] call loadServerModeratorMenu;	
    };
    if (_uid in serverdpAdministrators) then 
    {
	[] call loadServerAdministratorMenu;		
    };
} 
else 
{
	[] call checkAdmin2;
};