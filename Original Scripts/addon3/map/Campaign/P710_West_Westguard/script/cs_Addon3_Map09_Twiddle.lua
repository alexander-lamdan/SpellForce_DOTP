-- CS_Shrine_

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
	--	"'pl_HumanHeroFirst'",
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
		"'pl_HumanHeroCaine'",
	--	"'pl_HumanHeroOrc'",
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
			FigureVanish {Tag = "CS_Twiddle1"},
			FigureVanish {Tag = "CS_Twiddle3"},
			FigureVanish {Tag = "CS_Twiddle4"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
				--MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
				MapFlagIsTrue {Name = "mf_P710_StartTwiddleCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},

			ObjectSpawn	{ObjectId = 1102, X = 485, Y = 45, Direction = 0, Tag = "SZT"},
			
			FigureTeleport	{Tag = "Twiddle4", X = 485, Y = 45},
			FigureDirectionSet	{Tag = "Twiddle4", Direction = 180},
			CutsceneFigureWeaponsHide {Tag = "Twiddle4"},
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485, Y = 50},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485, Y = 50},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "SZT"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 480, Y = 51},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 480, Y = 51},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "SZT"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 481, Y = 48},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 481, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "SZT"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 476, Y = 48},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 476, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "SZT"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},
			
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 478, Y = 46},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 478, Y = 46},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "SZT"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 478, Y = 50},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 478, Y = 50},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "SZT"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 479, Y = 48},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 479, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "SZT"},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "SZT"},
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
			CutsceneSay {TextTag = "TwiddleCS01", Tag = "Twiddle4"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS03", Tag = "Twiddle4"},
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
			EffectStart	{Tag = "Twiddle1", File = "Effect_Spawn_Unit"},
			FigureTeleport	{Tag = "Twiddle1", X = 487.278, Y = 54},
			FigureTeleport	{Tag = "Twiddle1", X = 487.278, Y = 54},
			FigureLookAtEntity	{Tag = "Twiddle1", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "Twiddle1", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Twiddle1"},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "Twiddle1"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle1"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Twiddle01b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS04", Tag = "Twiddle1"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS05", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS06", Tag = "pl_HumanCompanionCraigHuman"},
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
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Twiddle_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			
			EffectStart	{Tag = "Twiddle2", File = "Effect_Spawn_Unit"},
			FigureTeleport	{Tag = "Twiddle2", X = 487.933, Y = 50},
			FigureTeleport	{Tag = "Twiddle2", X = 487.933, Y = 50},
			FigureLookAtEntity	{Tag = "Twiddle2", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "Twiddle2", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle2"},

			EffectStart	{Tag = "Twiddle3", File = "Effect_Spawn_Unit"},
			FigureTeleport	{Tag = "Twiddle3", X = 487.3, Y = 47},
			FigureTeleport	{Tag = "Twiddle3", X = 487.3, Y = 47},
			FigureLookAtEntity	{Tag = "Twiddle3", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "Twiddle3", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Twiddle3"},

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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Twiddle02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS07", Tag = "Twiddle2"},
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
			CutsceneSay {TextTag = "TwiddleCS08", Tag = "Twiddle3"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS09", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS10", Tag = "pl_HumanCompanionCraigHuman"},
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
			CutsceneSay {TextTag = "TwiddleCS11", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle01b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS12", Tag = "Twiddle1"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS13", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS14", Tag = "Twiddle3"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TwiddleCS15", Tag = "Twiddle4"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "SHUTDOWN",
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
			CutsceneSay {TextTag = "TwiddleCS16", Tag = "pl_HumanAvatar"},
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "Twiddle1"},
			CutsceneFigureWeaponsShow {Tag = "Twiddle2"},
			CutsceneFigureWeaponsShow {Tag = "Twiddle3"},
			CutsceneFigureWeaponsShow {Tag = "Twiddle4"},
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
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartTwiddleCS_End"},
		},
	},
};