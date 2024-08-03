local ftTwiddle2 = "Twiddle2";
local ftTwiddle3 = "Twiddle3";

local posTwiddleTeleport = "pos_TwiddleTeleport";
local posTwiddle2 = "pos_Twiddle2";
local posTwiddle3 = "pos_Twiddle3";
local idTwiddle3 = 2094;
local posAvatar = "pos_TwiddleAvatar";


local _tRenderList = CutsceneFigureRenderList{ Tag = ftAvatar }
_tRenderList.tModFuncs =
{
	Add =
	{
		"'"..ftHeroCaine.."'",
	--	"'"..ftHeroOrc.."'",
	--	"'"..ftHero1.."'",
	--	"'"..ftHero2.."'",
		"'"..ftCompCraig.."'",
		"'"..ftTwiddle2.."'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> mv_P706_Progress_Twiddle == Branch08_Progress.BEFORE_CS -> starting the CS... <<<",
		Conditions = 
		{
	--		MapFlagIsTrue{ Name = "mf_P706_MainInit_Ended" },
			MapValueIsEqual	{Name = "mv_P706_Progress_Twiddle", Value = Branch08_Progress.CS_RUNNING},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{			
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			FigureStop	{Tag = ftAvatar},
			FigureStop	{Tag = ftHeroCaine},
		--	FigureStop	{Tag = ftHero1},
		--	FigureStop	{Tag = ftHero2},
			FigureStop	{Tag = ftCompCraig},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 34.0267, Y = 621.483},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 34.0267, Y = 621.483},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 188.113},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 35.9769, Y = 622.518},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 35.9769, Y = 622.518},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 215.798},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 30.7836, Y = 620.956},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 30.7836, Y = 620.956},
			FigureDirectionSet {Tag = "pl_HumanCompanionCraigHuman", Direction = 160.379},
			
		--	FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = posAvatar},
		--	FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = posAvatar},
		--	FigureLookAtEntity	{Tag = ftAvatar, TargetTag = posTwiddle2},
			
		--	FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = posAvatar},
		--	FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = posAvatar},
		--	FigureLookAtEntity	{Tag = ftHeroCaine, TargetTag = posTwiddle2},

		--	FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = posAvatar},
		--	FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = posAvatar},
		--	FigureLookAtEntity	{Tag = ftHeroOrc, TargetTag = posTwiddle2},

		--	FigureTeleportToEntity	{Tag = ftHero1, TargetTag = posAvatar},
		--	FigureTeleportToEntity	{Tag = ftHero1, TargetTag = posAvatar},
		--	FigureLookAtEntity	{Tag = ftHero1, TargetTag = posTwiddle2},

		--	FigureTeleportToEntity	{Tag = ftHero2, TargetTag = posAvatar},
		--	FigureTeleportToEntity	{Tag = ftHero2, TargetTag = posAvatar},
		--	FigureLookAtEntity	{Tag = ftHero2, TargetTag = posTwiddle2},

		--	FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = posAvatar},
		--	FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = posAvatar},
		--	FigureLookAtEntity	{Tag = ftCompCraig, TargetTag = posTwiddle2},

			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = ftCompCraig},
			CutsceneFigureWeaponsHide {Tag = ftTwiddle2},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS5a_Twiddle_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

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
 			FigureAbilityAdd	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
 			FigureAbilityAdd	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},

			EntityTimerStart {Name = "et_CSTimer"},
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
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Sariel is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanCompanionSariel"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionSariel", TargetTag = "pl_HumanCompanionSariel_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanCompanionSariel", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
		},	
	},	
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Sariel is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
		},	
	},
	
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
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Hero3 is dead -> Respawning... <<<",
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanHeroThird"},
		},
		Actions =
		{
			FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroThird", TargetTag = "pl_HumanHeroThird_DEAD", Direction = 0},
			FigureHealthSet	{Tag = "pl_HumanHeroThird", Percent = 20},
			
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER: Hero3 is alive <<<",
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
		},	
	},

	OnOneTimeEvent
	{
		EventName = ">>> CS RESPAWNER done. Switching to the next state... <<<",
		Conditions =
		{
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_AvatarIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CaineIsDone"},
--			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_CraigIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_OrcIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_SarielIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroFirstIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroSecondIsDone"},
			AvatarFlagIsTrue	{Player = "pl_Human", Name = "af_CS_HeroRespawner_HeroThirdIsDone"},
		},
		Actions =
		{
		},	
		GotoState = "TAKE01",
	},
};

