--******************************************************************
--*                                                                *
--*   Icewastes of Shalibar :: CutScene: Sailing between islands   *
--*                                                                *
--******************************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "CS04_INIT" ,
		Conditions =
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},

		},
		Actions =
		{
			
			MapFlagSetTrue {Name = "mf_P709_CS04_Playing"},
			
		},
	},

	-- the scene starts as soon as the cutscene start flag start is true
	-- can define the renderlist, hide weapons, can telepor the figures, etc.
	-- all of the cuts are in separated states
	
--	OnCutsceneFigureRespawnEvent
	OnEvent
	{
		Conditions =
		{	
			
			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			
		},
		Actions =
		{
			_tRenderList,

			CutsceneBegin{},

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
		
	},
};

-- 1st cut
State
{

	StateName = "Cutscene01",

-- Sailing to Main Island

	OnEvent
	{
		Conditions =
		{

			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},
			
			MapFlagIsTrue {Name = "mf_P709_CS04_MainIslandStart"},
		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS04_T001_AVATAR", Tag = "pl_HumanAvatar"},

			EntityTimerStart {Name = "et_CStimer"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_Start"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_MainIslandStart"},

		},
		GotoState = "CutsceneFINISH",
	},
	
-- Sailing to Wolf Spirit Island

	OnEvent
	{
		Conditions =
		{

			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},
			
			MapFlagIsTrue {Name = "mf_P709_CS04_WolfSpiritIslandStart"},
		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS04_T002_AVATAR", Tag = "pl_HumanAvatar"},

			EntityTimerStart {Name = "et_CStimer"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_Start"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_WolfSpiritIslandStart"},

		},
		GotoState = "CutsceneFINISH",
	},
	
-- Sailing to Lich Island

	OnEvent
	{
		Conditions =
		{

			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},
			
			MapFlagIsTrue {Name = "mf_P709_CS04_LichIslandStart"},
		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS04_T003_AVATAR", Tag = "pl_HumanAvatar"},

			EntityTimerStart {Name = "et_CStimer"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_Start"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_LichIslandStart"},

		},
		GotoState = "CutsceneFINISH",
	},
	
-- Sailing to Puzzle Island

	OnEvent
	{
		Conditions =
		{

			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},
			
			MapFlagIsTrue {Name = "mf_P709_CS04_PuzzleIslandStart"},
		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS04_T004_AVATAR", Tag = "pl_HumanAvatar"},

			EntityTimerStart {Name = "et_CStimer"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_Start"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_PuzzleIslandStart"},

		},
		GotoState = "CutsceneFINISH",
	},
	
-- Sailing to Prison Island
	
	OnEvent
	{
		Conditions =
		{

			MapFlagIsTrue {Name = "mf_P709_CS04_Start"},
			
			MapFlagIsTrue {Name = "mf_P709_CS04_PrisonIslandStart"},
		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "P709_CUT_CS04_T005_AVATAR", Tag = "pl_HumanAvatar"},

			EntityTimerStart {Name = "et_CStimer"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_Start"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_PrisonIslandStart"},

		},
		GotoState = "CutsceneFINISH",
	},

};

-- cutscene ends, cutscene end flag has to be set to true

State
{
	StateName = "CutsceneFINISH",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS04_End"},

			MapFlagSetFalse {Name = "mf_P709_CS04_Start"},

		},

		GotoState = "INIT",

	},	
};