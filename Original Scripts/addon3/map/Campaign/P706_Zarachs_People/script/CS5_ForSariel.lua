local _tRenderList = CutsceneFigureRenderList{Tag = ftAvatar}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'NLLeavingBoss'",
		
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
		EventName = ">>> mt_P706_MQ063_TAKEOVER_Completed elapsed <<<",
		Conditions =
		{	
			MapTimerIsElapsed	{Name = "mt_P706_MQ063_TAKEOVER_Completed", Seconds = 30},

			-- to avoid concurrency issues:
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			MapTimerStop	{Name = "mt_P706_MQ063_TAKEOVER_Completed"},

			_tRenderList,
			ObjectSpawnToEntity {ObjectId = 1102, TargetTag = ftAvatar, Direction = 0, Tag = "AvatarPOZ"},
			ObjectSpawnToEntity {ObjectId = 1102, TargetTag = ftHeroCaine, Direction = 0, Tag = "CainePOZ"},

			CutsceneFigureTeleport {Tag = ftAvatar, X = 215.595, Y = 481.127 },
			FigureLookAtDirection {Tag = ftAvatar, Direction = 244.445},

			CutsceneFigureTeleport {Tag = ftHeroCaine, X = 219.77, Y = 482.632 },
			FigureLookAtDirection {Tag = ftHeroCaine, Direction = 250.175},

			CutsceneFigureTeleport {Tag = "NLLeavingBoss", X = 200.727, Y = 489.844 },
			CutsceneFigureTeleport {Tag = "NLLeavingBoss", X = 200.727, Y = 489.844 },
			FigureLookAtDirection {Tag = "NLLeavingBoss", Direction = 65.8654},

			CutsceneFigureTeleport {Tag = "NLLeaving01", X = 195.727, Y = 486.844 },
			CutsceneFigureTeleport {Tag = "NLLeaving01", X = 195.727, Y = 486.844 },
			FigureLookAtDirection {Tag = "NLLeaving01", Direction = 67.7918},

			CutsceneFigureTeleport {Tag = "NLLeaving02", X = 202.314, Y = 493.874 },
			CutsceneFigureTeleport {Tag = "NLLeaving02", X = 202.314, Y = 493.874 },
			FigureLookAtDirection {Tag = "NLLeaving02", Direction = 38.1807},
			FigureLookAtDirection {Tag = "NLLeaving02", Direction = 38.1807},

			CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = "NLLeavingBoss"},
			
			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
 			AvatarFlagSetFalse	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
 			
-- 			FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},	
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "HERO_RESPAWNER",
	},
};

State
{
	StateName = "HERO_RESPAWNER",

--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Avatar is dead -> Respawning... <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanAvatar"},	
--		},
--		Actions =
--		{
--			AvatarSpawn	{Player = "pl_Human", X = 214.896, Y = 381.659, Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanAvatar", Percent = 20},
--
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
--		},	
--	},
--
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Avatar is alive <<<",
--		Conditions =
--		{
--			FigureIsAlive	{Tag = "pl_HumanAvatar"},
--		},
--		Actions =
--		{
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
--		},	
--	},

--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Caine is dead -> Respawning... <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroCaine", TargetTag = "pl_HumanHeroCaine_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanHeroCaine", Percent = 20},
--			
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
--		},	
--	},
--
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Caine is alive <<<",
--		Conditions =
--		{
--			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
--		},
--		Actions =
--		{
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
--		},	
--	},
	
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
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
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
			EffectStartAtEntityPosition {Tag = "NLLeavingBoss", File = "Effect_Spawn_Unit"},
			EffectStartAtEntityPosition {Tag = "NLLeaving01", File = "Effect_Spawn_Unit"},
			EffectStartAtEntityPosition {Tag = "NLLeaving02", File = "Effect_Spawn_Unit"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS5_ForSariel_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "NLLeavingBoss", X = 205.727, Y = 486.844}, 
			FigureSimpleWalk {Tag = "NLLeaving01", X = 202.727, Y = 485.844}, 
			FigureSimpleWalk {Tag = "NLLeaving02", X = 205.194, Y = 489.986}, 
			
		 -- FigureVanish	{Tag = "NLLeavingBoss"},

		 -- FigureVanish	{Tag = "NLLeaving01"},
		 -- FigureVanish	{Tag = "NLLeaving02"},
		  FigureVanish	{Tag = "NLLeaving03"},
		  FigureVanish	{Tag = "NLLeaving04"},
		  FigureVanish	{Tag = "NLLeaving05"},
		  FigureVanish	{Tag = "NLLeaving06"},
		  FigureVanish	{Tag = "NLLeaving07"},
		  FigureVanish	{Tag = "NLLeaving08"},
		  FigureVanish	{Tag = "NLLeaving09"},
		  FigureVanish	{Tag = "NLLeaving10"},
		  FigureVanish	{Tag = "NLLeaving11"},
		  FigureVanish	{Tag = "NLLeaving12"},
		  FigureVanish	{Tag = "NLLeaving13"},
		  FigureVanish	{Tag = "NLLeaving14"},
		  FigureVanish	{Tag = "NLLeaving15"},
		  FigureVanish	{Tag = "NLLeaving16"},
		  FigureVanish	{Tag = "NLLeaving17"},
		  FigureVanish	{Tag = "NLLeaving18"},		

		  EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS_Take_01D",
	},
};

