-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'CS2_Ghost_01'",
		"'CS2_Ghost_02'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> CS2 starts 20 sec after the MQ1 is completed <<<",
		Conditions =
		{	
			MapTimerIsElapsed {Name = "mt_P703_Start_CS2", Seconds = 1},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "CS2_Ghost_01"},
			CutsceneFigureWeaponsHide {Tag = "CS2_Ghost_02"},
		  MapTimerStop {Name = "mt_P703_Start_CS2"},
		  CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X =589.448 , Y =75.6429 },
		  CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X =589.448 , Y =75.6429 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureLookAtDirection {Tag = "CS2_Ghost_02", Direction = 22},
		--	FigureTeleport	{Tag = "pl_HumanAvatar", X =589.348 , Y =75.8429 },
		--	FigureTeleport	{Tag = "pl_HumanAvatar", X =589.348 , Y =75.8429 },
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS2_Gate_01",
	},
};

State
{
	StateName = "CS2_Gate_01",
	
	OnOneTimeEvent
	{
		EventName = ">>> CS2_Gate cutscene <<<",
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2_Gate_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			CutsceneSay {TextTag = "CS2_Gate01", Tag = "CS2_Ghost_01"}, --pl_HumanAvatar
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_02",
	},
};

State
{
	StateName = "CS2_Gate_02",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate02", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_03",
	},	
};

State
{
	StateName = "CS2_Gate_03",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate03", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_04",
	},	
};
State
{
	StateName = "CS2_Gate_04",
	
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
			CutsceneSay {TextTag = "CS2_Gate04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_05",
	},	
};
State
{
	StateName = "CS2_Gate_05",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate05", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_06",
	},	
};
State
{
	StateName = "CS2_Gate_06",
	
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
			CutsceneSay {TextTag = "CS2_Gate06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_07",
	},	
};
State
{
	StateName = "CS2_Gate_07",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate07", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_08",
	},	
};
State
{
	StateName = "CS2_Gate_08",
	
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
			CutsceneSay {TextTag = "CS2_Gate08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_09",
	},	
};
State
{
	StateName = "CS2_Gate_09",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate09", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_10",
	},	
};
State
{
	StateName = "CS2_Gate_10",
	
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
			CutsceneSay {TextTag = "CS2_Gate10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_11",
	},	
};
State
{
	StateName = "CS2_Gate_11",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate11", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_12",
	},	
};
State
{
	StateName = "CS2_Gate_12",
	
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
			CutsceneSay {TextTag = "CS2_Gate12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_13",
	},	
};
State
{
	StateName = "CS2_Gate_13",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate13", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_14",
	},	
};
State
{
	StateName = "CS2_Gate_14",
	
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
			CutsceneSay {TextTag = "CS2_Gate14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_15",
	},	
};
State
{
	StateName = "CS2_Gate_15",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate15", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_16",
	},	
};
State
{
	StateName = "CS2_Gate_16",
	
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
			CutsceneSay {TextTag = "CS2_Gate16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_17",
	},	
};
State
{
	StateName = "CS2_Gate_17",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate17", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_18",
	},	
};
State
{
	StateName = "CS2_Gate_18",
	
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
			CutsceneSay {TextTag = "CS2_Gate18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_19",
	},	
};
State
{
	StateName = "CS2_Gate_19",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate19", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_20",
	},	
};
State
{
	StateName = "CS2_Gate_20",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate20", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_21",
	},	
};
State
{
	StateName = "CS2_Gate_21",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate21", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_22",
	},	
};
State
{
	StateName = "CS2_Gate_22",
	
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
			CutsceneSay {TextTag = "CS2_Gate22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_23",
	},	
};
State
{
	StateName = "CS2_Gate_23",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate23", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_24",
	},	
};
State
{
	StateName = "CS2_Gate_24",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate24", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_25",
	},	
};
State
{
	StateName = "CS2_Gate_25",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate25", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_26",
	},	
};
State
{
	StateName = "CS2_Gate_26",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate26", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_27",
	},	
};
State
{
	StateName = "CS2_Gate_27",
	
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
			CutsceneSay {TextTag = "CS2_Gate27", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_28",
	},	
};
State
{
	StateName = "CS2_Gate_28",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate28", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_29",
	},	
};
State
{
	StateName = "CS2_Gate_29",
	
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
			CutsceneSay {TextTag = "CS2_Gate29", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_30",
	},	
};
State
{
	StateName = "CS2_Gate_30",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate30", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_31",
	},	
};
State
{
	StateName = "CS2_Gate_31",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate31", Tag = "CS2_Ghost_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_32",
	},	
};
State
{
	StateName = "CS2_Gate_32",
	
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
			CutsceneSay {TextTag = "CS2_Gate32", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_33",
	},	
};
State
{
	StateName = "CS2_Gate_33",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate33", Tag = "CS2_Ghost_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS2_Gate_34",
	},	
};
State
{
	StateName = "CS2_Gate_34",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ghost01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_Gate34", Tag = "CS2_Ghost_01"},
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
		GotoState = "CS2_FINISH",
	},	
};

State
{
	StateName = "CS2_FINISH",
	
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
			CutsceneFigureWeaponsShow {Tag = "CS2_Ghost_01"},
			CutsceneFigureWeaponsShow {Tag = "CS2_Ghost_02"},
			FadeInEffectStart{},
			FogOfWarCloak	{FogOfWarId = default},
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
			MapFlagSetTrue {Name = "mf_P703_CS2_Gate_Ended"},
		},
	},
};