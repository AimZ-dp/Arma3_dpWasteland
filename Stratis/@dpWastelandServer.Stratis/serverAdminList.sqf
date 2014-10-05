
if(!isDedicated) exitWith {};

diag_log format["*** admins Started ***"];

//Admin menu access levels
moderators = []; 
publicVariable "moderators"; 
           
administrators = [];
publicVariable "administrators";

serverAdministrators = []; 
publicVariable "serverAdministrators";

dpModerators = ["76561198015530539",	// Krycek
				"76561197978678558",	// JBorst
				"76561198015810797",	// Flexmaster
				"76561197962457464",	// Rexen
				"76561198014669991",	// rzon
				"76561197960887049",	// ChambaWamba/Allurbase
				"76561197996468328",	// Jay13Bry
				"76561198042379470"	// Peace Maker
];
publicVariable "dpModerators"; 			// Changed from "moderators" to "dpModerators"

serverdpAdministrators = ["76561197997049796", // AimZ
						"76561197968757638", // Dougal07
						"76561197974559017", // TandY
						"76561197990155710"  // Abbylad
                    ]; 
publicVariable "serverdpAdministrators";

diag_log format["*** admins Finshed ***"];