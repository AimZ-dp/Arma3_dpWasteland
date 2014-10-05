//	@file Version: 1.0
//	@file Name: createJetMissionLocation.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_GotLoc","_randomIndex","_selectedMarker","_returnData"];

_GotLoc = false;
while {!_GotLoc} do
{
	_randomIndex = floor (random (count JetMissionSpawnMarkers));

	//If the index of the mission markers array is false then break the loop and finish up doing the mission
	if (!((JetMissionSpawnMarkers select _randomIndex) select 1)) then 
	{
		//	_this select 0: center position (Array)
		//	_this select 1: minimum distance from the center position (Number)
		//	_this select 2: maximum distance from the center position (Number)
		//	_this select 3: minimum distance from the nearest object (Number)
		//	_this select 4: water mode (Number)
		//						0: cannot be in water
		//						1: can either be in water or not
		//						2: must be in water
		//	_this select 5: maximum terrain gradient (average altitude difference in meters - Number)
		//	_this select 6: shore mode (Number):
		//						0: does not have to be at a shore
		//						1: must be at a shore
		_randomPos = getMarkerPos format ["Airport_%1", floor (random (count airportList)) + 1];
		_randomPos = [_randomPos,1,30,2,0,1,0] call BIS_fnc_findSafePos;
		
        _returnData = [_randomPos,_randomIndex];
		JetMissionSpawnMarkers select _randomIndex set[1, true];
		_GotLoc = true;
	};
	sleep 0.1;		//Original = 1.0
};
_returnData