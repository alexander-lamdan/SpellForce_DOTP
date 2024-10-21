-- Enable:		MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_Enabled"},
-- Disable:		MapFlagSetFalse	{Name = "mf_P706_Spawner_NL1_Enabled"},

local DelayWave01to02 = 120;
local DelayWave02to03 = 120;
local DelayWave03to04 = 120;
local DelayWave04to01 = 120;




State
{
	StateName = "READY", --******************************************************************************** Ready (not running)
	
	OnEvent
	{
		EventName = ">>> mf_P706_Spawner_NL1_Enabled set --> activating <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_Spawner_NL1_Enabled"},
		},
		Actions =
		{
		},
		GotoState = "01",
	},
};




State
{
	StateName = "01", --******************************************************************************** Wave 01
	OnEvent
	{
		EventName = ">>> 01 - starting wave 01 immediately <<<",
		Conditions = 
		{
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_NL1_Wave", Value = 1},
			MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_StartAWave"},
			
			MapTimerStart	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "02",
	},
};




State
{
	StateName = "02", --******************************************************************************** Wave 02

	OnEvent
	{
		EventName = ">>> 02 - DelayWave01to02 sec passed <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL1_Master", Seconds = DelayWave01to02 },
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_NL1_Wave", Value = 2},
			MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_StartAWave"},
			
			MapTimerStart	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "03",
	},
	
	OnEvent
	{
		EventName = ">>> mf_P706_Spawner_NL1_Enabled cleared --> deactivating <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Spawner_NL1_Enabled"},		
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "READY",
	},
};






State
{
	StateName = "03", --******************************************************************************** Wave 03
	OnEvent
	{
		EventName = ">>> 03 - DelayWave02to03 sec passed <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL1_Master", Seconds = DelayWave02to03 },
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_NL1_Wave", Value = 3},
			MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_StartAWave"},
			
			MapTimerStart	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "04",
	},
	
	OnEvent
	{
		EventName = ">>> mf_P706_Spawner_NL1_Enabled cleared --> deactivating <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Spawner_NL1_Enabled"},		
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "READY",
	},
};




State
{
	StateName = "04", --******************************************************************************** Wave 04
	OnEvent
	{
		EventName = ">>> 04 - DelayWave03to04 sec passed <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL1_Master", Seconds = DelayWave03to04 },
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Spawner_NL1_Wave", Value = 4},
			MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_StartAWave"},
			
			MapTimerStart	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "03",
	},
	
	OnEvent
	{
		EventName = ">>> mf_P706_Spawner_NL1_Enabled cleared --> deactivating <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Spawner_NL1_Enabled"},		
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "READY",
	},
};




State
{
	StateName = "Restart", --******************************************************************************** Restart
	OnEvent
	{
		EventName = ">>> Restart - DelayWave04to01 sec passed <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_NL1_Master", Seconds = DelayWave04to01 },
		},
		Actions =
		{
		},
		GotoState = "01",
	},
	
	OnEvent
	{
		EventName = ">>> mf_P706_Spawner_NL1_Enabled cleared --> deactivating <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Spawner_NL1_Enabled"},		
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Spawner_NL1_Master"},
		},
		GotoState = "READY",
	},	
};
