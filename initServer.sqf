// Apply daytime from multiplayer lobby setting
[paramsArray select 0] call BIS_fnc_paramDaytime;


// Initialize dynamic groups
["Initialize",[true]] call BIS_fnc_dynamicGroups;


//Warns players of start time
[[[format["Mission Start in %1 minutes",(paramsArray select 2)]], {hint (_this select 0);}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP; //Start countdown for mission start
sleep ((paramsArray select 2)*60);

// Starts the match
[]spawn RC_fnc_startMatch;
