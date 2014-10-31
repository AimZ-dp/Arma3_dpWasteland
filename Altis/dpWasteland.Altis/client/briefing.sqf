
diag_log format["*** briefing Started ***"];

player createDiarySubject ["changelog", "Change Log"];
player createDiarySubject ["rules", "Rules"];
player createDiarySubject ["gameplayhelp", "Gameplay / Help"];
player createDiarySubject ["website", "Website & TS3"];
player createDiarySubject ["credit", "Credit"];

player createDiaryRecord["changelog",
[
"404Games",
"
<br/>1.06<br/>
		[Fixed] Fix to make Ammo boxes moveable.(thanks to meat147).<br/>
		[Fixed] missing disabled color for money input error.(thanks to Sanjo).<br/>
		[Fixed] NV Goggles in cars and boxes.(thanks to Sanjo).<br/>
<br/>1.05<br/>
		[Added] Uniforms,Hats and Vests to the gunstore.<br/>
		[Added] Players now spawn with a backpack.<br/>
		[Fixed] Not able to get weapons out of vehicle.<br/>
		[Fixed] R3F Loading into vehicles.<br/>
		[Fixed] Gunstore locations so they can't be ran down by vehicles.<br/>
		[Fixed] Health Icon.<br/>
		[Fixed] Static helicopter spawning and no more explosions.<br/>
		[Fixed] Weapon crates can now be loaded into vehicles.<br/>
<br/>1.03<br/>
		[Added] - Light Armed Vehicle Mission (All armed cars).<br/>
		[Removed] - All armed cars from initial spawn for balance.<br/>
<br/>1.02<br/>
		[Fixed] - Respawning Vehicles<br/>
		[Fixed] - Deserted Vehicles (20Mins)<br/>
<br/>1.01<br/>
		[Fixed] - Gun Stores<br/>
		[Fixed] - Missions<br/>
		[Fixed] - General UI<br/>
		[Fixed] - Lots of other fixes<br/>
"
]
];

