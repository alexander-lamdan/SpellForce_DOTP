local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroOrc'",
		"'Surian'",
	}
}
--TODO MS5: add all heroes

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = ">>> CS_04_INIT <<<" ,
		Conditions =
		{
		},
		Actions =
		{
		},	
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent
	{
		EventName = ">>> CS_04_Respawn <<<" ,
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P707_CS_04_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			_tRenderList,
		 	CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 53.0909, Y = 186.809},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 53.0909, Y = 186.809},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 163.268},
			
		--[[	FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "CS04Place"},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "CS04Place"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},]]--

			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P707_CS_04_Started"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_Take01",	
	},
};

--- elso kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS01", Tag = "Surian"},
			EntityTimerStart	{Name = "et_CStimer"},
		},	
		GotoState = "CS_Take02",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take02",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_02 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take03",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take03",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_03 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 55.1728, Y = 190.652},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 55.1728, Y = 190.652},
			FigureDirectionSet {Tag = "pl_HumanHeroOrc", Direction = 329.426},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroOrc", File = "Effect_Spawn_Unit"},
			CutsceneSay {TextTag = "SecInvCS03", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
		},	
		GotoState = "CS_Take04",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take04",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_04 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take05",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take05",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_05 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS05", Tag = "pl_HumanHeroOrc"},
			EntityTimerStop {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take06",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take06",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_06 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_point.ska"},			
		},			
		GotoState = "CS_Take07",
	},		
};

--- kamera snitt
State
{
	StateName = "CS_Take07",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_07 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS07", Tag = "pl_HumanHeroOrc"},
			EntityTimerStop {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take08",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take08",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_08 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_point.ska"},			
		},			
		GotoState = "CS_Take09",
	},		
};

--- kamera snitt
State
{
	StateName = "CS_Take09",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_09 <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		CutsceneSayIsDone {},	
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_talk_listen.ska"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS09", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroOrc", File = "base/gfx/figures/npc/figure_npc_orc_champion_resolve.ska"},			
		},			
		GotoState = "SealOFF",
	},		
};

State
{
	StateName = "SealOFF",
	
	OnOneTimeEvent 
	{
		EventName = ">>> SealOFF <<<" ,
		Conditions =
		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = "GMH1", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "GMH1"},
			EffectStartAtEntityPosition {Tag = "GMH2", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "GMH2"},
			EffectStartAtEntityPosition {Tag = "GMH3", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "GMH3"},
			EffectStartAtEntityPosition {Tag = "GMH4", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "GMH4"},
			EffectStartAtEntityPosition {Tag = "GMH5", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "GMH5"},
			EffectStartAtEntityPosition {Tag = "GMH6", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "GMH6"},
			ObjectVanish {Tag = "GMH7"},
			ObjectVanish {Tag = "GMH8"},
			ObjectVanish {Tag = "GMH9"},
			EffectStartAtEntityPosition {Tag = "SecondSeal", File = "Effect_Spawn_Unit"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take10",
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take10",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_10 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
--		CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "SecInvCS10", Tag = "Surian"},
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

-- cutscene lezarasa, vege flag beallitasa
-- oriasi szopo: ha esc-et nyomsz, cutscene endkor idougras tortenik, szinte lehetetlen emiatt oda idoziteni, outcry is atugrodik, quest adas is.... ezerszer sirtam erte
State
{
	StateName = "CutsceneFINISH",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CS_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		--CutsceneSayIsDone {},	
		},
		Actions =
		{
			EffectStop {Tag = "pl_HumanHeroOrc"},
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P707_CS_04_Ended"},

		},	
		GotoState = "CutsceneEnd",
	},	
};


State
{
	StateName = "CutsceneEnd",
};




