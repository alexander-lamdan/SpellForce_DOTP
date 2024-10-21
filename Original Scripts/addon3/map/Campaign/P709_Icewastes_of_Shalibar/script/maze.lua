--*******************************************************
--*                                                     *
--*   Icewastes of Shalibar :: Maze of Compass script   *
--*                                                     *
--*******************************************************

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

			FogOfWarReveal {FogOfWarId = default, X = 550, Y = 127, Range = 110, Height = 500},

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
	
	
--***********************************
--*                                 *
--*   Kill the Avatar if got 0 HP   *
--*                                 *
--***********************************
	
	OnEvent
	{
		EventName = ">>> Kill the Avatar if got 0 HP <<<",
		Conditions = 
		{

			FigureHasNotHealth {Tag = "pl_HumanAvatar", Percent = 1},
			
			FigureIsAlive	{Tag = "pl_HumanAvatar"},

		},
		Actions =
		{

			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_entrance"},
			FigureKill {Tag = "pl_HumanAvatar"},

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

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_14", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_14"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 15
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 15 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_14", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_15"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 16
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 16 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_14", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_16"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 17
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 17 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_17", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_17"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 18
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 18 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_18", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_18"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 21
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 21 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_21", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_21"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 22
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 22 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_22", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_22"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 25
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 25 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_25", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_25"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 26
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 26 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_26", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_26"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 28
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 28 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_28", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_28"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 32
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 32 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_32", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_32"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 33
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 33 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_33", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_33"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 34
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 34 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_34", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_34"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 36
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 36 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_36", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_36"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 37
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 37 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_37", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_37"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 41
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 41 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_41", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_41"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 42
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 42 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_42", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_42"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 43
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 43 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_43", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_43"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 44
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 44 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_44", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_44"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 46
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 46 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_46", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_46"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 48
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 48 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_48", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_48"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 51
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 51 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_51", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_51"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 52
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 52 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_52", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_52"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 53
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 53 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_53", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_53"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 55
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 55 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_55", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_55"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 57
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 57 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_57", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_57"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 61
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 61 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_61", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_61"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 63
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 63 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_63", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_63"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 67
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 67 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_67", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_67"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 68
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 68 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_68", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_68"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 71
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 71 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_71", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_71"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 72
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 72 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_72", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_72"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 73
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 73 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_73", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_73"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 74
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 74 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_74", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_74"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 75
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 75 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_75", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_75"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 76
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 76 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_76", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_76"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},
	
--	Move the figure back to the start point 81
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 81 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_81", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_81"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 82
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 82 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_82", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_82"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 84
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 84 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_84", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_84"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 85
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 85 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_85", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_85"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 87
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 87 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_87", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_87"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

--	Move the figure back to the start point 88
	
	OnEvent
	{
		EventName = ">>> Move the figure back to the start point 88 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 4},

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_88", Range = 2.5},
			
			MapFlagIsFalse {Name = "mf_P709_BackinMaze"},

		},
		Actions =
		{

			FigureRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_start_88"},
			
			MapFlagSetTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerStart {Name = "mt_P709_BackinMaze"},

		},

	},

-- Reset flag and timer for getting back in the maze

	OnEvent
	{
		EventName = ">>> Reset flag and timer for getting back in the maze <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_BackinMaze"},
			
			MapTimerIsElapsed	{Name = "mt_P709_BackinMaze", Seconds = 1},

		},
		Actions =
		{
			
			MapFlagSetFalse {Name = "mf_P709_BackinMaze"},
			
			MapTimerStop {Name = "mt_P709_BackinMaze"},

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

			MapFlagIsFalse {Name = "mf_P709_UnpassableBarrierWithDamage"},

			AND
			{
				
				OR
				{

					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_14", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_15", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_16", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_17", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_18", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_21", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_22", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_25", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_26", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_28", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_32", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_33", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_34", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_36", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_37", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_41", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_42", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_43", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_44", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_46", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_48", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_51", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_52", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_53", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_55", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_57", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_61", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_63", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_67", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_68", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_71", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_72", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_73", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_74", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_75", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_76", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_81", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_82", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_84", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_85", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_87", Range = 2.5},
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_88", Range = 2.5},

				},

			},
			
		},
		Actions =
		{
			
			FigureHealthSubtract {Tag = "pl_HumanAvatar", Percent = 50},
			
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_DivineBolt_Impact"},
			
			MapFlagSetTrue {Name = "mf_P709_UnpassableBarrierWithDamage"},
			MapTimerStart	{Name = "mt_P709_UnpassableBarrierWithDamage"},

			MapFlagSetTrue {Name = "mf_P709_AvatarGotHit"},

		},

	},

--	Unpassable energy barriers with damage TIMER
	
	OnEvent
	{
		EventName = ">>> Maze unpassable energy barriers with damage TIMER <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_UnpassableBarrierWithDamage"},
			MapTimerIsElapsed	{Name = "mt_P709_UnpassableBarrierWithDamage", Seconds = 2},

		},
		Actions =
		{

			MapFlagSetFalse {Name = "mf_P709_UnpassableBarrierWithDamage"},
			MapTimerStop {Name = "mt_P709_UnpassableBarrierWithDamage"},

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

					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_11", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_23", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_35", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_47", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_54", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_78", Range = 2.5},
					
					FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_gate_86", Range = 2.5},

				}

			}

		},
		Actions =
		{

			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_entrance"},

			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 175},
			
			MapFlagSetTrue {Name = "mf_P709_AvatarGotHit"},

		},

	},

