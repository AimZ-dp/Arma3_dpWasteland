
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 11/09/2012 04:23
//	@file Args:

disableSerialization;
private["_ui","_vitals","_hudVehicle","_decimalPlaces","_health","_tempString","_yOffset","_vehicle","_x","_y"];

diag_log format["*** playerHud Started ***"];

while {true} do
{
    1000 cutRsc ["WastelandHud","PLAIN"];
	_ui = uiNameSpace getVariable "WastelandHud";
	_vitals = _ui displayCtrl 3600;
	_hudVehicle = _ui displayCtrl 3601;
	_hudScanner = _ui displayCtrl 3602;
	
	//Calculate Health 0 - 100
	_decimalPlaces = 2;
	_health = damage player;
	_health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
	_health = 100 - (_health * 100);
	
	_vitals ctrlSetStructuredText parseText format ["%1 <img size='1.0' image='client\ui\icons\health.paa'/><br/>%2 <img size='1.0' image='client\ui\icons\water.paa'/><br/>%3 <img size='1.0' image='client\ui\icons\food.paa'/><br/>%4 <img size='1.0' image='client\ui\icons\money.paa'/>", _health, round (player getVariable ["thirst",0]), round (player getVariable ["hunger",0]), player getVariable ["cmoney",0]];
	_vitals ctrlCommit 0;

	_scanning = "...";
	if (scanningInProgress) then
	{
		_scanning = format["Scanning... %1 sec", ScannerProgress];
	}
	else
	{
		if (scannerBattery < 60) then 
		{
			_scanning = "Recharging Battery...";
		}
		else 
		{
			_scanning = "Scanner Available";
		};
	};
	
	_hudScanner ctrlSetStructuredText parseText format ["<img size='1.0' image='client\ui\icons\battery.paa'/> %1%2<br/>%3", scannerBattery, "%", _scanning];
	_hudScanner ctrlCommit 0;
			
	if(player != vehicle player) then
	{
		_tempString = "";
		_yOffset = 0.24;
		_vehicle = assignedVehicle player;

		{
			if((driver _vehicle == _x) || (gunner _vehicle == _x) || (commander _vehicle == _x)) then
			{
				if(driver _vehicle == _x) then
				{
					_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\driver.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				};
				if(gunner _vehicle == _x) then
				{
					_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\gunner.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				};
				if(commander _vehicle == _x) then
				{
					_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\commander.paa'/><br/>",_tempString, (name _x)];
					_yOffset = _yOffset + 0.04;
				}; 
			}
			else
			{
				_tempString = format ["%1 %2 <img size='1.0' image='client\ui\icons\cargo.paa'/><br/>",_tempString, (name _x)];
				_yOffset = _yOffset + 0.04;
			};    
		} forEach crew _vehicle;

		_hudVehicle ctrlSetStructuredText parseText _tempString;
		_x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
		_y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
		_hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
		_hudVehicle ctrlCommit 0;
	};
    sleep 1;
};

diag_log format["*** playerHud Finished ***"];
