local Pos_ResurrectedDragon = "Pos_ResurrectedDragon";
local Boss2ShamanDistance = 20;
local BossHealthLimitToOutro = 33; -- in percents

--local _tRenderList = CutsceneFigureRenderList{Tag = "'Shaman'"}
--_tRenderList.tModFuncs = 
--{	
--	Add =
--	{
--	}
--}



local _tRenderList = CutsceneFigureRenderList{Tag = "BossWithBreathFire"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Shaman'",
		"'pl_HumanAvatar'",
		"'pl_HumanHeroOrc'",
		"'"..ftCompCraig.."'",
		"'Surian'",
		"'pl_HumanHeroCaine'",
		
	}
}



State
{
	StateName = "INIT",
	
	OnOneTimeEvent 
	{
--		OnOneTimeEvent 
--		{
--			EventName = ">>> FOR TEST <<<" ,
--			Conditions =
--			{
--				-- to avoid concurrency issues:
-- 				AvatarIsNotTalking	{},
-- 				MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
--			},
--			Actions =
--			{
--				ObjectVanish {Tag = "DragonStatueObject"},
--
--				FigureNpcSpawnToEntity {Tag = "Surian", Level = 9 , UnitId = 2222 , TargetTag = Pos_ResurrectedDragon, Team = "tm_Human"},
--				FigureLookAtEntity	{Tag = "Surian", TargetTag = "pl_HumanAvatar"},
--				FigurePlayerTransfer	{Tag = "Surian", Player = "pl_Human"},
--
--				PlayerHeroAdd { HeroId = 250 },
--				FigureHeroSpawnToEntity {Tag = "HeroOrc", TargetTag = "pl_HumanAvatar", Direction = 135},
--
--				AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},
--				AvatarFlagSetTrue {Name = "af_DragonAdded"},
--				AvatarFlagSetTrue {Name = "af_OnlyCloseDragonMount"},
--			},	
--		},

		EventName = ">>> Boss approached the Shaman <<<",
		Conditions =
		{	
			MapFlagIsTrue	{Name = "mf_P706_StartTheCSOutro"},

			-- to avoid concurrency issues:
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
		Actions =
		{
			
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

--			FigureStop	{Tag = "BossWithBreathFire"},
			FigureVanish	{Tag = "BossWithBreathFire"}, -- this is a workaround: without this the dragon would not be visible in the cs
			CutsceneCombatOff	{},
			
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = ftCompCraig},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
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
-- 			FigureAbilityAdd	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
-- 			FigureAbilityAdd	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CLEANUP",
	},
};
	
	
	
	
State
{
	StateName = "CLEANUP",
	
	OnOneTimeEvent 
	{
		EventName = ">>> Surian teleported away when unmounted <<<",
		Conditions =
		{	
			FigureIsAlive	{Tag = "Surian"},
		},
		Actions =
		{
			FigureTeleport	{Tag = "Surian", X = 1, Y = 1},			
			FigureTeleport	{Tag = "Surian", X = 1, Y = 1},			
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
--
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
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Craig is dead -> Respawning... <<<",
--		Conditions =
--		{
--			FigureIsDead	{Tag = "pl_HumanCompanionCraigHuman"},
--		},
--		Actions =
--		{
--			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionCraigHuman", TargetTag = "pl_HumanCompanionCraigHuman_DEAD", Direction = 0},
--			FigureHealthSet	{Tag = "pl_HumanCompanionCraigHuman", Percent = 20},
--			
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
--		},	
--	},
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> CS RESPAWNER: Craig is alive <<<",
--		Conditions =
--		{
--			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
--		},
--		Actions =
--		{
--			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
--		},	
--	},	
--	
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
--	
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
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
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
		EventName = ">>> Teleporting the Boss and Shaman to their place... <<<",
		Conditions =
		{
		},
		Actions =
		{
			-- this is a workaround: without this the dragon would not be visible in the cs:
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity {Tag = "NEMLESSZ", Level = 1 , UnitId = 2034 , TargetTag = Pos_ResurrectedDragon, Team = "tm_Neutral"}, },
--			FigureTeleportToEntity	{Tag = "BossWithBreathFire", TargetTag = "Pos_ResurrectedDragon"},
--			FigureTeleportToEntity	{Tag = "BossWithBreathFire", TargetTag = "Pos_ResurrectedDragon"},

			FigureLookAtEntity	{Tag = "NEMLESSZ", TargetTag = "Shaman"},

			--FigureTeleportToEntity	{Tag = "Shaman", TargetTag = "Pos_CS7_Outro_Shaman"},

			CutsceneFigureTeleport {Tag = "Shaman", X = 543.98, Y = 335.424 },
			CutsceneFigureTeleport {Tag = "Shaman", X = 543.98, Y = 335.424 },
			--FigureLookAtDirection {Tag = "Shaman", Direction = 0},
			FigureLookAtEntity	{Tag = "Shaman", TargetTag = "NEMLESSZ"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 543.988, Y = 332.448 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 543.988, Y = 332.448 },
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "NEMLESSZ"},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 545.373, Y = 343.134 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 545.373, Y = 343.134 },
			FigureLookAtEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "NEMLESSZ"},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 544.252, Y = 329.05 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 544.252, Y = 329.05 },
			FigureLookAtEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "NEMLESSZ"},
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 538.473, Y = 345.038 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 538.473, Y = 345.038 },
			FigureLookAtEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "NEMLESSZ"},
	
			CutsceneFigureTeleport {Tag = "Surian", X = 547.047, Y = 340.942 },
			CutsceneFigureTeleport {Tag = "Surian", X = 547.047, Y = 340.942 },
			FigureLookAtEntity	{Tag = "Surian", TargetTag = "NEMLESSZ"},

		
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "NEMLESSZ", Range = 30, Height = default},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS7_Outro_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro01", Tag = "Shaman"},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE02",
	},
};




