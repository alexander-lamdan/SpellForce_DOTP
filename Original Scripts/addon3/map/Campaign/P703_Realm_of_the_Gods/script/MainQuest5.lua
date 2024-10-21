State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ5_Cheat" },
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "boat_01"},
			DialogSetEnabled	{Tag = "boat_02"},
			MapFlagSetTrue{ Name = "mf_P703_boat_01_used" },
			MapFlagSetTrue{ Name = "mf_P703_MQ4_Completed" },
			
			FigureTeleportToEntity {Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroSecond", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			--FigureAbilityAdd	{Tag = "testfight_01", AbilityId = 94},
			--FigureAbilityAdd	{Tag = "testfight_02", AbilityId = 94},
			--FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "stair_01", Range = 65, Height = 25},
			--FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "stair_02", Range = 65, Height = 25},
			--FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "stair_03", Range = 65, Height = 25},
		},
	},
	
	--[[
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "testfight_01", Range = 3},
		},
		
		Actions =
		{
			FigureAbilityRemove	{Tag = "testfight_01", AbilityId = 94},
			FigureAbilityRemove	{Tag = "testfight_02", AbilityId = 94},
			FigureHealthSet	{Tag = "testfight_01", Percent = 100},
			FigureHealthSet	{Tag = "testfight_02", Percent = 100},
		},
	},
	--]]
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ4_Completed" },
		},
		
		Actions =
		{
			FogOfWarReveal	{FogOfWarId = default, X = 443.767, Y = 469.384,  Range = 3, Height = 10},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_05_Trickster"},
			DialogSetEnabled	{Tag = "zerbo"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "zerbo", Range = 7},
		},
		
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_zerbo_greeting"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_zerbo_first" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0501_Armory"},
			DialogSetDisabled	{Tag = "zerbo"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 460.478, Y = 466.274 },
			ObjectLootItemMiscAdd	{Tag = "armory_01", DropChance = 100, ItemId = 658},
			ObjectLootItemMiscAdd	{Tag = "armory_02", DropChance = 100, ItemId = 659},
			ObjectLootItemMiscAdd	{Tag = "armory_03", DropChance = 100, ItemId = 660},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Armory turn in<<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 658, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 659, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 660, Amount = 1},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "zerbo"},
			MapFlagSetTrue {Name = "mf_P703_armory_done"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Armory completed, Enhance Defense starts<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_zerbo_second" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 460.478, Y = 466.274 },
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0501_Armory"},
			DialogSetDisabled	{Tag = "zerbo"},
			AvatarItemMiscGive	{Player = "default", ItemId = 661, Amount = 3},
			AvatarItemMiscTake	{Player = "default", ItemId = 658, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 659, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 660, Amount = 1},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0502_Defense"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Defense rune 1 planted <<<",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = 300.293, Y = 469.465 }, --defense_01
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0502_Defense"},
		},
		
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 661, Amount = 1},
			MapFlagSetTrue {Name = "mf_P703_defense_01_done"},
			--ObjectSpawnToEntity	{ObjectId = 1543, TargetTag = "defense_01", Direction = default, Tag = "defense_decal_01"},
			ObjectSpawn	{ObjectId = 1543, X = 300.293, Y = 469.465 , Direction = 0, Tag = "defense_decal_01"},
			ObjectVanish	{Tag = "defense_01"},
			
		},
	},
		
	OnOneTimeEvent
	{
		EventName = ">>> Defense rune 2 planted <<<",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = 267.771, Y = 481.449 }, --defense_02
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0502_Defense"},
		},
		
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 661, Amount = 1},
			FigureOutcry	{TextTag = "defense_01", Tag = "pl_HumanAvatar"},
			MapFlagSetTrue {Name = "mf_P703_defense_02_done"},
			--ObjectSpawnToEntity	{ObjectId = 1543, TargetTag = "defense_02", Direction = default, Tag = "defense_decal_02"},
			ObjectSpawn	{ObjectId = 1543, X = 267.771, Y = 481.449 , Direction = 0, Tag = "defense_decal_02"},
			ObjectVanish	{Tag = "defense_02"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Defense rune 3 planted <<<",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = 209.435, Y = 438.464 }, --defense_03
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0502_Defense"},
		},
		
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 661, Amount = 1},
			MapFlagSetTrue {Name = "mf_P703_defense_03_done"},
			--ObjectSpawnToEntity	{ObjectId = 1543, TargetTag = "defense_03", Direction = default, Tag = "defense_decal_03"},
			ObjectSpawn	{ObjectId = 1543, X = 209.435, Y = 438.464 , Direction = 0, Tag = "defense_decal_03"},
			ObjectVanish	{Tag = "defense_03"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_defense_01_done" },
			MapFlagIsTrue{ Name = "mf_P703_defense_02_done" },
			MapFlagIsTrue{ Name = "mf_P703_defense_03_done" },
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "zerbo"},
			MapFlagSetTrue {Name = "mf_P703_defense_done"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_zerbo_third" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 460.478, Y = 466.274 },
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0502_Defense"},
			DialogSetDisabled	{Tag = "zerbo"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0503_Hitting"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0503_Hitting"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "wargame_spirit_01", Range = 8 },
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "wargame_spirit_01"},
			FigureTeleport	{Tag = "pl_HumanAvatar",X = 207.628, Y = 450.295 },
			DialogBegin	{Player = "default", Tag = "wargame_spirit_01"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_wargame_spirit_01_completed" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "wargame_spirit_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0503_Hitting"},			
			FigureOutcry	{TextTag = "sabotage_01", Tag = "craig_01"},
			FigureOutcry	{TextTag = "sabotage_02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "sabotage_03", Tag = "craig_01"},
			FigureOutcry	{TextTag = "sabotage_04", Tag = "pl_HumanAvatar"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_25s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0504_Tower"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0504_Tower"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "damaged_tower_01", Range = 12 },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "tower2_01", Tag = "craig_01"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0504_Tower"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "damaged_tower_02", Range = 12 },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "tower3_01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "tower3_02", Tag = "craig_01"},
			FigureOutcry	{TextTag = "tower3_03", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "tower3_04", Tag = "craig_01"},
			FigureOutcry	{TextTag = "tower3_05", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "io_01", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "io_02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "io_03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "io_04", Tag = "pl_HumanAvatar"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0504_Tower"},
			MapTimerStart {Name = "mt_P703_io_walk"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0505_Io"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_io_walk", Seconds = 5},
		},
		
		Actions =
		{
			FigurePatrolWalk	{Tag = "io",X = 268.924, Y = 624.773},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0505_Io"},
			FigureIsInEntityRange	{Tag = "io", TargetTag = "portal_02", Range = 3 },
		},
		
		Actions =
		{
			FigureVanish	{Tag = "io"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0505_Io"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "portal_02", Range = 10 },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "cityportal_01", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "cityportal_02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cityportal_03", Tag = "craig_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0505_Io"},			
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0506_Invaders"},
			BuildingAbilityRemove	{Tag = "portal_02", AbilityId = 95},
			
			MapFlagSetTrue {Name = "mf_P703_portal_get_help_01"},
			
			--FigureNpcSpawnToEntity	{Tag = "fighter_help_01", Level = 8, UnitId = 1970, TargetTag = "help_01", Team = "tm_Neutral"},
			--FigureNpcSpawnToEntity	{Tag = "fighter_help_02", Level = 8, UnitId = 1974, TargetTag = "help_02", Team = "tm_Neutral"},
			--FigureNpcSpawnToEntity	{Tag = "fighter_help_03", Level = 8, UnitId = 1973, TargetTag = "help_03", Team = "tm_Neutral"},
			--FigureNpcSpawnToEntity	{Tag = "fighter_help_04", Level = 8, UnitId = 1973, TargetTag = "help_04", Team = "tm_Neutral"},
			--FigureNpcSpawnToEntity	{Tag = "fighter_help_05", Level = 8, UnitId = 1973, TargetTag = "help_05", Team = "tm_Neutral"},
			FigureTeleportToEntity	{Tag = "fighter_help_01", TargetTag = "help_01"},
			FigureTeleportToEntity	{Tag = "fighter_help_02", TargetTag = "help_02"},
			FigureTeleportToEntity	{Tag = "fighter_help_03", TargetTag = "help_03"},
			FigureTeleportToEntity	{Tag = "fighter_help_04", TargetTag = "help_04"},
			FigureTeleportToEntity	{Tag = "fighter_help_05", TargetTag = "help_05"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> the avatar gets help <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_MQ_0506_Invaders"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "fighter_help_04", Range = 5 },
			MapFlagIsTrue{ Name = "mf_P703_portal_get_help_01" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "fighter_help_01", Tag = "pl_HumanAvatar"},
			FigureTeamTransfer	{Tag = "fighter_help_01", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "fighter_help_02", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "fighter_help_03", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "fighter_help_04", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "fighter_help_05", Team = "tm_Team 1"},
			
			PlayerKitTransfer	{Player = "default", PlayerKit = "pk_fighter_help"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Portal spawns some enemy <<<",
		Conditions = 
		{
			BuildingHasNotHealth	{Tag = "portal_02", Percent = 75},
		},
		
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Portal spawns some enemy <<<",
		Conditions = 
		{
			BuildingHasNotHealth	{Tag = "portal_02", Percent = 50},
		},
		
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Portal spawns some enemy <<<",
		Conditions = 
		{
			BuildingHasNotHealth	{Tag = "portal_02", Percent = 25},
		},
		
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1974, TargetTag = "portal_02", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "portal_02", Team = "tm_Team 2"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			BuildingIsDead	{Tag = "portal_02"},
			FigureIsDead	{Tag = "evil_01"},
			FigureIsDead	{Tag = "evil_02"},
			FigureIsDead	{Tag = "evil_03"},
			FigureIsDead	{Tag = "evil_04"},
		},
		
		Actions =
		{
			--FigureOutcry	{TextTag = "portal_02", Tag = "pl_HumanAvatar"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0506_Invaders"},
			DialogSetEnabled	{Tag = "zerbo"},
			MapFlagSetTrue {Name = "mf_P703_portal_02_done"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0507_Report"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Reporting to Zerbo + last cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_zerbo_fourth" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "zerbo"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0507_Report"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_05_Trickster"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_ACT_01"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
			MapFlagSetTrue{ Name = "mf_P703_CS4_Gods_Start" },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Start a timer for CS4 <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_CS4_Gods_Start" },
		},
		
		Actions =
		{
			MapTimerStart {Name = "mt_P703_Start_CS4"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Hero select after the cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_CS4_Gods_Ended" },
		},
		
		Actions =
		{
			PlayerTravelStoneAdd	{Player = "default", Tag = "ts_gods"},
			--PlayerGameEnds {}
			
			FigureTeleportToEntity	{Tag = "alyah", TargetTag = "teleport_alyah"},
			FigureTeleportToEntity	{Tag = "bor", TargetTag = "teleport_bor"},
			FigureTeleportToEntity	{Tag = "jared", TargetTag = "teleport_jared"},
			FigureTeleportToEntity	{Tag = "lena", TargetTag = "teleport_lena"},
			FigureTeleportToEntity	{Tag = "shan_muir", TargetTag = "teleport_shan_muir"},
			FigureTeleportToEntity	{Tag = "whisper", TargetTag = "teleport_whisper"},
			MapTimerStart {Name = "mt_P703_Dialog_Enabled_Start"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Timer for dialogs <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_Dialog_Enabled_Start", Seconds = 1},
		},
		
		Actions =
		{
			MapTimerStop {Name = "mt_P703_Dialog_Enabled_Start"},
			DialogSetEnabled	{Tag = "alyah"},
			DialogSetEnabled	{Tag = "bor"},
			DialogSetEnabled	{Tag = "jared"},
			DialogSetEnabled	{Tag = "lena"},
			DialogSetEnabled	{Tag = "shan_muir"},
			DialogSetEnabled	{Tag = "whisper"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> alyah Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_Alyah_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 256},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroSecond", TargetTag = "alyah", Direction = 20},},
			FigureVanish	{Tag = "alyah"},
			MapFlagSetTrue {Name = "mf_P703_hero_chosen"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Bor Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_Bor_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 257},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroSecond", TargetTag = "bor", Direction = 20},},
			FigureVanish	{Tag = "bor"},
			MapFlagSetTrue {Name = "mf_P703_hero_chosen"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> jared Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_Jared_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 258},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroSecond", TargetTag = "jared", Direction = 20},},
			FigureVanish	{Tag = "jared"},
			MapFlagSetTrue {Name = "mf_P703_hero_chosen"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> lena Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_Lena_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 265},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroSecond", TargetTag = "lena", Direction = 20},},
			FigureVanish	{Tag = "lena"},
			MapFlagSetTrue {Name = "mf_P703_hero_chosen"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> shan muir Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_Shan_Muir_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 266},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroSecond", TargetTag = "shan_muir", Direction = 20},},
			FigureVanish	{Tag = "shan_muir"},
			MapFlagSetTrue {Name = "mf_P703_hero_chosen"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> wisper Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_Whisper_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 264},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroSecond", TargetTag = "whisper", Direction = 20},},
			FigureVanish	{Tag = "whisper"},
			MapFlagSetTrue {Name = "mf_P703_hero_chosen"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Hero Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_hero_chosen" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "alyah"},
			DialogSetDisabled	{Tag = "bor"},
			DialogSetDisabled	{Tag = "jared"},
			DialogSetDisabled	{Tag = "lena"},
			DialogSetDisabled	{Tag = "shan_muir"},
			DialogSetDisabled	{Tag = "whisper"},
			PlayerHeroAdd	{ HeroId = 259},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "CompanionCraigHuman", TargetTag = "zerbo", Direction = 20},},
			FigureVanish	{Tag = "craig_01"},
			--FigureOutcry	{TextTag = "hero_choice_01", Tag = "ereon"},
			--FigureOutcry	{TextTag = "hero_choice_02", Tag = "flink_01"}, flink_01 already vanished!
			
			MapTimerStart {Name = "mt_P703_End_Mission"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> End Mission <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_End_Mission", Seconds = 8},
		},
		
		Actions =
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_ArrivedFromPreviousMap"},
			PlayerMapTravelAddon3 {Map = "Campaign/P704_The_Citadel", TargetTag = "Map_Start_Point"},
		},
	},
};