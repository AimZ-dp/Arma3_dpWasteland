//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, AimZ =(dp)= , [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** serverVar Started ***"];

burningTimeLimit = 90;			// 1.5 Mins
desertedTimeLimit = 1800;		// 30 Mins
ammoDesertedTimeLimit = 1800;
maxRandomTimeLimit = 600;
objectTimeOut = 600; 			// Unwanted Objects - 10 Mins
baseObjectTimeOut = 3600;		// Base Objects - 1 Hour
baseRadius = 50;

maxVehicles = 160;
maxHelicopters = 10;
maxBoats = 10;
maxAmmoBoxes = 20;
maxSurvivalObjects = 10;

pvar_teamSwitchList = [];
pvar_teamKillList = [];

clientMissionMarkers = [];

currentDate = [];
currentInvites = [];

// set the game to be tactical - no groups, no permanent team tags, no teamkill kicks.
pvar_allowPlayerIcons = "ON";
pvar_allowGroups = "ON";
pvar_clockCycle = "DAY ONLY";

pvar_gameZones = [1,2,3,4];
pvar_restrictedZones = [];
storesPerActiveZone = 1;
pvar_gunStoreLocations = [[],[],[],[]]; // Empty array will be randomised 
pvar_generalStoreLocations = [[],[],[],[]];
pvar_constructionStoreLocations = [[],[],[],[]];

pvar_respawnHelicopter = objNull;
pvar_baseFlags = [];

//Sea
Boat_Armed_01_base_F = [
    "O_Boat_Armed_01_hmg_F"			// Speedboat HMG		// Gunboat with HMG and GMG.
];
Boat_Armed_01_minigun_base_F = [
    "B_Boat_Armed_01_minigun_F",	// Speedboat Minigun	// Gunboat with Minigun and GMG.
    "I_Boat_Armed_01_minigun_F"		// Speedboat Minigun	// Gunboat with Minigun and GMG.
];
Rubber_duck_base_F = [
    "B_G_Boat_Transport_01_F",		// Assault Boat			// Zodiac? Black!
    "O_Boat_Transport_01_F",		// Assault Boat			// Zodiac? Woodland Camo!
    "I_Boat_Transport_01_F",		// Assault Boat			// Zodiac? Digi Camo!
    "B_Lifeboat",					// Rescue Boat			// Zodiac? Orange!
    "O_Lifeboat",					// Rescue Boat			// Zodiac? Orange!
    "C_Rubberboat",				// Rescue Boat			// Zodiac? Blue/White!
    "B_Boat_Transport_01_F"			// Assault Boat			// Zodiac? Black!
];
Boat_Civil_01_base_F = [
    "C_Boat_Civil_01_F",			// Motorboat			// Speedboat Civilian.
    "C_Boat_Civil_01_rescue_F",		// Motorboat (Rescue)	// Speedboat Rescue.
    "C_Boat_Civil_01_police_F"		// Motorboat (Police)	// Speedboat Police.
];
SDV_01_base_F = [
    "B_SDV_01_F",					// SDV					// Minisub Grey.
    "O_SDV_01_F",					// SDV					// Minisub Woodland Camo.
    "I_SDV_01_F"					// SDV					// Minisub Digi Camo.
];

//Air
LightHelicopters = [
    "B_Heli_Light_01_F",        	// *MH-9 - Hummingbird
    "O_Heli_Light_02_unarmed_F", 	// *PO-30 - Ocra (Unarmed)
	"I_Heli_light_03_unarmed_F",	// *WY-55 - Hellcat (Unarmed)
	"C_Heli_Light_01_civil_F"
];
ArmedLightHelicopters = [
    "B_Heli_Light_01_armed_F",  	// *AH-9 - Pawnee
	"I_Heli_light_03_F",			// *WY-55 - Hellcat
    "O_Heli_Light_02_F",         	// *PO-30 - Ocra
	"O_Heli_Light_02_v2_F"			// *PO-30 - Ocra (B&W)
];
TransportHelicopters = [
    "I_Heli_Transport_02_F",	  	// *CH-49 - Mohawk
	"B_Heli_Transport_03_unarmed_F",  
	"O_Heli_Transport_04_F"
];
ArmedTransportHelicopters = [
    "B_Heli_Transport_01_F",      	// *UH-80 - Ghosthawk
    "B_Heli_Transport_01_camo_F", 	// *UH-80 - Ghosthawk
	"B_Heli_Transport_03_F"
];
AttackHelicopters = [
    "B_Heli_Attack_01_F",       	// *AH-99 - Blackfoot
    "O_Heli_Attack_02_F",      		// *Mi-48 - Kajman
    "O_Heli_Attack_02_black_F"		// *Mi-48 - Kajman
];
ArmedFighterPlanes = [
    "B_Plane_CAS_01_F",             // *A-164 Wipeout CAS
    "O_Plane_CAS_02_F",             // *To-199 Neophron CAS
    "I_Plane_Fighter_03_AA_F",		// *A-143 Buzzard AA
    "I_Plane_Fighter_03_CAS_F"		// *A-143 Buzzard CAS
];
Parachutes = [
	"B_B_Parachute_02_F",
	"B_O_Parachute_02_F",
	"B_I_Parachute_02_F",
	"B_Parachute_02_F",
	"O_Parachute_02_F",
	"I_Parachute_02_F"
];

//Ground
Quadbikes = [
    "B_Quadbike_01_F",		//Quadbike_01_base_F
    "O_Quadbike_01_F",
    "C_Quadbike_01_F",
    "I_Quadbike_01_F",
    "B_G_Quadbike_01_F"
];
Cars = [
    "C_Offroad_01_F",			//Offroad_01_base_F
    "B_G_Offroad_01_F",
    "B_G_Offroad_01_armed_F",	
    "C_SUV_01_F",				//SUV_01_base_F
    "C_Hatchback_01_F",			//Hatchback_01_base_F
    "C_Hatchback_01_sport_F"
];
SupportTrucks = [
    "C_Van_01_fuel_F",
    "B_G_Van_01_fuel_F",
    "B_Truck_01_ammo_F",
    "B_Truck_01_fuel_F",	
	"B_Truck_01_medical_F",
    "B_Truck_01_Repair_F",
	"C_Offroad_01_repair_F",
	"B_G_Offroad_01_repair_F",
    "O_Truck_03_Ammo_F",          // Tempest	
    "O_Truck_03_fuel_F",            // Tempest
    "O_Truck_03_medical_F",         // Tempest
    "O_Truck_03_repair_F",          // Tempest
    "I_Truck_02_ammo_F",
    "O_Truck_02_Ammo_F",
    "I_Truck_02_fuel_F",
    "O_Truck_02_fuel_F",
    "I_Truck_02_medical_F",
	"O_Truck_02_medical_F"
];
Trucks = [
    "C_Van_01_box_F",				//Van_01_base_F
    "C_Van_01_transport_F",
    "B_G_Van_01_transport_F",
    "B_Truck_01_box_F",				//Truck_01_base_F
    "B_Truck_01_covered_F",
    "B_Truck_01_mover_F",
    "B_Truck_01_transport_F",
    "O_Truck_02_box_F",				//Truck_02_base_F
    "O_Truck_02_covered_F",
    "O_Truck_02_transport_F",
    "I_Truck_02_box_F",
    "I_Truck_02_covered_F",
    "I_Truck_02_transport_F",
    "O_Truck_03_covered_F",         //Truck_03_base_F
    "O_Truck_03_device_F",          
    "O_Truck_03_transport_F"       
];
UnarmedMRAPVehicles = [
	"B_MRAP_01_F", 					//MRAP_01_base_F
	"O_MRAP_02_F", 					//MRAP_02_base_F
	"I_MRAP_03_F"					//MRAP_03_base_F
];
ArmedMRAPVehicles = [
	"B_MRAP_01_gmg_F", 				
	"B_MRAP_01_hmg_F", 
	"O_MRAP_02_gmg_F", 				
	"O_MRAP_02_hmg_F", 
	"I_MRAP_03_gmg_F", 				
	"I_MRAP_03_hmg_F"
];
ArmouredPersonnelCarriers = [
    "B_APC_Wheeled_01_cannon_F",	//Wheeled_APC_F
    "O_APC_Wheeled_02_rcws_F",		
    "I_APC_Wheeled_03_cannon_F",	
	"I_APC_tracked_03_cannon_F",	//APC_Tracked_03_base_F
    "B_APC_Tracked_01_rcws_F",		//APC_Tracked_01_base_F
    "B_APC_Tracked_01_CRV_F",
    "B_APC_Tracked_01_AA_F",
    "O_APC_Tracked_02_cannon_F",	//APC_Tracked_02_base_F
    "O_APC_Tracked_02_AA_F"	
];
MainBattleTanks = [
    "B_MBT_01_cannon_F",			//MBT_01_base_F
	"B_MBT_01_TUSK_F",
    "B_MBT_01_arty_F",
    "B_MBT_01_mlrs_F",
    "O_MBT_02_arty_F",				//MBT_02_base_F
    "O_MBT_02_cannon_F",
	"I_MBT_03_cannon_F"				//MBT_03_base_F
];
//Unmanned
UnmannedAirVehicles = [
    "B_UAV_01_F",					//UAV_01_base_F
    "O_UAV_01_F",
    "I_UAV_01_F",
    "B_UAV_02_F",
    "O_UAV_02_F",					//UAV_02_base_F
    "I_UAV_02_F",
    "B_UAV_02_CAS_F",
    "O_UAV_02_CAS_F",
    "I_UAV_02_CAS_F"
];
UnmannedGroundVehicles = [
    "B_UGV_01_F",					//UGV_01_base_F
    "O_UGV_01_F",
    "I_UGV_01_F",
    "B_UGV_01_rcws_F",
    "O_UGV_01_rcws_F",
    "I_UGV_01_rcws_F"
];

