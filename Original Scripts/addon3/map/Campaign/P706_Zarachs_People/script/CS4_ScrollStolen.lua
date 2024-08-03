local _tRenderList = CutsceneFigureRenderList{Tag = ftAvatar}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'ShaikanBoss'",	
		"'DuelPitGuard'",
		"'DuelPitGuard2'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanCompanionCraigHuman'",
		
		"'DuelAudienceSoldier1'",
		"'DuelAudienceSoldier2'",
		"'DuelAudienceSoldier3'",
		"'DuelAudienceSoldier4'",
		"'DuelAudienceSoldier5'",
		"'DuelAudienceSoldier6'",
		
		"'DuelAudienceMage1'",
		"'ShaikanWarrantOfficer'",

-- cord = shaikanwarrantofficer
-- futók: teleport - DuelPitGuard, DuelPitGuard2

		
--		"'DuelAudienceWorker1'",
--		"'DuelAudienceWorker2'",
--		"'DuelAudienceWorker3'",
	},
}



State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> mv_P706_State_ShaikanBoss == 3 (3: player won the duel) <<<",
		Conditions =
		{	
			--MapFlagIsTrue{ Name = "mf_P706_MainInit_Ended" },
			
			MapValueIsEqual	{Name = "mv_P706_State_ShaikanBoss", Value = 3},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			_tRenderList,
		  CutsceneBegin{},

-- FOR TEST ONLY
		--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "ShaikanBoss", Level = 1, UnitId = 2029, X = 149.943, Y = 261.886, Team = "tm_Neutral"},},
		--amúgy meg teleport
		FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "Pos_DuelPitArrivalPoint"},
		FigureTeleportToEntity {Tag = "ShaikanBoss", TargetTag = "Pos_ShaikanBoss"},
		FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
		FigureLookAtDirection {Tag = "ShaikanBoss", Direction = 90},
		CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
		CutsceneFigureWeaponsHide {Tag = "ShaikanBoss"},
		CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
		CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
		CutsceneFigureWeaponsHide {Tag = "ShaikanWarrantOfficer"},

		CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 166.063, Y = 262.61 },
		CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 166.063, Y = 262.61 },
		FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 263.511},
	
		CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 163.296, Y = 260.09 },
		CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 163.296, Y = 260.09 },
		FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 273.511},
		
		CutsceneFigureTeleport {Tag = "DuelPitGuard", X = 144.445, Y = 259.698 },
		CutsceneFigureTeleport {Tag = "DuelPitGuard", X = 144.445, Y = 259.698 },
		CutsceneFigureTeleport {Tag = "DuelPitGuard", X = 144.445, Y = 259.031 },
		FigureLookAtDirection {Tag = "DuelPitGuard", Direction = 117.899},

		CutsceneFigureTeleport {Tag = "DuelPitGuard2", X = 146.476, Y = 264.042 },
		CutsceneFigureTeleport {Tag = "DuelPitGuard2", X = 146.476, Y = 264.042 },
		FigureLookAtDirection {Tag = "DuelPitGuard2", Direction = 96.4396},
	
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "TAKE01",
	},
};

State
{
	StateName = "TAKE01",
	
	OnOneTimeEvent
	{
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Yasha", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen01", Tag = "ShaikanBoss"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS_Take02",
	},
	
--	OnOneTimeEvent
--	{
--		EventName = ">>> Respawn Avatar if dead (and counting) <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanAvatar"},
--			
--		},
--		Actions =
--		{
--			AvatarSpawn	{Player = "pl_Human", X = 214.896, Y = 381.659, Direction = 0},
--			
--			FigureHealthSet	{Tag = "pl_HumanAvatar", Percent = 20},
--		},	
--	},

--	OnOneTimeEvent
--	{
--		EventName = ">>> Respawn Caine if dead (and counting) <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroCaine", TargetTag = "pl_HumanHeroCaine_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanHeroCaine", Percent = 20},
--		},	
--	},
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> Respawn Craig if dead (and counting) <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanCompanionCraigHuman"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionCraigHuman", TargetTag = "pl_HumanCompanionCraigHuman_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanCompanionCraigHuman", Percent = 20},
--		},	
--	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Respawn Orc Hero if dead (and counting) <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroOrc", TargetTag = "pl_HumanHeroOrc_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroOrc", Percent = 20},
		},	
	},

