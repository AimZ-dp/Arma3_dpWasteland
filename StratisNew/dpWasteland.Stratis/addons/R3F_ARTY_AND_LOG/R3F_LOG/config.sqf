/**
 * English and French comments
 * Commentaires anglais et fran�ais
 * 
 * This file contains the configuration variables of the logistics system.
 * Fichier contenant les variables de configuration du syst�me de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes d�rivant de celles utilis�es dans les variables de configuration seront aussi valables.
 */

/*
 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * folowing appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 * 
 * Deux moyens existent pour g�rer de nouveaux objets avec le syst�me logistique. Le premier consiste � ajouter
 * ces objets dans les listes appropri�es ci-dessous. Le deuxi�me est de cr�er un fichier externe dans le r�pertoire
 * /addons_config/ selon le m�me sch�ma que ceux qui existent d�j�, et d'ajouter un #include � la fin de ce pr�sent fichier.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des v�hicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs = [
    "Offroad_01_base_F",
	"SUV_01_base_F",
	"Hatchback_01_base_F",
	"Van_01_base_F",
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
    "Wheeled_APC_F",
	"APC_Tracked_01_base_F",
    "APC_Tracked_02_base_F",
    "APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables = [
    "Offroad_01_base_F",
	"SUV_01_base_F",
	"Hatchback_01_base_F",
	"Van_01_base_F",
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
    "Wheeled_APC_F",
	"APC_Tracked_01_base_F",
    "APC_Tracked_02_base_F",
    "APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"Heli_Light_01_base_F",
	"Heli_Light_02_base_F",
	"Heli_Transport_01_base_F",
	"Heli_Transport_02_base_F",
	"Heli_Attack_01_base_F",
	"Heli_Attack_02_base_F",
	"Heli_Light_01_armed_base_F",
	"I_Heli_light_03_base_F",
    "Plane_CAS_01_base_F",
	"Plane_CAS_02_base_F",
	"Plane_Fighter_03_base_F"
];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des v�hicules a�riens pouvant h�liporter des objets h�liportables.
 */
