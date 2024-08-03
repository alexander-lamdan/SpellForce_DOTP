-- CS_Zazhut

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
	--	"'pl_HumanHeroFirst'",
	--	"'pl_HumanHeroSecond'",
	--	"'pl_HumanHeroThird'",
	--	"'pl_HumanHeroCaine'",
	--	"'pl_HumanHeroOrc'",
	--	"'pl_HumanCompanionCraigHuman'",
		"'Undead_Lich'",
		--"'Zazhut'",
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
			FigureVanish {Tag = "CS_Undeads_Avatar"},
			FigureVanish {Tag = "CS_Undeads_CompanionCraigHuman"},
			FigureVanish {Tag = "CS_Undeads_HeroOrc"},
			FigureVanish {Tag = "CS_Undeads_HeroCaine"},
			FigureVanish {Tag = "CS_Undeads_HeroFirst"},
			FigureVanish {Tag = "CS_Undeads_HeroSecond"},
			FigureVanish {Tag = "CS_Undeads_HeroThird"},
			FigureVanish {Tag = "CS_Undeads_Captain_pos1"},
			FigureVanish {Tag = "CS_Undeads_Captain_pos2"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P710_StartUndeadsCS"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
						
			FigureTeleport {Tag = "pl_HumanAvatar", X = 237, Y = 536},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 237, Y = 536},
			FigureDirectionSetToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Cemetery"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			
			
			FigureTeleport {Tag = "Undead_Lich", X = 218, Y = 549},
			FigureTeleport {Tag = "Undead_Lich", X = 218, Y = 549},
			FigureDirectionSetToEntity	{Tag = "Undead_Lich", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "Undead_Lich", TargetTag = "Cemetery"},
			
		--[[	FigureTeleport {Tag = "pl_HumanHeroFirst", X = 235, Y = 538},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 235, Y = 538},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Cemetery"},
			
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 237, Y = 539},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 237, Y = 539},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Cemetery"},
			
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 239, Y = 538},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 239, Y = 538},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Cemetery"},
			
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 238, Y = 542},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 238, Y = 542},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Cemetery"},
			
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 236, Y = 541},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 236, Y = 541},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Cemetery"},
			
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 240, Y = 540},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 240, Y = 540},
			FigureDirectionSetToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Cemetery"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Cemetery"},]]--

			CutsceneCombatOff	{},
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
			CameraTakeAddToTrack {File = "CS_Undeads_Take_01", Tag = "default", TargetTag = "default"},
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
			EntityTimerIsElapsed	{Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Outro_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			FigureRun {Tag = "Undead_Lich", X = 234, Y = 535},
			--EffectStart	{Tag = "Zazhut_Explosion_FX", File = "Effect_Firestorm_Impact"},
			--EffectStart	{Tag = "Zazhut", File = "Effect_Firestorm_Impact"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base
			
			--EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_03",
	},	
};

State
{
	StateName = "Cutscene01_03",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "Undead_Lich", Range = 1, X = 234, Y = 535},
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Outro_Take_01", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			FigureDirectionSetToEntity	{Tag = "Undead_Lich", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Undead_Lich"},
			--FigureDirectionSetToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Undead_Lich"},
			--FigureDirectionSetToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Undead_Lich"},
			--FigureDirectionSetToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Undead_Lich"},
			--FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Undead_Lich"},
			--FigureDirectionSetToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Undead_Lich"},
			--FigureDirectionSetToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Undead_Lich"},
			--EffectStart	{Tag = "Zazhut_Explosion_FX", File = "Effect_Firestorm_Impact"},
			--EffectStart	{Tag = "Zazhut", File = "Effect_Firestorm_Impact"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureRunToEntity	{Tag = "Zazhut", TargetTag = "CS_Zazhut_Ereon"},
			--FigureRunToEntity	{Tag = "CS_Zazhut_Ereon", TargetTag = "Zazhut"},
			--Effect_Firestorm_Impact base
			--Effect_Building_Fire base
			--Effect_Fireball_Impact base
			--Effect_Fireball_OverTime base
			
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UndeadsCS01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Captain02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UndeadsCS02", Tag = "Undead_Lich"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UndeadsCS03", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Captain02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "UndeadsCS04", Tag = "Undead_Lich"},
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
			--FigureTeleport {Tag = "pl_HumanAvatar", X = 380, Y = 635},
			--FigureTeleport {Tag = "Zazhut", X = 380, Y = 655},
			--FigureVanish {Tag = "CS_Zazhut_Kerona"},
			--FigureVanish {Tag = "CS_Zazhut_Sariel"},
			--FigureVanish {Tag = "CS_Zazhut_Orc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			--MapFlagSetTrue {Name = "mf_P710_StartIntroCS_End"},
		},
		GotoState = "Cutscene01_05",
	},	
};

State
{
	StateName = "Cutscene01_05",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartUndeadsCS_End"},
		},
	},
};