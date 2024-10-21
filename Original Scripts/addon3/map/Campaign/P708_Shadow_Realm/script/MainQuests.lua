-- ***************************************************************************
-- ** Handling the Main Questline and the Acts                              **
-- ***************************************************************************


State --**************************************************** INIT State
{
	StateName = "INIT", -- Until Act 1 starts

	OnOneTimeEvent ------------------------------------------- Switching to ACT2 State, starting quests
	{
		EventName = ">>> mf_P708_Init <<<",
		Conditions = 
		{
		},
		Actions =
		{
		},
		GotoState = "ACT1 - Shadow Realm part",
	},
};


State --**************************************************** ACT2 State
{
	StateName = "ACT1 - Shadow Realm part",
	
	OnOneTimeEvent ------------------------------------------- Initializing Act1 2. State
	{
		EventName = ">>> MQ_05 <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P708_CS_01_Ended"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_05"},
			MapFlagSetTrue {Name = "mf_P708_MQ_05_Started"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Solved: MQ_05, Mission acomplished <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_05"},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SSSR_ACT_01"},
			MapTimerStart	{Name = "mt_P708_Before_End"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Unmount before Mission End <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P708_Before_End", Seconds = 4},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
			AvatarFlagSetFalse	{Name = "af_DragonMountEnabled"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Mission End <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P708_Before_End", Seconds = 5},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_P708_Before_End"},
			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
			AvatarFlagSetFalse	{Name = "af_DragonAdded"},
			PlayerMapTravelAddon3	{Map = "Campaign/P709_Icewastes_of_Shalibar", TargetTag = "Map_Start_Point"},
		},
	},
};