R3F_LOG_CFG_heliporteurs = [
    "Helicopter_Base_F"
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets h�liportables.
 */
R3F_LOG_CFG_objets_heliportables = [
    "B_Quadbike_01_F",
    "O_Quadbike_01_F",
    "C_Quadbike_01_F",
    "I_Quadbike_01_F",
	"B_G_Quadbike_01_F",
    "C_Offroad_01_F",
	"B_G_Offroad_01_F",
	"B_G_Offroad_01_armed_F",
	"C_SUV_01_F",
	"Hatchback_01_base_F",
    "Truck_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
    "Wheeled_APC_F",
	"APC_Tracked_01_base_F",
    "APC_Tracked_02_base_F",
    "APC_Tracked_03_base_F",
	"MBT_01_base_F",
    "MBT_02_base_F",
    "MBT_03_base_F",
	"O_Boat_Armed_01_hmg_F",
	"B_Boat_Armed_01_minigun_F",
	"I_Boat_Armed_01_minigun_F",
	"B_G_Boat_Transport_01_F",
	"B_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"I_Boat_Transport_01_F",
	"B_Lifeboat",
	"O_Lifeboat",
	"C_Rubberboat",
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_rescue_F",
	"C_Boat_Civil_01_police_F",
	"Land_Cargo20_military_green_F",
	"Land_Cargo40_military_green_F",
	"Land_Cargo_Tower_V1_F"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USVehicleBox "weights" 12 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le r�f�rentiel arbitraire utilis� est : une caisse de munition de type USVehicleBox "p�se" 12 unit�s.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorit� d'une d�claration de capacit� sur une autre correspond � leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient � la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est d�clar� avec une capacit� de 140 avant "Car". Et que "Car" est d�clar� apr�s "Truck" avec une capacit� de 40,
 *   Alors toutes les sous-classes appartenant � "Truck" auront une capacit� de 140. Et toutes les sous-classes appartenant
 *   � "Car", except�es celles de "Truck", auront une capacit� de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des v�hicules (terrestres ou a�riens) pouvant transporter des objets transportables.
 * Le deuxi�me �l�ment des tableaux est la capacit� de chargement (en relation avec le co�t de capacit� des objets).
 */
R3F_LOG_CFG_transporteurs = [
//	Trucks & Vans
	["Truck_01_base_F", 50],
	["Truck_03_base_F", 50],
	["Truck_02_base_F", 50],
	["Van_01_base_F", 50],
//	MRAPs
	["MRAP_01_base_F", 20],
	["MRAP_02_base_F", 20],
	["MRAP_03_base_F", 20],
//	Light Armour
	["Wheeled_APC_F", 20],
	["APC_Tracked_01_base_F", 20],
	["APC_Tracked_02_base_F", 20],
	["APC_Tracked_03_base_F", 20],
//	Heavy Armour
	["MBT_01_base_F", 20],
	["MBT_02_base_F", 20],
	["MBT_03_base_F", 20],
//	Helis
	["Heli_Light_01_base_F", 10],			// MH-9 & AH-9
	["Heli_Transport_01_base_F", 50],		// UH-80
	["Heli_Attack_01_base_F", 10],			// AH-99
	["Heli_Light_02_base_F", 10],			// PO-30
	["Heli_Attack_02_base_F", 10],			// Mi-48
	["Heli_Transport_02_base_F", 50],		// CH-49
	["I_Heli_light_03_base_F", 10],			// WY-55
//	Offroads
	["Offroad_01_base_F", 20],
//	Cars
	["SUV_01_base_F", 10],
	["Hatchback_01_base_F", 10],
//	ATVs
    ["Quadbike_01_base_F", 5],
//	Boats
	["Ship_F", 10],
//	Boxes and Containers
	["Land_Pallet_MilBoxes_F", 20],
	["Land_CargoBox_V1_F", 50],
	["Land_Cargo20_military_green_F", 50],
	["Land_Cargo40_military_green_F", 50]
];

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxi�me �l�ment des tableaux est le co�t de capacit� (en relation avec la capacit� des v�hicules).
 */
 
R3F_LOG_CFG_objets_transportables =  [
	["FlagPole_F", 1],
	["Land_HelipadCivil_F",5],
//	Crates / containers
	["NATO_Box_Base", 1],
	["EAST_Box_Base", 1],
	["Box_Ammo_F", 1],
	["Land_Box_AmmoOld_F", 1],
	["IND_Box_Base", 1],
	["I_supplyCrate_F", 1],
//	Structures
	["Land_Sacks_goods_F", 1],
	["Land_Pipes_small_F", 1],
	["Land_Pipes_large_F", 1],
	["Land_MetalBarrel_F", 1],
	["Land_IronPipes_F", 1],
	["Land_ConcretePipe_F", 1],
	["Land_BagFence_Corner_F", 1],
	["Land_BagFence_End_F", 1],
	["Land_BagFence_Long_F", 1],
	["Land_BagFence_Round_F", 1],
	["Land_BagFence_Short_F", 1],
	["Land_CncBarrier_F", 2],
	["Land_CncBarrier_stripes_F", 2],	
	["Land_CncBarrierMedium_F", 2],
	["Land_CncBarrierMedium4_F", 5],
	["Land_CncWall1_F", 2],
	["Land_CncWall4_F", 5],
	["Land_CncShelter_F", 5],	
	["Land_HBarrier_1_F", 2],
	["Land_HBarrier_3_F", 2],
	["Land_HBarrier_5_F", 2],
	["Land_HBarrierBig_F", 2],
	["Land_HBarrierWall_corner_F", 5],
	["Land_HBarrierWall4_F", 5],
	["Land_HBarrierWall6_F", 5],
	["Land_HBarrierWall_corridor_F", 5],
	["Land_HBarrierTower_F", 5],
	["Land_Crash_barrier_F", 1],
	["Land_LampHalogen_F", 1],
	["Land_CanisterFuel_F", 1],
	["Land_CanisterPlastic_F", 1],
	["Land_Cargo_House_V1_F", 10],
	["Land_Cargo_HQ_V1_F", 10],
	["Land_Cargo_Patrol_V1_F", 10],
	["Land_Unfinished_Building_01_F", 10],
	["Land_Unfinished_Building_02_F", 10],
	["Land_BarGate_F", 1],
	["Land_RampConcrete_F", 2],	
	["Land_RampConcreteHigh_F", 2],	
	["Land_Obstacle_Bridge_F", 2],	
	["Land_New_WiredFence_10m_F", 5],	
	["Land_BagBunker_Small_F", 5],
	["Land_BagBunker_Large_F", 5],	
	["Land_BagBunker_Tower_F", 5],	
	["Land_Concrete_SmallWall_4m_F", 5],
	["Land_Concrete_SmallWall_8m_F", 5],
	["Land_i_Garage_V1_F", 10],
	["Land_dp_smallTank_F", 10],	
	["Land_dp_bigTank_F", 10],
	["Land_ReservoirTower_F", 10],
	["Land_Cargo_Tower_V1_F", 10],
	["Land_FuelStation_Feed_F", 2]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */

R3F_LOG_CFG_objets_deplacables = [
	"FlagPole_F",
	"Land_HelipadCivil_F",
	"Quadbike_01_base_F",
	"ReammoBox_F",
	"Land_Pallet_MilBoxes_F",
	"Land_CargoBox_V1_F",
	"Cargo_base_F",
	"Land_Sacks_goods_F",
	"Land_Pipes_small_F",
	"Land_Pipes_large_F",
	"Land_MetalBarrel_F",
	"Land_IronPipes_F",
	"Land_ConcretePipe_F",
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
	"Land_HBarrier_1_F",
	"Land_Crash_barrier_F",
	"Land_LampHalogen_F",
	"Land_CanisterFuel_F",
	"Land_CanisterPlastic_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_BarGate_F",
	"Land_RampConcrete_F",
	"Land_RampConcreteHigh_F",
	"Land_Obstacle_Bridge_F",
	"Land_New_WiredFence_10m_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Tower_F",
	"Land_CncBarrier_stripes_F",
	"Land_CncShelter_F",
	"Land_Concrete_SmallWall_4m_F",
	"Land_Concrete_SmallWall_8m_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrierWall_corridor_F",
	"Land_HBarrierTower_F",
	"Land_i_Garage_V1_F",
	"Land_Unfinished_Building_01_F",
	"Land_Unfinished_Building_02_F",
	"Land_dp_smallTank_F",
	"Land_dp_bigTank_F",
	"Land_ReservoirTower_F",
	"Land_Cargo_Tower_V1_F",
	"Land_FuelStation_Feed_F"
];

/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 * 
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalit�s logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
//#include "addons_config\arma2_CO_objects.sqf"
