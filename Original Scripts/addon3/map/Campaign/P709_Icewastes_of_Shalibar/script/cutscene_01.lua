--**************************************************
--*                                                *
--*   Icewastes of Shalibar :: Prologue CutScene   *
--*                                                *
--**************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'norcaine_leader'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanCompanionCraigHuman'",
		"'pl_HumanCompanionSariel'",
		"'norcaine_guard_1'",
		"'norcaine_guard_2'",
		"'norcaine_guard_3'",
		"'norcaine_guard_4'",
		"'norcaine_guard_5'",
		"'norcaine_guard_6'",
		"'norcaine_guard_7'",
		"'norcaine_guard_8'",
		"'wolfpack_0101'",
		"'wolfpack_0102'",
		"'wolfpack_0103'",
		"'wolfpack_0104'",
		"'wolfpack_0105'",
		"'wolfpack_0106'",
		"'wolfpack_0107'",
		"'wolfpack_0108'",
		"'wolfpack_0109'",
		"'wolfpack_0110'",
		"'Surian'",
		
	}
}

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "CS01_INIT" ,
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
			MapFlagIsTrue {Name = "mf_P709_CS01_Start"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "P709_CUT_CS01_T001_AVATAR",
	},
};

--	P709_CUT_CS01_T001_AVATAR

State
{
	StateName = "P709_CUT_CS01_T001_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS01_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T001_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T002_JORBAL",
	},	
};

--	P709_CUT_CS01_T002_JORBAL

State
{
	StateName = "P709_CUT_CS01_T002_JORBAL",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS01_Take_01", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
  		CutsceneSay {TextTag = "P709_CUT_CS01_T002_JORBAL", Tag = "surian"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T003_AVATAR",
	},	
};

--	P709_CUT_CS01_T003_AVATAR

State
{
	StateName = "P709_CUT_CS01_T003_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS01_Take_01", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
  		CutsceneSay {TextTag = "P709_CUT_CS01_T003_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T004_JORBAL",
	},	
};

-- P709_CUT_CS01_T004_JORBAL

State
{
	StateName = "P709_CUT_CS01_T004_JORBAL",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS01_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T004_JORBAL", Tag = "surian"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T005_AVATAR",
	},	
};

--	P709_CUT_CS01_T005_AVATAR

State
{
	StateName = "P709_CUT_CS01_T005_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS01_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T005_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T006_SARIEL",
	},	
};

--	P709_CUT_CS01_T006_SARIEL

State
{
	StateName = "P709_CUT_CS01_T006_SARIEL",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS01_Take_01", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T006_SARIEL", Tag = "pl_HumanCompanionSariel"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 32.517, Y = 25.0765 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 32.517, Y = 25.0765 },
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 171.887},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 35.0593, Y = 25.1768 },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 171.887},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T007_CAINE",
	},	
};

--	P709_CUT_CS01_T007_CAINE

State
{
	StateName = "P709_CUT_CS01_T007_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_Caine02", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T007_CAINE", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T008_CRAIG",
	},	
};

--	P709_CUT_CS01_T008_CRAIG

State
{
	StateName = "P709_CUT_CS01_T008_CRAIG",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_Craig03", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T008_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "P709_CUT_CS01_T009_AVATAR",
	},	
};

--	P709_CUT_CS01_T009_AVATAR

State
{
	StateName = "P709_CUT_CS01_T009_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS01_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS01_T009_AVATAR", Tag = "pl_HumanAvatar"},
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS01_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};