//	Name: init.sqf
//	Author: AimZ =(dp)=

if(isServer) exitWith {};

diag_log format["****** clientInit Started ******"];

// Public variable events
"currentDate" addPublicVariableEventHandler {[] call timeSync};
"messageSystem" addPublicVariableEventHandler {[] call serverMessage};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"pvar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

"allowPlayerIcons" addPublicVariableEventHandler {hint format["Player Icons %1", allowPlayerIcons];};
"allowGroups" addPublicVariableEventHandler {if(allowGroups == "OFF") then {[player] joinSilent grpNull;}; hint format["Groups %1", allowGroups];};
"clockCycle" addPublicVariableEventHandler {hint format["Day Night Cycle %1", clockCycle];};

"gunStoreLocations" addPublicVariableEventHandler {[gunStoreLocations,"Weapon Store"] call updateStoreMarkers};
"generalStoreLocations" addPublicVariableEventHandler {[generalStoreLocations,"General Store"] call updateStoreMarkers};
"constructionStoreLocations" addPublicVariableEventHandler {[constructionStoreLocations,"Construction Store"] call updateStoreMarkers};

//"zones" addPublicVariableEventHandler {[] call updateStoreMarkers};
//"restrictedZones" addPublicVariableEventHandler {[] call updateStoreMarkers};

"refuelVehicle" addPublicVariableEventHandler {
	_data = _this select 1;_currVehicle = _data select 0;_fuelAmount = _data select 1;
	if (_currVehicle != "") then 
	{
		_obj = objectFromNetId _currVehicle;
		if (_obj != objNull) then
		{
			if (local _obj) then
			{
				_fuel = ((fuel _obj) + _fuelAmount);
				if (_fuel > 1) then 
				{
					_fuel = 1;
				};
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

// Initialise
[] call clientVars;
[] call briefing;

// wait for the player to be ingame before continuing
waitUntil {!(isNull player)};
waitUntil {vehicle player == player};
waitUntil {!visibleMap};
sleep 2;

// One time only setup
[] call initPlayer;	

// Update map markers
[] call createTownMarkers;

//[] call createGunStoreMarkers;
//[] call createGeneralStoreMarkers;
//[] call createConstructionStoreMarkers;

[] call updateMissionsMarkers; 

/*
[] spawn {
	_objects = nearestObjects [getMarkerPos "Town_1", ["House_F"], 28000];
	{
		_x allowDamage false;
		_x enableSimulation false;
		sleep 0.01;
	} foreach _objects;
};
*/


sleep 2;

// Define keyboard shortcuts
[] call createKeyboardEvent; 

// Start HUD drawing
[] spawn rechargeScanner;
[] spawn playerHud;
[] spawn drawPlayerIcons;
[] spawn getPlayerData;
[] spawn getDebugData;

//[] spawn cleanLocalObjects;


diag_log format["******** clientInit Finished ********"];
