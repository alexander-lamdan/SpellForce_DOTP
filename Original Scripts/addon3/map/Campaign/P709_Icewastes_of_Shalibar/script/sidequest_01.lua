--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 01 script  *
--*                                                  *
--*               Remember the scouts                *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing dead scouts' loot (misc) items

	OnOneTimeEvent
	{
		EventName = ">>> initializing dead scouts' loot (misc) items <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_1_Accepted"},

		},
		Actions =
		{

			QuestSetActive	{Player = "default", Quest = "IOS_SIDEQ_1"},

			ObjectLootItemMiscAdd	{Tag = "dead_scout_1_side", DropChance = 100, ItemId = 759},

			ObjectLootItemMiscAdd	{Tag = "dead_scout_2_side", DropChance = 100, ItemId = 760},
			
			MapTimerStart	{Name = "mt_P709_SideQuestActivate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #1 - INITIAL SAVING   *
-- *                                   *
-- *************************************

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #1 - INITIAL SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuestActivate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuestActivate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState ="IOS_SIDEQ_1",

	},


};

-- Side Quest #1

State
{

	StateName = "IOS_SIDEQ_1",

--	disable dead scout 1's marker, add quest item to the avatar

	OnOneTimeEvent
	{
		EventName = ">>> disable dead scout 1's marker, add quest item to the avatar <<<",
		Conditions = 
		{

			AvatarHasItemMisc	{Player = "default", ItemId = 759, Amount = 1},

		},
		Actions =
		{

			ObjectVanish	{Tag = "dead_scout_1_side"},

		},
	},

--	disable dead scout 2's marker, add quest item to the avatar

	OnOneTimeEvent
	{
		EventName = ">>> disable dead scout 2's marker, add quest item to the avatar <<<",
		Conditions = 
		{

			AvatarHasItemMisc	{Player = "default", ItemId = 760, Amount = 1},

		},
		Actions =
		{

			ObjectVanish {Tag = "dead_scout_2_side"},

		},
	},

--	report back to the Norcaine Leader
	
	OnOneTimeEvent
	{
		EventName = ">>> Report back to the Norcaine Leader <<<",
		Conditions = 
		{

			AvatarHasItemMisc	{Player = "default", ItemId = 759, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 760, Amount = 1},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_IOS_SIDEQ_2_REPORTBACK"},

			DialogSetEnabled {Tag = "norcaine_leader"},

		},
	},

-- *******************************
-- *                             *
-- *   Completing Sidequest #1   *
-- *                             *
-- *******************************

--	Completing Sidequest #1

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #1 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_1_Completed"},

		},
		Actions =
		{

			AvatarItemMiscTake {Player = "default", ItemId = 759, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 760, Amount = 1},

			QuestSetSolved {Quest = "IOS_SIDEQ_1"},
			
			MapTimerStart {Name = "mt_P709_SideQuestFinished"},

		},
		
	},
	
--	Completing Sidequest #1 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #1 - XP REWARD <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuestFinished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ1"},

		},

	},

--	Completing Sidequest #1 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #1 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuestFinished", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuestFinished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_1_FINISHED",

	},

};

-- Side Quest #1 finished

State
{

	StateName = "IOS_SIDEQ_1_FINISHED",
	
};