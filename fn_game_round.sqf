//Round Counter

if(gameRound == 0)then
{
	gameRound = gameRound + 1;
}else
{
	sleep 4;
	gameRound = gameRound +1;
	[[[format["Current Round: %1",gameRound]],{hint (_this select 0);}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP;
	sleep (paramsArray select 1); //make a param? maybe?
	[[[format["Round: %1 Starting... Good Luck",gameRound]],{hint (_this select 0);}], "BIS_fnc_spawn", true, false, false] call BIS_fnc_MP;
	null = [["zone"],[0,1],[(gameRound*2),2],[0,0],[0],[0],[0,0],[5,0,350,EAST,TRUE]] call EOS_Spawn;

};


	