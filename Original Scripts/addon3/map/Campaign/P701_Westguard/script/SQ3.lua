--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ3_Accepted"},

		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_SQ3_Available"},
			MapFlagSetTrue {Name = "mf_SQ3_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_3"},
			
		},
		GotoState = "INQUEST",
	},
	
};
State
{

StateName = "INQUEST",

OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ3_QuestStart"},
			
			PlayerHasNotFigureAmount	{Player = "pl_UD_South", Amount = 1},
			
		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P701_SQ_3_Finished"},
			DialogSetEnabled {Tag = "Lieutenant"},
		},
	},

--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{
			
				MapFlagIsTrue {Name = "mf_SQ3_Accepted"},
				MapFlagIsTrue {Name = "mf_P701_SQ_3_Completed"},

		},
		Actions =
		{

				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_3"},
				AvatarXPGive	{Player = "default", Amount = 100},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
