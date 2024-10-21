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
			"'Thor_Halicos'",
			"'pl_HumanAvatar'",
			"'CaineCS'",
		}
}

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = "CS05_INIT" ,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MQ5_CS05_LastRequest_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene05Init"},
			MapFlagSetFalse {Name = "mf_MQ5_CS05_LastRequest_Start"},
		},
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_Cutscene05Init"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "CutsceneFigureRespawn"},
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Thor_Halicos"},
			CutsceneFigureWeaponsHide {Tag = "CaineCS"},
--			FigureCorpseRotForbid {Tag = "Thor_Halicos"},
--			FigureKill {Tag = "Thor_Halicos"},
			CutsceneFigureTeleport {Tag = "CaineCS", X = 281.29, Y = 348.712 },
			CutsceneFigureTeleport {Tag = "CaineCS", X = 281.29, Y = 348.712 },
		
			FigureLookAtDirection {Tag = "CaineCS", Direction = 169.96},
			FigureLookAtDirection {Tag = "CaineCS", Direction = 169.96},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 279.821, Y = 350.158 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 279.821, Y = 350.158 },
			
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 128.89},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 128.89},
			
			CutsceneFigureTeleport {Tag = "Thor_Halicos", X = 282.312, Y = 351.904 },
			CutsceneFigureTeleport {Tag = "Thor_Halicos", X = 282.312, Y = 351.904 },
--			CutsceneFigureTeleport {Tag = "Thor_Halicos", X = 282.013, Y = 352.256 },
			
			FigureLookAtDirection {Tag = "Thor_Halicos", Direction = 314.163},
			FigureLookAtDirection {Tag = "Thor_Halicos", Direction = 314.163},
			
			FigureAnimPlayOnce {Tag = "Thor_Halicos", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
		
			EntityTimerStart {Name = "megfexel_hali"},
			

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene05",	
	},
};

--- elso kamera snitt
State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "megfexel_hali", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneFigureFreeze {Tag = "Thor_Halicos"},
			EntityTimerStop {Name = "megfexel_hali"},
			
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
--			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Halicos02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TheLastCommandCS01", Tag = "Thor_Halicos"},
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
			CutsceneSay {TextTag = "TheLastCommandCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Halicos02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TheLastCommandCS03", Tag = "Thor_Halicos"},
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
			CutsceneSay {TextTag = "TheLastCommandCS04", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Halicos02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TheLastCommandCS05", Tag = "Thor_Halicos"},
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
			CutsceneSay {TextTag = "TheLastCommandCS06", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Halicos02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TheLastCommandCS07", Tag = "Thor_Halicos"},
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
			CutsceneSay {TextTag = "TheLastCommandCS08", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Halicos02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureAnimPlayOnce {Tag = "Thor_Halicos", File = "base/gfx/figures/hero/figure_hero_male_die.ska"},
			CutsceneSay {TextTag = "TheLastCommandCS09", Tag = "Thor_Halicos"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TheLastCommandCS10", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TheLastCommandCS11", Tag = "pl_HumanAvatar"},
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
			EntityTimerStop	{Name = "et_CS05timer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
		--	CutsceneFigureWeaponsShow {Tag = "Thor_Halicos"},
		--	CutsceneFigureWeaponsShow {Tag = "CaineCS"},
			FadeInEffectStart{},
				FigureVanish	{Tag = "CaineCS"},
			MapFlagSetFalse {Name = "mf_MQ5_CS05_LastRequest_Start"},
			MapFlagSetTrue {Name = "mf_MQ5_CS05_LastRequest_End"},

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




