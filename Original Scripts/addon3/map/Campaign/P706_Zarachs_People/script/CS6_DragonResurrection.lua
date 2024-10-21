local Pos_Avatar = "Pos_CS6_Avatar"; -- this position is also used in CS6_DragonResurrection_Take01.tak
local Pos_ResurrectedDragon = "Pos_ResurrectedDragon";

local ResurrectedDragon = "Surian"; -- the one that might be actually usable
--local ResurrectedDragon = "ResurrectedDragon"; -- the big one




local _tRenderList = CutsceneFigureRenderList{Tag = ftAvatar}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'"..ftDragon.."'",
		--"'pl_HumanHeroOrc'",
		"'Shaman'",
		"'pl_HumanHeroCaine'"
	}
}




State
{
	StateName = "INIT",
	
	OnOneTimeEvent 
	{
		EventName = ">>> DragonStatue dialog initiated the cutscene <<<",
		Conditions =
		{	
	--		MapFlagIsTrue{ Name = "mf_P706_MainInit_Ended" },
			MapFlagIsTrue	{Name = "mf_P706_Start_CS6_DragonResurrection"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_CSTimer"},
			
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
-- 			FigureAbilityAdd	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},
		},
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
	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Orc Hero is dead -> Respawning... <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroOrc", TargetTag = "pl_HumanHeroOrc_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanHeroOrc", Percent = 20},
--			
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
--		},	
--	},
--
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Orc Hero is alive <<<",
--		Conditions =
--		{
--			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
--		},
--		Actions =
--		{
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
--		},	
--	},
	
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
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
		},
		Actions =
		{
		},	
		GotoState = "TAKE00",
	},
};

State
{
	StateName = "TAKE00",
	
	OnOneTimeEvent
	{
		EventName = ">>> TAKE00: Timer due to DLG ended <<<",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 2}, 
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			_tRenderList,
			ObjectSpawnToEntity {ObjectId = 1102, TargetTag = ftHeroCaine, Direction = 0, Tag = "Pos_CS6_Startup_Caine"},
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			--CutsceneFigureWeaponsHide {Tag = ftCompCraig},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "TAKE01",
	},
};




State
{
	StateName = "TAKE01",
	
	OnOneTimeEvent
	{
		EventName = ">>> TAKE01: No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = Pos_Avatar},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = Pos_Avatar},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "DragonStatue"},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "DragonStatue"},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 508.469, Y = 333.686},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 508.469, Y = 333.686},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 102.12},
			
			CutsceneFigureTeleport {Tag = "Shaman", X = 505.202, Y = 342.937 },
			CutsceneFigureTeleport {Tag = "Shaman", X = 505.202, Y = 342.937 },
			FigureLookAtDirection {Tag = "Shaman", Direction = 79.2509},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS6_DragonResurrection_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			--CutsceneSay {TextTag = "CS6_DragonRes01", Tag = "Surian"},

			EntityTimerStart {Name = "et_CSTimer"},
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
			--CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes01", Tag = "pl_HumanAvatar"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes02", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "TAKE02",
	},	
};

State
{
	StateName = "TAKE02",
	
	OnOneTimeEvent
	{
		EventName = ">>> TAKE02: Timer Over <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
--			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			ObjectVanish {Tag = "DragonStatueObject"},

			FigureNpcSpawnToEntity {Tag = "Surian", Level = 9 , UnitId = 2222 , TargetTag = Pos_ResurrectedDragon, Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Surian", TargetTag = "pl_HumanAvatar"},

				
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS6_DragonResurrection_Take01", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},

			EntityTimerStart {Name = "et_CSTimer"},
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
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 4},
--			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes03", Tag = "Surian"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes04", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes05", Tag = "Surian"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes06", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes07", Tag = "Surian"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes08", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes09", Tag = "Surian"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes10", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes11", Tag = "Surian"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes12", Tag = "Surian"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes13", Tag = "Surian"},
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes14", Tag = "Shaman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes15", Tag = "Surian"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take17",
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes17", Tag = "Shaman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take18",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take18",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_18 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS6_DragonRes18", Tag = "pl_HumanHeroCaine"},
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
		EventName = ">>> FINISH: Timer Over <<<",
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			FigurePlayerTransfer	{Tag = "Surian", Player = "pl_Human"},
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},
			AvatarFlagSetTrue {Name = "af_DragonAdded"},
			AvatarFlagSetTrue {Name = "af_OnlyCloseDragonMount"},
			AvatarFlagSetTrue {Name = "af_DeadDragonIsGameOver"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = ftHeroCaine},
			--CutsceneFigureWeaponsShow {Tag = ftCompCraig},
			CutsceneFigureTeleport {Tag = "Shaman", X = 646.873, Y = 268.21 },
			CutsceneFigureTeleport {Tag = "Shaman", X = 646.873, Y = 268.21 },
			FigureLookAtDirection {Tag = "Shaman", Direction = 315},

			FigureTeleportToEntity {Tag = ftHeroCaine, TargetTag = "Pos_CS6_Startup_Caine"},		
			
-- 			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
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
			MapFlagSetTrue {Name = "mf_P706_CS6_DragonResurrection_Ended"},
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
	},
};