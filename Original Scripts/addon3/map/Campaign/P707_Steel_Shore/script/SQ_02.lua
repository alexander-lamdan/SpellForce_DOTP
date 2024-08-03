-- ***************************************************************************
-- ** Handling Side Quest 02 																								**
-- ***************************************************************************

local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Area is cleared 1 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_02"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "MemoryBank1b"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "MemoryBank1b"},
		},
		Actions =
		{
			MapValueIncrease {Name = "mv_P707_MemoryBankFound"},
			FigureOutcry {TextTag = "cryBankClear1", Tag = "pl_HumanAvatar"},
			FigureWalkToEntity	{Tag = "Researcher1", TargetTag = "MemoryBank1b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard1", TargetTag = "MemoryBank1b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard2", TargetTag = "MemoryBank1b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard3", TargetTag = "MemoryBank1b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard4", TargetTag = "MemoryBank1b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Area is cleared 2 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_02"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "MemoryBank2b"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "MemoryBank2b"},
		},
		Actions =
		{
			MapValueIncrease {Name = "mv_P707_MemoryBankFound"},
			FigureOutcry {TextTag = "cryBankClear2", Tag = "pl_HumanAvatar"},
			FigureWalkToEntity	{Tag = "Researcher2", TargetTag = "MemoryBank2b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard1", TargetTag = "MemoryBank2b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard2", TargetTag = "MemoryBank2b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard3", TargetTag = "MemoryBank2b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard4", TargetTag = "MemoryBank2b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Area is cleared 3 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_02"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "MemoryBank3b"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "MemoryBank3b"},
		},
		Actions =
		{
			MapValueIncrease {Name = "mv_P707_MemoryBankFound"},
			FigureOutcry {TextTag = "cryBankClear3", Tag = "pl_HumanAvatar"},
			FigureWalkToEntity	{Tag = "Researcher3", TargetTag = "MemoryBank3b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard1", TargetTag = "MemoryBank3b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard2", TargetTag = "MemoryBank3b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard3", TargetTag = "MemoryBank3b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard4", TargetTag = "MemoryBank3b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Area is cleared 4 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_02"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "MemoryBank4b"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "MemoryBank4b"},
		},
		Actions =
		{
			MapValueIncrease {Name = "mv_P707_MemoryBankFound"},
			FigureOutcry {TextTag = "cryBankClear4", Tag = "pl_HumanAvatar"},
			FigureWalkToEntity	{Tag = "Researcher1", TargetTag = "MemoryBank4b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard1", TargetTag = "MemoryBank4b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard2", TargetTag = "MemoryBank4b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard3", TargetTag = "MemoryBank4b"},
			FigureWalkToEntity	{Tag = "Res1_Bodyguard4", TargetTag = "MemoryBank4b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Area is cleared 5 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_02"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "MemoryBank5b"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "MemoryBank5b"},
		},
		Actions =
		{
			MapValueIncrease {Name = "mv_P707_MemoryBankFound"},
			FigureOutcry {TextTag = "cryBankClear5", Tag = "pl_HumanAvatar"},
			FigureWalkToEntity	{Tag = "Researcher2", TargetTag = "MemoryBank5b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard1", TargetTag = "MemoryBank5b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard2", TargetTag = "MemoryBank5b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard3", TargetTag = "MemoryBank5b"},
			FigureWalkToEntity	{Tag = "Res2_Bodyguard4", TargetTag = "MemoryBank5b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Area is cleared 6 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_02"},
			FigureTeamIsNotInRangeToEntity {Team = "tm_Team2", Range = 25, TargetTag = "MemoryBank6b"},
			FigureTeamIsInRangeToEntity {Team = "tm_Team1", Range = 15, TargetTag = "MemoryBank6b"},
		},
		Actions =
		{
			MapValueIncrease {Name = "mv_P707_MemoryBankFound"},
			FigureOutcry {TextTag = "cryBankClear6", Tag = "pl_HumanAvatar"},
			FigureWalkToEntity	{Tag = "Researcher3", TargetTag = "MemoryBank6b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard1", TargetTag = "MemoryBank6b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard2", TargetTag = "MemoryBank6b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard3", TargetTag = "MemoryBank6b"},
			FigureWalkToEntity	{Tag = "Res3_Bodyguard4", TargetTag = "MemoryBank6b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Memory Banks Found <<<",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_P707_MemoryBankFound", Value = 4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_SQ_02_Done"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Memory Banks found - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_Historian_SQ_03"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_02_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_02_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_02"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_02_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_02.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_02_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_02.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_02.Gold },		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_02.Gold},	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_02.Gold},	
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_02_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_02_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
		GotoState = "SQ_02 FINISHED",
	},

};


State --**************************************************** Finish state
{
	StateName = "SQ_02 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest SQ_02 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			--QuestSetSolved {Player = "default", Quest = "SSSR_SQ_02"},
		},
	},
};

