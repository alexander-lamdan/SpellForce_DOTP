--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			
			FigureIsDead	{Tag = "Creep1_1"},
			FigureIsDead	{Tag = "Creep1_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 20},
			AvatarGoldGive	{Player = "default", Amount = 20},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 20},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 20},
			FigureOutcry {TextTag = "ExtraGold20", Tag = "Avatar"},
		},
		
	},
	
--SQ1_AllEventsCompleted

OnOneTimeEvent
		{
		Conditions = 
		{
			FigureIsDead	{Tag = "Creep2_1"},
			FigureIsDead	{Tag = "Creep2_2"},
			FigureIsDead	{Tag = "Creep2_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 10},
			AvatarGoldGive	{Player = "default", Amount = 10},
			FigureOutcry {TextTag = "ExtraGold10", Tag = "Avatar"},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 20},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 20},
		},		
	},
		-- Creep 	Skyclaw
	OnOneTimeEvent
		{
		Conditions = 
		{
			FigureIsDead	{Tag = "Creep3_1"},
			FigureIsDead	{Tag = "Creep3_2"},
			FigureIsDead	{Tag = "Creep3_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 10},
			AvatarGoldGive	{Player = "default", Amount = 10},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 10},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 10},
			FigureOutcry {TextTag = "ExtraGold10", Tag = "Avatar"},
			
		},
		
	},
	
			-- Creep 	Warbeast
	OnOneTimeEvent
		{
		Conditions = 
		{
			FigureIsDead	{Tag = "Creep3_1"},
			FigureIsDead	{Tag = "Creep3_2"},
			FigureIsDead	{Tag = "Creep3_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 20},
			AvatarGoldGive	{Player = "default", Amount = 20},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 20},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 20},
			FigureOutcry {TextTag = "ExtraGold20", Tag = "Avatar"},
			
		},
		
	},
	
			-- Creep 	Spirits
	OnOneTimeEvent
		{
		Conditions = 
		{
			FigureIsDead	{Tag = "Creep5_1"},
			FigureIsDead	{Tag = "Creep5_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 10},
			AvatarGoldGive	{Player = "default", Amount = 10},
			FigureOutcry {TextTag = "ExtraGold10", Tag = "Avatar"},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 10},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 10},
		},
		
	},
	
			-- Creep 	Troll carpenter
	OnOneTimeEvent
		{
		Conditions = 
		{
			FigureIsDead	{Tag = "Creep6_1"},
			FigureIsDead	{Tag = "Creep6_2"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 20},
			AvatarGoldGive	{Player = "default", Amount = 20},
			FigureOutcry {TextTag = "ExtraGold20", Tag = "Avatar"},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 20},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 20},
		},
		
	},
	
			-- Creep 	Skyclaw
	OnOneTimeEvent
		{
		Conditions = 
		{
			FigureIsDead	{Tag = "Creep7_1"},
			FigureIsDead	{Tag = "Creep7_2"},
			FigureIsDead	{Tag = "Creep7_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 50},
			AvatarGoldGive	{Player = "default", Amount = 50},
			FigureOutcry {TextTag = "ExtraGold50", Tag = "Avatar"},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 50},
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = 50},
		},
		
	},
};

	
	
