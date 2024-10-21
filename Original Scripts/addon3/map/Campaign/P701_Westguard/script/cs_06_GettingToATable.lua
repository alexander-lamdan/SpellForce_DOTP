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
			--CutsceneFigureWeaponsHide {Tag = "Lich"},

			
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
			MapFlagIsTrue {Name = "mf_Cutscene06Init"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS05_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--CutsceneSay {TextTag = "StartCS01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CS06timer"},
			
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
			EntityTimerIsElapsed {Name = "et_CS06timer", Seconds = 3},
		--CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CS06timer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			--CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			FadeInEffectStart{},
			MapFlagSetFalse {Name = "mf_MQ6_CS06_TowerOfTheShaikan_Start"},
			MapFlagSetTrue {Name = "mf_MQ6_CS06_TowerOfTheShaikan_End"},

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




