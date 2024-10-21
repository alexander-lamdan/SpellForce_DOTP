State
	{	
	StateName = "INIT",
			
	OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_ACT"},
			},
			Actions = 
			{
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_TALKTOREALMORSHAIKANLEADER"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				OR
				{
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless01_Quest"},
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless02_Quest"},
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless03_Quest"},
				},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_TALKTOREALMORSHAIKANLEADER"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				OR
				{
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless01_Quest_Contact"},
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless02_Quest_Contact"},
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless03_Quest_Contact"},
				},
			},
			Actions = 
			{
				QuestSetInactive	{Quest = "ADDON3_MAP09_TALKTOREALMORSHAIKANLEADER"},
			},
		},
	};