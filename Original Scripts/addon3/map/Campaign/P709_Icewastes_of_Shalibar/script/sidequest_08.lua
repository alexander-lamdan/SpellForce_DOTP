--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 08 script  *
--*                                                  *
--*            Breakfast with Crystals               *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing Side Quest #8

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #8 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_8_Accepted"},

		},
		Actions =
		{

			QuestSetActive {Player = "default", Quest = "IOS_SIDEQ_8"},
			
			MapTimerStart {Name = "mt_P709_SideQuest8Activate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #8 - INITIAL SAVING   *
-- *                                   *
-- *************************************

--	Sidequest #8 - INITIAL SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #8 - INITIAL SAVING <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest8Activate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest8Activate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

	},

-- Nature Power Crystal Shard dialog starts

	OnOneTimeEvent
	{
		EventName = ">>> Nature Power Crystal Shard dialog starts <<<",
		Conditions = 
		{

			BuildingHasNotHealth {Tag = "nature_power_crystal", Percent = 60},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "nature_power_crystal_shard"},

		},

	},
	
-- handling Nature Power Crystal Shard

	OnOneTimeEvent
	{
		EventName = ">>> handling Nature Power Crystal Shard <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_NaturePowerCrystalShard"},

		},
		Actions =
		{

			ObjectVanish {Tag = "nature_power_crystal_shard"},

			AvatarItemMiscGive	{Player = "default", ItemId = 61, Amount = 1},

		},

	},
	
-- Maze Power Crystal Shard dialog starts

	OnOneTimeEvent
	{
		EventName = ">>> Maze Power Crystal Shard dialog starts <<<",
		Conditions = 
		{

			BuildingHasNotHealth {Tag = "maze_power_crystal", Percent = 60},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "maze_power_crystal_shard"},

		},

	},

-- handling Maze Power Crystal Shard

	OnOneTimeEvent
	{
		EventName = ">>> handling Maze Power Crystal Shard <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_MazePowerCrystalShard"},

		},
		Actions =
		{

			ObjectVanish {Tag = "maze_power_crystal_shard"},

			AvatarItemMiscGive	{Player = "default", ItemId = 58, Amount = 1},

		},

	},
	
-- Death Power Crystal Shard dialog starts

	OnOneTimeEvent
	{
		EventName = ">>> Death Power Crystal Shard dialog starts <<<",
		Conditions = 
		{

			BuildingHasNotHealth {Tag = "death_power_crystal", Percent = 60},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "death_power_crystal_shard"},

		},

	},

-- handling Death Power Crystal Shard

	OnOneTimeEvent
	{
		EventName = ">>> handling Death Power Crystal Shard <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_DeathPowerCrystalShard"},

		},
		Actions =
		{

			ObjectVanish {Tag = "death_power_crystal_shard"},

			AvatarItemMiscGive	{Player = "default", ItemId = 60, Amount = 1},

		},

	},
	
-- *******************************
-- *                             *
-- *   Completing Sidequest #8   *
-- *                             *
-- *******************************

--	Completing Sidequest #8

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #8 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_8_Completed"},

		},
		Actions =
		{

			QuestSetSolved {Quest = "IOS_SIDEQ_8"},

--	take the parrot from the inventory

			AvatarItemMiscTake {Player = "default", ItemId = 58, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 60, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 62, Amount = 1},
			
			MapTimerStart {Name = "mt_P709_SideQuest8Finished"},

		},
		
	},
	
--	Completing Sidequest #8 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #8 - XP REWARD <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest8Finished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ8"},

		},

	},

--	Completing Sidequest #8 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #8 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest8Finished", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest8Finished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_8_FINISHED",

	},

};

-- Side Quest #8 finished

State
{

	StateName = "IOS_SIDEQ_8_FINISHED",

};