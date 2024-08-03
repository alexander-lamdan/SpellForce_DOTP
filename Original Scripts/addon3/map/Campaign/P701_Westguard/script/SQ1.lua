--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ1_Accepted"},

		},
		Actions =
		{
			
			MapFlagSetTrue {Name = "mf_SQ1_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_1"},
			
		},
		
	},
	
--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_SQ_1_Completed"},

		},
		Actions =
		{
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Westguard"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_1"},
				
		},
		
	},	
	
	
};

	
	
