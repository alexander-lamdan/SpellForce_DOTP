
State
{

StateName = "INIT",

--Achievment You won't come back

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_6_Completed"},
				MapFlagIsFalse {Name = "mf_LichCameBack"},

		},
		Actions =
		{
				AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P701_NoSpawn"},
		},
	},	
	
--Achievment Savior 

	
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				MapFlagIsTrue {Name = "mf_AllRefugeeSaved"},
				MapFlagIsTrue {Name = "mf_P701_SQ_5_Completed"},
				
		},
		Actions =
		{
				AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P701_Savior"},
		},
	},	
	
--Achievment Savior 

	
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				MapFlagIsFalse {Name = "mf_DarcRanAround"},
				MapFlagIsTrue {Name = "mf_SQ8_Finished"},
		},		

		Actions =
		{
				AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P701_Darc"},
		},
	},		
	
};

	
	
