--**************************************************************************
--*                                                                        *
--*   Icewastes of Shalibar :: CutScene: The Story of the Norcaine tribe   *
--*                                                                        *
--**************************************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
--		"'pl_HumanHeroOrc'",
--		"'pl_HumanHeroFirst'",
--		"'pl_HumanHeroSecond'",
--		"'pl_HumanHeroThird'",
		"'pl_HumanCompanionCraigHuman'",
--		"'pl_HumanCompanionSariel'",

		"'norcaine_leader'",
	}
}

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "CS02_INIT" ,
		Conditions =
		{
		},
		Actions =
		{
		},
	},

	-- the scene starts as soon as the cutscene start flag start is true
	-- can define the renderlist, hide weapons, can telepor the figures, etc.
	-- all of the cuts are in separated states
	
	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P709_CS02_Start"},

			FigureIsAlive {Tag = "pl_HumanAvatar"},
			FigureIsAlive {Tag = "pl_HumanHeroCaine"},
			FigureIsAlive {Tag = "pl_HumanHeroOrc"},
			FigureIsAlive {Tag = "pl_HumanHeroFirst"},
			FigureIsAlive {Tag = "pl_HumanHeroSecond"},
			FigureIsAlive {Tag = "pl_HumanHeroThird"},
			FigureIsAlive {Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsAlive {Tag = "pl_HumanCompanionSariel"},

			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},

		},
		Actions =
		{
			_tRenderList,

			CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
	--		CutsceneFigureWeaponsHide {Tag = "norcaine_leader"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 40.3433, Y = 42.2652},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 40.3433, Y = 42.2652},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 116.25},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 40.127, Y = 40.5084},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 40.127, Y = 40.5084},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 132.426},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 44.0186, Y = 39.0926},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 44.0186, Y = 39.0926},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 161.123},
			
			CutsceneFigureTeleport {Tag = "norcaine_leader", X = 47.15, Y = 44.45},
			CutsceneFigureTeleport {Tag = "norcaine_leader", X = 47.15, Y = 44.45},
			FigureLookAtDirection {Tag = "norcaine_leader", Direction = 290},


  		CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "P709_CUT_CS02_T001_DRACON",
	},
};

--	P709_CUT_CS02_T001_DRACON

State
{
	StateName = "P709_CUT_CS02_T001_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T001_DRACON", Tag = "norcaine_leader"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T002_CRAIG",
	},	
};

--	P709_CUT_CS02_T002_CRAIG

State
{
	StateName = "P709_CUT_CS02_T002_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T002_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T003_DRACON",
	},	
};

--	P709_CUT_CS02_T003_DRACON

State
{
	StateName = "P709_CUT_CS02_T003_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T003_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T004_CRAIG",
	},	
};

--	P709_CUT_CS02_T004_CRAIG

State
{
	StateName = "P709_CUT_CS02_T004_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T004_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T005_DRACON",
	},	
};

--	P709_CUT_CS02_T005_DRACON

State
{
	StateName = "P709_CUT_CS02_T005_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T005_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T006_AVATAR",
	},	
};

--	P709_CUT_CS02_T006_AVATAR

State
{
	StateName = "P709_CUT_CS02_T006_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T006_AVATAR", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T007_DRACON",
	},	
};

--	P709_CUT_CS02_T007_DRACON

State
{
	StateName = "P709_CUT_CS02_T007_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T007_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T008_CAINE",
	},	
};

--	P709_CUT_CS02_T008_CAINE

State
{
	StateName = "P709_CUT_CS02_T008_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T008_CAINE", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T009_CRAIG",
	},	
};

--	P709_CUT_CS02_T009_CRAIG

State
{
	StateName = "P709_CUT_CS02_T009_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T009_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T010_DRACON",
	},	
};

--	P709_CUT_CS02_T010_DRACON

State
{
	StateName = "P709_CUT_CS02_T010_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T010_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T011_CRAIG",
	},	
};

--	P709_CUT_CS02_T011_CRAIG

