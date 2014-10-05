
diag_log format["*** createKeyboardEvent Started ***"];

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

diag_log format["*** createKeyboardEvent Finished ***"];
