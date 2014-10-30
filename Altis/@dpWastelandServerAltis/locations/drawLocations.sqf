
{
	// [_name,_type,_position,_radiusA,_radiusB,_angle]
    _markerName = format["city_marker_%1",_forEachIndex];
	_marker = createMarker [_markerName, _x select 2];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_x select 3, _x select 3];
	_marker setMarkerColor "ColorBlack";
    _marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.3; 
} foreach cityArray;

/*
{
	// [_name,_type,_position,_radiusA,_radiusB,_angle]
    _markerName = format["local_marker_%1",_forEachIndex];
	_marker = createMarker [_markerName, _x select 2];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_x select 3, _x select 3];
	_marker setMarkerColor "ColorYellow";
    _marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.3; 
} foreach localArray;

{
	// [_name,_type,_position,_radiusA,_radiusB,_angle]
    _markerName = format["marine_marker_%1",_forEachIndex];
	_marker = createMarker [_markerName, _x select 2];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [(_x select 3) * 2, (_x select 3) * 2];
	_marker setMarkerColor "ColorBlue";
    _marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.3; 
} foreach marineArray;

{
	// [_name,_type,_position,_radiusA,_radiusB,_angle]
    _markerName = format["airport_marker_%1",_forEachIndex];
	_marker = createMarker [_markerName, _x select 2];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_x select 3, _x select 3];
	_marker setMarkerColor "ColorOrange";
    _marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.3; 
} foreach airportArray;

{
	// [_name,_type,_position,_radiusA,_radiusB,_angle]
    _markerName = format["millitry_marker_%1",_forEachIndex];
	_marker = createMarker [_markerName, _x select 2];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_x select 3, _x select 3];
	_marker setMarkerColor "ColorGreen";
    _marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.5; 
} foreach militaryArray;
*/

