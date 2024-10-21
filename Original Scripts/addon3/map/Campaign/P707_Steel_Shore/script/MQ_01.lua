-- ***************************************************************************
-- ** Handling Main Quest 01 																								**
-- ***************************************************************************

local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Quest MQ_01 init <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_01"},
		},
		Actions =
		{
		},
		GotoState = "MQ_01 Run",
	},
};


State --**************************************************** MainQuest State
{
	StateName = "MQ_01 Run",

	OnOneTimeEvent
	{
		EventName = ">>> Quest MQ_01 started <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_01"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_01_1"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area <<<",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "AreaGodMagic01a", Range = 10},		
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "AreaGodMagic01b", Range = 10},
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "Sealhide2", Range = 20},
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					OR
					{
						FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "AreaGodMagic01a", Range = 10},
						FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Sealhide2", Range = 20},
					},
				},
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					OR
					{
						FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "AreaGodMagic01b", Range = 10},
						FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Sealhide2", Range = 20},
					},
				},
			},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryFirstPlace01", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryFirstPlace02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryFirstPlace03", Tag = "Surian"},
			EntityTimerStart {Name = "et_CSStartTimer"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> CS_02_Start <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSStartTimer", Seconds = 15},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_CS_02_Start"},
		},	
	},	
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_02_Start"},
			MapFlagIsFalse {Name = "mf_P707_CS_02_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_02 ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_02_Ended"},
		},
		Actions =
		{
			MapValueSet {Name = "mv_SealPos", Value = 0},
			MapTimerStart	{Name = "mt_SSSR_MQ_01_1_completed"},
		},
	},
	OnOneTimeEvent 
	{
		EventName = ">>> Hop on Timer <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_1_completed", Seconds = 1},
		},
		Actions =
		{	
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},

	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_1_completed", Seconds = 2},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_1_completed", Seconds = 7},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_01_1.XP },
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_1_completed", Seconds = 17},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_01_1_completed"},
			QuestSetActive	{Player = "default", Quest = "SSSR_MQ_01_2"},
		},
	},


	OnOneTimeEvent 
	{
		EventName = ">>> Seal Out <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			MapValueIsEqual {Name = "mv_SealPos", Value = 4},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "FirstSeal", DropChance = 100, ItemId = 720},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> First Seal is taken <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 720, Amount = 1},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_MQ_01_2_completed"},
			FigureOutcry	{TextTag = "crySeal1Got01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "crySeal1Got02", Tag = "Surian"},
			FigureOutcry	{TextTag = "crySeal1Got03", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "crySeal1Got04", Tag = "Surian"},
		},
	},
	
		OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_2_completed", Seconds = 20},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_01_2"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_2_completed", Seconds = 25},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_01_2.XP },
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_2_completed", Seconds = 35},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_01_2_completed"},
		},
		GotoState = "MQ_01 FINISHED",
	},


};


State --**************************************************** Finish state
{
	StateName = "MQ_01 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest MQ_01 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SSSR_MQ_01"},
		},
	},
};

