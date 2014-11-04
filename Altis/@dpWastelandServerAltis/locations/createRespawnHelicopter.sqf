// create a set of waypoints (place all locations in an array, start at top and find closest)
_waypointlocations = + cityArray;
_startIndex = floor (random (count _waypointlocations));
_currentLocation = _waypointlocations select _startIndex;
_waypointlocations set [_startIndex, -1];
_waypointlocations = _waypointlocations - [-1];

_pos = _currentLocation select 2;
_pos set [2, 400];
_originalPos = _pos;

_group = createGroup civilian;
_vehicle = createVehicle ["I_Heli_Transport_02_F", _pos, [], 4, "FLY"];
_group addVehicle _vehicle;
_pilot = _group createUnit ["C_man_1_1_F", _pos, [], 0, "FLY"];
_pilot moveInDriver _vehicle;
_pilot allowFleeing 0;
_pilot setCaptive true;

_vehicle setVariable ["newVehicle",vChecksum,true];
_vehicle setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
_vehicle setVariable ["last_timeout", time, true];
_vehicle setVariable ["status", "alive", true];
_vehicle setVariable ["respawn", false, false];

// Make them indestructible
//_vehicle addEventHandler ["HandleDamage", {false}];
//_pilot addEventHandler ["HandleDamage", {false}];
_vehicle animateDoor ['door_R', 1]; 
_vehicle animateDoor ['door_L', 1];
_vehicle animateDoor ['door_back_R', 1];
_vehicle animateDoor ['door_back_L', 1];
_vehicle flyInHeight 200;

_waypoint = _group addWaypoint [_originalPos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_waypoint setWaypointCombatMode "BLUE"; 
_waypoint setWaypointBehaviour "CARELESS"; 
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
	_waypoint setWaypointCombatMode "NO CHANGE"; 
	_waypoint setWaypointBehaviour "NO CHANGE"; 
	_waypoint setWaypointFormation "NO CHANGE";
	_waypoint setWaypointSpeed "NO CHANGE";
};

_waypoint = _group addWaypoint [_originalPos, 0];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCombatMode "NO CHANGE"; 
_waypoint setWaypointBehaviour "NO CHANGE"; 
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointSpeed "NO CHANGE";
	
[_vehicle,_group,_pilot] spawn {
	
	_vehicle = _this select 0;
	_group = _this select 1;
	_pilot = _this select 2;

	while {(alive _vehicle) && (alive _pilot)} do 
	{
		_vehicle setFuel 1;
		
		_vehicle setVariable ["newVehicle",vChecksum,true];
		_vehicle setVariable ["timeout", (time + desertedTimeLimit + random maxRandomTimeLimit), true];
		_vehicle setVariable ["last_timeout", time, true];
		_vehicle setVariable ["status", "alive", true];
		_vehicle setVariable ["respawn", false, false];

		respawnHelicopter = _vehicle;
		publicVariable "respawnHelicopter";
		
		_pos = waypointPosition [_group, currentWaypoint _group];
		_pilot moveTo _pos;
		
		sleep 30;
	};
	
	[] spawn createRespawnHelicopter;
};


 
true