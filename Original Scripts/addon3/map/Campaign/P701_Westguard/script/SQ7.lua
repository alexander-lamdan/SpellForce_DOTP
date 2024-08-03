--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ7_Accepted"},

		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_SQ7_Available"},
			MapFlagSetTrue {Name = "mf_SQ7_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_7"},
			
		},
		GotoState = "INQUEST",
	},
	
};
State
{

StateName = "INQUEST",

--Save the first survival

OnOneTimeEvent
		{
		Conditions = 
		{

			
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "SQ7_Box_01", DropChance = 100, ItemId = 607},
			ObjectLootItemMiscAdd	{Tag = "SQ7_Box_02", DropChance = 100, ItemId = 608},
			
		},
	},
	
	OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 607, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 608, Amount = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SQ7_Finished"},
			FigureOutcry {TextTag = "OC_SQ7_ALLGOODS", Tag = "pl_HumanAvatar"},
			DialogSetEnabled {Tag = "Merchant_Odelle"},
		},
	},
	


--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_SQ7_Finished"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Merchant_Odelle", Range = 5},

		},
		Actions =
		{
				AvatarItemMiscTake	{Player = "default", ItemId = 607, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 608, Amount = 1},
				ObjectChange	{Tag = "MarketstallBread", ObjectId = 331, X = 403.958, Y = 397.401, Direction = 90},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_7"},
				AvatarXPGive	{Player = "default", Amount = 200},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
