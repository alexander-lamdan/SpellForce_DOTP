
State
{
	StateName = "INIT",
	

	OnOneTimeEvent
	{
		EventName = ">>> Start a timer for CS2 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ1_Completed" },
		},
		
		Actions =
		{
			MapTimerStart {Name = "mt_P703_Start_CS2"},
			--FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "CS2_Ghost", Range = 30, Height = default},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Start the MQ2 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_CS2_Gate_Ended" },
		},
		
		Actions =
		{
			FigureVanish	{Tag = "spirit_MQ11a"}, -- first spirits are liberated
			FigureVanish	{Tag = "spirit_MQ11a_2"},
			FigureVanish	{Tag = "spirit_MQ11b"},
			FigureVanish	{Tag = "spirit_MQ11b_2"},
			FigureVanish	{Tag = "spirit_MQ11b_3"},
			FigureVanish	{Tag = "spirit_MQ11c"},
			FigureVanish	{Tag = "spirit_MQ11c_2"},
			
			--DialogSetEnabled	{Tag = "ghost_01"},
			--DialogSetEnabled	{Tag = "ghost_02"},
			--DialogSetEnabled	{Tag = "ghost_05"},
			DialogSetEnabled	{Tag = "ghost_03"},
			DialogSetEnabled	{Tag = "ghost_04"},
			DialogSetEnabled	{Tag = "ghost_06"},
			DialogSetEnabled	{Tag = "ghost_07"},
			DialogSetEnabled	{Tag = "ghost_08"},
			DialogSetEnabled	{Tag = "flink_01"},
			
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_02_City"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0201_Number"},
			FigureTeleport	{Tag = "pl_HumanHeroCaine",X =591.448 , Y =75.0429 },
			FigureTeleport	{Tag = "pl_HumanHeroFirst",X =589.948 , Y =73.6429 },
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar talks with flink <<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "flink_01", Range = 5 },
		},
		
		Actions =
		{
			DialogBegin	{Player = "default", Tag = "flink_01"},
			--FigureOutcry	{TextTag = "queue_10", Tag = "spirit_guard_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 7361 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_flink_01_finished"},
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 568.28, Y = 129.703},
			MapValueSet	{Name = "mv_Avatar_Number", Value = 7361},
			FigureOutcry	{TextTag = "queue_10", Tag = "spirit_guard_01"},
			AvatarItemMiscGive	{Player = "default", ItemId = 653, Amount = 1},
			DialogSetDisabled	{Tag = "flink_01"},
		},
	},
		
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 13 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_01_trade" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "queue_13", Tag = "spirit_guard_01"},
			MapValueSet	{Name = "mv_Avatar_Number", Value = 13 },
			DialogSetDisabled	{Tag = "ghost_01"},
			DialogSetDisabled	{Tag = "ghost_02"},
			DialogSetDisabled	{Tag = "ghost_03"},
			DialogSetDisabled	{Tag = "ghost_04"},
			DialogSetDisabled	{Tag = "ghost_05"},
			DialogSetDisabled	{Tag = "ghost_06"},
			DialogSetDisabled	{Tag = "ghost_07"},
			DialogSetDisabled	{Tag = "ghost_08"},
			ObjectVanish	{Tag = "invis_wall_01"},
			AvatarItemMiscGive	{Player = "default", ItemId = 645, Amount = 1}, -- gives 13
			AvatarItemMiscTake	{Player = "default", ItemId = 646, Amount = 1}, -- takes 42
			FigurePatrolWalk	{Tag = "spirit_guard_02",X = 605.705, Y = 153.685},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0201_Number"},
			DialogSetEnabled	{Tag = "historian_01"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			--MapTimerStart {Name = "mt_P703_Autosave_25s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0202_Info"},
			FigurePatrolWalk	{Tag = "flink_01",X = 606.56, Y = 154.33,}, 
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 42 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_02_trade" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "queue_12", Tag = "spirit_guard_01"},
			FigureOutcry	{TextTag = "queue_12b", Tag = "flink_01"},
			MapValueSet	{Name = "mv_Avatar_Number", Value = 42 },
			DialogSetDisabled	{Tag = "ghost_02"},
			AvatarItemMiscGive	{Player = "default", ItemId = 646, Amount = 1}, -- gives 42
			AvatarItemMiscTake	{Player = "default", ItemId = 647, Amount = 1}, -- takes 35
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 568.381, Y = 145.751},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 70 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_03_trade" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "queue_11", Tag = "spirit_guard_01"},
			MapValueSet	{Name = "mv_Avatar_Number", Value = 70 },
			DialogSetDisabled	{Tag = "ghost_03"},
			AvatarItemMiscGive	{Player = "default", ItemId = 648, Amount = 1}, -- gives 70
			AvatarItemMiscTake	{Player = "default", ItemId = 649, Amount = 1}, -- take 99
			DialogSetEnabled	{Tag = "ghost_01"},
			DialogSetEnabled	{Tag = "ghost_02"},
			DialogSetEnabled	{Tag = "ghost_05"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 99 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_04_trade" },
		},
		
		Actions =
		{
			MapValueSet	{Name = "mv_Avatar_Number", Value = 99 },
			DialogSetDisabled	{Tag = "ghost_04"},
			AvatarItemMiscGive	{Player = "default", ItemId = 649, Amount = 1}, --gives 99
			AvatarItemMiscTake	{Player = "default", ItemId = 650, Amount = 1}, --takes 111
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 35 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_05_trade" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "queue_11", Tag = "spirit_guard_01"},
			MapValueSet	{Name = "mv_Avatar_Number", Value = 35 },
			DialogSetDisabled	{Tag = "ghost_05"},
			AvatarItemMiscGive	{Player = "default", ItemId = 647, Amount = 1}, --give 35
			AvatarItemMiscTake	{Player = "default", ItemId = 648, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 649, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 650, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 651, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 652, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 653, Amount = 1},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 111 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_06_trade" },
		},
		
		Actions =
		{
			MapValueSet	{Name = "mv_Avatar_Number", Value = 111 },
			DialogSetDisabled	{Tag = "ghost_06"},
			AvatarItemMiscGive	{Player = "default", ItemId = 650, Amount = 1}, --give 111
			AvatarItemMiscTake	{Player = "default", ItemId = 651, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 652, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 653, Amount = 1},
			
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 3758 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_07_trade" },
		},
		
		Actions =
		{
			MapValueSet	{Name = "mv_Avatar_Number", Value = 3758 },
			DialogSetDisabled	{Tag = "ghost_07"},
			AvatarItemMiscGive	{Player = "default", ItemId = 651, Amount = 1}, --give 3758
			AvatarItemMiscTake	{Player = "default", ItemId = 652, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 653, Amount = 1},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 558.16, Y = 131.324 },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar gets the number 6488 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_08_trade" },
		},
		
		Actions =
		{
			MapValueSet	{Name = "mv_Avatar_Number", Value = 6488 },
			DialogSetDisabled	{Tag = "ghost_08"},
			AvatarItemMiscGive	{Player = "default", ItemId = 652, Amount = 1}, --give 6488
			AvatarItemMiscTake	{Player = "default", ItemId = 653, Amount = 1},
		},
	},
	
	OnEvent
	{
		EventName = ">>> spirit_guard_01 area is closed<<<",
		Conditions = 
		{
			MapFlagIsFalse{ Name = "mf_P703_spirit_guard_01_blocked" },
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "spirit_guard_01", Range = 5 },
		},
		
		Actions =
		{
			DialogBegin	{Player = "default", Tag = "spirit_guard_01"},
		},
	},
	
	OnEvent
	{
		EventName = ">>> Teleport away from spirit_guard_01 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_spirit_guard_01_blocked" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 546.691, Y = 156.898 },
			MapFlagSetFalse {Name = "mf_P703_spirit_guard_01_blocked"},
		},
	},
	
	
	OnEvent
	{
		EventName = ">>> spirit_guard_01 area is closed for Caine<<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "spirit_guard_01", Range = 5 },
		},
			
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanHeroCaine", X = 550.058, Y = 155.282 },
		},
	},
	OnEvent
	{
		EventName = ">>> spirit_guard_01 area is closed for First<<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "spirit_guard_01", Range = 5 },
		},
			
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanHeroFirst", X = 550.058, Y = 155.282},
		},
	},
	
	OnEvent
	{
		EventName = ">>> spirit_guard_02 area is closed until the number is right<<<",
		Conditions = 
		{
			MapFlagIsFalse{ Name = "mf_P703_spirit_guard_02_blocked" },
			MapFlagIsFalse{ Name = "mf_P703_spirit_guard_02_dialog" },
			MapValueIsNotEqual	{Name = "mv_Avatar_Number", Value = 13 },
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "spirit_guard_02", Range = 5 },
		},
		
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_spirit_guard_02_dialog"},
			DialogBegin	{Player = "default", Tag = "spirit_guard_02"},
		},
	},
	
	OnEvent
	{
		EventName = ">>> Teleport away from spirit_guard_02 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_spirit_guard_02_blocked" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 587.057, Y = 156.78},
			MapFlagSetFalse {Name = "mf_P703_spirit_guard_02_blocked"},
		},
	},
	

	OnEvent
	{
		EventName = ">>> spirit_guard_02 area is closed until the number is right<<<",
		Conditions = 
		{
			MapValueIsNotEqual	{Name = "mv_Avatar_Number", Value = 13 },
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "spirit_guard_02", Range = 5 },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanHeroCaine", X = 586.46, Y = 157.557 },
		},
	},
	OnEvent
	{
		EventName = ">>> spirit_guard_02 area is closed until the number is right<<<",
		Conditions = 
		{
			MapValueIsNotEqual	{Name = "mv_Avatar_Number", Value = 13 },
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "spirit_guard_02", Range = 5 },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanHeroFirst", X = 585.46, Y = 157.557 },
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Historian is finished <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_historian_01_completed" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "historian_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0202_Info"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_02_City"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 604.586, Y = 163.102 },
			
			MapFlagSetTrue {Name = "mf_P703_MQ2_Completed"},
		},
	},
	
	
	
	
}


