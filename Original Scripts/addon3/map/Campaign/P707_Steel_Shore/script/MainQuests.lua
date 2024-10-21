-- ***************************************************************************
-- ** Handling the Main Questline and the Acts                              **
-- ***************************************************************************


State --**************************************************** INIT State
{
	StateName = "INIT", -- Until Act 1 starts

	OnOneTimeEvent ------------------------------------------- Switching to ACT1 State, starting quests
	{
		EventName = ">>> mf_P707_Init <<<",
		Conditions = 
		{
		},
		Actions =
		{
		},
		GotoState = "ACT1 - Steel Shore",
	},
};


State --**************************************************** ACT1 State
{
	StateName = "ACT1 - Steel Shore",
	
	OnOneTimeEvent ------------------------------------------- Initializing Act1 State
	{
		EventName = ">>> CS_01_Ended, Act1 Start <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P707_CS_01_Ended"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Autosave"},
			MapTimerStart	{Name = "mt_SSSR_MQ_01_get"},
		},
	},

	OnOneTimeEvent ------------------------------------------- New Quest
	{
		EventName = ">>> New Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_MQ_01_get", Seconds = 10},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_ACT_01"},
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_01"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Solved: MQ_01 <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_02"},
			MapFlagSetTrue {Name = "mf_P707_MQ_02_Started"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Sariel arrived in CS_03 <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_03_Ended"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_03"},
			QuestSetActive	{Player = "default", Quest = "SSSR_MQ_03_1"},
			MapFlagSetTrue {Name = "mf_P707_MQ_03_Started"},
			MapFlagSetFalse {Name = "mf_P707_SarielMet"},
			MapFlagSetTrue {Name = "mf_P707_Sariel_MQ_03_1"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Solved: MQ_02 and MQ_03 <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_03"},
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_02"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_04"},
		},
	},	
	
	OnOneTimeEvent
	{
		EventName = ">>> Solved: MQ_04 <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_04"},
		},
		Actions =
		{
			--QuestSetSolved {Player = "default", Quest = "SSSR_ACT_01"},
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Shadow_Realm_Rift.tga", BlendDuration = 1.0 },
			MapTimerStart	{Name = "mt_P707_Before_End"}, -- to have a small delay before CS_07
		},
		GotoState = "P707 Mission End",
	},
};


State --**************************************************** ACT2 State
{
	StateName = "P707 Mission End",
	
	OnOneTimeEvent ------------------------------------------- Mission End
	{
		EventName = ">>> Unmount Before Mission End <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P707_Before_End", Seconds = 0.5},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Mission End
	{
		EventName = ">>> Mission End <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P707_Before_End", Seconds = 1},
		},
		Actions =
		{
			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
			PlayerMapTravelAddon3	{Map = "Campaign/P708_Shadow_Realm", TargetTag = "Map_Start_Point"},
		},
	},
};

