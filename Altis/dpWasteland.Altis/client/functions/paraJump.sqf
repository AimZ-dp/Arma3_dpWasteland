
diag_log format["*** paraJump Started ***"];


_vehicle = vehicle player;
player action ["GetOut", _vehicle];
waitUntil {vehicle player == player};

sleep 1;

_chute = "Steerable_Parachute_F" createVehicle [0,0,0]; 
_chute setPos getPos player; 
player moveIndriver _chute;


diag_log format["*** paraJump Finished ***"];
