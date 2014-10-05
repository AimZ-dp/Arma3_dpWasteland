//	@file Version: 1.0
//	@file Name: createSeaMissionLocation.sqf
//	@file Author: [404] Deadbeat, [CAD] Krycek
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_GotLoc","_randomIndex","_selectedMarker","_returnData"];

_GotLoc = false;
while {!_GotLoc} do
{
	_randomIndex = floor (random (count SeaMissionSpawnMarkers));

	//If the index of the mission markers array is false then break the loop and finish up doing the mission
	if (!((SeaMissionSpawnMarkers select _randomIndex) select 1)) then 
	{
		_selectedMarker = SeaMissionSpawnMarkers select _randomIndex select 0;
		_randomPos = getMarkerPos _selectedMarker;
        _returnData = [_randomPos,_randomIndex];
		SeaMissionSpawnMarkers select _randomIndex set[1, true];
		_GotLoc = true;
	};
	sleep 0.1;		//Original = 1.0
};
_returnData