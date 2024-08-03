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
			"'Citizen01'",
			"'Citizen02'",
			"'Citizen03'",
			"'Soldier'",
		--	"'pl_HumanAvatar'",
			"'CaineCS'",
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
			MapFlagIsTrue {Name = "mf_MQ6_CS06_TowerOfTheShaikan_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene06Init"},
			MapFlagSetFalse {Name = "mf_MQ6_CS06_TowerOfTheShaikan_Start"},
		},
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_Cutscene06Init"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "CutsceneFigureRespawn"},
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "CaineCS"},
			CutsceneFigureWeaponsHide {Tag = "Soldier"},
			CutsceneFigureWeaponsHide {Tag = "Citizen01"},
-- citizen: 256.107, 365.84, 226.094
-- avatar: 250.223, 364.535, 21.7061
-- caine: 253.495, 362.89, 235.577
-- soldier: 251.419, 361.792, 202.163
			CutsceneFigureTeleport {Tag = "Citizen01", X = 256.107, Y = 365.84 },
			CutsceneFigureTeleport {Tag = "Citizen01", X = 256.107, Y = 365.84 },
		
			FigureLookAtDirection {Tag = "Citizen01", Direction = 226.094},
			FigureLookAtDirection {Tag = "Citizen01", Direction = 226.094},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 250.223, Y = 364.535 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 250.223, Y = 364.535 },
		
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 21.7061},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 21.7061},

			CutsceneFigureTeleport {Tag = "CaineCS", X = 253.495, Y = 362.89 },
			CutsceneFigureTeleport {Tag = "CaineCS", X = 253.495, Y = 362.89 },
			
			FigureLookAtDirection {Tag = "CaineCS", Direction = 235.577},
			FigureLookAtDirection {Tag = "CaineCS", Direction = 235.577},
						
			CutsceneFigureTeleport {Tag = "Soldier", X = 252.325, Y = 357.803 },
			CutsceneFigureTeleport {Tag = "Soldier", X = 252.325, Y = 357.803 },
			
			FigureLookAtDirection {Tag = "Soldier", Direction = 202.163},
			FigureLookAtDirection {Tag = "Soldier", Direction = 202.163},
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_Take02",	
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
			MapFlagIsTrue {Name = "mf_Cutscene06Init"},
		},
		Actions =
		{
		-- toronyra kamera
		--	CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS05_Take_02", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			--CutsceneSay {TextTag = "StartCS01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
			
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
		--	CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Soldier", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TowerActivatedCS01", Tag = "Soldier"},
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
			MapFlagIsTrue {Name = "mf_Cutscene06Init"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Citizen", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TowerActivatedCS02", Tag = "Citizen01"},
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
			CutsceneSay {TextTag = "TowerActivatedCS03", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Soldier", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TowerActivatedCS04", Tag = "Soldier"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TowerActivatedCS05", Tag = "CaineCS"},
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
			CutsceneSay {TextTag = "TowerActivatedCS06", Tag = "pl_HumanAvatar"},
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
			CutsceneFigureWeaponsShow {Tag = "Soldier"},
		--	CutsceneFigureWeaponsShow {Tag = "CaineCS"},
			CutsceneFigureWeaponsShow {Tag = "Citizen01"},
			
			
			FadeInEffectStart{},
				FigureVanish	{Tag = "CaineCS"},
			MapFlagSetFalse {Name = "mf_MQ6_CS06_TowerOfTheShaikan_Start"},
			MapFlagSetTrue {Name = "mf_MQ6_CS06_TowerOfTheShaikan_End"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",

};




