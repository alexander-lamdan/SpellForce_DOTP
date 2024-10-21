-- Enable:									MapFlagSetTrue	{Name = "mf_P706_Spawner_Shaikan1_Enabled"},
-- Disable:									MapFlagSetFalse	{Name = "mf_P706_Spawner_Shaikan1_Enabled"},
-- Kill all spawned units:	MapFlagSetTrue	{Name = "mf_P706_Spawner_Shaikan1_Exterminate"}, !!! kills the units only after it is disaled
-- Cannot be reactivated once disabled

-- Note for balance: don't forget, that every figure is present both in an actions both in a conditions block, plus! in the extermination block


local RespawnDelay = 120;

local Point00 = "path_Shaikan1_00";
local Point01 = "path_Shaikan1_01";
local Point02 = "path_Shaikan1_02";
local Point03 = "path_Shaikan1_03";
local Point04 = "path_Shaikan1_04";






State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> mf_P706_Spawner_Shaikan1_Enabled set --> activating <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_Spawner_Shaikan1_Enabled"},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 0}, -- wave number in the current cycle
		},
		GotoState = "ACTIVE",
	},
};






State
{
	StateName = "ACTIVE",

	OnOneTimeRepeatEvent --*************************************************************************** Wave_00
	{
		EventName = ">>> Wave_00: mv_P706_Spawner_Shaikan1_Index == 0 - never repeated <<<",
		Name = "Wave_00",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 0},
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_01"},		
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_02"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_03"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_04"},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_00_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_00_02", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_00_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_00_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_01"},
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_01
	{
		EventName = ">>> Wave_01: mv_P706_Spawner_Shaikan1_Index == 1  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1},
			FigureIsDead	{Tag = "Spawned_Shaikan1_00_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_00_02"},						
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_01"},		-- TODO: test this
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_02"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_03"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_10_04"},			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_01_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_01_02", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_01_02", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_01_03", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_01_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_01_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
--			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_01_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_02"},
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_02
	{
		EventName = ">>> Wave_02: mv_P706_Spawner_Shaikan1_Index == 2  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_02",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 2},
			FigureIsDead	{Tag = "Spawned_Shaikan1_01_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_01_02"},						
--			FigureIsDead	{Tag = "Spawned_Shaikan1_01_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_02_01", Player = "pl_Shaikan", Level = 3, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_02_02", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_02_03", Player = "pl_Shaikan", Level = 3, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_02_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_02_02", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_02_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_02_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
--			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_02_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_03"},
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_03
	{
		EventName = ">>> Wave_03: mv_P706_Spawner_Shaikan1_Index == 3  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_03",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 3},--			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Shaikan1_RespawnedTime", Seconds = RespawnDelay},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_02_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_02_02"},						
--			FigureIsDead	{Tag = "Spawned_Shaikan1_02_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_03_01", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_03_02", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_03_03", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_03_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_03_02", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_03_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_03_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
--			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_03_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_04"},
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_04
	{
		EventName = ">>> Wave_04: mv_P706_Spawner_Shaikan1_Index == 4  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_04",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 4},
			FigureIsDead	{Tag = "Spawned_Shaikan1_03_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_03_02"},						
--			FigureIsDead	{Tag = "Spawned_Shaikan1_03_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_04_01", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_04_02", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_04_03", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_04_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_04_01", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_04_02", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_04_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_04_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
--			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_04_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_05"},
		},
	},

	OnOneTimeRepeatEvent --*************************************************************************** Wave_05
	{
		EventName = ">>> Wave_05: mv_P706_Spawner_Shaikan1_Index == 5  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_05",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 5},
			FigureIsDead	{Tag = "Spawned_Shaikan1_04_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_04_02"},						
--			FigureIsDead	{Tag = "Spawned_Shaikan1_04_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_05_01", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_05_02", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_05_03", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_05_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_05_01", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_05_02", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_05_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_05_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
--			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_05_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_06"},
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_06
	{
		EventName = ">>> Wave_06: mv_P706_Spawner_Shaikan1_Index == 6  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_06",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 6},
			FigureIsDead	{Tag = "Spawned_Shaikan1_05_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_05_02"},						
--			FigureIsDead	{Tag = "Spawned_Shaikan1_05_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_06_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_06_02", Player = "pl_Shaikan", Level = 4, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_06_03", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_06_01", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_06_02", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_06_03", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_06_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_06_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_06_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_07"},
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_07
	{
		EventName = ">>> Wave_07: mv_P706_Spawner_Shaikan1_Index == 7  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_07",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 7},
			FigureIsDead	{Tag = "Spawned_Shaikan1_06_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_06_02"},						
			FigureIsDead	{Tag = "Spawned_Shaikan1_06_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_07_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_07_02", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_07_03", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_07_01", Player = "pl_Shaikan", Level = 2, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_07_01", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_07_02", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_07_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_07_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
--			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_07_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_08"},
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_08
	{
		EventName = ">>> Wave_08: mv_P706_Spawner_Shaikan1_Index == 8  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_08",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 8},
			FigureIsDead	{Tag = "Spawned_Shaikan1_07_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_07_02"},						
--			FigureIsDead	{Tag = "Spawned_Shaikan1_07_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_08_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_08_02", Player = "pl_Shaikan", Level = 6, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_08_03", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_08_01", Player = "pl_Shaikan", Level = 5, UnitId = 1120, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Spellbreaker
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_08_02", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_08_03", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_08_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_08_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_08_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_09"},
		},
	},
	
	OnOneTimeRepeatEvent --*************************************************************************** Wave_09
	{
		EventName = ">>> Wave_09: mv_P706_Spawner_Shaikan1_Index == 9  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_09",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 9},
			FigureIsDead	{Tag = "Spawned_Shaikan1_08_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_08_02"},						
			FigureIsDead	{Tag = "Spawned_Shaikan1_08_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_01", Player = "pl_Shaikan", Level = 6, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_02", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_03", Player = "pl_Shaikan", Level = 6, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_01", Player = "pl_Shaikan", Level = 5, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_02", Player = "pl_Shaikan", Level = 5, UnitId = 1120, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Spellbreaker
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_01", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_02", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_09_03", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_09_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_09_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_09_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueAdd	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_10"},
		},
	},
		
	OnOneTimeRepeatEvent --*************************************************************************** Wave_10
	{
		EventName = ">>> Wave_10: mv_P706_Spawner_Shaikan1_Index == 10  AND  mt_P706_Spawner_Shaikan1_RespawnedTime > RespawnDelay <<<",
		Name = "Wave_10",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 10},
			FigureIsDead	{Tag = "Spawned_Shaikan1_09_01"},			
			FigureIsDead	{Tag = "Spawned_Shaikan1_09_02"},						
			FigureIsDead	{Tag = "Spawned_Shaikan1_09_03"},						
		},
		Actions =
		{
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_01", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_02", Player = "pl_Shaikan", Level = 5, UnitId = 1125, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blademaster
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_03", Player = "pl_Shaikan", Level = 5, UnitId = 1128, TargetTag = Point00, Team = "tm_Shaikan"}, -- Marksman
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_04", Player = "pl_Shaikan", Level = 5, UnitId = 1128, TargetTag = Point00, Team = "tm_Shaikan"}, -- Marksman
--			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_01", Player = "pl_Shaikan", Level = 2, UnitId = 1119, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Minion
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_01", Player = "pl_Shaikan", Level = 5, UnitId = 1120, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Spellbreaker
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_02", Player = "pl_Shaikan", Level = 5, UnitId = 1120, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Spellbreaker
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_03", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer
			FigureNpcSpawnToEntity	{Tag = "Spawned_Shaikan1_10_04", Player = "pl_Shaikan", Level = 5, UnitId = 1121, TargetTag = Point00, Team = "tm_Shaikan"}, -- Blade Destroyer

			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_10_01", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_10_02", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_10_03", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_Shaikan1_10_04", TargetTag = Point04}, Tags = {Point01, Point02, Point03}},			
			
			MapValueSet	{Name = "mv_P706_Spawner_Shaikan1_Index", Value = 1}, -- wave number in the current cycle
			EventReEnable {Name = "Wave_01"}, -- start again
		},
	},

	

	---------------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = ">>> mf_P706_Spawner_Shaikan1_Enabled cleared --> deactivating <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Spawner_Shaikan1_Enabled"},		
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_Shaikan1_RespawnedTime"},
		},
		GotoState = "ENDED",
	},
};




State
{
	StateName = "ENDED",
	
	OnOneTimeEvent --*************************************************************************** Exterminate all spawned units
	{
		EventName = ">>> Exterminate all spawned units (mf_P706_Spawner_Shaikan1_Exterminate is true) <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_Spawner_Shaikan1_Exterminate"},		
		},
		Actions =
		{
			FigureVanish	{Tag = "Spawned_Shaikan1_00_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_00_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_01_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_01_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_01_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_02_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_02_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_02_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_03_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_03_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_03_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_04_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_04_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_04_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_05_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_05_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_05_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_06_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_06_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_06_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_07_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_07_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_07_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_08_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_08_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_08_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_09_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_09_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_09_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_10_01"},
			FigureVanish	{Tag = "Spawned_Shaikan1_10_02"},
			FigureVanish	{Tag = "Spawned_Shaikan1_10_03"},
			FigureVanish	{Tag = "Spawned_Shaikan1_10_04"},
		},
	},
};