State
{
	StateName = "TAKE02",
	
	OnOneTimeEvent
	{
		EventName = ">>> Vanishing the boss and spawning the statue... <<<",
		Conditions =
		{
			CutsceneSayIsDone {}
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = "NEMLESSZ", File = "Effect_Spawn_Unit"},

			CutsceneFigureTeleport {Tag = "NEMLESSZ", X = 707.155, Y = 710.55 },

		--			ObjectSpawn	{ObjectId = 2047, X = 525, Y = 336, Direction = 270, Tag = "NewDragonStatue"}, -- old gfx
			
			ObjectSpawn	{ObjectId = 2717, X = 525, Y = 336, Direction = 270, Tag = "NewDragonStatue"}, -- new gfx
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS7_Outro_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro02", Tag = "NEMLESSZ"},

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
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureVanish {Tag = "NEMLESSZ"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro03", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro04", Tag = "Shaman"},
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
			--Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro05", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro06", Tag = "Shaman"},
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
			CutsceneSay {TextTag = "CS7_Outro07", Tag = "pl_HumanAvatar"},
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
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro08", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro09", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro10", Tag = "Shaman"},
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
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro11", Tag = "pl_HumanHeroOrc"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro12", Tag = "pl_HumanAvatar"},
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
		-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro13", Tag = "pl_HumanHeroOrc"},
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
			CutsceneSay {TextTag = "CS7_Outro14", Tag = "Shaman"},
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
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro15", Tag = "pl_HumanHeroOrc"},
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
			CutsceneSay {TextTag = "CS7_Outro16", Tag = "pl_HumanAvatar"},
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
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro17", Tag = "pl_HumanHeroOrc"},
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
		-- Zarach
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro18", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take19",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take19",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_19 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		-- Zarach
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro19", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take20",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take20",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_20 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		-- Zarach
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro20", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take21",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take21",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_21 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
		-- Zarach
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro21", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take22",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take22",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_22 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take23",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take23",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_23 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro23", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take24",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take24",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_24 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro24", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take25",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take25",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_25 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro25", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take26",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take26",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_26 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro26", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take27",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take27",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_27 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro27", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take28",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take28",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_28 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
	--		Zarach
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro28", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take29",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take29",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_29 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro29", Tag = ftCompCraig},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take30",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take30",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_30 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro30", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take31",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take31",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_31 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro31", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take32",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take32",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_32 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro32", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take33",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take33",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_33 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro33", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take34",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take34",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_34 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro34", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take35",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take35",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_35 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro35", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take36",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take36",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_36 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro36", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take37",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take37",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_37 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro37", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take38",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take38",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_38 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro38", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take39",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take39",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_39 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro39", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take40",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take40",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_40 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro40", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take41",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take41",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_41 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro41", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take42",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take42",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_42 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- Zarach
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro42", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take43",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take43",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_43 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro43", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take44",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take44",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_44 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro44", Tag = "Surian"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take45",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take45",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_45 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Ereon_Cheat", Level = 1, UnitId = 2201, X = 1, Y = 1, Team = "tm_Neutral"},},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS7_Outro_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS7_Outro45", Tag = "CS_Ereon_Cheat"},
			EntityTimerStart {Name = "et_CStimer"},			
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroCaine", File = "Effect_Spawn_Unit"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroOrc", File = "Effect_Spawn_Unit"},
			EffectStartAtEntityPosition {Tag = "pl_HumanCompanionCraigHuman", File = "Effect_Spawn_Unit"},
			EffectStartAtEntityPosition {Tag = "Surian", File = "Effect_Spawn_Unit"},


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
			FigureVanish	{Tag = "CS_Ereon_Cheat"},
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
			EffectStop {Tag = "pl_HumanHeroOrc"},
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = ftCompCraig},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			
-- 			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
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
			FigureVanish	{Tag = "BossWithoutBreathFire"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_01"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_02"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_03"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_04"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_05"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_06"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_07"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_08"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_09"},
			FigureVanish	{Tag = "Spawned_NL_BossFighter_10"},
			MapFlagSetTrue	{Name = "mf_P706_WeatherChangeEnabled"},
		
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},

			MapValueSet {Name = "mv_P706_EndBossState", Value = EndBossState.Dead},

			MapFlagSetTrue	{Name = "mf_P706_CSOutroEnded"},
		},
	},
};