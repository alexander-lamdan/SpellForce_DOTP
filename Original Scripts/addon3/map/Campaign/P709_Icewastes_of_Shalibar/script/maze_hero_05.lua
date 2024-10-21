--*****************************************************************
--*                                                               *
--*   Icewastes of Shalibar :: Maze of Compass script for Hero 5  *
--*                                                               *
--*****************************************************************

-- local constans for hero 5

local vHero5ID = 260;
local vHero5sTag = "HeroThird";
local vHero5fTag = "pl_HumanHeroThird";

State
{

	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Check if the maze is available, reveal fog of war around the maze <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_MQ_4"},

		},
		Actions =
		{

		},

		GotoState = "MAZE",

	},

}

--**********************
--*                    *
--*   Maze activated   *
--*                    *
--**********************
	
State
{
	
	StateName = "MAZE",
	
	
--*********************************
--*                               *
--*   Kill the hero if got 0 HP   *
--*                               *
--*********************************
	
	OnEvent
	{
		EventName = ">>> Kill the hero if got 0 HP <<<",
		Conditions = 
		{

			FigureHasNotHealth {Tag = vHero5fTag, Percent = 1},
			
			FigureIsAlive	{Tag = vHero5fTag},

		},
		Actions =
		{

			FigureTeleportToEntity	{Tag = vHero5fTag, TargetTag = "maze_entrance"},
			FigureKill {Tag = vHero5fTag},

		},

	},
	
--*****************************************************************************************
--*                                                                                       *
--*   Unpassable energy barriers with damage -- move the figure back to the start point   *
--*                                                                                       *
--*****************************************************************************************

--	Move the figure back to the start point 14
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 14 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_14", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_14"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 15
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 15 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_15", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_15"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 16
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 16 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_16", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_16"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 17
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 17 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_17", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_17"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 18
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 18 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_18", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_18"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 21
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 21 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_21", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_21"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 22
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 22 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_22", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_22"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 25
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 25 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_25", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_25"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 26
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 26 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_26", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_26"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 28
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 28 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_28", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_28"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 32
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 32 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_32", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_32"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 33
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 33 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_33", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_33"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 34
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 34 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_34", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_34"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 36
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 36 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_36", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_36"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 37
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 37 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_37", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_37"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 41
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 41 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_41", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_41"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 42
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 42 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_42", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_42"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 43
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 43 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_43", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_43"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 44
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 44 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_44", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_44"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 46
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 46 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_46", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_46"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 48
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 48 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_48", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_48"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 51
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 51 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},
			
			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_51", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_51"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 52
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 52 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_52", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_52"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 53
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 53 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_53", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_53"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 55
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 55 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_55", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_55"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 57
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 57 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_57", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_57"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 61
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 61 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_61", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_61"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 63
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 63 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_63", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_63"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 67
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 67 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_67", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_67"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 68
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 68 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_68", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_68"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 71
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 71 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_71", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_71"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 72
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 72 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_72", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_72"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 73
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 73 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_73", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_73"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 74
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 74 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_74", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_74"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 75
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 75 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_75", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_75"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 76
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 76 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},
			
			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_76", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_76"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},
	
--	Move the figure back to the start point 81
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 81 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_81", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_81"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 82
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 82 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_82", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_82"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 84
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 84 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_84", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_84"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 85
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 85 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_85", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_85"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 87
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 87 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_87", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_87"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--	Move the figure back to the start point 88
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 88 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_88", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMazeHero5"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_start_88"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStart {Name = "mf_P709_BackinMazeHero5"},

		},

	},

-- Reset flag and timer for getting back in the maze

	OnEvent
	{
		EventName = ">>> Reset flag and timer for getting back in the maze <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerIsElapsed	{Name = "mf_P709_BackinMazeHero5", Seconds = 1},

		},
		Actions =
		{
			
			MapFlagSetFalse {Name = "mf_P709_BackinMazeHero5"},
			
			MapTimerStop {Name = "mf_P709_BackinMazeHero5"},

		},

	},

--**********************************************
--*                                            *
--*   Unpassable energy barriers with damage   *
--*                                            *
--**********************************************
	
	OnEvent
	{
		EventName = ">>> Maze unpassable energy barriers with damage <<<",
		Conditions = 
		{

			MapFlagIsFalse {Name = "mf_P709_UnpassableBarrierWithDamageHero5"},

			AND
			{
				
				OR
				{

					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_14", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_15", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_16", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_17", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_18", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_21", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_22", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_25", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_26", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_28", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_32", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_33", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_34", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_36", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_37", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_41", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_42", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_43", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_44", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_46", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_48", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_51", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_52", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_53", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_55", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_57", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_61", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_63", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_67", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_68", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_71", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_72", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_73", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_74", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_75", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_76", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_81", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_82", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_84", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_85", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_87", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_88", Range = 2.5},

				},

			},
			
		},
		Actions =
		{
			
			FigureHealthSubtract {Tag = vHero5fTag, Percent = 50},
			
			EffectStart {Tag = vHero5fTag, File = "Effect_DivineBolt_Impact"},
			
			MapFlagSetTrue {Name = "mf_P709_UnpassableBarrierWithDamageHero5"},
			MapTimerStart	{Name = "mt_P709_UnpassableBarrierWithDamageHero5"},

			MapFlagSetTrue {Name = "mf_P709_AvatarGotHit"},

		},

	},

--	Unpassable energy barriers with damage TIMER
	
	OnEvent
	{
		EventName = ">>> Maze unpassable energy barriers with damage TIMER <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_UnpassableBarrierWithDamageHero5"},
			MapTimerIsElapsed	{Name = "mt_P709_UnpassableBarrierWithDamageHero5", Seconds = 2},

		},
		Actions =
		{

			MapFlagSetFalse {Name = "mf_P709_UnpassableBarrierWithDamageHero5"},
			MapTimerStop {Name = "mt_P709_UnpassableBarrierWithDamageHero5"},

		},

	},

--************************************************
--*                                              *
--*   Unpassable energy barriers with teleport   *
--*                                              *
--************************************************

	OnEvent
	{
		EventName = ">>> Unpassable energy barriers with teleport <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			AND
			{

				OR
				{
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_11", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_23", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_35", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_47", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_54", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_78", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "maze_gate_86", Range = 2.5},

				}

			}

		},
		Actions =
		{

			FigureTeleportToEntity	{Tag = vHero5fTag, TargetTag = "maze_entrance"},

			FigureDirectionSet	{Tag = vHero5fTag, Direction = 175},
			
			MapFlagSetTrue {Name = "mf_P709_AvatarGotHit"},

		},

	},

-- Maze script end state for the hero
	
	OnOneTimeEvent
	{
		EventName = ">>> Maze script end state for the hero <<<",
		Conditions = 
		{

			AvatarHasItemMisc	{Player = "default", ItemId = 747, Amount = 1},

		},
		Actions =
		{

		},

		GotoState = "MAZEND",

	},

};

State
{

	StateName = "MAZEND",
	
};