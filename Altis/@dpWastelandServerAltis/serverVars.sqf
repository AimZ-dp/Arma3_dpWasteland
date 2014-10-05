//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse, AimZ =(dp)= , [CAD] Krycek
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!isDedicated) exitWith {};

diag_log format["*** serverVar Started ***"];

burningTimeLimit = 90;
desertedTimeLimit = 900;
ammoDesertedTimeLimit = 1800;
maxRandomTimeLimit = 900;

objectTimeOut = 15; 
objectCheckDelay = 10;

pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
// set the game to be tactical - no groups, no permanent team tags, no teamkill kicks.
allowPlayerIcons = "ON";
publicVariable "allowPlayerIcons";
allowGroups = "ON";
publicVariable "allowGroups";
clockCycle = "DAY ONLY";
publicVariable "clockCycle";
refuelVehicle = ["",0];
publicVariable "refuelVehicle";
defuelVehicle = ["",0];
publicVariable "defuelVehicle";

zones = [1,2,3,4];
publicVariable "zones";
restrictedZones = [1,3];
publicVariable "restrictedZones";

gunStoreLocations = [];
publicVariable "gunStoreLocations";
generalStoreLocations = [];
publicVariable "generalStoreLocations";
constructionStoreLocations = [];
publicVariable "constructionStoreLocations";


//Sea
Boat_Armed_01_base_F = [
    "O_Boat_Armed_01_hmg_F"			// Speedboat HMG		// Gunboat with HMG and GMG.
];
Boat_Armed_01_minigun_base_F = [
    "B_Boat_Armed_01_minigun_F",	// Speedboat Minigun	// Gunboat with Minigun and GMG.
    "I_Boat_Armed_01_minigun_F"		// Speedboat Minigun	// Gunboat with Minigun and GMG.
];
Rubber_duck_base_F = [
    //"B_G_Boat_Transport_01_F",	// Assault Boat			// Zodiac? Black!
    //"O_Boat_Transport_01_F",		// Assault Boat			// Zodiac? Woodland Camo!
    //"I_Boat_Transport_01_F",		// Assault Boat			// Zodiac? Digi Camo!
    //"B_Lifeboat",					// Rescue Boat			// Zodiac? Orange!
    //"O_Lifeboat",					// Rescue Boat			// Zodiac? Orange!
    //"C_Rubberboat",				// Rescue Boat			// Zodiac? Blue/White!
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
    "B_Heli_Light_01_F",        	// MH-9 - Hummingbird
    "O_Heli_Light_02_unarmed_F" 	// PO-30 - Ocra (Unarmed)
	//"I_Heli_light_03_unarmed_F"	// WY-55 - Hellcat (Unarmed)
];
TransportHelicopters = [
    "B_Heli_Transport_01_F",      // UH-80 - Ghosthawk
    "B_Heli_Transport_01_camo_F", // UH-80 - Ghosthawk
    "I_Heli_Transport_02_F"	  		// CH-49 - Mohawk
];
AttackHelicopters = [
    "B_Heli_Attack_01_F",       	// AH-99 - Blackfoot
    "O_Heli_Attack_02_F",      		// Mi-48 - Kajman
    "O_Heli_Attack_02_black_F",		// Mi-48 - Kajman
    "B_Heli_Light_01_armed_F",  	// AH-9 - Pawnee
    "O_Heli_Light_02_F"         	// PO-30 - Ocra
	//"I_Heli_light_03_F"				// WY-55 - Hellcat
];
ArmedFighterPlanes = [
    "B_Plane_CAS_01_F",             	// A-164 Wipeout CAS
    "O_Plane_CAS_02_F",             	// To-199 Neophron CAS
    //"I_Plane_Fighter_03_AA_F",		// A-143 Buzzard AA
    "I_Plane_Fighter_03_CAS_F"			// A-143 Buzzard CAS
];

