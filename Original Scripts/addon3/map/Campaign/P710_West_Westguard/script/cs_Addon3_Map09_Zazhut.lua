-- CS_Zazhut

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		--"'pl_HumanHeroFirst'",
		--"'pl_HumanHeroSecond'",
		--"'pl_HumanHeroThird'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanCompanionCraigHuman'",
		--"'Zazhut'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		EventName = "Vanish",
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {Tag = "CS_Zazhut_Avatar"},
			FigureVanish {Tag = "CS_Zazhut_CompanionCraigHuman"},
			FigureVanish {Tag = "CS_Zazhut_HeroOrc"},
			FigureVanish {Tag = "CS_Zazhut_HeroCaine"},
			FigureVanish {Tag = "CS_Zazhut_HeroFirst"},
			FigureVanish {Tag = "CS_Zazhut_HeroSecond"},
			FigureVanish {Tag = "CS_Zazhut_HeroThird"},
			FigureVanish {Tag = "CS_Zazhut_Zazhut_Pos1"},
			FigureVanish {Tag = "CS_Zazhut_Zazhut_Pos2"},
			FigureVanish {Tag = "CS_Zazhut_Kerona"},
			FigureVanish {Tag = "CS_Zazhut_Sariel"},
			
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P710_StartZazhutCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_01"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_02"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_03"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_04"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_05"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_06"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_07"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_08"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_09"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_10"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_11"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_12"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_13"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_14"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_15"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_16"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_17"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_18"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_19"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_20"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_FX_21"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_01"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_02"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_03"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_04"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_05"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_06"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_07"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_08"},
			ObjectVanish	{Tag = "Zazhut_Bossfight_Wall_09"},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Zazhut", Level = 1, UnitId = 2084, X = 365, Y = 685, Team = "tm_Neutral"},},
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 375, Y = 645},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 375, Y = 645},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			
			FigureTeleport {Tag = "CS_Zazhut", X = 365, Y = 685},
			FigureTeleport {Tag = "CS_Zazhut", X = 365, Y = 685},
			FigureLookAtDirection {Tag = "CS_Zazhut", Direction = 0},
			FigureLookAtDirection {Tag = "CS_Zazhut", Direction = 0},
			
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 372, Y = 643},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 372, Y = 643},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 160},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 160},
			
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 374, Y = 643},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 374, Y = 643},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 175},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 175},
			
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 376, Y = 643},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 376, Y = 643},
			FigureLookAtDirection {Tag = "pl_HumanHeroThird", Direction = 185},
			FigureLookAtDirection {Tag = "pl_HumanHeroThird", Direction = 185},
			
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 373, Y = 645},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 373, Y = 645},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 170},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 170},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 377, Y = 645},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 377, Y = 645},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 190},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 190},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 378, Y = 643},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 378, Y = 643},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 200},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 200},

			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			
			
			
			CutsceneCombatOff	{},

			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Zazhut_Kerona", Level = 1, UnitId = 2203, X = 370, Y = 650, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Zazhut_Sariel", Level = 1, UnitId = 2085, X = 380, Y = 650, Team = "tm_Neutral"},},
			CutsceneFigureWeaponsHide {Tag = "CS_Zazhut_Sariel"},
			FigureLookAtDirection {Tag = "CS_Zazhut_Kerona", Direction = 90},
			FigureLookAtDirection {Tag = "CS_Zazhut_Sariel", Direction = 270},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01_01",
	},
};

State
{
	StateName = "Cutscene01_01",
	OnOneTimeEvent
	{
		Conditions =
		{
		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Zazhut_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS01", Tag = "CS_Zazhut_Sariel"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "CS_Take02",
	},	
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
			CameraTakeAddToTrack {File = "CS_Take_KeronaZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS02", Tag = "CS_Zazhut_Kerona"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS03", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_SarielZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS04", Tag = "CS_Zazhut_Sariel"},
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
			CameraTakeAddToTrack {File = "CS_Take_SarielZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS05", Tag = "CS_Zazhut_Sariel"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS06", Tag = "CS_Zazhut_Sariel"},
			FigureAnimPlayOnce {Tag = "CS_Zazhut_Sariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_emote_taunt.ska"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "Cutscene01_02",
	},	
};


State
{
	StateName = "Cutscene01_02",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Zazhut_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--EffectStart	{Tag = "CS_Zazhut_Kerona", File = "Effect_Building_Fire"},
			EffectStart	{Tag = "CS_Zazhut_Sariel", File = "Effect_Building_Fire"},
			EffectStart	{Tag = "CS_Zazhut_Sariel", File = "Effect_Firestorm_Cast"},
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base
			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_03",
	},	
};

State
{
	StateName = "Cutscene01_03",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Zazhut_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--EffectStart	{Tag = "CS_Zazhut_Ereon", File = "Effect_Building_Fire"},
			--EffectStart	{Tag = "Zazhut", File = "Effect_Fireball_OverTime"},
			
			ObjectSpawn	{ObjectId = 1102, X = 371, Y = 651, Direction = 0, Tag = "Supernova"},

			FigureRunToEntity	{Tag = "CS_Zazhut_Sariel", TargetTag = "Supernova"},
			
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base

			CutsceneSay {TextTag = "ZazhutCS07", Tag = "CS_Zazhut_Kerona"},
			
			--EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_04",
	},	
};

