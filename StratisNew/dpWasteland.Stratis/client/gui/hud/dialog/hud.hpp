/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_website_idc 3603

class WastelandHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 1.1;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";
	
	class controlsBackground {
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; 
			h = 0.65;
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "";
			
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.20 / SafeZoneH)));
			w = 0.14; 
			h = 0.30;
			lineSpacing = 6;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "100 Status";
			class Attributes {
				align = "right";
			};
		};
		class WastelandHud_Website:w_RscText
		{
			idc = hud_website_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.66 / SafeZoneW)));
            y = safeZoneY + (safeZoneH * (1 - (0.04 / SafeZoneH)));
			w = 0.64; 
			h = 0.10;
			lineSpacing = 6;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			shadow = 2;
			text = "<t color='#c1c7ff' shadow='2' size='1.0'>dp Wasteland - dp-clan.enjin.com</t>";
			class Attributes {
				align = "right";
			};
		};
	};
};
