--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook2",
	
	--SideQuest 0
	OnOneTimeEvent
	{
		EventName = ">>> SQ0 enabled - kill the evil spirit's father too<<<",
		Conditions = 
		{
			FigureHasNotHealth	{Tag = "evil_spirit_07", Percent = 30},
		},
		
		Actions =
		{
			FigureTeamTransfer	{Tag = "evil_spirit_07", Team = "tm_Neutral"},
			MapFlagSetTrue {Name = "mf_P703_SQ0_Spirit_Talking"},
			FigureForcedWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "evil_spirit_07"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 210.237, Y = 46.8377},
			FigureTeleport	{Tag = "evil_spirit_07", X = 213.237, Y = 46.0377},
			--FigureTeleportToEntity	{Tag = "evil_spirit_07", TargetTag = "pl_HumanAvatar"},
			DialogBegin	{Player = "default", Tag = "evil_spirit_07"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ0 spirit killed before quest<<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_01"},
			QuestIsNotActive	{Player = "default", Quest = "ROTG_SQ_00_Father"},
		},
		
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_SQ0_Spirit_Killed_Early"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ0 accepted<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ0_Accepted" },
		},
		
		Actions =
		{
			FigureAbilityAdd	{Tag = "evil_spirit_01", AbilityId = 94},
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_00_Father"},
			FigureAbilityRemove	{Tag = "evil_spirit_07", AbilityId = 94},
			FigureKill	{Tag = "evil_spirit_07"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ0 refused<<<",
		Conditions = 
		{
			OR	
			{
				MapFlagIsTrue{ Name = "mf_P703_SQ0_Refused" },
				MapFlagIsTrue{ Name = "mf_P703_SQ0_Failed" },
			},
		},
		
		Actions =
		{
			FigureAbilityRemove	{Tag = "evil_spirit_07", AbilityId = 94},
			FigureKill	{Tag = "evil_spirit_07"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ0 enabled - kill the evil spirit's father too<<<",
		Conditions = 
		{
			FigureHasNotHealth	{Tag = "evil_spirit_01", Percent = 30},
			QuestIsActive	{Player = "default", Quest = "ROTG_SQ_00_Father"},
		},
		
		Actions =
		{
			FigureTeamTransfer	{Tag = "evil_spirit_01", Team = "tm_Neutral"},
			MapFlagSetTrue {Name = "mf_P703_SQ0_Father_Talking"},
			FigureForcedWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "evil_spirit_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 232.696, Y = 132.095 },
			FigureTeleport	{Tag = "evil_spirit_01", X = 234.696, Y = 133.095 },
			--FigureTeleportToEntity	{Tag = "evil_spirit_01", TargetTag = "pl_HumanAvatar"},
			DialogBegin	{Player = "default", Tag = "evil_spirit_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ0 spirit killed with the quest<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ0_Completed" },
		},
		
		Actions =
		{
			FigureAbilityRemove	{Tag = "evil_spirit_01", AbilityId = 94},
			FigureKill	{Tag = "evil_spirit_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_00_Father"},
			AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 50 },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 50 },
		},
	},
	
	
	--SideQuest 1
	OnOneTimeEvent
	{
		EventName = ">>> SQ1 accepted <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ1_Accepted" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_01_Own"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ1 - complete <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ1_Completed" },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_01_Own"},
			AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
			DialogSetDisabled	{Tag = "spirit_distraction_01"},
		},
	},
	
	--SideQuest 2
	OnOneTimeEvent
	{
		EventName = ">>> SQ2 started with fighting a monster <<<",
		Conditions = 
		{
			OR
			{
				FigureHasNotHealth	{Tag = "arena_wolf_01", Percent = 100},
				FigureHasNotHealth	{Tag = "arena_hornet_01", Percent = 100},
				FigureHasNotHealth	{Tag = "arena_spider_01", Percent = 100},
				FigureHasNotHealth	{Tag = "arena_beast_01", Percent = 100},
			},
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_02_Fun"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ2 completed - killed a monster <<<",
		Conditions = 
		{
			OR
			{
				FigureIsDead	{Tag = "arena_wolf_01"},
				FigureIsDead	{Tag = "arena_hornet_01"},
				FigureIsDead	{Tag = "arena_spider_01"},
				FigureIsDead	{Tag = "arena_beast_01"},
			},
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_02_Fun"},
			--AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> xp for killing a monster <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "arena_wolf_01"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 150},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> xp for killing a monster <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "arena_hornet_01"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 150},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> xp for killing a monster <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "arena_spider_01"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 150},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> xp for killing a monster <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "arena_beast_01"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 150},
		},
	},
	--SideQuest 3
	OnOneTimeEvent
	{
		EventName = ">>> SQ3 enabled -sad spirit in the arena<<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ROTG_MQ_0403_Boat"},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "sad_spirit_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ3 Accepted <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ3_Accepted" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_03_Kill"},
			FigureTeamTransfer	{Tag = "bear_01", Team = "tm_Creep"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> SQ3 completed = bear killed <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_SQ_03_Kill"},
			FigureIsDead	{Tag = "bear_01"},
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_03_Kill"},
			AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
		},
	},	
	
	--SideQuest 4
	OnOneTimeEvent
	{
		EventName = ">>> SQ4 Enabled <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ROTG_MQ_0501_Armory"},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "spirit_armory_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ4 Accepted - find the armor<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ4_Accepted" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_04_Armory"},
			DialogSetDisabled	{Tag = "spirit_armory_01"},
			DialogSetEnabled	{Tag = "arena_warbeast_01"},			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 261.017, Y = 461.035},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ4 fight for the loot<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_warbeast_fight_started" },
		},
		
		Actions =
		{
			FigureTeamTransfer	{Tag = "arena_warbeast_01", Team = "tm_Creep"},
			FigureLootItemMiscAdd	{Tag = "arena_warbeast_01", DropChance = 100, ItemId = 658},
			FigureLootItemMiscAdd	{Tag = "arena_warbeast_01", DropChance = 100, ItemId = 659},
			FigureLootItemMiscAdd	{Tag = "arena_warbeast_01", DropChance = 100, ItemId = 660},
			DialogSetDisabled	{Tag = "arena_warbeast_01"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> SQ4 Killed the monster for the armor<<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_SQ_04_Armory"},
			FigureIsDead	{Tag = "arena_warbeast_01"},
			AvatarHasItemMisc	{Player = "default", ItemId = 658, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 659, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 660, Amount = 1},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "spirit_armory_01"},
			MapFlagSetTrue {Name = "mf_P703_SQ4_Armor_Found"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ4 Finished - armors returned<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ4_Finished" },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_04_Armory"},
			AvatarItemMiscTake	{Player = "default", ItemId = 658, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 659, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 660, Amount = 1},
			AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
			DialogSetDisabled	{Tag = "spirit_armory_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 261.017, Y = 461.035},
		},
	},
	
	--SideQuest 5
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 Enabled - Feed the trolls<<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ROTG_MQ_0502_Defense"},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "hungry_spirit_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 Outcry <<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "hungry_spirit_01", Range = 23},
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "hungry_01", Tag = "hungry_spirit_02"},
			FigureOutcry	{TextTag = "hungry_02", Tag = "craig_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 Accepted <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Accepted" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "hungry_spirit_01"},
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_05_Dinner"},
			DialogSetEnabled	{Tag = "dinner_trap_01"},
			DialogSetEnabled	{Tag = "dinner_trap_02"},
			DialogSetEnabled	{Tag = "dinner_trap_03"},
			
			FigureOutcry	{TextTag = "feeding_01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "feeding_02", Tag = "craig_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 229.83, Y = 383.975},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 trap_01 disarmed<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_01_Disarmed" },
		},
		
		Actions =
		{
			FigureHealthSubtract	{Tag = "pl_HumanAvatar", Percent = 10},
			DialogSetDisabled	{Tag = "dinner_trap_01"},
			EffectStartAtEntityPosition	{Tag = "pl_HumanAvatar", File = "Effect_AreaPain_Cast"},
			ObjectVanish	{Tag = "dinner_trap_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 273.763, Y = 340.602 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 trap_02 disarmed<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_02_Disarmed" },
		},
		
		Actions =
		{
			FigureHealthSubtract	{Tag = "pl_HumanAvatar", Percent = 10},
			DialogSetDisabled	{Tag = "dinner_trap_02"},
			EffectStartAtEntityPosition	{Tag = "pl_HumanAvatar", File = "Effect_AreaPain_Cast"},
			ObjectVanish	{Tag = "dinner_trap_02"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 273.763, Y = 340.602 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 trap_03 disarmed<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_03_Disarmed" },
		},
		
		Actions =
		{
			FigureHealthSubtract	{Tag = "pl_HumanAvatar", Percent = 10},
			DialogSetDisabled	{Tag = "dinner_trap_03"},
			EffectStartAtEntityPosition	{Tag = "pl_HumanAvatar", File = "Effect_AreaPain_Cast"},
			ObjectVanish	{Tag = "dinner_trap_03"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 273.763, Y = 340.602 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ5 Completed <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_01_Disarmed" },
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_02_Disarmed" },
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_03_Disarmed" },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_05_Dinner"},
			AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
			DialogSetDisabled	{Tag = "hungry_spirit_01"},
		},
	},
	
	
	--SideQuest 6 : ROTG_SQ_06_Flap
	OnOneTimeEvent
	{
		EventName = ">>> SQ6 Enabled <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ROTG_MQ_0503_Hitting"},
		},
		
		Actions =
		{
			--DialogSetEnabled	{Tag = "overseer_01"},
			FigureTeleport	{Tag = "overseer_01", X = 578.548, Y = 334.142},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ6 Accepted <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ6_Accepted" },
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "spirit_flap_01"},
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_06_Flap"},
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 578.55, Y = 331.694 },
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ6 Completed <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ6_Completed" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "slap_01", Tag = "craig_01"},
			FigureOutcry	{TextTag = "slap_02", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "slap_03", Tag = "craig_01"},
			DialogSetDisabled	{Tag = "spirit_flap_01"},
			DialogSetDisabled	{Tag = "overseer_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_06_Flap"},
			AvatarXPGive	{Player = "pl_Human", Amount = 450},
			AvatarGoldGive	{Player = "default", Amount = 50},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 201.405, Y = 450.127},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ7 Twiddle - Activated <<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "twiddle_crystal_01", Range = 15},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "twiddle_crystal_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> SQ7 Twiddle - Accepted <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_twiddle_crystal_01_completed" },
		},
		
		Actions =
		{
			--QuestSetSolved	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},
			--AvatarGoldGive	{Player = "default", Amount = 50},
			--FigureOutcry	{TextTag = "twiddle_01", Tag = "twiddle_crystal_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 505.332, Y = 194.331},
			QuestSetActive	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Start zarach dialog for lvl8 <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_3"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "zarach"},
			ObjectLootItemMiscAdd	{Tag = "hadeko_chest", DropChance = 100, ItemId = 740 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Zarach dialog finished <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_zarach_completed" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 656.414, Y = 656.431 },
			AvatarItemMiscGive	{Player = "default", ItemId = 737, Amount = 1},
		},
	},
}
