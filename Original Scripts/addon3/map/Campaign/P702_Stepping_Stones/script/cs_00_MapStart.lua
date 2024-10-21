
-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
 
local TeleportPos1 = "mrk_cs_Avatar_start";
local TeleportPos2 = "mrk_cs_Dragon";

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanAvatar'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroFirst'",
	}
}

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = "CS00_MAPSTART_INIT" ,
		Conditions =
		{
			-- ide mapflag a palyarol: fx_markert felrakni a kis szigetecskekre!!!
		},
		Actions =
		{
		},
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				--MapFlagIsTrue {Name = "mf_Start"},
			MapFlagIsTrue {Name = "mf_P702_CS00_MapStart_Start"},
		},
		Actions =
		{
			FigureStop	{Tag = "pl_HumanAvatar"},
			FigureStop	{Tag = "pl_HumanHeroCaine"},
		--	FigureStop	{Tag = "pl_HumanHeroFirst"},
			--FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = TeleportPos1},
			--FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = TeleportPos1},
	
			--FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = TeleportPos1},
			--FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = TeleportPos1},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 175.718, Y = 527.868 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 172.759, Y = 527.934 },
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = TeleportPos2},
			FigureLookAtEntity	{Tag = "pl_HumanHeroCaine", TargetTag = TeleportPos2},
			FigureLookAtEntity	{Tag = "pl_HumanHeroFirst", TargetTag = TeleportPos2},

						
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
			
			--FigureNpcSpawnToEntity	{Tag = "npc_Ghost", Level = 1 , UnitId = 826, TargetTag = "pl_Humanavatar", Team = "tm_Neutral"},	
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "MapStartCutscene01",
	},
};

--- elso kamera snitt
State
{
	StateName = "MapStartCutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			
		},
		Actions =
		{
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "npc_Dragon", Level = 1 , UnitId = 2106, TargetTag = TeleportPos2, Team = "tm_Neutral"},},
			FigureLookAtEntity	{Tag = "npc_Dragon", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_Dragon"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS00_MapStart_Take1", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- CutsceneSay {TextTag = "...", Tag = "pl_HumanAvatar"},
			
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "MapStartCutscene02",
	},	
};

-- masodik kamera snitt
State
{
	StateName = "MapStartCutscene02",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
     EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		-- CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS00_MapStart_Take1", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS01", Tag = "npc_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene03",
	},	
};

State
{
	StateName = "MapStartCutscene03",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene04",
	},	
};

State
{
	StateName = "MapStartCutscene04",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Kelar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS03", Tag = "npc_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene05",
	},	
};

State
{
	StateName = "MapStartCutscene05",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene06",
	},	
};

State
{
	StateName = "MapStartCutscene06",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Kelar02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS05", Tag = "npc_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene07",
	},	
};

State
{
	StateName = "MapStartCutscene07",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene08",
	},	
};

State
{
	StateName = "MapStartCutscene08",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
--			CutsceneFigureTeleport {Tag = "mrk_DragonLeave", X = 175.137, Y = 507.894},
--			CutsceneFigureTeleport {Tag = "mrk_DragonLeave", X = 175.137, Y = 507.894},
--			FigureRunToEntity	{Tag = "npc_Dragon", TargetTag = "mrk_DragonLeave"},
			FigureSimpleWalk {Tag = "npc_Dragon", X = 146.293, Y = 532.882}, 
			CutsceneSay {TextTag = "MapStart_CS07", Tag = "npc_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene09",
	},	
};




State
{
	StateName = "MapStartCutscene09",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureRunToEntity	{Tag = "npc_Dragon", TargetTag = "mrk_DragonLeave"},
			CutsceneSay {TextTag = "MapStart_CS08", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene10",
	},	
};

State
{
	StateName = "MapStartCutscene10",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene11",
	},	
};

State
{
	StateName = "MapStartCutscene11",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS10", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene12",
	},	
};

State
{
	StateName = "MapStartCutscene12",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS11", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene13",
	},	
};

State
{
	StateName = "MapStartCutscene13",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS12", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene14",
	},	
};

State
{
	StateName = "MapStartCutscene14",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS13", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutscene15",
	},	
};

State
{
	StateName = "MapStartCutscene15",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MapStart_CS14", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "SHUTDOWN",
	},	
};


State
{
	StateName = "MapStartCutsceneVanish",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			--FigureVanish	{Tag = "npc_Dragon"},
			FigureRunToEntity	{Tag = "npc_Dragon", TargetTag = "mrk_DragonLeave"},
			CameraTrackClear {},
			-- sarkany elhuz kamera, nem hasznalt state
			CameraTakeAddToTrack {File = "CS00_MapStart_Take1", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- CutsceneSay {TextTag = "StartCS02", Tag = "npc_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "MapStartCutsceneFINISH",
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
		GotoState = "MapStartCutsceneFINISH",
	},	
};
-- cutscene lezarasa, vege flag beallitasa

State
{
	StateName = "MapStartCutsceneFINISH",
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
			
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
			FadeInEffectStart{},
			FigureVanish	{Tag = "npc_Dragon"},
			--MapFlagSetTrue {Name = "mf_Start2"},
			MapFlagSetTrue {Name = "mf_P702_CS00_MapStart_End"},
			MapFlagSetFalse {Name = "mf_P702_CS00_MapStart_Start"},
			--MapFlagSetFalse {Name = "mf_Start"},
			CutsceneEnd	{},	
		},	
		GotoState = "MapStartCutsceneEnd",
	},	
};

State
{
	StateName = "MapStartCutsceneEnd",
	
};




