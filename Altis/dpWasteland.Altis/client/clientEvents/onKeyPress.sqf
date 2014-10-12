
//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
	
_handled = false;

//U key
if (_dikCode == 22) then
{
	[] call checkAdmin;
	_handled = true;
};

//tilde ~ key
if (_dikCode == 41) then
{
	[] call loadPlayerMenu;
	_handled = true;
};
/*
if (!_shift && !_ctrlKey && !_alt) then
{
	if (_dikCode in (actionKeys "Gear")) then
	{
		player action ["Gear", objNull];
		_handled = true;
	};
};

if (_shift && !_ctrlKey && !_alt) then
{
	if (_dikCode in (actionKeys "Gear")) then
	{
		nul = [] call loadPlayerMenu;
		_handled = true;
	};
};
*/	
if (_dikCode in (actionKeys "GetOver")) then
{
	if (speed player > 1 && isTouchingGround player && !JumpStarted && stance player != "PRONE") then 
	{
		// CHECK FOR LYING DOWN
		JumpStarted = true;
		[] spawn 
		{
			_vel = velocity player;
			// Make player enter crouch and increase upward velocity
			player playAction "JumpOff";
			player setVelocity [(_vel select 0),(_vel select 1),(_vel select 2)+4];
			waituntil {!(isTouchingGround player)};
			sleep 0.1;
			waituntil {isTouchingGround player};
			// Put player in a forward run, otherwise player pauses on landing
			player setVelocity [(_vel select 0),(_vel select 1),0];
			player playActionNow "FastF";
			JumpStarted = false;
		};
		
		_handled = true;
	};
};

_handled;  
