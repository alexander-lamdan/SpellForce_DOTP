-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'craig_01'",
		"'pl_HumanHeroCaine'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> CS3 starts 6 sec after the MQ3 is completed <<<",
		Conditions =
		{	
			MapTimerIsElapsed {Name = "mt_P703_Start_CS3", Seconds = 6},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "craig_01"},
		  MapTimerStop {Name = "mt_P703_Start_CS3"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS3_Gate_01",
	},
};

State
{
	StateName = "CS3_Gate_01",
	
	OnOneTimeEvent
	{
		EventName = ">>> CS3_Gate cutscene <<<",
		Conditions =
		{
		},
		Actions =
		{
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 578.069, Y = 330.129},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 578.069, Y = 330.129},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 174.727},

			CutsceneFigureTeleport	{Tag = "craig_01", X = 576.211, Y = 333.606},
			CutsceneFigureTeleport	{Tag = "craig_01", X = 576.211, Y = 333.606},
			FigureLookAtDirection {Tag = "craig_01", Direction = 36.254},

			CutsceneFigureTeleport	{Tag = "pl_HumanHeroCaine", X = 580, Y = 334.374},
			CutsceneFigureTeleport	{Tag = "pl_HumanHeroCaine", X = 580, Y = 334.374},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 334.374},


			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureTeleport	{Tag = "pl_HumanAvatar", X = 578.548, Y = 334.142 },
			--FigureTeleport	{Tag = "craig_01", X = 573.548, Y = 331.142 },
			
			CutsceneSay {TextTag = "CS3_Gate01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_02",
	},
};
State
{
	StateName = "CS3_Gate_02",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate02", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_03",
	},	
};
State
{
	StateName = "CS3_Gate_03",
	
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
			CutsceneSay {TextTag = "CS3_Gate03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_04",
	},	
};
State
{
	StateName = "CS3_Gate_04",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate04", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_05",
	},	
};
State
{
	StateName = "CS3_Gate_05",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate05", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_06",
	},	
};
State
{
	StateName = "CS3_Gate_06",
	
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
			CutsceneSay {TextTag = "CS3_Gate06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_07",
	},	
};
State
{
	StateName = "CS3_Gate_07",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate07", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_08",
	},	
};
State
{
	StateName = "CS3_Gate_08",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate08", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_09",
	},	
};
State
{
	StateName = "CS3_Gate_09",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate09", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_10",
	},	
};
State
{
	StateName = "CS3_Gate_10",
	
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
			CutsceneSay {TextTag = "CS3_Gate10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_11",
	},	
};
State
{
	StateName = "CS3_Gate_11",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate11", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_12",
	},	
};
State
{
	StateName = "CS3_Gate_12",
	
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
			CutsceneSay {TextTag = "CS3_Gate12", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_13",
	},	
};
State
{
	StateName = "CS3_Gate_13",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate13", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_14",
	},	
};
State
{
	StateName = "CS3_Gate_14",
	
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
			CutsceneSay {TextTag = "CS3_Gate14", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_15",
	},	
};
State
{
	StateName = "CS3_Gate_15",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate15", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_16",
	},	
};
State
{
	StateName = "CS3_Gate_16",
	
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
			CutsceneSay {TextTag = "CS3_Gate16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_17",
	},	
};
State
{
	StateName = "CS3_Gate_17",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_Gate17", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS3_Gate_18",
	},	
};
State
{
	StateName = "CS3_Gate_18",
	
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
			CutsceneSay {TextTag = "CS3_Gate18", Tag = "pl_HumanAvatar"},
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
		GotoState = "CS3_FINISH",
	},	
};



State
{
	StateName = "CS3_FINISH",
	
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "craig_01"},
			FadeInEffectStart{},
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
			MapFlagSetTrue {Name = "mf_P703_CS3_Gate_Ended"},
		},
	},
};