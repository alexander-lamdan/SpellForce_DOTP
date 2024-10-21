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
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint1"},
			MapFlagSetFalse {Name = "mf_DarcRanAround"},
			
		},
		GotoState = "INQUEST",
	},
	
};
State
{

StateName = "INQUEST",

--Run to player's Base

OnOneTimeEvent
		{
		Conditions = 
		{
		
			MapFlagIsTrue {Name = "mf_SQ8_Accepted"},
		},
		Actions =
		{		
			MapFlagSetFalse{Name = "mf_SQ8_Available"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_8"},
				MapFlagSetTrue {Name = "mf_SQ8_QuestStart"},
		},
	},
	
	OnOneTimeEvent
		{
		Conditions = 
		{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 5, TargetTag = "Darc"},
				MapFlagIsTrue {Name = "mf_SQ8_QuestStart"},
		},
		Actions =
		{
				FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint2"},
				MapValueSet	{Name = "mv_DarcRunsLeft", Value = 0},
		},
	},
-- Chasing in a circle
	OnEvent
	{

		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint2", Range = 5},
				
				
		},
		Actions =
		{
				
				MapFlagSetTrue {Name = "mf_SQ8_Chasing"},
				
		},
	},
-- Getting closer
	OnEvent
	{

		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_SQ8_Chasing"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Darc"},
				MapValueIsEqual	{Name = "mv_DarcRunsLeft", Value = 0},
				FigureTeamIsNotInRangeToEntity	{Team = "pl_Team1", Range = 4, TargetTag = "Darc"},
				OR	{
					FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint2", Range = 1},
					FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint3", Range = 1},
					FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint4", Range = 1},
					FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint5", Range = 1},
					FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint6", Range = 1},
					FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint7", Range = 1},
					},
		},
		Actions =
		{
				MapValueSet	{Name = "mv_DarcRunsLeft", Value = 3},
				MapFlagSetTrue {Name = "mf_SQ8_Chasing"},
				MapFlagSetTrue {Name = "mf_SQ8_Run"},
		},
	},

-- RUNPOINT 2
	OnOneTimeRepeatEvent
	{
		EventName = "AtRunpoint2",
		Name = "en_AtRunpoint2",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint2", Range = 1},
			MapValueIsGreater	{Name = "mv_DarcRunsLeft", Value = 0},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint3"},
			MapValueSubtract	{Name = "mv_DarcRunsLeft", Value = 1},
			EventReEnable	{Name = "en_AtRunpoint3"},
		},
		
	},

-- RUNPOINT 3
	OnOneTimeRepeatEvent
	{
		EventName = "AtRunpoint3",
		Name = "en_AtRunpoint3",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint3", Range = 1},
			MapValueIsGreater	{Name = "mv_DarcRunsLeft", Value = 0},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint4"},
			MapValueSubtract	{Name = "mv_DarcRunsLeft", Value = 1},
			EventReEnable	{Name = "en_AtRunpoint4"},
		},
		
	},
	
	-- RUNPOINT 4
	OnOneTimeRepeatEvent
	{
		EventName = "AtRunpoint4",
		Name = "en_AtRunpoint4",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint4", Range = 1},
			
			MapValueIsGreater	{Name = "mv_DarcRunsLeft", Value = 0},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint5"},
			MapValueSubtract	{Name = "mv_DarcRunsLeft", Value = 1},
			EventReEnable	{Name = "en_AtRunpoint5"},
			
		},
		
	},
		-- RUNPOINT 5
	OnOneTimeRepeatEvent
	{
		EventName = "AtRunpoint5",
		Name = "en_AtRunpoint5",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint5", Range = 1},
			
			MapValueIsGreater	{Name = "mv_DarcRunsLeft", Value = 0},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint6"},
			MapValueSubtract	{Name = "mv_DarcRunsLeft", Value = 1},
			EventReEnable	{Name = "en_AtRunpoint6"},
			
		},
		
	},
		-- RUNPOINT 6
	OnOneTimeRepeatEvent
	{
		EventName = "AtRunpoint6",
		Name = "en_AtRunpoint6",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint6", Range = 1},
			
			MapValueIsGreater	{Name = "mv_DarcRunsLeft", Value = 0},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint7"},
			MapValueSubtract	{Name = "mv_DarcRunsLeft", Value = 1},
			EventReEnable	{Name = "en_AtRunpoint7"},
			
		},
		
	},
		-- RUNPOINT 7
	OnOneTimeRepeatEvent
	{
		EventName = "AtRunpoint7",
		Name = "en_AtRunpoint7",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint7", Range = 1},
			
			MapValueIsGreater	{Name = "mv_DarcRunsLeft", Value = 0},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint2"},
			MapValueSubtract	{Name = "mv_DarcRunsLeft", Value = 1},
			EventReEnable	{Name = "en_AtRunpoint2"},
			MapFlagSetTrue {Name = "mf_DarcRanAround"},
		},
		
	},
--Chasing over


	OnOneTimeEvent
		{
		Conditions = 
		{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 4, TargetTag = "Darc"},
				MapValueIsEqual	{Name = "mv_DarcRunsLeft", Value = 0},
				MapFlagIsTrue {Name = "mf_SQ8_Chasing"},
		},
		Actions =
		{
				FigureFollowEntity	{Tag = "Darc", TargetTag = "pl_HumanAvatar"},
				MapFlagSetFalse {Name = "mf_SQ8_Chasing"},
				MapFlagSetFalse {Name = "mf_SQ8_Accepted"},
				MapFlagSetTrue {Name = "mf_SQ8_Finished"},
			FigureOutcry {TextTag = "OC_SQ7_GOODBOY", Tag = "pl_HumanAvatar"},
			DialogSetEnabled {Tag = "Merchant_Odelle"},
		},
	},




--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_SQ_8_Completed"},

		},
		Actions =
		{
				FigureFollowEntity	{Tag = "Darc", TargetTag = "Merchant_Odelle"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_8"},
				AvatarGoldGive	{Player = "default", Amount = 100},
				AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 100},
				AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
				FigureOutcry {TextTag = "ExtraGold100", Tag = "pl_HumanAvatar"},
				AvatarXPGive	{Player = "default", Amount = 100},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