survivalObjectList = [
	"Land_Sacks_goods_F",			//Stall_base_F
	"Land_MetalBarrel_F",			//Items_base_F
	"Land_CanisterPlastic_F"
];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = [
		//"launch_NLAW_F",
		//"launch_RPG32_F",
		//"launch_B_Titan_F",
		//"launch_I_Titan_F",
		//"launch_O_Titan_F",
		//"launch_B_Titan_short_F",
		//"launch_I_Titan_short_F",
		//"launch_O_Titan_short_F",
		//"srifle_DMR_01_F",
		//"srifle_EBR_F",
		//"srifle_GM6_F",
		//"srifle_GM6_camo_F",
		//"srifle_LRR_F",
		//"srifle_LRR_camo_F",
		//"LMG_Mk200_F",	
		//"LMG_Zafir_F",
	"hgun_ACPC2_F",
	"hgun_P07_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_Rook40_F",
	"hgun_Pistol_Signal_F",
		//"arifle_Katiba_F",
		//"arifle_Katiba_C_F",
		//"arifle_Katiba_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20C_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20C_plain_F",
		//"arifle_MXC_F",
		//"arifle_MX_F",
		//"arifle_MX_GL_F",
		//"arifle_MX_SW_F",
		//"arifle_MXM_F",
		//"arifle_MX_Black_F",
		//"arifle_MX_GL_Black_F",
		//"arifle_MXC_Black_F",
		//"arifle_MX_SW_Black_F",
		//"arifle_MXM_Black_F",
	"arifle_SDAR_F",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"hgun_PDW2000_F",
	"SMG_01_F",
	"SMG_02_F"
];

//weapons to remove from ammo crates
removeWeapons = [
		//"launch_NLAW_F",
		//"launch_RPG32_F",
		//"launch_B_Titan_F",
		//"launch_I_Titan_F",
		//"launch_O_Titan_F",
		//"launch_B_Titan_short_F",
		//"launch_I_Titan_short_F",
		//"launch_O_Titan_short_F",
		//"srifle_DMR_01_F",
	"srifle_DMR_01_ACO_F",
	"srifle_DMR_01_MRCO_F",
	"srifle_DMR_01_SOS_F",
	"srifle_DMR_01_DMS_F",
	"srifle_DMR_01_DMS_snds_F",
	"srifle_DMR_01_ARCO_F",
		//"srifle_EBR_F",
	"srifle_EBR_ACO_F",
	"srifle_EBR_MRCO_pointer_F",
	"srifle_EBR_ARCO_pointer_F",
	"srifle_EBR_SOS_F",
	"srifle_EBR_ARCO_pointer_snds_F",
	"srifle_EBR_DMS_F",
	"srifle_EBR_Hamr_pointer_F",
	"srifle_EBR_DMS_pointer_snds_F",
		//"srifle_GM6_F",
	"srifle_GM6_SOS_F",
	"srifle_GM6_LRPS_F",
		//"srifle_GM6_camo_F",
	"srifle_GM6_camo_SOS_F",
	"srifle_GM6_camo_LRPS_F",
		//"srifle_LRR_F",
	"srifle_LRR_SOS_F",
	"srifle_LRR_LRPS_F",
		//"srifle_LRR_camo_F",
	"srifle_LRR_camo_SOS_F",
	"srifle_LRR_camo_LRPS_F",
		//"LMG_Mk200_F",	
	"LMG_Mk200_MRCO_F",
	"LMG_Mk200_pointer_F",
		//"LMG_Zafir_F",
	"LMG_Zafir_pointer_F",
		//"hgun_ACPC2_F",
		//"hgun_P07_F",
		//"hgun_Pistol_heavy_01_F",
		//"hgun_Pistol_heavy_02_F",
		//"hgun_Rook40_F",
		//"hgun_Pistol_Signal_F",
	"hgun_ACPC2_snds_F",
	"hgun_P07_snds_F",
	"hgun_Pistol_heavy_01_snds_F",
	"hgun_Pistol_heavy_01_MRD_F",
	"hgun_Pistol_heavy_02_Yorris_F",
	"hgun_Rook40_snds_F",
		//"arifle_Katiba_F",
		//"arifle_Katiba_C_F",
		//"arifle_Katiba_GL_F",
	"arifle_Katiba_C_ACO_pointer_F",
	"arifle_Katiba_C_ACO_F",
	"arifle_Katiba_C_ACO_pointer_snds_F",
	"arifle_Katiba_ACO_F",
	"arifle_Katiba_pointer_F",
	"arifle_Katiba_ACO_pointer_F",
	"arifle_Katiba_ARCO_F",
	"arifle_Katiba_ARCO_pointer_F",
	"arifle_Katiba_ACO_pointer_snds_F",
	"arifle_Katiba_ARCO_pointer_snds_F",
	"arifle_Katiba_GL_ACO_F",
	"arifle_Katiba_GL_ARCO_pointer_F",
	"arifle_Katiba_GL_ACO_pointer_F",
	"arifle_Katiba_GL_Nstalker_pointer_F",
	"arifle_Katiba_GL_ACO_pointer_snds_F",
		//"arifle_Mk20_F",
		//"arifle_Mk20C_F",
		//"arifle_Mk20_GL_F",
		//"arifle_Mk20_plain_F",
	"arifle_Mk20_pointer_F",
	"arifle_Mk20_Holo_F",
	"arifle_Mk20_ACO_F",
	"arifle_Mk20_ACO_pointer_F",
	"arifle_Mk20_MRCO_F",
	"arifle_Mk20_MRCO_pointer_F",
		//"arifle_Mk20C_plain_F",
	"arifle_Mk20C_ACO_F",
	"arifle_Mk20C_ACO_pointer_F",
    "arifle_Mk20_GL_plain_F",
	"arifle_Mk20_GL_MRCO_pointer_F",
	"arifle_Mk20_GL_ACO_F",
	"arifle_Mk20_MRCO_plain_F",
		//"arifle_MXC_F",
		//"arifle_MX_F",
		//"arifle_MX_GL_F",
		//"arifle_MX_SW_F",
		//"arifle_MXM_F",
	"arifle_MX_pointer_F",
	"arifle_MX_Holo_pointer_F",
	"arifle_MX_Hamr_pointer_F",
	"arifle_MX_ACO_pointer_F",
	"arifle_MX_ACO_F",
	"arifle_MX_ACO_pointer_snds_F",
	"arifle_MX_RCO_pointer_snds_F",
		//"arifle_MX_Black_F",
	"arifle_MX_GL_ACO_F",
	"arifle_MX_GL_ACO_pointer_F",
	"arifle_MX_GL_Hamr_pointer_F",
	"arifle_MX_GL_Holo_pointer_snds_F",
		//"arifle_MX_GL_Black_F",
	"arifle_MXC_Holo_F",
	"arifle_MXC_Holo_pointer_F",
	"arifle_MXC_ACO_F",
	"arifle_MXC_Holo_pointer_snds_F",
	"arifle_MXC_SOS_point_snds_F",
	"arifle_MXC_ACO_pointer_snds_F",
	"arifle_MXC_ACO_pointer_F",
		//"arifle_MXC_Black_F",
	"arifle_MX_SW_pointer_F",
	"arifle_MX_SW_Hamr_pointer_F",
		//"arifle_MX_SW_Black_F",
	"arifle_MXM_Hamr_pointer_F",
	"arifle_MXM_SOS_pointer_F",
	"arifle_MXM_RCO_pointer_snds_F",
	"arifle_MXM_DMS_F",
		//"arifle_MXM_Black_F",
	"arifle_MX_GL_Black_Hamr_pointer_F",
	"arifle_MX_Black_Hamr_pointer_F",
	"arifle_MX_SW_Black_Hamr_pointer_F",
		//"arifle_SDAR_F",
		//"arifle_TRG21_F",
		//"arifle_TRG20_F",
		//"arifle_TRG21_GL_F",
	"arifle_TRG21_ACO_pointer_F",
	"arifle_TRG21_ARCO_pointer_F",
	"arifle_TRG21_MRCO_F",
	"arifle_TRG20_Holo_F",
	"arifle_TRG20_ACO_pointer_F",
	"arifle_TRG20_ACO_Flash_F",
	"arifle_TRG20_ACO_F",
	"arifle_TRG21_GL_MRCO_F",
	"arifle_TRG21_GL_ACO_pointer_F",
		//"hgun_PDW2000_F",
	"hgun_PDW2000_snds_F",
	"hgun_PDW2000_Holo_F",
	"hgun_PDW2000_Holo_snds_F",
		//"SMG_01_F",
	"SMG_01_Holo_F",
	"SMG_01_Holo_pointer_snds_F",
	"SMG_01_ACO_F",
		//"SMG_02_F",
	"SMG_02_ACO_F",
	"SMG_02_ARCO_pointg_F"
];