//Ground
Quadbikes = [
    "B_Quadbike_01_F",
    "O_Quadbike_01_F",
    "C_Quadbike_01_F",
    "I_Quadbike_01_F",
    "B_G_Quadbike_01_F"
];
Cars = [
    "C_Offroad_01_F",
    "B_G_Offroad_01_F",
    "B_G_Offroad_01_armed_F",
    "C_SUV_01_F",
    "C_Hatchback_01_F",
    "C_Hatchback_01_sport_F"
];
Trucks = [
    "C_Van_01_box_F",
    //"C_Van_01_fuel_F",
    "C_Van_01_transport_F",
    //"B_G_Van_01_fuel_F",
    //"B_G_Van_01_transport_F",
    //"B_Truck_01_ammo_F",
    "B_Truck_01_box_F",
    "B_Truck_01_covered_F",
    "B_Truck_01_fuel_F",
    "B_Truck_01_medical_F",
    "B_Truck_01_mover_F",
    "B_Truck_01_Repair_F",
    "B_Truck_01_transport_F",
    //"O_Truck_02_Ammo_F",
    "O_Truck_02_box_F",
    "O_Truck_02_covered_F",
    "O_Truck_02_fuel_F",
    "O_Truck_02_medical_F",
    "O_Truck_02_transport_F",
    //"O_Truck_03_Ammo_F",          // Tempest
    "O_Truck_03_covered_F",         // Tempest
    "O_Truck_03_device_F",          // Tempest
    "O_Truck_03_fuel_F",            // Tempest
    "O_Truck_03_medical_F",         // Tempest
    "O_Truck_03_repair_F",          // Tempest
    "O_Truck_03_transport_F",       // Tempest
    //"I_Truck_02_ammo_F",
    "I_Truck_02_box_F",
    "I_Truck_02_covered_F",
    //"I_Truck_02_fuel_F",
    "I_Truck_02_medical_F",
    "I_Truck_02_transport_F"
];
UnarmedMRAPVehicles = [
	"B_MRAP_01_F", 
	"O_MRAP_02_F", 
	"I_MRAP_03_F"
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
    "B_APC_Wheeled_01_cannon_F",
    "O_APC_Wheeled_02_rcws_F",
    "I_APC_Wheeled_03_cannon_F",
	"I_APC_tracked_03_cannon_F",
    "B_APC_Tracked_01_rcws_F",
    "B_APC_Tracked_01_CRV_F",
    "B_APC_Tracked_01_AA_F",
    "O_APC_Tracked_02_cannon_F",
    "O_APC_Tracked_02_AA_F"	
];
MainBattleTanks = [
    "B_MBT_01_cannon_F",
    //"B_MBT_01_arty_F",
    //"B_MBT_01_mlrs_F",
    //"O_MBT_02_arty_F",
    "O_MBT_02_cannon_F",
	"I_MBT_03_cannon_F"
];
//Unmanned
UnmannedAirVehicles = [
    "B_UAV_01_F",
    "O_UAV_01_F",
    "I_UAV_01_F",
    "B_UAV_02_F",
    "O_UAV_02_F",
    "I_UAV_02_F",
    "B_UAV_02_CAS_F",
    "O_UAV_02_CAS_F",
    "I_UAV_02_CAS_F"
];
UnmannedGroundVehicles = [
    "B_UGV_01_F",
    "O_UGV_01_F",
    "I_UGV_01_F",
    "B_UGV_01_rcws_F",
    "O_UGV_01_rcws_F",
    "I_UGV_01_rcws_F"
];

//Object List - Random Spawns.
baseObjectList = [
	"Land_Pipes_small_F",
	"Land_Pipes_large_F",
	"Land_IronPipes_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BagBunker_Small_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_1_F"
];
survivalObjectList = [
	"Land_Sacks_goods_F",
	"Land_MetalBarrel_F",
	"Land_CanisterPlastic_F"
];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = [
	//"arifle_SDAR_F",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20C_F",
	"arifle_Mk20_GL_F",
	"SMG_01_F",
	"SMG_02_F",
	//"hgun_P07_F", // issue: causes server errors when this pistol is used
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_PDW2000_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_02_F"
];

