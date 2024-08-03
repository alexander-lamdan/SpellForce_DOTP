--************************************************************
--**
--**		Drakkar  :: Start CutScene
--**
--************************************************************
-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
			
		--	"'pl_HumanAvatar'",
			"'AvatarSpirit'",
			"'CraigSpirit'",
			"'Kelar'",
			"'Noradim'",
		--	"'Shaperconqueress'",
			"'SoulCarrier'",
			"'Lich'",

			
	}
}

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = "CS06_INIT" ,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MQ6_CS06_VictoryAfterParley_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene062Init"},
			MapFlagSetFalse {Name = "mf_MQ6_CS06_VictoryAfterParley_Start"},
				FigureTeamTransfer	{Tag = "Lich", Team = "tm_Neutral"},
			CutsceneFigureTeleport	{Tag = "AvatarSpirit", X = 1, Y = 1},
			CutsceneFigureTeleport	{Tag = "AvatarSpirit", X = 1, Y = 1},
--			FigureRespawn	{Tag = "Noradim", X = 130.168, Y = 553.088, },
--			FigureDirectionSet	{Tag = "Noradim", Direction = 245},
		--	CutsceneFigureTeleport	{Tag = "Kelar", X = 120.358, Y = 553.176,  },
		--	CutsceneFigureTeleport	{Tag = "Kelar", X = 120.358, Y = 553.176,  },
		--	FigureDirectionSet	{Tag = "Kelar", Direction = 245},
			CutsceneFigureTeleport {Tag = "Lich", X = 118.381, Y = 549.028},
			CutsceneFigureTeleport {Tag = "Lich", X = 118.381, Y = 549.028},
			FigureDirectionSet {Tag = "Lich", Direction = 308.434},
			FigureRespawn	{Tag = "Noradim", X = 130.386, Y = 549.349, },
			FigureDirectionSet	{Tag = "Noradim", Direction = 232.986},
			FigureRespawn	{Tag = "SoulCarrier", X = 118.09, Y = 537.453, },
			FigureDirectionSet	{Tag = "SoulCarrier", Direction = 109},
			FigureRespawn	{Tag = "Kelar", X = 120.358, Y = 553.176,  },
			CutsceneFigureTeleport {Tag = "Kelar", X = 129.066, Y = 538.126},
			CutsceneFigureTeleport {Tag = "Kelar", X = 129.066, Y = 538.126},
			FigureDirectionSet {Tag = "Kelar", Direction = 222.49},
			FigureRespawn	{Tag = "CraigSpirit",X = 124.023, Y = 544.136},
			FigureDirectionSet {Tag = "CraigSpirit", Direction = 245.409},
			
			--EffectStartAtEntityPosition {Tag = "AvatarSpirit", File = "Effect_Peace_Overtime"},
			
			--FigureDirectionSet {Tag = "AvatarSpirit", Direction = 308.434},

	
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 400, Y = 300},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 400, Y = 300},
		},
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_Cutscene062Init"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "CutsceneFigureRespawn"},
			_tRenderList,
		  CutsceneBegin{},
		  CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
		  CutsceneFigureWeaponsHide {Tag = "AvatarSpirit"},
		  CutsceneFigureWeaponsHide {Tag = "CraigSpirit"},

			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene06",	
	},
};

--- elso kamera snitt
State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Cutscene062Init"},
		},
		Actions =
		{
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS06_Take_02", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			--CutsceneSay {TextTag = "StartCS01", Tag = "pl_HumanAvatar"},
	--		EntityTimerStart {Name = "et_CStimer"},
			
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
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
--			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_LichOutro", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS01", Tag = "Lich"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_TakeTransform",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_TakeTransform",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_TakeTransform <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 113.34, Y = 546.645},
			CutsceneFigureTeleport	{Tag = "pl_HumanAvatar", X = 113.34, Y = 546.645},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 107.899},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Respawn", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Lich", File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_die_1h_1.ska"},
			EffectStartAtEntityPosition {Tag = "Lich", File = "Effect_Spawn_Unit"},
			CutsceneFigureTeleport	{Tag = "AvatarSpirit", X = 118.381, Y = 549.028},
			CutsceneFigureTeleport	{Tag = "AvatarSpirit", X = 118.381, Y = 549.028},
			FigureDirectionSet {Tag = "AvatarSpirit", Direction = 308.434},


			
			
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
				FigureVanish	{Tag = "Lich"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Liberator", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS02", Tag = "AvatarSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS03", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Liberator", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS04", Tag = "AvatarSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS05", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Noradim", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS06", Tag = "Noradim"},
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
			CutsceneSay {TextTag = "OutroCS07", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Soulcarrier", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS08", Tag = "SoulCarrier"},
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
			CameraTakeAddToTrack {File = "CS_Take_Liberator", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS09", Tag = "AvatarSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS10", Tag = "Kelar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Liberator", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS11", Tag = "AvatarSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS12", Tag = "CraigSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Liberator", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS13", Tag = "AvatarSpirit"},
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS14", Tag = "AvatarSpirit"},
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS15", Tag = "AvatarSpirit"},
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS16", Tag = "AvatarSpirit"},
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS17", Tag = "AvatarSpirit"},
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
	--		CameraTrackClear {},
	--		CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
	--		CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS18", Tag = "AvatarSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS19", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Liberator", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS20", Tag = "AvatarSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS21", Tag = "pl_HumanAvatar"},
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
				FigureVanish	{Tag = "AvatarSpirit"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS22", Tag = "CraigSpirit"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS23", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS24", Tag = "CraigSpirit"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS25", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "OutroCS26", Tag = "Kelar"},
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			--CutsceneFigureWeaponsShow {Tag = "AvatarSpirit"},
			--CutsceneFigureWeaponsShow {Tag = "CraigSpirit"},
				FigureVanish	{Tag = "CraigSpirit"},
				FigureVanish	{Tag = "Noradim"},
			--	FigureVanish	{Tag = "Shaperconqueress"},
				FigureVanish	{Tag = "SoulCarrier"},
				FigureVanish	{Tag = "Kelar"},
			FadeInEffectStart{},
			MapFlagSetFalse {Name = "mf_MQ6_CS06_VictoryAfterParley_Start"},
			MapFlagSetTrue {Name = "mf_MQ6_CS06_VictoryAfterParley_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
		Conditions =
		{
		},
		Actions =
		{

		},
};




