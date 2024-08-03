State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_03", Range = 150},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_04", Range = 150},
			},
		},
		Actions =
		{
			FigureTeleport	{Tag = "Undead_Lich", X = 102, Y = 530},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Arrived"},
			DialogSetEnabled	{Tag = "Undead_Lich"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Spawn"},
			MapTimerStart	{Name = "mt_P710_Undead_First_Spawn"},
			ObjectSpawn	{ObjectId = 931, X = 128.631, Y = 583.329, Direction = 92, Tag = "Undead_Tower01"},
			ObjectSpawn	{ObjectId = 931, X = 132.248, Y = 561.206, Direction = 84, Tag = "Undead_Tower02"},
			ObjectSpawn	{ObjectId = 931, X = 130.458, Y = 544.634, Direction = 99, Tag = "Undead_Tower03"},
			ObjectSpawn	{ObjectId = 931, X = 137.716, Y = 525.131, Direction = 87, Tag = "Undead_Tower04"},
			ObjectSpawn	{ObjectId = 931, X = 149.529, Y = 498.976, Direction = 99, Tag = "Undead_Tower05"},
			ObjectSpawn	{ObjectId = 803, X = 116.625, Y = 575.472, Direction = 335, Tag = "Undead_Wall01"},
			ObjectSpawn	{ObjectId = 1645, X = 120.929, Y = 534.355, Direction = 0, Tag = "Undead_Wall02"},
			ObjectSpawn	{ObjectId = 803, X = 131.563, Y = 495.766, Direction = 57, Tag = "Undead_Wall03"},
			ObjectSpawn	{ObjectId = 579, X = 109.392, Y = 581.11, Direction = 12, Tag = "Undead_Pillar01"},
			ObjectSpawn	{ObjectId = 579, X = 98.9006, Y = 561.616, Direction = 41, Tag = "Undead_Pillar02"},
			ObjectSpawn	{ObjectId = 579, X = 68.4164, Y = 541.473, Direction = 73, Tag = "Undead_Pillar03"},
			ObjectSpawn	{ObjectId = 579, X = 95.1681, Y = 523.007, Direction = 93, Tag = "Undead_Pillar04"},
			ObjectSpawn	{ObjectId = 579, X = 87.9194, Y = 493.387, Direction = 109, Tag = "Undead_Pillar05"},
			ObjectSpawn	{ObjectId = 579, X = 123.019, Y = 503.96, Direction = 183, Tag = "Undead_Pillar06"},
			ObjectSpawn	{ObjectId = 650, X = 116.935, Y = 568.621, Direction = 0, Tag = "Undead_Statue01"},
			ObjectSpawn	{ObjectId = 578, X = 90.7767, Y = 576.569, Direction = 0, Tag = "Undead_Statue02"},
			ObjectSpawn	{ObjectId = 650, X = 92.9315, Y = 545.077, Direction = 54, Tag = "Undead_Statue03"},
			ObjectSpawn	{ObjectId = 578, X = 101.819, Y = 510.823, Direction = 96, Tag = "Undead_Statue04"},
			ObjectSpawn	{ObjectId = 936, X = 110.095, Y = 571.336, Direction = 170, Tag = "Undead_Building01"},
			ObjectSpawn	{ObjectId = 936, X = 101.491, Y = 572.383, Direction = 150, Tag = "Undead_Building02"},
			ObjectSpawn	{ObjectId = 692, X = 90.0809, Y = 566.798, Direction = 59, Tag = "Undead_Building03"},
			ObjectSpawn	{ObjectId = 938, X = 90.0224, Y = 554.784, Direction = 0, Tag = "Undead_Building04"},
			ObjectSpawn	{ObjectId = 935, X = 74.9498, Y = 553.819, Direction = 95, Tag = "Undead_Building05"},
			ObjectSpawn	{ObjectId = 935, X = 80.6473, Y = 540.711, Direction = 35, Tag = "Undead_Building06"},
			ObjectSpawn	{ObjectId = 935, X = 68.8325, Y = 529.511, Direction = 0, Tag = "Undead_Building07"},
			ObjectSpawn	{ObjectId = 932, X = 84.8996, Y = 523.687, Direction = 150, Tag = "Undead_Building08"},
			ObjectSpawn	{ObjectId = 935, X = 69.1405, Y = 514.22, Direction = 165, Tag = "Undead_Building09"},
			ObjectSpawn	{ObjectId = 935, X = 78.6761, Y = 503.063, Direction = 315, Tag = "Undead_Building10"},
			ObjectSpawn	{ObjectId = 935, X = 77.4262, Y = 489.502, Direction = 225, Tag = "Undead_Building11"},
			ObjectSpawn	{ObjectId = 938, X = 94.1549, Y = 502.16, Direction = 60, Tag = "Undead_Building12"},
			ObjectSpawn	{ObjectId = 937, X = 95.6854, Y = 485.801, Direction = 95, Tag = "Undead_Building13"},
			ObjectSpawn	{ObjectId = 937, X = 106.652, Y = 486.82, Direction = 115, Tag = "Undead_Building14"},
			ObjectSpawn	{ObjectId = 933, X = 111.744, Y = 500.435, Direction = 210, Tag = "Undead_Building15"},
			ObjectSpawn	{ObjectId = 934, X = 123.018, Y = 491.963, Direction = 26, Tag = "Undead_Building16"},
			ObjectSpawn	{ObjectId = 934, X = 77.161, Y = 609.355, Direction = 183, Tag = "Undead_Building17"},
			FogOfWarRevealAtEntity	{FogOfWarId = 6, Tag = "Undead_Lich", Range = 40, Height = 30},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undeads_Quest"},
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_GATHER"},
			DialogSetEnabled	{Tag = "Corpses01_05"},
			DialogSetEnabled	{Tag = "Corpses02_05"},
			DialogSetEnabled	{Tag = "Corpses03_05"},
			DialogSetEnabled	{Tag = "Corpses04_05"},
			DialogSetEnabled	{Tag = "Corpses05_05"},
			DialogSetEnabled	{Tag = "Corpses06_05"},
			DialogSetEnabled	{Tag = "Corpses07_05"},
			DialogSetEnabled	{Tag = "Corpses08_05"},
			DialogSetEnabled	{Tag = "Corpses09_05"},
			DialogSetEnabled	{Tag = "Corpses10_05"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses01_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses01_01"},
			ObjectVanish	{Tag = "Corpses01_02"},
			ObjectVanish	{Tag = "Corpses01_03"},
			ObjectVanish	{Tag = "Corpses01_04"},
			ObjectVanish	{Tag = "Corpses01_05"},
			ObjectVanish	{Tag = "Corpses01_06"},
			ObjectVanish	{Tag = "Corpses01_07"},
			ObjectVanish	{Tag = "Corpses01_08"},
			ObjectVanish	{Tag = "Corpses01_09"},
			ObjectVanish	{Tag = "Corpses01_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses02_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses02_01"},
			ObjectVanish	{Tag = "Corpses02_02"},
			ObjectVanish	{Tag = "Corpses02_03"},
			ObjectVanish	{Tag = "Corpses02_04"},
			ObjectVanish	{Tag = "Corpses02_05"},
			ObjectVanish	{Tag = "Corpses02_06"},
			ObjectVanish	{Tag = "Corpses02_07"},
			ObjectVanish	{Tag = "Corpses02_08"},
			ObjectVanish	{Tag = "Corpses02_09"},
			ObjectVanish	{Tag = "Corpses02_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses03_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses03_01"},
			ObjectVanish	{Tag = "Corpses03_02"},
			ObjectVanish	{Tag = "Corpses03_03"},
			ObjectVanish	{Tag = "Corpses03_04"},
			ObjectVanish	{Tag = "Corpses03_05"},
			ObjectVanish	{Tag = "Corpses03_06"},
			ObjectVanish	{Tag = "Corpses03_07"},
			ObjectVanish	{Tag = "Corpses03_08"},
			ObjectVanish	{Tag = "Corpses03_09"},
			ObjectVanish	{Tag = "Corpses03_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses04_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses04_01"},
			ObjectVanish	{Tag = "Corpses04_02"},
			ObjectVanish	{Tag = "Corpses04_03"},
			ObjectVanish	{Tag = "Corpses04_04"},
			ObjectVanish	{Tag = "Corpses04_05"},
			ObjectVanish	{Tag = "Corpses04_06"},
			ObjectVanish	{Tag = "Corpses04_07"},
			ObjectVanish	{Tag = "Corpses04_08"},
			ObjectVanish	{Tag = "Corpses04_09"},
			ObjectVanish	{Tag = "Corpses04_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses05_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses05_01"},
			ObjectVanish	{Tag = "Corpses05_02"},
			ObjectVanish	{Tag = "Corpses05_03"},
			ObjectVanish	{Tag = "Corpses05_04"},
			ObjectVanish	{Tag = "Corpses05_05"},
			ObjectVanish	{Tag = "Corpses05_06"},
			ObjectVanish	{Tag = "Corpses05_07"},
			ObjectVanish	{Tag = "Corpses05_08"},
			ObjectVanish	{Tag = "Corpses05_09"},
			ObjectVanish	{Tag = "Corpses05_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses06_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses06_01"},
			ObjectVanish	{Tag = "Corpses06_02"},
			ObjectVanish	{Tag = "Corpses06_03"},
			ObjectVanish	{Tag = "Corpses06_04"},
			ObjectVanish	{Tag = "Corpses06_05"},
			ObjectVanish	{Tag = "Corpses06_06"},
			ObjectVanish	{Tag = "Corpses06_07"},
			ObjectVanish	{Tag = "Corpses06_08"},
			ObjectVanish	{Tag = "Corpses06_09"},
			ObjectVanish	{Tag = "Corpses06_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses07_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses07_01"},
			ObjectVanish	{Tag = "Corpses07_02"},
			ObjectVanish	{Tag = "Corpses07_03"},
			ObjectVanish	{Tag = "Corpses07_04"},
			ObjectVanish	{Tag = "Corpses07_05"},
			ObjectVanish	{Tag = "Corpses07_06"},
			ObjectVanish	{Tag = "Corpses07_07"},
			ObjectVanish	{Tag = "Corpses07_08"},
			ObjectVanish	{Tag = "Corpses07_09"},
			ObjectVanish	{Tag = "Corpses07_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses08_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses08_01"},
			ObjectVanish	{Tag = "Corpses08_02"},
			ObjectVanish	{Tag = "Corpses08_03"},
			ObjectVanish	{Tag = "Corpses08_04"},
			ObjectVanish	{Tag = "Corpses08_05"},
			ObjectVanish	{Tag = "Corpses08_06"},
			ObjectVanish	{Tag = "Corpses08_07"},
			ObjectVanish	{Tag = "Corpses08_08"},
			ObjectVanish	{Tag = "Corpses08_09"},
			ObjectVanish	{Tag = "Corpses08_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses09_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses09_01"},
			ObjectVanish	{Tag = "Corpses09_02"},
			ObjectVanish	{Tag = "Corpses09_03"},
			ObjectVanish	{Tag = "Corpses09_04"},
			ObjectVanish	{Tag = "Corpses09_05"},
			ObjectVanish	{Tag = "Corpses09_06"},
			ObjectVanish	{Tag = "Corpses09_07"},
			ObjectVanish	{Tag = "Corpses09_08"},
			ObjectVanish	{Tag = "Corpses09_09"},
			ObjectVanish	{Tag = "Corpses09_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Corpses10_05"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 768, Amount = 10},
			ObjectVanish	{Tag = "Corpses10_01"},
			ObjectVanish	{Tag = "Corpses10_02"},
			ObjectVanish	{Tag = "Corpses10_03"},
			ObjectVanish	{Tag = "Corpses10_04"},
			ObjectVanish	{Tag = "Corpses10_05"},
			ObjectVanish	{Tag = "Corpses10_06"},
			ObjectVanish	{Tag = "Corpses10_07"},
			ObjectVanish	{Tag = "Corpses10_08"},
			ObjectVanish	{Tag = "Corpses10_09"},
			ObjectVanish	{Tag = "Corpses10_10"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 768, Amount = 100},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_GATHER"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},
			DialogSetEnabled	{Tag = "Cemetery"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Cemetery", Range = 10},
			AvatarIsNotTalking	{},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
			DialogSetDisabled	{Tag = "Cemetery"},
			MapFlagSetTrue {Name = "mf_P710_StartUndeadsCS"},
			AvatarItemMiscTake	{Player = "default", ItemId = 768, Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Cemetery", Range = 10},
			AvatarIsNotTalking	{},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Cemetery"},
			MapFlagSetTrue {Name = "mf_P710_StartUndeadsCS"},
			AvatarItemMiscTake	{Player = "default", ItemId = 768, Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_StartUndeadsCS_End"},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS"},
			MapFlagSetTrue{Name = "mf_P710_Undeads_West"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = Undead_Attack_Spawn_Random,
		Name = "Undead_Attack_Spawn_Random",
		Conditions = 
		{
			QuestIsNotSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			MapFlagIsFalse{Name = "mf_P710_Undeads_West"},
			MapFlagIsFalse{Name = "mf_P710_Undeads_South"},
			MapFlagIsFalse{Name = "mf_P710_Undeads_East"},
			MapFlagIsTrue	{Name = "mf_P710_Undead_Respawn"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			
			MapValueRandomize	{Name = "mv_P710_Undead_Attack_Random", MinValue = 1, MaxValue = 3},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shiverling01", Level = 10, UnitId = 104, Team = "tm_Undead", TargetTag = "Undead_Building08"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shiverling02", Level = 10, UnitId = 104, Team = "tm_Undead", TargetTag = "Undead_Building08"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shiverling03", Level = 10, UnitId = 104, Team = "tm_Undead", TargetTag = "Undead_Building08"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shadeling01", Level = 10, UnitId = 118, Team = "tm_Undead", TargetTag = "Undead_Building08"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shadeling02", Level = 10, UnitId = 118, Team = "tm_Undead", TargetTag = "Undead_Building08"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shadeling03", Level = 10, UnitId = 118, Team = "tm_Undead", TargetTag = "Undead_Building08"},
			FigurePlayerTransfer	{Tag = "Undead_Shiverling01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shiverling02", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shiverling03", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shadeling01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shadeling02", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shadeling03", Player = "pl_Undead"},
			MapTimerStart	{Name = "mf_P710_Undead_Spawned"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = Undead_Attack_Spawn_Controlled,
		Name = "Undead_Attack_Spawn_Controlled",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue{Name = "mf_P710_Undeads_West"},
				MapFlagIsTrue{Name = "mf_P710_Undeads_South"},
				MapFlagIsTrue{Name = "mf_P710_Undeads_East"},
			},
			QuestIsNotSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			MapFlagIsTrue	{Name = "mf_P710_Undead_Respawn"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Undead_Shiverling01", Level = 10, UnitId = 104, TargetTag = "Undead_Building08", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shiverling02", Level = 10, UnitId = 104, TargetTag = "Undead_Building08", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shiverling03", Level = 10, UnitId = 104, TargetTag = "Undead_Building08", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shadeling01", Level = 10, UnitId = 118, TargetTag = "Undead_Building08", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shadeling02", Level = 10, UnitId = 118, TargetTag = "Undead_Building08", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_Shadeling03", Level = 10, UnitId = 118, TargetTag = "Undead_Building08", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_SkeletonShield01", Level = 10, UnitId = 81, TargetTag = "Grave01", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_SkeletonBow01", Level = 10, UnitId = 102, TargetTag = "Grave02", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_SkeletonSword01", Level = 10, UnitId = 377, TargetTag = "Grave03", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_SkeletonShield02", Level = 10, UnitId = 81, TargetTag = "Grave04", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_SkeletonBow02", Level = 10, UnitId = 102, TargetTag = "Grave05", Team = "tm_Undead"},
			FigureNpcSpawnToEntity	{Tag = "Undead_SkeletonSword02", Level = 10, UnitId = 377, TargetTag = "Grave06", Team = "tm_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shiverling01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shiverling02", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shiverling03", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shadeling01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shadeling02", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_Shadeling03", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_SkeletonShield01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_SkeletonBow01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_SkeletonSword01", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_SkeletonShield02", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_SkeletonBow02", Player = "pl_Undead"},
			FigurePlayerTransfer	{Tag = "Undead_SkeletonSword02", Player = "pl_Undead"},
			MapTimerStart	{Name = "mf_P710_Undead_Spawned"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mf_P710_Undead_Spawned", Seconds = 0.5},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mf_P710_Undead_Spawned"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Spawned"},
		},
	},
		
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undead_Spawned"},
			OR
			{
				MapValueIsEqual	{Name = "mv_P710_Undead_Attack_Random", Value = 1},
				MapFlagIsTrue{Name = "mf_P710_Undeads_West"},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_Undead_Spawned"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Attack"},
			FigureRun	{Tag = "Undead_SkeletonShield01", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_SkeletonBow01", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_Shiverling03", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_SkeletonSword01", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_Shiverling01", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_Shiverling02", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_Shadeling01", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_SkeletonShield02", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_Shadeling02", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_SkeletonBow02", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_Shadeling03", X = 222, Y = 666},
			FigureRun	{Tag = "Undead_SkeletonSword02", X = 222, Y = 666},
			EventReEnable	{Name = "Undead_Attack_Respawn"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undead_Attack"},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonShield01"},
				FigureIsInRange	{Tag = "Undead_SkeletonShield01", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonBow01"},
				FigureIsInRange	{Tag = "Undead_SkeletonBow01", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling03"},
				FigureIsInRange	{Tag = "Undead_Shiverling03", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonSword01"},
				FigureIsInRange	{Tag = "Undead_SkeletonSword01", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling01"},
				FigureIsInRange	{Tag = "Undead_Shiverling01", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling02"},
				FigureIsInRange	{Tag = "Undead_Shiverling02", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling01"},
				FigureIsInRange	{Tag = "Undead_Shadeling01", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonShield02"},
				FigureIsInRange	{Tag = "Undead_SkeletonShield02", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling02"},
				FigureIsInRange	{Tag = "Undead_Shadeling02", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonBow02"},
				FigureIsInRange	{Tag = "Undead_SkeletonBow02", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling03"},
				FigureIsInRange	{Tag = "Undead_Shadeling03", Range = 5, X = 222, Y = 666},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonSword02"},
				FigureIsInRange	{Tag = "Undead_SkeletonSword02", Range = 5, X = 222, Y = 666},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_Undead_Attack"},
			FigureRun	{Tag = "Undead_SkeletonBow01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonShield01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling03", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonSword01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonShield02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonBow02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling03", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling03", X = 465, Y = 655},
			EventReEnable	{Name = "Undead_Attack_Respawn"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undead_Spawned"},
			OR
			{
				MapValueIsEqual	{Name = "mv_P710_Undead_Attack_Random", Value = 2},
				MapFlagIsTrue{Name = "mf_P710_Undeads_South"},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_Undead_Spawned"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Attack"},
			FigureRun	{Tag = "Undead_SkeletonBow01", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_SkeletonShield01", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_Shiverling03", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_SkeletonSword01", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_Shiverling01", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_Shiverling02", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_Shadeling01", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_SkeletonShield02", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_Shadeling02", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_SkeletonBow02", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_Shadeling03", X = 380, Y = 580},
			FigureRun	{Tag = "Undead_SkeletonSword02", X = 380, Y = 580},
			EventReEnable	{Name = "Undead_Attack_Respawn"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undead_Attack"},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonBow01"},
				FigureIsInRange	{Tag = "Undead_SkeletonBow01", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonShield01"},
				FigureIsInRange	{Tag = "Undead_SkeletonShield01", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling03"},
				FigureIsInRange	{Tag = "Undead_Shiverling03", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonSword01"},
				FigureIsInRange	{Tag = "Undead_SkeletonSword01", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling01"},
				FigureIsInRange	{Tag = "Undead_Shiverling01", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling02"},
				FigureIsInRange	{Tag = "Undead_Shiverling02", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling01"},
				FigureIsInRange	{Tag = "Undead_Shadeling01", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonShield02"},
				FigureIsInRange	{Tag = "Undead_SkeletonShield02", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling02"},
				FigureIsInRange	{Tag = "Undead_Shadeling02", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonBow02"},
				FigureIsInRange	{Tag = "Undead_SkeletonBow02", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling03"},
				FigureIsInRange	{Tag = "Undead_Shadeling03", Range = 5, X = 380, Y = 580},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonSword02"},
				FigureIsInRange	{Tag = "Undead_SkeletonSword02", Range = 5, X = 380, Y = 580},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_Undead_Attack"},
			FigureRun	{Tag = "Undead_SkeletonBow01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonShield01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling03", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonSword01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonShield02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonBow02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling03", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling03", X = 465, Y = 655},
			EventReEnable	{Name = "Undead_Attack_Respawn"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undead_Spawned"},
			OR
			{
				MapValueIsEqual	{Name = "mv_P710_Undead_Attack_Random", Value = 3},
				MapFlagIsTrue{Name = "mf_P710_Undeads_East"},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_Undead_Spawned"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Attack"},
			FigureRun	{Tag = "Undead_SkeletonBow01", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_SkeletonShield01", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_Shiverling03", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_SkeletonSword01", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_Shiverling01", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_Shiverling02", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_Shadeling01", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_SkeletonShield02", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_Shadeling02", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_SkeletonBow02", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_Shadeling03", X = 510, Y = 600},
			FigureRun	{Tag = "Undead_SkeletonSword02", X = 510, Y = 600},
			EventReEnable	{Name = "Undead_Attack_Respawn"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Undead_Attack"},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonBow01"},
				FigureIsInRange	{Tag = "Undead_SkeletonBow01", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonShield01"},
				FigureIsInRange	{Tag = "Undead_SkeletonShield01", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling03"},
				FigureIsInRange	{Tag = "Undead_Shiverling03", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonSword01"},
				FigureIsInRange	{Tag = "Undead_SkeletonSword01", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling01"},
				FigureIsInRange	{Tag = "Undead_Shiverling01", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shiverling02"},
				FigureIsInRange	{Tag = "Undead_Shiverling02", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling01"},
				FigureIsInRange	{Tag = "Undead_Shadeling01", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonShield02"},
				FigureIsInRange	{Tag = "Undead_SkeletonShield02", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling02"},
				FigureIsInRange	{Tag = "Undead_Shadeling02", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonBow02"},
				FigureIsInRange	{Tag = "Undead_SkeletonBow02", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_Shadeling03"},
				FigureIsInRange	{Tag = "Undead_Shadeling03", Range = 5, X = 510, Y = 600},
			},
			OR
			{
				FigureIsDead	{Tag = "Undead_SkeletonSword02"},
				FigureIsInRange	{Tag = "Undead_SkeletonSword02", Range = 5, X = 510, Y = 600},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_Undead_Attack"},
			FigureRun	{Tag = "Undead_SkeletonBow01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonShield01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling03", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonSword01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shiverling02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling01", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonShield02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_SkeletonBow02", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling03", X = 465, Y = 655},
			FigureRun	{Tag = "Undead_Shadeling03", X = 465, Y = 655},
			EventReEnable	{Name = "Undead_Attack_Respawn"},
		},
	},
		
	OnOneTimeRepeatEvent
	{
		EventName = Undead_Attack_Respawn,
		Name = "Undead_Attack_Respawn",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Undead_First_Spawn", Seconds = 5},
			MapFlagIsTrue	{Name = "mf_P710_Undead_Spawn"},
			FigureIsDead	{Tag = "Undead_SkeletonBow01"},
			FigureIsDead	{Tag = "Undead_SkeletonShield01"},
			FigureIsDead	{Tag = "Undead_Shiverling03"},
			FigureIsDead	{Tag = "Undead_SkeletonSword01"},
			FigureIsDead	{Tag = "Undead_Shiverling01"},
			FigureIsDead	{Tag = "Undead_Shiverling02"},
			FigureIsDead	{Tag = "Undead_Shadeling01"},
			FigureIsDead	{Tag = "Undead_SkeletonShield02"},
			FigureIsDead	{Tag = "Undead_Shadeling02"},
			FigureIsDead	{Tag = "Undead_SkeletonBow02"},
			FigureIsDead	{Tag = "Undead_Shadeling03"},
			FigureIsDead	{Tag = "Undead_SkeletonSword02"},
		},
		Actions = 
		{
			MapValueRandomize	{Name = "mv_P710_Undead_Respawn", MinValue = 1, MaxValue = 6},
			MapTimerStart	{Name = "mt_P710_Undead_Respawn"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_Undead_Respawn", Value = 1},
			MapTimerIsElapsed	{Name = "mt_P710_Undead_Respawn", Seconds = 6},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Undead_Respawn"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Respawn"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Random"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Controlled"},
		},
	},
	
		OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_Undead_Respawn", Value = 2},
			MapTimerIsElapsed	{Name = "mt_P710_Undead_Respawn", Seconds = 7},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Undead_Respawn"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Respawn"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Random"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Controlled"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_Undead_Respawn", Value = 3},
			MapTimerIsElapsed	{Name = "mt_P710_Undead_Respawn", Seconds = 8},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Undead_Respawn"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Respawn"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Random"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Controlled"},
		},
	},
	
		OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_Undead_Respawn", Value = 4},
			MapTimerIsElapsed	{Name = "mt_P710_Undead_Respawn", Seconds = 9},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Undead_Respawn"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Respawn"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Random"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Controlled"},
		},
	},
	
		OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_Undead_Respawn", Value = 5},
			MapTimerIsElapsed	{Name = "mt_P710_Undead_Respawn", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Undead_Respawn"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Respawn"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Random"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Controlled"},
		},
	},
	
		OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_Undead_Respawn", Value = 6},
			MapTimerIsElapsed	{Name = "mt_P710_Undead_Respawn", Seconds = 11},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Undead_Respawn"},
			MapFlagSetTrue	{Name = "mf_P710_Undead_Respawn"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Random"},
			EventReEnable	{Name = "Undead_Attack_Spawn_Controlled"},
		},
	},
};