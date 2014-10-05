//	@file Version: 1.0
//	@file Name: createMissionLocation.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_GotLoc","_randomIndex","_selectedMarker","_returnData"];

_GotLoc = false;
while {!_GotLoc} do 
{
	_randomIndex = floor (random (count MissionSpawnMarkers));

	//If the index of the mission markers array is false then break the loop and finish up doing the mission
	if (!((MissionSpawnMarkers select _randomIndex) select 1)) then 
	{
		// TODO: MAKE THIS A FUNCTION, ALSO USED IN CREATE STORES
		// Get random zone (not restricted)
		private ["_zoneNumber","_ZoneRestricted","_attempts","_zonePos","_zoneSize","_zoneWidth","_zoneHeight"];
		_zoneNumber = 1;
		_ZoneRestricted = true;
		_attempts = 0;
		while {(_ZoneRestricted && _attempts < 1000)} do
		{
			// GET A RANDOM ZONE
			_zoneNumber = (floor (random (count zones)))+1;
			_zonePos = getMarkerPos format ["map_restriction_%1", _zoneNumber];
			_ZoneRestricted = [_zonePos] call isPosRestricted;		
			_attempts = _attempts + 1;
		};

		_zonePos = getMarkerPos format ["map_restriction_%1", _zoneNumber];
		_zoneSize = getMarkerSize format ["map_restriction_%1", _zoneNumber];
		_zoneWidth = _zoneSize select 0;
		_zoneHeight = _zoneSize select 1;
		_randomPos = [_zonePos,_zoneWidth,_zoneHeight,2,0,1,0] call findSafeRectPos;
		//----------------------------------------------
		
        _returnData = [_randomPos,_randomIndex];
		MissionSpawnMarkers select _randomIndex set[1, true];
		_GotLoc = true;
	};
	sleep 1;
};
_returnData