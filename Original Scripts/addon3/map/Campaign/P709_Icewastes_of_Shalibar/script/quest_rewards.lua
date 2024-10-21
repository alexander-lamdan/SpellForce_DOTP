--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: quest rewards script  *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- Main Quest #1 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #1 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardMQ1"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 4000},

		},
	},
	
-- Main Quest #2 Rewards

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #2 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardMQ2"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 6000},

		},
	},
	
-- Main Quest #3 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #3 Item Reward <<<",
		Conditions =
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestItemRewardMQ3"},

		},
		Actions =
		{

--	Crystal Key Death

			AvatarItemMiscGive {ItemId = 746, Amount = 1},

		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #3 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardMQ3"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 8000},

		},
	},

-- Main Quest #4 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #4 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardMQ4"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 10000},

		},
	},

-- Main Quest #5 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #5 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardMQ5"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 10000},

		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #5 Sub Quest 3/1 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSUB_Q511"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 1000},

		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #5 Sub Quest 3/2 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSUB_Q512"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 1000},

		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #5 Sub Quest 3/3 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSUB_Q513"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 1000},

		},
	},
	
-- Side Quest #1 Reward
	
	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #1 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ1"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},

-- Side Quest #2 Reward
	
	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #2 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ2"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},

-- Side Quest #4 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #4 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ4"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},
	
-- Side Quest #5 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #5 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ5"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},
	
-- Side Quest #6 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #6 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ6"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},
	
-- Side Quest #7 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #7 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ7"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},
	
-- Side Quest #8 Reward

	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #8 XP Reward <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_QuestXPRewardSIDEQ8"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 2500},

		},
	},

};