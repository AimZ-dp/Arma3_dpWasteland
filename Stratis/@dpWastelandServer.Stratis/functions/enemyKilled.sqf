//Passed array: [unit, killer]
_unit = _this select 0;
_killer = _this select 1;

_inVehicle = (vehicle _killer != _killer);

if (!_inVehicle) then
{
	// the player is not in the vehicle
	_killer addScore 2; 
}
else 
{
	// the player is in the vehicle
	_killer addScore 2;  		// SHOULD REALLY GET DRIVER OR GUNNER OR POINTS TO ALL IN VEHICLE 
};