State
{
	StateName = "Cutscene01_04",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "CS_Zazhut_Sariel", TargetTag = "CS_Zazhut_Kerona", Range = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Zazhut_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			
			EffectStart	{Tag = "Zazhut_Explosion_FX", File = "Effect_Firestorm_Impact"},
			--EffectStart	{Tag = "Zazhut", File = "Effect_Firestorm_Impact"},
			FigureVanish {Tag = "CS_Zazhut_Kerona"},
			FigureVanish {Tag = "CS_Zazhut_Kerona"},
			FigureVanish {Tag = "CS_Zazhut_Sariel"},
			FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base
			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Intermezzo",
	},	
};

State
{
	StateName = "Intermezzo",
	
	OnOneTimeEvent 
	{
		EventName = ">>> Intermezzo <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
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
		--	CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_ZazhutZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
--			CutsceneSay {TextTag = "ZazhutCS08", Tag = "pl_HumanHeroOrc"},
			CutsceneSay {TextTag = "ZazhutCS09", Tag = "CS_Zazhut"},
--			CutsceneSay {TextTag = "ZazhutCS10", Tag = "pl_HumanHeroCaine"},
			-- ide lehet egy összemixelt hang kell majd
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take_ZarachSpawn",
	},	
};

State
{
	StateName = "CS_Take_ZarachSpawn",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_ZarachSpawn <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_ShrineZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Zarach_ANGRY", Level = 30, UnitId = 2209, X = 391.5, Y = 245.5, Team = "tm_Neutral"},},
			EffectStartAtEntityPosition {Tag = "Zarach_ANGRY", File = "Effect_Spawn_Unit"},
			FigureLookAtDirection {Tag = "Zarach_ANGRY", Direction = 180},
			FigureAnimPlayOnce {Tag = "Zarach_ANGRY", File = "base/gfx/figures/hero/figure_hero_male_emote_warcry.ska"},
			CutsceneSay {TextTag = "ZazhutCS08", Tag = "Zarach_ANGRY"},
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
			CameraTakeAddToTrack {File = "CS_Take_ShrineZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Zarach_ANGRY", File = "base/gfx/figures/hero/figure_hero_male_special_bleed.ska"},
			CutsceneSay {TextTag = "ZazhutCS11", Tag = "Zarach_ANGRY"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take12",
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS12", Tag = "pl_HumanAvatar"},
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
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS13", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take14",
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS14", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS15", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_ZazhutZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS16", Tag = "CS_Zazhut"},
			FigureAnimPlayOnce {Tag = "CS_Zazhut", File = "addon2/gfx/figures/demonic/figure_demonic_npc_titan_Idle_to_war.ska"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS17", Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTakeAddToTrack {File = "CS_Take_ZazhutZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "CS_Zazhut", File = "addon2/gfx/figures/demonic/figure_demonic_npc_titan_walk_Combat Melee Special.ska"},
			CutsceneSay {TextTag = "ZazhutCS18", Tag = "CS_Zazhut"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS19", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_ZazhutZ", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			
			FigureAnimPlayOnce {Tag = "CS_Zazhut", File = "addon2/gfx/figures/demonic/figure_demonic_npc_titan_cast_magic_self.ska"},

			CutsceneSay {TextTag = "ZazhutCS20", Tag = "CS_Zazhut"},
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "ZazhutCS21", Tag = "CS_Zazhut"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "Cutscene01_05",
	},	
};


State
{
	StateName = "Cutscene01_05",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Zazhut_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			FigureRun {Tag = "CS_Zazhut", X = 375, Y = 655},
			--EffectStart	{Tag = "Zazhut_Explosion_FX", File = "Effect_Firestorm_Impact"},
			--EffectStart	{Tag = "Zazhut", File = "Effect_Firestorm_Impact"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base
			
			--EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_06",
	},	
};

State
{
	StateName = "Cutscene01_06",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "CS_Zazhut", Range = 1, X = 375, Y = 655},
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Outro_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			FigureLookAtDirection	{Tag = "ZazhutLure", Direction = 0},
			--EffectStart	{Tag = "Zazhut_Explosion_FX", File = "Effect_Firestorm_Impact"},
			--EffectStart	{Tag = "Zazhut", File = "Effect_Firestorm_Impact"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base
			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_07",
	},	
};

State
{
	StateName = "Cutscene01_07",
	OnCutsceneFigureDespawnEvent
	{
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
			FadeInEffectStart{},
			--FigureTeleport {Tag = "pl_HumanAvatar", X = 380, Y = 635},
			--FigureTeleport {Tag = "Zazhut", X = 380, Y = 655},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureVanish {Tag = "CS_Zazhut_Orc"},
			FigureVanish {Tag = "CS_Zazhut"},
			--MapFlagSetTrue {Name = "mf_P710_StartIntroCS_End"},
		},
		GotoState = "Cutscene01_08",
	},	
};

State
{
	StateName = "Cutscene01_08",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartZazhutCS_End"},
		},
	},
};