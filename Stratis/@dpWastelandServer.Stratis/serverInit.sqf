
if(!isDedicated) exitWith {};

diag_log format["****** SERVER init Started ******"];

"pvar_createBaseObject" addPublicVariableEventHandler {[_this select 1] call createBaseObject};
"refuelVehicle" addPublicVariableEventHandler {
	
	_data = _this select 1;
	_currVehicle = _data select 0;
	_fuelAmount = _data select 1;
	if (_currVehicle != "") then 
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) + _fuelAmount);	
				if (_fuel > 1) then {_fuel = 1;};
				_obj setFuel _fuel;
				
				refuelVehicle = ["",0];
				publicVariable "refuelVehicle";
			};
		};
	};
};
"defuelVehicle" addPublicVariableEventHandler {
	
	_data = _this select 1;
	_currVehicle = _data select 0;
	_fuelAmount = _data select 1;
	if (_currVehicle != "") then 
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) - _fuelAmount);	
				if (_fuel < 0) then {_fuel = 0;};
				_obj setFuel _fuel;
				
				defuelVehicle = ["",0];
				publicVariable "defuelVehicle";
			};
		};
	};
};

//Execute Server Side Scripts.
[] call serverAdminList;
[] call serverVars;
[] call relations;
[] spawn serverTimeSync;
[] spawn broadcaster;

[] spawn {
	_objects = nearestObjects [getMarkerPos "Town_1", ["House_F"], 28000];
	{
		_x allowDamage false;
		_x enableSimulation false;
		_x setVariable ["R3F_LOG_disabled", true, true];
		sleep 0.01;
	} foreach _objects;
};

//Execute Server Spawning.
[] call vehicleSpawning;
[] call HeliSpawning;
[] call boxSpawning;
[] call boatSpawning;
[] call survivalObjectSpawning;
[] spawn respawnCheck;

//Execute Server Missions.
[] spawn sideMissionController;
[] spawn mainMissionController;

//Execute Server Cleanup.
[] spawn cleanObjects;
[] spawn cleanDead;

diag_log format["****** SERVER init Finshed ******"];