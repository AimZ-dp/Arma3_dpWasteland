
diag_log format["*** paraJump Started ***"];


_vehicle = vehicle player;

if (_vehicle isKindOf 'Helicopter') then
{
	player action ["GetOut", _vehicle];
	waitUntil {vehicle player == player};

	sleep 1;

	_pos = position _vehicle;
	_chute = "Steerable_Parachute_F" createVehicle _pos; 
	_chute enableSimulation true;
	_chute setPos (getPos player); 
	player moveIndriver _chute;
};

diag_log format["*** paraJump Finished ***"];
