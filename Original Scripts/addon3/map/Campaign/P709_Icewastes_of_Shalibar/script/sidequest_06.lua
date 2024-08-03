--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 06 script  *
--*                                                  *
--*                   Scopey-doo                     *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing Side Quest #6

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #6 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_6_Accepted"},

		},
		Actions =
		{

			QuestSetActive{Player = "default", Quest = "IOS_SIDEQ_6"},
			
			MapTimerStart {Name = "mt_P709_SideQuest6Activate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #6 - INITIAL SAVING   *
-- *                                   *
-- *************************************

--	Sidequest #6 - INITIAL SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #6 - INITIAL SAVING <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest6Activate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest6Activate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},
		
		GotoState ="IOS_SIDEQ_6",
		
	},
	
};

-- Side Quest #6

State
{

	StateName = "IOS_SIDEQ_6",

--	Undead ship captain's dialog restarts as soon as the avatar gets the telescope

	OnOneTimeEvent
	{
		EventName = ">>> Undead ship captain's dialog restarts as soon as the avatar gets the telescope <<<",
		Conditions = 
		{

			AvatarHasItemMisc {Player = "default", ItemId = 751, Amount = 1},
			
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_6"},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "undead_captain"},

		},

	},
	
-- *******************************
-- *                             *
-- *   Completing Sidequest #6   *
-- *                             *
-- *******************************

--	Completing Sidequest #6

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #6 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_6_Completed"},

		},
		Actions =
		{

			AvatarItemMiscTake {Player = "default", ItemId = 751, Amount = 1},

			QuestSetSolved {Quest = "IOS_SIDEQ_6"},
			
			MapTimerStart {Name = "mt_P709_SideQuest6Finished"},

		},
		
	},
	
--	Completing Sidequest #6 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #6 - XP REWARD <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest6Finished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ6"},

		},

	},

--	Completing Sidequest #6 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #6 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest6Finished", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest6Finished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_6_FINISHED",

	},

};

-- Side Quest #6 finished

State
{

	StateName = "IOS_SIDEQ_6_FINISHED",

};