State ------------------------------------------------------------------------------------------ Twiddle 2 freed
{
	StateName = "TAKE01",
	
	OnOneTimeEvent
	{
		EventName = ">>> et_CSTimer > 3 sec    Set Twiddle 2 free... <<<",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_CSTimer", Seconds = 2},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftTwiddle2, TargetTag = posTwiddle2},
			FigureTeleportToEntity	{Tag = ftTwiddle2, TargetTag = posTwiddle2},
			FigureLookAtEntity	{Tag = ftTwiddle2, TargetTag = posAvatar},
			
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
			EntityTimerIsElapsed	{Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Twiddle2", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_down.ska"},
			CutsceneSay {TextTag = "CS5a_Twiddle01", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle03", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle04", Tag = ftCompCraig},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle05", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle06", Tag = ftHeroCaine},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle07", Tag = "Twiddle2"},
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
			CutsceneSay {TextTag = "CS5a_Twiddle08", Tag = "Twiddle2"},
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
			CutsceneSay {TextTag = "CS5a_Twiddle09", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle10", Tag = "Twiddle2"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle11", Tag = "Twiddle2"},
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
			CutsceneSay {TextTag = "CS5a_Twiddle12", Tag = "Twiddle2"},
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
			CutsceneSay {TextTag = "CS5a_Twiddle13", Tag = "Twiddle2"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle14", Tag = "Twiddle2"},
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
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle15", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle16", Tag = ftHeroCaine},
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
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle17", Tag = "Twiddle2"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle18", Tag = ftCompCraig},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle19", Tag = "Twiddle2"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle20", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Twiddle2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle21", Tag = "Twiddle2"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "TAKE03",
	},	
};

--State ------------------------------------------------------------------------------------------ Time-gate opens 
--{
--	StateName = "TAKE02",
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> et_CSTimer > 3 sec    Opening the teleport... <<<",
--		Conditions =
--		{
--			EntityTimerIsElapsed	{Name = "et_CSTimer", Seconds = 3},
--		},
--		Actions =
--		{
--			EffectStartAtEntityPosition {Tag = posTwiddleTeleport, File = "Effect_Spawn_Unit"},
--			
--			EntityTimerStart {Name = "et_CSTimer"},		
--		},	
--		GotoState = "TAKE03",
--	},
--};



State ------------------------------------------------------------------------------------------ Twiddle 3 enters
{
	StateName = "TAKE03",
	
	OnOneTimeEvent
	{
		EventName = ">>> et_CSTimer > 3 sec    Twiddle 3 is entering... <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed	{Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS5a_Twiddle_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureNpcSpawnToEntity	{Tag = ftTwiddle3, Level = 25, UnitId = idTwiddle3, TargetTag = posTwiddleTeleport, Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = ftTwiddle3, TargetTag = posAvatar},
			FigureForcedWalkToEntity	{Tag = ftTwiddle3, TargetTag = posTwiddle3},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS_Take22",
	},
};


State ------------------------------------------------------------------------------------------ Temp text
{
	StateName = "CS_Take22",
	
	OnOneTimeEvent
	{
		EventName = ">>> et_CSTimer > 5 sec    Temp texts... <<<",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_CSTimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle22", Tag = ftAvatar},
			
			EntityTimerStart {Name = "et_CSTimer"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle23", Tag = ftCompCraig},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle24", Tag = ftHeroCaine},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS5a_Twiddle_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle25", Tag = "Twiddle3"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "TAKE05",
	},	
};



State ------------------------------------------------------------------------------------------ Twiddles disappear
{
	StateName = "TAKE05",
	
	OnOneTimeEvent
	{
		EventName = ">>> Twiddles disappear... <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = ftTwiddle2, File = "Effect_DeSpawn_Unit"},
			FigureVanish	{Tag = ftTwiddle2},
			
			EffectStartAtEntityPosition {Tag = ftTwiddle3, File = "Effect_DeSpawn_Unit"},
			FigureVanish	{Tag = ftTwiddle3},
			
			EntityTimerStart {Name = "et_CSTimer"},
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
			EntityTimerIsElapsed	{Name = "et_CSTimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle26", Tag = ftHeroCaine},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS5a_Twiddle27", Tag = ftAvatar},
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
			--CutsceneSayIsDone {},	
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = ftHeroCaine},
			CutsceneFigureWeaponsShow {Tag = ftCompCraig},
			
-- 			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal},
-- 			FigureAbilityRemove	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroOrc", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanCompanionSariel", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroFirst", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroSecond", AbilityId = Ability.Immortal},
 			FigureAbilityRemove	{Tag = "pl_HumanHeroThird", AbilityId = Ability.Immortal},
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

			MapValueSet	{Name = "mv_P706_Progress_Twiddle", Value = Branch08_Progress.CS_ENDED},
		},
	},
};
