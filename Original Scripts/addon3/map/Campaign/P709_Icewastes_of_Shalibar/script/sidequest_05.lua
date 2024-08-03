--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 05 script  *
--*                                                  *
--*                 Good ol' barrel                  *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing Side Quest #5

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #5 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_5_Accepted"},

		},
		Actions =
		{

			QuestSetActive{Player = "default", Quest = "IOS_SIDEQ_5"},
			
			MapTimerStart {Name = "mt_P709_SideQuest5Activate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #5 - INITIAL SAVING   *
-- *                                   *
-- *************************************

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #5 - INITIAL SAVING <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest5Activate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest5Activate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},
		
		GotoState ="IOS_SIDEQ_5",
		
	}
	
};

-- Side Quest #5

State
{

	StateName = "IOS_SIDEQ_5",
	
-- Barrel of rum spawns near the Wrecked Ship
	
	OnOneTimeEvent
	{
		EventName = ">>> Barrel of rum spawns near the Wrecked Ship <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_5_Accepted"},

		},
		Actions =
		{

			ObjectLootItemMiscAdd {Tag = "barrel_rum", DropChance = 100, ItemId = 754},

		},

	},

--	Undead ship captain's dialog restarts as soon as the avatar gets the barrel of rum

	OnOneTimeEvent
	{
		EventName = ">>> Undead ship captain's dialog restarts as soon as the avatar gets the barrel of rum <<<",
		Conditions = 
		{

			AvatarHasItemMisc {Player = "default", ItemId = 754, Amount = 1},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "undead_captain"},
			
			ObjectVanish	{Tag = "barrel_rum"},

		},

	},

-- *******************************
-- *                             *
-- *   Completing Sidequest #5   *
-- *                             *
-- *******************************

--	Completing Sidequest #5

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #5 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_5_Completed"},

		},
		Actions =
		{

			AvatarItemMiscTake {Player = "default", ItemId = 754, Amount = 1},

			QuestSetSolved {Quest = "IOS_SIDEQ_5"},
			
			MapTimerStart {Name = "mt_P709_SideQuest5Finished"},

		},
		
	},
	
--	Completing Sidequest #5 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #5 - XP REWARD <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest5Finished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ5"},

		},

	},

--	Completing Sidequest #5 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #5 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest5Finished", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest5Finished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_5_FINISHED",

	},

};

-- Side Quest #5 finished

State
{

	StateName = "IOS_SIDEQ_5_FINISHED",

};