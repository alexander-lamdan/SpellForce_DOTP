local _tRenderList = CutsceneFigureRenderList{ Tag = ftAvatar }
_tRenderList.tModFuncs =
{
	Add =
	{
		"'"..ftHeroCaine.."'",
	--	"'"..ftHero1.."'",
	--	"'"..ftHero2.."'",
		"'"..ftCompCraig.."'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> FigureRespawn when mf_P706_MainInit_Ended <<<",
		Conditions =
		{	
			--MapFlagIsTrue{ Name = "mf_P706_MainInit_EndedNOT" },
			MapFlagIsTrue{ Name = "mf_P706_MainInit_Ended" },
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = ftCompCraig},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_SPAWN",
	},
};

-- kamera snitt
State
{
	StateName = "CS_SPAWN",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS1_Intro_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 48.9356, Y = 55.8604},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 48.9356, Y = 55.8604},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 90},
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			FigureAnimPlayOnce {Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_wave.ska"},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 51.8815, Y = 53.9102},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 51.8815, Y = 53.9102},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 231.06},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroCaine", File = "Effect_Spawn_Unit"},
	--		FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_female_emote_wave.ska"},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 51.8524, Y = 57.6076},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 51.8524, Y = 57.6076},
			FigureDirectionSet {Tag = "pl_HumanCompanionCraigHuman", Direction = 299.815},
			EffectStartAtEntityPosition {Tag = "pl_HumanCompanionCraigHuman", File = "Effect_Spawn_Unit"},
	--		FigureAnimPlayOnce {Tag = "pl_HumanCompanionCraigHuman", File = "base/gfx/figures/hero/figure_hero_female_emote_wave.ska"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take01",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take01",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_beg.ska"},
			CutsceneSay {TextTag = "CS1_Intro01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take02",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take02",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_02 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = ftHeroCaine, File = "base/gfx/figures/hero/figure_hero_male_emote_yes.ska"},
			CutsceneSay {TextTag = "CS1_Intro02", Tag = ftHeroCaine},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take03",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take03",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_03 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = ftCompCraig, File = "base/gfx/figures/hero/figure_hero_male_emote_point.ska"},
			CutsceneSay {TextTag = "CS1_Intro03", Tag = ftCompCraig},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take04",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take04",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_04 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = ftHeroCaine, File = "base/gfx/figures/hero/figure_hero_male_emote_taunt.ska"},
			CutsceneSay {TextTag = "CS1_Intro04", Tag = ftHeroCaine},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take05",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take05",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_05 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS1_Intro_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take06",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take06",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_06 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro06", Tag = ftCompCraig},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take07",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take07",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_07 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS1_Intro07", Tag = "pl_HumanAvatar"},
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

State
{
	StateName = "CutsceneFINISH",
	
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
			CutsceneFigureWeaponsShow {Tag = ftHeroCaine},
			CutsceneFigureWeaponsShow {Tag = ftCompCraig},
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
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},

			MapTimerStart	{Name = "mt_P706_CS1_Intro_Ended"},
		},
	},
};