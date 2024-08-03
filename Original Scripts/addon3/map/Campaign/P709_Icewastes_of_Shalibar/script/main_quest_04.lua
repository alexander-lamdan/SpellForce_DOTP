--*****************************************************
--*                                                   *
--*   Icewastes of Shalibar :: Main Quest 04 script   *
--*                                                   *
--*****************************************************

State
{

	StateName = "INIT",

--	Activate Main Quest #4
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate Main Quest 4 after completing Main Quest 3 (with 25 sec delay) <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_MQ_3"},
			
			QuestIsNotSolved	{Player = "default", Quest = "IOS_MQ_4"},
			
			MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 25},

		},
		Actions =
		{
	
			QuestSetActive {Quest = "IOS_MQ_4"},
			
			MapTimerStop	{Name = "mt_P709_FinishQuest"},

		},

	},

-- ********************************
-- *                              *
-- *   Completing Main Quest #4   *
-- *                              *
-- ********************************

--	Completing Main Quest #4 after the player get the crystal key compass from the center of the maze
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #4 after the player get the crystal key compass from the center of the maze <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_MQ_3"},

			AvatarHasItemMisc	{Player = "default", ItemId = 747, Amount = 1},

		},
		Actions =
		{
			
			FigureOutcry {TextTag = "P709_CRY_MQ_4_T003_AVATAR", Tag = "pl_HumanAvatar"},

			MapTimerStart {Name = "mt_P709_FinishQuest"},

			MapFlagSetTrue {Name = "mf_P709_MQ_4_Completed"},

		},

	},

--	Completing Main Quest #4
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #4 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_4_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			QuestSetSolved {Quest = "IOS_MQ_4"},

		},

	},
	
--	Completing Main Quest #4 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #4 - XP REWARD <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_4_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 10},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardMQ4"},

		},

	},
	
--	Completing Main Quest #4 - SAVING
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #4 - SAVING <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_4_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 20},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_MQ_4_FINISHED",

	},

};

-- Main Quest #4 finished

State
{

	StateName = "IOS_MQ_4_FINISHED",
	
};