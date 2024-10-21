-- CS_Sariel

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroFirst'",
		"'pl_HumanHeroSecond'",
		"'pl_HumanHeroThird'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanCompanionCraigHuman'",
		"'Surian'",
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
			FigureVanish {Tag = "CS_Sariel_Avatar"},
			FigureVanish {Tag = "CS_Sariel_Zazhut"},
			FigureVanish {Tag = "CS_Sariel_Kerona"},
			FigureVanish {Tag = "CS_Sariel_Sariel"},
			FigureVanish {Tag = "CS_Sariel_HeroFirst"},
			FigureVanish {Tag = "CS_Sariel_HeroSecond"},
			FigureVanish {Tag = "CS_Sariel_HeroThird"},
			FigureVanish {Tag = "CS_Sariel_HeroCaine"},
			FigureVanish {Tag = "CS_Sariel_HeroOrc"},
			FigureVanish {Tag = "CS_Sariel_CompanionCraigHuman"},			
			
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
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 440, Y = 630},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 440, Y = 630},
			--FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 240},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "DemonPortal"},

			CutsceneFigureTeleport {Tag = "Surian", X = 440, Y = 630},
			CutsceneFigureTeleport {Tag = "Surian", X = 440, Y = 630},
--			FigureLookAtDirection	{Tag = "Surian", Direction = 240},
			FigureLookAtEntity {Tag = "Surian", TargetTag = "DemonPortal"},

			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Kerona", Level = 1, UnitId = 2203, X = 444.712, Y = 629.546, Team = "tm_Neutral"},},
--			FigureLookAtDirection	{Tag = "CS_Sariel_Kerona", Direction = 250},
			FigureLookAtEntity {Tag = "CS_Sariel_Kerona", TargetTag = "DemonPortal"},
			
			--FigureRespawn	{Tag = "pl_HumanHeroFirst", X = 442, Y = 627},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroFirst", X = 442.5, Y = 627.5},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroFirst", X = 442.5, Y = 627.5},
	--		FigureLookAtDirection	{Tag = "pl_HumanHeroFirst", Direction = 240},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "DemonPortal"},
			
			--FigureRespawn	{Tag = "pl_HumanHeroSecond", X = 445, Y = 629},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSecond", X = 445, Y = 629},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSecond", X = 445, Y = 629},
	--		FigureLookAtDirection	{Tag = "pl_HumanHeroSecond", Direction = 250},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "DemonPortal"},
			
			--FigureRespawn	{Tag = "pl_HumanHeroThird", X = 440, Y = 627},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroThird", X = 440, Y = 627},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroThird", X = 440, Y = 627},
	--		FigureLookAtDirection	{Tag = "pl_HumanHeroThird", Direction = 240},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "DemonPortal"},
			
			--FigureRespawn	{Tag = "pl_HumanHeroCaine", X = 447, Y = 632},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 447, Y = 632},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 447, Y = 632},
