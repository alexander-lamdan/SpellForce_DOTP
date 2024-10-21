-- ***************************************************************************
-- ** Handling Main Quest 02 																								**
-- ***************************************************************************

local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Quest MQ_02 init <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_02"},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_Pipeline", Value = 0},
		},
		GotoState = "MQ_02 Run",
	},
};


State --**************************************************** MainQuest State
{
	StateName = "MQ_02 Run",

	OnOneTimeEvent	
	{
		EventName = ">>> Quest MQ_02 started <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_02"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_02_1"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area <<<",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P707_MQ_02_SpotFinded"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "AreaGodMagic02a", Range = 10},		
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "AreaGodMagic02a", Range = 10},
				},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_CS_03_Start"},
			MapValueSet	{Name = "mv_Pipeline", Value = 1},
			ObjectVanish {Tag = "Pipelinefollow"},
			ObjectSpawn	{ObjectId = 1591, X = 64.46, Y = 419.324, Direction = 0, Tag = "Pipelinefollow"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_03_Start"},
			MapFlagIsFalse {Name = "mf_P707_CS_03_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area Pipe 1 <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_Pipeline", Value = 1},
			OR
			{
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "Pipelinefollow", Range = 20},		
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Pipelinefollow", Range = 20},
				},
			},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryHeat01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryHeat02", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryHeat03", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryHeat04", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryHeat05", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryHeat06", Tag = "Surian"},

			ObjectVanish {Tag = "Pipelinefollow"},
			ObjectSpawn	{ObjectId = 1591, X = 43.8809, Y = 345.205, Direction = 0, Tag = "Pipelinefollow"},
			MapValueIncrease	{Name = "mv_Pipeline"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area Pipe 2 <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_Pipeline", Value = 2},
			OR
			{
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "Pipelinefollow", Range = 20},		
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Pipelinefollow", Range = 20},
				},
			},
		},
		Actions =
		{
			ObjectVanish {Tag = "Pipelinefollow"},
			ObjectSpawn	{ObjectId = 1591, X = 51.157, Y = 290.571, Direction = 0, Tag = "Pipelinefollow"},
			MapValueIncrease	{Name = "mv_Pipeline"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area Pipe 3 <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_Pipeline", Value = 3},
			OR
			{
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "Pipelinefollow", Range = 20},		
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Pipelinefollow", Range = 20},
				},
			},
		},
		Actions =
		{
			ObjectVanish {Tag = "Pipelinefollow"},
			ObjectSpawn	{ObjectId = 1591, X = 54.7771, Y = 242.234, Direction = 0, Tag = "Pipelinefollow"},
			MapValueIncrease	{Name = "mv_Pipeline"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area Pipe 4 <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_Pipeline", Value = 4},
			OR
			{
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "Pipelinefollow", Range = 20},		
				AND
				{
					AvatarFlagIsTrue {Name = "af_DragonMounted"},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Pipelinefollow", Range = 20},
				},
			},
		},
		Actions =
		{
			ObjectVanish {Tag = "Pipelinefollow"},
			ObjectSpawn	{ObjectId = 1591, X = 68.8423, Y = 188.536, Direction = 0, Tag = "Pipelinefollow"},
			MapValueIncrease	{Name = "mv_Pipeline"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_03 ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_03_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_MQ_02_1_completed"},
		},
	},
	
		OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_02_1_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_02_1"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_02_1_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_02_1.XP },
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_02_1_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_02_1_completed"},
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_02_2"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area alone <<<",
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P707_MQ_02_SpotFinded"},
				FigureIsInRangeToEntity	{Tag = Dragon , TargetTag = "AreaGodMagic02b", Range = 20},		
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_MQ_02_SpotFinded"},
			FigureOutcry {TextTag = "cryInvokeHere", Tag = "Surian"},
			FigureOutcry {TextTag = "cryBeThere", Tag = "pl_HumanAvatar"},
			-- DialogBegin	{Player = "default", Tag = "ClansBoss"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Dragon reached the area with the avatar <<<",
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "AreaGodMagic02b", Range = 20},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_MQ_02_SpotFinded"},
			MapFlagSetTrue {Name = "mf_P707_CS_04_Start"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_04_Start"},
			MapFlagIsFalse {Name = "mf_P707_CS_04_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_04 ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_04_Ended"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "SecondSeal", DropChance = 100, ItemId = 721},
		},
	},
			
	OnOneTimeEvent
	{
		EventName = ">>> Second Seal is taken <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 721, Amount = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Sariel"},
			MapTimerStart	{Name = "mt_SSSR_MQ_02_2_completed"},
		},
	},
	
		OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_02_2_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_02_2"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_02_2_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_02_2.XP },
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_02_2_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_02_2_completed"},
		},
		GotoState = "MQ_02 FINISHED",
	},
};


State --**************************************************** Finish state
{
	StateName = "MQ_02 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest MQ_02 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SSSR_MQ_02"},
		},
	},
};

