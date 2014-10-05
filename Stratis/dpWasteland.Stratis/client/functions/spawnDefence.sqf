_enteredZone = false;
_countDown = 30;
while {alive player} do
{
	_spawn_marker = getMarkerPos "player_spawn";
	if (player distance _spawn_marker < 300) then
	{
		_enteredZone = true;
	}
	else
	{
		if (_enteredZone) then
		{
			hint format["DEATH COUNTDOWN STOPPED"];
			cutText ["","PLAIN",1];
		};
		_enteredZone = false;
		_countDown = 30;
	};
	
	if (_enteredZone) then 
	{
		hint format["DEATH COUNTDOWN - %1 SEC", _countDown];
		_countDown = _countDown - 1;
		if ((_countDown mod 4) == 2) then 
		{
			playSound "spawnWarning";
			cutText ["MOVE AWAY FROM SPAWN ISLAND! YOU WILL BE KILLED! ADMIN WILL BE NOTIFIED FOR A BAN!","PLAIN",4];
		};
		
		if (_countDown < 0) then 
		{
			player setDamage 1;
		};
	};
	
	sleep 1;
};
