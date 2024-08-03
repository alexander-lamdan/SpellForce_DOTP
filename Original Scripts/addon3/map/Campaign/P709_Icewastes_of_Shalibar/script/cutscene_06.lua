--************************************************************
--*                                                          *
--*   Icewastes of Shalibar :: CutScene: Freeing of Kerona   *
--*                                                          *
--************************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "kerona"}

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'kerona'",
		
		"'Surian'",
		
		"'pl_HumanHeroCaine'",
	--	"'pl_HumanHeroOrc'",
	--	"'pl_HumanHeroFirst'",
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
		"'pl_HumanCompanionCraigHuman'",
		"'pl_HumanCompanionSariel'",
		
	}
}

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "CS06_INIT" ,
		Conditions =
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS06_Start"},
			
		},
		Actions =
		{

		},
	},

	-- the scene starts as soon as the cutscene start flag start is true
	-- can define the renderlist, hide weapons, can telepor the figures, etc.
	-- all of the cuts are in separated states
	
	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P709_CS06_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,

			CutsceneBegin{},
			CutsceneCombatOff {},

		--			For Test
		--	ObjectVanish {Tag = "prison"},
	
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 434.22, Y = 543.42 },
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Kerona"},


			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 428.695, Y = 543.479 },
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "Kerona"},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 436.629, Y = 543.901 },
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona"},

		--	FigureTeamTransfer	{Tag = "pl_HumanCompanionSariel", Team = "tm_Neutral"},
		--	FigureVanish	{Tag = "pl_HumanCompanionSariel"},
		--	NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Sariel_de_Genya", Level = 30, UnitId = 2085, X = 10, Y = 10, Team = "tm_Neutral"},},

			CutsceneFigureTeleport {Tag = "Surian", X = 430.966, Y = 522.832 },
			FigureLookAtEntity {Tag = "Surian", TargetTag = "Kerona"},

		--	FigureTeamTransfer	{Tag = "kerona", Team = "tm_Player"},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionSariel"},
		
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "P709_CUT_CS06_T001_CAINE",
	},
};

--	P709_CUT_CS06_T001_CAINE

State
{
	StateName = "P709_CUT_CS06_T001_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 432.594, Y = 541.042 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 432.594, Y = 541.042 },
			FigureLookAtEntity {Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona"},

			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T002_AVATAR",
	},	
};

--	P709_CUT_CS06_T002_AVATAR

State
{
	StateName = "P709_CUT_CS06_T002_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS06_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T002_AVATAR", Tag = "pl_HumanAvatar"},
			-- And there is Kerona!
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T003_CRAIG",
	},	
};

--	P709_CUT_CS06_T003_CRAIG

State
{
	StateName = "P709_CUT_CS06_T003_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T003_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			-- Welcome back to the world, Guardian.
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T004_KERONA",
	},	
};

--	P709_CUT_CS06_T004_KERONA

State
{
	StateName = "P709_CUT_CS06_T004_KERONA",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS06_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T004_KERONA", Tag = "kerona"},
			-- When...am I?
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T005_SARIEL",
	},	
};

--	P709_CUT_CS06_T005_SARIEL

State
{
	StateName = "P709_CUT_CS06_T005_SARIEL",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanCompanionSariel", File = "Efects_Unit_Darkness"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T005_SARIEL", Tag = "pl_HumanCompanionSariel"},
			--addon2/gfx/figures/hero/figure_hero_female_sariel_cast_enemy.ska
			-- At the time of your demise! Die, Snake!
			EntityTimerStart {Name = "Sariel_CasTimer"},
			EntityTimerStart {Name = "et_CStimer"},

		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "Sariel_CasTimer", Seconds = 2},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionSariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_cast_enemy.ska"},
			EntityTimerStop {Name = "Sariel_CasTimer"},
		},
		GotoState = "P709_CUT_CS06_T006_CAINE",
	},
	
};

--	P709_CUT_CS06_T006_CAINE

State
{
	StateName = "P709_CUT_CS06_T006_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStop {Tag = "pl_HumanCompanionSariel"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T006_CAINE", Tag = "pl_HumanHeroCaine"},
			-- Sariel! No!
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T007_KERONA",
	},	
};

--	P709_CUT_CS06_T007_KERONA

