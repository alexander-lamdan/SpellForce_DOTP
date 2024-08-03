-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'zerbo'",
		"'zerbo_02'",
		"'ereon'",
		"'craig_01'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> CS4 starts 6 sec after the MQ3 is completed <<<",
		Conditions =
		{	
			--20 sec
			MapTimerIsElapsed {Name = "mt_P703_Start_CS4", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "zerbo"},
			CutsceneFigureWeaponsHide {Tag = "zerbo_02"},
			CutsceneFigureWeaponsHide {Tag = "ereon"},
			CutsceneFigureWeaponsHide {Tag = "craig_01"},

			CutsceneFigureTeleport	{Tag = "craig_01", X = 4, Y = 4},
			CutsceneFigureTeleport	{Tag = "craig_01", X = 4, Y = 4},

			CutsceneFigureTeleport	{Tag = "zerbo_02", X = 4, Y = 4},
			CutsceneFigureTeleport	{Tag = "zerbo_02", X = 4, Y = 4},


			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 462.212, Y = 460.759},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 462.212, Y = 460.759},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180.457},

			CutsceneFigureTeleport	{Tag = "zerbo", X = 463.434, Y = 464.939},
			CutsceneFigureTeleport	{Tag = "zerbo", X = 463.434, Y = 464.939},
			FigureLookAtDirection {Tag = "zerbo", Direction = 0},

			CutsceneFigureTeleport	{Tag = "ereon", X = 460.084, Y = 464.696},
			CutsceneFigureTeleport	{Tag = "ereon", X = 460.084, Y = 464.696},
			FigureLookAtDirection {Tag = "ereon", Direction = 56.3326},
			

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS4_Gods_01",
	},
};

