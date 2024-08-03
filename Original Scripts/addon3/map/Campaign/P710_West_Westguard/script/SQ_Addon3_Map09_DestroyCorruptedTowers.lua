State
	{	
	StateName = "INIT",
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				
			},
			Actions = 
			{
				EffectStartAddon2	{Tag = "NamelessTower01", File = "Effect_Demonic_Alchemist3"},
				EffectStartAddon2	{Tag = "NamelessTower02", File = "Effect_Demonic_Alchemist3"},
				EffectStartAddon2	{Tag = "NamelessTower03", File = "Effect_Demonic_Alchemist3"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "NamelessTower01", Range = 50},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "NamelessTower02", Range = 50},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "NamelessTower03", Range = 50},
				},
				QuestIsNotActive	{Player = "default", Quest = "ADDON3_MAP09_DESTROYTOWERS"},
				QuestIsNotSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYTOWERS"},
			},
			Actions = 
			{
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_DESTROYTOWERS"},
				MapValueSet	{Name = "mv_P710_Corrupted_Towers_Destroyed", Value = 0},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				BuildingIsDead	{Tag = "NamelessTower01"},
				BuildingIsDead	{Tag = "NamelessTower02"},
				BuildingIsDead	{Tag = "NamelessTower03"},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYTOWERS"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				BuildingIsDead	{Tag = "NamelessTower01"},
			},
			Actions = 
			{
				MapValueIncrease	{Name = "mv_P710_Corrupted_Towers_Destroyed"},
			},
		},
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				BuildingIsDead	{Tag = "NamelessTower02"},
			},
			Actions = 
			{
				MapValueIncrease	{Name = "mv_P710_Corrupted_Towers_Destroyed"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				BuildingIsDead	{Tag = "NamelessTower03"},
			},
			Actions = 
			{
				MapValueIncrease	{Name = "mv_P710_Corrupted_Towers_Destroyed"},
			},
		},
	};