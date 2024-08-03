State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ4_Cheat" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_ACT_01"},
			FigureTeleport	{Tag = "overseer_01", X = 623, Y = 348.4},				
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 578.548, Y = 334.142 },
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			
			FigureTeleport	{Tag = "craig_01", X = 573.548, Y = 331.142 },
			MapFlagSetTrue{ Name = "mf_P703_MQ3_Completed" },
			FigureFollowEntity	{Tag = "craig_01", TargetTag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "spirit_distraction_01"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ3_Completed" },
		},
		
		Actions =
		{
			MapTimerStart {Name = "mt_P703_Start_CS3"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_CS3_Gate_Ended" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_04_Arena"},
			FigureFollowEntity	{Tag = "craig_01", TargetTag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "spirit_distraction_01"},
			FigureVanish	{Tag = "ghost_04"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Open the gate with the help of a spirit<<<",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 20, X = 459.143, Y = 264.247},
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0401_District"},
			FigureOutcry	{TextTag = "craig_after_gate_01", Tag = "craig_01"},
			FigureOutcry	{TextTag = "craig_after_gate_02", Tag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "spirit_cons_01"},
			GateSetClosed	{Tag = "gate_02"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0402_Cons"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> scroll+ink lootable<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_spirit_cons_01_completed" },
		},
		
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "cabinet_01", DropChance = 100, ItemId = 656},
			ObjectLootItemMiscAdd	{Tag = "cabinet_02", DropChance = 100, ItemId = 657},
			DialogSetDisabled	{Tag = "spirit_cons_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 544.78, Y = 246.352 },
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> avatar got the scroll + ink <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 656, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 657, Amount = 1},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "spirit_cons_01"},
			MapFlagSetTrue{ Name = "mf_P703_spirit_cons_second" },
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> avatar got gate open spell <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_spirit_cons_02_completed" },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0402_Cons"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			DialogSetDisabled	{Tag = "spirit_cons_01"},
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
			AvatarItemMiscTake	{Player = "default", ItemId = 656, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 657, Amount = 1},
			FigureOutcry	{TextTag = "scroll_ink_01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "scroll_ink_02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "scroll_ink_03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "scroll_ink_04", Tag = "craig_01"},
			FigureOutcry	{TextTag = "scroll_ink_05", Tag = "pl_HumanAvatar"},
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 544.78, Y = 246.352 },
			FigureVanish	{Tag = "flink_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> avatar opens the gate and goes to find a boat <<<",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 459.143, Y = 264.247},
			MapFlagIsTrue{ Name = "mf_P703_spirit_cons_02_completed" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "open_gate_01", Tag = "pl_HumanAvatar"},
			GateSetOpen	{Tag = "gate_02"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0401_District"},
			ObjectVanish	{Tag = "gate_02_marker"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0403_Boat"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> boat outcries <<<",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 30, X = 368.136, Y = 383.668 },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "boat_01", Tag = "craig_01"},
			FigureOutcry	{TextTag = "boat_02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "boat_03", Tag = "craig_01"},
			FigureOutcry	{TextTag = "boat_04", Tag = "pl_HumanAvatar"},
			MapTimerStart {Name = "mt_P703_search_for_boat"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> avatar ties to find a boat <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_search_for_boat", Seconds = 15},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "boat_spirit_01"},
			DialogSetEnabled	{Tag = "boat_spirit_02"},
			DialogSetEnabled	{Tag = "boat_spirit_03"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_spirit_01_completed" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "boat_spirit_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 354.387, Y = 367.444},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_spirit_02_completed" },
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "boat_spirit_04"},
			DialogSetDisabled	{Tag = "boat_spirit_03"},
			DialogSetDisabled	{Tag = "boat_spirit_02"},
			DialogSetDisabled	{Tag = "boat_spirit_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 361.036, Y = 376.131},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_spirit_03_completed" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "boat_spirit_03"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 369.12, Y = 365.495},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_spirit_04_completed" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "boat_spirit_04_fight", X = 412.519, Y = 371.639 },
			FigureTeleport	{Tag = "boat_spirit_04", X = 664.451, Y = 672.868 },
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 412.538, Y = 371.134 },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureHasNotHealth	{Tag = "boat_spirit_04_fight", Percent = 50},
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "boat_spirit_04", X = 412.519, Y = 371.639 },
			FigureTeleport	{Tag = "boat_spirit_04_fight", X = 664.451, Y = 672.868 },
			MapFlagSetTrue{ Name = "mf_P703_boat_spirit_04_fight" },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> fight complete, boats found <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_spirit_04_fightcompleted" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "boat_spirit_04"},
			ObjectSpawn	{ObjectId = 2324, X = 390.625, Y = 377.903,  Direction = 0, Tag = "boat_01_dummy"},
			ObjectSpawn	{ObjectId = 2324, X = 446.052, Y = 469.336,  Direction = 130, Tag = "boat_02_dummy"},
			DialogSetEnabled	{Tag = "boat_01"},
			DialogSetEnabled	{Tag = "boat_02"},
			
			FigureOutcry	{TextTag = "conspiracy_01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "conspiracy_02", Tag = "craig_01"},
			FigureOutcry	{TextTag = "conspiracy_03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "conspiracy_04", Tag = "pl_HumanAvatar"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 412.538, Y = 371.134 },
		},
	},
	
	OnEvent
	{
		EventName = ">>> boat_01 used to cross the river <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_01_used" },
		},
		
		Actions =
		{
			--FigureTeleport	{Tag = "pl_HumanAvatar",X = 450.8, Y = 469 },
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "boat_01_avatar_marker"},
			--FigureTeleport	{Tag = "craig_01", X = 450.8, Y = 467 },
			FigureTeleportToEntity {Tag = "craig_01", TargetTag = "boat_01_craig_marker"},
			MapFlagSetFalse{ Name = "mf_P703_boat_01_used" },
			MapFlagSetTrue{ Name = "mf_P703_boat_01_check_heroes" },
			
			EventReEnable	{Name = "boat_timer_01"},
			MapTimerStart {Name = "mt_P703_check_heroes_01"},
		},
	},	

	OnEvent
	{
		EventName = ">>> boat_02 used to cross the river <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_boat_02_used" },
		},
		
		Actions =
		{
			--FigureTeleport	{Tag = "pl_HumanAvatar",X = 368.48, Y = 370.525 },
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "boat_02_avatar_marker"},
			--FigureTeleport	{Tag = "craig_01", X = 365.48, Y = 370.525 },
			FigureTeleportToEntity {Tag = "craig_01", TargetTag = "boat_02_craig_marker"},
			MapFlagSetFalse{ Name = "mf_P703_boat_02_used" },
			MapFlagSetTrue{ Name = "mf_P703_boat_02_check_heroes" },
			
			EventReEnable	{Name = "boat_timer_02"},
			MapTimerStart {Name = "mt_P703_check_heroes_02"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> hero check stop <<<",
		Name = "boat_timer_01",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_check_heroes_01", Seconds = 1},
		},
		
		Actions =
		{
			MapFlagSetFalse{ Name = "mf_P703_boat_01_check_heroes" },
			MapTimerStop {Name = "mt_P703_check_heroes_01"},
			EventReEnable	{Name = "hero_01_for_boat_01"},
			EventReEnable	{Name = "hero_02_for_boat_01"},
			EventReEnable	{Name = "hero_03_for_boat_01"},
			EventReEnable	{Name = "hero_04_for_boat_01"},
			EventReEnable	{Name = "hero_05_for_boat_01"},
			EventReEnable	{Name = "hero_06_for_boat_01"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> hero check stop <<<",
		Name = "boat_timer_02",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_check_heroes_02", Seconds = 1},
		},
		
		Actions =
		{
			MapFlagSetFalse{ Name = "mf_P703_boat_02_check_heroes" },
			MapTimerStop {Name = "mt_P703_check_heroes_02"},
			EventReEnable	{Name = "hero_01_for_boat_02"},
			EventReEnable	{Name = "hero_02_for_boat_02"},
			EventReEnable	{Name = "hero_03_for_boat_02"},
			EventReEnable	{Name = "hero_04_for_boat_02"},
			EventReEnable	{Name = "hero_05_for_boat_02"},
			EventReEnable	{Name = "hero_06_for_boat_02"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 1 for boat01 <<<",
		Name = "hero_01_for_boat_01",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "boat_01", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "boat_01_hero_01_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroFirst", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 2 for boat01 <<<",
		Name = "hero_02_for_boat_01",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "boat_01", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "boat_01_hero_02_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 3 for boat01 <<<",
		Name = "hero_03_for_boat_01",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "boat_01", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "boat_01_hero_03_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroSecond", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 4 for boat01 <<<",
		Name = "hero_04_for_boat_01",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "boat_01", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "boat_01_hero_04_marker"},
			FigureDirectionSet {Tag = "pl_HumanCompanionCraigHuman", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 5 for boat01 <<<",
		Name = "hero_05_for_boat_01",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "boat_01", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroOrc", TargetTag = "boat_01_hero_05_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroOrc", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 6 for boat01 <<<",
		Name = "hero_06_for_boat_01",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "boat_01", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroThird", TargetTag = "boat_01_hero_06_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroThird", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 1 for boat02 <<<",
		Name = "hero_01_for_boat_02",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_02_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "boat_02", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "boat_02_hero_01_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroFirst", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 2 for boat02 <<<",
		Name = "hero_02_for_boat_02",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_02_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "boat_02", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "boat_02_hero_02_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 3 for boat02 <<<",
		Name = "hero_03_for_boat_02",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_02_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "boat_02", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "boat_02_hero_03_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroSecond", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 4 for boat02 <<<",
		Name = "hero_04_for_boat_02",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_02_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "boat_02", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanCompanionCraigHuman", TargetTag = "boat_02_hero_04_marker"},
			FigureDirectionSet {Tag = "pl_HumanCompanionCraigHuman", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 5 for boat02 <<<",
		Name = "hero_05_for_boat_02",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_01_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "boat_02", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroOrc", TargetTag = "boat_02_hero_05_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroOrc", Direction = 0},	
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Check Hero 6 for boat02 <<<",
		Name = "hero_06_for_boat_02",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P703_boat_02_check_heroes"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "boat_02", Range = 30},
		},
		
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanHeroThird", TargetTag = "boat_02_hero_06_marker"},
			FigureDirectionSet {Tag = "pl_HumanHeroThird", Direction = 0},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 30, X = 441.473, Y = 466.905 },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0403_Boat"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_04_Arena"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			MapFlagSetTrue{ Name = "mf_P703_MQ4_Completed" },
		},
	},
};