--********************************
--*                              *
--*   Passable energy barriers   *
--*                              *
--********************************
	
--	Passable energy barriers - after pass the barrier (maze_gate_31) is gone

	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_31) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_31"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_31", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_31"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_31) <<<",
		Conditions = 
		{


			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_31", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_31"},

			EntityTimerStop {Name = "et_P709_maze_gate_31"},

		},

	},
	
--	Passable energy barriers - after pass the barrier (maze_gate_62) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_62) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_62"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_62", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_62"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_62) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_62", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_62"},

			EntityTimerStop {Name = "et_P709_maze_gate_62"},

		},

	},
	
--	Passable energy barriers - after pass the barrier (maze_gate_13) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_13) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_13"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_13", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_13"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_13) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_13", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_13"},

			EntityTimerStop {Name = "et_P709_maze_gate_13"},

		},

	},
	
--	Passable energy barriers - after pass the barrier (maze_gate_64) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_64) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_64"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_64", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_64"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_64) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_64", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_64"},

			EntityTimerStop {Name = "et_P709_maze_gate_64"},

		},

	},

--	Passable energy barriers - after pass the barrier (maze_gate_65) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_65) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_65"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_65", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_65"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_65) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_65", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_65"},

			EntityTimerStop {Name = "et_P709_maze_gate_65"},

		},

	},

--	Passable energy barriers - after pass the barrier (maze_gate_56) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_56) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_56"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_56", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_56"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_56) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_56", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_56"},

			EntityTimerStop {Name = "et_P709_maze_gate_56"},

		},

	},

--	Passable energy barriers - after pass the barrier (maze_gate_27) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_27) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_27"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_27", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_27"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_27) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_27", Seconds = 0.85},

		},
		Actions =
		{
	
			ObjectVanish {Tag = "maze_gate_27"},

			EntityTimerStop {Name = "et_P709_maze_gate_27"},

		},

	},
	
--	Passable energy barriers - after pass the barrier (maze_gate_38) is gone
	
	OnOneTimeEvent
	{
		EventName = ">>> Passable energy barriers - after pass the barrier (maze_gate_38) is gone <<<",
		Conditions = 
		{

			PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2.5, TargetTag = "maze_gate_38"},

		},
		Actions =
		{

			EffectStart {Tag = "maze_gate_38", File = "Effect_Dodge_Initial"},

			EntityTimerStart {Name = "et_P709_maze_gate_38"},

		},

	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barrier (maze_gate_38) <<<",
		Conditions = 
		{

			EntityTimerIsElapsed	{Name = "et_P709_maze_gate_38", Seconds = 0.85},

		},
		Actions =
		{
		
			ObjectVanish {Tag = "maze_gate_38"},
			ObjectLootItemMiscAdd	{Tag = "crystal_key_compass", DropChance = 100, ItemId = 747},
			ObjectLootItemMiscAdd	{Tag = "crystal_key_compass", DropChance = 100, ItemId = 764},
			
		}
		
	},
	
--	ACHIEVEMENT: PATHFINDER

	OnOneTimeEvent
	{
		EventName = ">>> ACHIEVEMENT: PATHFINDER <<<",
		Conditions = 
		{

			MapFlagIsFalse {Name = "mf_P709_AvatarGotHit"},
			
			AvatarHasItemMisc	{Player = "default", ItemId = 747, Amount = 1},

		},
		Actions =
		{
		
			AvatarFlagSetTrue {Name = "af_Achievement_P709_Maze"},
			
		}
		
	},
	
