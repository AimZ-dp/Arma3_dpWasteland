//	Name: detectRestrictedZones.sqf
//	Author: AimZ =(dp)=
//	Date: 04/10/2014
//  Params:  

private ["_enteredZone","_countDown","_hndl"];
_enteredZone = false;
_countDown = 0;

while {alive player} do
{
	private ["_playerPos"];
	_playerPos = getPos player;

	if ([_playerPos] call isPosRestricted) then
	{
		_enteredZone = true;

		"colorCorrection" ppEffectEnable true; 
		"colorCorrection" ppEffectAdjust [1, 1.04, -0.004, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.0],  [0.5, 0.5, 0.5, 0.0]]; 
		"colorCorrection" ppEffectCommit 5;
	}
	else
	{
		cutText ["","PLAIN",1];
		_enteredZone = false;
		_countDown = 30;

		"colorCorrection" ppEffectEnable false; 
		"colorCorrection" ppEffectAdjust [1, 1, 0.0, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 0.0],  [0.0, 0.0, 0.0, 0.0]]; 
		"colorCorrection" ppEffectCommit 5;
	};
	
	if (_enteredZone) then 
	{
		_countDown = _countDown + 1;
		if ((_countDown mod 4) == 2) then 
		{
			playSound "spawnWarning";
			cutText ["Turn back, you've entered a radioactive area!","PLAIN",4];
					
			player setDamage (damage player) + 0.01;
		};
	};

	sleep 1;
};

// clear the message when dead
cutText ["","PLAIN",1];
