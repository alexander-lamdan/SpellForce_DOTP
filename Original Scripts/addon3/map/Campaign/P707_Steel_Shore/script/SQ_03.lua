-- ***************************************************************************
-- ** Handling Side Quest 03 																								**
-- ***************************************************************************

local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Cell hidden door is found <<<",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P707_SQ_03_Done"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "Cell"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "Cell"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_SQ_03_Done"},
			FigureOutcry {TextTag = "cryCellsFound1", Tag = "pl_HumanHeroCaine"},
			FigureOutcry {TextTag = "cryCellsFound2", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "cryCellsFound3", Tag = "pl_HumanHeroCaine"},
			FigureOutcry {TextTag = "cryCellsFound4", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "cryCellsFound5", Tag = "pl_HumanHeroCaine"},
		},
	},

	
	OnOneTimeEvent
	{
		EventName = ">>> Hidden Cell found - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_Historian_SQ_H_End"},
		},
		Actions =
		{
			FigureWalkToEntity	{Tag = "Researcher1", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard1", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard2", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard3", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard4", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Researcher2", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard1", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard2", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard3", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard4", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Researcher3", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard1", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard2", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard3", TargetTag = "Cell"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard4", TargetTag = "Cell"},

			MapTimerStart	{Name = "mt_SSSR_SQ_03_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_03_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_03"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_03_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_03.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_03_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_03.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_03.Gold },	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_03.Gold},		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_03.Gold},		
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_03_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_03_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
		GotoState = "SQ_03 FINISHED",
	},

};


State --**************************************************** Finish state
{
	StateName = "SQ_03 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest SQ_03 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			--QuestSetSolved {Player = "default", Quest = "SSSR_SQ_03"},
		},
	},
};

