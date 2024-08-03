--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ2_Accepted"},

		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_SQ2_Available"},
			MapFlagSetTrue {Name = "mf_SQ2_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_2"},
			
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
			MapFlagIsTrue {Name = "mf_SQ2_QuestStart"},
			
			PlayerHasNotFigureAmount	{Player = "pl_UD_North", Amount = 1},
			
		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P701_SQ_2_Finished"},
			DialogSetEnabled {Tag = "Lieutenant"},
		},
	},

--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_SQ_2_Completed"},

		},
		Actions =
		{

				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_2"},
				AvatarXPGive	{Player = "default", Amount = 100},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