--			FigureLookAtDirection	{Tag = "pl_HumanHeroCaine", Direction = 250},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "DemonPortal"},
			
			--FigureRespawn	{Tag = "pl_HumanHeroOrc", X = 438, Y = 628},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 438, Y = 628},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 438, Y = 628},
	--		FigureLookAtDirection	{Tag = "pl_HumanHeroOrc", Direction = 240},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "DemonPortal"},
			
			--FigureRespawn	{Tag = "pl_HumanCompanionCraigHuman", X = 447, Y = 630},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 447, Y = 630},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 447, Y = 630},
	--		FigureLookAtDirection	{Tag = "pl_HumanCompanionCraigHuman", Direction = 250},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "DemonPortal"},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			
			ObjectSpawn	{ObjectId = 3000, X = 400, Y = 630, Direction = 0, Tag = "Zazhut_Bossfight_FX_01"},
			ObjectSpawn	{ObjectId = 3000, X = 400, Y = 635, Direction = 0, Tag = "Zazhut_Bossfight_FX_02"},
			ObjectSpawn	{ObjectId = 3000, X = 397, Y = 640, Direction = 0, Tag = "Zazhut_Bossfight_FX_03"},
			ObjectSpawn	{ObjectId = 3000, X = 398, Y = 645, Direction = 0, Tag = "Zazhut_Bossfight_FX_04"},
			ObjectSpawn	{ObjectId = 3000, X = 397, Y = 650, Direction = 0, Tag = "Zazhut_Bossfight_FX_05"},
			ObjectSpawn	{ObjectId = 3000, X = 399, Y = 655, Direction = 0, Tag = "Zazhut_Bossfight_FX_06"},
			ObjectSpawn	{ObjectId = 3000, X = 397, Y = 660, Direction = 0, Tag = "Zazhut_Bossfight_FX_07"},
			ObjectSpawn	{ObjectId = 3000, X = 398, Y = 665, Direction = 0, Tag = "Zazhut_Bossfight_FX_08"},
			ObjectSpawn	{ObjectId = 3000, X = 400, Y = 670, Direction = 0, Tag = "Zazhut_Bossfight_FX_09"},
			ObjectSpawn	{ObjectId = 3000, X = 404, Y = 674, Direction = 0, Tag = "Zazhut_Bossfight_FX_10"},
			ObjectSpawn	{ObjectId = 3000, X = 467, Y = 635, Direction = 0, Tag = "Zazhut_Bossfight_FX_11"},
			ObjectSpawn	{ObjectId = 3000, X = 463, Y = 640, Direction = 0, Tag = "Zazhut_Bossfight_FX_12"},
			ObjectSpawn	{ObjectId = 3000, X = 463, Y = 645, Direction = 0, Tag = "Zazhut_Bossfight_FX_13"},
			ObjectSpawn	{ObjectId = 3000, X = 461, Y = 650, Direction = 0, Tag = "Zazhut_Bossfight_FX_14"},
			ObjectSpawn	{ObjectId = 3000, X = 458, Y = 655, Direction = 0, Tag = "Zazhut_Bossfight_FX_15"},
			ObjectSpawn	{ObjectId = 3000, X = 456, Y = 660, Direction = 0, Tag = "Zazhut_Bossfight_FX_16"},
			ObjectSpawn	{ObjectId = 3000, X = 454, Y = 665, Direction = 0, Tag = "Zazhut_Bossfight_FX_17"},
			ObjectSpawn	{ObjectId = 3000, X = 454, Y = 670, Direction = 0, Tag = "Zazhut_Bossfight_FX_18"},
			ObjectSpawn	{ObjectId = 3000, X = 451, Y = 675, Direction = 0, Tag = "Zazhut_Bossfight_FX_19"},
			ObjectSpawn	{ObjectId = 3000, X = 448, Y = 680, Direction = 0, Tag = "Zazhut_Bossfight_FX_20"},
			ObjectSpawn	{ObjectId = 3000, X = 444, Y = 685, Direction = 0, Tag = "Zazhut_Bossfight_FX_21"},
			ObjectSpawn	{ObjectId = 2067, X = 403.917, Y = 628.9, Direction = 110, Tag = "Zazhut_Bossfight_Wall_01"},
			ObjectSpawn	{ObjectId = 2067, X = 399.894, Y = 641.846, Direction = 90, Tag = "Zazhut_Bossfight_Wall_02"},
			ObjectSpawn	{ObjectId = 2067, X = 402.433, Y = 654.287, Direction = 120, Tag = "Zazhut_Bossfight_Wall_03"},
			ObjectSpawn	{ObjectId = 2067, X = 399.855, Y = 663.931, Direction = 60, Tag = "Zazhut_Bossfight_Wall_04"},
			ObjectSpawn	{ObjectId = 2067, X = 467.366, Y = 633.631, Direction = 100, Tag = "Zazhut_Bossfight_Wall_05"},
			ObjectSpawn	{ObjectId = 2067, X = 465.158, Y = 647.364, Direction = 120, Tag = "Zazhut_Bossfight_Wall_06"},
			ObjectSpawn	{ObjectId = 2067, X = 458.865, Y = 659.04, Direction = 105, Tag = "Zazhut_Bossfight_Wall_07"},
			ObjectSpawn	{ObjectId = 2067, X = 455.565, Y = 672.32, Direction = 120, Tag = "Zazhut_Bossfight_Wall_08"},
			ObjectSpawn	{ObjectId = 2067, X = 452.659, Y = 680.923, Direction = 140, Tag = "Zazhut_Bossfight_Wall_09"},
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
			CameraTakeAddToTrack {File = "CS_Sariel_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			EffectStartAddon2	{Tag = "DemonPortal", File = "Effect_Teleport"},
			--EffectStartAtEntityPosition	{Tag = "Sariel_Spawn", File = "Effect_Fireball_cast"},
			--EffectStartAtEntityPosition	{Tag = "Zazhut_Spawn", File = "Effect_Fireball_cast"},
			--FigureNpcSpawn	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 1466, X = 440, Y = 640, Team = "tm_Neutral"},},
			--FigureNpcSpawn	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 1662, X = 435, Y = 635, Team = "tm_Neutral"},},
			--FigureLookAtEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "pl_HumanAvatar"},
			--FigureLookAtEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "pl_HumanAvatar"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080,  X = 432.792, Y = 673.05, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085,  X = 427.55, Y = 672.878, Team = "tm_Neutral"},},
			CutsceneFigureWeaponsHide {Tag = "CS_Sariel_Sariel"},

			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, X = 440, Y = 640, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, X = 435, Y = 635, Team = "tm_Neutral"},},
			FigureLookAtEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			EffectStop	{Tag = "DemonPortal"},
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, TargetTag = "DemonPortal", Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, TargetTag = "DemonPortal", Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, X = 440, Y = 640, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, X = 435, Y = 635, Team = "tm_Neutral"},},
			--FigureLookAtEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "pl_HumanAvatar"},
			--FigureLookAtEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "pl_HumanAvatar"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureSimpleWalkToEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "Zazhut_Spawn"},
			FigureSimpleWalkToEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "Sariel_Spawn"},
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, TargetTag = "DemonPortal", Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, TargetTag = "DemonPortal", Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, X = 440, Y = 640, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, X = 435, Y = 635, Team = "tm_Neutral"},},
			--FigureLookAtEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "pl_HumanAvatar"},
			--FigureLookAtEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "pl_HumanAvatar"},
			CutsceneSay {TextTag = "SarielCS01", Tag = "Surian"},
			EntityTimerStart {Name = "et_CStimer"},
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
			FigureIsInRangeToEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "Zazhut_Spawn", Range = 1},
			FigureIsInRangeToEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "Sariel_Spawn", Range = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			--FigureSimpleWalkToEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "Sariel_Spawn"},
			--FigureSimpleWalkToEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "Zazhut_Spawn"},
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, TargetTag = "DemonPortal", Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, TargetTag = "DemonPortal", Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Zazhut", Level = 1, UnitId = 2080, X = 440, Y = 640, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Sariel_Sariel", Level = 1, UnitId = 2085, X = 435, Y = 635, Team = "tm_Neutral"},},
			FigureLookAtEntity	{Tag = "CS_Sariel_Zazhut", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "CS_Sariel_Sariel", TargetTag = "pl_HumanAvatar"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
--			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS03", Tag = "CS_Sariel_Sariel"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS04", Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Zazhut", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS05", Tag = "CS_Sariel_Zazhut"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kerona", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS06", Tag = "CS_Sariel_Kerona"},
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
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS07", Tag = "CS_Sariel_Sariel"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kerona", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS08", Tag = "CS_Sariel_Kerona"},
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
			CameraTakeAddToTrack {File = "CS_Take_Zazhut", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS09", Tag = "CS_Sariel_Zazhut"},
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
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS10", Tag = "CS_Sariel_Sariel"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kerona", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS11", Tag = "CS_Sariel_Kerona"},
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
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS12", Tag = "CS_Sariel_Sariel"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Zazhut", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SarielCS13", Tag = "CS_Sariel_Zazhut"},
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
			CutsceneSay {TextTag = "SarielCS14", Tag = "pl_HumanAvatar"},
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
			FadeInEffectStart{},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 440, Y = 630},
			FigureVanish {Tag = "CS_Sariel_Zazhut"},
			FigureVanish {Tag = "CS_Sariel_Kerona"},
			FigureVanish {Tag = "CS_Sariel_Sariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
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
			MapFlagSetTrue {Name = "mf_P710_StartSarielCS_End"},
		},
	},
};