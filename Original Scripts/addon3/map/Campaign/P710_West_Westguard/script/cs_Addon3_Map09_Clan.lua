-- CS_Clan

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanAvatar'",
	--	"'pl_HumanHeroFirst'",
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanCompanionCraigHuman'",
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
			FigureVanish {Tag = "CS_Clan_Avatar"},
			FigureVanish {Tag = "CS_Clan_HeroCaine"},
			FigureVanish {Tag = "CS_Clan_HeroOrc"},
			FigureVanish {Tag = "CS_Clan_HeroFirst"},
			FigureVanish {Tag = "CS_Clan_HeroThird"},
			FigureVanish {Tag = "CS_Clan_HeroSecond"},
			FigureVanish {Tag = "CS_Clan_CompanionCraigHuman"},
			FigureVanish {Tag = "CS_Clan_Shaman01_Pos1"},
			FigureVanish {Tag = "CS_Clan_Shaman02_Pos1"},
			FigureVanish {Tag = "CS_Clan_Shaman03_Pos1"},
			FigureVanish {Tag = "CS_Clan_Shaman04_Pos1"},
			FigureVanish {Tag = "CS_Clan_Shaman05_Pos1"},
			FigureVanish {Tag = "CS_Clan_Worker01_Pos1"},
			FigureVanish {Tag = "CS_Clan_Worker02_Pos1"},
			FigureVanish {Tag = "CS_Clan_Worker03_Pos1"},
			FigureVanish {Tag = "CS_Clan_Worker04_Pos1"},
			FigureVanish {Tag = "CS_Clan_Worker05_Pos1"},
			FigureVanish {Tag = "CS_Clan_Shaman01_Pos2"},
			FigureVanish {Tag = "CS_Clan_Shaman02_Pos2"},
			FigureVanish {Tag = "CS_Clan_Shaman03_Pos2"},
			FigureVanish {Tag = "CS_Clan_Shaman04_Pos2"},
			FigureVanish {Tag = "CS_Clan_Shaman05_Pos2"},
			FigureVanish {Tag = "CS_Clan_Worker01_Pos2"},
			FigureVanish {Tag = "CS_Clan_Worker02_Pos2"},
			FigureVanish {Tag = "CS_Clan_Worker03_Pos2"},
			FigureVanish {Tag = "CS_Clan_Worker04_Pos2"},
			FigureVanish {Tag = "CS_Clan_Worker05_Pos2"},
			FigureVanish {Tag = "CS_Clan_Khoor_Pos1"},
			FigureVanish {Tag = "CS_Clan_Khoor_Pos2"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P710_StartClanCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},

			FigureTeleport {Tag = "pl_HumanAvatar", X = 551, Y = 320},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 551, Y = 320},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 550, Y = 323},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 550, Y = 323},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 90},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 547, Y = 320},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 547, Y = 320},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 90},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 549.729, Y = 317.809},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 549.729, Y = 317.809},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 90},
			
	--		FigureTeleport {Tag = "pl_HumanHeroFirst", X = 548, Y = 324},
	--		FigureTeleport {Tag = "pl_HumanHeroFirst", X = 548, Y = 324},
	--		FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 90},
	--		FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 90},
			
	--		FigureTeleport {Tag = "pl_HumanHeroSecond", X = 547, Y = 320},
	--		FigureTeleport {Tag = "pl_HumanHeroSecond", X = 547, Y = 320},
	--		FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 90},
	--		FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 90},
			
	--		FigureTeleport {Tag = "pl_HumanHeroThird", X = 548, Y = 316},
	--		FigureTeleport {Tag = "pl_HumanHeroThird", X = 548, Y = 316},
	--		FigureLookAtDirection {Tag = "pl_HumanHeroThird", Direction = 90},
	--		FigureLookAtDirection {Tag = "pl_HumanHeroThird", Direction = 90},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Khoor", Level = 30, UnitId = 2099, X = 582, Y = 322.5, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Barbarian_Berserk01", Level = 30, UnitId = 2190, X = 580, Y = 325, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Barbarian_Berserk02", Level = 30, UnitId = 2190, X = 583, Y = 325, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Troll_Hurler_Devastator", Level = 30, UnitId = 2191, X = 586, Y = 322.5, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Barbarian_Berserk03", Level = 30, UnitId = 2190, X = 583, Y = 320, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Barbarian_Berserk04", Level = 30, UnitId = 2190, X = 580, Y = 320, Team = "tm_Neutral"},},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Orc_Veteran01", Level = 30, UnitId = 2192, X = 586, Y = 325, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Orc_Veteran02", Level = 30, UnitId = 2192, X = 588, Y = 325, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Orc_Veteran03", Level = 30, UnitId = 2192, X = 590, Y = 322.5, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Orc_Veteran04", Level = 30, UnitId = 2192, X = 588, Y = 320, Team = "tm_Neutral"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Elite_Orc_Veteran05", Level = 30, UnitId = 2192, X = 586, Y = 320, Team = "tm_Neutral"},},
			
			--CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 235, Y = 50},
			--FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},			
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
			CameraTakeAddToTrack {File = "CS_Clan_Take_01", Tag = "default", TargetTag = "default"},
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
			CutsceneSay {TextTag = "ClanCS01", Tag = "Khoor"},
			FigureRun	{Tag = "Khoor", X = 556, Y = 320},
			FigureRun	{Tag = "Elite_Barbarian_Berserk01", X = 550, Y = 325},
			FigureRun	{Tag = "Elite_Barbarian_Berserk02", X = 553.5, Y = 323.5},
			FigureRun	{Tag = "Elite_Troll_Hurler_Devastator", X = 560, Y = 320},
			FigureRun	{Tag = "Elite_Barbarian_Berserk03", X = 553.5, Y = 316.5},
			FigureRun	{Tag = "Elite_Barbarian_Berserk04", X = 550, Y = 315},
			FigureRun	{Tag = "Elite_Orc_Veteran01", X = 556, Y = 326},
			FigureRun	{Tag = "Elite_Orc_Veteran02", X = 557, Y = 323},
			FigureRun	{Tag = "Elite_Orc_Veteran03", X = 563, Y = 320},
			FigureRun	{Tag = "Elite_Orc_Veteran04", X = 557, Y = 317},
			FigureRun	{Tag = "Elite_Orc_Veteran05", X = 556, Y = 315},
			--FigureRtsKitSpawn	{UnitId = 83, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsPlayerSpawn	{UnitId = 83, Player = "pl_Clan", X = 365, Y = 320, Amount = 5},
			--FigureRtsPlayerSpawn	{UnitId = 86, Player = "pl_Clan", X = 350, Y = 320, Amount = 5},
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Clan_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureDirectionSetToEntity	{Tag = "Khoor", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Barbarian_Berserk01", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Barbarian_Berserk02", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Troll_Hurler_Devastator", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Barbarian_Berserk03", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Barbarian_Berserk04", TargetTag = "pl_HumanAvatar"},
			--FigureDirectionSetToEntity	{Tag = "CS_Clan_Worker01", TargetTag = "pl_HumanAvatar"},
			--FigureDirectionSetToEntity	{Tag = "CS_Clan_Worker02", TargetTag = "pl_HumanAvatar"},
			--FigureDirectionSetToEntity	{Tag = "CS_Clan_Worker03", TargetTag = "pl_HumanAvatar"},
			--FigureDirectionSetToEntity	{Tag = "CS_Clan_Worker04", TargetTag = "pl_HumanAvatar"},
			--FigureDirectionSetToEntity	{Tag = "CS_Clan_Worker05", TargetTag = "pl_HumanAvatar"},

			FigureDirectionSetToEntity	{Tag = "Elite_Orc_Veteran01", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Orc_Veteran02", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Orc_Veteran03", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Orc_Veteran04", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "Elite_Orc_Veteran05", TargetTag = "pl_HumanAvatar"},
			--FigureRtsKitSpawn	{UnitId = 83, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsKitSpawn	{UnitId = 86, Level = default, X = 535, Y = 320, PlayerKit = "pk_Clan"},
			--FigureRtsPlayerSpawn	{UnitId = 83, Player = "pl_Clan", X = 365, Y = 320, Amount = 5},
			--FigureRtsPlayerSpawn	{UnitId = 86, Player = "pl_Clan", X = 350, Y = 320, Amount = 5},
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Clan_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS02", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "CS_Take03",
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS02", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Khoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS03", Tag = "Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS04", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Khoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS05", Tag = "Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS06", Tag = "pl_HumanHeroCaine"},
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
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS07", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Khoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS08", Tag = "Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS09", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Khoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS10", Tag = "Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS11", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS12", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS13", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS14", Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS15", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Khoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS16", Tag = "Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS17", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS18", Tag = "pl_HumanHeroOrc"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS19", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS20", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS21", Tag = "pl_HumanHeroOrc"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "ClanCS22", Tag = "pl_HumanHeroOrc"},
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
			--FigureVanish	{Tag = "CS_Clan_Khoor"},
			--FigureVanish	{Tag = "CS_Clan_Shaman01"},
			--FigureVanish	{Tag = "CS_Clan_Shaman02"},
			--FigureVanish	{Tag = "CS_Clan_Devastator"},
			--FigureVanish	{Tag = "CS_Clan_Shaman04"},
			--FigureVanish	{Tag = "CS_Clan_Shaman05"},
			--FigureVanish	{Tag = "CS_Clan_Veteran01"},
			--FigureVanish	{Tag = "CS_Clan_Veteran02"},
			--FigureVanish	{Tag = "CS_Clan_Veteran03"},
			--FigureVanish	{Tag = "CS_Clan_Veteran04"},
			--FigureVanish	{Tag = "CS_Clan_Veteran05"},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Khoor", Level = 30, UnitId = 2021, X = 556, Y = 320, Team = "tm_Allies"},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 86, Level = 30, PlayerKit = "pk_Clans", X = 550, Y = 325},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 86, Level = 30, PlayerKit = "pk_Clans", X = 553.5, Y = 323.5},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 90, Level = 30, PlayerKit = "pk_Clans", X = 560, Y = 320},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 86, Level = 30, PlayerKit = "pk_Clans", X = 553.5, Y = 316.5},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 86, Level = 30, PlayerKit = "pk_Clans", X = 550, Y = 315},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 87, Level = 30, PlayerKit = "pk_Clans", X = 556, Y = 326},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 87, Level = 30, PlayerKit = "pk_Clans", X = 557, Y = 323},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 87, Level = 30, PlayerKit = "pk_Clans", X = 558, Y = 320},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 87, Level = 30, PlayerKit = "pk_Clans", X = 557, Y = 317},},
			--NoSpawnEffect	{Spawn = FigureRtsKitSpawn	{UnitId = 87, Level = 30, PlayerKit = "pk_Clans", X = 556, Y = 315},},
			--PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Clans"},
			FigureTeamTransfer	{Tag = "Khoor", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Barbarian_Berserk01", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Barbarian_Berserk02", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Barbarian_Berserk03", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Barbarian_Berserk04", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Troll_Hurler_Devastator", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Orc_Veteran01", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Orc_Veteran02", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Orc_Veteran03", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Orc_Veteran04", Team = "tm_Allies"},
			FigureTeamTransfer	{Tag = "Elite_Orc_Veteran05", Team = "tm_Allies"},
			FigurePlayerTransfer	{Tag = "Khoor", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Barbarian_Berserk01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Barbarian_Berserk02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Barbarian_Berserk03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Barbarian_Berserk04", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Troll_Hurler_Devastator", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Orc_Veteran01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Orc_Veteran02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Orc_Veteran03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Orc_Veteran04", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Elite_Orc_Veteran05", Player = "pl_Human"},
			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			EffectStop {Tag = "pl_HumanHeroOrc"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 550, Y = 320},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},			
			--MapFlagSetTrue {Name = "mf_P710_StartIntroCS_End"},
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
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartClanCS_End"},
		},
	},
};