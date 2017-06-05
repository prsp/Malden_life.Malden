/*
    File: init.sqf
    Author: 
    
    Description:
    
*/

StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";

StartProgress = true;

DYNAMICMARKET_boughtItems = [];
[player] remoteExec ["TON_fnc_playerLogged",RSERV];