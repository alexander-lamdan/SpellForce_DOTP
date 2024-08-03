-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'hirin'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> FigureRespawn when mf_P500_MainInitEnded <<<",
		Conditions =
		{	
			MapFlagIsTrue{ Name = "mf_P703_CS01_Start" },
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "hirin"},
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
		EventName = ">>> No event, switched to with GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "intro_caine"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "intro_caine"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 245.409},
			
			--FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "intro_avatar"},
			--FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "intro_avatar"},
			--FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 222.49},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 34.3195, Y = 21.0097},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 34.3195, Y = 21.0097},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 209.105},
			
			
			
			FigureTeleportToEntity	{Tag = "hirin", TargetTag = "intro_hirin"},
			FigureTeleportToEntity	{Tag = "hirin", TargetTag = "intro_hirin"},
			FigureLookAtDirection {Tag = "hirin", Direction = 56.3326},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro01", Tag = "hirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE02",
	},
};

State
{
	StateName = "TAKE02",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		  --EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE03",
	},	
};

State
{
	StateName = "TAKE03",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro03", Tag = "hirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE04",
	},
};

State
{
	StateName = "TAKE04",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE05",
	},
};

State
{
	StateName = "TAKE05",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro05", Tag = "hirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE06",
	},
};

State
{
	StateName = "TAKE06",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro06", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE07",
	},
};

State
{
	StateName = "TAKE07",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE_HA",
	},
};

State
{
	StateName = "TAKE08",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro08", Tag = "hirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE09",
	},
};

State
{
	StateName = "TAKE09",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro09", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE10",
	},
};

State
{
	StateName = "TAKE10",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE_HA",
	},
};

State
{
	StateName = "TAKE_HA",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_HirinAppears", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
				FigureVanish	{Tag = "hirin"},
			FigureNpcSpawnToEntity	{Tag = "TheRealHirin", Level = 1, UnitId = 2202, TargetTag = "intro_hirin", Team = "tm_Neutral"},
			FigureLookAtDirection {Tag = "hirin", Direction = 56.3326},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE11",
	},
};



State
{
	StateName = "TAKE11",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
		  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro11", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE12",
	},
};

State
{
	StateName = "TAKE12",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE13",
	},
};

State
{
	StateName = "TAKE13",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro13", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE14",
	},
};

State
{
	StateName = "TAKE14",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE15",
	},
};

State
{
	StateName = "TAKE15",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro15", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE16",
	},
};

State
{
	StateName = "TAKE16",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro16", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE17",
	},
};

State
{
	StateName = "TAKE17",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro17", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE18",
	},
};

State
{
	StateName = "TAKE18",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE19",
	},
};

State
{
	StateName = "TAKE19",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		 -- EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro19", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE20",
	},
};

State
{
	StateName = "TAKE20",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro20", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE21",
	},
};

State
{
	StateName = "TAKE21",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro21", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE22",
	},
};

State
{
	StateName = "TAKE22",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS1_Intro_Take01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro22", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE23",
	},
};

State
{
	StateName = "TAKE23",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro23", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE24",
	},
};

State
{
	StateName = "TAKE24",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro24", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE25",
	},
};

State
{
	StateName = "TAKE25",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro25", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE26",
	},
};

State
{
	StateName = "TAKE26",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Hirin02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro26", Tag = "TheRealHirin"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE27",
	},
};

State
{
	StateName = "TAKE27",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro27", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE28",
	},
};

State
{
	StateName = "TAKE28",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		--  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro28", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE29",
	},
};

State
{
	StateName = "TAKE29",
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		  --EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro29", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
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
		GotoState = "FINISH",
	},	
};


State
{
	StateName = "FINISH",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
--			CutsceneFigureWeaponsShow {Tag = "hirin"},
			FadeInEffectStart{},
				FigureVanish	{Tag = "TheRealHirin"},
		},	
		GotoState = "ENDED",
	},	
};

State
{
	StateName = "ENDED",
	
	OnOneTimeEvent
	{
		EventName = ">>> No event, switched to with GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_CS1_IntroEnded"},
		},
	},
};