//weapons to remove from ammo crates
removeWeapons = [	
    //"launch_NLAW_F",
    //"launch_RPG32_F",
    "LMG_Mk200_F",
    "LMG_Mk200_MRCO_F",
    "LMG_Mk200_pointer_F",
    "LMG_Zafir_F",
	"LMG_Zafir_pointer_F",
    "srifle_EBR_F",
    "srifle_EBR_ACO_F",
    "srifle_EBR_MRCO_pointer_F",
    "srifle_EBR_SOS_F",
    "srifle_EBR_ARCO_pointer_F",
    "srifle_EBR_ARCO_pointer_snds_F",
    "srifle_GM6_F",
    "srifle_GM6_SOS_F",
    "srifle_LRR_F",
    "srifle_LRR_SOS_F",
    "hgun_P07_F",
    "hgun_P07_snds_F",
    "hgun_Rook40_F",
    //"hgun_Rook40_snds_F",
    "hgun_ACPC2_F",
    //"hgun_ACPC2_snds_F",
    //"arifle_Katiba_F",
    //"arifle_Katiba_C_F",
    //"arifle_Katiba_GL_F",
    "arifle_Katiba_C_ACO_pointer_F",
    "arifle_Katiba_C_ACO_F",
    "arifle_Katiba_C_ACO_pointer_snds_F",
    "arifle_Katiba_ACO_F",
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
    //"arifle_MXC_F",
    //"arifle_MX_F",
    //"arifle_MX_GL_F",
    //"arifle_MX_SW_F",
    //"arifle_MXM_F",
	//"arifle_MXC_Black_F",
	//"arifle_MX_Black_F",
	//"arifle_MX_GL_Black_F",
	//"arifle_MX_SW_Black_F",
	//"arifle_MXM_Black_F",
    "arifle_MX_pointer_F",
    "arifle_MX_Holo_pointer_F",
    "arifle_MX_Hamr_pointer_F",
    "arifle_MX_ACO_pointer_F",
    "arifle_MX_ACO_F",
    "arifle_MX_ACO_pointer_snds_F",
    "arifle_MX_RCO_pointer_snds_F",
    "arifle_MX_GL_ACO_F",
    "arifle_MX_GL_ACO_pointer_F",
    "arifle_MX_GL_Hamr_pointer_F",
    "arifle_MX_GL_Holo_pointer_snds_F",
    "arifle_MXC_Holo_F",
    "arifle_MXC_Holo_pointer_F",
    "arifle_MXC_ACO_F",
    "arifle_MXC_Holo_pointer_snds_F",
    "arifle_MXC_SOS_point_snds_F",
    "arifle_MXC_ACO_pointer_snds_F",
    "arifle_MXC_ACO_pointer_F",
    "arifle_MX_SW_pointer_F",
    "arifle_MX_SW_Hamr_pointer_F",
    "arifle_MXM_Hamr_pointer_F",
    "arifle_MXM_SOS_pointer_F",
    "arifle_MXM_RCO_pointer_snds_F",
    "arifle_SDAR_F",
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
    "launch_B_Titan_F",
    "launch_I_Titan_F",
    "launch_O_Titan_F",
    "launch_Titan_F",
    "launch_B_Titan_short_F",
    "launch_I_Titan_short_F",
    "launch_O_Titan_short_F",
    "launch_Titan_short_F",
    //"arifle_Mk20_F",
    //"arifle_Mk20C_F",
    //"arifle_Mk20_GL_F",
    "arifle_Mk20_plain_F",
    "arifle_Mk20_pointer_F",
    "arifle_Mk20_Holo_F",
    "arifle_Mk20_ACO_F",
    "arifle_Mk20_ACO_pointer_F",
    "arifle_Mk20_MRCO_F",
    "arifle_Mk20_MRCO_pointer_F",
    "arifle_Mk20C_plain_F",
    "arifle_Mk20C_ACO_F",
    "arifle_Mk20C_ACO_pointer_F",
    "arifle_Mk20_GL_plain_F",
    "arifle_Mk20_GL_MRCO_pointer_F",
    "arifle_Mk20_GL_ACO_F",
    "arifle_Mk20_MRCO_plain_F",
    //"SMG_01_F",
    "SMG_01_Holo_F",
    "SMG_01_Holo_pointer_snds_F",
    "SMG_01_ACO_F",
    //"SMG_02_F",
    "SMG_02_ACO_F",
    "SMG_02_ARCO_pointg_F",
    //"hgun_PDW2000_F",
    "hgun_PDW2000_snds_F",
    "hgun_PDW2000_Holo_F",
    "hgun_PDW2000_Holo_snds_F"
];
removeAmmo = [	
	"MiniGrenade", 
	"HandGrenade"
];
vehicleAddition = [
    "muzzle_snds_H",
    "muzzle_snds_M",
    "muzzle_snds_L",
    "muzzle_snds_B",
    "muzzle_snds_H_MG",
    "muzzle_snds_acp",
    "optic_Yorris",
	"optic_MRD",
	"optic_Arco",
    "optic_Hamr",
    "optic_Aco",
    "optic_ACO_grn",
    "optic_Aco_smg",
    "optic_ACO_grn_smg",
    "optic_Holosight",
    "optic_Holosight_smg",
    "optic_MRCO",
    "acc_flashlight",
    "acc_pointer_IR"
    //"optic_SOS",
	//"optic_DMS",
	//"optic_LRPS",
    //"optic_NVS",
    //"optic_Nightstalker",
    //"optic_tws",
    //"optic_tws_mg",
    //"Laserdesignator_mounted"
];

