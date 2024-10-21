-- ***************************************************************************
-- ** Handling Side Quest 01 																								**
-- ***************************************************************************

local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Researcher1 is saved <<<",
		Conditions = 
		{
			AND
			{
				FigureIsDead {Tag = "MA11"},
				FigureIsDead {Tag = "MA12"},
				FigureIsDead {Tag = "MA13"},
			},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "Researcher1", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res1_Bodyguard1", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res1_Bodyguard2", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res1_Bodyguard3", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res1_Bodyguard4", TargetTag = "WPFirstBlock7"},
			MapTimerStart {Name = "mt_saving1" },
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Researcher1 is saved <<<",
		Conditions = 
		{
			AND
			{
				FigureIsDead {Tag = "MA11"},
				FigureIsDead {Tag = "MA12"},
				FigureIsDead {Tag = "MA13"},
			},
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Researcher1"},
			MapTimerIsElapsed	{Name = "mt_saving1", Seconds = 2},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_saving1" },
			FigureOutcry {TextTag = "crySaved1", Tag = "Researcher1"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Researcher2 is saved <<<",
		Conditions = 
		{
			AND
			{
				FigureIsDead {Tag = "MA21"},
				FigureIsDead {Tag = "MA22"},
				FigureIsDead {Tag = "MA23"},
			},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "Researcher2", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res2_Bodyguard1", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res2_Bodyguard2", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res2_Bodyguard3", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res2_Bodyguard4", TargetTag = "WPFirstBlock7"},
			MapTimerStart {Name = "mt_saving2" },
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Researcher2 is saved <<<",
		Conditions = 
		{
			AND
			{
				FigureIsDead {Tag = "MA21"},
				FigureIsDead {Tag = "MA22"},
				FigureIsDead {Tag = "MA23"},
			},
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Researcher2"},
			MapTimerIsElapsed	{Name = "mt_saving2", Seconds = 2},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_saving2" },
			FigureOutcry {TextTag = "crySaved2", Tag = "Researcher2"},
		},
	},


	OnOneTimeEvent
	{
		EventName = ">>> Researcher3 is saved <<<",
		Conditions = 
		{
			AND
			{
				FigureIsDead {Tag = "MA31"},
				FigureIsDead {Tag = "MA32"},
				FigureIsDead {Tag = "MA33"},
			},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "Researcher3", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res3_Bodyguard1", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res3_Bodyguard2", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res3_Bodyguard3", TargetTag = "WPFirstBlock7"},
			FigureForcedRunToEntity	{Tag = "Res3_Bodyguard4", TargetTag = "WPFirstBlock7"},
			MapTimerStart {Name = "mt_saving3" },
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Researcher3 is saved <<<",
		Conditions = 
		{
			AND
			{
				FigureIsDead {Tag = "MA31"},
				FigureIsDead {Tag = "MA32"},
				FigureIsDead {Tag = "MA33"},
			},
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Researcher3"},
			MapTimerIsElapsed	{Name = "mt_saving3", Seconds = 2},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_saving3" },
			FigureOutcry {TextTag = "crySaved3", Tag = "Researcher3"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> All Researcher is saved <<<",
		Conditions = 
		{
			AND
			{
				OR
				{
					AND
					{
						FigureIsDead {Tag = "MA11"},
						FigureIsDead {Tag = "MA12"},
						FigureIsDead {Tag = "MA13"},
					},
					FigureIsDead {Tag = "Researcher1"},
				},
				OR
				{
					AND
					{
						FigureIsDead {Tag = "MA21"},
						FigureIsDead {Tag = "MA22"},
						FigureIsDead {Tag = "MA23"},
					},
					FigureIsDead {Tag = "Researcher2"},
				},
				OR
				{
					AND
					{
						FigureIsDead {Tag = "MA31"},
						FigureIsDead {Tag = "MA32"},
						FigureIsDead {Tag = "MA33"},
					},
					FigureIsDead {Tag = "Researcher3"},
				},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_SQ_01_Done"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Researcher Saved - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_Historian_SQ_02"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_01_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_01_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_01"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_01_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_01.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_01_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_01.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_01.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_01.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_01.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_01_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_01_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
		GotoState = "SQ_01 FINISHED",
	},

};


State --**************************************************** Finish state
{
	StateName = "SQ_01 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest SQ_01 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			--QuestSetSolved {Player = "default", Quest = "SSSR_SQ_01"},
		},
	},
};

