//	Name: updateStoreMarkers.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:   [[markers],"Title"] call updateStoreMarkers;

private ["_markersArray","_markersTitle"];

_markersArray = _this select 0;
_markersTitle = _this select 1;

{
	private ["_markerName","_marker"];
	
	if (count _x > 1) then
	{
		// Circle zone    
		_markerName = format["%1_%2",_markersTitle,_forEachIndex];
		deleteMarkerLocal _markerName;
		_marker = createMarkerLocal [_markerName,_x];
		_markerName setMarkerShapeLocal "ELLIPSE";
		_markerName setMarkerColorLocal "ColorBlue";
		_markerName setMarkerSizeLocal [100, 100];
		_markerName setMarkerBrushLocal "Grid";
		_markerName setMarkerAlphaLocal 0.5;

		// store title    
		_markerName = format["%1_title_%2",_markersTitle,_forEachIndex];
		deleteMarkerLocal _markerName;
		_marker = createMarkerLocal [_markerName,_x];
		_markerName setMarkerShapeLocal "ICON";
		_markerName setMarkerTypeLocal "mil_dot";
		_markerName setMarkerColorLocal "ColorRed";
		_markerName setMarkerSizeLocal [1,1];
		_markerName setMarkerTextLocal _markersTitle;
	};
} forEach _markersArray;