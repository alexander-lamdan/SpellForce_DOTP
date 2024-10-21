--************************************************************
--**
--**		Drakkar  :: Start CutScene
--**
--************************************************************
-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is
local _tRenderList = CutsceneFigureRenderList{Tag = "Lich"}
_tRenderList.tModFuncs =
{
	Add =
	{

			--"'Thor_Halicos'",
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
		EventName = "CS04_INIT" ,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MQ5_CS04_AWC_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene04Init"},
			MapFlagSetFalse {Name = "mf_P701_Start_CS01_End"},
		},
	
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_Cutscene04Init"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "CutsceneFigureRespawn"},
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "CaineCS"},

			CutsceneFigureTeleport {Tag = "CaineCS", X = 142.095, Y = 151.077 },
			CutsceneFigureTeleport {Tag = "CaineCS", X = 142.095, Y = 151.077 },

			FigureLookAtDirection {Tag = "CaineCS", Direction = 356.158},
			FigureLookAtDirection {Tag = "CaineCS", Direction = 356.158},			

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 140.742, Y = 147.765 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 140.742, Y = 147.765 },

			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 166.119},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 166.119},
			
			
			
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene04",	
	},
};

--- elso kamera snitt
State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Cutscene04Init"},
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			--CutsceneSay {TextTag = "StartCS01", Tag = "pl_HumanAvatar"},
--			EntityTimerStart {Name = "et_CS04timer"},
			ObjectChange	{Tag = "HQGate_Broken", ObjectId = 2501, X = 304.273, Y = 302.452, Direction = 90},
			GateSetOpen	{Tag = "HQGate"},
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
--			EntityTimerIsElapsed {Name = "et_CS04timer", Seconds = 4},
--			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ArmyWithoutCommanderCS01", Tag = "CaineCS"},
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
			CutsceneSay {TextTag = "ArmyWithoutCommanderCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ArmyWithoutCommanderCS03", Tag = "CaineCS"},
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
			CameraTakeAddToTrack {File = "CS04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
	--		ObjectSpawn	{ObjectId = 1102, X = 0, Y = 0, Direction = 0, Tag = "Alarm_without_ID"},
			SoundGlobalPlayOnceAddon3 {File = "speech/P701_CUT_ARMYWITHOUT_T004_ALARM"},
			CutsceneSay {TextTag = "ArmyWithoutCommanderCS04", Tag = "Alarm_without_ID"},
	--		CutsceneSay {TextTag = "XXXX", Tag = "XXXX"},
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
			CutsceneSayIsDone {},	--ha meglesz a hangeffekt, akkor timer-elni kell
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ArmyWithoutCommanderCS05", Tag = "CaineCS"},
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
			CutsceneSay {TextTag = "ArmyWithoutCommanderCS06", Tag = "pl_HumanAvatar"},
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
			--CutsceneFigureWeaponsShow {Tag = "CaineCS"},
			FadeInEffectStart{},
				FigureVanish	{Tag = "CaineCS"},
			MapFlagSetFalse {Name = "mf_Cutscene04Init"},
			MapFlagSetFalse {Name = "mf_MQ5_CS04_AWC_Start"},
			MapFlagSetTrue {Name = "mf_MQ5_CS04_AWC_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",

};