vehicleAddition2 = [
	"Chemlight_blue",
	"Chemlight_red",
	"Chemlight_green",
	"Chemlight_yellow"
];

vehicleAddition3 = [
    //"NVGoggles",
    //"NVGoggles_OPFOR",
    //"NVGoggles_INDEP",
    //"Laserdesignator",
    "Medikit",
    "FirstAidKit",
    "ToolKit",
    "MineDetector",
    "Rangefinder",
    "Binocular"
];
 
ammoBoxes = [
	"Box_NATO_Ammo_F",
	"Box_NATO_Wps_F",
	"Box_NATO_Wps_F",
	//"Box_NATO_Grenades_F",	// too many granade spamming happening, these only hold nades and smoke
	//"Box_NATO_WpsLaunch_F",	// too many launchers in game, need to give the helis a chance
	//"Box_NATO_AmmoOrd_F",
	//"Box_NATO_WpsSpecial_F",
	"Box_NATO_Support_F",
	"Box_East_Ammo_F",
	"Box_East_Wps_F",
	"Box_East_Wps_F",
	//"Box_East_Grenades_F",	// too many granade spamming happening, these only hold nades and smoke
	//"Box_East_WpsLaunch_F",	// too many launchers in game, need to give the helis a chance
	//"Box_East_AmmoOrd_F",
	//"Box_East_WpsSpecial_F",
	"Box_East_Support_F",
	//"Box_East_AmmoVeh_F", 
	"Box_IND_Ammo_F",
	"Box_IND_Wps_F",  			// issue: LODShape::AddLoadHandler: Handler not present in shape [a3\weapons_f\empty.p3d]
	"Box_IND_Wps_F",
	//"Box_IND_Grenades_F",		// too many granade spamming happening, these only hold nades and smoke
	//"Box_IND_WpsLaunch_F",	// too many launchers in game, need to give the helis a chance
	//"Box_IND_AmmoOrd_F",
	//"Box_IND_WpsSpecial_F",
	"Box_IND_Support_F"
	//"Box_IND_AmmoVeh_F" 
];

missionAmmoBoxes = [
	"Box_NATO_Ammo_F",
	"Box_NATO_Wps_F",
	//"Box_NATO_Grenades_F",	// too many granade spamming happening, these only hold nades and smoke
	//"Box_NATO_WpsLaunch_F",	// too many launchers in game, need to give the helis a chance
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_WpsSpecial_F",
	"Box_NATO_Support_F",
	//"Box_NATO_AmmoVeh_F", 
	
	"Box_East_Ammo_F",
	"Box_East_Wps_F",
	//"Box_East_Grenades_F",	// too many granade spamming happening, these only hold nades and smoke
	//"Box_East_WpsLaunch_F",	// too many launchers in game, need to give the helis a chance
	"Box_East_AmmoOrd_F",
	"Box_East_WpsSpecial_F",
	"Box_East_Support_F",
	//"Box_East_AmmoVeh_F", 
	
	"Box_IND_Ammo_F",
	"Box_IND_Wps_F",  			// issue: LODShape::AddLoadHandler: Handler not present in shape [a3\weapons_f\empty.p3d]
	//"Box_IND_Grenades_F",		// too many granade spamming happening, these only hold nades and smoke
	//"Box_IND_WpsLaunch_F",		// too many launchers in game, need to give the helis a chance
	"Box_IND_AmmoOrd_F",
	"Box_IND_WpsSpecial_F",
	"Box_IND_Support_F"
	//"Box_IND_AmmoVeh_F" 
];

