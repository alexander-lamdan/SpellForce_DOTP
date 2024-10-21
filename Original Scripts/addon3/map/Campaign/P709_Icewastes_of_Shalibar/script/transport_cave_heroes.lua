--****************************************************************
--*                                                              *
--*   Icewastes of Shalibar :: Cave transport script for heroes  *
--*                                                              *
--****************************************************************

-- local constans for heroes

local vHero1ID = 182;
local vHero1sTag = "HeroCaine";
local vHero1fTag = "pl_HumanHeroCaine";

local vHero2ID = 250;
local vHero2sTag = "HeroOrc";
local vHero2fTag = "pl_HumanHeroOrc";

local vHero3ID = 251;
local vHero3sTag = "HeroFirst";
local vHero3fTag = "pl_HumanHeroFirst";

local vHero4ID = 257;
local vHero4sTag = "HeroSecond";
local vHero4fTag = "pl_HumanHeroSecond";

local vHero5ID = 260;
local vHero5sTag = "HeroThird";
local vHero5fTag = "pl_HumanHeroThird";

local vHero6ID = 259;
local vHero6sTag = "CompanionCraigHuman";
local vHero6fTag = "pl_HumanCompanionCraigHuman";

local vHero7ID = 262;
local vHero7sTag = "CompanionSariel";
local vHero7fTag = "pl_HumanCompanionSariel";

State
{

	StateName = "INIT",

-- ******************************
-- *                            *
-- *   Hero 1 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 1

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 1 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 1

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 1 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 0},

		},
	},

-- Cave #2A HERO 1

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 1 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 1

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 1 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 1

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 1 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 1

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 1 teleport to #3A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 120},

		},
	},
	
-- Cave #4A HERO 1

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 1 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 1

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 1 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 195},

		},
	},

-- ******************************
-- *                            *
-- *   Hero 2 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 2

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 2 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 2

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 2 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 0},

		},
	},
	
-- Cave #2A HERO 2

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 2 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 2

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 2 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 2

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 2 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 2

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 2 teleport to #3A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 120},

		},
	},
	
-- Cave #4A HERO 2

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 2 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 2

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 2 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 195},

		},
	},

-- ******************************
-- *                            *
-- *   Hero 3 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 3

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 3 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 3

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 3 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 0},

		},
	},
	
-- Cave #2A HERO 3

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 3 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 3

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 3 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 3

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 3 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 3

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 3 teleport to #3A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 120},

		},
	},
	
-- Cave #4A HERO 3

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 3 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 3

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 3 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 195},

		},
	},
	
-- ******************************
-- *                            *
-- *   Hero 4 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 4

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 4 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 4

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 4 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 0},

		},
	},
	
-- Cave #2A HERO 4

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 4 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 4

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 4 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 4

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 4 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 4

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 4 teleport to #3A <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 120},

		},
	},
	
-- Cave #4A HERO 4

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 4 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 4

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 4 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 195},

		},
	},

-- ******************************
-- *                            *
-- *   Hero 5 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 5

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 5 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 5

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 5 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 0},

		},
	},
	
-- Cave #2A HERO 4

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 5 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 5

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 5 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 5

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 5 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 5

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 5 teleport to #3A <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 120},

		},
	},
	
-- Cave #4A HERO 5

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 5 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 5

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 5 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 195},

		},
	},
	
-- ******************************
-- *                            *
-- *   Hero 6 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 6

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 6 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 6

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 6 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 0},

		},
	},
	
-- Cave #2A HERO 6

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 6 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 6

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 6 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 6

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 6 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 6

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 6 teleport to #3A <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 120},

		},
	},
	
-- Cave #4A HERO 6

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 6 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 6

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 6 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 195},

		},
	},

	
-- ******************************
-- *                            *
-- *   Hero 7 teleport control  *
-- *                            *
-- ******************************

-- Cave #1A HERO 7

	OnEvent
	{
		EventName = ">>> Cave #1A HERO 7 teleport to #1B <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_1a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_1b_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 74.45},

		},
	},

-- Cave #1B HERO 7

	OnEvent
	{
		EventName = ">>> Cave #1B HERO 7 teleport to #1A <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_1b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_1a_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 0},

		},
	},
	
-- Cave #2A HERO 7

	OnEvent
	{
		EventName = ">>> Cave #2A HERO 7 teleport to #2B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_2a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_2b_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 22},

		},
	},
	
-- Cave #2B HERO 7

	OnEvent
	{
		EventName = ">>> Cave #2B HERO 7 teleport to #2A <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_2b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_2a_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 80},

		},
	},
	
-- Cave #3A HERO 7

	OnEvent
	{
		EventName = ">>> Cave #3A HERO 7 teleport to #3B <<<",	
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_3a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_3b_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 60},

		},
	},
	
-- Cave #3B HERO 7

	OnEvent
	{
		EventName = ">>> Cave #3B HERO 7 teleport to #3A <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_3b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_3a_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 120},

		},
	},
	
	-- Cave #4A HERO 7

	OnEvent
	{
		EventName = ">>> Cave #4A HERO 7 teleport to #4B <<<",	
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazeAllowed"},

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_4a_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_4b_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 60},

		},
	},
	
-- Cave #4B HERO 7

	OnEvent
	{
		EventName = ">>> Cave #4B HERO 7 teleport to #4A <<<",	
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_4b_in", Range = 4},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "cave_4a_out"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 195},

		},
	},

};