--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 07 script  *
--*                                                  *
--*             Peng... Peng... Parrot               *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- initializing Side Quest #7

	OnOneTimeEvent
	{
		EventName = ">>> initializing Side Quest #7 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_7_Accepted"},

		},
		Actions =
		{

			QuestSetActive{Player = "default", Quest = "IOS_SIDEQ_7"},
			
			DialogSetEnabled {Tag = "parrot"},
			
			MapTimerStart {Name = "mt_P709_SideQuest7Activate"},

		},

	},
	
-- *************************************
-- *                                   *
-- *   Sidequest #7 - INITIAL SAVING   *
-- *                                   *
-- *************************************

--	Sidequest #7 - INITIAL SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Sidequest #7 - INITIAL SAVING <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_SideQuest7Activate", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest7Activate"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},
		
		GotoState ="IOS_SIDEQ_7",

	},

};

State
{

	StateName = "IOS_SIDEQ_7",

--	Undead ship captain's dialog restarts as soon as the avatar gets the 'parrot' via DEAD FISH | ACHIEVEMENT: ANIMAL PROTECTION

	OnOneTimeEvent
	{
		EventName = ">>> Undead ship captain's dialog restarts as soon as the avatar gets the 'parrot' via DEAD FISH | ACHIEVEMENT: ANIMAL PROTECTION <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_7_ReportBackFish"},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "undead_captain"},
			
--	take the fish from the inventory

			AvatarItemMiscTake {Player = "default", ItemId = 753, Amount = 1},

--	put the parrot into the inventory

			AvatarItemMiscGive {Player = "default", ItemId = 748, Amount = 1},
			
			FigureVanish {Tag = "parrot"},
			
--	ACHIEVEMENT: ANIMAL PROTECTION

			AvatarFlagSetTrue {Name = "af_Achievement_P709_Parrot"},

		},

	},

-- Undead ship captain's dialog restarts as soon as the avatar gets the 'parrot' via killing it 

	OnOneTimeEvent
	{
		EventName = ">>> Undead ship captain's dialog restarts as soon as the avatar gets the 'parrot' via killing it <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_7_ReportBack"},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "undead_captain"},
			
--	put the parrot into the inventory

			AvatarItemMiscGive {Player = "default", ItemId = 748, Amount = 1},
			
			FigureVanish {Tag = "parrot"},
			
--	spawn a blood decal

			ObjectSpawn	{ObjectId = 546, X = 296.453, Y = 608.166, Direction = 0, Tag = "parrot_blood"},

		},

	},
	
-- *******************************
-- *                             *
-- *   Completing Sidequest #7   *
-- *                             *
-- *******************************

--	Completing Sidequest #7

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #7 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SIDEQ_7_Completed"},

		},
		Actions =
		{

			QuestSetSolved {Quest = "IOS_SIDEQ_7"},
			
--	take the parrot from the inventory

			AvatarItemMiscTake {Player = "default", ItemId = 748, Amount = 1},
			
			MapTimerStart {Name = "mt_P709_SideQuest7Finished"},

		},
		
	},
	
--	Completing Sidequest #7 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #7 - XP REWARD <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest7Finished", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSIDEQ7"},

		},

	},

--	Completing Sidequest #7 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Sidequest #7 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_SideQuest7Finished", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_SideQuest7Finished"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SIDEQ_7_FINISHED",

	},

};

-- Side Quest #7 finished

State
{

	StateName = "IOS_SIDEQ_7_FINISHED",

};