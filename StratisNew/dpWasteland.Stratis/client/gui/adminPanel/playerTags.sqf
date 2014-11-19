//	@file Version: 1.0
//	@file Name: playerTags.sqf
//	@file Author: Battleguns
//	@file Created: 20/11/2012 05:19
//	@file Args:

disableSerialization;

_uid = getPlayerUID player;
if (_uid in serverdpAdministrators) then {
	if (isnil "pvmkr") then {pvmkr = 0;}; if (pvmkr == 0) then {pvmkr = 1; hint "Player Markers ON";} else {pvmkr = 0; hint "Player Markers OFF";};
	
	_playerMarkers = [];
	while {pvmkr == 1} do
	{
		if (visibleMap) then
		{
			// add marker to map. save to list of players..
			{
				if (!(_x in _playerMarkers)) then
				{
					_position = getPos _x;
					_markerName = Format ["player_%1_pos", getPlayerUID _x];
					createMarkerLocal [_markerName, _position];
					_markerName setMarkerShapeLocal "ICON";
					_markerName setMarkerTypeLocal "mil_dot";
					_markerName setMarkerColorLocal "ColorWhite";
					_markerName setMarkerSizeLocal [1,1];
					_markerName setMarkerTextLocal name _x;	
					
					// add to array
					_playerMarkers set [count _playerMarkers, getPlayerUID _x]; 
				}
				else
				{
					_position = getPos _x;
					_markerName = Format ["player_%1_pos", getPlayerUID _x];
					_markerName setMarkerPosLocal _position;					
				};
			} forEach playableUnits;
			
			// remove markers from map, delete from array if no longer exists
			{
				_playerID = _x;
				_found = false;
				{
					if (getPlayerUID _x == _playerID) then {_found = true};
				} forEach playableUnits;
				if (!_found) then 
				{
					_markerName = Format ["player_%1_pos", _playerID];
					deleteMarkerLocal _markerName;
					_playerMarkers set [_forEachIndex, "DELETE_ME"];
				};
			} forEach _playerMarkers;		
			_playerMarkers = _playerMarkers - ["DELETE_ME"];
		}
		else
		{
			{
				_markerName = Format ["player_%1_pos", _x];
				deleteMarkerLocal _markerName;
			} forEach _playerMarkers;				
			_playerMarkers = [];
		};
		
		sleep 1;
	};
	
	{
		_markerName = Format ["player_%1_pos", _x];
		deleteMarkerLocal _markerName;
	} forEach _playerMarkers;		
	_playerMarkers = [];

} else {
  exit;  
};