State
{
	StateName = "CS4_Gods_01",
	
	OnOneTimeEvent
	{
		EventName = ">>> CS4_Gate cutscene <<<",
		Conditions =
		{

		},
		Actions =
		{
			--FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "gods_avatar"},
			--FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "gods_avatar"},
			--FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 220},

			MapTimerStop {Name = "mt_P703_Start_CS4"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS4_Gods_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			CutsceneSay {TextTag = "CS4_Gods01", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_ZerboChange",
	},
};
State
{
	StateName = "CS4_Gods_ZerboChange",
	
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_Zerbo", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
		--	CutsceneSay {TextTag = "CS4_Gods02", Tag = "zerbo_02"},

			EffectStartAtEntityPosition {Tag = "zerbo", File = "Effect_Spawn_Unit"},
			FigureVanish	{Tag = "zerbo"},

			FigureLookAtDirection {Tag = "zerbo_02", Direction = 0},			
			CutsceneFigureTeleport	{Tag = "zerbo_02", X = 463.434, Y = 464.939},
			CutsceneFigureTeleport	{Tag = "zerbo_02", X = 463.434, Y = 464.939},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_02",
	},	
};
State
{
	StateName = "CS4_Gods_02",
	
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			--CutsceneSayIsDone {},	
		  EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Zerbo", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods02", Tag = "zerbo_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_03",
	},	
};
State
{
	StateName = "CS4_Gods_03",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods03", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_04",
	},	
};
State
{
	StateName = "CS4_Gods_04",
	
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
			CameraTakeAddToTrack {File = "CS4_Gods_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods04", Tag = "zerbo_02"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_Walk",
	},	
};
State
{
	StateName = "CS4_Gods_Walk",
	
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Zerbo", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			--CutsceneSay {TextTag = "CS4_Gods04", Tag = "zerbo_02"},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 467.6, Y = 466.2}, 
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_05",
	},	
};
State
{
	StateName = "CS4_Gods_05",
	
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			-- CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{

			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 625.83, Y = 604.276},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 625.83, Y = 604.276},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 337.082},

			CutsceneFigureTeleport	{Tag = "craig_01", X = 628.275, Y = 600.961},
			CutsceneFigureTeleport	{Tag = "craig_01", X = 628.275, Y = 600.961},
			FigureLookAtDirection {Tag = "craig_01", Direction = 267.364},

			CutsceneFigureTeleport	{Tag = "ereon", X = 621.942, Y = 601.527},
			CutsceneFigureTeleport	{Tag = "ereon", X = 621.942, Y = 601.527},
			FigureLookAtDirection {Tag = "ereon", Direction = 106.936},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS4_Gods_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods05", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_06",
	},	
};
State
{
	StateName = "CS4_Gods_06",
	
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
			CutsceneSay {TextTag = "CS4_Gods06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_07",
	},	
};
State
{
	StateName = "CS4_Gods_07",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods07", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_08",
	},	
};
State
{
	StateName = "CS4_Gods_08",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_09",
	},	
};
State
{
	StateName = "CS4_Gods_09",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods09", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_10",
	},	
};
State
{
	StateName = "CS4_Gods_10",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_11",
	},	
};
State
{
	StateName = "CS4_Gods_11",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods11", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_12",
	},	
};
State
{
	StateName = "CS4_Gods_12",
	
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods12", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_13",
	},	
};
State
{
	StateName = "CS4_Gods_13",
	
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods13", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_14",
	},	
};
State
{
	StateName = "CS4_Gods_14",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_15",
	},	
};
State
{
	StateName = "CS4_Gods_15",
	
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods15", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_16",
	},	
};
State
{
	StateName = "CS4_Gods_16",
	
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_17",
	},	
};
State
{
	StateName = "CS4_Gods_17",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods17", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_18",
	},	
};
State
{
	StateName = "CS4_Gods_18",
	
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
			CutsceneSay {TextTag = "CS4_Gods18", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_19",
	},	
};
State
{
	StateName = "CS4_Gods_19",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods19", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_20",
	},	
};
State
{
	StateName = "CS4_Gods_20",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods20", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_21",
	},	
};
State
{
	StateName = "CS4_Gods_21",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods21", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_22",
	},	
};
State
{
	StateName = "CS4_Gods_22",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_23",
	},	
};
State
{
	StateName = "CS4_Gods_23",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods23", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_24",
	},	
};
State
{
	StateName = "CS4_Gods_24",
	
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
			CutsceneSay {TextTag = "CS4_Gods24", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_25",
	},	
};
State
{
	StateName = "CS4_Gods_25",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods25", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_26",
	},	
};
State
{
	StateName = "CS4_Gods_26",
	
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods26", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_27",
	},	
};
State
{
	StateName = "CS4_Gods_27",
	
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
			CutsceneSay {TextTag = "CS4_Gods27", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_28",
	},	
};
State
{
	StateName = "CS4_Gods_28",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods28", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_29",
	},	
};
State
{
	StateName = "CS4_Gods_29",
	
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
			CutsceneSay {TextTag = "CS4_Gods29", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_30",
	},	
};
State
{
	StateName = "CS4_Gods_30",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods30", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_31",
	},	
};
State
{
	StateName = "CS4_Gods_31",
	
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods31", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_32",
	},	
};
State
{
	StateName = "CS4_Gods_32",
	
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS4_Gods_Take_01", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods32", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_33",
	},	
};
State
{
	StateName = "CS4_Gods_33",
	
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
			CutsceneSay {TextTag = "CS4_Gods33", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_34",
	},	
};
State
{
	StateName = "CS4_Gods_34",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods34", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_35",
	},	
};
State
{
	StateName = "CS4_Gods_35",
	
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
			CutsceneSay {TextTag = "CS4_Gods35", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_36",
	},	
};
State
{
	StateName = "CS4_Gods_36",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods36", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_37",
	},	
};
State
{
	StateName = "CS4_Gods_37",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods37", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_38",
	},	
};
State
{
	StateName = "CS4_Gods_38",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods38", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_39",
	},	
};
State
{
	StateName = "CS4_Gods_39",
	
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
			CutsceneSay {TextTag = "CS4_Gods39", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_40",
	},	
};
State
{
	StateName = "CS4_Gods_40",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods40", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_41",
	},	
};
State
{
	StateName = "CS4_Gods_41",
	
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
			CutsceneSay {TextTag = "CS4_Gods41", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_42",
	},	
};
State
{
	StateName = "CS4_Gods_42",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods42", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_43",
	},	
};
State
{
	StateName = "CS4_Gods_43",
	
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
			CutsceneSay {TextTag = "CS4_Gods43", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_44",
	},	
};
State
{
	StateName = "CS4_Gods_44",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods44", Tag = "ereon"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_45",
	},	
};
State
{
	StateName = "CS4_Gods_45",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods45", Tag = "craig_01"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS4_Gods_46",
	},	
};
State
{
	StateName = "CS4_Gods_46",
	
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
			CameraTakeAddToTrack {File = "CS_Take_Ereon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS4_Gods46", Tag = "ereon"},
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
		GotoState = "CS4_FINISH",
	},	
};



State
{
	StateName = "CS4_FINISH",
	
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
			CutsceneFigureWeaponsShow {Tag = "zerbo_02"},
			CutsceneFigureWeaponsShow {Tag = "ereon"},
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
			MapFlagSetTrue {Name = "mf_P703_CS4_Gods_Ended"},
		},
	},
};