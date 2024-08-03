-- ***************************************************************************
-- ** Handling Side Quest 05 																								**
-- ***************************************************************************

local Adventurer1 = "pl_HumanAvatar";
local Adventurer2 = "pl_HumanHeroCaine";
local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Reached the area with Craig <<<",
		Conditions = 
		{
			QuestIsNotSolved	{Player = "default", Quest = "SSSR_SQ_05"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "Nightsong", Range = 15},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryNightsong1", Tag = "Nightsong"},
			FigureOutcry	{TextTag = "cryNightsong2", Tag = "pl_HumanCompanionCraigHuman"},
			FigureOutcry	{TextTag = "cryNightsong3", Tag = "Shadowwarrior"},
		},
	},

	OnOneTimeEvent ----------------------------------------- Craig Cutscene
	{
		EventName = ">>> Nightsong dialog done <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05", Seconds = 2},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05"},
			MapFlagSetTrue {Name = "mf_P708_CS_04_Start"},
		},
	},	
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_04_Start"},
			MapFlagIsFalse {Name = "mf_P708_CS_04_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	


	OnOneTimeEvent ----------------------------------------- GetQuest - Craig
	{
		EventName = ">>> Getquest - Craig <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_04_Ended"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_SQ_05_1"},
			QuestSetActive {Player = "default", Quest = "SSSR_SQ_05_2"},
			QuestSetActive {Player = "default", Quest = "SSSR_SQ_05_3"},
		},
	},


	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Arg1 Presented - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_Arg1_Done"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05_1_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_1_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_1"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_1_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_05_1.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_1_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_05_1.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_05_1.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_05_1.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_05_1.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_1_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_1_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Arg2 Presented - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_Arg2_Done"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05_2_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_2_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_2"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_2_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_05_2.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_2_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_05_2.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_05_2.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_05_2.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_05_2.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_2_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_2_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Arg3 Presented - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_Arg3_Done"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05_3_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_3_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_3"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_3_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_05_3.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_3_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_05_3.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_05_3.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_05_3.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_05_3.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_3_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_3_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Arg4 Presented - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_Arg4_Done"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05_4_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_4_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_4"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_4_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_05_4.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_4_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_05_4.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_05_4.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_05_4.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_05_4.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_4_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_4_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Arg5 Presented - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_Arg5_Done"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05_5_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_5_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_5"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_5_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_05_5.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_5_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_SQ_05_5.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_SQ_05_5.Gold },	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_SQ_05_5.Gold},		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_SQ_05_5.Gold},		
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_5_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_5_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},


	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Decision made - after dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_Arg_Done"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_SQ_05_6_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_6_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_6"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_6_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_05_6.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_6_completed", Seconds = 6},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Norcaine Decision <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_6_completed", Seconds = 15},
			MapFlagIsTrue {Name = "mf_P708_Arg_Done"},
			AvatarFlagIsFalse {Name = "af_P708_Shadowsong_Is_Shadow"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_6_completed"},
			FigureOutcry	{TextTag = "cryDecisionN1", Tag = "Nightsong"},
			FigureOutcry	{TextTag = "cryDecisionN2", Tag = "pl_HumanCompanionCraigHuman"},
		},
		GotoState = "SQ_05 FINISHED",
	},

	OnOneTimeEvent
	{
		EventName = ">>> Norcaine Decision <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_05_6_completed", Seconds = 15},
			MapFlagIsTrue {Name = "mf_P708_Arg_Done"},
			AvatarFlagIsTrue {Name = "af_P708_Shadowsong_Is_Shadow"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_05_6_completed"},
			FigureOutcry	{TextTag = "cryDecisionS1", Tag = "Nightsong"},
			FigureOutcry	{TextTag = "cryDecisionS2", Tag = "Shadowwarrior"},
			FigureOutcry	{TextTag = "cryDecisionS3", Tag = "Nightsong"},
		},
		GotoState = "SQ_05 FINISHED",
	},

};


State --**************************************************** Finish state
{
	StateName = "SQ_05 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest SQ_05 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SSSR_SQ_05"},
		},
	},
};

