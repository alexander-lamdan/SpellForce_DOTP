State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			OR
			{
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions =
		{
		},
		NoSpawnEffect = true,
	};	

};