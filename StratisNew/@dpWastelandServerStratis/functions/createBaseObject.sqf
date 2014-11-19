
private ["_data","_class","_position","_player","_object"];

_data = _this select 0;

_class = _data select 0;
_position = _data select 1;
_player = _data select 2;

_object = [_position, _class, false, 30, false] call baseObjectCreation;	

_object allowDamage false;
//_object enableSimulationGlobal false;

if (typeOf _object == "FlagPole_F") then
{
	_object setVariable ["timeout", time + 21600, true]; // 6 hours
	_object setVariable ["last_timeout", time, true];

	_object setVariable ["BASE_SIDE", civilian, true];	
	_object setVariable ["BASE_OWNER", -1, true];	
	_object setVariable ["BASE_USERS", [], true];	

	_object setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa";

	pvar_baseFlags set [count pvar_baseFlags, _object];
	publicVariable "pvar_baseFlags";
};

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


