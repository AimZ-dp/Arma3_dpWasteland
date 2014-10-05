//	@file Version: 1.0
//	@file Name: cleanLocalObjects.sqf
//	@file Author: AimZ =(dp)=
//	@file Created: 14/09/2013
//	@file Args:

if (isServer) exitWith {};

diag_log format["*** cleanLocalObjects Started ***"];

private ["_check","_checkCount","_timeout"];

_check = 0;
_checkCount = 0;

while {true} do 
{
	_allMObjects = allMissionObjects "All"; 
	{
		if (!(isNull _x)) then 
		{
			if (!(isPlayer _x) && !(_x isKindOf "CAManBase") && !(_x isKindOf "LandVehicle") && !(_x isKindOf "Helicopter")  && !(_x isKindOf "ReammoBox_F") && !(_x isKindOf "WeaponHolderSimulated") && !(_x isKindOf "GroundWeaponHolder") && !(_x isKindOf "Ship") && !(_x isKindOf "Plane")) then
			{
				_x allowDamage false;
				_x enableSimulation false;
			};
		
			if (local _x) then 
			{
				//_x setVariable ["last_timeout", time, true];
				diag_log format["local object: %1", typeOf _x];
				
				//if(!(_x isKindOf "CAManBase") and !(_x isKindOf "Logic")) then 
				if (_x isKindOf "CraterLong") then
				{
					_check = _x getVariable ["newLocalObject",0];
					_checkCount = _x getVariable ["newLocalObjectCount",0];
					_timeout = _x getVariable ["timeout", time + 240];	
					
					if (_check != vChecksum && _checkCount == 0) then 
					{
						_checkCount = _checkCount + 1;
						_x setVariable ["newLocalObjectCount",_checkCount,true];
						_x setVariable ["timeout", time + 24, true];
					};
				
					if(_check != vChecksum and time > _timeout) then
					{
						_x removeAllEventHandlers "GetIn";
						_x removeAllEventHandlers "killed";
						_x removeAllEventHandlers "HandleDamage";
						deleteVehicle _x;
					};
				};
			};
		};
		
		sleep 1;
	} forEach _allMObjects; 
	sleep 1;
};

diag_log format["*** cleanLocalObjects Finished ***"];