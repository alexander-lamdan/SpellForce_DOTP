State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			GameIsUnBlocked{},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Start_Survival"},
		},
	};	
};