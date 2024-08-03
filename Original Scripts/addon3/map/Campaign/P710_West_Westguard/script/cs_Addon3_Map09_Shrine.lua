-- CS_Shrine_

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		--"'pl_HumanHeroFirst'",
		--"'pl_HumanHeroSecond'",
		--"'pl_HumanHeroThird'",
		--"'pl_HumanHeroCaine'",
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
			FigureVanish {Tag = "CS_Shrine_Avatar"},
			FigureVanish {Tag = "CS_Shrine_Shaman01"},
			FigureVanish {Tag = "CS_Shrine_Shaman02"},
			FigureVanish {Tag = "CS_Shrine_Khoor"},
			FigureVanish {Tag = "CS_Shrine_Shaman03"},
			FigureVanish {Tag = "CS_Shrine_Shaman04"},
			FigureVanish {Tag = "CS_Shrine_Shaman05"},
			FigureVanish {Tag = "CS_Shrine_HeroFirst"},
			FigureVanish {Tag = "CS_Shrine_HeroSecond"},
			FigureVanish {Tag = "CS_Shrine_HeroThird"},
			FigureVanish {Tag = "CS_Shrine_HeroOrc"},
			FigureVanish {Tag = "CS_Shrine_HeroCaine"},
			FigureVanish {Tag = "CS_Shrine_CompanionCraigHuman"},
			FigureVanish {Tag = "CS_Zarach_Avatar"},
			FigureVanish {Tag = "CS_Zarach_HeroOrc"},
			FigureVanish {Tag = "CS_Zarach_HeroFirst"},
			FigureVanish {Tag = "CS_Zarach_HeroSecond"},
			FigureVanish {Tag = "CS_Zarach_HeroThird"},
			FigureVanish {Tag = "CS_Zarach_HeroCaine"},
			FigureVanish {Tag = "CS_Zarach_CompanionCraigHuman"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P710_StartShrineCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},

			FigureTeleport {Tag = "pl_HumanAvatar", X = 389, Y = 250},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 389, Y = 250},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			
--[[			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 395, Y = 251},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 395, Y = 251},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 391, Y = 253},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 391, Y = 253},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 388, Y = 252},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 388, Y = 252},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},]]--
			
			FigureTeleport {Tag = "Surian", X = 387, Y = 248},
			FigureTeleport {Tag = "Surian", X = 387, Y = 248},
			FigureLookAtEntity {Tag = "Surian", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "Surian", TargetTag = "Zarach_Shrine"},
--			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 392, Y = 251},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 392, Y = 251},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 386, Y = 246},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 386, Y = 246},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "CS_Khoor", Level = 1, UnitId = 2099, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"},},
			FigureTeleport {Tag = "CS_Khoor", X = 395, Y = 251},
			FigureTeleport {Tag = "CS_Khoor", X = 395, Y = 251},
			FigureLookAtEntity {Tag = "CS_Khoor", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "CS_Khoor", TargetTag = "Zarach_Shrine"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Shrine_Shaman01", Level = 1, UnitId = 293, X = 392.75, Y = 241, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Shrine_Shaman02", Level = 1, UnitId = 293, X = 391.5, Y = 245.5, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Shrine_Shaman03", Level = 1, UnitId = 293, X = 394.75, Y = 248, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Shrine_Shaman04", Level = 1, UnitId = 293, X = 398, Y = 245.5, Team = "tm_Neutral"},},
			--NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Shrine_Shaman05", Level = 1, UnitId = 293, X = 396.75, Y = 241, Team = "tm_Neutral"},},
			--FigureLookAtEntity {Tag = "CS_Shrine_Shaman01", TargetTag = "Zarach_Shrine"},
			--FigureLookAtEntity {Tag = "CS_Shrine_Shaman02", TargetTag = "Zarach_Shrine"},
			--FigureLookAtEntity {Tag = "CS_Shrine_Shaman03", TargetTag = "Zarach_Shrine"},
			--FigureLookAtEntity {Tag = "CS_Shrine_Shaman04", TargetTag = "Zarach_Shrine"},
			--FigureLookAtEntity {Tag = "CS_Shrine_Shaman05", TargetTag = "Zarach_Shrine"},
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
			CameraTakeAddToTrack {File = "CS_Shrine_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "CS_Take01",
	},	
};


-- kamera snitt
State
{
	StateName = "CS_Take01",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_CSKhoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS02", Tag = "CS_Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS03", Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS04", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS05", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS06", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_CSKhoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS07", Tag = "CS_Khoor"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS08", Tag = "Surian"},
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
			CutsceneSay {TextTag = "ShrineCS09", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_CSKhoor", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS10", Tag = "CS_Khoor"},
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
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS11", Tag = "CS_Khoor"},
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
			CutsceneSay {TextTag = "ShrineCS12", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS13", Tag = "pl_HumanCompanionCraigHuman"},
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
			CutsceneSay {TextTag = "ShrineCS14", Tag = "pl_HumanAvatar"},
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
			CutsceneSay {TextTag = "ShrineCS15", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS16", Tag = "pl_HumanAvatar"},
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
			EffectStop {Tag = "pl_HumanHeroOrc"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShrineCS17", Tag = "pl_HumanHeroOrc"},
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
			FigureVanish {Tag = "CS_Shrine_Shaman01"},
			FigureVanish {Tag = "CS_Shrine_Shaman02"},
			FigureVanish {Tag = "CS_Shrine_Shaman03"},
			FigureVanish {Tag = "CS_Shrine_Shaman04"},
			FigureVanish {Tag = "CS_Shrine_Shaman05"},
			FigureVanish {Tag = "CS_Khoor"},
			FigureTeleport {Tag = "Khoor", X = 394.75, Y = 248},
			FigureTeleport {Tag = "Khoor", X = 394.75, Y = 248},
			FigureLookAtEntity {Tag = "Khoor", TargetTag = "Zarach_Shrine"},
			FigureLookAtEntity {Tag = "Khoor", TargetTag = "Zarach_Shrine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
--			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
	--		CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
		--	CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			--CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
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
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartShrineCS_End"},
		},
	},
};