--	OnOneTimeEvent
--	{
--		EventName = ">>> Respawn Sariel if dead (and counting) <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanCompanionSariel"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionSariel", TargetTag = "pl_HumanCompanionSariel_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanCompanionSariel", Percent = 20},
--		},	
--	},	
	
	OnOneTimeEvent
	{
		EventName = ">>> Respawn Hero1 if dead (and counting) <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroFirst"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroFirst", TargetTag = "pl_HumanHeroFirst_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroFirst", Percent = 20},
		},	
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Respawn Hero2 if dead (and counting) <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroSecond"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroSecond", TargetTag = "pl_HumanHeroSecond_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroSecond", Percent = 20},
		},	
	},
	
--	OnOneTimeEvent
--	{
--		EventName = ">>> Respawn Hero3 if dead (and counting) <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanHeroThird"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroThird", TargetTag = "pl_HumanHeroThird_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanHeroThird", Percent = 20},
--		},	
--	},
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take03",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Yasha", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen03", Tag = "ShaikanBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take04",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take05",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Yasha", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen05", Tag = "ShaikanBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take06",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take07",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Yasha", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen07", Tag = "ShaikanBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take08",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS4_ScrollStolen_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen08", Tag = "DuelAudienceSoldier1"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take09",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Yasha", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen09", Tag = "ShaikanBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_TakeELHUZ",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_TakeELHUZ",
	
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
			CameraTakeAddToTrack {File = "CS4_ScrollStolen_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureForcedRun {Tag = "ShaikanBoss", X = 145, Y = 290},
			FigureForcedRun {Tag = "DuelPitGuard", X = 145, Y = 290},
			FigureForcedRun {Tag = "DuelPitGuard2", X = 145, Y = 290},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take10",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take10",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_10 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take11",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen11", Tag = ftHeroCaine},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_TakeCORDENTER",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take13",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take13",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_13 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureTeleportToEntity {Tag = "ShaikanWarrantOfficer", TargetTag = "Pos_ShaikanBoss"},
			FigureLookAtDirection {Tag = "ShaikanWarrantOfficer", Direction = 80},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen13", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take14",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_TakeCORDENTER",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_TakeCORDENTER <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- cordteleport
			CutsceneFigureTeleport {Tag = "ShaikanWarrantOfficer", X = 141.537, Y = 252.198 },
			FigureSimpleWalk {Tag = "ShaikanWarrantOfficer", X = 149.943, Y = 261.886}, 

			--FigureLookAtDirection {Tag = "Surian", Direction = 0},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS4_ScrollStolen_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take13",
	},	
};



-- kamera snitt
State
{
	StateName = "CS_Take14",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_14 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
--			FigureIsInRangeToEntity	{Tag = "ShaikanWarrantOfficer", TargetTag = "Pos_ShaikanBoss", Range = 1},
			
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Cord", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen14", Tag = "ShaikanWarrantOfficer"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take15",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen15", Tag = ftHeroCaine},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take16",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take17",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Cord", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen17", Tag = "ShaikanWarrantOfficer"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take18",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take19",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Cord", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen19", Tag = "ShaikanWarrantOfficer"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take20",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen20", Tag = ftCompCraig},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take21",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Cord", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_ScrollStolen21", Tag = "ShaikanWarrantOfficer"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take22",
	},	
};

-- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take23",
	},	
};

-- kamera snitt
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS4_ScrollStolen23", Tag = "pl_HumanAvatar"},
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

State
{
	StateName = "CutsceneFINISH",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",

		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "ShaikanBoss"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "ShaikanWarrantOfficer"},
		--	FigureVanish	{Tag = "ShaikanBoss"},
		--	FigureVanish	{Tag = "DuelPitGuard"},
		--	FigureVanish	{Tag = "DuelPitGuard2"},
		},	
		GotoState = "ENDED",
	},	
};

State
{
	StateName = "ENDED",
	
	OnOneTimeEvent
	{
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},

			MapTimerStart	{Name = "mt_P706_MQ062_CONVINCE_Completed"},
		},
	},
};