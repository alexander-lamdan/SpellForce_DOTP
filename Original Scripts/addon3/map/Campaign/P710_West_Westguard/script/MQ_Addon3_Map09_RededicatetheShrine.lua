State
	{	
	StateName = "INIT",

OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartClanCS_End"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_StartClanCS"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			},
		},
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInRangeToEntity	{Tag = "Khoor", TargetTag = "Zarach_Shrine", Range = 30},
				AvatarIsNotTalking	{},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				AvatarMountUnmountDragon {Player = "pl_Human"},
				MapFlagSetTrue {Name = "mf_P710_StartShrineCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInRangeToEntity	{Tag = "Khoor", TargetTag = "Zarach_Shrine", Range = 30},
				AvatarIsNotTalking	{},
				AvatarFlagIsFalse {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				MapFlagSetTrue {Name = "mf_P710_StartShrineCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P710_StartShrineCS_End"},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
				AvatarItemEquipmentGive {Player = "default", ItemId = 3052, Amount = 1 },
			},
		},
	
	};