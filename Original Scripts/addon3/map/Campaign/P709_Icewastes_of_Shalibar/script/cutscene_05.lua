--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: CutScene: Ice Golem   *
--*                                                  *
--****************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "crystal_golem_1"}

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "CS05_INIT" ,
		Conditions =
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS05_Start"},
			
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
			MapFlagIsTrue {Name = "mf_P709_CS05_Start"},
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
		GotoState = "P709_CUT_CS05_T001_AVATAR",
	},
};

-- P709_CUT_CS05_T001_AVATAR

State
{
	StateName = "P709_CUT_CS05_T001_AVATAR",
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS05_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			CutsceneSay {TextTag = "P709_CUT_CS05_T001_AVATAR", Tag = "pl_HumanAvatar"},

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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS05_End"},
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};