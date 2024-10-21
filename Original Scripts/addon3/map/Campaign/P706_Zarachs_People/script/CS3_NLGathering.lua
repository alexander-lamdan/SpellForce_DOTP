local SecondsAfterAct1 = 20;

local _tRenderList = CutsceneFigureRenderList{Tag = "NLLeavingBoss"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'DuelPitGuard'",
		"'DuelPitGuard2'",
--		"'OrcEntryCaveGuardBoss'",
		"'NLStaying01'",
		"'NLStaying02'",
		"'NLStaying03'",
		"'NLStaying04'",
		"'NLStaying05'",
		"'NLStaying06'",
		"'NLStaying07'",
		"'NLStaying08'",
		"'NLStaying09'",
		"'NLStaying10'",
		"'NLStaying11'",
		"'NLStaying12'",
		
		"'NLLeaving01'",
		"'NLLeaving02'",
		"'NLLeaving03'",
		"'NLLeaving04'",
		"'NLLeaving05'",
		"'NLLeaving06'",
		"'NLLeaving07'",
		"'NLLeaving08'",
		"'NLLeaving09'",
		"'NLLeaving10'",
		"'NLLeaving11'",
		"'NLLeaving12'",
		"'NLLeaving13'",
		"'NLLeaving14'",
		"'NLLeaving15'",
		"'NLLeaving16'",
		"'NLLeaving17'",
		"'NLLeaving18'",
	}
}




State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> Act 1 solved and some time passed (timer used: mt_P706_tmp) <<<",
		Conditions =
		{	
			QuestIsSolved	{Player = "default", Quest = "ACT_1"},
			MapTimerIsElapsed	{Name = "mt_P706_Before_CS3_NLGathering", Seconds = SecondsAfterAct1},

			-- to avoid concurrency issues:
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			MapTimerStop	{Name = "mt_P706_Before_CS3_NLGathering"},

			FogOfWarReveal {FogOfWarId = default, X = 233 , Y = 570, Range = 40, Height = default},
			
			_tRenderList,
		  CutsceneBegin{},
		  
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
 			
 			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "HERO_RESPAWNER",
	},
};

State
{
	StateName = "HERO_RESPAWNER",
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Avatar is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanAvatar"},	
		},
		Actions =
		{
			AvatarSpawn	{Player = "pl_Human", X = 500, Y = 260, Direction = 270},
			FigureHealthSet	{Tag = "pl_HumanAvatar", Percent = 20},

			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
		},	
	},

	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Avatar is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
		},	
	},

	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Caine is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroCaine", TargetTag = "pl_HumanHeroCaine_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroCaine", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
		},	
	},

	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Caine is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
		},	
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Craig is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanCompanionCraigHuman"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionCraigHuman", TargetTag = "pl_HumanCompanionCraigHuman_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanCompanionCraigHuman", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
		},	
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Craig is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
		},	
	},	
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Orc Hero is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroOrc", TargetTag = "pl_HumanHeroOrc_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroOrc", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
		},	
	},

	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Orc Hero is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
		},	
	},
	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Sariel is dead -> Respawning... <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanCompanionSariel"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionSariel", TargetTag = "pl_HumanCompanionSariel_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanCompanionSariel", Percent = 20},
--			
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
--		},	
--	},	
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Sariel is alive <<<",
--		Conditions =
--		{
--			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
--		},
--		Actions =
--		{
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
--		},	
--	},
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Hero1 is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroFirst"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroFirst", TargetTag = "pl_HumanHeroFirst_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroFirst", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
		},	
	},

	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Hero1 is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
		},	
	},
		
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Hero2 is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroSecond"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroSecond", TargetTag = "pl_HumanHeroSecond_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroSecond", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
		},	
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Hero2 is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
		},	
	},
	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Hero3 is dead -> Respawning... <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanHeroThird"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroThird", TargetTag = "pl_HumanHeroThird_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanHeroThird", Percent = 20},
--			
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
--		},
--	},
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Hero3 is alive <<<",
--		Conditions =
--		{
--			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
--		},
--		Actions =
--		{
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
--		},	
--	},
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER done. Switching to the next state... <<<",
		Conditions =
		{
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
		},
		Actions =
		{
		},	
		GotoState = "TAKE01",
	},
};

State
{
	StateName = "TAKE01",
	
	OnOneTimeEvent
	{
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS3_NLGathering_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering01", Tag = "OrcEntryCaveGuardBoss"},
			EntityTimerStart {Name = "et_CSTimer"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering02", Tag = ftHeroCaine},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering03", Tag = ftCompCraig},
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
			CameraTakeAddToTrack {File = "CS3_NLGathering_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering04", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS3_NLGathering_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering05", Tag = ftHeroOrc},
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
			CameraTakeAddToTrack {File = "CS3_NLGathering_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering06", Tag = ftHeroCaine},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take08",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take08",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_08 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering08", Tag = ftHeroCaine},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take09",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take09",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_09 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS3_NLGathering09", Tag = "pl_HumanAvatar"},
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
			FadeInEffectStart{},
			
 			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},
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
			MapFlagSetTrue {Name = "mf_P706_CS3_NLGathering_Ended"},
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},

			FigureRoamingDisable	{Tag = "NLLeavingBoss"},
		},
	},
};