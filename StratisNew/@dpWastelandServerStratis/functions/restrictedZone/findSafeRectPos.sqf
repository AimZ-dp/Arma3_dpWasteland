
/*
	File: findSafeRectPos.sqf
	Author: AimZ =(dp)=
	
	Source Script: findSafePos.sqf by Joris-Jan van 't Land

	Description:
	Function to retrieve and dynamic position in the world according to several parameters.

	Parameter(s):
	_this select 0: center position (Array)
	_this select 1: width of rectangle area (Number)
	_this select 2: height of rectange area (Number)
	_this select 3: minimum distance from the nearest object (Number)
	_this select 4: water mode (Number)
						0: cannot be in water
						1: can either be in water or not
						2: must be in water
	_this select 5: maximum terrain gradient (average altitude difference in meters - Number)
	_this select 6: shore mode (Number):
						0: does not have to be at a shore
						1: must be at a shore
	_this select 7: (optional) blacklist (Array of Arrays):
						(_this select 7) select X: Top-left and bottom-right coordinates of blacklisted area (Array)
	_this select 8: (optional) default positions (Array of Arrays):
						(_this select 8) select 0: default position on land (Array)
						(_this select 8) select 1: default position on water (Array)
	
	Returns:
	Coordinate array with a position solution.
*/

scopeName "main";

private ["_pos", "_width", "_height", "_objDist", "_waterMode", "_maxGradient", "_shoreMode", "_defaultPos", "_blacklist"];
_pos = _this select 0;
_width = _this select 1;
_height = _this select 2;
_objDist = _this select 3;
_waterMode = _this select 4;
_maxGradient = _this select 5;
_shoreMode = _this select 6;

if (_shoreMode == 0) then {_shoreMode = false} else {_shoreMode = true};

_blacklist = [];
if ((count _this) > 7) then 
{
	_blacklist = _this select 7;
};

_defaultPos = [];
if ((count _this) > 8) then 
{
	_defaultPos = _this select 8;
};

//See if default world values should be used.
if ((count _pos) == 0) then 
{
	_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "safePositionAnchor");
};
if ((count _pos) == 0) exitWith {debugLog "Log: [findSafeRectRos] No center position was passed!"; []}; //TODO: instead return defaults below.

//TODO: Validate parameters.

private ["_newPos", "_posX", "_posY"];
_newPos = [];
_posX = _pos select 0;
_posY = _pos select 1;

//Limit the amount of attempts at finding a good location.
private ["_attempts"];
_attempts = 0;
while {_attempts < 1000} do
{
	private ["_newX", "_newY", "_testPos"];
	
	// GET A RANDOM COORDINATES WITHIN RECT ZONE
	_newX = _posX + (random (_width * 2) - _width);
	_newY = _posY + (random (_height * 2) - _height);
	_testPos = [_newX, _newY];

	//Blacklist check.
	//TODO: Do not use function when the blacklist is empty?
	if (!([_testPos, _blacklist] call BIS_fnc_isPosBlacklisted)) then
	{
		if (!((count (_testPos isFlatEmpty [_objDist, 0, _maxGradient, _objDist max 5, _waterMode, _shoreMode, objNull])) == 0)) then 
		{
			_newPos = _testPos;
			breakTo "main";
		};
	};

	_attempts = _attempts + 1;
};

//No position was found, use defaults.
if ((count _newPos) == 0) then
{
	if (_waterMode == 0) then
	{
		if ((count _defaultPos) > 0) then 
		{
			_newPos = _defaultPos select 0;
		} 
		else 
		{
			//Use world Armory default position:
			_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "Armory" >> "positionStart");
		};
	}
	else
	{
		if ((count _defaultPos) > 1) then 
		{
			_newPos = _defaultPos select 1;
		} 
		else 
		{
			//Use world Armory default water position:
			_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "Armory" >> "positionStartWater");
		};
	};
};

if ((count _newPos) == 0) then 
{
	//Still nothing was found, use world center positions.
	_newPos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
};

_newPos