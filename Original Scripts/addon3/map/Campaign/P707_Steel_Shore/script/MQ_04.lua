-- ***************************************************************************
-- ** Handling Main Quest 04 																								**
-- ***************************************************************************

local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Quest MQ_04init <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_04"},
		},
		Actions =
		{
		},
		GotoState = "MQ_04 Run",
	},
};


State --**************************************************** MainQuest State
{
	StateName = "MQ_04 Run",

	OnOneTimeEvent 
	{
		EventName = ">>> Cutscene_06 ended <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_MQ_04"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_04_1"},
			MapValueSet	{Name = "mv_NoFire", Value = 0},
			MapValueSet	{Name = "mv_NextFire", Value = 2},
			MapFlagSetTrue {Name = "mf_RightOrder"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 1 Extinguish <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire1", Range = 10},
			MapValueIsEqual {Name = "mv_NextFire", Value = 1},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire1"},
			MapValueSet	{Name = "mv_NextFire", Value = 3},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 1 not right <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire1", Range = 10},
			MapValueIsNotEqual {Name = "mv_NextFire", Value = 1},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire1"},
			MapValueSet	{Name = "mv_NextFire", Value = 3},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
			MapFlagSetFalse {Name = "mf_RightOrder"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 2 Extinguish <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire2", Range = 10},
			MapValueIsEqual {Name = "mv_NextFire", Value = 2},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire2"},
			MapValueSet	{Name = "mv_NextFire", Value = 1},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 2 not right <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire2", Range = 10},
			MapValueIsNotEqual {Name = "mv_NextFire", Value = 2},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire2"},
			MapValueSet	{Name = "mv_NextFire", Value = 1},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
			MapFlagSetFalse {Name = "mf_RightOrder"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 3 Extinguish <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire3", Range = 10},
			MapValueIsEqual {Name = "mv_NextFire", Value = 3},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire3"},
			MapValueSet	{Name = "mv_NextFire", Value = 4},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 3 not right <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire3", Range = 10},
			MapValueIsNotEqual {Name = "mv_NextFire", Value = 3},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire3"},
			MapValueSet	{Name = "mv_NextFire", Value = 4},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
			MapFlagSetFalse {Name = "mf_RightOrder"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 4 Extinguish <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire4", Range = 10},
			MapValueIsEqual {Name = "mv_NextFire", Value = 4},
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire4"},
			MapValueSet	{Name = "mv_NextFire", Value = 2},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fire 4 not right <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar" , TargetTag = "Fire4", Range = 10},
			MapValueIsNotEqual {Name = "mv_NextFire", Value = 4},			
		},
		Actions =
		{
			ObjectVanish {Tag = "Fire4"},
			MapValueSet	{Name = "mv_NextFire", Value = 2},
			EntityTimerStart {Name = "et_FireBack"},
			MapValueIncrease {Name = "mv_NoFire"},
			MapFlagSetFalse {Name = "mf_RightOrder"},
		},
	},

	OnEvent
	{
		EventName = ">>> Fires back <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_NoFire", Value = 4},
			EntityTimerIsElapsed {Name = "et_FireBack", Seconds = 4},
			MapFlagIsFalse {Name = "mf_RightOrder"},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_FireBack"},
			MapValueSet	{Name = "mv_NoFire", Value = 0},
			MapValueSet	{Name = "mv_NextFire", Value = 2},
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "StartFire"},
			ObjectSpawn	{ObjectId = 1835, X = 208.561, Y = 651.216, Direction = 190.623, Tag = "Fire1"},
			ObjectSpawn	{ObjectId = 1835, X = 198.775, Y = 619.363, Direction = 208.957, Tag = "Fire2"},
			ObjectSpawn	{ObjectId = 1835, X = 158.2, Y = 620.2, Direction = 262.242, Tag = "Fire3"},
			ObjectSpawn	{ObjectId = 1835, X = 149.786, Y = 651.768, Direction = 202.082, Tag = "Fire4"},
			MapFlagSetTrue {Name = "mf_RightOrder"},
		},
	},

	OnEvent
	{
		EventName = ">>> Right Order <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_NoFire", Value = 4},
			EntityTimerIsElapsed {Name = "et_FireBack", Seconds = 1},
			MapFlagIsTrue {Name = "mf_RightOrder"},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_FireBack"},
			MapTimerStart	{Name = "mt_SSSR_MQ_04_1_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_04_1_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_04_1"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_04_1_completed", Seconds = 6},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_MQ_04_1.XP },
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Shadow_Realm_Rift.tga", BlendDuration = 5.0 },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_04_1_completed", Seconds = 11},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_MQ_04_1_completed"},
		},
		GotoState = "MQ_04 FINISHED",
	},	
};			


State --**************************************************** Finish state
{
	StateName = "MQ_04 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest MQ_04 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_MQ_04"},
			ColorGradingChange {LUTFile = "", BlendDuration = 5.0 },
		},
	},
};

