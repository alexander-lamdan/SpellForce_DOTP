local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
	--	"'pl_HumanHeroFirst'",		
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
		"'pl_HumanHeroOrc'",
		--"'Surian'",
		"'pl_HumanCompanionCraigHuman'",
		"'pl_HumanCompanionSariel'",
		"'ShadowWarrior'",
	}
}
--TODO MS5: add all heroes

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = ">>> CS_02_INIT <<<" ,
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
		EventName = ">>> CS_Respawn <<<" ,
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P708_CS_02_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_CS_02_Started"},

			_tRenderList,
		 	CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionSariel"},
			CutsceneFigureWeaponsHide {Tag = "ShadowWarrior"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 177.697, Y = 563.655},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 177.697, Y = 563.655},
			--CutsceneFigureTeleport {Tag = "Surian", X = 177.678, Y = 641.836},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 179.044, Y = 564.395},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 179.044, Y = 564.395},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 180.248, Y = 562.898},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 180.248, Y = 562.898},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 175.138, Y = 563.083},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 175.138, Y = 563.083},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 173.953, Y = 562.291},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 173.953, Y = 562.291},

			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},			
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 0},			
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 0},			
			FigureLookAtDirection {Tag = "pl_HumanCompanionSariel", Direction = 0},			
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 0},			

			
			--FigureNpcSpawn {Tag = "Corrupted1", Level = 20, UnitId = 1311, X = 149.871, Y = 528.999, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted2", Level = 20, UnitId = 80, X = 177.901, Y = 495.825, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted3", Level = 20, UnitId = 79, X = 200.48, Y = 510.477, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted4", Level = 20, UnitId = 1072, X = 177.919, Y = 478.561, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted5", Level = 20, UnitId = 1073, X = 178.193, Y = 458.828, Team = "tm_Team2"},					
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS01", Tag = "ShadowWarrior"},
			EntityTimerStart	{Name = "et_CStimer"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS02", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_emote_taunt.ska"},		
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS03", Tag = "pl_HumanAvatar"},
			EntityTimerStop {Name = "et_CStimer"},		
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_point.ska"},			
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
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS04", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_emote_taunt.ska"},		
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS05", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS06", Tag = "ShadowWarrior"},
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
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS07", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS08", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "ShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_emote_no.ska"},		
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS09", Tag = "pl_HumanHeroOrc"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS10", Tag = "ShadowWarrior"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS11", Tag = "pl_HumanHeroOrc"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS12", Tag = "ShadowWarrior"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS13", Tag = "pl_HumanAvatar"},
			EntityTimerStop {Name = "et_CStimer"},			
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS14", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "ShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_emote_no.ska"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS15", Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS16", Tag = "ShadowWarrior"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS17", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS18", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "ShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_emote_no.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS19", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS20", Tag = "ShadowWarrior"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS21", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_sad.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS22", Tag = "ShadowWarrior"},
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
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS23", Tag = "ShadowWarrior"},
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
--			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS24", Tag = "ShadowWarrior"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS25", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS26", Tag = "ShadowWarrior"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS27", Tag = "pl_HumanCompanionSariel"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS28", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take29",
	},	
};

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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS29", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "CS_Take30",
	},	
};

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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS30", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "CS_Take31",
	},	
};

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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS31", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "CS_Take32",
	},	
};

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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS32", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "CS_Take33",
	},	
};

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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS33", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "CS_Take34",
	},	
};

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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "GuideCS34", Tag = "ShadowWarrior"},
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
		EventName = ">>> CS_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStop {Tag = "pl_HumanHeroOrc"},
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionSariel"},
			CutsceneFigureWeaponsShow {Tag = "ShadowWarrior"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P708_CS_02_Ended"},

		},	
		GotoState = "CutsceneEnd",
	},	
};


State
{
	StateName = "CutsceneEnd",
};




