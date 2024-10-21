-- ***************************************************************************
-- ** Handling Main Quest 05 																								**
-- ***************************************************************************

local Adventurer1 = "pl_HumanAvatar";
local Adventurer2 = "pl_HumanHeroCaine";
local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Quest MQ_05 init <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05"},
		},
		Actions =
		{
		},
		GotoState = "MQ_05 Run",
	},
};


State --**************************************************** MainQuest State
{
	StateName = "MQ_05 Run",

	OnOneTimeEvent	
	{
		EventName = ">>> CS_01 finished <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05"},
			MapFlagIsTrue {Name = "mf_P708_CS_01_Ended"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_05_1"},
			MapFlagSetFalse {Name = "mf_P708_ShadowGuideMet"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Shadowguide meeting <<<",
		Conditions = 
		{
			GateIsOpen	{Tag = "Gate01"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Enemy", PlayerKit = "pk_Sorvina"},
			PlayerActivate	{Player = "pl_Enemy"},
			MapTimerStart	{Name = "mt_Gate01Opened"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Shadowguide meeting <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_Gate01Opened", Seconds = 3},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_Gate01Opened"},
			MapFlagSetTrue {Name = "mf_P708_CS_02_Start"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_02_Start"},
			MapFlagIsFalse {Name = "mf_P708_CS_02_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Shadowguide met <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_02_Ended"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_ShadowGuideMet"},
			MapValueSet	{Name = "mv_MMCount", Value = 0},
			MapTimerStart	{Name = "mt_SSSR_MQ_05_1_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_1_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_05_1"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_1_completed", Seconds = 10},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_05_1.XP },
			QuestSetActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			QuestSetActive	{Player = "default", Quest = "SSSR_MQ_05_2"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_1_completed", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_05_1_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> SSSR_MQ_05_2 Started <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_2"},
		},
		Actions =
		{
			PlayerKitTransfer {Player = "default", PlayerKit = "pk_shadow"},
			AvatarSilverGive {Player = "default", Amount = 100},

			PlayerBuildingAdd	{BuildingId = 133},
			PlayerBuildingAdd	{BuildingId = 134},
			PlayerBuildingAdd	{BuildingId = 136},
			--PlayerBuildingAdd	{BuildingId = 137},
			PlayerBuildingAdd	{BuildingId = 138},
			PlayerBuildingAdd	{BuildingId = 139},
			PlayerBuildingAdd	{BuildingId = 140},
			--PlayerBuildingAdd	{BuildingId = 141},
			--PlayerBuildingAdd	{BuildingId = 142},
			--PlayerBuildingAdd	{BuildingId = 143},
			PlayerBuildingAdd	{BuildingId = 144},
			--PlayerBuildingAdd	{BuildingId = 145},
			PlayerBuildingAdd	{BuildingId = 146},
			PlayerBuildingAdd	{BuildingId = 147},
			
			--PlayerBuildingUpgradeAdd	{UpgradeId = 26},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 24},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 28},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 20},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 30},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 22},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 36},
			PlayerBuildingUpgradeAdd	{UpgradeId = 38},
			PlayerBuildingUpgradeAdd	{UpgradeId = 32},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18},
			--PlayerBuildingUpgradeAdd	{UpgradeId = 34},
		},
	},

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Demon HQs are down <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_2"},
			BuildingIsDead {Tag = "DemonHQ1"},
			BuildingIsDead {Tag = "DemonHQ2"},
			BuildingIsDead {Tag = "DemonHQ3"},
			FigureTeamIsNotInRange {Team = "tm_Team2", Range = 40, X = 225 , Y = 275},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_MQ_05_2_Done"},
			MapTimerStart	{Name = "mt_SSSR_MQ_05_2_completed"},
			FigureTeleportToEntity	{Tag = "Shadowwarrior", TargetTag = "SWPlace"},
			FigureDirectionSet	{Tag = "Shadowwarrior", Direction = 270},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_2_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_05_2"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_2_completed", Seconds = 10},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_05_2.XP },
		},
	},

	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_2_completed", Seconds = 15 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_MQ_05_2.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_MQ_05_2.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_MQ_05_2.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_MQ_05_2.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_2_completed", Seconds = 20},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_05_2_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM1 Touch <<<",
		Name = "MM1_Touch",
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_MM1_Discharged"},
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM1", Range = 5},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 1},
			ObjectLootItemMiscAdd	{Tag = "MM1", DropChance = 100, ItemId = 742},
			EventReEnable	{Name = "MM1_NoTouch"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM1 NoTouch <<<",
		Name = "MM1_NoTouch",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			EntityFlagIsFalse	{Name = "ef_MM1_Discharged"},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 1 },
			AvatarHasNotItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM1", Range = 5},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			}
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			ObjectLootItemMiscRemove	{Tag = "MM1", ItemId = 742},
			EventReEnable	{Name = "MM1_Touch"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> MM1 Drained <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 1 },
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_MM1_Discharged"},
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			AvatarItemMiscTake	{Player = "default", ItemId = 742, Amount = 1},
			FigureKill	{Tag = "pl_HumanAvatar"},
			MapValueIncrease	{Name = "mv_MMCount"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM2 Touch <<<",
		Name = "MM2_Touch",
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_MM2_Discharged"},
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM2", Range = 5},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 2},
			ObjectLootItemMiscAdd	{Tag = "MM2", DropChance = 100, ItemId = 742},
			EventReEnable	{Name = "MM2_NoTouch"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM2 NoTouch <<<",
		Name = "MM2_NoTouch",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			EntityFlagIsFalse	{Name = "ef_MM2_Discharged"},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 2 },
			AvatarHasNotItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM2", Range = 5},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			}
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			ObjectLootItemMiscRemove	{Tag = "MM2", ItemId = 742},
			EventReEnable	{Name = "MM2_Touch"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> MM2 Drained <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 2 },
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_MM2_Discharged"},
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			AvatarItemMiscTake	{Player = "default", ItemId = 742, Amount = 1},
			FigureKill	{Tag = "pl_HumanAvatar"},
			MapValueIncrease	{Name = "mv_MMCount"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM3 Touch <<<",
		Name = "MM3_Touch",
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_MM3_Discharged"},
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM3", Range = 5},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 3},
			ObjectLootItemMiscAdd	{Tag = "MM3", DropChance = 100, ItemId = 742},
			EventReEnable	{Name = "MM3_NoTouch"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM3 NoTouch <<<",
		Name = "MM3_NoTouch",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			EntityFlagIsFalse	{Name = "ef_MM3_Discharged"},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 3 },
			AvatarHasNotItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM3", Range = 5},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			}
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			ObjectLootItemMiscRemove	{Tag = "MM3", ItemId = 742},
			EventReEnable	{Name = "MM3_Touch"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> MM3 Drained <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 3 },
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_MM3_Discharged"},
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			AvatarItemMiscTake	{Player = "default", ItemId = 742, Amount = 1},
			FigureKill	{Tag = "pl_HumanAvatar"},
			MapValueIncrease	{Name = "mv_MMCount"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM4 Touch <<<",
		Name = "MM4_Touch",
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_MM4_Discharged"},
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM4", Range = 5},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 4},
			ObjectLootItemMiscAdd	{Tag = "MM4", DropChance = 100, ItemId = 742},
			EventReEnable	{Name = "MM4_NoTouch"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM4 NoTouch <<<",
		Name = "MM4_NoTouch",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			EntityFlagIsFalse	{Name = "ef_MM4_Discharged"},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 4 },
			AvatarHasNotItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM4", Range = 5},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			}
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			ObjectLootItemMiscRemove	{Tag = "MM4", ItemId = 742},
			EventReEnable	{Name = "MM4_Touch"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> MM4 Drained <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 4 },
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_MM4_Discharged"},
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			AvatarItemMiscTake	{Player = "default", ItemId = 742, Amount = 1},
			FigureKill	{Tag = "pl_HumanAvatar"},
			MapValueIncrease	{Name = "mv_MMCount"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM5 Touch <<<",
		Name = "MM5_Touch",
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_MM5_Discharged"},
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM5", Range = 5},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 5},
			ObjectLootItemMiscAdd	{Tag = "MM5", DropChance = 100, ItemId = 742},
			EventReEnable	{Name = "MM5_NoTouch"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM5 NoTouch <<<",
		Name = "MM5_NoTouch",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			EntityFlagIsFalse	{Name = "ef_MM5_Discharged"},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 5 },
			AvatarHasNotItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM5", Range = 5},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			}
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			ObjectLootItemMiscRemove	{Tag = "MM5", ItemId = 742},
			EventReEnable	{Name = "MM5_Touch"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> MM5 Drained <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 5 },
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_MM5_Discharged"},
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			AvatarItemMiscTake	{Player = "default", ItemId = 742, Amount = 1},
			FigureKill	{Tag = "pl_HumanAvatar"},
			MapValueIncrease	{Name = "mv_MMCount"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM6 Touch <<<",
		Name = "MM6_Touch",
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_MM6_Discharged"},
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM6", Range = 5},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 6},
			ObjectLootItemMiscAdd	{Tag = "MM6", DropChance = 100, ItemId = 742},
			EventReEnable	{Name = "MM6_NoTouch"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> MM6 NoTouch <<<",
		Name = "MM6_NoTouch",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			EntityFlagIsFalse	{Name = "ef_MM6_Discharged"},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 6 },
			AvatarHasNotItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			OR
			{
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MM6", Range = 5},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			}
		},
		Actions =
		{
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			ObjectLootItemMiscRemove	{Tag = "MM6", ItemId = 742},
			EventReEnable	{Name = "MM6_Touch"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> MM6 Drained <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 742, Amount = 1},
			EntityValueIsEqual	{Player = "default", Name = "ev_MM_Akt", Value = 6 },
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_MM6_Discharged"},
			EntityValueSet	{Player = "default", Name = "ev_MM_Akt", Value = 0},
			AvatarItemMiscTake	{Player = "default", ItemId = 742, Amount = 1},
			FigureKill	{Tag = "pl_HumanAvatar"},
			MapValueIncrease	{Name = "mv_MMCount"},
		},
	},	

	OnOneTimeEvent -----Outcry1
	{
		EventName = ">>> Respawn outcry1 <<<",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			MapValueIsEqual	{Name = "mv_MMCount", Value = 1},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryRevived1", Tag = "pl_HumanAvatar"},
		},
	},

	OnOneTimeEvent -----Outcry2
	{
		EventName = ">>> Respawn outcry2 <<<",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			MapValueIsEqual	{Name = "mv_MMCount", Value = 2},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryRevived2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryRevived3", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryRevived4", Tag = "pl_HumanAvatar"},
		},
	},

	OnOneTimeEvent -----Outcry3
	{
		EventName = ">>> Respawn outcry3 <<<",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			MapValueIsEqual	{Name = "mv_MMCount", Value = 4},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryDragon1", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryDragon2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryDragon3", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryDragon4", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryDragon5", Tag = "Surian"},
			FigureOutcry	{TextTag = "cryDragon6", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryDragon7", Tag = "Surian"},
		},
	},

	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Towers killed <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_3"},
			MapValueIsEqual	{Name = "mv_MMCount", Value = 6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_MQ_05_3_Done"},
			MapTimerStart	{Name = "mt_SSSR_MQ_05_3_completed"},
			FigureTeleportToEntity	{Tag = "Shadowwarrior", TargetTag = "SWPlace"},
			FigureDirectionSet	{Tag = "Shadowwarrior", Direction = 270},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_3_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_05_3"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_3_completed", Seconds = 10},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_05_3.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_3_completed", Seconds = 15 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SSSR_MQ_05_3.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SSSR_MQ_05_3.Gold },			
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SSSR_MQ_05_3.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SSSR_MQ_05_3.Gold},
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_3_completed", Seconds = 20},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_05_3_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},

	OnOneTimeEvent ----------------------------------------- Dialogstart
	{
		EventName = ">>> Silly quest are done <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_05_2"},
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_05_3"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SWDialogStart"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Silly quest are done - Dialogstart <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SWDialogStart", Seconds = 5},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SWDialogStart"},
			DialogSetEnabled	{Tag = "Shadowwarrior"},
		},
	},
			
			
	OnOneTimeEvent -------------------- Shadowwarrior walking
	{
		EventName = ">>> Report is done <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_ShadowWarriorQuests_Reported"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Shadowwarrior"},
			LeverSetDisabled	{Tag = "Lever3a"},
			LeverSetDisabled	{Tag = "Lever3b"},
			LeverSetDisabled	{Tag = "Lever4a"},
			LeverSetDisabled	{Tag = "Lever4b"},
			GateSetOpen	{Tag = "Gate04"},
			GateSetOpen	{Tag = "Gate03"},
			FigureForcedWalkToEntity	{Tag = "Shadowwarrior", TargetTag = "Seal3Hide"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Reached the area with Shadowwarrior <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_4"},
			FigureIsInRangeToEntity	{Tag = "Shadowwarrior" , TargetTag = "Seal3Hide", Range = 15},
		},
		Actions =
		{
			LeverSetEnabled	{Tag = "Lever3a"},
			LeverSetEnabled	{Tag = "Lever3b"},
			LeverSetEnabled	{Tag = "Lever4a"},
			LeverSetEnabled	{Tag = "Lever4b"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Reached the area with the avatar <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_05_4"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Seal3Hide", Range = 15},
		},
		Actions =
		{	
			QuestSetSolved {Player = "default", Quest = "SSSR_MQ_05_4"},
			MapFlagSetTrue {Name = "mf_P708_BeastGoDown"},
			MapFlagSetTrue {Name = "mf_P708_CS_03_Start"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_03_Start"},
			MapFlagIsFalse {Name = "mf_P708_CS_03_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	
	
	OnOneTimeEvent 
	{
		EventName = ">>> Headstart over <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_03_Ended"},			
		},
		Actions =
		{			
			UIBossfightPanelShow { UnitTag1 = "SealBeast", UnitTag2 = "", PortraitImage = "boss_P708_sealbeast", DisplayName = Boss_P708_SealBeast},
		},	
	},	

-----------------------------------
--------  Running Control
-----------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate3 Down - Big circle <<<",
		Name = "GoDown",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_BeastGoDown"},
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "WPSecondBlock9", Range = 6},
			GateIsOpen	{Tag = "Gate03"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Gate04Down"}, Tags = {"WPFirstBlock1", "WPFirstBlock7", "WPFirstBlock6", "WPFirstBlock5", "WPFirstBlock4", "WPFirstBlock3", "WPFirstBlock2", "WPFirstBlock1", "WPSecondBlock9", "WPSecondBlock8", "WPSecondBlock6", "WPSecondBlock5", "WPSecondBlock19", "WPSecondBlock17", "WPSecondBlock13", "WPSecondBlock12", "WPSecondBlock10", "WPSecondBlock9"}},
			EventReEnable	{Name = "DirChangeUp"},
			EventReEnable	{Name = "GoUp"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate4 Up - Big circle <<<",
		Name = "GoUp",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P708_BeastGoDown"},
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "WPFirstBlock1", Range = 6},
			GateIsOpen	{Tag = "Gate04"},
		},
		Actions =
		{
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Gate03Up"}, Tags = {"WPSecondBlock9", "WPSecondBlock8", "WPSecondBlock6", "WPSecondBlock5", "WPSecondBlock19", "WPSecondBlock17", "WPSecondBlock13", "WPSecondBlock12", "WPSecondBlock10", "WPSecondBlock9"}},
			EventReEnable	{Name = "DirChangeDown"},
			EventReEnable	{Name = "GoDown"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate3 Down - Upper circle <<<",
		Name = "StayUp",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_BeastGoDown"},
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "WPSecondBlock9", Range = 6},
			GateIsClosed	{Tag = "Gate03"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "WPSecondBlock8"}, Tags = {"WPSecondBlock6", "WPSecondBlock5", "WPSecondBlock19", "WPSecondBlock17", "WPSecondBlock13", "WPSecondBlock12", "WPSecondBlock10", "WPSecondBlock9"}},
			EventReEnable	{Name = "DirChangeDown"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate4 Up - Lower circle <<<",
		Name = "StayDown",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P708_BeastGoDown"},
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "WPFirstBlock1", Range = 6},
			GateIsClosed	{Tag = "Gate04"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "WPFirstBlock7"}, Tags = {"WPFirstBlock6", "WPFirstBlock5", "WPFirstBlock4", "WPFirstBlock3", "WPFirstBlock2", "WPFirstBlock1"}},
			EventReEnable	{Name = "DirChangeUp"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast change direction up <<<",
		Name = "DirChangeUp",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "WPFirstBlock4", Range = 6},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P708_BeastGoDown"},
			EventReEnable	{Name = "DirChangeDown"},
			EventReEnable	{Name = "StayDown"},
			EventReEnable	{Name = "GoUp"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast change direction down <<<",
		Name = "DirChangeDown",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "WPSecondBlock17", Range = 6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_BeastGoDown"},
			EventReEnable	{Name = "DirChangeUp"},
			EventReEnable	{Name = "StayUp"},
			EventReEnable	{Name = "GoDown"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate4 Down - Upper circle <<<",
		Name = "Gate04CheckDown",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_BeastGoDown"},
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "Gate04Down", Range = 6},
			GateIsClosed	{Tag = "Gate04"},
			GateIsOpen	{Tag = "Gate03"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Gate03Up"}, Tags = {"WPSecondBlock9", "WPSecondBlock8", "WPSecondBlock6", "WPSecondBlock5", "WPSecondBlock19", "WPSecondBlock17", "WPSecondBlock13", "WPSecondBlock12", "WPSecondBlock10", "WPSecondBlock9"}},
			MapFlagSetFalse {Name = "mf_P708_BeastGoDown"},
			EventReEnable	{Name = "DirChangeDown"},
			EventReEnable	{Name = "Gate03CheckUp"},
			EventReEnable	{Name = "Trapped"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate3 up - Lower circle <<<",
		Name = "Gate03CheckUp",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P708_BeastGoDown"},
			FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "Gate03Up", Range = 6},
			GateIsClosed	{Tag = "Gate03"},
			GateIsOpen	{Tag = "Gate04"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Gate04Down"}, Tags = {"WPFirstBlock1", "WPFirstBlock7", "WPFirstBlock6", "WPFirstBlock5", "WPFirstBlock4", "WPFirstBlock3", "WPFirstBlock2", "WPFirstBlock1"}},
			MapFlagSetFalse {Name = "mf_P708_BeastGoDown"},
			EventReEnable	{Name = "DirChangeUp"},
			EventReEnable	{Name = "Gate03CheckDown"},
			EventReEnable	{Name = "Trapped"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast at Gate3 up - Lower circle <<<",
		Name = "Trapped",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "Gate04Down", Range = 6},
				FigureIsInRangeToEntity	{Tag = "SealBeast" , TargetTag = "Gate03Down", Range = 6},
			},
			GateIsClosed	{Tag = "Gate03"},
			GateIsClosed	{Tag = "Gate04"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_BeastTrapped"},
			FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Trapped"},
			EventReEnable	{Name = "EscapeUp"},
			EventReEnable	{Name = "EscapeDown"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast Trapped - Escape up <<<",
		Name = "EscapeUp",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_BeastTrapped"},
			GateIsOpen	{Tag = "Gate03"},
		},
		Actions =
		{
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Gate03Up"}, Tags = {"WPSecondBlock9", "WPSecondBlock8", "WPSecondBlock6", "WPSecondBlock5", "WPSecondBlock19", "WPSecondBlock17", "WPSecondBlock13", "WPSecondBlock12", "WPSecondBlock10", "WPSecondBlock9"}},
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			MapFlagSetFalse {Name = "mf_P708_BeastGoDown"},
			EventReEnable	{Name = "Gate03CheckUp"},			
			EventReEnable	{Name = "Trapped"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> SealBeast Trapped - Escape down <<<",
		Name = "EscapeDown",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_BeastTrapped"},
			GateIsOpen	{Tag = "Gate04"},
		},
		Actions =
		{
			FigurePathGoto { Goto = FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "Gate04Down"}, Tags = {"WPFirstBlock1", "WPFirstBlock7", "WPFirstBlock6", "WPFirstBlock5", "WPFirstBlock4", "WPFirstBlock3", "WPFirstBlock2", "WPFirstBlock1"}},
			MapFlagSetFalse {Name = "mf_P708_BeastTrapped"},
			MapFlagSetTrue {Name = "mf_P708_BeastGoDown"},
			EventReEnable	{Name = "Gate04CheckDown"},			
			EventReEnable	{Name = "Trapped"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Boss dead
	{
		EventName = ">>> Boss dead <<<",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SSSR_MQ_05_5"},
			FigureIsDead {Tag = "SealBeast"},
		},
		Actions =
		{
			UIBossfightPanelHide {},	
		},
	},
	

	
	OnOneTimeEvent ----------------------------------------- Reward trigger
	{
		EventName = ">>> Last Seal is taken <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 722, Amount = 1},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SSSR_MQ_05_5_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_5_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_05_5"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_5_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_05_5.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_05_5_completed", Seconds = 6},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_05_5_completed"},
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
		GotoState = "MQ_05 FINISHED",
	},

};			


State --**************************************************** Finish state
{
	StateName = "MQ_05 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest MQ_05 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_05"},
		},
	},
};

