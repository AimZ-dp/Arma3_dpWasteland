
_vehicle = nearestobjects [player, ["Car", "Helicopter", "Tank", "Ship"], 4];
if (count _vehicle > 0) then
{
	_vehicle = _vehicle select 0;
};

_fuelAmount = 0.25;

switch true do {
	// NEED TO CALCULATE HOW FULL THE JERRY CAN IS AND SPARE SPACE (INSTEAD OF EMPTY/FULL)
	// NEED TO CALCULATE SIZE OF FUEL TANK COMPARED TO JERRY CAN
	case (_vehicle isKindOf "Air"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "Tank"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "Ship"): {_fuelAmount = 0.10;};
	case (_vehicle isKindOf "Motorcycle"): {_fuelAmount = 0.75;};
	case (_vehicle isKindOf "ATV_Base_EP1"): {_fuelAmount = 0.75;};
};

// NEED TO CHECK IF FUEL IN VEHICLE IS > JERRY CAN SIZE
if (fuel _vehicle > 0.10) then 
{
	if (player distance _vehicle < 4) then 
	{
        if(!(local _vehicle)) then 
		{
			defuelVehicle = [netId _vehicle,_fuelAmount];
			publicVariable "defuelVehicle";	
		} 
		else 
		{
			// NEED TO TRANSFER FUEL OVER TIME, IF INTERRUPTED ONLY PART OF FUEL SYPHONED
			_fuel = (fuel _vehicle) - _fuelAmount;
			if (_fuel < 0) then {_fuel = 0;};
			_vehicle setFuel _fuel;
		};
		
		player setVariable ["fuelFull",1,false]; 
		player setVariable["fuelEmpty",0,false];
		hint "Your jerry can is now full";
	}
	else
	{
		hint "Move closer to the vehicle!";
	};
}
else
{
	if (fuel _vehicle > 0) then
	{
		hint "Cannot syphon! Fuel is too low...";
	}
	else
	{
		hint "Cannot syphon! - Vehicle has no fuel left";
	};
};