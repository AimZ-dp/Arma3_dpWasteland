
#include "dialog\constructionstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay constructionshop_DIALOG;
_conlisttext = _dialog displayCtrl constructionshop_con_TEXT;
_conpicture = _dialog displayCtrl constructionshop_con_pic;
_conlist = _dialog displayCtrl constructionshop_con_list;								
_conInfo = _dialog displayCtrl constructionshop_con_Info;

switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _conlist;
		_conlist lbSetCurSel -1;
		_conpicture ctrlSettext "";
		_conlisttext ctrlSettext "";
        _conInfo ctrlSetStructuredText parseText "";

		// Populate the gun shop weapon list
		{
			_conlistIndex = _conlist lbAdd format["%1",_x select 0];
		} forEach baseObjectList;
	};
};