player createDiaryRecord["changelog",
["=(dp)=","
<br/>2.7.7<br/>
	[Fixed] Attempt at stopping Respawn Heli and going off course.<br/>
	[Improvement] Changed the size of objects and capacity of vehicles.<br/>
	[Improvement] Increased vehicles to 160 and added server code to remove physics of distant vehicles.<br/>
	[Improvement] Hopefully stopped stores spawning on roads.<br/>
	[BUG] First para drop of first joiner seems bugged, fine for all other drops.<br/>
<br/>2.7.6<br/>
	[Improvement] Respawn Heli.<br/>
	[Improvement] Clean objects after 10 mins.<br/>
	[Improvement] Money mission.<br/>
	[Improvement] Loot AI for money.<br/>
	[Improvement] Sell price for guns now 50% buy price.<br/>
	[Improvement] Slowed down the food and water.<br/>
<br/>2.7.5<br/>
	[Improvement] All locations gathered from map data.<br/>
	[Improvement] Changed vehicle spawns to near roads.<br/>
	[Improvement] Added a para Jump option when flying.<br/>
	[Improvement] New mission to destroy 2 armed helicopters.<br/>
	[Improvement] Removed town markers.<br/>
	[Improvement] Ammo Boxes now spawn in military buildings, instead of random town.<br/>
<br/>2.7.4<br/>
	[Bug] AI seem to run away. Stopped them fleeing due to being scared.<br/>
<br/>2.7.3<br/>
	[Improvement] Lots of changes moving code to the server side.<br/>
	[Improvement] Stores and zones can be random or fixed on server start.<br/>
<br/>2.7.2<br/>
	[Improvement] remove scanner - will replace with a perk later.<br/>
	[Improvement] Player Spawn: spawn in bays.<br/>
	[Improvement] GUI: Update the interface (blue is liked).<br/>
	[Improvement] Stores: Double stores in each zone, don't spawn in restricted zones.<br/>
	[Improvement] vehicles: Update vehicles list, Everything apart from support, balance after few games.<br/>
	[Improvement] vehicles: Helicopters have open doors.<br/>
	[Improvement] vehicles: spawn in bays.<br/>
	[Update] Weapons: Update weapons list - Everything, need to start balancing after a few games.<br/>
	[Improvement] If holstered, action for main weapon.<br/>
	[Improvement] Weapons: crates spawn in bays.<br/>
	[Improvement] Mission: Double up the missions (spawn second controller after sleep, issue will be the markers).<br/>
	[Improvement] Increase heli spawn radius.<br/>
	[Bug] Repeated Player Menu action, enter vehicle - BIS must of changed player vehicle interaction.<br/>
	[Bug] Store lamp disappeared.<br/>
	[Bug] Gun guy needs to be more aggressive.<br/>
	[Bug] Can not refuel jerry can.<br/>
	[Improvement] Remove icon from welcome screen.<br/>
	[Bug] Jump bug, don't hold down V.<br/>
	[Bug] Load in bug, items are duplicated in truck and object stays on ground.<br/>
<br/>2.7.1<br/>
	Moved over to Altis map.<br/>
	[Improvement] Created restricted zones to close off half the map.<br/>
	[Improvement] Made changes to the stores spawning positions.<br/>
	[Improvement] Made changes to the mission spawn positions.<br/>
	[Improvement] Made changes to the store guys, so the are not so static.<br/>
	[Bug] Fixed Boat Spawn - SUV array was commented out.<br/>
	[Bug] Fixed surveiller_conditions_actions_menu.sqf - fn_findstring is not a valid function.<br/>
	[Bug] 2x Scanner Actions - BIS must of made RespawnOnStart a permanent feature.<br/>
	[Bug] Multiple Player Menu Actions - BIS must of made RespawnOnStart a permanent feature.<br/>
	[Improvement] Remove Fatigue.<br/>
	[Bug] Logistics Not Working  - ArmA3 is now extremely picky about local\global vars, must make sure declared in private.<br/> 
	[Improvement] Holster gun wanted.<br/>
	[Improvement] Jump wanted.<br/>
	[Improvement] Change the Caps players are spawned with.<br/>
	[Bug] AI left over from mission.<br/>
	[Bug] Remove bobcat heli? glitched when getting out.<br/>
<br/>2.7<br/>
<br/>Merged Following changes made by CADelta v2.5 to v2.6:<br/>
Thanks to Krycek who took on dp server whilst I was out of action.<br/>
		[Ignored] Kept original dp clean up scripts, these are specific for all re-coding made to the dp Wasteland. Can not use a generic clean scripts. Will see what I can use from new scripts in future updates.<br/>
		[Ignored] Admin panel changes, these didn't change how it worked. Plus dp founders should have admin rights ;-). Moved all new admins across.<br/>
		[Merged] Addition of a Moderator Panel.<br/>
		[Merged] joinUnassigned to allow auto assign to faction.<br/>
		[Merged] Grammar and text updates made throughout the mission.<br/>
		[Merged] Changes to all Store positions.<br/>
		[Merged] Removed Abbyland and Added Fuel Stations.<br/>
		[Merged] Positions of mission markers.<br/>
		[Merged] Addition of Boat Spawns.<br/>
		[Merged] Addition of Sea Missions.<br/>
		[Merged] Addition of Jet Mission.<br/>
		[Merged] Changes to store prices and options.<br/>
		[Merged] Addition of construction images (0t0 M0t0).<br/>
		[Merged] Addition of extra ui icons.<br/>
		[Merged] rsc common class fixes.<br/>
		[Merged] Check for nearest soldiers checks with parent classes.<br/>
		[Merged] Removed Camo Net object.<br/>
		[Merged] Allow fuelFull to be added to loot on body.<br/>
		[Merged] Changes to hunger\thirst speed and silent hints.<br/>
		[Merged] Removed Admin name from warn message.<br/>
		[Merged] Increases to distance spawned next to an object.<br/>
		[Merged] Detection of low fuel when syphoning.<br/>
		[Merged] Slowed down the scanner recharge.<br/>
		[Merged] Lots of changes to the R3F Addon.<br/>
		[Merged] Change to covoy route.<br/>
		[Merged] Replaced the mission duplication code.<br/>
		[Merged] Increase to the all spawn radius.<br/>
<br/>2.4.4<br/>
		[Update] Relocated gun stores<br/>
		[Update] Added a third construction store<br/>
		[Update] Added base building items<br/>
		[Update] Removed broken uniform items<br/>
<br/>2.4.3<br/>
		[Update] Tweaks for the crashes... unknown outcome!<br/>
<br/>2.4.2<br/>
		[Fixed] Fixed money bug with UAV Backpacks.<br/>
		[Fixed] Removed ammo truck.<br/>
		[Fixed] Changed wording of the abandoned vehicle mission.<br/>
		[Update] Added website name.<br/>
<br/>2.4.1<br/>
		[Fixed] Changed scanner strength out of debug, now 5 percent chance for enemies.<br/>
		[Fixed] Client side indestructible buildings.<br/>
<br/>2.4<br/>
		[Update] Added new weapons and vehicles.<br/>
		[Update] Updated missions for new vehicles.<br/>
		[Fixes] Stopped map buildings from moved.<br/>
		[Fixes] Delay with tags showing on fresh spawns.<br/>
		[Investigating] Spawn with full loadout.<br/>
<br/>2.3<br/>
		[Update] Performance tweaks.<br/>
		[Update] Reset store guys.<br/>
		[Fixes] Fatigue whilst driving.<br/>
		[Fixes] Slowed down thirst and hunger.<br/>
		[Fixes] Fixed refueling of none local vehicles.<br/>
		[Fixes] Fixed repairing of none local vehicles.<br/>
<br/>2.2<br/>
		[Update] New base building objects.<br/>
		[Update] New fatigue system.<br/>
		[Fixes] Fixed Day Cycle selection.<br/>
		[Fixes] Fixed most animations.<br/>
		[Fixes] Fixed refueling vehicles.<br/>
		[Fixes] Fixed repairing vehicles.<br/>
		[Investigating] Sinking bodies...<br/>
<br/>2.1.1<br/>
		[Fixes] Updated scanner and time change.<br/>
<br/>2.1<br/>
		[Updates] Additional admin features and new scanner.<br/>
<br/>2.0<br/>
		[Updates] Major updates on all scripts to improve performance.<br/>
<br/>1.6<br/>
		[Updates] Optimised spawn scripts.<br/>
<br/>1.5<br/>
		[Updates] Included new missions.<br/>
		[Updates] Changed the way vehicles desertion time works.<br/>
<br/>1.4<br/>
		[Updates] Updated the vehicle classes for beta version.<br/>
		[Updates] Changed weapons in some crates.<br/>
		[Updates] Created a random spawn for vehicles after destroyed.<br/>
<br/>1.3<br/>
		[Updates] Updated the weapon classes for beta version.<br/>
		[Updates] Changed some of the prices in general store.<br/>
<br/>1.2<br/>
		[Updates] Updated the vehicle classes for beta version.<br/>
<br/>1.1<br/>
		[Added] Clean up scripts to try keep server smoother.<br/>
		[Fixed] Updated load in issue with losing ammo and scopes.<br/>
		[Update] Lots of tweaks to spawning and types of objects.<br/>
		[Update] Changed lots of scripts to keep server running smooth without need for restarts every day.<br/>
		<br/>
<br/>1.0<br/>
		[Note] Added and modified lots of issues, some things might not be so obvious.<br/>
		<br/>
"]];

player createDiaryRecord["rules",
["General Rules","
<br/>
Rule 1:<br/>
- Anyone caught running cheat scripts will be Banned (we share Ban-lists with other servers).<br/>
<br/>
Rule 2:<br/>
- Anyone caught with obscene amount of cash will be instantly Banned. Contact our staff straight away, so we can remove them.<br/>
<br/>
Rule 3:<br/>
- Do not steal from team mates bags. Punishment for doing so ranges from removal of weapons and/or cash,to being slayed, kicked or banned.<br/>
<br/>
Rule 4:<br/>
- Do not intentionally Teamkill. Punishment for doing so ranges from removal of weapons and/or cash, to being Slayed, Kicked or Banned.<br/>
<br/>
Rule 5:<br/>
- Do not talk in global unless it is an emergency, type but do not talk! Shout (CAPS) only when its very important and you want an Admins attention. Failing to obey these rules will be warned, repeat offences will result in Kick and/or Ban.<br/>
<br/>
Rule 6:<br/>
- Do not spam any chat channel. Anyone doing so will be warned, repeat offences will result in Kick and/or Ban.<br/>
<br/>
Rule 7:<br/>
- Only talk and type English in Side and Global, if you want to use your native language then simply make a Group. Anyone not following this rule will be warned, repeat offences will result in Kick and/or Ban.<br/>
<br/>
Rule 8:<br/>
- Again do not grief or abuse team mates. Result will be Kick and/or Ban.<br/>
"]];

player createDiaryRecord["rules",
["Important","
<br/>
Be respectful to Admins and they will be the same.<br/>
Remember the Admins are gamers and want to game in the server too.<br/>
If you feel you have a valid reason to appeal a Ban you can get in touch with the Admin team by either registering on our website or stop by on our Public Teamspeak 3 Server.<br/>
<br/>
dp-clan.enjin.com<br/>
"]];

player createDiaryRecord["gameplayhelp",
["Game Play - Standard","
<br/>
Please register on our website at dp-clan.enjin.com and join dp Wasteland Community to find out what we are up to and what our future plans for the Servers are. Suggestions for future versions of dp Wasteland are always welcome<br/><br/>
General Game Play:<br/>
- Each player starts with the following in their player menu: 1 food, 1 water, 1 single use Medkit, 1 single use Repair kit and 1 full Jerry Can.<br/>
- Jerry cans can be filled at the gas station, the general stores, green oil barrels found around the island or by syphoning fuel from vehicles.<br/>
- Loot dead bodies for money and players gear. Items are no longer stored in the lame brown sack.<br/>
- To give someone an item you must stand close to them and use the player menu to give the selected item to the select player.<br/>
- The general store sells, food, water, single use Medkits and repair kits and fuel.<br/>
- There are usually 58 ground vehicles, 8 Helis, 12 ammo/weapons crates, 12 survival items (food sacks, water containers) in the game at any one time.<br/>
- Vehicles with mounted guns, wheeled APCs, tracked armour, armed Helis and extra ammo/weapons crates can be obtained by completing the regular in-game objectives.<br/>
- Only the lower powered guns can be found in vehicles. Higher powered guns and launchers can be found in ammo/weapons crates or bought at the Gun stores.<br/>
- Gunstores sell a full range of Weaponry and Ammo.<br/>
- To build a base buy items from the Construction Store make sure to leave space for the objects to spawn in, vehicles and sandbags dont mix well.<br/>
- The Scanner will detect the enemy and display their coloured tag above their head. This is only a 5% chance for a second. The scanner will also display team mates tags if the Admin has disabled them for a hardcore game.<br/>
"]];

player createDiaryRecord["gameplayhelp",
["Game Play - Hardcore","
<br/>
Hardcore Mode:<br/>
- The dp Wasteland mod allows the Admin to disable player tags and/or disable groups to give a harder more tactical game play (This has had good feedback apart for the odd troll).<br/>
- This is not difficult to understand or get use too, so please give it a go and dont whine.<br/>
- Tags are disabled for everyone, Blufor, Opfor and Independents. Use your scanner to identify players (sometimes the coloured cap are a decoy).<br/>
- Think before shooting, even with tags off excessive team killing can result in a Kick from the server.<br/>
- Try stay in cover and even talk over direct chat and engage with the other player.<br/>
- Remember Independents vs Independents so dont complain if everyone kills you, if groups are disabled they are disabled for everyone.<br/>
"]];

player createDiaryRecord["website",
["Community","
<br/>
dp-clan.enjin.com<br/>
<br/>
Feel free to register on our website and use the forum.<br/>
By request of several players we have added a donation module to the website.<br/>
"]];
player createDiaryRecord["website",
["Teamspeak 3 Server","
<br/>
**It just changed, so please ask for it.**<br/>
"]];

player createDiaryRecord["credit",
["Credits","
<br/>
	Credit due to the 404 Team who worked on the mod before I made my changes:<br/><br/>
	Deadbeat<br/>
	Costlyy<br/>
	Pulse<br/>
	Domuk<br/>
	Many others...<br/>
<br/>
	Credit due to whoever created the anti-hack used on most other mods...<br/>
<br/>
	Credit goes to Conroy and Terox for the Zeus AI Addon.<br/>
<br/>
	Credit to AimZ =(dp)= for providing the foundation for now the best Wasteland Mod around :D.<br/>
<br/>
	Much credit goes towards the guys working on A3 Wasteland. MercyfulFate and AgentRev thank you for continuing looking in on this mod from time to time. :)<br/>
<br/>
	Last, but diffentiently not least, a huge thanks to the ArmA 3 Community and especially the 'Arma Script Makers' Skype channel. You have been a great help keeping my hair attached to my head.<br/>
<br/>
	Best Regards,<br/>
	[CAD] Krycek<br/>
<br/>
"]];

diag_log format["*** briefing Finished ***"];