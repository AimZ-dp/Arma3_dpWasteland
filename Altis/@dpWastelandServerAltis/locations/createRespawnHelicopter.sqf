// create a set of waypoints (place all locations in an array, start at top and find closest)
_waypointlocations = + cityArray;
_currentLocation = _waypointlocations select 0;
_waypointlocations set [0, -1];
_waypointlocations = _waypointlocations - [-1];

_pos = _currentLocation select 2;
_pos set [2, 400];

_group = createGroup civilian;
_vehicle = createVehicle ["I_Heli_Transport_02_F", _pos, [], 4, "FLY"];
_group addVehicle _vehicle;
_pilot = _group createUnit ["C_man_1_1_F", _pos, [], 0, "FLY"];
_pilot moveInDriver _vehicle;

_vehicle setVariable ["newVehicle",vChecksum,true];
_vehicle setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_vehicle setVariable ["last_timeout", time, true];
_vehicle setVariable ["status", "alive", true];
_vehicle setVariable ["respawn", _respawn, false];

// Make them indestructible
_vehicle addEventHandler ["HandleDamage", {false}];
_pilot addEventHandler ["HandleDamage", {false}];
_vehicle animateDoor ['door_R', 1]; 
_vehicle animateDoor ['door_L', 1];
_vehicle animateDoor ['door_back_R', 1];
_vehicle animateDoor ['door_back_L', 1];
_vehicle flyInHeight 200;

_waypoint = _group addWaypoint [_pos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_waypoint setWaypointCombatMode "GREEN"; 
_waypoint setWaypointBehaviour "SAFE"; 
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "FULL";

while {count _waypointlocations > 0} do
{
	// loop each of the waypointlocations looking for the shortest distance
	_shortestIndex = -1;
	_lastDistance = 9999999999;
	{
		_distance = (_currentLocation select 2) distance (_x select 2);
		if (_distance < _lastDistance) then 
		{
			_shortestIndex = _forEachIndex;
			_lastDistance = _distance;
		};
	} foreach _waypointlocations;
	
	// make the shortest index the currentLocation and remove 
	_currentLocation = _waypointlocations select _shortestIndex;
	_waypointlocations set [_shortestIndex, -1];
	_waypointlocations = _waypointlocations - [-1];

	_pos = _currentLocation select 2;
	_pos set [2, 400];
	
	_waypoint = _group addWaypoint [_pos, 0];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointCompletionRadius 50;
	_waypoint setWaypointCombatMode "GREEN"; 
	_waypoint setWaypointBehaviour "SAFE"; 
	_waypoint setWaypointFormation "NO CHANGE";
	_waypoint setWaypointSpeed "FULL";
};

// add final cycle waypoint
_waypoint = _group addWaypoint [_currentLocation select 2, 0];
_waypoint setWaypointType "CYCLE";

respawnHelicopter = _vehicle;
publicVariable "respawnHelicopter";

[_vehicle,_group] spawn {
	_vehicle = _this select 0;
	_group = _this select 1;
	
	_vehicle setFuel 1;
	
	_vehicle setVariable ["newVehicle",vChecksum,true];
	_vehicle setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
	_vehicle setVariable ["last_timeout", time, true];
	_vehicle setVariable ["status", "alive", true];
	_vehicle setVariable ["respawn", _respawn, false];
	
	sleep 60;
};
 
true