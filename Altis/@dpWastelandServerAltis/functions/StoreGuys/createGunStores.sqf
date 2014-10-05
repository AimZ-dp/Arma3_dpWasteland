//	Name: createGunStores.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:   Bool = [Pos] call isPosRestricted;


if(!isServer) exitWith {};

gunStoreLocations = [];

// Create a Gun Store in each Zone
{
	// TODO: MAKE THIS A FUNCTION, ALSO USED IN createMissionLocation
	private ["_zonePos","_zoneSize","_zoneWidth","_zoneHeight","_randomPos"];
	_zonePos = getMarkerPos format ["map_restriction_%1", _x];
	_zoneSize = getMarkerSize format ["map_restriction_%1", _x];
	_zoneWidth = _zoneSize select 0;
	_zoneHeight = _zoneSize select 1;
	_randomPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
	//----------------------------------------------

	private ["_gunStoreGroup","_storeGuy","_storeHouse","_storeLights"];

	// create a building
	_storeHouse = createVehicle ["Land_u_Shop_01_V1_F",_randomPos,[],1,"NONE"]; 
	_storeHouse setDir 0;
	_storeHouse allowDamage false;
	_storeHouse setVariable["newVehicle",vChecksum,true];
	_storeHouse setVariable["R3F_LOG_disabled",false];
	
	_tempPos = getPos _storeHouse;
	_tempPos set [0, (_tempPos select 0) + 10];
	_tempPos set [1, (_tempPos select 1) - 15];
	_storeLights = createVehicle ["Land_LampHalogen_F",_tempPos,[],1,"NONE"]; 
	_storeLights setDir 25;
	_storeLights allowDamage false;
	_storeHouse setVariable["newVehicle",vChecksum,true];
	_storeLights setVariable["R3F_LOG_disabled",false];
	
	// Create the Guy same as in mission file
	_gunStoreGroup = createGroup civilian;
	_gunStoreGroup setBehaviour "CARELESS";
	_storeGuy = _gunStoreGroup createunit ["C_man_polo_4_F", _randomPos, [], 1, "NONE"];
	//_storeGuy setSkill 0.8;
	_storeGuy addVest "V_PlateCarrier1_cbr";
	_storeGuy addEventHandler ["HandleDamage", {
			[_this select 0] spawn 
			{
				_unit = _this select 0;
				if (primaryWeapon _unit == "") then
				{
					_unit addMagazine "30Rnd_556x45_Stanag";
					_unit addWeapon "arifle_TRG20_F";
					_unit setCombatMode "RED";
					sleep 30;
					_unit setCombatMode "GREEN";
					_unit removeWeapon "arifle_TRG20_F";
				};
			};
		false}];
		
	// Create the markers for Guy on map
	_locIndex = count gunStoreLocations;
	gunStoreLocations set [_locIndex, _randomPos];
	
	// Control the guy
	[_storeGuy, _randomPos, "gun", _locIndex, _storeHouse] spawn controlStoreGuy;
	
} foreach zones;

//Send store positions to the clients
publicVariable "gunStoreLocations";