removeAmmo = [	
 /*
	"Laserbatteries",
	// Ammo
    "7Rnd_408_Mag",
	"30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag_Tracer_Red",
    "30Rnd_556x45_Stanag_Tracer_Green",
    "30Rnd_556x45_Stanag_Tracer_Yellow",
    "20Rnd_556x45_UW_mag",
	"30Rnd_65x39_caseless_mag",
    "30Rnd_65x39_caseless_green",
    "30Rnd_65x39_caseless_mag_Tracer",
    "30Rnd_65x39_caseless_green_mag_Tracer",
	"100Rnd_65x39_caseless_mag",
    "100Rnd_65x39_caseless_mag_Tracer",
    "200Rnd_65x39_cased_Box",
    "200Rnd_65x39_cased_Box_Tracer",
	"30Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
	// Rockets
    "RPG32_F",
    "RPG32_HE_F",
    "NLAW_F",
    "Titan_AA",
    "Titan_AP",
    "Titan_AT",
	// UGL Ammo
	"1Rnd_HE_Grenade_shell",
    "3Rnd_HE_Grenade_shell",
    "1Rnd_Smoke_Grenade_shell",
    "3Rnd_Smoke_Grenade_shell",
    "1Rnd_SmokeRed_Grenade_shell",
    "1Rnd_SmokeGreen_Grenade_shell",
    "1Rnd_SmokeYellow_Grenade_shell",
    "1Rnd_SmokePurple_Grenade_shell",
    "1Rnd_SmokeBlue_Grenade_shell",
    "1Rnd_SmokeOrange_Grenade_shell",
    "3Rnd_SmokeRed_Grenade_shell",
    "3Rnd_SmokeGreen_Grenade_shell",
    "3Rnd_SmokeYellow_Grenade_shell",
    "3Rnd_SmokePurple_Grenade_shell",
    "3Rnd_SmokeBlue_Grenade_shell",
    "3Rnd_SmokeOrange_Grenade_shell",
    "SmokeShell",
    "SmokeShellRed",
    "SmokeShellGreen",
    "SmokeShellYellow",
    "SmokeShellPurple",
    "SmokeShellBlue",
    "SmokeShellOrange",
	"UGL_FlareWhite_F",
    "UGL_FlareGreen_F",
    "UGL_FlareRed_F",
    "UGL_FlareYellow_F",
    "UGL_FlareCIR_F",
    "3Rnd_UGL_FlareWhite_F",
    "3Rnd_UGL_FlareGreen_F",
    "3Rnd_UGL_FlareRed_F",
    "3Rnd_UGL_FlareYellow_F",
    "3Rnd_UGL_FlareCIR_F",
	"FlareWhite_F",
    "FlareGreen_F",
    "FlareRed_F",
    "FlareYellow_F",
	// Grenades
	"HandGrenade",
	"MiniGrenade",
    "HandGrenade_Stone",
	"B_IR_Grenade",
    "O_IR_Grenade",
    "I_IR_Grenade",
	// Chemlights
    "Chemlight_green",
    "Chemlight_red",
    "Chemlight_yellow",
    "Chemlight_blue",
	// Ammo
	"30Rnd_45ACP_Mag_SMG_01",
    "30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
    "9Rnd_45ACP_Mag",
	"150Rnd_762x51_Box",
    "150Rnd_762x51_Box_Tracer",
	"11Rnd_45ACP_Mag",
    "6Rnd_45ACP_Cylinder",
	"20Rnd_762x51_Mag",
    "10Rnd_762x51_Mag",
	"5Rnd_127x108_Mag",
    "5Rnd_127x108_APDS_Mag",
	// Explosives
	"ATMine_Range_Mag",
    "APERSMine_Range_Mag",
    "APERSBoundingMine_Range_Mag",
    "SLAMDirectionalMine_Wire_Mag",
    "APERSTripMine_Wire_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
    "DemoCharge_Remote_Mag",
    //"IEDUrbanBig_Remote_Mag",
    //"IEDLandBig_Remote_Mag",
    //"IEDUrbanSmall_Remote_Mag",
    //"IEDLandSmall_Remote_Mag",
	// Starter Pistol Flares
    "6Rnd_GreenSignal_F",
    "6Rnd_RedSignal_F"
*/
];
vehicleAddition = [
    "muzzle_snds_H",
    "muzzle_snds_L",
    "muzzle_snds_M",
    "muzzle_snds_B",
    "muzzle_snds_H_MG",
    "muzzle_snds_acp",
    "muzzle_snds_H_SW",	
	//"optic_Arco",
    //"optic_Hamr",
    "optic_Aco",
    "optic_ACO_grn",
    "optic_Aco_smg",
    "optic_ACO_grn_smg",
    "optic_Holosight",
    "optic_Holosight_smg",
    //"optic_SOS",
    "optic_MRCO",
    //"optic_NVS",
    //"optic_Nightstalker",
    //"optic_tws",
    //"optic_tws_mg",
    //"optic_DMS",
    "optic_Yorris",
    "optic_MRD",
    //"optic_LRPS",
	"acc_flashlight",
    "acc_pointer_IR"	
];

vehicleAddition2 = [
	"Chemlight_blue",
	"Chemlight_red",
	"Chemlight_green",
	"Chemlight_yellow"
];

vehicleAddition3 = [
    "ItemWatch",
    "ItemCompass",
    "ItemGPS",
    "ItemRadio",
    "ItemMap",
    "FirstAidKit",
    "Medikit",
    "ToolKit",
	"MineDetector",
	"Binocular",
    "Rangefinder",
    "NVGoggles",
    "Laserdesignator",
    "NVGoggles_OPFOR",
    "NVGoggles_INDEP"
];
 
ammoBoxes = [
	"Box_IND_Ammo_F",
	"Box_East_Ammo_F",
	"Box_NATO_Ammo_F",
	"Box_IND_Wps_F",
	"Box_East_Wps_F",
	"Box_NATO_Wps_F",
	"Box_IND_AmmoOrd_F",
	"Box_East_AmmoOrd_F",
	"Box_NATO_AmmoOrd_F",
	"Box_FIA_Ammo_F",
	"Box_FIA_Support_F",
	"Box_FIA_Wps_F",
	"Box_IND_Grenades_F",
	"Box_East_Grenades_F",
	"Box_NATO_Grenades_F",
	"Box_IND_WpsLaunch_F",
	"Box_East_WpsLaunch_F",
	"Box_NATO_WpsLaunch_F",
	"Box_IND_WpsSpecial_F",
	"Box_East_WpsSpecial_F",
	"Box_NATO_WpsSpecial_F",
	"Box_IND_Support_F",
	"Box_East_Support_F",
	"Box_NATO_Support_F"
	//"Box_IND_AmmoVeh_F",
	//"Box_East_AmmoVeh_F",
	//"Box_NATO_AmmoVeh_F"
];

missionAmmoBoxes = [
	"Box_IND_Ammo_F",
	"Box_East_Ammo_F",
	"Box_NATO_Ammo_F",
	"Box_IND_Wps_F",
	"Box_East_Wps_F",
	"Box_NATO_Wps_F",
	"Box_IND_AmmoOrd_F",
	"Box_East_AmmoOrd_F",
	"Box_NATO_AmmoOrd_F",
	"Box_FIA_Ammo_F",
	"Box_FIA_Support_F",
	"Box_FIA_Wps_F",
	"Box_IND_Grenades_F",
	"Box_East_Grenades_F",
	"Box_NATO_Grenades_F",
	"Box_IND_WpsLaunch_F",
	"Box_East_WpsLaunch_F",
	"Box_NATO_WpsLaunch_F",
	"Box_IND_WpsSpecial_F",
	"Box_East_WpsSpecial_F",
	"Box_NATO_WpsSpecial_F",
	"Box_IND_Support_F",
	"Box_East_Support_F",
	"Box_NATO_Support_F"
	//"Box_IND_AmmoVeh_F",
	//"Box_East_AmmoVeh_F",
	//"Box_NATO_AmmoVeh_F"
];

