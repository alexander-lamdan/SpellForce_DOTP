-- ***************************************************************************
-- ** Handling the Main Questline and the Acts                              **
-- ***************************************************************************

local SecondsBetweenAct2Act3 = 10;




State --**************************************************** INIT State
{
	StateName = "INIT", -- Until Act 1 starts



	OnOneTimeEvent ------------------------------------------- Switching to ACT1 State, starting quests
	{
		EventName = ">>> mf_P706_CS1_IntroEnded <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_CS1_Intro_Ended", Seconds = 5},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_CS1_Intro_Ended"},
			
			DoAutoSave(),
			AITechTreeGiveAll	{Player = "pl_Nameless"},
		},
		GotoState = "ACT1",
	},
};





State --**************************************************** ACT1 State
{
	StateName = "ACT1",
	
	OnOneTimeEvent ------------------------------------------- Initializing Act1 State
	{
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions = 
		{
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "ACT_1"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Completing Act1 State
	{
		EventName = ">>> Solved: MQ04_DEFEND and MQ05_RESURRECTORC <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ04_DEFEND_completed", Seconds = 15 },
			MapTimerIsElapsed	{Name = "mt_P706_MQ05_RESURRECTORC_completed", Seconds = 20 },
		},
		Actions =
		{			
			QuestSetSolved {Player = "default", Quest = "ACT_1"},
			
			MapTimerStop	{Name = "mt_P706_MQ04_DEFEND_completed"},
			MapTimerStop	{Name = "mt_P706_MQ05_RESURRECTORC_completed"},

			MapTimerStart	{Name = "mt_P706_Before_CS3_NLGathering"}, -- to have a small delay before CS_NLGATHERING
		},
		GotoState = "ACT2",
	},
};




State --**************************************************** ACT2 State
{
	StateName = "ACT2",
	
	OnOneTimeEvent ------------------------------------------- Completing Act2 State
	{
		EventName = ">>> MQ07_NLELIMINATE and MQ10_DRAGONRESURRECT solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 40 },			
			MapTimerIsElapsed	{Name = "mt_P706_MQ10_DRAGONRESURRECT_Completed", Seconds = 20 },
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "ACT_2"},
			
			MapTimerStop	{Name = "mt_P706_MQ07_NLELIMINATE_Completed"},
			
			MapTimerStart	{Name = "mt_P706_Before_ACT3"}, -- to have a small delay before Act3
		},
		GotoState = "ACT3",
	},
};




State --**************************************************** ACT3 State
{
	StateName = "ACT3",
	
	OnOneTimeEvent ------------------------------------------- Initializing Act3 State
	{
		EventName = ">>> mt_P706_Before_ACT3 elapsed <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Before_ACT3", Seconds = SecondsBetweenAct2Act3},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "ACT_3"},
			MapTimerStop	{Name = "mt_P706_Before_ACT3"},
			MapTimerStart	{Name = "mt_P706_After_ACT3_Start"}, -- used in Branch05_Endgame.lua
		},
	},
};

