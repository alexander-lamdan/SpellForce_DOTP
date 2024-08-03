-- Enable:		MapFlagSetTrue	{Name = "mf_P706_Spawner_NL2_Enabled"},
-- Cannot be disabled
-- Disables itself when NLHQ1 building is destroyed


local RespawnDelay = 120;

local PointSpawn = 	"path_NL2_00";
local Point01 = 		"path_NL2_01";

local uWarrior 				= 1655;
local uSpike					= 1681;
local uWarriorGiant		= 1724;
local uRenegadeSword	= 1717;
local uMage						= 1656;
local uChosen					= 1658;
local uChosenGiant		=	1723;
local uArtillery			= 1657;

local tm = "tm_Nameless";




State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> mf_P706_Spawner_NL2_Enabled set --> activating the easier difficulty version <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_Spawner_NL2_Enabled"},
			OR
			{
			  GameDifficulty {Value = Diff.Easy},					
			  GameDifficulty {Value = Diff.Normal},					
			},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_NL2_Index", Value = 0}, -- wave number in the current cycle
		},
		GotoState = "ACTIVE",
	},

	OnOneTimeEvent
	{
		EventName = ">>> mf_P706_Spawner_NL2_Enabled set --> activating the harder difficulty version <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_Spawner_NL2_Enabled"},
			OR
			{
			  GameDifficulty {Value = Diff.Hard},					
			  GameDifficulty {Value = Diff.Extreme},					
			},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_NL2_Index", Value = 0}, -- wave number in the current cycle
		},
		GotoState = "ACTIVE_HARD",
	},
};