supplyCrate = [
	"I_supplyCrate_F",
	"O_supplyCrate_F",
	"C_supplyCrate_F",
	"IG_supplyCrate_F",
	"B_supplyCrate_F"
];

// THESE NEED TO BE FULLY GLOBAL

//Gunstore Weapon List - Gun Store Base List
// classname, description, buy cost, sell amount
pvar_weaponsArray = [
    //Handgun		
	["hgun_P07_F","P07 9 mm",50,25],
	["hgun_Rook40_F","Rook-40 9 mm",50,25],
	["hgun_ACPC2_F","ACP-C2 .45",50,25],
	["hgun_Pistol_heavy_01_F","4-five .45",100,50],	
	["hgun_Pistol_heavy_02_F","Zubr .45",100,50],

	//SMG
	["hgun_PDW2000_F","PDW2000 9 mm",100,50],
	["SMG_01_F","Vermin SMG .45 ACP",100,50],
	["SMG_02_F","Sting 9 mm",100,50],

    //Underwater Gun
	["arifle_SDAR_F","SDAR 5.56 mm",100,50],

	//TRG20/21 Series
	["arifle_TRG21_F","TRG-21 5.56mm",100,50],
	["arifle_TRG20_F","TRG-20 5.56mm",100,50],
	["arifle_TRG21_GL_F","TRG-21 EGLM 5.56mm",150,75],

	//Mk20 Series
	["arifle_Mk20_F","Mk20 5.56mm (Camo)",100,50],
	["arifle_Mk20_plain_F","Mk20 5.56mm",100,50],
	["arifle_Mk20C_F","Mk20C 5.56mm (Camo)",100,50],
	["arifle_Mk20C_plain_F","Mk20C 5.56mm",100,50],
	["arifle_Mk20_GL_F","Mk20 EGLM 5.56mm (Camo)",150,75],
	["arifle_Mk20_GL_plain_F","Mk20 EGLM 5.56mm",150,75],

	//Katiba Series
	["arifle_Katiba_F","Katiba 6.5mm",100,50],
	["arifle_Katiba_C_F","Katiba Carbine 6.5mm",100,50],
	["arifle_Katiba_GL_F","Katiba GL 6.5mm",150,75],

	//MX Series
	["arifle_MX_F","MX 6.5mm",100,50],
	["arifle_MXC_F","MXC 6.5mm",100,50],
	["arifle_MX_GL_F","MX 3GL 6.5mm",150,75],
	["arifle_MXM_F","MXM 6.5mm",300,150],
	["arifle_MX_SW_F","MX SW 6.5mm",300,150],
	//MX Series - Black Edition
	["arifle_MX_Black_F","MX 6.5mm Black",100,50],
	["arifle_MXC_Black_F","MXC 6.5mm Black",100,50],
	["arifle_MX_GL_Black_F","MX 3GL 6.5mm Black",150,75],
	["arifle_MXM_Black_F","MXM 6.5mm Black",300,150],
	["arifle_MX_SW_Black_F","MX SW 6.5mm Black",300,150],

   	//Light Machine Gun
	["LMG_Mk200_F","Mk200 6.5mm",350,175],
	["LMG_Zafir_F","Zafir 7.62mm",450,225],

	//Sniper Rifle
	["srifle_DMR_01_F","Rahim 7.62mm",400,200],
	["srifle_EBR_F","Mk18 ABR 7.62mm",400,200],
	["srifle_LRR_F","M320 LRR .408",500,250],
	["srifle_LRR_camo_F","M320 LRR (Camo) .408",540,270],
	["srifle_GM6_F","GM6 Lynx 12.7mm",500,250],
	["srifle_GM6_camo_F","GM6 Lynx (Camo) 12.7mm",540,270],
	
	//Launchers
	["launch_RPG32_F","RPG-42 Alamut",200,100],
	["launch_NLAW_F","PCML",300,150],
	["launch_B_Titan_F","Titan [NATO]",500,250],
	["launch_O_Titan_F","Titan [CSAT]",500,250],
	["launch_I_Titan_F","Titan [AAF]",500,250],
	["launch_B_Titan_short_F","Titan (Compact) [NATO]",500,250],
	["launch_O_Titan_short_F","Titan (Compact) [CSAT]",500,250],
	["launch_I_Titan_short_F","Titan (Compact) [AAF]",500,250]
];

//Gun Store Ammo List
//Classname, Description, Buy cost, Sell amount
pvar_ammoArray = [
	["Laserbatteries","Designator Batteries",50,25],

	["16Rnd_9x21_Mag","9mm 16Rnd Mag",10,5],
	["9Rnd_45ACP_Mag",".45 ACP 9Rnd Mag",15,5],
	["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",15,5],			//New HGun Mag.
	["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",15,5],	//New HGun Mag.

	["30Rnd_9x21_Mag","9mm 30Rnd Mag",25,10],
	["30Rnd_45ACP_Mag_SMG_01",".45 ACP 30Rnd Vermin Mag",25,10],
	["30Rnd_45ACP_Mag_SMG_01_Tracer_Green",".45 30Rnd VerminTracers (Green) Mag",25,10],

	["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",15,5],

	["30Rnd_556x45_Stanag","5.56mm 30rnd STANAG Mag",20,10],
	["30Rnd_556x45_Stanag_Tracer_Red","5.56mm 30rnd Tracer (Red) Mag",20,10],
	["30Rnd_556x45_Stanag_Tracer_Green","5.56mm 30rnd Tracer (Green) Mag",20,10],
	["30Rnd_556x45_Stanag_Tracer_Yellow","5.56mm 30rnd Tracer (Yellow) Mag",20,10],

	["30Rnd_65x39_caseless_green","6.5mm 30Rnd Caseless Mag",30,15],
	["30Rnd_65x39_caseless_green_mag_Tracer","6.5mm 30Rnd Tracer (Green) Mag",30,15],
	["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",30,15],
	["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer (Red) Mag",30,15],

	["100Rnd_65x39_caseless_mag","6.5mm 100Rnd Belt Case",50,20],
	["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100Rnd Tracer (Red) Belt Case",50,20],

	["200Rnd_65x39_cased_Box","6.5mm 200Rnd Belt Case",100,30],
	["200Rnd_65x39_cased_Box_Tracer","6.5mm 200Rnd Tracer (Green) Belt Case",100,30],

	["150Rnd_762x51_Box","7.62mm 150Rnd Box",150,35],
	["150Rnd_762x51_Box_Tracer","7.62mm 150Rnd Tracer (Green) Box",150,35],

	["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",50,20],
	["10Rnd_762x51_Mag","7.62mm 10Rnd Mag",30,15],		//New SRifle Mag.

	["7Rnd_408_Mag",".408 7Rnd Cheetah Mag",75,35],
	["5Rnd_127x108_Mag","12.7mm 5Rnd Lynx Mag",75,35],
	["5Rnd_127x108_APDS_Mag","12.7mm 5Rnd APDS Lynx Mag",75,35],	//APDS = Armor Piercing Discarding Sabot

	["RPG32_F","RPG-42 Missile",100,25],
	["RPG32_HE_F","RPG-42 HE Missile",100,25],

	["NLAW_F","PCML Missile",100,25],

	["Titan_AA","Titan AA Missile",150,50],
	["Titan_AP","Titan AP Missile",125,25],
	["Titan_AT","Titan AT Missile",150,50],

	//Hand Grenades
	["HandGrenade_Stone","Grenade Decoy",20,10],
	["MiniGrenade","Mini Grenade",50,25],
	["HandGrenade","RGO Frag Grenade",100,50],
	
	//IR - Hand Grenades
	["B_IR_Grenade","IR Grenade [NATO]", 25,10],
	["O_IR_Grenade","IR Grenade [CSAT]", 25,10],
	["I_IR_Grenade","IR Grenade [AAF]", 25,10],
	
	//Explosives
	["ATMine_Range_Mag","AT Mine",250,100],
	["APERSMine_Range_Mag","APERS Mine",100,50],
	["APERSBoundingMine_Range_Mag","APERS Bounding Mine",100,50],
	["SLAMDirectionalMine_Wire_Mag","M6 SLAM Mine",100,50],
	["APERSTripMine_Wire_Mag","APERS Tripwire Mine",100,50],
	["DemoCharge_Remote_Mag","Explosive Charge",150,50],
	["SatchelCharge_Remote_Mag","Explosive Satchel",250,100],
	//["IEDUrbanSmall_Remote_Mag","Urban IED (Small)",100,50],
	//["IEDLandSmall_Remote_Mag","Land IED (Small)",100,50],
	//["IEDUrbanBig_Remote_Mag","Urban IED (Big)",250,100],
	//["IEDLandBig_Remote_Mag","Land IED (Big)",250,100],

	//Under-slung Grenade Launcher Ammunition
	["1Rnd_HE_Grenade_shell","40mm HE Grenade Round",50,10],
	["3Rnd_HE_Grenade_shell","40mm 3Rnd HE Grenade",150,25],
	["1Rnd_Smoke_Grenade_shell","Smoke Round (White)",25,5],
	["3Rnd_Smoke_Grenade_shell","3Rnd 3GL Smoke Rounds (White)",75,15],
	["1Rnd_SmokeRed_Grenade_shell","Smoke Round (Red)",25,5],
	["3Rnd_SmokeRed_Grenade_shell","3Rnd 3GL Smoke Rounds (Red)",75,15],
	["1Rnd_SmokeGreen_Grenade_shell","Smoke Round (Green)",25,5],
	["3Rnd_SmokeGreen_Grenade_shell","3Rnd 3GL Smoke Rounds (Green)",75,15],
	["1Rnd_SmokeYellow_Grenade_shell","Smoke Round (Yellow)",25,5],
	["3Rnd_SmokeYellow_Grenade_shell","3Rnd 3GL Smoke Rounds (Yellow)",75,15],
	["1Rnd_SmokePurple_Grenade_shell","Smoke Round (Purple)",25,5],
	["3Rnd_SmokePurple_Grenade_shell","3Rnd 3GL Smoke Rounds (Purple)",75,15],
	["1Rnd_SmokeBlue_Grenade_shell","Smoke Round (Blue)",25,5],
	["3Rnd_SmokeBlue_Grenade_shell","3Rnd 3GL Smoke Rounds (Blue)",75,15],
	["1Rnd_SmokeOrange_Grenade_shell","Smoke Round (Orange)",25,5],
	["3Rnd_SmokeOrange_Grenade_shell","3Rnd 3GL Smoke Rounds (Orange)",75,15],

	//Smoke - Hand Grenades
	["SmokeShell","Smoke Grenade (White)", 15,2],
	["SmokeShellRed","Smoke Grenade (Red)", 15,2],
	["SmokeShellGreen","Smoke Grenade (Green)", 15,2],
	["SmokeShellYellow","Smoke Grenade (Yellow)", 15,2],
	["SmokeShellPurple","Smoke Grenade (Purple)", 15,2],
	["SmokeShellBlue","Smoke Grenade (Blue)", 15,2],
	["SmokeShellOrange","Smoke Grenade (Orange)", 15,2],

	//Flares
	["6Rnd_GreenSignal_F","6Rnd Signal Flares (Green)", 10,1],
	["6Rnd_RedSignal_F","6Rnd Signal Flares (Red)", 10,1],
	
	["UGL_FlareWhite_F","Flare Round (White)", 15,2],
	["UGL_FlareGreen_F","Flare Round (Green)", 15,2],
	["UGL_FlareRed_F","Flare Round (Red)", 15,2],
	["UGL_FlareYellow_F","Flare Round (Yellow)", 15,2],
	["UGL_FlareCIR_F","Flare Round (IR)", 15,2],

	["3Rnd_UGL_FlareWhite_F","3Rnd 3GL Flares (White)", 45,5],
	["3Rnd_UGL_FlareGreen_F","3Rnd 3GL Flares (Green)", 45,5],
	["3Rnd_UGL_FlareRed_F","3Rnd 3GL Flares (Red)", 45,5],
	["3Rnd_UGL_FlareYellow_F","3Rnd 3GL Flares (Yellow)", 45,5],
	["3Rnd_UGL_FlareCIR_F","3Rnd 3GL Flares (IR)", 45,5],

	["FlareWhite_F","Flare (White)", 15,2],
	["FlareGreen_F","Flare (Green)", 15,2],
	["FlareRed_F","Flare (Red)", 15,2],
	["FlareYellow_F","Flare (Yellow)", 15,2],

	//Chemlights
	["Chemlight_green","Chemlight (Green)", 10,1],
	["Chemlight_red","Chemlight (Red)", 10,1],
	["Chemlight_yellow","Chemlight (Yellow)", 10,1],
	["Chemlight_blue","Chemlight (Blue)", 10,1]
];

