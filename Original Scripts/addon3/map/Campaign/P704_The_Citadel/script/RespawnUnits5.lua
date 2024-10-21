dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

--------------------------
-- RESPAWN AND ATTACK
--------------------------

State
{
	StateName = "INIT",

--
--------
------------ demon unit respawn
--------
--

--
-- creep respawn to route 1
--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_1abc",
		EventName = "creep respawn timerstart 1abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_1a"},
			FigureIsDead	{Tag = "Nameless_creep_1b"},
			FigureIsDead	{Tag = "Nameless_creep_1c"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_1abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 1abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_1abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_1a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_1a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1a", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1b", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1c", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_1abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_1abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 1abc with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_1abc", Seconds = 21 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_1a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_1a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1a", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1b", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1c", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_1a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1c", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_1abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_1abc"},
		},
	};

--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_1def",
		EventName = "creep respawn timerstart 1def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_1d"},
			FigureIsDead	{Tag = "Nameless_creep_1e"},
			FigureIsDead	{Tag = "Nameless_creep_1f"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_1def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 1def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_1def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_1d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_1d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1d", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1e", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1f", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_1def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_1def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 1def with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_1def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_1d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_1f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_1d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1d", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1e", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1f", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_1d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1f", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_1def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_1def"},
		},
	};

--
-- creep respawn to route 2
--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_2abc",
		EventName = "creep respawn timerstart 2abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_2a"},
			FigureIsDead	{Tag = "Nameless_creep_2b"},
			FigureIsDead	{Tag = "Nameless_creep_2c"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_2abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 2abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_2abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_2a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_2a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2a", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2b", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2c", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_2abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_2abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 2abc with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_2abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_2a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_2a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2a", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2b", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2c", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_2a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2c", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_2abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_2abc"},
		},
	};

--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_2def",
		EventName = "creep respawn timerstart 2def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_2d"},
			FigureIsDead	{Tag = "Nameless_creep_2e"},
			FigureIsDead	{Tag = "Nameless_creep_2f"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_2def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 2def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_2def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_2d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_2d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2d", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2e", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2f", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_2def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_2def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 2def with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_2def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_2d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_2f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_2d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2d", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2e", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2f", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_2d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2f", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_2def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_2def"},
		},
	};

--
-- creep respawn to route 3
--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_3abc",
		EventName = "creep respawn timerstart 3abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_3a"},
			FigureIsDead	{Tag = "Nameless_creep_3b"},
			FigureIsDead	{Tag = "Nameless_creep_3c"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_3abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 3abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_3abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_3a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_3a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3a", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3b", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3c", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_3abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_3abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 3abc with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_3abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_3a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_3a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3a", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3b", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3c", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_3a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3c", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_3abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_3abc"},
		},
	};

--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_3def",
		EventName = "creep respawn timerstart 3def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_3d"},
			FigureIsDead	{Tag = "Nameless_creep_3e"},
			FigureIsDead	{Tag = "Nameless_creep_3f"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_3def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 3def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_3def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_3d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_3d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3d", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3e", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3f", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_3def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_3def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 3def with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_3def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_3d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_3f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_3d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3d", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3e", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3f", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_3d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3f", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_3def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_3def"},
		},
	};

--
-- creep respawn to route 4
--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_4abc",
		EventName = "creep respawn timerstart 4abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_4a"},
			FigureIsDead	{Tag = "Nameless_creep_4b"},
			FigureIsDead	{Tag = "Nameless_creep_4c"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_4abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 4abc",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_4abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_4a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_4a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4a", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4b", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4c", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_4abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_4abc"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 4abc with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_4abc", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_4a", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4b", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4c", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_4a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4c", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4a", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4b", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4c", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_4a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4c", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_4abc"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_4abc"},
		},
	};

