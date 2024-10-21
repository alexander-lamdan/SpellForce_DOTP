--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 02 script  *
--*                                                  *
--*                     Wolfbane                     *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing Side Quest #2

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #2 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_2_Accepted"},

		},
		Actions =
		{

			QuestSetActive {Player = "default", Quest = "IOS_SIDEQ_2"},
			
			MapTimerStart	{Name = "mt_P709_SideQuest2Activate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #2 - INITIAL SAVING   *
-- *                                   *
-- *************************************

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #2 - INITIAL SAVING <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest2Activate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest2Activate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState ="IOS_SIDEQ_2",

	},

};

-- *******************************
-- *                             *
-- *   Completing Sidequest #2   *
-- *                             *
-- *******************************

--	Completing Sidequest #2

State
{

	StateName = "IOS_SIDEQ_2",

--	Complete Side Quest #2

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #2 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_2_Completed"},

		},
		Actions =
		{

--	Adamantinum
			AvatarItemMiscTake {Player = "default", ItemId = 636, Amount = 1},

--	Stone of Eternal Fire
			AvatarItemMiscTake {Player = "default", ItemId = 637, Amount = 1},

			QuestSetSolved {Quest = "IOS_SIDEQ_2"},
			
			MapTimerStart {Name = "mt_P709_SideQuest2Finished"},

		},

	},
	
--	Completing Sidequest #2 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #2 - XP REWARD <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest2Finished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ2"},

		},

	},
	
--	Completing Sidequest #2 - ITEM REWARD HEAVY CROSSBOW
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #2 - ITEM REWARD HEAVY CROSSBOW <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SIDEQ_2_HeavyCrossbow"},
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest2Finished", Seconds = 15},

		},
		Actions =
		{

			AvatarItemEquipmentGive {Player = "default", ItemId = 709, Amount = 1},

		},

	},
	
--	Completing Sidequest #2 - ITEM REWARD DOUBLE HANDED BLADE
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #2 - ITEM REWARD DOUBLE HANDED BLADE <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SIDEQ_2_DoubleHandedBlade"},
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest2Finished", Seconds = 15},

		},
		Actions =
		{

			AvatarItemEquipmentGive {Player = "default", ItemId = 711, Amount = 1},

		},

	},

--	Completing Sidequest #2 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #2 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest2Finished", Seconds = 20},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest2Finished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_2_FINISHED",

	},

};

-- Side Quest #2 finished

State
{

	StateName = "IOS_SIDEQ_2_FINISHED",
	
};