//General Store Equipment List
//Classname, Description, Buy cost, Sell amount
pvar_accessoriesArray = [
	["NVGoggles","NV Goggles (blufor)", 750,"item"],
	["NVGoggles_OPFOR","NV Goggles (opfor)", 750,"item"],
	["NVGoggles_INDEP","NV Goggles (indep)", 750,"item"],

//	Glasses
	//["G_Diving","Diver Goggles", 50,"item"],			// Not sure if this one works, test it!

	["ItemWatch","Watch", 100,"item"],
	["ItemCompass","Compass", 100,"item"],
	["ItemGPS","GPS", 100,"item"],
	["ItemRadio","Radio", 100,"item"],
	["ItemMap","Map", 100,"item"],
	["MineDetector","Mine Detector", 100,"item"],

	["Binocular","Binoculars", 50,"binoc"],
	["Rangefinder","Rangefinder", 150,"binoc"],
	["Laserdesignator","Laser Designator", 300,"binoc"],

	["FirstAidKit","First Aid Kit", 50,"item"],
	["Medikit","Medikit", 150,"item"],
	["ToolKit","Toolkit", 150,"item"],

	["acc_flashlight","Flashlight", 100,"item"],
	["acc_pointer_IR","IR Laser Pointer", 100,"item"],
	//["Laserdesignator_mounted","Laser Marker", 100,"item"],

	["muzzle_snds_L","Sound Suppressor (9 mm)", 50,"item"],	
	["muzzle_snds_acp","Sound Suppressor (.45 ACP)", 50,"item"],	
	["muzzle_snds_M","Sound Suppressor (5.56 mm)", 100,"item"],	
	["muzzle_snds_H","Sound Suppressor (6.5 mm)", 150,"item"],	
	["muzzle_snds_H_MG","Sound Suppressor LMG (6.5 mm)", 200,"item"],	
	["muzzle_snds_B","Sound Suppressor (7.62 mm)", 250,"item"],	
	["muzzle_snds_H_SW","Sound Suppressor SW (6.5 mm)", 250,"item"],	
		
	["optic_Yorris","Yorris", 25,"item"],						//New Optic for the Zubr 6-barrel HGun.
	["optic_MRD","MRD", 25,"item"],								//New Optic for the 4-five HGun.
	["optic_Aco","ACO (Red)", 50,"item"],
	["optic_Aco_grn","ACO (Green)", 50,"item"],
	["optic_Aco_smg","ACO SMG (Red)", 50,"item"],
	["optic_Aco_grn_smg","ACO SMG (Green)", 50,"item"],
	["optic_Holosight_smg","Mk17 Holosight SMG", 100,"item"],
	["optic_Holosight","Holosight", 150,"item"],
	["optic_Hamr","RCO", 200,"item"],
	["optic_Arco","ARCO", 200,"item"],
	["optic_MRCO","MRCO", 200,"item"],
	["optic_DMS","DMR", 300,"item"],							//New Optic for the Rahim SRifle.
	["optic_LRPS","LRPS", 300,"item"],							//New Sniper Optic
	["optic_SOS","SOS", 300,"item"],
	["optic_NVS","NVS", 350,"item"],
	["optic_tws_mg","TWS MG", 400,"item"],
	["optic_tws","TWS", 400,"item"],
	["optic_Nightstalker","Nightstalker", 400,"item"],

	["B_UavTerminal","UAV Terminal [NATO]", 100,"item"],
	["O_UavTerminal","UAV Terminal [CSAT]", 100,"item"],
	["I_UavTerminal","UAV Terminal [AAF]", 100,"item"]
];

