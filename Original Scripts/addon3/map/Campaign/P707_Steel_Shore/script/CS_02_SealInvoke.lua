local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
		"'Surian'",
		"'pl_HumanCompanionCraigHuman'",
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
		EventName = ">>> CS_02_Respawn <<<" ,
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P707_CS_02_Start"},
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

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "CS02Place"},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "CS02Place"},

			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "CS02Place"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "CS02Place"},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 110},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 110},
			
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "CS02Place"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "CS02Place"},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 110},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 110},
			
			FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "CS02Place"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "CS02Place"},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},
			
			FigureTeleportToEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "pl_HumanHeroCaine"},
			FigureTeleportToEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "pl_HumanHeroCaine"},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 90},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 140.523, Y = 328.943 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 140.523, Y = 328.943 },
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 90},
			
			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 140.585, Y = 327.401 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 140.585, Y = 327.401 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 145},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 145},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 140.674, Y = 330.607 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 140.674, Y = 330.607 },
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 45},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 45},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 141.504, Y = 332.054 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 141.504, Y = 332.054 },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 0},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 0},

			MapFlagSetTrue {Name = "mf_P707_CS_02_Started"},
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
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS01", Tag = "pl_HumanAvatar"},
			FogOfWarRevealAtEntity {FogOfWarId = 0, Tag = "SealHide1", Range = 40, Height = 2},
			EntityTimerStart {Name = "et_CStimer"},	
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_point.ska"},		
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS02", Tag = "pl_HumanHeroOrc"},
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS03", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS04", Tag = "pl_HumanHeroOrc"},
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS05", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			--FigureAnimPlayOnce	{Tag = "pl_HumanHeroOrc", File = "base/gfx/figures/hero/figure_hero_male_cast.ska"},
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
			CutsceneSay {TextTag = "FirstInvCS06", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS07", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS08", Tag = "pl_HumanHeroCaine"},
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
			CutsceneSay {TextTag = "FirstInvCS09", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS10", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS11", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroOrc", File = "base/gfx/figures/npc/figure_npc_orc_champion_emote_no.ska"},			
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS12", Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS13", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS14", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS15", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
			
			EffectStartAtEntityPosition {Tag = "SealHide1", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "SealHide1"},
			EffectStartAtEntityPosition {Tag = "SealHide2", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "SealHide2"},
			EffectStartAtEntityPosition {Tag = "SealHide3", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "SealHide3"},
			EffectStartAtEntityPosition {Tag = "SealHide4", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "SealHide4"},
			ObjectVanish {Tag = "SealHideFX1"},
			ObjectSpawn	{ObjectId = 2700, X = 178.749, Y = 330.63, Direction = 0, Tag = "FirstSeal"},
			FogOfWarRevealAtEntity {FogOfWarId = 0, Tag = "FirstSeal", Range = 40, Height = 2},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
			MapTimerStart	{Name = "mt_CS_02_Teleport1"},
		},	
	},	
	
	OnOneTimeEvent 
	{
		EventName = ">>> Cs_02 Teleport Timer2 <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_CS_02_Teleport1", Seconds = 2},
		},
		Actions =
		{	
			MapFlagSetTrue {Name = "mf_P707_LavaGolemPuzzleSpawn"},
			MapTimerStop	{Name = "mt_CS_02_Teleport2"},			
			FogOfWarRevealAtEntity {FogOfWarId = 1, Tag = "LavaGolem1", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 2, Tag = "LavaGolem2", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 3, Tag = "LavaGolem3", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 4, Tag = "LavaGolem4", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 5, Tag = "LavaGolem5", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 6, Tag = "LavaGolem6", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 7, Tag = "LavaGolem7", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 8, Tag = "LavaGolem8", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 9, Tag = "LavaGolem9", Range = 20, Height = 2},
			FogOfWarRevealAtEntity {FogOfWarId = 10, Tag = "LavaGolem10", Range = 20, Height = 2},		
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS16", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS17", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CutsceneSay {TextTag = "FirstInvCS18", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS19", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS20", Tag = "pl_HumanAvatar"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS21", Tag = "Surian"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS22", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CutsceneSay {TextTag = "FirstInvCS23", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS24", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			EffectStop {Tag = "pl_HumanHeroOrc"},
			CutsceneSay {TextTag = "FirstInvCS25", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroOrc", File = "base/gfx/figures/npc/figure_npc_orc_champion_emote_sad.ska"},			
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS26", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS27", Tag = "pl_HumanCompanionCraigHuman"},
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS28", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS29", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS30", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS02_LavaGolem", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS31", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS32", Tag = "Surian"},
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
			CutsceneSay {TextTag = "FirstInvCS33", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS34", Tag = "Surian"},
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS35", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstInvCS36", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_talk_listen.ska"},
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
		EventName = ">>> CS_02_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		--CutsceneSayIsDone {},	
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P707_CS_02_Ended"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




