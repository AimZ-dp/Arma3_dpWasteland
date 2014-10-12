//	Name: createMissionLocation.sqf
//	Author: AimZ =(dp)=
//	Created: 2/10/2014

if(!isServer) exitwith {};

// Get random zone (not restricted)
private ["_return","_zoneNumber","_ZoneRestricted","_attempts","_zonePos","_zoneSize","_zoneWidth","_zoneHeight"];
_returnZoneData = _this select 0;
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

// Get a random position within that zone
_zonePos = getMarkerPos format ["map_restriction_%1", _zoneNumber];
_zoneSize = getMarkerSize format ["map_restriction_%1", _zoneNumber];
_zoneWidth = _zoneSize select 0;
_zoneHeight = _zoneSize select 1;


_return = [_zonePos,_zoneWidth,_zoneHeight,4,0,1,0] call findSafeRectPos;
if (_returnZoneData) then
{
	_return = [_zonePos,_zoneWidth,_zoneHeight];
};

_return