pvar_uniformArray = [	

//	Uniforms:
	["U_B_CTRG_1","CTRG Combat Uniform (UBACS)", 100,"uni"],
	["U_B_CTRG_2","CTRG Combat Uniform (UBACS2)", 100,"uni"],
	["U_B_CTRG_3","CTRG Combat Uniform (Tee)", 100,"uni"],
	["U_B_CombatUniform_mcam","Combat Fatigues [NATO] (MTP)", 100,"uni"],
    ["U_B_CombatUniform_mcam_tshirt","Combat Fatigues [NATO] (MTP) (Tee)", 100,"uni"],
    ["U_B_CombatUniform_mcam_vest","Recon Fatigues [NATO] (MTP)", 100,"uni"],
    ["U_B_GhillieSuit","Ghillie Suit [NATO]", 100,"uni"],
    ["U_B_HeliPilotCoveralls","Heli Pilot Coveralls [NATO]", 100,"uni"],
    ["U_B_Wetsuit","Wetsuit [NATO]", 100,"uni"],
    ["U_B_CombatUniform_mcam_worn","Worn Combat Fatigues [NATO] (MTP)", 100,"uni"],
    ["U_B_SpecopsUniform_sgg","Specop Fatigues [NATO] (Sage)", 100,"uni"],
    ["U_B_PilotCoveralls","Pilot Coveralls [NATO]", 100,"uni"],
    ["U_O_CombatUniform_ocamo","Fatigues (Hex) [CSAT]", 100,"uni"],
    ["U_O_GhillieSuit","Ghillie Suit [CSAT]", 100,"uni"],
    ["U_O_PilotCoveralls","Pilot Coveralls [CSAT]", 100,"uni"],
    ["U_O_Wetsuit","Wetsuit [CSAT]", 100,"uni"],
    ["U_O_CombatUniform_oucamo","Fatigues (Urban) [CSAT]", 100,"uni"],
    ["U_O_SpecopsUniform_ocamo","Recon Fatigues (Hex) [CSAT]", 100,"uni"],
    ["U_O_OfficerUniform_ocamo","Officer Fatigues (Hex) [CSAT]", 100,"uni"],
    ["U_I_CombatUniform","Combat Fatigues [AAF]", 100,"uni"],
    ["U_I_CombatUniform_tshirt","Combat Fatigues [AAF] (Tee)", 100,"uni"],
    ["U_I_pilotCoveralls","Pilot Coveralls [AAF]", 100,"uni"],
    ["U_I_HeliPilotCoveralls","Heli Pilot Coveralls [AAF]", 100,"uni"],
    ["U_I_GhillieSuit","Ghillie Suit [AAF]", 100,"uni"],
    ["U_I_Wetsuit","Wetsuit [AAF]", 100,"uni"],
    ["U_C_Poloshirt_blue","Commoner Clothes 1", 100,"uni"],
    ["U_C_Poloshirt_burgundy","Commoner Clothes 2", 100,"uni"],
    ["U_C_Poloshirt_stripped","Commoner Clothes 3", 100,"uni"],
    ["U_C_Poloshirt_tricolour","Commoner Clothes 4", 100,"uni"],
    ["U_C_Poloshirt_salmon","Commoner Clothes 5", 100,"uni"],
    ["U_C_Poloshirt_redwhite","Commoner Clothes 6", 100,"uni"],
    ["U_C_Commoner1_1","Commoner Clothes 7", 100,"uni"],
    ["U_C_Commoner1_2","Commoner Clothes 8", 100,"uni"],
    ["U_C_Commoner1_3","Commoner Clothes 9", 100,"uni"],
    ["U_IG_Guerilla1_1","Guerilla Smocks 1", 100,"uni"],
    ["U_IG_Guerilla2_1","Guerilla Smocks 2", 100,"uni"],
    ["U_IG_Guerilla2_2","Guerilla Smocks 3", 100,"uni"],
    ["U_IG_Guerilla2_3","Guerilla Smocks 4", 100,"uni"],
    ["U_IG_Guerilla3_1","Guerilla Smocks 5", 100,"uni"],
    ["U_IG_Guerilla3_2","Guerilla Smocks 6", 100,"uni"],
    ["U_IG_leader","Guerilla Smocks Leader", 100,"uni"],

//	Headgear:
	["H_HelmetB_light_sand","ECH Light Sand", 100,"hat"],
	["H_HelmetB_light_black","ECH Light Black", 100,"hat"],
	["H_HelmetB_light_desert","ECH Light Desert", 100,"hat"],
	["H_HelmetB_light_snakeskin","ECH Light Snakeskin", 100,"hat"],
	["H_HelmetB_light_grass","ECH Light Grass", 100,"hat"],
	["H_HelmetB_sand","ECH Sand", 150,"hat"],
	["H_HelmetB_black","ECH Black", 150,"hat"],
	["H_HelmetB_desert","ECH Desert", 150,"hat"],
	["H_HelmetB_snakeskin","ECH Snakeskin", 150,"hat"],
	["H_HelmetB_grass","ECH Grass", 150,"hat"],
	["H_Helmet_Kerry","ECH Kerry", 150,"hat"],
	
	["H_HelmetB","ECH", 150,"hat"],
	["H_HelmetB_camo","ECH (Camo)", 150,"hat"],
	["H_HelmetB_paint","ECH (Spraypaint)", 150,"hat"],
	["H_HelmetB_light","ECH (Light)", 100,"hat"],
	["H_HelmetB_plain_blk","Combat Helmet (Black)", 150,"hat"],
	["H_HelmetSpecB","SF Helmet", 100,"hat"],
	["H_HelmetSpecB_paint1","SF Helmet (Light paint)", 100,"hat"],
	["H_HelmetSpecB_paint2","SF Helmet (Dark paint)", 100,"hat"],
	["H_HelmetSpecB_blk","SF Helmet (Black)", 100,"hat"],
	["H_PilotHelmetHeli_B","Heli Pilot Helmet [NATO]", 100,"hat"],
	["H_PilotHelmetFighter_B","Pilot Helmet [NATO]", 100,"hat"],
	["H_HelmetCrew_B","Crew Helmet", 100,"hat"],
	["H_CrewHelmetHeli_B","Heli Crew Helmet [NATO]", 100,"hat"],
	["H_HelmetO_ocamo","Protector Helmet (Hex)", 100,"hat"],
	["H_HelmetO_oucamo","Protector Helmet (Urban)", 100,"hat"],
	["H_HelmetLeaderO_ocamo","Defender Helmet (Hex)", 100,"hat"],
	["H_HelmetLeaderO_oucamo","Defender Helmet (Urban)", 100,"hat"],
	["H_HelmetSpecO_blk","Assassin Helmet (Black)", 100,"hat"],
	["H_PilotHelmetHeli_O","Heli Pilot Helmet [CSAT]", 100,"hat"],
	["H_PilotHelmetFighter_O","Pilot Helmet [CSAT]", 100,"hat"],
	["H_HelmetCrew_O","Crew Helmet [CSAT]", 100,"hat"],
	["H_CrewHelmetHeli_O","Heli Crew Helmet [CSAT]", 100,"hat"],
	["H_HelmetIA","MICH", 100,"hat"],
	//["H_HelmetIA_net","MICH (Camo)", 100,"hat"],
	//["H_HelmetIA_camo","MICH2 (Camo)", 100,"hat"],
	["H_PilotHelmetHeli_I","Heli Pilot Helmet [AAF]", 100,"hat"],
	["H_PilotHelmetFighter_I","Pilot Helmet [AAF]", 100,"hat"],
	["H_HelmetCrew_I","Crew Helmet [AAF]", 100,"hat"],
	["H_CrewHelmetHeli_I","Heli Crew Helmet [AAF]", 100,"hat"],
	
	["H_Booniehat_khk","Boonie hat (Hex)", 50,"hat"],
	["H_Booniehat_indp","Boonie hat (Khaki)", 50,"hat"],
	["H_Booniehat_mcamo","Boonie hat (MTP)", 50,"hat"],
	//["H_Booniehat_grn","Boonie hat (Green)", 50,"hat"],
	["H_Booniehat_tan","Boonie hat (Tan)", 50,"hat"],
	//["H_Booniehat_dirty","Boonie hat (Dirty)", 50,"hat"],
	["H_Booniehat_dgtl","Boonie hat (Digi)", 50,"hat"],
	["H_Booniehat_oli","Boonie hat (Olive)", 50,"hat"],
	
	["H_Cap_blu","Cap (Blue)", 50,"hat"],
	["H_Cap_red","Cap (Red)", 50,"hat"],
	["H_Cap_oli","Cap (Olive)", 50,"hat"],
	["H_Cap_tan","Cap (Tan)", 50,"hat"],
	["H_Cap_blk","Cap (Black)", 50,"hat"],
	["H_Cap_blk_CMMG","Cap (CMMG)", 50,"hat"],
	["H_Cap_brn_SPECOPS","Cap (SPECOPS)", 50,"hat"],
	["H_Cap_tan_specops_US","Cap (SF)", 50,"hat"],
	["H_Cap_khaki_specops_UK","Cap (SAS)", 50,"hat"],
	["H_Cap_grn_BI","Cap (BI)", 50,"hat"],
	["H_Cap_grn","Cap (Green)", 50,"hat"],
	["H_Cap_blk_Raven","Cap (Raven Security)", 50,"hat"],
	["H_Cap_blk_ION","Cap (ION)", 50,"hat"],
	["H_Cap_headphones","Rangemaster Cap", 50,"hat"],
	
	["H_MilCap_ocamo","Military Cap (Hex)", 50,"hat"],
	["H_MilCap_mcamo","Military Cap (MTP)", 50,"hat"],
	["H_MilCap_oucamo","Military Cap (Urban)", 50,"hat"],
	["H_MilCap_rucamo","Military Cap (Russia)", 50,"hat"],
	["H_MilCap_gry","Military Cap (Gray)", 50,"hat"],
	["H_MilCap_blue","Military Cap (Blue)", 50,"hat"],
	["H_MilCap_dgtl","Military Cap [AAF]", 50,"hat"],
	
	["H_Bandanna_surfer","Bandanna (Surfer)", 50,"hat"],
	["H_Bandanna_khk","Bandanna (Khaki)", 50,"hat"],
	["H_Bandanna_cbr","Bandanna (Coyote)", 50,"hat"],
	["H_Bandanna_sgg","Bandanna (Sage)", 50,"hat"],
	["H_Bandanna_gry","Bandanna (Gray)", 50,"hat"],
	["H_Bandanna_camo","Bandanna (Camo)", 50,"hat"],
	["H_Bandanna_mcamo","Bandanna (MTP)", 50,"hat"],
	["H_Bandanna_surfer_blk","Bandanna (Black)", 50,"hat"],
	["H_Bandanna_surfer_grn","Bandanna (Green)", 50,"hat"],
	["H_Bandanna_blu","Bandanna (Blue)", 50,"hat"],
	["H_Bandanna_sand","Bandanna (Sand)", 50,"hat"],
	
	["H_Hat_blue","Hat (Blue)", 50,"hat"],
	["H_Hat_brown","Hat (Brown)", 50,"hat"],
	["H_Hat_camo","Hat (Camo)", 50,"hat"],
	["H_Hat_grey","Hat (Gray)", 50,"hat"],
	["H_Hat_checker","Hat (Checker)", 50,"hat"],
	["H_Hat_tan","Hat (Tan)", 50,"hat"],

	["H_BandMask_blk","Band mask (Black)", 50,"hat"],
	["H_BandMask_khk","Band mask (Khaki)", 50,"hat"],
	["H_BandMask_reaper","Band mask (Reaper)", 50,"hat"],
	["H_BandMask_demon","Band mask (Demon)", 50,"hat"],
		
	["H_Shemag_khk","Shemag mask (Khaki)", 50,"hat"],
	["H_Shemag_olive","Shemag (Olive)", 50,"hat"],
	["H_ShemagOpen_khk","Shemag (Khaki)", 50,"hat"],
	["H_TurbanO_blk","Turban (Black)", 50,"hat"],
	
	["H_Beret_Colonel","Beret", 50,"hat"],
	["H_Beret_blk","Beret (Black)", 50,"hat"],
	//["H_Beret_blk_POLICE","Beret (Police)", 50,"hat"],
	//["H_Beret_red","Beret (Red)", 50,"hat"],
	//["H_Beret_grn","Beret (Green)", 50,"hat"],
	//["H_Beret_grn_SF","Beret (SF)", 50,"hat"],
	//["H_Beret_brn_SF","Beret (SAS)", 50,"hat"],
	//["H_Beret_ocamo","Beret [CSAT]", 50,"hat"],
	
	["H_Watchcap_blk","Beanie", 50,"hat"],
	["H_Watchcap_khk","Beanie (Khaki)", 50,"hat"],
	["H_Watchcap_camo","Beanie (Camo)", 50,"hat"],
	["H_Watchcap_sgg","Beanie (Sage)", 50,"hat"],
	["H_Watchcap_cbr","Beanie (Coyote)", 50,"hat"],
	
	["H_StrawHat","Straw Hat", 50,"hat"],
	["H_StrawHat_dark","Straw hat (Dark)", 50,"hat"],

//	Belts and Vests:
	["V_Rangemaster_belt","Rangemaster Belt", 100,"vest"],
	["V_BandollierB_khk","Slash Bandoleer (Khaki)", 100,"vest"],
	["V_BandollierB_cbr","Slash Bandoleer (Coyote)", 100,"vest"],
	["V_BandollierB_rgr","Slash Bandoleer (Green)", 100,"vest"],
	["V_BandollierB_blk","Slash Bandoleer (Black)", 100,"vest"],
	["V_BandollierB_oli","Slash Bandoleer (Olive)", 100,"vest"],
	["V_PlateCarrier1_rgr","Carrier Lite (Green)", 100,"vest"],
	["V_PlateCarrier2_rgr","Carrier Lite (Coyote)", 100,"vest"],
	["V_PlateCarrier3_rgr","Carrier Rig (Green)", 100,"vest"],
	["V_PlateCarrierGL_rgr","Carrier GL Rig (Green)", 100,"vest"],
	["V_PlateCarrier1_blk","Carrier Lite (Black)", 100,"vest"],
	["V_PlateCarrierSpec_rgr","Carrier Special Rig (Green)", 100,"vest"],
	["V_PlateCarrierIA1_dgtl","GA Carrier Lite (Digi)", 100,"vest"],
	["V_PlateCarrierIA2_dgtl","GA Carrier Rig (Digi)", 100,"vest"],
	["V_PlateCarrierIAGL_dgtl","GA Carrier GL Rig (Digi)", 100,"vest"],
	["V_PlateCarrierL_CTRG","CTRG Plate Carrier Rig Mk.1 (Light)", 100,"vest"],
	["V_PlateCarrierH_CTRG","CTRG Plate Carrier Rig Mk.2 (Heavy)", 150,"vest"],
	["V_Chestrig_khk","Chest rig (Khaki)", 100,"vest"],
	["V_Chestrig_rgr","Chest rig (Green)", 100,"vest"],
	["V_Chestrig_blk","Fighter Chestrig (Black)", 100,"vest"],
	["V_Chestrig_oli","Fighter Chestrig (Olive)", 100,"vest"],
	["V_TacVest_khk","Tactical Vest (Khaki)", 100,"vest"],
	["V_TacVest_brn","Tactical Vest (Brown)", 100,"vest"],
	["V_TacVest_oli","Tactical Vest (Olive)", 100,"vest"],
	["V_TacVest_blk","Tactical Vest (Black)", 100,"vest"],
	["V_TacVest_camo","Tactical Vest (Camo)", 100,"vest"],
	["V_TacVest_blk_POLICE","Tactical Vest (Police)", 100,"vest"],
	["V_TacVestIR_blk","Raven Vest", 100,"vest"],
	["V_TacVestCamo_khk","Camouflaged Vest", 100,"vest"],
	["V_HarnessO_brn","LBV Harness", 100,"vest"],
	["V_HarnessOGL_brn","LBV Grenadier Harness", 150,"vest"],
	["V_HarnessOSpec_brn","ELBV Harness", 100,"vest"],
	["V_RebreatherB","Rebreather [NATO]", 150,"vest"],

//	Backpacks:
	//maximumLoad = 120, mass = 15 STANAG Mags:
    ["B_OutdoorPack_blk","Outdoor Pack (Black)",100,"backpack"],
    ["B_OutdoorPack_tan","Outdoor Pack (Tan)",100,"backpack"],
    ["B_OutdoorPack_blu","Outdoor Pack (Blue)",100,"backpack"],

	//maximumLoad = 160, mass = 20 STANAG Mags:
    ["B_AssaultPack_khk","Assault Pack (Khaki)",200,"backpack"],
    ["B_AssaultPack_dgtl","Assault Pack (Digi)",200,"backpack"],
    ["B_AssaultPack_rgr","Assault Pack (Green)",200,"backpack"],
    ["B_AssaultPack_sgg","Assault Pack (Sage)",200,"backpack"],
    ["B_AssaultPack_blk","Assault Pack (Black)",200,"backpack"],
    ["B_AssaultPack_cbr","Assault Pack (Coyote)",200,"backpack"],
    ["B_AssaultPack_mcamo","Assault Pack (MTP)",200,"backpack"],
    ["B_AssaultPack_ocamo","Assault Pack (Hex)",200,"backpack"],

	//maximumLoad = 240, mass = 30 STANAG Mags:
    ["B_FieldPack_blk","Field Pack (Black)",300,"backpack"],
    ["B_FieldPack_ocamo","Field Pack (Hex)",300,"backpack"],
    ["B_FieldPack_oucamo","Field Pack (Urban)",300,"backpack"],
    ["B_FieldPack_cbr","Field Pack (Coyote)",300,"backpack"],
    ["B_FieldPack_khk","Field Pack (Khaki)",300,"backpack"],
    ["B_FieldPack_oli","Field Pack (Olive)",300,"backpack"],

	//maximumLoad = 280, mass = 35 STANAG Mags:
    ["B_Bergen_sgg","Bergen (Sage)",350,"backpack"],
    ["B_Bergen_mcamo","Bergen (MTP)",350,"backpack"],
    ["B_Bergen_rgr","Bergen (Green)",350,"backpack"],
    ["B_Bergen_blk","Bergen (Black)",350,"backpack"],

    ["B_Kitbag_mcamo","Kitbag (MTP)",350,"backpack"],
    ["B_Kitbag_sgg","Kitbag (Sage)",350,"backpack"],
    ["B_Kitbag_cbr","Kitbag (Coyote)",350,"backpack"],

	//maximumLoad = 320, mass = 40 STANAG Mags
    ["B_Carryall_ocamo","Carryall Backpack (Hex)",450,"backpack"],
    ["B_Carryall_oucamo","Carryall Backpack (Urban)",450,"backpack"],
    ["B_Carryall_mcamo","Carryall Backpack (MTP)",450,"backpack"],
    ["B_Carryall_oli","Carryall Backpack (Olive)",450,"backpack"],
    ["B_Carryall_khk","Carryall Backpack (Khaki)",450,"backpack"],
    ["B_Carryall_cbr","Carryall Backpack (Coyote)",450,"backpack"],

	["B_Parachute","Steerable Parachute",25,"backpack"],
	["B_UAV_01_backpack_F","UAV Bag [NATO]",150,"backpack"],
	["O_UAV_01_backpack_F","UAV Bag [CSAT]",150,"backpack"],
	["I_UAV_01_backpack_F","UAV Bag [AAF]",150,"backpack"]
];

