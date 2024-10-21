-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'ereon'",
		"'pl_HumanHeroCaine'",
		"'zarach'",
		"'pl_HumanCompanionCraigHuman'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> CS5 starts after P704 <<<",
		Conditions =
		{	
			MapFlagIsTrue{ Name = "mf_P705_CS05_Start" },
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "zarach"},
			CutsceneFigureWeaponsHide {Tag = "ereon"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},			
		},
		Coop = false,
		Tags = _tRenderList,
		MapFlagSetTrue {Name = "cs5_init_started"},
		GotoState = "CS5_Gods_01",
	},
};

State
{
	StateName = "CS5_Gods_01",
	
	OnOneTimeEvent
	{
		EventName = ">>> CS5 cutscene <<<",
		Conditions =
		{
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "cs5_take1_started"},
			FigureTeleportToEntity	{Tag = "zarach", TargetTag = "teleport_zarach"},
			FigureTeleportToEntity	{Tag = "zarach", TargetTag = "teleport_zarach"},
			FigureLookAtDirection {Tag = "zarach", Direction = 0},
			
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 600, Y = 580},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 600, Y = 580},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 216.761},
			
			CutsceneFigureTeleport	{Tag = "pl_HumanCompanionCraigHuman", X = 600, Y = 580},
			CutsceneFigureTeleport	{Tag = "pl_HumanCompanionCraigHuman", X = 600, Y = 580},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 187.15},
			
			CutsceneFigureTeleport	{Tag = "pl_HumanHeroCaine", X = 600, Y = 580},
			CutsceneFigureTeleport	{Tag = "pl_HumanHeroCaine", X = 600, Y = 580},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 239.679},
			
			MapTimerStop {Name = "mt_P705_Start_CS5"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS5_Gods_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
						
			CutsceneSay {TextTag = "CS5_Gods01", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_02",
	},
};
State
{
	StateName = "CS5_Gods_02",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods02", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_03",
	},	
};
State
{
	StateName = "CS5_Gods_03",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods03", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_04",
	},	
};
State
{
	StateName = "CS5_Gods_04",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods04", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_05",
	},	
};
State
{
	StateName = "CS5_Gods_05",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods05", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_06",
	},	
};
State
{
	StateName = "CS5_Gods_06",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods06", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_07",
	},	
};
State
{
	StateName = "CS5_Gods_07",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods07", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_08",
	},	
};
State
{
	StateName = "CS5_Gods_08",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods08", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_09",
	},	
};
State
{
	StateName = "CS5_Gods_09",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods09", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_10",
	},	
};
State
{
	StateName = "CS5_Gods_10",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods10", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_11",
	},	
};
State
{
	StateName = "CS5_Gods_11",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods11", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_12",
	},	
};
State
{
	StateName = "CS5_Gods_12",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods12", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_13",
	},	
};
State
{
	StateName = "CS5_Gods_13",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods13", Tag = "ereon"},

			-- walk starting position
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 633.163, Y = 594.808},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 633.163, Y = 594.808},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 216.761},
			
			CutsceneFigureTeleport	{Tag = "pl_HumanCompanionCraigHuman", X = 626.52, Y = 593.278},
			CutsceneFigureTeleport	{Tag = "pl_HumanCompanionCraigHuman", X = 626.52, Y = 593.278},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 187.15},
			
			CutsceneFigureTeleport	{Tag = "pl_HumanHeroCaine", X = 637.888, Y = 599.675},
			CutsceneFigureTeleport	{Tag = "pl_HumanHeroCaine", X = 637.888, Y = 599.675},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 239.679},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_EnterParty",
	},	
};
State
{
	StateName = "CS5_Gods_EnterParty",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Entry", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			-- walk to final position
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 629.186, Y = 600.427}, 
			FigureSimpleWalk {Tag = "pl_HumanCompanionCraigHuman", X = 626.238, Y = 598.553}, 
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 631.261, Y = 603.283}, 

			--FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 216.761},
			
			--FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 187.15},
			
			--FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 239.679},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_14",
	},	
};
State
{
	StateName = "CS5_Gods_14",
	
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
		--	CutsceneSayIsDone {},	
		  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_15",
	},	
};
State
{
	StateName = "CS5_Gods_15",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods15", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_16",
	},	
};
State
{
	StateName = "CS5_Gods_16",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_17",
	},	
};
State
{
	StateName = "CS5_Gods_17",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods17", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_18",
	},	
};
State
{
	StateName = "CS5_Gods_18",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods18", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_19",
	},	
};
State
{
	StateName = "CS5_Gods_19",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods19", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_20",
	},	
};
State
{
	StateName = "CS5_Gods_20",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods20", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_21",
	},	
};
State
{
	StateName = "CS5_Gods_21",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods21", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_22",
	},	
};
State
{
	StateName = "CS5_Gods_22",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods22", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_23",
	},	
};
State
{
	StateName = "CS5_Gods_23",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods23", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_24",
	},	
};
State
{
	StateName = "CS5_Gods_24",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods24", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_25",
	},	
};
State
{
	StateName = "CS5_Gods_25",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods25", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_26",
	},	
};
State
{
	StateName = "CS5_Gods_26",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods26", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_27",
	},	
};
State
{
	StateName = "CS5_Gods_27",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods27", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_28",
	},	
};
State
{
	StateName = "CS5_Gods_28",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods28", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_29",
	},	
};
State
{
	StateName = "CS5_Gods_29",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods29", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_30",
	},	
};
State
{
	StateName = "CS5_Gods_30",
	
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
			CutsceneSay {TextTag = "CS5_Gods30", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_31",
	},	
};
State
{
	StateName = "CS5_Gods_31",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods31", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_32",
	},	
};
State
{
	StateName = "CS5_Gods_32",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods32", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_33",
	},	
};
State
{
	StateName = "CS5_Gods_33",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods33", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_34",
	},	
};
State
{
	StateName = "CS5_Gods_34",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods34", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_35",
	},	
};
State
{
	StateName = "CS5_Gods_35",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods35", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_36",
	},	
};
State
{
	StateName = "CS5_Gods_36",
	
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
			CutsceneSay {TextTag = "CS5_Gods36", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_37",
	},	
};
State
{
	StateName = "CS5_Gods_37",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods37", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_38",
	},	
};
State
{
	StateName = "CS5_Gods_38",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods38", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_39",
	},	
};
State
{
	StateName = "CS5_Gods_39",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods39", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_40",
	},	
};
State
{
	StateName = "CS5_Gods_40",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods40", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_41",
	},	
};
State
{
	StateName = "CS5_Gods_41",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods41", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_42",
	},	
};
State
{
	StateName = "CS5_Gods_42",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods42", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_43",
	},	
};
State
{
	StateName = "CS5_Gods_43",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Zarach", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods43", Tag = "zarach"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS5_Gods_44",
	},	
};
State
{
	StateName = "CS5_Gods_44",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_Gods44", Tag = "pl_HumanAvatar"},
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
		GotoState = "CS5_FINISH",
	},	
};

State
{
	StateName = "CS5_FINISH",
	
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
			FadeInEffectStart{},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "zarach"},
			CutsceneFigureWeaponsShow {Tag = "ereon"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
				--FigureVanish	{Tag = "pl_HumanCompanionCraigHuman"},
				FigureVanish	{Tag = "zarach"},
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
			--MapFlagSetTrue {Name = "mf_P705_CS5_Gods_Ended"},
			MapTimerStart {Name = "mt_P705_CS5_Ended"}
		},
	},
};