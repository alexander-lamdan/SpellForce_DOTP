local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
	}
}
--TODO MS5: add all heroes

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = ">>> CS_07_INIT <<<" ,
		Conditions =
		{
		},
		Actions =
		{
		},	
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent
	{
		EventName = ">>> CS_02_Respawn <<<" ,
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P707_CS_07_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
		 	CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock17"},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock17"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			
		--	FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
		--	FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
		--	FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},
		--	FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 160.642, Y = 388.965},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 160.642, Y = 388.965},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 176.654},						

			MapFlagSetTrue {Name = "mf_P707_CS_07_Started"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_Take01",	
	},
};

--- elso kamera snitt
State
{
	StateName = "CS_Take01",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS01", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take02",
	},	

};

--- kamera snitt
State
{
	StateName = "CS_Take02",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_02 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take03",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take03",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_03 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS03", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take04",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take04",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_04 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take05",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take05",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_05 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS05", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take06",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take06",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_06 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take07",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take07",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_07 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS07", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take08",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take08",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_08 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take09",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take09",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_09 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS09", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take10",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take10",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_10 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS10", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take11",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take11",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_11 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS11", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take12",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take12",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_12 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS12", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take13",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take13",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_13 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS13", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take14",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take14",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_14 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS14", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take15",
	},		
};

--- kamera snitt
State
{
	StateName = "CS_Take15",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_15 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS15", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take16",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take16",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_16 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take17",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take17",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_17 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS17", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_sad.ska"},						
		},	
		GotoState = "CS_Take18",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take18",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_18 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take19",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take19",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_19 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS19", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take20",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take20",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_20 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS20", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take21",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take21",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_21 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS21", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take22",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take22",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_22 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take23",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take23",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_23 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS23", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take24",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take24",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_24 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS24", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take25",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take25",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_25 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS25", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take26",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take26",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_26 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS26", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take27",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take27",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_27 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS27", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take28",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take28",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_28 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS28", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take29",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take29",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_29 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS29", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take30",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take30",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_30 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS30", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take31",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take31",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_31 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS31", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take32",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take32",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_32 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS32", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take33",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take33",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_33 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS33", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take34",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take34",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_34 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS34", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take35",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take35",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_35 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS35", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_no.ska"},						
		},	
		GotoState = "CS_Take36",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take36",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_36 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS36", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take37",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take37",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_37 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS37", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take38",
	},	
};


--- kamera snitt
State
{
	StateName = "CS_Take38",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_38 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS07_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineStoryCS38", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "SHUTDOWN",
	},	
};

State
{
	StateName = "SHUTDOWN",
	
	OnOneTimeEvent 
	{
		EventName = ">>> SHUTDOWN <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CutsceneFINISH",
	},	
};

-- cutscene lezarasa, vege flag beallitasa
-- oriasi szopo: ha esc-et nyomsz, cutscene endkor idougras tortenik, szinte lehetetlen emiatt oda idoziteni, outcry is atugrodik, quest adas is.... ezerszer sirtam erte
State
{
	StateName = "CutsceneFINISH",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CS_07_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
	--	CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P707_CS_07_Ended"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




