//	@file Version: 1.0
//	Name: createSeaMissionLocation.sqf
//	Author: AimZ =(dp)=
//	Created: 2/10/2014

if(!isServer) exitwith {};

// Get random zone (not restricted)
private ["_zoneNumber","_ZoneRestricted","_attempts","_zonePos","_zoneSize","_zoneWidth","_zoneHeight"];
_zoneNumber = 1;
_ZoneRestricted = true;
_attempts = 0;
while {(_ZoneRestricted && _attempts < 1000)} do
{
	// GET A RANDOM ZONE
	_zoneNumber = (floor (random (count pvar_gameZones)))+1;
	_zonePos = getMarkerPos format ["map_restriction_%1", _zoneNumber];
	_ZoneRestricted = [_zonePos] call isPosRestricted;		
	_attempts = _attempts + 1;
};

_zonePos = getMarkerPos format ["map_restriction_%1", _zoneNumber];
_zoneSize = getMarkerSize format ["map_restriction_%1", _zoneNumber];
_zoneWidth = _zoneSize select 0;
_zoneHeight = _zoneSize select 1;
_randomPos = [_zonePos,_zoneWidth,_zoneHeight,4,2,1,1] call findSafeRectPos;
		
_randomPos