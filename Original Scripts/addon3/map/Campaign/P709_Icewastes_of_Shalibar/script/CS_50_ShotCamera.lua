local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
	}
}
--TODO MS5: add all heroes

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = ">>> CS_50_INIT <<<" ,
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
		EventName = ">>> CS_50_Respawn <<<" ,
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_CS_50_Start"},
		},
		Actions =
		{
			_tRenderList,
		 	CutsceneBegin{},						
			MapFlagSetTrue {Name = "mf_CS_50_Started"},
			FogOfWarReveal	{FogOfWarId = 1, X = 160, Y = 392, Range = 100, Height = 0},
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
			CameraTakeAddToTrack {File = "CS50_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Finish",
	},	

};


-- cutscene lezarasa, vege flag beallitasa
-- oriasi szopo: ha esc-et nyomsz, cutscene endkor idougras tortenik, szinte lehetetlen emiatt oda idoziteni, outcry is atugrodik, quest adas is.... ezerszer sirtam erte
State
{
	StateName = "CS_Finish",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CS_50_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		--CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_CS_50_Ended"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