//Object List - Random Spawns.
pvar_baseObjectList = [
	["Base Flag","FlagPole_F",500,""],
	
	["Heli Pod (Covered)","Land_Pod_Heli_Transport_04_covered_F",250,""],
	["Heli Pod (Repair)","Land_Pod_Heli_Transport_04_repair_F",250,""],
	["Heli Pod (Medevac)","Land_Pod_Heli_Transport_04_medevac_F",250,""],
	["Heli Pod (Fuel)","Land_Pod_Heli_Transport_04_fuel_F",250,""],
	["Heli Pod (Box)","Land_Pod_Heli_Transport_04_box_F",250,""],
	["Heli Pod (Bench)","Land_Pod_Heli_Transport_04_bench_F",250,""],
	["Heli Pod (Ammo)","Land_Pod_Heli_Transport_04_ammo_F",250,""],
	
	//["Helipad","Land_HelipadCivil_F",200,""],
		
	["Storage - Supply Crate","I_supplyCrate_F",50,"client\ui\pictures\storagecrate.paa"],

	["Concrete Ramp","Land_RampConcrete_F",100,"client\ui\pictures\concreteramp.paa"],
	["Concrete Ramp (High)","Land_RampConcreteHigh_F",150,"client\ui\pictures\concreteramphigh.paa"],
	["Obstacle (Bridge)","Land_Obstacle_Bridge_F",50,"client\ui\pictures\obstaclebridge.paa"],

	["Bar Gate","Land_BarGate_F",50,"client\ui\pictures\bargate.paa"],
	["Crash Barrier","Land_Crash_barrier_F",50,"client\ui\pictures\crashbarier.paa"],
	//["Razorwire Barrier","Land_Razorwire_F",50,"client\ui\pictures\"],
	["Wired Fence 10m","Land_New_WiredFence_10m_F",50,"client\ui\pictures\wiredfence10m.paa"],

	["Halogen Lamp","Land_LampHalogen_F",50,"client\ui\pictures\halogenlamp.paa"],

	["Pipes (Small)","Land_Pipes_small_F",50,"client\ui\pictures\pipessmall.paa"],
	//["Pipes (Large)","Land_Pipes_large_F",100,"client\ui\pictures\"],
	["Pipes (Iron)","Land_IronPipes_F",50,"client\ui\pictures\pipesiron.paa"],

	["Bag Fence (Corner)","Land_BagFence_Corner_F",50,"client\ui\pictures\bagfencecorner.paa"],
	["Bag Fence (End)","Land_BagFence_End_F",50,"client\ui\pictures\bagfenceend.paa"],
	["Bag Fence (Long)","Land_BagFence_Long_F",50,"client\ui\pictures\bagfencelong.paa"],
	["Bag Fence (Round)","Land_BagFence_Round_F",50,"client\ui\pictures\bagfenceround.paa"],
	["Bag Fence (Short)","Land_BagFence_Short_F",50,"client\ui\pictures\bagfenceshort.paa"],

	["Bag Bunker (Small)","Land_BagBunker_Small_F",150,"client\ui\pictures\bagbunkersmall.paa"],
	["Bag Bunker (Large)","Land_BagBunker_Large_F",250,"client\ui\pictures\bagbunkerlarge.paa"],
	["Bag Bunker (Tower)","Land_BagBunker_Tower_F",200,"client\ui\pictures\bagbunkertower.paa"],

	["Concrete Barrier","Land_CncBarrier_F",50,"client\ui\pictures\concretebarier.paa"],
	["Concrete Barrier (Stripes)","Land_CncBarrier_stripes_F",50,"client\ui\pictures\concretebarierstripes.paa"],
	["Concrete Barrier (Medium)","Land_CncBarrierMedium_F",50,"client\ui\pictures\concretebariermedium.paa"],
	["Concrete Barrier (Medium, Long)","Land_CncBarrierMedium4_F",100,"client\ui\pictures\concretebariermediumlong.paa"],
	["Concrete Shelter","Land_CncShelter_F",50,"client\ui\pictures\ConcreteShelter.paa"],

	["Concrete Wall","Land_CncWall1_F",50,"client\ui\pictures\concretewall1.paa"],
	["Concrete Wall (Long)","Land_CncWall4_F",100,"client\ui\pictures\concretewall4.paa"],
	["Concrete Wall (Small, 4m)","Land_Concrete_SmallWall_4m_F",50,"client\ui\pictures\concretewallsmall4m.paa"],
	["Concrete Wall (Small, 8m)","Land_Concrete_SmallWall_8m_F",50,"client\ui\pictures\concretewallsmall8m.paa"],

	["H-barrier (Block)","Land_HBarrier_1_F",50,"client\ui\pictures\hbarierblock.paa"],
	["H-barrier (3 Blocks)","Land_HBarrier_3_F",100,"client\ui\pictures\hbarier3block.paa"],
	["H-barrier (5 Blocks)","Land_HBarrier_5_F",100,"client\ui\pictures\hbarier5block.paa"],
	["H-barrier (Big, 4 Blocks)","Land_HBarrierBig_F",100,"client\ui\pictures\hbarierbig.paa"],
	["H-barrier Wall (Corner)","Land_HBarrierWall_corner_F",100,"client\ui\pictures\hbarrierwallcorner.paa"],
	["H-barrier Wall (Short)","Land_HBarrierWall4_F",50,"client\ui\pictures\hbarrierwallshort.paa"],
	["H-barrier Wall (Long)","Land_HBarrierWall6_F",100,"client\ui\pictures\hbarrierwalllong.paa"],
	["H-barrier Corridor","Land_HBarrierWall_corridor_F",100,"client\ui\pictures\hbarrierwallcorridor.paa"],
	["H-barrier Watchtower","Land_HBarrierTower_F",150,"client\ui\pictures\hbarrierwatchtower.paa"],

	["Building - Cargo House","Land_Cargo_House_V1_F",150,"client\ui\pictures\cargohouse.paa"],
	["Building - Cargo HQ","Land_Cargo_HQ_V1_F",300,"client\ui\pictures\cargohq.paa"],
	["Building - Cargo Tower","Land_Cargo_Patrol_V1_F",200,"client\ui\pictures\cargotower.paa"],
	["Building - Garage","Land_i_Garage_V1_F",200,"client\ui\pictures\garge.paa"],
	["Diesel Powerplant Tank (Small)","Land_dp_smallTank_F",200,"client\ui\pictures\tanksmall.paa"],
	["Diesel Powerplant Tank (Big)","Land_dp_bigTank_F",300,"client\ui\pictures\tankbig.paa"],
	["Reservoir Tower","Land_ReservoirTower_F",400,"client\ui\pictures\reservoirtower.paa"],
	["Altis Cargo Tower","Land_Cargo_Tower_V1_F",600,"client\ui\pictures\AltisCargoTower.paa"],
	["Fuel Pump","Land_FuelStation_Feed_F",1000,"client\ui\pictures\Land_FuelStation_Feed_F.paa"]
];

