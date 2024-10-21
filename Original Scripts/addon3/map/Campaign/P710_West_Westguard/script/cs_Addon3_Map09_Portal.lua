-- CS_Portal

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
	--	"'pl_HumanHeroFirst'",
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanCompanionCraigHuman'",
		--"'Twiddle1'",
		--"'Twiddle2_Sesame'",
		--"'Twiddle3_Sesame'",
		--"'Twiddle4_Sesame'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		EventName = "Vanish",
		Conditions =
		{
		},
		Actions =
		{

			FigureVanish {Tag = "CS_Twiddle_Avatar"},
			FigureVanish {Tag = "CS_Twiddle_HeroFirst"},
			FigureVanish {Tag = "CS_Twiddle_HeroSecond"},
			FigureVanish {Tag = "CS_Twiddle_HeroThird"},
			FigureVanish {Tag = "CS_Twiddle_HeroCaine"},
			FigureVanish {Tag = "CS_Twiddle_HeroOrc"},
			FigureVanish {Tag = "CS_Twiddle_CompanionCraigHuman"},
			FigureVanish {Tag = "CS_Twiddle1"},
			FigureVanish {Tag = "CS_Twiddle3"},
			FigureVanish {Tag = "CS_Twiddle4"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P710_StartPortalCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},

			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "TWIDDLE_ANGRY", Level = 1, UnitId = 2095, X = 485, Y = 45, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "TWIDDLE_ANGRY", Direction = 216.761},
			CutsceneFigureWeaponsHide {Tag = "TWIDDLE_ANGRY"},
			
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485, Y = 50},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485, Y = 50},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "TWIDDLE_ANGRY"},
			FigureLookAtEntity {Tag = "pl_HumanAvatar", TargetTag = "TWIDDLE_ANGRY"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			
		--[[	FigureTeleport {Tag = "pl_HumanHeroFirst", X = 480, Y = 51},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 480, Y = 51},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroFirst", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 481, Y = 48},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 481, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroSecond", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
			
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 476, Y = 48},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 476, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "Twiddle2"},
			FigureLookAtEntity {Tag = "pl_HumanHeroThird", TargetTag = "Twiddle2"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},]]--
			
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 478, Y = 46},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 478, Y = 46},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "TWIDDLE_ANGRY"},
			FigureLookAtEntity {Tag = "pl_HumanHeroCaine", TargetTag = "TWIDDLE_ANGRY"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 478, Y = 50},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 478, Y = 50},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "TWIDDLE_ANGRY"},
			FigureLookAtEntity {Tag = "pl_HumanHeroOrc", TargetTag = "TWIDDLE_ANGRY"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 479, Y = 48},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 479, Y = 48},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "TWIDDLE_ANGRY"},
			FigureLookAtEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "TWIDDLE_ANGRY"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01_01",
	},
};

State
{
	StateName = "Cutscene01_01",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Twiddle_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_02",
	},	
};

State
{
	StateName = "Cutscene01_02",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			--EntityTimerStop {Name = "et_CStimer"},
			EffectStart	{Tag = "Portal", File = "Effect_Spawn_Gate"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "PortalCS01", Tag = "TWIDDLE_ANGRY"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PortalCS02", Tag = "TWIDDLE_ANGRY"},
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
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			FigureVanish {Tag = "TWIDDLE_ANGRY"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
		--	CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
		--	CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
		--	CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
		},
		GotoState = "Cutscene01_04",
	},	
};

State
{
	StateName = "Cutscene01_04",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartPortalCS_End"},
		},
	},
};