
State
{
	StateName = "Achievements",
	
	OnOneTimeEvent
	{
		EventName = ">>> All Pass is done  <<<",
		Conditions = 
		{
			OR
			{
				MapValueIsEqual	{Name = "mv_P707_PassDone", Value = 26},
				MapValueIsGreater	{Name = "mv_P707_PassDone", Value = 26},
			},
		},
		
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_Achievement_P707_Teamplay"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_05 ended + 5mp for QuickHack<<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_start", Seconds = 5},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P707_QuickHackStarted"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> QuickHack<<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_MindhackDone"},	
			MapTimerIsNotElapsed	{Name = "mt_P707_QuickHackStarted", Seconds = 600},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_Achievement_P707_Quickhack"},
		},
	},

}