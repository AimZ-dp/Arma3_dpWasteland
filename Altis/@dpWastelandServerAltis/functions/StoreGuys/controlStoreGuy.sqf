//	Name: controlStoreGuy.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:   Bool = [Pos] call isPosRestricted;

if(!isServer) exitWith {};

private ["_guy","_location","_guyObject","_position","_type","_locIndex","_building"];

_guy = _this select 0;
_position = _this select 1;
_type = _this select 2;
_locIndex = _this select 3;
_building = _this select 4;

//_guy disableAI "TARGET"; 
//_guy disableAI "AUTOTARGET"; 
//_guy disableAI "MOVE"; 
//_guy DisableAI "ANIM"; 
_guy disableAI "FSM"; 

while {true} do 
{
	// TODO: GET THE STORE GUY TO UPDATE HIS POSTION EVERY 60 MINS
	_guy doMove getpos _building;
	
	private ["_currentPosition"];
	_currentPosition = getPos _guy;
	
	if (_type == "gun") then
	{
		gunStoreLocations set [_locIndex, _currentPosition];
		publicVariable "gunStoreLocations";
	};
	if (_type == "gen") then
	{
		generalStoreLocations set [_locIndex, _currentPosition];
		publicVariable "generalStoreLocations";
	};	
	if (_type == "con") then
	{
		constructionStoreLocations set [_locIndex, _currentPosition];
		publicVariable "constructionStoreLocations";
	};
	
	sleep 10;
};
