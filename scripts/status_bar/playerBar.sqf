waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

	_rscLayer = "statusBar" call BIS_fnc_rscLayer;
	_rscLayer cutRsc["statusBar","PLAIN"];
	systemChat format["Status Bar...", _rscLayer];
	[] spawn 
	{

		sleep 5;
		//set the color values.
		//Additional color codes can be found here:  http://html-color-codes.com/
		_colourDefault  = parseText "#ADADAD"; //set your default colour here
		_colour100 		= parseText "#336600";
		_colour90 		= parseText "#339900";
		_colour80 		= parseText "#33CC00";
		_colour70 		= parseText "#33FF00";
		_colour60 		= parseText "#66FF00";
		_colour50 		= parseText "#CCFF00";
		_colour40 		= parseText "#CCCC00";
		_colour30 		= parseText "#CC9900";
		_colour20 		= parseText "#CC6600";
		_colour10 		= parseText "#CC3300";
		_colour0 		= parseText "#CC0000";
		_colourDead 	= parseText "#000000";
			
	
	while {true} do 
	{
		sleep 1;
				
		//moved the creation of the status bar inside the loop and create it if it is null,
		//this is to handle instance where the status bar is disappearing 
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			_rscLayer = "statusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc["statusBar","PLAIN"];
		};		
		
		//initialize variables and set values
		_unit = _this select 0;
		_nakit = [life_cash] call life_fnc_numberText;
		_bank = ([life_atmbank] call life_fnc_numberText);
		_fps = format["%1", diag_fps];
		_polis = (west countSide playableUnits);
		_doktor = (independent countSide playableUnits);
		_sivil = (civilian countSide playableUnits);
		_time = (round(240-(serverTime)/60));  //edit the '240' value (60*4=240) to change the countdown timer if your server restarts are shorter or longer than 4 hour intervals
		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));
		_players = (count playableUnits);
		
		
		switch(_minutes) do	{
			case 9: {_minutes = "09"};
			case 8: {_minutes = "08"};
			case 7: {_minutes = "07"};
			case 6: {_minutes = "06"};
			case 5: {_minutes = "05"};
			case 4: {_minutes = "04"};
			case 3: {_minutes = "03"};
			case 2: {_minutes = "02"};
			case 1: {_minutes = "01"};
			case 0: {_minutes = "00"};
		};
						
		
		//Colour coding
		//Damage
		
		
		//Stamina
		
		//display the information 
		((uiNamespace getVariable "statusBar")displayCtrl 55555)ctrlSetStructuredText parseText 
			format["
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\players.paa' color='%10'/> %2</t>
			<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\polis.paa' color='%11'/> %3</t> 
			<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\doktor.paa' color='%11'/> %4</t> 
			<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\sivil.paa' color='%11'/> %5</t> 
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\nakit.paa' color='%10'/> %6</t> 
			<t shadow='1' shadowColor='#000000' color='%12'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\banka.paa' color='%12'/> %11</t>  
			<t shadow='1' shadowColor='#000000' color='%10'>FPS: %7</t>
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\ts3.paa' color='%10'/>103.58.149.52</t>
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\restart.paa' color='%10'/>Restart: %9:%10</t>
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='scripts\status_bar\images\icon.paa' color='%10'/> </t>",
					"%", 
					_players,
					_polis,
					_doktor,
					_sivil,
					_nakit, 
					round diag_fps, 
					//format["%1/%2",_xx,_yy],
					_hours,
					_minutes,
					_bank
					
				];
		
		
				
			
	}; 
};