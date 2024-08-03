-- ***************************************************************************
-- ** Handling Main Quest 03 																								**
-- ***************************************************************************


local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Quest MQ_03 init <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_03"},
		},
		Actions =
		{
		},
		GotoState = "MQ_03 Run",
	},
};


State --**************************************************** MainQuest State
{
	StateName = "MQ_03 Run",

	OnOneTimeEvent	
	{
		EventName = ">>> Quest MQ_03 started <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_03"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "MemoryBank1", DropChance = 100, ItemId = 725},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank2", DropChance = 100, ItemId = 724},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank2", DropChance = 100, ItemId = 727},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank3", DropChance = 100, ItemId = 723},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank3", DropChance = 100, ItemId = 732},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank4", DropChance = 100, ItemId = 726},
			--ObjectLootItemMiscAdd	{Tag = "MemoryBank4", DropChance = 100, ItemId = 728},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank5", DropChance = 100, ItemId = 730},
			ObjectLootItemMiscAdd	{Tag = "MemoryBank6", DropChance = 100, ItemId = 729},
			MapValueSet	{Name = "mv_P707_UnreadCards", Value = 0},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Find the two Memory Bank Card: Sariel <<<",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P707_Read1264"},
			MapFlagIsTrue{Name = "mf_P707_Read1271"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_MQ_03_1_Done"},
			LeverSetEnabled	{Tag = "MindProbeGateInLever"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Find the three Memory Bank Card: Caine <<<",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P707_Read1013"},
			MapFlagIsTrue{Name = "mf_P707_Read1014"},
			MapFlagIsTrue{Name = "mf_P707_Read1015"},
			MapFlagIsFalse{Name = "mf_P707_InMemoryBank"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CS07Timer"},
			DialogSetDisabled	{Tag = "MemoryBank"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_04 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CS07Timer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CS07Timer"},			
			MapFlagSetTrue {Name = "mf_P707_CS_07_Start"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_07_Start"},
			MapFlagIsFalse {Name = "mf_P707_CS_07_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_07 ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_07_Ended"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_P707_CaineComingOutDone"},
			AvatarItemMiscGive	{Player = "default", ItemId = 728, Amount = 1},
			DialogSetEnabled	{Tag = "MemoryBank"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Find Card 1 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 723, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 2 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 724, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 3 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 725, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 4 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 726, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 5 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 727, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 6 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 729, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 7 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 730, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 8 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 731, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Find Card 9 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 732, Amount = 1},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_UnreadCards"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Find all Memory Bank Cards <<<",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P707_Read1013"},
			MapFlagIsTrue{Name = "mf_P707_Read1014"},
			MapFlagIsTrue{Name = "mf_P707_Read1015"},
			MapFlagIsTrue{Name = "mf_P707_Read1020"},
			MapFlagIsTrue{Name = "mf_P707_Read1002"},
			MapFlagIsTrue{Name = "mf_P707_Read0957"},
			MapFlagIsTrue{Name = "mf_P707_Read1264"},
			MapFlagIsTrue{Name = "mf_P707_Read1271"},
			MapFlagIsTrue{Name = "mf_P707_Read0213"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_AllRead"},
			DialogSetDisabled	{Tag = "MemoryBank"},
		},
	},
		
	OnOneTimeEvent
	{
		EventName = ">>> Close a Bank already looted <<<",
		Conditions = 
		{
			OR
			{
				AvatarHasItemMisc	{Player = "default", ItemId = 725, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 724, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 727, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 723, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 732, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 726, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 730, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 729, Amount = 1},
			},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "MemoryBank"},
		},
	},
--[[	
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 1 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 725, Amount = 1},
		},
		Actions =
		{
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
			ObjectVanish	{Tag = "MemoryBankDialogBack"},
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "MemoryBankDialogBack"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock1"},
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStart	{Name = "mt_MemoryBankStart1"},
			MapTimerStart	{Name = "mt_MemoryBankStart"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 1b <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart1", Seconds = 0.25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart1"},
			DialogBegin	{Player = "default", Tag = "MemoryBank"},
			EventReEnable	{Name = "MemoryBankDialogBackA"},
			EventReEnable	{Name = "MemoryBankDialogBackB"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 2 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 724, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 727, Amount = 1},
		},
		Actions =
		{
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
			ObjectVanish	{Tag = "MemoryBankDialogBack"},
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "MemoryBankDialogBack"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock1"},
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStart	{Name = "mt_MemoryBankStart"},
			MapTimerStart	{Name = "mt_MemoryBankStart2"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 2b <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart2", Seconds = 0.25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart2"},
			DialogBegin	{Player = "default", Tag = "MemoryBank"},
			EventReEnable	{Name = "MemoryBankDialogBackA"},
			EventReEnable	{Name = "MemoryBankDialogBackB"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 3 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 723, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 732, Amount = 1},
		},
		Actions =
		{
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
			ObjectVanish	{Tag = "MemoryBankDialogBack"},
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "MemoryBankDialogBack"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock1"},
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStart	{Name = "mt_MemoryBankStart"},
			MapTimerStart	{Name = "mt_MemoryBankStart3"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 3b <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart3", Seconds = 0.25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart3"},
			DialogBegin	{Player = "default", Tag = "MemoryBank"},
			EventReEnable	{Name = "MemoryBankDialogBackA"},
			EventReEnable	{Name = "MemoryBankDialogBackB"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 4 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 726, Amount = 1},
		},
		Actions =
		{
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
			ObjectVanish	{Tag = "MemoryBankDialogBack"},
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "MemoryBankDialogBack"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock1"},
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStart	{Name = "mt_MemoryBankStart"},
			MapTimerStart	{Name = "mt_MemoryBankStart4"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 4b <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart4", Seconds = 0.25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart4"},
			DialogBegin	{Player = "default", Tag = "MemoryBank"},
			EventReEnable	{Name = "MemoryBankDialogBackA"},
			EventReEnable	{Name = "MemoryBankDialogBackB"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 5 <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 730, Amount = 1},
		},
		Actions =
		{
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
			ObjectVanish	{Tag = "MemoryBankDialogBack"},
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "MemoryBankDialogBack"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock1"},
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStart	{Name = "mt_MemoryBankStart"},
			MapTimerStart	{Name = "mt_MemoryBankStart5"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 5b <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart5", Seconds = 0.25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart5"},
			DialogBegin	{Player = "default", Tag = "MemoryBank"},
			EventReEnable	{Name = "MemoryBankDialogBackA"},
			EventReEnable	{Name = "MemoryBankDialogBackB"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 6 teleport <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 729, Amount = 1},
		},
		Actions =
		{		
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
			ObjectVanish	{Tag = "MemoryBankDialogBack"},
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "MemoryBankDialogBack"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WPSecondBlock1"},
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStart	{Name = "mt_MemoryBankStart"},
			MapTimerStart	{Name = "mt_MemoryBankStart6"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Dialog with Memory Bank 6b <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart6", Seconds = 0.25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart6"},
			DialogBegin	{Player = "default", Tag = "MemoryBank"},
			EventReEnable	{Name = "MemoryBankDialogBackA"},
			EventReEnable	{Name = "MemoryBankDialogBackB"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Dialog back to Memory Bank timer <<<",
		Name = "MemoryBankDialogBackA",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankStart", Seconds = 0.4},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankStart"},
			MapTimerStart	{Name = "mt_MemoryBankEnded"},
			EventReEnable	{Name = "MemoryBankDialogBackC"},
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Blackout.tga", BlendDuration = 0.1 },
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Dialog back to Memory Bank <<<",
		Name = "MemoryBankDialogBackB",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankEnded", Seconds = 0.25},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MemoryBankDialogBack"},			
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Color back to Memory Bank <<<",
		Name = "MemoryBankDialogBackC",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MemoryBankEnded", Seconds = 1},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_MemoryBankEnded"},
			ColorGradingChange {LUTFile = "", BlendDuration = 0.5 },
		},
	},
]]
	OnOneTimeEvent
	{
		EventName = ">>> Memory Banks found <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_Sariel_MQ_03_2"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_MQ_03_1_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_1_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_03_1"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_1_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_03_1.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_1_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_MQ_03_1.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_MQ_03_1.Gold },	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_MQ_03_1.Gold},		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_MQ_03_1.Gold},		
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_1_completed", Seconds = 15},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ------------------------------------------- Rage
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_1_completed", Seconds = 30},
			MapFlagIsTrue {Name = "mf_P707_TrueStory"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryRage101", Tag = "Sariel"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Rage
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_1_completed", Seconds = 70},
			MapFlagIsTrue {Name = "mf_P707_TrueStory"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryRage201", Tag = "Sariel"},
		},
	},

	OnLeverEvent
	{
		Delay = 5,
		Lever = "MindProbeGateInLever",
		OnConditions = 
		{
			GateIsClosed {Tag = "MindProbeGateIn"},
		},
		Actions = 
		{
			GateSetOpen {Tag = "MindProbeGateIn"},
			GateSetOpen {Tag = "MindProbeGateOut"},
			EntityTimerStart {Name = "et_MindProbeIn"},
			EventReEnable {Name = "MPRT_In"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>>> Teleport to the Minde Probe Room <<<<",
		Name = "MPRT_In",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_MindProbeIn", Seconds = 3},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_MindProbeIn"},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "MindProbeRoomIn"},
			--FigureTeleportToEntity {Tag = "Sariel", TargetTag = "MindProbeRoomIn"},
			GateSetClosed {Tag = "MindProbeGateIn"},
			GateSetClosed {Tag = "MindProbeGateOut"},
		},
	},

	OnLeverEvent
	{
		Delay = 5,
		Lever = "MindProbeGateOutLever",
		OnConditions = 
		{
			GateIsClosed {Tag = "MindProbeGateOut"},
		},
		Actions = 
		{
			GateSetOpen {Tag = "MindProbeGateOut"},
			GateSetOpen {Tag = "MindProbeGateIn"},
			EntityTimerStart {Name = "et_MindProbeOut"},
			EventReEnable {Name = "MPRT_Out"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>>> Teleport from the Mind Probe Room <<<<",
		Name = "MPRT_Out",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_MindProbeOut", Seconds = 3},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_MindProbeOut"},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "MindProbeRoomOut"},
			GateSetClosed {Tag = "MindProbeGateOut"},
			GateSetClosed {Tag = "MindProbeGateIn"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Avatar reached the area <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "MindProbeRoomIn", Range = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_MQ_03_2_Done"},
			MapFlagSetTrue {Name = "mf_P707_Sariel_MQ_03_3"},
			DialogSetEnabled	{Tag = "MindProbeMachine"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Avatar reached the out area <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "MindProbeRoomOut", Range = 10},
			MapFlagIsTrue {Name = "mf_P707_TrueStory"},
			MapFlagIsTrue {Name = "mf_P707_MQ_03_2_Done"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryRage401", Tag = "Sariel"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Mind Probe found <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_Sariel_MQ_03_3"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_MQ_03_2_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_2_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_03_2"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_2_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_03_2.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_2_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_MQ_03_2.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_MQ_03_2.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_MQ_03_2.Gold},			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_MQ_03_2.Gold},			
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_2_completed", Seconds = 15},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ------------------------------------------- Rage
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_2_completed", Seconds = 40},
			MapFlagIsTrue {Name = "mf_P707_TrueStory"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_03_2_completed"},
			FigureOutcry	{TextTag = "cryRage301", Tag = "Sariel"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Energy cells looted <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 731, Amount = 6},
			MapFlagIsTrue {Name = "mf_P707_TrueStory"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P707_TrueStory"},
			EntityTimerStart	{Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryRage501", Tag = "Sariel"},
			FigureOutcry	{TextTag = "cryRage502", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "cryRage503", Tag = "Sariel"},			
			EntityTimerStop {Name = "et_CStimer"},			
		},	
	},	
	
	OnOneTimeEvent
	{
		EventName = ">>> Put in the Energy Canisters <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_Sariel_MQ_03_4"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Sariel"},
			MapTimerStart	{Name = "mt_SSSR_MQ_03_3_completed"},
		},
	},
	
		OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_3_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_03_3"},
			ObjectSpawn	{ObjectId = 2520, X = 337.338, Y = 694.823, Direction = 45, Tag = "MPSource"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_3_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_03_3.XP },
			ObjectSpawn	{ObjectId = 2520, X = 313.978, Y = 694.831, Direction = 135, Tag = "MPReader"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_3_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_MQ_03_3.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_MQ_03_3.Gold },		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_MQ_03_3.Gold},	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_MQ_03_3.Gold},	
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_3_completed", Seconds = 20},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_03_3_completed"},
			MapFlagSetTrue {Name = "mf_P707_CS_05_Start"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_05_Start"},
			MapFlagIsFalse {Name = "mf_P707_CS_05_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_05 ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_05_Ended"},
		},
		Actions =
		{
			PlayerTravelDisable	{},
			MapTimerStart	{Name = "mt_SSSR_MQ_03_4_start"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_05 ended + 5mp Easy <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_start", Seconds = 5},
			GameDifficulty {Value = 1},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureNpcSpawnToEntity {Tag = "Barrier1", Level = 10, UnitId = 129, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier1Alive"},
		},
	},
	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_05 ended + 5mp Normal <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_start", Seconds = 5},
			GameDifficulty {Value = 2},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureNpcSpawnToEntity {Tag = "Barrier1", Level = 12, UnitId = 129, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier1Alive"},
		},
	},
	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_05 ended + 5mp Diff<<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_start", Seconds = 5},
			GameDifficulty {Value = 3},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureNpcSpawnToEntity {Tag = "Barrier1", Level = 14, UnitId = 129, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier1Alive"},
		},
	},
	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_05 ended + 5mp VDiff <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_start", Seconds = 5},
			GameDifficulty {Value = 4},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureNpcSpawnToEntity {Tag = "Barrier1", Level = 16, UnitId = 129, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier1Alive"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> Sariel Outcry Alone <<<",
		Name = "SarielOutcry",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_OutcryAlone"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryMPAlone1", Tag = "Sariel"},
			MapTimerStart	{Name = "mt_SSSR_SarielOutcry"},
			EventReEnable	{Name = "SarielOutcryBack"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Sariel Outcry Alone activator <<<",
		Name = "SarielOutcryBack",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SarielOutcry", Seconds = 5},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P707_OutcryAlone"},
			EventReEnable	{Name = "SarielOutcry"},
		},
	},

	OnEvent
	{
		EventName = ">>> StepIn <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsInRangeToEntity	{Tag = "Surian", TargetTag = "Pentagram", Range = 80},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "Surian", TargetTag = "CS03Place"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},
	OnEvent
	{
		EventName = ">>> StepIn <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Pentagram", Range = 80},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "CS03Place"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},
	OnEvent
	{
		EventName = ">>> StepIn <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Pentagram", Range = 80},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "CS03Place"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},
	OnEvent
	{
		EventName = ">>> StepIn <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Pentagram", Range = 80},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "CS03Place"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},
	OnEvent
	{
		EventName = ">>> StepIn <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Pentagram", Range = 80},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "CS03Place"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},
	OnEvent
	{
		EventName = ">>> StepIn <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Pentagram", Range = 80},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "CS03Place"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},
	OnEvent
	{
		EventName = ">>> StepOut <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pentagram", Range = 40},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			MapFlagSetTrue {Name = "mf_P707_OutcryAlone"},
		},
	},


	OnEvent
	{
		EventName = ">>> Barrier1 Defeated <<<",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_Barrier1Alive"},
			FigureIsDead {Tag = "Barrier1"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_Barrier1Alive"},
			FigureOutcry	{TextTag = "cryMDef01", Tag = "Sariel"},
			EntityTimerStart {Name = "et_Barrier1Timer"},			
		},
	},
			
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier1Timer", Seconds = 6},
			GameDifficulty {Value = 1},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier1Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier2", Level = 9, UnitId = 424, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier2Alive"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier1Timer", Seconds = 6},
			GameDifficulty {Value = 2},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier1Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier2", Level = 11, UnitId = 424, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier2Alive"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier1Timer", Seconds = 6},
			GameDifficulty {Value = 3},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier1Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier2", Level = 13, UnitId = 424, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier2Alive"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier1Timer", Seconds = 6},
			GameDifficulty {Value = 4},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier1Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier2", Level = 15, UnitId = 424, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier2Alive"},
		},
	},

	OnEvent
	{
		EventName = ">>> Barrier2 Defeated <<<",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_Barrier2Alive"},
			FigureIsDead {Tag = "Barrier2"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_Barrier2Alive"},
			FigureOutcry	{TextTag = "cryMDef02", Tag = "Sariel"},
			EntityTimerStart {Name = "et_Barrier2Timer"},			
		},
	},
			
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier2Timer", Seconds = 6},
			GameDifficulty {Value = 1},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier2Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier3", Level = 9, UnitId = 2238, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier3Alive"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier2Timer", Seconds = 6},
			GameDifficulty {Value = 2},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier2Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier3", Level = 10, UnitId = 2238, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier3Alive"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier2Timer", Seconds = 6},
			GameDifficulty {Value = 3},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier2Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier3", Level = 11, UnitId = 2238, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier3Alive"},
		},
	},
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier2Timer", Seconds = 6},
			GameDifficulty {Value = 4},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier2Timer"},			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "ReaderPoint"},
			FigureNpcSpawnToEntity {Tag = "Barrier3", Level = 12, UnitId = 2238, TargetTag = "SourcePoint", Team = "tm_Team2"},
			EntityFlagSetTrue {Name = "ef_Barrier3Alive"},
		},
	},

	OnEvent
	{
		EventName = ">>> Barrier3 Defeated <<<",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_Barrier3Alive"},
			FigureIsDead {Tag = "Barrier3"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_Barrier3Alive"},
			FigureOutcry	{TextTag = "cryMDef03", Tag = "Sariel"},
			EntityTimerStart {Name = "et_Barrier3Timer"},		
			MapFlagSetTrue {Name = "mf_P707_MindhackDone"},	
		},
	},
			
	OnOneTimeEvent 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Barrier3Timer", Seconds = 6},
		},
		Actions =
		{		
			EntityTimerStop {Name = "et_Barrier3Timer"},			
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_03_4"},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "MindProbeRoomOut"},
			MapFlagSetTrue {Name = "mf_P707_CS_06_Start"},
			FigureTeleportToEntity {Tag = "Shae", TargetTag = "P2Shae"},
			FigureTeleportToEntity {Tag = "Ayro", TargetTag = "P2Ayro"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Died during Mind fight <<<",
		Conditions = 
		{
			QuestIsActive {Player = "pl_Human", Quest = "SSSR_MQ_03_4"},
			FigureIsDead	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			PlayerGameOver {Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title"},
		},
	},			
	
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_06_Start"},
			MapFlagIsFalse {Name = "mf_P707_CS_06_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_06 ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_06_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_MQ_03_4_completed"},
			PlayerTravelEnable	{},
			DialogSetEnabled	{Tag = "Shae"},
			DialogSetEnabled	{Tag = "Ayro"},
			FigureVanish {Tag = "Sariel"},
			PlayerHeroAdd { HeroId = 262 },
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "CompanionSariel", TargetTag = "MindProbeRoomOut", Direction = 90},},			
			DialogSetDisabled	{Tag = "pl_HumanCompanionSariel"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_03_4"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_03_4.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_MQ_03_4.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_MQ_03_4.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_MQ_03_4.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_MQ_03_4.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_completed", Seconds = 15},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_03_4_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_03_4_completed"},
		},
		GotoState = "MQ_03 FINISHED",
	},
	
};			


State --**************************************************** Finish state
{
	StateName = "MQ_03 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest MQ_03 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_03"},
		},
	},
};

