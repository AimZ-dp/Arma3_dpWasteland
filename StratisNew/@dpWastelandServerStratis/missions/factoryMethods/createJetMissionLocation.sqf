//	Name: createJetMissionLocation.sqf
//	Author: AimZ =(dp)=
//	Created: 2/10/2014

if(!isServer) exitwith {};

_areaArray = airportArray;
_area = _areaArray select (floor (random (count _areaArray)));
_position = _area select 2;
_radius = _area select 3;

_randomPos = [_position,1,_radius,3,0,1,0] call BIS_fnc_findSafePos;

_randomPos
