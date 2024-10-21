--***********************************************************
--*                                                         *
--*   Icewastes of Shalibar :: CutScene: Captain vs. Lich   *
--*                                                         *
--***********************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{

		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
	--	"'pl_HumanHeroFirst'",
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
		"'pl_HumanCompanionCraigHuman'",
	--	"'pl_HumanCompanionSariel'",

		"'undead_captain'",

	}
}

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "CS03B_INIT" ,
		Conditions =
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS03b_Start"},
			
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
			MapFlagIsTrue {Name = "mf_P709_CS03b_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,

			CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 270.132, Y = 237.211},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 270.132, Y = 237.211},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 86},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 270.123, Y = 239.82},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 270.123, Y = 239.82},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 68.8113},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 268.706, Y = 243.476},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 268.706, Y = 243.476},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 68.8113},
			
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 268.992, Y = 234.879},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 268.992, Y = 234.879},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 130.873},
						
			CutsceneFigureTeleport {Tag = "undead_captain", X = 273.748, Y = 237.112},
			CutsceneFigureTeleport {Tag = "undead_captain", X = 273.748, Y = 237.112},
			FigureLookAtDirection {Tag = "undead_captain", Direction = 290},



		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "P709_CUT_CS03_T001_CAPTAIN",
	},
};

--	P709_CUT_CS03_T001_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T001_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03b_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T001_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T002_AVATAR",
	},	
};

--	P709_CUT_CS03_T002_AVATAR

State
{
	StateName = "P709_CUT_CS03_T002_AVATAR",
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
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T002_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T003_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T003_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T003_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T003_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T004_CAINE",
	},	
};

--	P709_CUT_CS03_T004_CAINE

State
{
	StateName = "P709_CUT_CS03_T004_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T004_CAINE", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T005_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T005_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T005_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T005_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T006_ORCHERO",
	},	
};

--	P709_CUT_CS03_T006_ORCHERO

State
{
	StateName = "P709_CUT_CS03_T006_ORCHERO",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T006_ORCHERO", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T007_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T007_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T007_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T007_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T008_AVATAR",
	},	
};

--	P709_CUT_CS03_T008_AVATAR

State
{
	StateName = "P709_CUT_CS03_T008_AVATAR",
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
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T008_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T009_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T009_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T009_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T009_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T010_CRAIG",
	},	
};

--	P709_CUT_CS03_T010_CRAIG

State
{
	StateName = "P709_CUT_CS03_T010_CRAIG",
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
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T010_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T011_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T011_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T011_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T011_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T012_AVATAR",
	},	
};

--	P709_CUT_CS03_T012_AVATAR

State
{
	StateName = "P709_CUT_CS03_T012_AVATAR",
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
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T012_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T013_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T013_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T013_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T013_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T014_AVATAR",
	},	
};

--	P709_CUT_CS03_T014_AVATAR

State
{
	StateName = "P709_CUT_CS03_T014_AVATAR",
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
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T014_AVATAR", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T015_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T015_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T015_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T015_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T016_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T016_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T016_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T016_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T017_CAINE",
	},	
};

--	P709_CUT_CS03_T017_CAINE

State
{
	StateName = "P709_CUT_CS03_T017_CAINE",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T017_CAINE", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T018_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T018_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T018_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Captain", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T018_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T019_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T019_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T019_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS03b_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T019_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T020_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T020_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T020_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS03b_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T020_CAPTAIN", Tag = "undead_captain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "P709_CUT_CS03_T021_CAPTAIN",
	},	
};

--	P709_CUT_CS03_T021_CAPTAIN

State
{
	StateName = "P709_CUT_CS03_T021_CAPTAIN",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS03b_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay	{TextTag = "P709_CUT_CS03_T021_CAPTAIN", Tag = "undead_captain"},
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS03b_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};