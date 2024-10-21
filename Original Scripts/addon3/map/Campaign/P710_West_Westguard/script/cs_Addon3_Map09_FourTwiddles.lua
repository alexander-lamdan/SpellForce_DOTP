-- CS_Shrine_

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
		"'Twiddle1'",
		"'Twiddle2'",
		"'Twiddle3'",
		"'Twiddle4'",
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
			FigureVanish {Tag = "CS_Twiddle_Avatar"},
			FigureVanish {Tag = "CS_Twiddle_HeroFirst"},
			FigureVanish {Tag = "CS_Twiddle_HeroSecond"},
			FigureVanish {Tag = "CS_Twiddle_HeroThird"},
			FigureVanish {Tag = "CS_Twiddle_HeroCaine"},
			FigureVanish {Tag = "CS_Twiddle_HeroOrc"},
			FigureVanish {Tag = "CS_Twiddle_CompanionCraigHuman"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
				--MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
				MapFlagIsTrue {Name = "mf_P710_StartFourTwiddlesCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},

			FigureTeleport {Tag = "pl_HumanAvatar", X = 485, Y = 50},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485, Y = 50},

			FigureTeleport {Tag = "Twiddle1", X = 488.278, Y = 51.819},
			FigureTeleport {Tag = "Twiddle1", X = 488.278, Y = 51.819},
			FigureLookAtEntity {Tag = "Twiddle1", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity {Tag = "Twiddle1", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle1"},
			
			FigureTeleport {Tag = "Twiddle2", X = 488.233, Y = 49.1229},
			FigureTeleport {Tag = "Twiddle2", X = 488.233, Y = 49.1229},
			FigureLookAtEntity {Tag = "Twiddle2", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity {Tag = "Twiddle2", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle2"},
			
			FigureTeleport {Tag = "Twiddle3", X = 488.3, Y = 46.9452},
			FigureTeleport {Tag = "Twiddle3", X = 488.3, Y = 46.9452},
			FigureLookAtEntity {Tag = "Twiddle3", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity {Tag = "Twiddle3", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle3"},

			FigureTeleport {Tag = "Twiddle4", X = 488.334, Y = 45.3061},
			FigureTeleport {Tag = "Twiddle4", X = 488.334, Y = 45.3061},
			FigureLookAtEntity {Tag = "Twiddle4", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity {Tag = "Twiddle4", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle4"},

			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 480, Y = 51},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 480, Y = 51},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 481, Y = 48},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 481, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 476, Y = 48},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 476, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},
			
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 478, Y = 46},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 478, Y = 46},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 478, Y = 50},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 478, Y = 50},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 479, Y = 48},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 479, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
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
			CameraTakeAddToTrack {File = "CS_Twiddle_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
			CutsceneSay {TextTag = "FourTwiddlesCS01", Tag = "pl_HumanAvatar"},
		},	
		GotoState = "CS_Take06",
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS02", Tag = "pl_HumanAvatar"},
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
			CutsceneSay {TextTag = "FourTwiddlesCS03", Tag = "pl_HumanAvatar"},
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
			CutsceneSay {TextTag = "FourTwiddlesCS04", Tag = "pl_HumanAvatar"},
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
			CutsceneSay {TextTag = "FourTwiddlesCS05", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS06", Tag = "Twiddle4"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS07", Tag = "Twiddle1"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS08", Tag = "Twiddle3"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS09", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS10", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Twiddle_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			FigureSimpleWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle2"},
			--FigureCorpseRotForbid	{Tag = "Twiddle2"},
			--FigureCorpseRotForbid	{Tag = "Twiddle3"},
			--FigureCorpseRotForbid	{Tag = "Twiddle4"},
			--FigureKill	{Tag = "Twiddle2"},
			--FigureKill	{Tag = "Twiddle3"},
			--FigureKill	{Tag = "Twiddle4"},
			--EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_03",
	},	
};

State
{
	StateName = "Cutscene01_03",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle2", Range = 1.5},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Twiddle2", Team = "tm_Nameless"},
			--EntityTimerStop {Name = "et_CStimer"},
			FigureAttackEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle2"},
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
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			--EntityTimerStop {Name = "et_CStimer"},
			FigureCorpseRotForbid	{Tag = "Twiddle2"},
			FigureHealthSet	{Tag = "Twiddle2", Percent = 0},
			FigureKill	{Tag = "Twiddle2"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureCorpseRotForbid	{Tag = "Twiddle3"},
			FigureCorpseRotForbid	{Tag = "Twiddle4"},
			FigureHealthSet	{Tag = "Twiddle3", Percent = 0},
			FigureHealthSet	{Tag = "Twiddle4", Percent = 0},
			FigureKill	{Tag = "Twiddle3"},
			FigureKill	{Tag = "Twiddle4"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureVanish	{Tag = "Twiddle1"},
			FigureNpcSpawn	{Tag = "Twiddle_Titan", Level = 10, UnitId = 2096, X = 489, Y = 54, Team = "tm_Nameless"},
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
			--CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Twiddle_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "FourTwiddlesCS11", Tag = "Twiddle_Titan"},
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
			--FigureVanish	{Tag = "CS_Twiddle_Titan"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
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
			MapFlagSetTrue {Name = "mf_P710_StartFourTwiddlesCS_End"},
		},
	},
};