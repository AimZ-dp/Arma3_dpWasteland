
// Args: type
// return a random location [pos, name, size]
//_Pos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
//_Size = getArray(configFile >> "CfgWorlds" >> worldName >> "mapSize");
	// airports
	// "cfgworlds" >> worldname >> (ilsPosition, ilsDirection, ilsTaxiOff, ilsTaxiIn)
	// class SecondaryAirports -> class Airstrip_x -> (ilsPosition, ilsDirection, ilsTaxiOff, ilsTaxiIn)
	
private ["_current","_name","_type","_position","_radiusA","_radiusB","_angle","_i"];

cityCenterArray = [];
cityArray = [];
localArray = [];
marineArray = [];
hillArray = [];
airportArray = [];
militaryArray = [];

_locations = configfile >> "cfgworlds" >> worldname >> "names";
for "_i" from 0 to (count _locations - 1) do 
{
	_current = _locations select _i;	
	_name = gettext(_current >> "name");
	_type = gettext(_current >> "type");
	_position = getarray(_current >> "position");		
	_radiusA = getNumber (_current >> "radiusA");
	_radiusB = getNumber (_current >> "radiusB");
	_angle = getNumber (_current >> "angle");

	// check if position is within a restricted zone
	_ZoneRestricted = [_position] call isPosRestricted;	
	if (!_ZoneRestricted) then
	{
		switch (_type) do 
		{
			case "CityCenter": {cityCenterArray set [count cityCenterArray, [_name,_type,_position,_radiusA,_radiusB,_angle]]};
			case "NameVillage";
			case "NameCity";
			case "NameCityCapital": {cityArray set [count cityArray, [_name,_type,_position,_radiusA,_radiusB,_angle]]};
			case "NameLocal": {localArray set [count localArray, [_name,_type,_position,_radiusA,_radiusB,_angle]]};
			case "NameMarine": {marineArray set [count marineArray, [_name,_type,_position,_radiusA,_radiusB,_angle]]};
			case "Hill": {hillArray set [count hillArray, [_name,_type,_position,_radiusA,_radiusB,_angle]]};
			default {};
		};
	};
};


// Collect Airport Data
_airports = configfile >> "cfgworlds" >> worldname >> "SecondaryAirports";
for "_i" from 0 to (count _airports) do 
{
	_name = format["airport_%1",_i];
	_type = "Airport";
	_radiusA = 300;
	_radiusB = 300;
	_angle = 0;
	
	if (_i == 0) then
	{
		_position = getArray(configfile >> "cfgworlds" >> worldname >> "ilsPosition");		
	}
	else
	{	
		_current = _airports select (_i - 1);	
		_position = getarray(_current >> "ilsPosition");		
	};
	
	// check if position is within a restricted zone
	_ZoneRestricted = [_position] call isPosRestricted;	
	if (!_ZoneRestricted) then
	{
		airportArray set [count airportArray, [_name,_type,_position,_radiusA,_radiusB,_angle]];
	};
};


_centerPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_mapSize =  getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize");
_list = nearestObjects [_centerPos, ["Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Cargo_HQ_V1_F",
						"Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F",
						"Land_Cargo_Patrol_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F",
						"Land_Dome_Big_F","Land_Dome_Small_F","Land_MilOffices_V1_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F",
						"Land_u_Barracks_V2_F","Land_Airport_center_F","Land_Airport_left_F","Land_Airport_right_F",
						"Land_Airport_Tower_F","Land_Hangar_F"], _mapSize/2];
{	
	_name = format["military_%1",_forEachIndex];
	_type = "Military";
	_position = getPos _x;		
	_radiusA = 20;
	_radiusB = 20;
	_angle = 0;
	
	_ZoneRestricted = [_position] call isPosRestricted;	
	if (!_ZoneRestricted) then
	{
		militaryArray set [count militaryArray, [_name,_type,_position,_radiusA,_radiusB,_angle]];
	};
} foreach _list;
			

publicVariable "cityArray";
publicVariable "marineArray";
publicVariable "airportArray";
publicVariable "militryArray";
true