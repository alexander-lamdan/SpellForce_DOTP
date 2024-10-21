--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",

	-- Necros is chosen
		OnOneTimeEvent
		{
		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Jasee", Range = 8},
				MapFlagIsTrue {Name = "mf_P701_GuardsGuards_CS02_End"},
		},
		Actions =
		{
				FigureOutcry {TextTag = "OC_MQ1_Save_us", Tag = "Jasee"},
		},
	},
	
OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 628, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 629, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 630, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 631, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 632, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 633, Amount = 1},
		},
		Actions =
		{

			DialogSetEnabled	{Tag = "Jasee"},
			
		},
		GotoState = "INQUEST",
	},
	
};
State
{

StateName = "INQUEST",



--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P701_SQ_1486_Completed"},
				

		},
		Actions =
		{
				AvatarItemMiscTake	{Player = "default", ItemId = 628, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 629, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 630, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 631, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 632, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 633, Amount = 1},
				QuestSetSolved	{Player = "default", Quest = "SS_NOR_11"},
				AvatarXPGive	{Player = "default", Amount = 200},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
