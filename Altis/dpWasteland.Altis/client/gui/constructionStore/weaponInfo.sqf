
#include "dialog\constructionstoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay constructionshop_DIALOG;
_conlist = _dialog displayCtrl constructionshop_con_list;
_conpicture = _dialog displayCtrl constructionshop_con_pic;
_conlisttext = _dialog displayCtrl constructionshop_con_TEXT;
_conInfo = _dialog displayCtrl constructionshop_con_Info;

//Get Selected Item
_selectedItem = lbCurSel _conlist;
_itemText = _conlist lbText _selectedItem;

_conpicture ctrlSettext _picture;
_conlisttext ctrlSetText format [""];	

//Check Items Price
{if(_itemText == _x select 0) then{
	_weap_type = _x select 1; 
	_price = _x select 2;
    
	_weapon = (configFile >> "cfgWeapons" >> _weap_type);
    _conInfo ctrlSetStructuredText parseText (format ["%1<br/>%2",getText(_weapon >> "displayName"),getText(_weapon >> "descriptionShort")]);
    
    //_picture = getText(_weapon >> "picture");
	_picture = _x select 3;
	_conpicture ctrlSettext _picture;
    
	_conlisttext ctrlSetText format ["Price: $%1", _price];	
}}forEach baseObjectList;
