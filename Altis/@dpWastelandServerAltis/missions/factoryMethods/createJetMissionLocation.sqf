//	Name: createJetMissionLocation.sqf
//	Author: AimZ =(dp)=
//	Created: 2/10/2014

if(!isServer) exitwith {};

_randomPos = getMarkerPos format ["Airport_%1", floor (random (count pvar_airportList)) + 1];
_randomPos = [_randomPos,1,30,3,0,1,0] call BIS_fnc_findSafePos;

_randomPos
