private ["_allVehicles","_allMObjects","_check","_vehicleType"];

_allVehicles = vehicles;
_allMObjects = allMissionObjects "All";
	
{
	_check = _x getVariable ["newVehicle",0];
	if(_check != vChecksum) then 
	{
		_vehicleType = Format["%1",typeOf _x];
		if(!(_vehicleType isKindOf "Civilian") and !(_vehicleType isKindOf "SoldierWB") and !(_vehicleType isKindOf "SoldierEB") and !(_vehicleType isKindOf "Logic")) then {
			deleteVehicle _x;
		};
	};
} forEach _allMObjects; //_allVehicles;

player commandChat "All Hacked Vehicles Deleted";

closeDialog 0;
execVM "client\gui\adminPanel\vehicleManagement.sqf";
