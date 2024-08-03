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
			"'pl_HumanAvatar'",
			"'Kelar'",
			--"'CaineCS'",
			--"'Sariel'",
			"'Lieutenant'",			
	}
}

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = "CS02_INIT" ,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MQ3_CS03_ShaikanCouncil_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene03Init"},
			MapFlagSetFalse {Name = "mf_MQ3_CS03_ShaikanCouncil_Start"},
			FigureRespawnToEntity	{Tag = "Kelar", TargetTag = "KelarCS3"},
			
			FigureForcedRun	{Tag = "Kelar", X = 589.869, Y = 255.474, },
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 502.713, Y = 202.133},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 502.713, Y = 202.133},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 119.358},
						
			EntityTimerStart {Name = "et_CS03spawntimer"},
		},
	},
	


	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_Cutscene03Init"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "CutsceneFigureRespawn"},
			_tRenderList,
		  CutsceneBegin{},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Lieutenant"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 393.487, Y = 295.732 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 393.487, Y = 295.732 },

			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 169.961},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 169.961},
			
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene03",	
	},
};

--- elso kamera snitt
State
{
	StateName = "Cutscene03",
	
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Cutscene03Init"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--CutsceneSay {TextTag = "StartCS01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},
		
	},	
	
	--Caine and Sariel Spawn in
	OnOneTimeEvent
	{
		EventName = "CS03_SPAWN" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CS03spawntimer", Seconds = 3},
		},
		Actions =
		{

			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Sariel", Level = 1, UnitId = 2085, X = 587.534, Y = 258.766, Team = "pl_Neutral"},},
			CutsceneFigureWeaponsHide {Tag = "Sariel"},
			EffectStartAtEntityPosition {Tag = "Sariel", File = "Effect_Spawn_Unit"},

			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CaineCS", Level = 1, UnitId = 1049, X = 588.81, Y = 257.604, Team = "pl_Neutral"},},
			CutsceneFigureWeaponsHide {Tag = "CaineCS"},
			EffectStartAtEntityPosition {Tag = "CaineCS", File = "Effect_Spawn_Unit"},
		
		
			--FigureRespawn	{Tag = "Sariel", X = 587.534, Y = 258.766, },
			--FigureRespawn	{Tag = "CaineCS", X = 588.81, Y = 257.604, },
	
		},
		GotoState = "CS_Take01",
	},
};


-- kamera snitt
State
{
	StateName = "CS_Take01",

	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CS03spawntimer", Seconds = 5.1},
		},
		Actions =
		{
			--CutsceneFigureFreeze {Tag = "Sariel"},
			EntityTimerStop {Name = "et_CS03spawntimer"},
			
		},
		
	},	

	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
--			CutsceneSayIsDone {},	
		},
		Actions =
		{
--			CutsceneFigureTeleport {Tag = "Sariel", X = 588.083, Y = 257.909 },
--			CutsceneFigureTeleport {Tag = "Sariel", X = 587.534, Y = 258.766 },
		
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS01", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS02", Tag = "Kelar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS03", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS04", Tag = "Kelar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Sariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_emote_kneel.ska"},
			EntityTimerStart {Name = "Sariel_beterdel"},			
			CutsceneSay {TextTag = "CaineAndSarielCS05", Tag = "CaineCS"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	

	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "Sariel_beterdel", Seconds = 2.1},
		},
		Actions =
		{
			CutsceneFigureFreeze {Tag = "Sariel"},
			EntityTimerStop {Name = "Sariel_beterdel"},			
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS06", Tag = "Sariel"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS07", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS08", Tag = "Sariel"},
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS09", Tag = "Kelar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS10", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS11", Tag = "Kelar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine2", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS12", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS13", Tag = "Kelar"},
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
			-- TELEPORTOK!!!

			CutsceneFigureTeleport {Tag = "CaineCS", X = 398.502, Y = 295.098 },
			CutsceneFigureTeleport {Tag = "CaineCS", X = 398.502, Y = 295.098 },

			FigureLookAtDirection {Tag = "CaineCS", Direction = 188.113},
			FigureLookAtDirection {Tag = "CaineCS", Direction = 188.113},			

			CutsceneFigureTeleport {Tag = "Kelar", X = 408.979, Y = 298.126 },
			CutsceneFigureTeleport {Tag = "Kelar", X = 408.979, Y = 298.126 },

			FigureLookAtDirection {Tag = "Kelar", Direction = 264.474},
			FigureLookAtDirection {Tag = "Kelar", Direction = 264.474},			

			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Khai", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS14", Tag = "Lieutenant"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS15", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Kelar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS16", Tag = "Kelar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS17", Tag = "pl_HumanAvatar"},
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
			CutsceneSay {TextTag = "CaineAndSarielCS18", Tag = "CaineCS"},
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
			CutsceneSay {TextTag = "CaineAndSarielCS19", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CaineAndSarielCS20", Tag = "CaineCS"},
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
			CutsceneSay {TextTag = "CaineAndSarielCS21", Tag = "pl_HumanAvatar"},
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
		EventName = ">>> CS_Finish_Despawn <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
			--CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Lieutenant"},
			FadeInEffectStart{},
				FigureVanish	{Tag = "Kelar"},
				FigureVanish	{Tag = "Sariel"},
				FigureVanish	{Tag = "CaineCS"},
				--cainecs vanish?
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 394, Y = 292},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 394, Y = 292},
	
			--FigureTeleport	{Tag = "pl_HumanAvatar", X = 587.534, Y = 258.766},
		
			MapFlagSetFalse {Name = "mf_MQ3_CS03_ShaikanCouncil_Start"},
			MapFlagSetTrue {Name = "mf_MQ3_CS03_ShaikanCouncil_End"},
			
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",

};