--

	OnOneTimeRepeatEvent
	{
		Name = "Event_RespawnTimerStart_Creep_4def",
		EventName = "creep respawn timerstart 4def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			FigureIsDead	{Tag = "Nameless_creep_4d"},
			FigureIsDead	{Tag = "Nameless_creep_4e"},
			FigureIsDead	{Tag = "Nameless_creep_4f"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Respawn_Creep_4def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 4def",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_4def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_4d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_4d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4d", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4e", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4f", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_4def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_4def"},
		},
	};

	OnEvent
	{
		EventName = "creep respawned route 4def with bones",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
			MapTimerIsElapsed	{Name = "mt_P704_Respawn_Creep_4def", Seconds = 20 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Nameless_creep_4d", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4e", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_4f", TargetTag = "Demon_Portal_Central"},

			FigureLevelSet	{Tag = "Nameless_creep_4d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4d", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4e", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4f", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },

			FigureLootItemMiscAdd {Tag = "Nameless_creep_4d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4f", DropChance = iBonesDropChance, ItemId = 675},

			MapTimerStop	{Name = "mt_P704_Respawn_Creep_4def"},
			EventReEnable	{Name = "Event_RespawnTimerStart_Creep_4def"},
		},
	};

--
-- demons route update periodically
--

	OnEvent
	{
		EventName = "route 1 for demons",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},	-- eleg csak 1 sec-enkent
			MapTimerIsElapsed	{Name = "mt_P704_Demons_Update", Seconds = 120 },
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_Demons_Update"},

			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_1a", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_1b", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_1c", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_1d", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_1e", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_1f", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },

			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_2a", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_2b", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_2c", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_2d", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_2e", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_2f", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },

			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_3a", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_3b", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_3c", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_3d", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_3e", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_3f", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },

			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_4a", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_4b", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_4c", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_4d", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_4e", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigurePatrolWalkToEntity {Tag = "Nameless_creep_4f", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
		},
	};

--
-- creep at gate 2
--

	OnEvent
	{
		EventName = "creep respawned at lever 2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P704_Lever_4_Demon_Respawn"},
			FigureIsDead	{Tag = "Nameless_creep_gate2_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate2_02"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P704_Lever_2_Demon_Respawn"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate2_01", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate2_02", TargetTag = "Demon_Portal_Central"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate2_01", TargetTag = "Gate_2_Lever"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate2_02", TargetTag = "Gate_2_Lever"},
			EventReEnable	{Name = "goldfound_gate2_demons"},
		},
	};

--
-- creep at gate 4
--

	OnEvent
	{
		EventName = "creep respawned at lever 4",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P704_Lever_4_Demon_Respawn"},
			FigureIsDead	{Tag = "Nameless_creep_gate4_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate4_02"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P704_Lever_4_Demon_Respawn"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate4_01", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate4_02", TargetTag = "Demon_Portal_Central"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate4_01", TargetTag = "Gate_4_Lever"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate4_02", TargetTag = "Gate_4_Lever"},
			EventReEnable	{Name = "goldfound_gate4_demons"},
		},
	};

--
-- creep at gate 5
--

	OnEvent
	{
		EventName = "creep respawned at lever 5",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P704_Lever_5_Demon_Respawn"},
			FigureIsDead	{Tag = "Nameless_creep_gate5_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate5_02"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P704_Lever_5_Demon_Respawn"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate5_01", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate5_02", TargetTag = "Demon_Portal_Central"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate5_01", TargetTag = "Gate_5_Lever"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate5_02", TargetTag = "Gate_5_Lever"},
			EventReEnable	{Name = "goldfound_gate5_demons"},
		},
	};

--
-- creep at gate 6
--

	OnEvent
	{
		EventName = "creep respawned at lever 6",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P704_Lever_6_Demon_Respawn"},
			FigureIsDead	{Tag = "Nameless_creep_gate6_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate6_02"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P704_Lever_6_Demon_Respawn"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate6_01", TargetTag = "Demon_Portal_Central"},
			FigureRespawnToEntity	{Tag = "Nameless_creep_gate6_02", TargetTag = "Demon_Portal_Central"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate6_01", TargetTag = "Gate_6_Lever"},
			FigureForcedRunToEntity	{Tag = "Nameless_creep_gate6_02", TargetTag = "Gate_6_Lever"},
			EventReEnable	{Name = "goldfound_gate6_demons"},
		},
	};

}
