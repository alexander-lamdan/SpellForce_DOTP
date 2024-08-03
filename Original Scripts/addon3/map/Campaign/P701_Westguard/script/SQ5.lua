--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ5_Accepted"},

		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_SQ5_Available"},
			MapFlagSetTrue {Name = "mf_SQ5_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_5"},
			
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
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 5, TargetTag = "SQ5_Survival_01"},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "OC_SQ5_SURVIVAL02", Tag = "SQ5_Survival_01"},
			MapFlagSetTrue {Name = "mf_SurvivalSaved_01"},
			FigureForcedSimpleWalkToEntity	{Tag = "SQ5_Survival_01", TargetTag = "SurvivalMarker1"},
			
		},
	},
	
	OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ5_Survival_01", TargetTag = "SurvivalMarker1", Range = 2},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQ5_Survival_01"},
			
			
		},
	},
	
--Save the second survival
OnOneTimeEvent
		{
		Conditions = 
		{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 5, TargetTag = "SQ5_Survival_02"},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "OC_SQ5_SURVIVAL02", Tag = "SQ5_Survival_02"},
			MapFlagSetTrue {Name = "mf_SurvivalSaved_02"},
			FigureForcedSimpleWalkToEntity	{Tag = "SQ5_Survival_02", TargetTag = "SurvivalMarker2"},
			
		},
	},
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ5_Survival_02", TargetTag = "SurvivalMarker2", Range = 2},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQ5_Survival_02"},
			
			
		},
	},

--All Survivals saved	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SurvivalSaved_01"},
			MapFlagIsTrue {Name = "mf_SurvivalSaved_02"},

			
		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P701_SQ_5_Finished"},
			DialogSetEnabled {Tag = "Lieutenant"},
		},
	},

--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_SQ_5_Completed"},

		},
		Actions =
		{

				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_5"},
				AvatarXPGive	{Player = "default", Amount = 100},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