supplyCrate = [
	"B_supplyCrate_F",
	"I_supplyCrate_F",
	"O_supplyCrate_F",
	"IG_supplyCrate_F"
];
 
MissionSpawnMarkers = [
	["Mission_1",false],
	["Mission_2",false],
	["Mission_3",false],
	["Mission_4",false],
	["Mission_5",false],
	["Mission_6",false],
	["Mission_7",false],
	["Mission_8",false],
	["Mission_9",false],
	["Mission_10",false],
	["Mission_11",false],
	["Mission_12",false],
	["Mission_13",false],
	["Mission_14",false],
	["Mission_15",false],
	["Mission_16",false],
	["Mission_17",false],
	["Mission_18",false],
	["Mission_19",false],
	["Mission_20",false]
];

SeaMissionSpawnMarkers = [
	["SeaMission_1",false],
	["SeaMission_2",false],
	["SeaMission_3",false],
	["SeaMission_4",false]
];

JetMissionSpawnMarkers = [
	["JetMission_1",false],
	["JetMission_2",false]
];


// THESE NEED TO BE FULLY GLOBAL

//Marker Name, Radius, City Name
cityList = [
		["Town_1",180,"Livadi"],
		["Town_2",80,"Kavala"],
		["Town_3",80,"Zaros"],
		["Town_4",150,"Kore"],
		["Town_5",150,"Athira"],
		["Town_6",200,"Eginio"],
		["Town_7",80,"Dorida"],
		["Town_8",200,"Panagia"],
		["Town_9",80,"Molos"],
		["Town_10",180,"Kalithea"],
		["Town_11",160,"Galati"],
		["Town_12",150,"Sfaka"],
		["Town_13",120,"Frini"],
		["Town_14",80,"Pyrgos"],
		["Town_15",120,"Iraklia"],
		["Town_16",180,"Krya Nera"],		
		["Town_17",80,"Ekali"],
		["Town_18",120,"Agios Dionysios"],
		["Town_19",80,"Neochori"],
		["Town_20",80,"Paros"],
		["Town_21",80,"Syrta"],
		["Town_22",80,"Telos"],
		["Town_23",80,"Negades"],
		["Town_24",80,"Sofia"],
		["Town_25",80,"Charkia"],
		["Town_26",80,"Loannina"],
		["Town_27",80,"Oreokastro"]
];
cityLocations = [];
bayList = [
		["Bay_1",180,"Ammolofi Bay"],
		["Bay_2",80,"Tonos Bay"],
		["Bay_3",80,"Kalithea Bay"],
		["Bay_4",150,"Pefkas Bay"],
		["Bay_5",150,"Galana Nera Bay"],
		["Bay_6",200,"Molos Bay"],
		["Bay_7",80,"Thelos Bay"],
		["Bay_8",200,"Chalkeia Bay"],
		["Bay_9",80,"Mazi Bay"],
		["Bay_10",180,"Livadi Bay"],
		["Bay_11",160,"Pyrgos Gulf"],
		["Bay_12",150,"Katalaki Bay"],
		["Bay_13",120,"Melanera Bay"],
		["Bay_14",80,"Naftia Bay"],
		["Bay_15",120,"Zaros Bay"],
		["Bay_16",180,"Edessa Bay"],		
		["Bay_17",80,"Iremi Bay"],
		["Bay_18",120,"Panochori Bay"],
		["Bay_19",80,"Neri Bay"],
		["Bay_20",80,"Kavala Bay"],
		["Bay_21",80,"Negades Bay"],
		["Bay_22",80,"Pyrgos Gulf"],
		["Bay_23",80,"Pyrgos Gulf"],
		["Bay_24",80,"Pyrgos Gulf"],
		["Bay_25",80,"Panochori Bay"]
];
bayLocations = [];
airportList = [
		["Airport_1",180,"Airport 1"],
		["Airport_2",80,"Airport 2"],
		["Airport_3",80,"Airport 3"],
		["Airport_4",150,"Airport 4"],
		["Airport_5",150,"Airport 5"],
		["Airport_6",200,"Airport 6"]
];
airportLocations = [];

diag_log format["*** serverVar Finshed ***"];