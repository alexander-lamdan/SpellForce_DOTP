State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
	Conditions = 
		{
				GameIsUnBlocked{},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P500_Start_CS01_Start"},

		},
	},
	
------------------------
-- Autosave Handling
------------------------
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Autosave called <<<",
		Name = "AutosaveTimer",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Autosave" },
		},	
		Actions =
		{	
			EventReEnable {Name = "AutosaveNow"},
			MapTimerStart {Name = "mt_Autosave"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> Autosave execute <<<",
		Name = "AutosaveNow",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Autosave" },
			MapTimerIsElapsed	{Name = "mt_Autosave", Seconds = 5},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},	
		Actions =
		{	
			EventReEnable {Name = "AutosaveTimer"},
			MapTimerStop {Name = "mt_Autosave"},
			MapFlagSetFalse { Name = "mf_Autosave" },
			DoAutoSave {},
		},
	},

	OnEvent
	{
		EventName = "PostMapTravelEnableDragon",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},	
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
		},
	};

		
};
	
State
{
	StateName = "End",
};
