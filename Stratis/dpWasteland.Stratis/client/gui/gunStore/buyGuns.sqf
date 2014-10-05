
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;
if(gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

private ["_name"];

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;
			{
				if(_itemText == _x select 1) then
				{
					_class = _x select 0;
					_weapon = (configFile >> "cfgWeapons" >> _class);
					_type = getNumber(_weapon >> "type");
					_displayName = getText(_weapon >> "displayName");

					_playerSlots = [player] call BIS_fnc_invSlotsEmpty;
			
					//Primary Weapon
					if(_type == 1) then
					{
						//if((_playerSlots select 0) >= 1) then
						if ((primaryWeapon player) == "") then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 0 == _class) then{_price = _x select 2; _name = _x select 1;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
					
					//Side Arm
					if(_type == 2) then
					{
						//if((_playerSlots select 1) >= 1) then
						if ((handgunWeapon player) == "") then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 0 == _class) then{_price = _x select 2; _name = _x select 1;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
					
					//Launcher
					if(_type == 4) then
					{
						//if((_playerSlots select 2) >= 1) then
						if ((secondaryWeapon player) == "") then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 0 == _class) then{_price = _x select 2; _name = _x select 1;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
				};                    		
			}forEach weaponsArray;

			{
				if(_itemText == _x select 1) then
				{
					_class = _x select 0;
					_mag = (configFile >> "cfgMagazines" >> _class);
					_type = (getNumber(_mag >> "type"));
					_displayName = getText(_mag >> "displayName");
					
					if (player canAdd _class) then 
					{
						player addMagazine _class;
					}
					else
					{
						{if(_x select 0 == _class) then{_price = _x select 2; _name = _x select 1;};}forEach ammoArray;
						gunStoreCart = gunStoreCart - _price;
						hint format["You do not have space for this item %1",_name];  
						sleep 0.5;
					};
				}
			}forEach ammoArray;

			{
                if(_itemText == _x select 1) then
                {
                    _class = _x select 0;

					if (player canAdd _class) then 
					{
						if (_x select 3 == "binoc") then 
						{
							player addWeapon _class;
						};
						if (_x select 3 == "item") then 
						{
							player addItem _class;
						};						
					}
					else
					{
						{if(_x select 0 == _class) then{_price = _x select 2; _name = _x select 1;};}forEach accessoriesArray;
						gunStoreCart = gunStoreCart - _price;
						hint format["You do not have space for this item %1",_name];  
						sleep 0.5;
					};
				};
            }forEach accessoriesArray;
		};

		player setVariable["cmoney",_playerMoney - gunStoreCart,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
};
