//	@file Version: 1.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
#define respawn_PlayersInTown_Text0 3408
#define respawn_PlayersInTown_Text1 3409
#define respawn_PlayersInTown_Text2 3410
#define respawn_PlayersInTown_Text3 3411
#define respawn_PlayersInTown_Text4 3412

#define respawn_Base_Button 3413
#define respawn_Heli_Button 3414

diag_log format["*** loadRespawnDialog Started ***"];

waitUntil{!isnil "bis_fnc_init"};
disableSerialization;

private["_display","_respawnText","_missionUptimeText","_side","_dynamicControlsArray","_button","_friendlyTowns","_friendlyCount","_enemyCount","_tempArray","_timeText","_name","_enemyPresent","_text", "_players", "_playerArray"];

respawnDialogActive = true;

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];
_respawnText = _display displayCtrl respawn_Content_Text;
_missionUptimeText = _display displayCtrl respawn_MissionUptime_Text;

if(playerSide == west) then {_side = "Blufor"};
if(playerSide == east) then {_side = "Opfor"};
if(playerSide == resistance) then {_side = "Independent"};
_respawnText ctrlSetStructuredText parseText (format["You are on %1.<br/>Please select a spawn point.",_side]);

_dynamicControlsArray = [
	[respawn_Town_Button0,respawn_PlayersInTown_Text0],
    [respawn_Town_Button1,respawn_PlayersInTown_Text1],
    [respawn_Town_Button2,respawn_PlayersInTown_Text2],
    [respawn_Town_Button3,respawn_PlayersInTown_Text3],
    [respawn_Town_Button4,respawn_PlayersInTown_Text4]];

{
    _button = _display displayCtrl (_x select 0);
    _button ctrlSetText format[""];
    _button ctrlShow false;
}foreach _dynamicControlsArray;

_friendlyTowns = [];
_friendlyCount = 0;
_enemyCount = 0;
_tempArray = [];

while {respawnDialogActive} do
{
    _timeText = [time/60/60] call BIS_fnc_timeToString;
    _missionUptimeText ctrlSetText format["Mission Uptime: %1", _timeText];

	ctrlEnable [respawn_Base_Button, false];
	if ((isNull respawnHelicopter)
		|| respawnHelicopter emptypositions "cargo" < 1) then
	{
		ctrlEnable [respawn_Heli_Button, false];	
	}
	else
	{
		ctrlEnable [respawn_Heli_Button, true];
	};
	
    if(_side != "Independent") then
    {  
            {
                _pos = _x select 2;
                _name = _x select 0;
                _rad = _x select 3;
                _playerArray = [];

                {
                    if((getPos _x distance _pos) < _rad) then
                    {
                        if(side _x == playerSide AND alive _x) then
                        {
                            _friendlyCount = _friendlyCount + 1;
                            _playerArray set [count _playerArray, name _x];      
                        }else{
                            _enemyCount = _enemyCount + 1;
                        };
                    }; 
                }forEach playableUnits;  

                if((_friendlyCount > 0) AND (_enemyCount == 0)) then
                {
                    _friendlyTowns set [count _friendlyTowns, [_name, _playerArray]];                    
                };
                _friendlyCount = 0;
                _enemyCount = 0; 
                
            }forEach cityArray; 

            {
                _button = _display displayCtrl (_x select 0);
                _text = _display displayCtrl (_x select 1);
                
                if(_forEachIndex <= count _friendlyTowns -1) then
                {
                	// Set the button details
                    _button ctrlShow true;
                    _name = _friendlyTowns select _forEachIndex select 0;
                    _button ctrlSetText	format["%1",_name]; 
                    // Set the players in town text details
                    _text ctrlShow true;
                    _players = _friendlyTowns select _forEachIndex select 1;
                    _text ctrlSetText format["%1",_players]; 
                } else {
                    _name = "";
                    // reset button text and disable
                    _button ctrlSetText _name;
                    _button ctrlShow false; 
                    // reset players text and disable
                    _text ctrlSetText _name;
                    _text ctrlShow false; 
                };          
            }forEach _dynamicControlsArray;
            
            _friendlyTowns = [];    
    };
    
    if((count units group player > 1) AND (_side == "Independent")) then
    {
        _tempArray = [];
        {
        	_tempArray set [count _tempArray,getPlayerUID _x];    
        }forEach units player;
                    
        //Towns
    	   	{
                _pos = _x select 2;
                _name = _x select 0;
                _rad = _x select 3;

                {
                    if((getPos _x distance _pos) < _rad) then
                    {
                        if(getPlayerUID _x in _tempArray) then
                        {
                            _friendlyCount = _friendlyCount + 1;
                        }else{
                            _enemyCount = _enemyCount + 1;
                        };
                    };
                }forEach playableUnits;

                if((_friendlyCount > 0) AND (_enemyCount == 0)) then
                {
                    _friendlyTowns set [count _friendlyTowns, _name];
                };
                _friendlyCount = 0;
                _enemyCount = 0; 
            }forEach cityArray; 

            {
                _button = _display displayCtrl (_x select 0);
                if(_forEachIndex <= count _friendlyTowns -1) then
                {
                    _button ctrlShow true;
                    _name = _friendlyTowns select _forEachIndex;
                    _button ctrlSetText	format["%1",_name];  
                } else {
                    _name = "";
                    _button ctrlSetText _name;
                    _button ctrlShow false; 
                };          
            }forEach _dynamicControlsArray;
            _friendlyTowns = [];    
    };
    sleep 0.1;
};

_display displayRemoveAllEventHandlers "KeyDown";

diag_log format["*** loadRespawnDialog Finished ***"];