//General Store Item List
//Display Name, Classname, Description, Picture, Buy cost, Sell amount.
pvar_generalStore = [
	["Bottled Water","water",localize "STR_WL_ShopDescriptions_Water","client\ui\icons\water.paa",25,10],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\ui\icons\cannedfood.paa",25,10],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\ui\icons\briefcase.paa",100,50],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\ui\icons\medkit.paa",100,50],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\ui\icons\jerrycan.paa",100,50],
	["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\ui\icons\jerrycan.paa",50,25]
];

// ---- PUBLIC VARIABLES ----

publicVariable "pvar_teamSwitchList";
publicVariable "pvar_teamKillList";

publicVariable "clientMissionMarkers";

publicVariable "currentDate";
publicVariable "currentInvites";

publicVariable "pvar_allowPlayerIcons";
publicVariable "pvar_allowGroups";
publicVariable "pvar_clockCycle";

publicVariable "pvar_gameZones";
publicVariable "pvar_restrictedZones";
publicVariable "pvar_gunStoreLocations";
publicVariable "pvar_generalStoreLocations";
publicVariable "pvar_constructionStoreLocations";

publicVariable "pvar_weaponsArray";
publicVariable "pvar_ammoArray";
publicVariable "pvar_accessoriesArray";
publicVariable "pvar_uniformArray";
publicVariable "pvar_baseObjectList";
publicVariable "pvar_generalStore";

publicVariable "pvar_respawnHelicopter";

publicVariable "pvar_baseFlags";

diag_log format["*** serverVar Finshed ***"];