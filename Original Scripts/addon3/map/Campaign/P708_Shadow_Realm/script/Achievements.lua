
State
{
	StateName = "Achievements",
	
	OnOneTimeEvent 
	{
		EventName = ">>> Beast trapped <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_BeastTrapped"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_NoClosedFail"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> Beast never trapped and dead <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_03_Ended"},
			FigureIsDead {Tag = "SealBeast"},
			MapFlagIsFalse {Name = "mf_P708_NoClosedFail"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_Achievement_P708_NoClosed"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> Playerteam helped <<<",
		Conditions = 
		{
			OR
			{
				FigureIsInRange {Tag = "pl_HumanAvatar", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "Sariel", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanHeroCaine", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanHeroFirst", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanHeroSecond", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanHeroOrc", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanCompanionCraigHuman", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanCompanionSariel", Range = 40, X = 225 , Y = 275},
				FigureIsInRange {Tag = "pl_HumanHeroThird", Range = 40, X = 225 , Y = 275},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_OnlyShadowFail"},
		},
	},
	
	OnOneTimeEvent 
	{
		EventName = ">>> Playerteam never closed and Demons are dead <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_MQ_05_2_Done"},
			MapFlagIsFalse {Name = "mf_P708_OnlyShadowFail"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_Achievement_P708_ShadowArmy"},
		},
	},
}