-- kamera snitt
State
{
	StateName = "CS_Take_01D",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01D <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CS5_ForSariel01", Tag = "NLLeavingBoss"},
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
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_point.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel02", Tag = "pl_HumanHeroCaine"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel03", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Soulbender", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "NLLeaving01", File = "addon2/gfx/figures/demonic/figure_demonic_npc_chosen_Idlewar.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel04", Tag = "NLLeavingBoss"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel05", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Soulbender", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "NLLeaving02", File = "addon2/gfx/figures/demonic/figure_demonic_npc_chosen_Rage.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel06", Tag = "NLLeavingBoss"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = ftHeroCaine, File = "base/gfx/figures/hero/figure_hero_male_emote_taunt.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel07", Tag = "pl_HumanHeroCaine"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Soulbender", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_ForSariel08", Tag = "NLLeavingBoss"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take10",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take10",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_10 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Soulbender", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_ForSariel10", Tag = "NLLeavingBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take11",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take11",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_11 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			FigureAnimPlayOnce {Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_no.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel11", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take12",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take12",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_12 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_ForSariel12", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take13",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take13",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_13 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_listen.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel13", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take14",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take14",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_14 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_ForSariel14", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take15",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take15",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_15 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Soulbender", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5_ForSariel15", Tag = "NLLeavingBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take16",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take16",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_16 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "NLLeaving01", File = "addon2/gfx/figures/demonic/figure_demonic_npc_chosen_Rage.ska"},
			FigureAnimPlayOnce {Tag = "NLLeaving02", File = "addon2/gfx/figures/demonic/figure_demonic_npc_chosen_Rage.ska"},
			CutsceneSay {TextTag = "CS5_ForSariel16", Tag = "NLLeavingBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "SHUTDOWN",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take17",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_17 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS5_ForSariel_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStartAtEntityPosition {Tag = "NLLeaving01", File = "Effect_Spawn_Unit"},
			FigureVanish	{Tag = "NLLeaving01"},
			EffectStartAtEntityPosition {Tag = "NLLeaving02", File = "Effect_Spawn_Unit"},
			FigureVanish	{Tag = "NLLeaving02"},
			FigureAbilityRemove	{Tag = "NLLeavingBoss", AbilityId = 94}, -- Immortal
			EffectStartAtEntityPosition {Tag = "NLLeavingBoss", File = "Effect_Spawn_Unit"},
			FigureVanish	{Tag = "NLLeavingBoss"},
			CutsceneFigureWeaponsShow {Tag = ftHeroCaine},
			FigureForcedRun {Tag = ftHeroCaine, X = 205.194, Y = 489.986},
			-- eltûnõ NAMELESS-ek world kamerával
			-- káin odarohanhat esetleg a közelükbe miközben õk eltûnnek
			CutsceneSay {TextTag = "CS5_ForSariel17", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "SHUTDOWN2",
	},	
};


State
{
	StateName = "SHUTDOWN2",
	
	OnOneTimeEvent 
	{
		EventName = ">>> SHUTDOWN2 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSTimer"},			
		},	
		GotoState = "FINISH",
	},	
};

State
{
	StateName = "FINISH",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},		

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "AvatarPOZ"},
			FigureTeleportToEntity {Tag = ftHeroCaine, TargetTag = "CainePOZ"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
	--		CutsceneFigureWeaponsShow {Tag = "NLLeavingBoss"},
	
-- 			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
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
			MapFlagSetTrue {Name = "mf_P706_CS5_ForSariel_Ended"},
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
	},
};