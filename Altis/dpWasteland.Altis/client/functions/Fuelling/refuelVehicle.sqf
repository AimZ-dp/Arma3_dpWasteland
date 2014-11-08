

_currVehicle = _this select 0;
_fuelAmount = _this select 1;
if (_currVehicle != "") then 
{
	_obj = objectFromNetId _currVehicle;
	if (_obj != objNull) then
	{
		if (local _obj) then
		{
			_fuel = ((fuel _obj) + _fuelAmount);	
			if (_fuel > 1) then {_fuel = 1;};
			_obj setFuel _fuel;
		};
	};
};