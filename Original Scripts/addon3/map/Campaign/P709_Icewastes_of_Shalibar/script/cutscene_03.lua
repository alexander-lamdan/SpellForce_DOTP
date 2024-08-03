--**********************************************************************
--*                                                                    *
--*   Icewastes of Shalibar :: CutScene: War between undead warriors   *
--*                                                                    *
--**********************************************************************

-- there have to be initialized the actors, otherwise they will not be visible in the cutscene

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanHeroFirst'",
		"'pl_HumanHeroSecond'",
		"'pl_HumanHeroThird'",
		"'pl_HumanCompanionCraigHuman'",
		"'pl_HumanCompanionSariel'",

		"'cs03_undead_00'",
		"'cs03_undead_01'",
		"'cs03_undead_02'",
		"'cs03_undead_03'",
		"'cs03_undead_04'",
		"'cs03_undead_05'",
		"'cs03_undead_06'",
		"'cs03_undead_07'",
		"'cs03_undead_08'",
		"'cs03_undead_09'",
		"'cs03_undead_10'",
		
		"'undead_captain'",
		"'cs03_undead_ally_01'",
		"'cs03_undead_ally_02'",
		"'cs03_undead_ally_03'",
		"'cs03_undead_ally_04'",
		"'cs03_undead_ally_05'",
		"'cs03_undead_ally_06'",
		"'cs03_undead_ally_07'",
		"'cs03_undead_ally_08'",
		"'cs03_undead_ally_09'",
		"'cs03_undead_ally_10'",
		"'cs03_undead_ally_11'",
		"'cs03_undead_ally_12'",
		"'cs03_undead_ally_13'",
		"'cs03_undead_ally_14'",
		"'cs03_undead_ally_15'",
	}
}

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = "CS03_INIT" ,
		Conditions =
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS03_Start"},
			
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
			MapFlagIsTrue {Name = "mf_P709_CS03_Start"},

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

--  	CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},

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
	OnOneTimeEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		--CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
--		CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P709_CS03_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};