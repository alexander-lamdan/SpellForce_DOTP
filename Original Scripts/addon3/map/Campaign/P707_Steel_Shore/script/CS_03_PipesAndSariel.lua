local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroFirst'",		
		"'pl_HumanHeroSecond'",
		"'pl_HumanHeroOrc'",
		"'Surian'",
		"'pl_HumanCompanionCraigHuman'",
		"'Ayro'",
		"'Shae'",
		"'Sariel'"
	}
}
--TODO MS5: add all heroes

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = ">>> CS_03_INIT <<<" ,
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
		EventName = ">>> CS_03_Respawn <<<" ,
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P707_CS_03_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
		 	CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsHide {Tag = "Ayro"},
			CutsceneFigureWeaponsHide {Tag = "Shae"},
			CutsceneFigureWeaponsHide {Tag = "Sariel"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 135.975, Y = 427.978 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 135.975, Y = 427.978 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 177.568},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 177.568},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 138.096, Y = 427.107 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 138.096, Y = 427.107 },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 180.17},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 180.17},
			
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 144.286, Y = 428.675 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 144.286, Y = 428.675 },
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 183.97},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 183.97},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 139.394, Y = 428.641 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 139.394, Y = 428.641 },
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 180.408},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 180.408},
			
			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanCompanionCraigHuman"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanCompanionCraigHuman"},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 183.97},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 183.97},
			
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "pl_HumanHeroFirst"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "pl_HumanHeroFirst"},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 183.97},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 183.97},

			MapFlagSetTrue {Name = "mf_P707_CS_03_Started"},
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
		EventName = ">>> CS_03_Take_01 <<<" ,
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS01", Tag = "Surian"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS02", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS03", Tag = "Surian"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS04", Tag = "pl_HumanHeroOrc"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS05", Tag = "pl_HumanCompanionCraigHuman"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS06", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS07", Tag = "pl_HumanHeroCaine"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS08", Tag = "Surian"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS09", Tag = "pl_HumanHeroOrc"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_cheer.ska"},
	
			FigureTeleportToEntity {Tag = "Sariel", TargetTag = "Cs03Place2"},
			FigureTeleportToEntity {Tag = "Sariel", TargetTag = "Cs03Place2"},

			FigureTeleportToEntity {Tag = "Ayro", TargetTag = "Cs03Place2"},
			FigureTeleportToEntity {Tag = "Ayro", TargetTag = "Cs03Place2"},

			FigureTeleportToEntity {Tag = "Shae", TargetTag = "Cs03Place2"},
			FigureTeleportToEntity {Tag = "Shae", TargetTag = "Cs03Place2"},

			FigureLookAtDirection {Tag = "Sariel", Direction = 180},
			FigureLookAtDirection {Tag = "Sariel", Direction = 180},
			FigureLookAtDirection {Tag = "Shae", Direction = 180},
			FigureLookAtDirection {Tag = "Shae", Direction = 180},
			FigureLookAtDirection {Tag = "Ayro", Direction = 180},
			FigureLookAtDirection {Tag = "Ayro", Direction = 180},
	
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS11", Tag = "Surian"},		
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS12", Tag = "Ayro"},
			FigureAnimPlayOnce	{Tag = "Ayro", File = "base/gfx/figures/hero/figure_hero_male_emote_point.ska"},			

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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "Sariel", TargetTag = "PSariel"},
			FigureForcedRunToEntity	{Tag = "Shae", TargetTag = "PAyro"},
			FigureForcedRunToEntity	{Tag = "Ayro", TargetTag = "PAyro"},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS13", Tag = "Shae"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS14", Tag = "Sariel"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS15", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},		
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroOrc", File = "base/gfx/figures/npc/figure_npc_orc_champion_emote_sad.ska"},				
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS16", Tag = "pl_HumanHeroCaine"},
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_bow.ska"},			

			FigureTeleportToEntity {Tag = "Sariel", TargetTag = "PSariel"},
			FigureTeleportToEntity {Tag = "Sariel", TargetTag = "PSariel"},

			FigureTeleportToEntity {Tag = "Shae", TargetTag = "PShae"},
			FigureTeleportToEntity {Tag = "Shae", TargetTag = "PShae"},

			FigureTeleportToEntity {Tag = "Ayro", TargetTag = "PAyro"},
			FigureTeleportToEntity {Tag = "Ayro", TargetTag = "PAyro"},

			FigureLookAtDirection {Tag = "Sariel", Direction = 10.496},
			FigureLookAtDirection {Tag = "Sariel", Direction = 10.496},
			FigureLookAtDirection {Tag = "Shae", Direction = 21.9551},
			FigureLookAtDirection {Tag = "Shae", Direction = 21.9551},
			FigureLookAtDirection {Tag = "Ayro", Direction = 0},
			FigureLookAtDirection {Tag = "Ayro", Direction = 0},
			
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS17", Tag = "Sariel"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "Sariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_emote_beg.ska"},			
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS18", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS19", Tag = "Sariel"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "Sariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_emote_yes.ska"},						
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS20", Tag = "Ayro"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "Ayro", File = "base/gfx/figures/hero/figure_hero_male_emote_military.ska"},			
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS21", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shae", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS22", Tag = "Shae"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS23", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS24", Tag = "Ayro"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shae", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS25", Tag = "Shae"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS26", Tag = "pl_HumanHeroCaine"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS27", Tag = "Ayro"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shae", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS28", Tag = "Shae"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS29", Tag = "Ayro"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shae", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS30", Tag = "Shae"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS31", Tag = "Ayro"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS32", Tag = "Sariel"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS33", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS34", Tag = "Sariel"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "Sariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_emote_no.ska"},			
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS35", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS36", Tag = "Sariel"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS37", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shae", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS38", Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take39",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take39",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_39 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS39", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take40",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take40",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_40 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ayro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS40", Tag = "Ayro"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take41",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take41",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_41 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS41", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take42",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take42",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_42 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecondCS42", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_cheer.ska"},
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
		EventName = ">>> CS_03_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		--CutsceneSayIsDone {},	
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "Shae"},
			CutsceneFigureWeaponsShow {Tag = "Ayro"},
			CutsceneFigureWeaponsShow {Tag = "Sariel"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P707_CS_03_Ended"},

		},	
		GotoState = "CutsceneEnd",
	},	
};


State
{
	StateName = "CutsceneEnd",
};