-- Deactivate energy barriers when the player gets the Crystal Key Compass
	
	OnOneTimeEvent
	{
		EventName = ">>> Deactivate energy barriers when the player gets the Crystal Key Compass <<<",
		Conditions = 
		{

			AvatarHasItemMisc	{Player = "default", ItemId = 747, Amount = 1},

		},
		Actions =
		{
		
			ObjectVanish {Tag = "maze_gate_11"},
			ObjectVanish {Tag = "maze_gate_12"},
--			ObjectVanish {Tag = "maze_gate_13"},
			ObjectVanish {Tag = "maze_gate_14"},
			ObjectVanish {Tag = "maze_gate_15"},
			ObjectVanish {Tag = "maze_gate_16"},
			ObjectVanish {Tag = "maze_gate_17"},
			ObjectVanish {Tag = "maze_gate_18"},
			
			ObjectVanish {Tag = "maze_gate_21"},
			ObjectVanish {Tag = "maze_gate_22"},
			ObjectVanish {Tag = "maze_gate_23"},
			ObjectVanish {Tag = "maze_gate_24"},
			ObjectVanish {Tag = "maze_gate_25"},
			ObjectVanish {Tag = "maze_gate_26"},
--			ObjectVanish {Tag = "maze_gate_27"},
			ObjectVanish {Tag = "maze_gate_28"},
			
--			ObjectVanish {Tag = "maze_gate_31"},
			ObjectVanish {Tag = "maze_gate_32"},
			ObjectVanish {Tag = "maze_gate_33"},
			ObjectVanish {Tag = "maze_gate_34"},
			ObjectVanish {Tag = "maze_gate_35"},
			ObjectVanish {Tag = "maze_gate_36"},
			ObjectVanish {Tag = "maze_gate_37"},
--			ObjectVanish {Tag = "maze_gate_38"},
			
			ObjectVanish {Tag = "maze_gate_41"},
			ObjectVanish {Tag = "maze_gate_42"},
			ObjectVanish {Tag = "maze_gate_43"},
			ObjectVanish {Tag = "maze_gate_44"},
			ObjectVanish {Tag = "maze_gate_45"},
			ObjectVanish {Tag = "maze_gate_46"},
			ObjectVanish {Tag = "maze_gate_47"},
			ObjectVanish {Tag = "maze_gate_48"},
			
			ObjectVanish {Tag = "maze_gate_51"},
			ObjectVanish {Tag = "maze_gate_52"},
			ObjectVanish {Tag = "maze_gate_53"},
			ObjectVanish {Tag = "maze_gate_54"},
			ObjectVanish {Tag = "maze_gate_55"},
--			ObjectVanish {Tag = "maze_gate_56"},
			ObjectVanish {Tag = "maze_gate_57"},
			ObjectVanish {Tag = "maze_gate_58"},
			
			ObjectVanish {Tag = "maze_gate_61"},
--			ObjectVanish {Tag = "maze_gate_62"},
			ObjectVanish {Tag = "maze_gate_63"},
--			ObjectVanish {Tag = "maze_gate_64"},
--			ObjectVanish {Tag = "maze_gate_65"},
			ObjectVanish {Tag = "maze_gate_66"},
			ObjectVanish {Tag = "maze_gate_67"},
			ObjectVanish {Tag = "maze_gate_68"},
			
			ObjectVanish {Tag = "maze_gate_71"},
			ObjectVanish {Tag = "maze_gate_72"},
			ObjectVanish {Tag = "maze_gate_73"},
			ObjectVanish {Tag = "maze_gate_74"},
			ObjectVanish {Tag = "maze_gate_75"},
			ObjectVanish {Tag = "maze_gate_76"},
			ObjectVanish {Tag = "maze_gate_77"},
			ObjectVanish {Tag = "maze_gate_78"},
			
			ObjectVanish {Tag = "maze_gate_81"},
			ObjectVanish {Tag = "maze_gate_82"},
			ObjectVanish {Tag = "maze_gate_83"},
			ObjectVanish {Tag = "maze_gate_84"},
			ObjectVanish {Tag = "maze_gate_85"},
			ObjectVanish {Tag = "maze_gate_86"},
			ObjectVanish {Tag = "maze_gate_87"},
			ObjectVanish {Tag = "maze_gate_88"},

			EntityTimerStop {Name = "et_P709_maze_gate_38"},

		},

		GotoState = "MAZEND",

	},

--****************************************
--*                                      *
--*   North direction from the compass   *
--*                                      *
--****************************************

--	Maze NORTH direction sign, 1st time

	OnOneTimeEvent
	{
		EventName = ">>> Maze NORTH direction sign, 1st time <<<",
		Conditions = 
		{

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_4b_out", Range = 2},

		},
		Actions =
		{

				FigureOutcry {TextTag = "P709_CRY_MQ_4_T001_AVATAR", Tag = "pl_HumanAvatar"},

		},

	},

	OnEvent
	{
		EventName = ">>> Maze NORTH direction sign <<<",
		Conditions = 
		{

			MapFlagIsFalse {Name = "mf_P709_MazeNorthDirectionSign"},

			AND
			{

				OR
				{

					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_1"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_2"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_3"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_4"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_5"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_6"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_7"},
					PlayerFigureIsInRangeToEntity	{Player = "default", Range = 2, TargetTag = "maze_north_sign_8"},

				},
				
			},

		},
		Actions =
		{
				
				FigureOutcry {TextTag = "P709_CRY_MQ_4_T002_AVATAR", Tag = "pl_HumanAvatar"},
			
				MapFlagSetTrue {Name = "mf_P709_MazeNorthDirectionSign"},
				MapTimerStart	{Name = "mt_P709_MazeNorthDirectionSign"},

		},

	},
	
	OnEvent
	{
		EventName = ">>> Maze NORTH direction sign TIMER <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MazeNorthDirectionSign"},
			
			MapTimerIsElapsed	{Name = "mt_P709_MazeNorthDirectionSign", Seconds = 15},

		},
		Actions =
		{
			
			MapFlagSetFalse {Name = "mf_P709_MazeNorthDirectionSign"},
			MapTimerStop {Name = "mt_P709_MazeNorthDirectionSign"},

		},

	},

};

State
{

	StateName = "MAZEND",
	
};