--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ4_Accepted"},

		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_SQ4_Available"},
			MapFlagSetTrue {Name = "mf_SQ4_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_4"},
			
		},
		GotoState = "INQUEST",
	},
	
};
State
{

StateName = "INQUEST",

--Warn the first farmer

OnOneTimeEvent
		{
		Conditions = 
		{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 5, TargetTag = "SQ4_Farmer_01"},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "OC_SQ4_WARNINGTHEFARMERS", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_SQ4_FARMER01", Tag = "SQ4_Farmer_01"},
			MapFlagSetTrue {Name = "mf_FarmerWarned_01"},
			FigureForcedSimpleWalkToEntity	{Tag = "SQ4_Farmer_01", TargetTag = "FarmhouseMarker1"},
			FigureForcedSimpleWalkToEntity	{Tag = "Daphne", TargetTag = "FarmhouseMarker1"},
		},
	},
	
	OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ4_Farmer_01", TargetTag = "FarmhouseMarker1", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQ4_Farmer_01"},
			FigureVanish	{Tag = "Daphne"},
			
		},
	},
	
--Warn the second farmer
OnOneTimeEvent
		{
		Conditions = 
		{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 5, TargetTag = "SQ4_Farmer_02"},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "OC_SQ4_WARNINGTHEFARMERS", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_SQ4_FARMER02", Tag = "SQ4_Farmer_02"},
			MapFlagSetTrue {Name = "mf_FarmerWarned_02"},
			FigureForcedSimpleWalkToEntity	{Tag = "SQ4_Farmer_02", TargetTag = "FarmhouseMarker2"},
			
		},
	},
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ4_Farmer_02", TargetTag = "FarmhouseMarker2", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQ4_Farmer_02"},
			
			
		},
	},
--Warn the third farmer	
OnOneTimeEvent
		{
		Conditions = 
		{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 5, TargetTag = "SQ4_Farmer_03"},
			
		},
		Actions =
		{
			FigureOutcry {TextTag = "OC_SQ4_WARNINGTHEFARMERS", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_SQ4_FARMER03", Tag = "SQ4_Farmer_03"},
			MapFlagSetTrue {Name = "mf_FarmerWarned_03"},
			FigureForcedSimpleWalkToEntity	{Tag = "SQ4_Farmer_03", TargetTag = "FarmhouseMarker3"},
			FigureForcedSimpleWalkToEntity	{Tag = "SQ4_Farmer_04", TargetTag = "FarmhouseMarker3"},
		},
	},
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ4_Farmer_03", TargetTag = "FarmhouseMarker3", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQ4_Farmer_03"},
			FigureVanish	{Tag = "SQ4_Farmer_04"},
			
		},
	},
--All farmers warned	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FarmerWarned_01"},
			MapFlagIsTrue {Name = "mf_FarmerWarned_02"},
			MapFlagIsTrue {Name = "mf_FarmerWarned_03"},
			
		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P701_SQ_4_Finished"},
			DialogSetEnabled {Tag = "Lieutenant"},
		},
	},

--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_SQ_4_Completed"},

		},
		Actions =
		{

				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_4"},
				AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
