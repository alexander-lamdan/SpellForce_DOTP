--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 04 script  *
--*                                                  *
--*                    Sacrilege                     *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing Side Quest #4 -- Jorbal's dialog

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #4 -- Jorbal's dialog <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SIDEQ_1"},

		},
		Actions =
		{
			
			MapTimerStart {Name = "mt_P709_SideQuest4Activate"},

		},

	},
	
--	Sidequest #4 dialog activate

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #4 dialog activate <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest4Activate", Seconds = 15},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest4Activate"},

			DialogSetEnabled {Tag = "surian"},

		},

	},

-- initializing Side Quest #4

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #4 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_4_Accepted"},

		},
		Actions =
		{

			QuestSetActive{Player = "default", Quest = "IOS_SIDEQ_4"},
			
			DialogSetEnabled {Tag = "norcaine_leader"},
			
			MapTimerStart {Name = "mt_P709_SideQuest4Activate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #4 - INITIAL SAVING   *
-- *                                   *
-- *************************************

--	Sidequest #4 - INITIAL SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #4 - INITIAL SAVING <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_4_Accepted"},

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest4Activate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest4Activate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},
		
		GotoState ="IOS_SIDEQ_4",

	},
	
};

-- Side Quest #4

State
{

	StateName = "IOS_SIDEQ_4",
	
-- REinitializing Side Quest #4 -- Jorbal's dialog

	OnEvent
	{
		EventName = ">>> REinitializing Side Quest #4 -- Jorbal's dialog <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SIDEQ_1"},
			
			MapFlagIsFalse {Name = "mf_P709_SIDEQ_4_Completed"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			MapFlagIsFalse {Name = "mf_DragonDialog"},
			
			AND
			{
				
				OR
				{
				
					AND
					{
					
						MapFlagIsFalse {Name = "mf_P709_SIDEQ_4_Accepted"},

						MapFlagIsFalse {Name = "mf_P709_SIDEQ_4_Started"},

					},
					
					AvatarHasItemMisc {Player = "default", ItemId = 763, Amount = 4},
				
				},
				
			},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "surian"},
			DialogTypeSetSideQuest	{Tag = "surian"},

			MapFlagSetTrue {Name = "mf_DragonDialog"},

		},

	},
	
-- Dragon bones spawns near the Ghost Ship
	
	OnOneTimeEvent
	{
		EventName = ">>> Dragon bones spawns near the Ghost Ship <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_4_Started"},

		},
		Actions =
		{

			ObjectSpawn	{ObjectId = 1918, X = 288, Y = 242, Direction = 337, Tag = "dragon_bones"},

			ObjectLootItemMiscAdd	{Tag = "dragon_bones", DropChance = 100, ItemId = 763},
			ObjectLootItemMiscAdd	{Tag = "dragon_bones", DropChance = 100, ItemId = 763},
			ObjectLootItemMiscAdd	{Tag = "dragon_bones", DropChance = 100, ItemId = 763},
			ObjectLootItemMiscAdd	{Tag = "dragon_bones", DropChance = 100, ItemId = 763},

		},

	},

--	Dragon's dialog starts as soon as the avatar gets the items

	OnOneTimeEvent
	{
		EventName = ">>> Dragon's dialog starts as soon as the avatar gets the items <<<",
		Conditions = 
		{

			AvatarHasItemMisc {Player = "default", ItemId = 763, Amount = 4},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "Surian"},

		},

	},
	
-- *******************************
-- *                             *
-- *   Completing Sidequest #4   *
-- *                             *
-- *******************************

--	Completing Sidequest #4

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #4 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_4_Completed"},

		},
		Actions =
		{

			AvatarItemMiscTake {Player = "default", ItemId = 763, Amount = 4},

			QuestSetSolved {Quest = "IOS_SIDEQ_4"},
			
			MapTimerStart {Name = "mt_P709_SideQuest4Finished"},

		},
		
	},
	
--	Completing Sidequest #4 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #4 - XP REWARD <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest4Finished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ4"},

		},

	},

--	Completing Sidequest #4 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #4 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest4Finished", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest4Finished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_4_FINISHED",

	},

};

-- Side Quest #4 finished

State
{

	StateName = "IOS_SIDEQ_4_FINISHED",

};