State
{
	StateName = "P709_CUT_CS06_T007_KERONA",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureCastSpellToEntity {Tag = "pl_HumanCompanionSariel", Spell = 21, Power = 1, TargetTag = "kerona"},	
			-- base/gfx/figures/hero/figure_hero_female_hit1.ska
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS06_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T007_KERONA", Tag = "kerona"},
			-- AHHH!
			FigureAnimPlayOnce {Tag = "kerona", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_hold.ska"},
			--FigureAnimPlayOnce {Tag = "P709_CUT_CS06_T007_KERONA", File = "base/gfx/figures/hero/figure_hero_female_hit1.ska"},
			EntityTimerStart {Name = "kerona_kneels"},
			EntityTimerStart {Name = "et_CStimer"},

		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "kerona_kneels", Seconds = 0.5},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "pl_HumanCompanionSariel", File = "addon2/gfx/figures/hero/figure_hero_female_Sariel_scream.ska"},
			CutsceneFigureFreeze {Tag = "kerona"},
			EntityTimerStop {Name = "kerona_kneels"},
			
		},	
		GotoState = "P709_CUT_CS06_T008_AVATAR",
	},	

	
};

--	P709_CUT_CS06_T008_AVATAR

State
{
	StateName = "P709_CUT_CS06_T008_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T008_AVATAR", Tag = "pl_HumanAvatar"},
			EffectStartAtEntityPosition {Tag = "pl_HumanCompanionSariel", File = "Effect_Spawn_Unit"},
			-- What the …
			EntityTimerStart {Name = "Sariel_escapes"},
			EntityTimerStart {Name = "et_CStimer"},

		},
	},	

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "Sariel_escapes", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 200, Y = 200 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 200, Y = 200 },
			
		},	
		GotoState = "P709_CUT_CS06_T009_KERONA",
	},	

	
};


--	P709_CUT_CS06_T009_KERONA

State
{
	StateName = "P709_CUT_CS06_T009_KERONA",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "Sariel_escapes", Seconds = 3},
		},
		Actions =
		{
			EntityTimerStop {Name = "Sariel_escapes"},
			-- base/gfx/figures/hero/figure_hero_female_special_idara_sleep.ska
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS06_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T009_KERONA", Tag = "kerona"},
			-- It...was....her. Companion....Zazhut....planned.
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T010_AVATAR",
	},	
};

--	P709_CUT_CS06_T010_AVATAR

State
{
	StateName = "P709_CUT_CS06_T010_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T010_AVATAR", Tag = "pl_HumanAvatar"},
			-- Kerona! No!
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T011_CRAIG",
	},	
};

--	P709_CUT_CS06_T011_CRAIG

State
{
	StateName = "P709_CUT_CS06_T011_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T011_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			-- She's unconscious, Shaikan, but not dead.
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T012_AVATAR",
	},
};

--	P709_CUT_CS06_T012_AVATAR

State
{
	StateName = "P709_CUT_CS06_T012_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T012_AVATAR", Tag = "pl_HumanAvatar"},
			-- And Sariel?
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T013_CAINE",
	},
};

--	P709_CUT_CS06_T013_CAINE

State
{
	StateName = "P709_CUT_CS06_T013_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T013_CAINE", Tag = "pl_HumanHeroCaine"},
			-- Gone.
			EntityTimerStart {Name = "et_CStimer"},

		},
		GotoState = "P709_CUT_CS06_T014_JORBAL",
	},
};

--	P709_CUT_CS06_T014_JORBAL

State
{
	StateName = "P709_CUT_CS06_T014_JORBAL",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS06_T014_JORBAL", Tag = "Surian"},
			-- Let's head directly to the Plains of Argan. We can discuss matters there.
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
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Ereon_Cheat", Level = 1, UnitId = 2201, X = 200, Y = 200, Team = "tm_Neutral"},},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--  I wish we were already there.
			CutsceneSay {TextTag = "P709_outro_end_15", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS06_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 200, Y = 200 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 200, Y = 200 },
			EffectStartAtEntityPosition {Tag = "pl_HumanCompanionCraigHuman", File = "Effect_Spawn_Unit"},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 200, Y = 200 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 200, Y = 200 },
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroCaine", File = "Effect_Spawn_Unit"},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 200, Y = 200 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 200, Y = 200 },
			EffectStartAtEntityPosition {Tag = "kerona", File = "Effect_Spawn_Unit"},
			CutsceneFigureTeleport {Tag = "kerona", X = 200, Y = 200 },
			CutsceneFigureTeleport {Tag = "kerona", X = 200, Y = 200 },
			CutsceneSay {TextTag = "P709_outro_end_16", Tag = "CS_Ereon_Cheat"},
			-- Your wish has been granted.
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
			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			FigureVanish	{Tag = "CS_Ereon_Cheat"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CutsceneFINISH",
	},	
};


-- cutscene ends, cutscene end flag has to be set to true

State
{
	StateName = "CutsceneFINISH",
	OnCutsceneFigureDespawnEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FigureVanish	{Tag = "kerona"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS06_End"},
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};