State
{
	StateName = "P709_CUT_CS02_T011_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T011_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T012_DRACON",
	},	
};

--	P709_CUT_CS02_T012_DRACON

State
{
	StateName = "P709_CUT_CS02_T012_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T012_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T013_DRACON",
	},	
};

--	P709_CUT_CS02_T013_DRACON

State
{
	StateName = "P709_CUT_CS02_T013_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T013_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T014_DRACON",
	},	
};

--	P709_CUT_CS02_T014_DRACON

State
{
	StateName = "P709_CUT_CS02_T014_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T014_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T015_DRACON",
	},	
};

--	P709_CUT_CS02_T015_DRACON

State
{
	StateName = "P709_CUT_CS02_T015_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T015_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T016_DRACON",
	},	
};

--	P709_CUT_CS02_T016_DRACON

State
{
	StateName = "P709_CUT_CS02_T016_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T016_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T017_DRACON",
	},	
};

--	P709_CUT_CS02_T017_DRACON

State
{
	StateName = "P709_CUT_CS02_T017_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T017_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T018_AVATAR",
	},	
};

--	P709_CUT_CS02_T018_AVATAR

State
{
	StateName = "P709_CUT_CS02_T018_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T018_AVATAR", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T019_DRACON",
	},	
};

--	P709_CUT_CS02_T019_DRACON

State
{
	StateName = "P709_CUT_CS02_T019_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T019_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T020_DRACON",
	},	
};

--	P709_CUT_CS02_T020_DRACON

State
{
	StateName = "P709_CUT_CS02_T020_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T020_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T021_CRAIG",
	},	
};

--	P709_CUT_CS02_T021_CRAIG

State
{
	StateName = "P709_CUT_CS02_T021_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T021_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T022_DRACON",
	},	
};

--	P709_CUT_CS02_T022_DRACON

State
{
	StateName = "P709_CUT_CS02_T022_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T022_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T023_AVATAR",
	},	
};

--	P709_CUT_CS02_T023_AVATAR

State
{
	StateName = "P709_CUT_CS02_T023_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T023_AVATAR", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T024_DRACON",
	},	
};

--	P709_CUT_CS02_T024_DRACON

State
{
	StateName = "P709_CUT_CS02_T024_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T024_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T025_DRACON",
	},	
};

--	P709_CUT_CS02_T025_DRACON

State
{
	StateName = "P709_CUT_CS02_T025_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T025_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T026_CRAIG",
	},	
};

--	P709_CUT_CS02_T026_CRAIG

State
{
	StateName = "P709_CUT_CS02_T026_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T026_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T027_DRACON",
	},	
};

--	P709_CUT_CS02_T027_DRACON

State
{
	StateName = "P709_CUT_CS02_T027_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T027_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T028_CAINE",
	},	
};

--	P709_CUT_CS02_T028_CAINE

State
{
	StateName = "P709_CUT_CS02_T028_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T028_CAINE", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T029_DRACON",
	},	
};

--	P709_CUT_CS02_T029_DRACON

State
{
	StateName = "P709_CUT_CS02_T029_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T029_DRACON", Tag = "norcaine_leader"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T030_CRAIG",
	},	
};

--	P709_CUT_CS02_T030_CRAIG

State
{
	StateName = "P709_CUT_CS02_T030_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T030_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T031_AVATAR",
	},	
};

--	P709_CUT_CS02_T031_AVATAR

State
{
	StateName = "P709_CUT_CS02_T031_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T031_AVATAR", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS02_T032_DRACON",
	},	
};

--	P709_CUT_CS02_T032_DRACON

State
{
	StateName = "P709_CUT_CS02_T032_DRACON",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS02_T032_DRACON", Tag = "norcaine_leader"},		
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

-- cutscene ends, cutscene end flag has to be set to true

State
{
	StateName = "CutsceneFINISH",
	OnCutsceneFigureDespawnEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		--CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
	--		CutsceneFigureWeaponsShow {Tag = "norcaine_leader"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS02_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};