// draw players tag and name (a coloured icon) for each player with 1000m

if (isnil "pvmkr") then {pvmkr = 0;};

while {true} do
{
	_iconArray = [];
	_nameArray = [];
	{  
		_uid = getPlayerUID player;		
		if (pvmkr == 1 && _uid in serverdpAdministrators) then 
		{
			if (_x != player) then
			{
				_playerPos = visiblePosition _x;
				_playerDistance = _playerPos distance player;
				if (_playerDistance <= 1500) then
				{
					_iconArray set [count _iconArray, _x];
				};
			
				_target = cursorTarget;
				if (_playerDistance <= 1500 && _target == _x && player == vehicle player) then
				{	
					_nameArray set [count _nameArray, _x];				
				};
			};
		}
		else 
		{
			if (_x != player) then 
			{		
				_isFriendly = ((playerSide != resistance && side _x == playerSide) || (playerSide == resistance && _x in units player));

				if (_isFriendly) then
				{
					_playerPos = visiblePosition _x;
					_playerDistance = _playerPos distance player;

					_maxDistance = 1000;
					if (pvar_allowPlayerIcons == "OFF" || !_isFriendly) then 
					{
						_maxDistance = 600;
					};
					
					if (pvar_allowPlayerIcons == "ON" && _playerDistance <= _maxDistance) then
					{
						_iconArray set [count _iconArray, _x];
					};
				
					_target = cursorTarget;
					if (_playerDistance <= 600 && _target == _x && player == vehicle player) then
					{	
						_nameArray set [count _nameArray, _x];				
					};
				};
			};	
		};
		sleep 0.1;
	} forEach allUnits;
	//} forEach playableUnits;
	
	iconArray = + _iconArray;
	nameArray = + _nameArray;
	
	sleep 1;
};