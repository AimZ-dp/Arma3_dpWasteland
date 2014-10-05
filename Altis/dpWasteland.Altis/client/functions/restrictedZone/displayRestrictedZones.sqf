//	Name: displayRestrictedZones.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:   [] call displayRestrictedZones;

private ["_markerName"];

{
	_markerName = format["map_restriction_%1",_x];

	if (_x in RestrictedZones) then
	{
		_markerName setMarkerShape "RECTANGLE";
		_markerName setMarkerBrush "FDiagonal";
		_markerName setMarkerColor "ColorRed";
		_markerName setMarkerType "Empty";
	}
	else
	{
		_markerName setMarkerShape "ICON";
		_markerName setMarkerBrush "Solid";
		_markerName setMarkerColor "ColorGreen";
		_markerName setMarkerType "Empty";
	};
	
	/*
	private ["_zonename","_zonePos","_zoneSize","_zoneL","_zoneR","_zoneT","_zoneB"];
	// mark out the corners of the zones
	_zonename = format["map_restriction_%1",_x];
	_zonePos = getMarkerPos _zonename;
	_zoneSize = getMarkerSize _zonename;
	// Map Coordinate L:0 -> R:30000, B:0 -> T:30000
	_zoneL = (_zonePos select 0) - (_zoneSize select 0);
	_zoneR = (_zonePos select 0) + (_zoneSize select 0);
	_zoneT = (_zonePos select 1) + (_zoneSize select 1);
	_zoneB = (_zonePos select 1) - (_zoneSize select 1);

	_markerName = format["marker_zone%1_LT",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, [_zoneL,_zoneT,0]];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerColorLocal "ColorWhite";
	_markerName setMarkerType "mil_destroy";
	
	_markerName = format["marker_zone%1_RT",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, [_zoneR,_zoneT,0]];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerColorLocal "ColorWhite";
	_markerName setMarkerType "mil_destroy";
	
	_markerName = format["marker_zone%1_LB",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, [_zoneL,_zoneB,0]];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerColorLocal "ColorWhite";
	_markerName setMarkerType "mil_destroy";

	_markerName = format["marker_zone%1_RB",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, [_zoneR,_zoneB,0]];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerColorLocal "ColorWhite";
	_markerName setMarkerType "mil_destroy";
	*/
} foreach Zones;

