//	@file Version: 1.0
//	@file Name: cleanDead.sqf
//	@file Author: AimZ =(dp)=
//	@file Created: 24/06/2013
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** cleanDead Started ***"];

private ["_bodyCount","_timeout"];

_bodyCount = 0;

while {true} do 
{
	{ 
		if (!(isNull _x)) then 
		{
			if (_x isKindOf "CAManBase" && !(alive _x) && !(isPlayer _x)) then
			{
				_bodyCount = _x getVariable ["newBodyCount",0];
				_timeout = _x getVariable ["timeout", time + 600];
				
				_x setVariable ["last_timeout", time, true];
				
				// initialise the body check..
				if (_bodyCount == 0) then 
				{
					_bodyCount = _bodyCount + 1;
					_x setVariable ["newBodyCount",_bodyCount,true];
					_x setVariable ["timeout", time + 600, true];
				};
				
				// make sure things stay above ground...
				//***LITE***_bodyPos = getPos player;
				//***LITE***_bodyPos set [2, 0.1];
				//***LITE***_x setPosATL _bodyPos; 
				
				// Clean up time...
				if(time > _timeout) then  
				{
					_x removeAllEventHandlers "GetIn";
					_x removeAllEventHandlers "killed";
					_x removeAllEventHandlers "HandleDamage";
					deleteVehicle _x;
				};
			};
		};
		
		sleep 1;
	} forEach allDeadMen;

	sleep 1;
};

diag_log format["*** cleanDead Finished ***"];