State
{
	StateName = "ACTIVE",

	OnOneTimeRepeatEvent --*************************************************************************** Wave_00
	{
		EventName = ">>> Wave_00: mv_P706_Spawner_NL2_Index == 0 - never repeated <<<",
		Name = "NL2_Wave_00",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 0},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_00_CHASE_START"},
			EventReEnable {Name = "Wave_01"},

			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_00_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_00_02", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_00_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_00_02", TargetTag = Point01},			

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Group01_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 00 start chasing
	{
		EventName = ">>> Wave_00 in idle -> mf_P706_Spawner_NL2_Group_00_idle set to TRUE <<<",
		Name = "Wave_00_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},	
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_00_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_00_02"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_00_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_00_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	
	
	
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_01
	{
		EventName = ">>> Wave_01: mv_P706_Spawner_NL2_Index == 1  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 1},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_01_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_01_02", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_01_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_01_02", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_01_CHASE_START"},
			EventReEnable {Name = "Wave_02"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
		},
	},
	
	OnOneTimeRepeatEvent -- Wave 01 start chasing
	{
		EventName = ">>> Wave_01 in idle -> mf_P706_Spawner_NL2_Group_01_idle set to TRUE <<<",
		Name = "Wave_01_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_01_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_01_02"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_01_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_01_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_02
	{
		EventName = ">>> Wave_02: mv_P706_Spawner_NL2_Index == 2  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_02",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 2},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_02", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_03", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_02_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_02_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_02_03", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_02_CHASE_START"},
			EventReEnable {Name = "Wave_03"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 02 start chasing
	{
		EventName = ">>> Wave_02 in idle -> mf_P706_Spawner_NL2_Group_02_idle set to TRUE <<<",
		Name = "Wave_02_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_02_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_02_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_02_03"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_03
	{
		EventName = ">>> Wave_03: mv_P706_Spawner_NL2_Index == 3  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_03",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 3},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_03_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_04", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_03_CHASE_START"},
			EventReEnable {Name = "Wave_04"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 03 start chasing
	{
		EventName = ">>> Wave_03 in idle -> mf_P706_Spawner_NL2_Group_03_idle set to TRUE <<<",
		Name = "Wave_03_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_03_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_04"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_04
	{
		EventName = ">>> Wave_04: mv_P706_Spawner_NL2_Index == 4  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_04",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 4},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_04_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_04", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_04_CHASE_START"},
			EventReEnable {Name = "Wave_05"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 04 start chasing
	{
		EventName = ">>> Wave_04 in idle -> mf_P706_Spawner_NL2_Group_04_idle set to TRUE <<<",
		Name = "Wave_04_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_04_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_04"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_05
	{
		EventName = ">>> Wave_05: mv_P706_Spawner_NL2_Index == 5  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_05",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 5},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_05_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_04", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_05_CHASE_START"},
			EventReEnable {Name = "Wave_06"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 05 start chasing
	{
		EventName = ">>> Wave_05 in idle -> mf_P706_Spawner_NL2_Group_05_idle set to TRUE <<<",
		Name = "Wave_05_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_05_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_04"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_06
	{
		EventName = ">>> Wave_06: mv_P706_Spawner_NL2_Index == 6  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_06",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 6},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_03", Player = "pl_Nameless", Level = 0, UnitId = uSpike,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_06_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_06_CHASE_START"},
			EventReEnable {Name = "Wave_07"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 06 start chasing
	{
		EventName = ">>> Wave_06 in idle -> mf_P706_Spawner_NL2_Group_06_idle set to TRUE <<<",
		Name = "Wave_06_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_06_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_07
	{
		EventName = ">>> Wave_07: mv_P706_Spawner_NL2_Index == 7  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_07",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 7},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_03", Player = "pl_Nameless", Level = 0, UnitId = uSpike,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_07_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_07_CHASE_START"},
			EventReEnable {Name = "Wave_08"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 07 start chasing
	{
		EventName = ">>> Wave_07 in idle -> mf_P706_Spawner_NL2_Group_07_idle set to TRUE <<<",
		Name = "Wave_07_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_07_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_08
	{
		EventName = ">>> Wave_08: mv_P706_Spawner_NL2_Index == 8  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_08",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 8},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_03", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_08_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_08_CHASE_START"},
			EventReEnable {Name = "Wave_09"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 08 start chasing
	{
		EventName = ">>> Wave_08 in idle -> mf_P706_Spawner_NL2_Group_08_idle set to TRUE <<<",
		Name = "Wave_08_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_08_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_09
	{
		EventName = ">>> Wave_09: mv_P706_Spawner_NL2_Index == 9  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_09",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 9},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,		TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_03", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,		TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_09_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_09_CHASE_START"},
			EventReEnable {Name = "Wave_10"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 09 start chasing
	{
		EventName = ">>> Wave_09 in idle -> mf_P706_Spawner_NL2_Group_09_idle set to TRUE <<<",
		Name = "Wave_09_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_09_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

		
	OnOneTimeRepeatEvent --*************************************************************************** Wave_10
	{
		EventName = ">>> Wave_10: mv_P706_Spawner_NL2_Index == 10  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_10",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 10},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_03", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_10_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_06", TargetTag = Point01},
			
			MapValueSet	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_10_CHASE_START"},
			EventReEnable {Name = "Wave_01"}, -- start again

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 10 start chasing
	{
		EventName = ">>> Wave_10 in idle -> mf_P706_Spawner_NL2_Group_10_idle set to TRUE <<<",
		Name = "Wave_10_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_10_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},


	---------------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = ">>> NLHQ1 is destroyed --> Spawner disables itself <<<",
		Conditions = 
		{
			BuildingIsDead	{Tag = "NLHQ1"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
		},
		GotoState = "ENDED",
	},	
	
	OnEvent
	{
		EventName = ">>> Difficulty changed --> Switching to hard difficulty... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			

			MapFlagIsTrue	{Name = "mf_P706_Spawner_NL2_Enabled"},
			OR
			{
			  GameDifficulty {Value = Diff.Hard},					
			  GameDifficulty {Value = Diff.Extreme},					
			},
		},
		Actions =
		{
		},
		GotoState = "ACTIVE_HARD",
	},
};







State
{
	StateName = "ACTIVE_HARD",

	OnOneTimeRepeatEvent --*************************************************************************** Wave_00
	{
		EventName = ">>> Wave_00: mv_P706_Spawner_NL2_Index == 0 - never repeated <<<",
		Name = "NL2_Wave_00",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 0},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_00_CHASE_START"},
			EventReEnable {Name = "Wave_01"},

			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_00_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_00_02", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_00_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 

			FigureRunToEntity {Tag = "Spawned_NL2_00_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_00_02", TargetTag = Point01},			
			FigureRunToEntity {Tag = "Spawned_NL2_00_03", TargetTag = Point01},			

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 00 start chasing
	{
		EventName = ">>> Wave_00 in idle -> mf_P706_Spawner_NL2_Group_00_idle set to TRUE <<<",
		Name = "Wave_00_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},	
					
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_00_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_00_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_00_03"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_00_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_00_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_00_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave00_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_01
	{
		EventName = ">>> Wave_01: mv_P706_Spawner_NL2_Index == 1  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 1},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_01_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_01_02", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_01_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_01_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_01_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_01_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_01_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_01_04", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_01_CHASE_START"},
			EventReEnable {Name = "Wave_02"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 01 start chasing
	{
		EventName = ">>> Wave_01 in idle -> mf_P706_Spawner_NL2_Group_01_idle set to TRUE <<<",
		Name = "Wave_01_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_01_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_01_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_01_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_01_04"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_01_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_01_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
		OnFollowEvent
	{
		Tag = "Spawned_NL2_01_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_01_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave01_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_02
	{
		EventName = ">>> Wave_02: mv_P706_Spawner_NL2_Index == 2  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_02",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 2},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_02", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_02_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_02_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_02_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_02_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_02_04", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_02_CHASE_START"},
			EventReEnable {Name = "Wave_03"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 02 start chasing
	{
		EventName = ">>> Wave_02 in idle -> mf_P706_Spawner_NL2_Group_02_idle set to TRUE <<<",
		Name = "Wave_02_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_02_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_02_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_02_03"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_02_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave02_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_03
	{
		EventName = ">>> Wave_03: mv_P706_Spawner_NL2_Index == 3  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_03",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 3},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_05", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_03_06", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_03_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_03_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_03_CHASE_START"},
			EventReEnable {Name = "Wave_04"},
			
			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 03 start chasing
	{
		EventName = ">>> Wave_03 in idle -> mf_P706_Spawner_NL2_Group_03_idle set to TRUE <<<",
		Name = "Wave_03_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_03_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_03_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_03_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave03_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},	

	OnOneTimeRepeatEvent --*************************************************************************** Wave_04
	{
		EventName = ">>> Wave_04: mv_P706_Spawner_NL2_Index == 4  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_04",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 4},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_05", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_04_06", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_04_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_04_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_04_CHASE_START"},
			EventReEnable {Name = "Wave_05"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 04 start chasing
	{
		EventName = ">>> Wave_04 in idle -> mf_P706_Spawner_NL2_Group_04_idle set to TRUE <<<",
		Name = "Wave_04_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_04_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_04_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_04_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave04_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_05
	{
		EventName = ">>> Wave_05: mv_P706_Spawner_NL2_Index == 5  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_05",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 5},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_03", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_04", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_05_06", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL2_05_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_05_06", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_05_CHASE_START"},
			EventReEnable {Name = "Wave_06"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
		},
	},
	
	OnOneTimeRepeatEvent -- Wave 05 start chasing
	{
		EventName = ">>> Wave_05 in idle -> mf_P706_Spawner_NL2_Group_05_idle set to TRUE <<<",
		Name = "Wave_05_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_05_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_05_06"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_05_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave05_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_06
	{
		EventName = ">>> Wave_06: mv_P706_Spawner_NL2_Index == 6  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_06",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 6},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_03", Player = "pl_Nameless", Level = 0, UnitId = uSpike,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_07", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_06_08", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 

			FigureRunToEntity {Tag = "Spawned_NL2_06_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_06", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_07", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_06_08", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_06_CHASE_START"},
			EventReEnable {Name = "Wave_07"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 06 start chasing
	{
		EventName = ">>> Wave_06 in idle -> mf_P706_Spawner_NL2_Group_06_idle set to TRUE <<<",
		Name = "Wave_06_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_06_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_06"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_07"},
				FigureIsIdle	{Tag = "Spawned_NL2_06_08"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_07",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_06_08",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave06_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_07
	{
		EventName = ">>> Wave_07: mv_P706_Spawner_NL2_Index == 7  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_07",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 7},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_03", Player = "pl_Nameless", Level = 0, UnitId = uSpike,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_07", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_07_08", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 

			FigureRunToEntity {Tag = "Spawned_NL2_07_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_06", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_07", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_07_08", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_07_CHASE_START"},
			EventReEnable {Name = "Wave_08"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 07 start chasing
	{
		EventName = ">>> Wave_07 in idle -> mf_P706_Spawner_NL2_Group_07_idle set to TRUE <<<",
		Name = "Wave_07_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			

			OR
			{				
				FigureIsIdle	{Tag = "Spawned_NL2_07_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_06"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_07"},
				FigureIsIdle	{Tag = "Spawned_NL2_07_08"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_07",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_07_08",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave07_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
		
	OnOneTimeRepeatEvent --*************************************************************************** Wave_08
	{
		EventName = ">>> Wave_08: mv_P706_Spawner_NL2_Index == 8  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_08",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 8},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_03", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_07", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_08_08", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 

			FigureRunToEntity {Tag = "Spawned_NL2_08_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_06", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_07", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_08_08", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_08_CHASE_START"},
			EventReEnable {Name = "Wave_09"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 08 start chasing
	{
		EventName = ">>> Wave_08 in idle -> mf_P706_Spawner_NL2_Group_08_idle set to TRUE <<<",
		Name = "Wave_08_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_08_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_06"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_07"},
				FigureIsIdle	{Tag = "Spawned_NL2_08_08"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_07",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_08_08",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave08_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_09
	{
		EventName = ">>> Wave_09: mv_P706_Spawner_NL2_Index == 9  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_09",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 9},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,		TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_03", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,		TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_07", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,		TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_09_08", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 

			FigureRunToEntity {Tag = "Spawned_NL2_09_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_06", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_07", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_09_08", TargetTag = Point01},
			
			MapValueAdd	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_09_CHASE_START"},
			EventReEnable {Name = "Wave_10"},

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 09 start chasing
	{
		EventName = ">>> Wave_09 in idle -> mf_P706_Spawner_NL2_Group_09_idle set to TRUE <<<",
		Name = "Wave_09_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_09_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_06"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_07"},
				FigureIsIdle	{Tag = "Spawned_NL2_09_08"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_07",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_09_08",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave09_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_10
	{
		EventName = ">>> Wave_10: mv_P706_Spawner_NL2_Index == 10  AND  mt_P706_Spawner_NL2_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_10",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL2_Index", Value = 10},
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL2_RespawnedTime", Seconds = RespawnDelay},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_01", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_02", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_03", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_04", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_05", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_06", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm},
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_07", Player = "pl_Nameless", Level = 0, UnitId = uWarrior,			TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_08", Player = "pl_Nameless", Level = 0, UnitId = uSpike,				TargetTag = PointSpawn, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL2_10_09", Player = "pl_Nameless", Level = 0, UnitId = uChosen,			TargetTag = PointSpawn, Team = tm}, 

			FigureRunToEntity {Tag = "Spawned_NL2_10_01", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_02", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_03", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_04", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_05", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_06", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_07", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_08", TargetTag = Point01},
			FigureRunToEntity {Tag = "Spawned_NL2_10_09", TargetTag = Point01},
			
			MapValueSet	{Name = "mv_P706_Spawner_NL2_Index", Value = 1}, -- wave number in the current cycle
			MapTimerStart	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
			EventReEnable {Name = "Wave_10_CHASE_START"},
			EventReEnable {Name = "Wave_01"}, -- start again

			MapFlagSetFalse	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
		},
	},

	OnOneTimeRepeatEvent -- Wave 10 start chasing
	{
		EventName = ">>> Wave_10 in idle -> mf_P706_Spawner_NL2_Group_10_idle set to TRUE <<<",
		Name = "Wave_10_CHASE_START",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			
			
			OR
			{		
				FigureIsIdle	{Tag = "Spawned_NL2_10_01"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_02"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_03"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_04"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_05"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_06"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_07"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_08"},
				FigureIsIdle	{Tag = "Spawned_NL2_10_09"},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_07",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_08",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},	
	
	OnFollowEvent
	{
		Tag = "Spawned_NL2_10_09",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mv_P706_Spawner_NL2_Wave10_ChaseAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
		},
	},	
	
	---------------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = ">>> NLHQ1 is destroyed --> Spawner disables itself <<<",
		Conditions = 
		{
			BuildingIsDead	{Tag = "NLHQ1"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_NL2_RespawnedTime"},
		},
		GotoState = "ENDED",
	},
	
	OnEvent
	{
		EventName = ">>> Difficulty changed --> Switching to normal difficulty... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},			

			MapFlagIsTrue	{Name = "mf_P706_Spawner_NL2_Enabled"},
			OR
			{
			  GameDifficulty {Value = Diff.Easy},					
			  GameDifficulty {Value = Diff.Normal},					
			},
		},
		Actions =
		{
		},
		GotoState = "ACTIVE",
	},
};



State
{
	StateName = "ENDED",
};
