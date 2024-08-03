--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_Start_CS01_End"},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "QuestStart"},
				QuestSetActive	{Player = "default", Quest = "WGA3_ACT_1"},
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_1"},
			
		},
	},	
	
--MQ1

	OnOneTimeEvent
		{
		Conditions = 
		{
				--QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				MapFlagIsTrue{Name = "mf_P701_Start_CS01_End"},
				FigureIsDead	{Tag = "Undead_IPB5_1"},
				FigureIsDead	{Tag = "Undead_IPB5_2"},
				FigureIsDead	{Tag = "Undead_IPB5_3"},
				FigureIsDead	{Tag = "Undead_IPB5_4"},
				FigureIsDead	{Tag = "Undead_IPB5_5"},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_1_Completed"},
				--DialogSetEnabled	{Tag = "Meszaros"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_2"},
				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},

			
		},
	},	

	
}


	
	
