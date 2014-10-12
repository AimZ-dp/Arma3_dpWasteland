
private ["_data","_class","_position","_player","_object"];

_data = _this select 0;

_class = _data select 0;
_position = _data select 1;
_player = _data select 2;

_object = [_position, _class, false, 30, false] call baseObjectCreation;	

_object allowDamage false;
_object enableSimulation false;
_object setVariable["R3F_LOG_disabled",false];

if (_object isKindOf "ReammoBox_F") then
{
	// remove weapons
	clearWeaponCargoGlobal _object;

	// remove ammo
	clearMagazineCargoGlobal _object;
	
	// remove all items
	clearItemCargoGlobal _object;
	
	// remove all backpacks
	clearBackpackCargoGlobal _object;
};


