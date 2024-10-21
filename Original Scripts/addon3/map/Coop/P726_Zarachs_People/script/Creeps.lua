local freq = 50;


State
{
	StateName = "INIT",



	--*********************************************************************************************************************************** TROLL HUNTERS AREA
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 01 wolf
	{
		EventName = ">>> Creep group vanished: 01 wolf <<<",
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_01_01_wolf"},
			FigureIsDead	{Tag = "creep_01_02_wolf"},
			FigureIsDead	{Tag = "creep_01_03_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 02 wolf
	{
		EventName = ">>> Creep group vanished: 02 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_02_01_wolf"},
			FigureIsDead	{Tag = "creep_02_02_wolf"},
			FigureIsDead	{Tag = "creep_02_03_wolf"},
			FigureIsDead	{Tag = "creep_02_04_wolf"},
			FigureIsDead	{Tag = "creep_02_05_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 03 wolf
	{
		EventName = ">>> Creep group vanished: 03 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_03_01_wolf"},
			FigureIsDead	{Tag = "creep_03_02_wolf"},
			FigureIsDead	{Tag = "creep_03_03_wolf"},
			FigureIsDead	{Tag = "creep_03_04_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 04 wolf
	{
		EventName = ">>> Creep group vanished: 04 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_04_01_wolf"},
			FigureIsDead	{Tag = "creep_04_02_wolf"},
			FigureIsDead	{Tag = "creep_04_03_wolf"},
			FigureIsDead	{Tag = "creep_04_04_wolf"},
			FigureIsDead	{Tag = "creep_04_05_wolf"},
			FigureIsDead	{Tag = "creep_04_06_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 05 wolf
	{
		EventName = ">>> Creep group vanished: 05 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_05_01_wolf"},
			FigureIsDead	{Tag = "creep_05_02_wolf"},
			FigureIsDead	{Tag = "creep_05_03_wolf"},
			FigureIsDead	{Tag = "creep_05_04_wolf"},
			FigureIsDead	{Tag = "creep_05_05_wolf"},
			FigureIsDead	{Tag = "creep_05_06_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 06 wolf
	{
		EventName = ">>> Creep group vanished: 06 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_06_01_wolf"},
			FigureIsDead	{Tag = "creep_06_02_wolf"},
			FigureIsDead	{Tag = "creep_06_03_wolf"},
			FigureIsDead	{Tag = "creep_06_04_wolf"},
			FigureIsDead	{Tag = "creep_06_05_wolf"},
			FigureIsDead	{Tag = "creep_06_06_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},








	--*********************************************************************************************************************************** SHAMANS VILLAGE
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 07 puma
	{
		EventName = ">>> Creep group vanished: 07 puma <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_07_01_puma"},
			FigureIsDead	{Tag = "creep_07_02_puma"},
			FigureIsDead	{Tag = "creep_07_03_puma"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 08 spider
	{
		EventName = ">>> Creep group vanished: 08 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_08_01_spider"},
			FigureIsDead	{Tag = "creep_08_02_spider"},
			FigureIsDead	{Tag = "creep_08_03_spider"},
			FigureIsDead	{Tag = "creep_08_04_spider"},
			FigureIsDead	{Tag = "creep_08_05_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 09 wolf
	{
		EventName = ">>> Creep group vanished: 09 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_09_01_wolf"},
			FigureIsDead	{Tag = "creep_09_02_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 10 bear
	{
		EventName = ">>> Creep group vanished: 10 bear <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_10_01_bear"},
			FigureIsDead	{Tag = "creep_10_02_bear"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 11 bear
	{
		EventName = ">>> Creep group vanished: 11 bear <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_11_01_bear"},
			FigureIsDead	{Tag = "creep_11_02_bear"},
			
			FigureIsDead	{Tag = "Drops_Bear_Pelt"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 12 spider
	{
		EventName = ">>> Creep group vanished: 12 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_12_01_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 13 spider
	{
		EventName = ">>> Creep group vanished: 13 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_13_01_spider"},
			FigureIsDead	{Tag = "creep_13_02_spider"},
			FigureIsDead	{Tag = "creep_13_03_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 14 wolf
	{
		EventName = ">>> Creep group vanished: 14 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_14_01_wolf"},
			FigureIsDead	{Tag = "creep_14_02_wolf"},
			FigureIsDead	{Tag = "creep_14_03_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 15 spider
	{
		EventName = ">>> Creep group vanished: 15 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_15_01_spider"},
			FigureIsDead	{Tag = "creep_15_02_spider"},
			FigureIsDead	{Tag = "creep_15_03_spider"},
			FigureIsDead	{Tag = "creep_15_04_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 16 wolf
	{
		EventName = ">>> Creep group vanished: 16 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_16_01_wolf"},
			FigureIsDead	{Tag = "creep_16_02_wolf"},
			FigureIsDead	{Tag = "creep_16_03_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 17 wolf
	{
		EventName = ">>> Creep group vanished: 17 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_17_01_wolf"},
			FigureIsDead	{Tag = "creep_17_02_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 18 wolf
	{
		EventName = ">>> Creep group vanished: 18 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_18_01_spider"},
			FigureIsDead	{Tag = "creep_18_02_spider"},
			FigureIsDead	{Tag = "creep_18_03_spider"},
			FigureIsDead	{Tag = "creep_18_04_spider"},
			FigureIsDead	{Tag = "creep_18_05_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 19 wolf
	{
		EventName = ">>> Creep group vanished: 19 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_19_01_spider"},
			FigureIsDead	{Tag = "creep_19_02_spider"},
			FigureIsDead	{Tag = "creep_19_03_spider"},
			FigureIsDead	{Tag = "creep_19_04_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},	
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 20 spider
	{
		EventName = ">>> Creep group vanished: 20 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_20_01_spider"},
			FigureIsDead	{Tag = "creep_20_02_spider"},
			FigureIsDead	{Tag = "creep_20_03_spider"},
			FigureIsDead	{Tag = "creep_20_04_spider"},
			FigureIsDead	{Tag = "creep_20_05_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},	
	




	
	--*********************************************************************************************************************************** SPIRITIST AREA
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 21 hornet
	{
		EventName = ">>> Creep group vanished: 21 hornet <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_21_01_hornet"},
			FigureIsDead	{Tag = "creep_21_02_hornet"},
			FigureIsDead	{Tag = "creep_21_03_hornet"},
			FigureIsDead	{Tag = "creep_21_04_hornet"},
			FigureIsDead	{Tag = "creep_21_05_hornet"},
			FigureIsDead	{Tag = "creep_21_06_hornet"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 22 bear
	{
		EventName = ">>> Creep group vanished: 22 bear <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_22_01_bear"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 23 spider
	{
		EventName = ">>> Creep group vanished: 23 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_23_01_spider"},
			FigureIsDead	{Tag = "creep_23_02_spider"},
			FigureIsDead	{Tag = "creep_23_03_spider"},
			FigureIsDead	{Tag = "creep_23_04_spider"},
			FigureIsDead	{Tag = "creep_23_05_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 24 bear
	{
		EventName = ">>> Creep group vanished: 24 bear <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_24_01_bear"},
			FigureIsDead	{Tag = "creep_24_02_bear"},
			FigureIsDead	{Tag = "creep_24_03_bear"},
			
			FigureIsDead	{Tag = "Drops_Bear_Cheekbone"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 25 puma
	{
		EventName = ">>> Creep group vanished: 25 puma <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_25_02_puma"},
			FigureIsDead	{Tag = "creep_25_02_puma"},
			FigureIsDead	{Tag = "creep_25_02_puma"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 26 wolf
	{
		EventName = ">>> Creep group vanished: 26 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_26_01_wolf"},
			FigureIsDead	{Tag = "creep_26_02_wolf"},
			FigureIsDead	{Tag = "creep_26_03_wolf"},
			FigureIsDead	{Tag = "creep_26_04_wolf"},	
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 27 bear at the chest
	{
		EventName = ">>> Creep group vanished: 27 bear <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_27_01_bear"},
			FigureIsDead	{Tag = "creep_27_02_bear"},
			FigureIsDead	{Tag = "creep_27_03_bear"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	--*********************************************************************************************************************************** STEPPE
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 28 jaguar
	{
		EventName = ">>> Creep group vanished: 28 jaguar <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_28_01_jaguar"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 29 jaguar
	{
		EventName = ">>> Creep group vanished: 29 jaguar <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_29_01_jaguar"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 30 jaguar
	{
		EventName = ">>> Creep group vanished: 30 jaguar <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_30_01_jaguar"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 31 lion
	{
		EventName = ">>> Creep group vanished: 31 lion <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_31_01_lion"},
			FigureIsDead	{Tag = "creep_31_02_lion"},
			FigureIsDead	{Tag = "creep_31_03_lion"},
			FigureIsDead	{Tag = "creep_31_04_lion"},
			FigureIsDead	{Tag = "creep_31_05_lion"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 32 lion
	{
		EventName = ">>> Creep group vanished: 32 lion <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_32_01_lion"},
			FigureIsDead	{Tag = "creep_32_02_lion"},
			FigureIsDead	{Tag = "creep_32_03_lion"},
			FigureIsDead	{Tag = "creep_32_04_lion"},
			FigureIsDead	{Tag = "creep_32_05_lion"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 33 lion
	{
		EventName = ">>> Creep group vanished: 33 lion <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_33_01_lion"},
			FigureIsDead	{Tag = "creep_33_02_lion"},
			FigureIsDead	{Tag = "creep_33_03_lion"},
			FigureIsDead	{Tag = "creep_33_04_lion"},
			FigureIsDead	{Tag = "creep_33_05_lion"},
			FigureIsDead	{Tag = "creep_33_06_lion"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 34 spider
	{
		EventName = ">>> Creep group vanished: 34 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "AchievementSpider05"},
			FigureIsDead	{Tag = "AchievementSpider06"},
			FigureIsDead	{Tag = "AchievementSpider07"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 35 spider
	{
		EventName = ">>> Creep group vanished: 35 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "AchievementSpider04"},
			FigureIsDead	{Tag = "creep_35_01_spider"},
			FigureIsDead	{Tag = "creep_35_02_spider"},
			FigureIsDead	{Tag = "creep_35_03_spider"},
			FigureIsDead	{Tag = "creep_35_04_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 36 giant
	{
		EventName = ">>> Creep group vanished: 36 giant <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_36_01_giant"},
			FigureIsDead	{Tag = "creep_36_02_giant"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},	

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 37 wolf
	{
		EventName = ">>> Creep group vanished: 37 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_37_01_wolf"},
			FigureIsDead	{Tag = "creep_37_02_wolf"},
			FigureIsDead	{Tag = "creep_37_03_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 38 wolf
	{
		EventName = ">>> Creep group vanished: 38 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_38_01_wolf"},
			FigureIsDead	{Tag = "creep_38_02_wolf"},
			FigureIsDead	{Tag = "creep_38_03_wolf"},
			FigureIsDead	{Tag = "creep_38_04_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 38 wolf
	{
		EventName = ">>> Creep group vanished: 38 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_38_01_wolf"},
			FigureIsDead	{Tag = "creep_38_02_wolf"},
			FigureIsDead	{Tag = "creep_38_03_wolf"},
			FigureIsDead	{Tag = "creep_38_04_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 39 wolf
	{
		EventName = ">>> Creep group vanished: 39 wolf <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "creep_39_01_wolf"},
			FigureIsDead	{Tag = "creep_39_02_wolf"},
			FigureIsDead	{Tag = "creep_39_03_wolf"},
			FigureIsDead	{Tag = "creep_39_04_wolf"},
			FigureIsDead	{Tag = "creep_39_05_wolf"},
			FigureIsDead	{Tag = "creep_39_06_wolf"},
			FigureIsDead	{Tag = "creep_39_07_wolf"},
			FigureIsDead	{Tag = "creep_39_08_wolf"},
			FigureIsDead	{Tag = "creep_39_09_wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 20},
			AvatarXPGive	{Player = "pl_Human02", Amount = 20},
			AvatarXPGive	{Player = "pl_Human03", Amount = 20},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 40 spider
	{
		EventName = ">>> Creep group vanished: 40 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			FigureIsDead	{Tag = "AchievementSpider03"},
			
			FigureIsDead	{Tag = "creep_40_01_spider"},
			FigureIsDead	{Tag = "creep_40_02_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 41 giant
	{
		EventName = ">>> Creep group vanished: 41 giant <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_41_01_giant"},
			FigureIsDead	{Tag = "creep_41_02_giant"},
			FigureIsDead	{Tag = "creep_41_03_giant"},
			FigureIsDead	{Tag = "creep_41_04_giant"},
			FigureIsDead	{Tag = "creep_41_05_giant"},
			FigureIsDead	{Tag = "creep_41_06_giant"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 42 raptor
	{
		EventName = ">>> Creep group vanished: 42 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_42_01_raptor"},
			FigureIsDead	{Tag = "creep_42_02_raptor"},
			FigureIsDead	{Tag = "creep_42_03_raptor"},
			FigureIsDead	{Tag = "creep_42_04_raptor"},
			FigureIsDead	{Tag = "creep_42_05_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 43 raptor
	{
		EventName = ">>> Creep group vanished: 43 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_43_01_raptor"},
			FigureIsDead	{Tag = "creep_43_02_raptor"},
			FigureIsDead	{Tag = "creep_43_03_raptor"},
			FigureIsDead	{Tag = "creep_43_04_raptor"},
			FigureIsDead	{Tag = "creep_43_05_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 44 spider
	{
		EventName = ">>> Creep group vanished: 44 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "AchievementSpider01"},
			
			FigureIsDead	{Tag = "creep_44_01_spider"},
			FigureIsDead	{Tag = "creep_44_02_spider"},
			FigureIsDead	{Tag = "creep_44_03_spider"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 45 spider
	{
		EventName = ">>> Creep group vanished: 45 spider <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "AchievementSpider02"},
			FigureIsNotInCombat	{Tag = ftAvatar},			
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 50},
			AvatarXPGive	{Player = "pl_Human02", Amount = 50},
			AvatarXPGive	{Player = "pl_Human03", Amount = 50},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 46 raptor
	{
		EventName = ">>> Creep group vanished: 46 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_46_01_raptor"},
			FigureIsDead	{Tag = "creep_46_02_raptor"},
			FigureIsDead	{Tag = "creep_46_03_raptor"},
			FigureIsDead	{Tag = "creep_46_04_raptor"},
			FigureIsDead	{Tag = "creep_46_05_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 47 raptor
	{
		EventName = ">>> Creep group vanished: 47 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_47_01_raptor"},
			FigureIsDead	{Tag = "creep_47_02_raptor"},
			FigureIsDead	{Tag = "creep_47_03_raptor"},
			FigureIsDead	{Tag = "creep_47_04_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
	
	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 48 raptor
	{
		EventName = ">>> Creep group vanished: 48 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_48_01_raptor"},
			FigureIsDead	{Tag = "creep_48_02_raptor"},
			FigureIsDead	{Tag = "creep_48_03_raptor"},
			FigureIsDead	{Tag = "creep_48_04_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 49 raptor
	{
		EventName = ">>> Creep group vanished: 49 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_49_01_raptor"},
			FigureIsDead	{Tag = "creep_49_02_raptor"},
			FigureIsDead	{Tag = "creep_49_03_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},

	OnOneTimeEvent ---------------------------------------------------------------------------------------------------- 50 raptor
	{
		EventName = ">>> Creep group vanished: 50 raptor <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "creep_50_01_raptor"},
			FigureIsDead	{Tag = "creep_50_02_raptor"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 10},
			AvatarXPGive	{Player = "pl_Human02", Amount = 10},
			AvatarXPGive	{Player = "pl_Human03", Amount = 10},
		},
	},
};