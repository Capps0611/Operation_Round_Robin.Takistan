//Selects Playable locations
//Moves Players
//Creates All triggers
#define SELF {_this call (missionNamespace getVariable ["RC_fnc_startMatch"]);}

_triggerLocs = (townLocations select floor (random (count townLocations))); //gets random location

//switchableUnits == SP testing ------- playableUnits == MP
_i = false;
waitUntil {{_x setPos _triggerLocs;}foreach playableUnits; _i = true; {_i == true;}}; 


//Creates marker for EOS Spawn

_marker1 = createMarker ["Zone", _triggerLocs];
_marker1 setMarkerShape "ELLIPSE";

"Zone" setMarkerSize [200, 200];


//EOS SYSTEM
[]execVM "eos\OpenMe.sqf";

//Creates Trigger to start each round
_trgobj = createTrigger ["EmptyDetector", _triggerLocs, true];
_trgobj setTriggerActivation ["EAST", "NOT PRESENT", true];
_trgobj setTriggerArea [5000, 5000, 0, false];
_trgobj setTriggerTimeout [0, 0, 0, true ];
_trgobj setTriggerStatements ["this", "[[[format['Round %1 complete',gameRound]],{hint (_this select 0);}], 'BIS_fnc_spawn', true, false, false] call BIS_fnc_MP;0 = [] execVM 'fn_game_round.sqf'",""];//Trig  Condition, On  Act, On Deact

sleep 5;
//Creates Trigger that ends game if all players are dead
_trgobj2 = createTrigger ["EmptyDetector", _triggerLocs, true];
_trgobj2 setTriggerActivation ["WEST", "NOT PRESENT", true];
_trgobj2 setTriggerArea [500, 500, 0, false];
_trgobj2 setTriggerTimeout [0, 0, 0, true ];
_trgobj2 setTriggerStatements ["this", "0 = [['end1',false,true], 'BIS_fnc_endMission', true, true] spawn BIS_fnc_MP", ""];


