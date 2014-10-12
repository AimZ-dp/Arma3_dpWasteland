//	Name: isPosRestricted.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:   Bool = [Pos] call isPosRestricted;

private ["_Pos","_ZoneRestricted"];

_Pos = _this select 0;

_ZoneRestricted = false;

// is this location inside of any valid zones
{
	private ["_zonename","_zonePos","_zoneSize","_zoneL","_zoneR","_zoneT","_zoneB"];
	
	_zonename = format["map_restriction_%1",_x];
	_zonePos = getMarkerPos _zonename;
	_zoneSize = getMarkerSize _zonename;

	// Map Coordinate L:0 -> R:30000, B:0 -> T:30000
	_zoneL = (_zonePos select 0) - (_zoneSize select 0);
	_zoneR = (_zonePos select 0) + (_zoneSize select 0);
	_zoneT = (_zonePos select 1) + (_zoneSize select 1);
	_zoneB = (_zonePos select 1) - (_zoneSize select 1);

	if (((_Pos select 0) > _zoneL && (_Pos select 0) < _zoneR)
		&& ((_Pos select 1) < _zoneT && (_Pos select 1) > _zoneB)) then
	{
		// position is in this zone, check for restricted
		if (_x in pvar_restrictedZones) then
		{
			// this is not restricted
			_ZoneRestricted = true;
		};
	};	
} foreach pvar_gameZones;

_ZoneRestricted
