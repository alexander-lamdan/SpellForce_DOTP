-- ***************************************************************************
-- ** Handling Side Quest 06 																								**
-- ***************************************************************************


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Twiddle IV quest taken <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_TwiddleIVDone"},
		},
		Actions =
		{
			FigureVanish {Tag = "TwiddleIV"},
			MapTimerStart	{Name = "mt_SSSR_SQ_06_Taken"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_06_Taken", Seconds = 5},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_06_Taken"},
		},
		GotoState = "SQ_06 FINISHED",
	},
};


State --**************************************************** Finish state
{
	StateName = "SQ_06 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest SQ_06 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
		},
	},
};

