//	@file Version: 1.0
//	@file Name: spawnAction.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: [int(type of spawn)]

diag_log format["*** spawnAction Started ***"];

_switch = _this select 0;
_button = _this select 1;

switch(_switch) do 
{
    case 0:{
		[] spawn spawnRandom;
	};
    case 1:{
		[_button] spawn spawnInTown;
	}; 
    case 2:{
		[] spawn spawnInHeli;
	}; 
    case 3:{
		[] spawn spawnOnBaseFlag;
	}; 
};

if(isNil{client_firstSpawn}) then 
{
	client_firstSpawn = true;
	[] spawn welcomeMessage;
	
	//******************************************    
    true spawn 
	{      
		sleep 180;
		if(playerSide in [west, east]) then 
		{
			_found = false;
			{
				if(_x select 0 == playerUID) then 
				{
					_found = true;
				};
			} forEach pvar_teamSwitchList;
			if(!_found) then 
			{
				pvar_teamSwitchList set [count pvar_teamSwitchList, [playerUID, playerSide]];
				publicVariable "pvar_teamSwitchList";
                
                _side = "";
                if(str(playerSide) == "WEST") then 
				{
                    _side = "Blufor";
                };
                
                if(str(playerSide) == "EAST") then 
				{
                    _side = "Opfor";
                };
                
				titleText [format["You have been locked to %1",_side],"PLAIN",0];
			};
		};
	};
	//******************************************
};

diag_log format["*** spawnAction Finished ***"];