//	Name: createConstructionStores.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:   Bool = [Pos] call isPosRestricted;


if(!isServer) exitWith {};

private ["_storesPerActiveZone","_locIndex","_numStores","_storeGuyPos"];

_storesPerActiveZone = _this select 0;
_locIndex = 0;
_storeGuyPos = [];

// Create a Gun Store in each Zone
{
	if (!(_x in pvar_restrictedZones)) then
	{
		for "_numStores" from 1 to _storesPerActiveZone do
		{
			// Check the array 
			_storeGuyPos = pvar_constructionStoreLocations select _locIndex;
	
			if (count _storeGuyPos < 2) then
			{
				// TODO: MAKE THIS A FUNCTION, ALSO USED IN createMissionLocation
				private ["_zonePos","_zoneSize","_zoneWidth","_zoneHeight","_randomPos"];
				_zonePos = getMarkerPos format ["map_restriction_%1", _x];
				_zoneSize = getMarkerSize format ["map_restriction_%1", _x];
				_zoneWidth = _zoneSize select 0;
				_zoneHeight = _zoneSize select 1;
				
				_posValid = false;
				while {!_posValid} do
				{				
					_randomPos = [_zonePos,_zoneWidth,_zoneHeight,4,0,1,0] call findSafeRectPos;
					//----------------------------------------------
					
					// OUTPUT THE POSITION TO THE LOG JUST INCASE POSITION WANTS TO BE SET PERMANENTLY
					["	Construction Store (zone %1): Generated Pos=%2", _x, _randomPos] call BIS_fnc_logFormat;
					
					if !(isOnRoad _randomPos) then
					{
						_posValid = true;
					};
				};
				
				_storeGuyPos = _randomPos;
			};
			
			// Get the nearest road and move to there
			private ["_dir","_roadlist","_minDistance"];
			_road = [_storeGuyPos, 1000, []] call BIS_fnc_nearestRoad;
			_dir = [_road, _storeGuyPos] call BIS_fnc_dirTo;

			private ["_gunStoreGroup","_storeGuy","_storeHouse","_storeLights","_tempPos"];
			// create a building
			_storeHouse = createVehicle ["Land_u_Shop_01_V1_F",_storeGuyPos,[],1,"NONE"]; 
			_storeHouse allowDamage false;
			_storeHouse setVariable["newVehicle",vChecksum,true];
			_storeHouse setVariable["R3F_LOG_disabled",false];
			_storeHouse setDir _dir;
			
			_tempPos = getPos _storeHouse;
			_tempPos set [0, (_tempPos select 0) + 10];
			_tempPos set [1, (_tempPos select 1) - 15];
			_storeLights = createVehicle ["Land_LampHalogen_F",_tempPos,[],1,"NONE"]; 
			_storeLights setDir 25;
			_storeLights allowDamage false;
			_storeLights setVariable["newVehicle",vChecksum,true];
			_storeLights setVariable["R3F_LOG_disabled",false];
			
			// Create the Guy same as in mission file
			_gunStoreGroup = createGroup civilian;
			_storeGuy = _gunStoreGroup createunit ["C_man_polo_5_F", _storeGuyPos, [], 1, "NONE"];
			_storeGuy setSkill 0.8;
			_storeGuy allowFleeing 0;
			_storeGuy setBehaviour "SAFE";
			_storeGuy setCombatMode "BLUE";
			_storeGuy addVest "V_PlateCarrier1_rgr";
			_storeGuy addEventHandler ["HandleDamage", {
					[_this select 0] spawn 
					{
						private ["_unit"];
						_unit = _this select 0;
						if (primaryWeapon _unit == "") then
						{
							_unit addMagazine "30Rnd_556x45_Stanag";
							_unit addWeapon "arifle_TRG20_F";
							_unit setBehaviour "AWARE";
							_unit setCombatMode "RED";
							sleep 30;
							_unit setBehaviour "SAFE";
							_unit setCombatMode "BLUE";
							_unit removeWeapon "arifle_TRG20_F";
						};
					};
					false}];
			
			// Create the markers for Guy on map
			pvar_constructionStoreLocations set [_locIndex, _storeGuyPos];
		
			// Control the guy
			[_storeGuy, _storeGuyPos, "con", _locIndex, _storeHouse] spawn controlStoreGuy;
			
			_locIndex = _locIndex + 1;
		};
	};
} foreach pvar_gameZones;

//Send store positions to the clients
publicVariable "pvar_constructionStoreLocations";
