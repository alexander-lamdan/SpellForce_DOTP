-- to enable:		MapFlagSetTrue	{Name = "mf_P706_WeatherChangeEnabled"},
-- to disable:	MapFlagSetFalse	{Name = "mf_P706_WeatherChangeEnabled"},

Weather = { Grass = 1, Rocky = 2, Steppe = 3, Beast = 4, EndBoss = 5 };

WeatherFile = { 
	Grass = "P706_Grass", 
	Steppe = "P706_Steppe", 
	Rocky = "P706_Rocky", 
	Beast = "P706_Beast", 
	EndBoss = "P706_EndBoss",
};

-- local secFadeDuration = 30; -- seems to be buggy (?)





--*********************************************************************************** Init: change the timer
State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = ">>> Switching on... <<<",
		Conditions = 
		{
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Weather", Value = Weather.Grass},
		},		
		GotoState = "ON",		
	},
};





State
{
	StateName = "ON",
	
	--*********************************************************************** Change to Grass
	OnEvent
	{
		EventName = ">>> Change to Grass... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},
			
			MapValueIsNotEqual	{Name = "mv_P706_Weather", Value = Weather.Grass},

			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
			MapFlagIsTrue	{Name = "mf_P706_WeatherChangeEnabled"},

			OR
			{
				FigureIsInRect	{Tag = ftAvatar, Top = 537, Left = 0, Bottom = 0, Right = 208},
				FigureIsInRect	{Tag = ftAvatar, Top = 583, Left = 0, Bottom = 538, Right = 355},
				FigureIsInRect	{Tag = ftAvatar, Top = 712, Left = 0, Bottom = 584, Right = 584},
			},
		},
		Actions =
		{
			WeatherChange	{File = WeatherFile.Grass, FadeDuration = 200},
			
			MapValueSet	{Name = "mv_P706_Weather", Value = Weather.Grass},
		},
	},
	
	--*********************************************************************** Change to Rocky
	OnEvent
	{
		EventName = ">>> Change to Rocky... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},
			
			MapValueIsNotEqual	{Name = "mv_P706_Weather", Value = Weather.Rocky},
			
			AvatarIsNotTalking	{},			
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
			MapFlagIsTrue	{Name = "mf_P706_WeatherChangeEnabled"},
			
			OR
			{
				FigureIsInRect	{Tag = ftAvatar, Top = 278, Left = 455, Bottom = 0, Right = 712},
				FigureIsInRect	{Tag = ftAvatar, Top = 583, Left = 515, Bottom = 279, Right = 712},
				FigureIsInRect	{Tag = ftAvatar, Top = 712, Left = 585, Bottom = 584, Right = 712},
			},
		},
		Actions =
		{
			WeatherChange	{File = WeatherFile.Rocky, FadeDuration = 200},
			
			MapValueSet	{Name = "mv_P706_Weather", Value = Weather.Rocky},
		},
	},
		
	--*********************************************************************** Change to Steppe
	OnEvent
	{
		EventName = ">>> Change to Steppe... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},
			
			MapValueIsNotEqual	{Name = "mv_P706_Weather", Value = Weather.Steppe},
			
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
			MapFlagIsTrue	{Name = "mf_P706_WeatherChangeEnabled"},
			
			OR
			{
				FigureIsInRect	{Tag = ftAvatar, Top = 537, Left = 209, Bottom = 0, Right = 454},
				FigureIsInRect	{Tag = ftAvatar, Top = 583, Left = 356, Bottom = 279, Right = 514},
			},
		},
		Actions =
		{
			WeatherChange	{File = WeatherFile.Steppe, FadeDuration = 200},
			
			MapValueSet	{Name = "mv_P706_Weather", Value = Weather.Steppe},
		},
	},
	
--	--*********************************************************************** Stop when the NL bossfight starts (the bossfight also changes the weather)
--	OnEvent
--	{
--		EventName = ">>> Switch to endboss weather + end working... <<<",
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = 10},
--			
--			MapFlagIsTrue	{Name = "mf_P706_StartBossTransmute"}, -- set in Branch05_Endgame.lua when the buildings are destroyed, and the outcries are over
--		},
--		Actions =
--		{
--			WeatherChange	{File = "P706_Beast", FadeDuration = 200},
--		},
--		GotoState = "OFF",
--	},
};

	
	
	
	
--State
--{
--	StateName = "OFF",
--};