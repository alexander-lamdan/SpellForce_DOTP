State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_MainQuest"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "ADDON3_MAP09_ACT"},
			DialogSetEnabled	{Tag = "Realm_Leader"},
			DialogSetEnabled	{Tag = "Shaikan_Leader"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "ADDON3_MAP09_ACT"},
		},
	},
};