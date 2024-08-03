--*****************************************************
--*                                                   *
--*   Icewastes of Shalibar :: Cave transport script  *
--*                                                   *
--*****************************************************

State
{

	StateName = "INIT",

-- Cave markers vanish

	OnOneTimeEvent
	{
		EventName = ">>> MQ#2 cave markers vanish <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

		},
		Actions =
		{
			
			ObjectVanish	{Tag = "blocked_cave_marker_1"},
			ObjectVanish	{Tag = "blocked_cave_marker_2"},
			ObjectVanish	{Tag = "blocked_cave_marker_3"},
			ObjectVanish	{Tag = "blocked_cave_marker_4"},

		},
	},
	

-- Cave #1A

	OnEvent
	{
		EventName = ">>> Cave #1A teleport to #1B <<<",
		Conditions = 
		{

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{
			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_1b_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 74.45},

		},
	},

-- Cave #1B

	OnEvent
	{
		EventName = ">>> Cave #1B teleport to #1A <<<",
		Conditions = 
		{

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_1a_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 0},

		},
	},
	
-- Cave #2A

	OnEvent
	{
		EventName = ">>> Cave #2A teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_2b_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 22},

		},
	},
	
-- Cave #2B

	OnEvent
	{
		EventName = ">>> Cave #2B teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_2a_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 80},

		},
	},
	
-- Cave #3A

	OnEvent
	{
		EventName = ">>> Cave #3A teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_3b_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 60},

		},
	},
	
-- Cave #3B

	OnEvent
	{
		EventName = ">>> Cave #3B teleport to #3A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_3a_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 120},

		},
	},

-- Cave #4A

	OnEvent
	{
		EventName = ">>> Cave #4A teleport to #4B <<<",
		Conditions = 
		{

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_4a_in", Range = 4},
			
			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_4b_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 60},

		},
	},
	
-- Cave #4B

	OnEvent
	{
		EventName = ">>> Cave #4B teleport to #4A <<<",
		Conditions = 
		{

			AvatarFlagIsFalse {Name = "af_DragonMounted"},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "cave_4a_out"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 195},

		},
	},

--	Maze Gate opens

	OnOneTimeEvent
	{
		EventName = ">>> Maze Gate opens <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MazeGate"},

		},
		Actions =
		{

			DialogSetDisabled {Tag = "maze_gate"},

			GateSetOpen {Tag = "maze_gate"},

			MapTimerStart	{Name = "mt_P709_MazeGate"},

		},
	},
	
--	Maze Gate opens

	OnOneTimeEvent
	{
		EventName = ">>> Maze Gate opens <<<",
		Conditions = 
		{

			MapTimerIsElapsed {Name = "mt_P709_MazeGate", Seconds = 4},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_MazeAllowed"},
			
			MapTimerStop {Name = "mt_P709_MazeGate"},

		},
	},

};