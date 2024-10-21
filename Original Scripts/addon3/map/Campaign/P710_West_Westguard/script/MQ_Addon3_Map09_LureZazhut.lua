local freq = 50;

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartZazhutCS_End"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Surian", Team = "tm_Allies"},
			FigureVanish	{Tag = "Zazhut_1"},
			FigureVanish	{Tag = "Zazhut_2"},
			FigureVanish	{Tag = "Zazhut_3"},
			FigureVanish	{Tag = "Zazhut_4"},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "ZazhutLure", Level = 30, UnitId = 2084, X = 375, Y = 655, Team = "tm_Nameless_boss"},},
			UIBossfightPanelShow {UnitTag1 = "ZazhutLure", UnitTag2 = "", PortraitImage = "Boss_P710_Zazhut", DisplayName = Boss_P710_Zazhut},
			FigurePlayerTransfer	{Tag = "ZazhutLure", Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse {Name = "mf_P710_StartZazhutCS"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 100},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 100},
			MapValueSet	{Name = "mv_P710_DestroyedTowers", Value = 0},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutFollow,
		Name = "ZazhutFollow",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
		},
		Actions = 
		{
			FigureFollowEntity	{Tag = "ZazhutLure", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "ZazhutLure", TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow_Reset"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutFollow_Reset,
		Name = "ZazhutFollow_Reset",
		Conditions = 
		{
			FigureIsIdle	{Tag = "ZazhutLure"},
			FigureIsNotInCombat	{Tag = "ZazhutLure"},
			OR
			{
				BuildingIsNotInRangeToEntity	{Tag = "Tower01", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower02", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower03", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower04", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower05", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower06", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower07", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower08", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower09", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower10", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower11", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower12", TargetTag = "ZazhutLure", Range = 5},
				BuildingIsNotInRangeToEntity	{Tag = "Tower13", TargetTag = "ZazhutLure", Range = 5},
			},
		},
		Actions = 
		{
			EventReEnable	{Name = "ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower01Zazhut,
		Name = "Tower01Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower01", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower01"},
			BuildingAbilityRemove	{Tag = "Tower01", AbilityId = 213},
			EventReEnable	{Name = "Tower01Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower01Zazhut_Reset,
		Name = "Tower01Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower01"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower02Zazhut,
		Name = "Tower02Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower02", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower02"},
			BuildingAbilityRemove	{Tag = "Tower02", AbilityId = 213},
			EventReEnable	{Name = "Tower02Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower02Zazhut_Reset,
		Name = "Tower02Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower02"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower03Zazhut,
		Name = "Tower03Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower03", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower03"},
			BuildingAbilityRemove	{Tag = "Tower03", AbilityId = 213},
			EventReEnable	{Name = "Tower03Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower03Zazhut_Reset,
		Name = "Tower03Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower03"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower04Zazhut,
		Name = "Tower04Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower04", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower04"},
			BuildingAbilityRemove	{Tag = "Tower04", AbilityId = 213},
			EventReEnable	{Name = "Tower04Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower04Zazhut_Reset,
		Name = "Tower04Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower04"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower05Zazhut,
		Name = "Tower05Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower05", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower05"},
			BuildingAbilityRemove	{Tag = "Tower05", AbilityId = 213},
			EventReEnable	{Name = "Tower05Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower05Zazhut_Reset,
		Name = "Tower05Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower05"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower06Zazhut,
		Name = "Tower06Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower06", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower06"},
			BuildingAbilityRemove	{Tag = "Tower06", AbilityId = 213},
			EventReEnable	{Name = "Tower06Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower06Zazhut_Reset,
		Name = "Tower06Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower06"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower07Zazhut,
		Name = "Tower07Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower07", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower07"},
			BuildingAbilityRemove	{Tag = "Tower07", AbilityId = 213},
			EventReEnable	{Name = "Tower07Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower07Zazhut_Reset,
		Name = "Tower07Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower07"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower08Zazhut,
		Name = "Tower08Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower08", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower08"},
			BuildingAbilityRemove	{Tag = "Tower08", AbilityId = 213},
			EventReEnable	{Name = "Tower08Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower08Zazhut_Reset,
		Name = "Tower08Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower08"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower09Zazhut,
		Name = "Tower09Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower09", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower09"},
			BuildingAbilityRemove	{Tag = "Tower09", AbilityId = 213},
			EventReEnable	{Name = "Tower09Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower09Zazhut_Reset,
		Name = "Tower09Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower09"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower10Zazhut,
		Name = "Tower10Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower10", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower10"},
			BuildingAbilityRemove	{Tag = "Tower10", AbilityId = 213},
			EventReEnable	{Name = "Tower10Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower10Zazhut_Reset,
		Name = "Tower10Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower10"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower11Zazhut,
		Name = "Tower11Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower11", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower11"},
			BuildingAbilityRemove	{Tag = "Tower11", AbilityId = 213},
			EventReEnable	{Name = "Tower11Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower11Zazhut_Reset,
		Name = "Tower11Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower11"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower12Zazhut,
		Name = "Tower12Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower12", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower12"},
			BuildingAbilityRemove	{Tag = "Tower12", AbilityId = 213},
			EventReEnable	{Name = "Tower12Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower12Zazhut_Reset,
		Name = "Tower12Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower12"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower13Zazhut,
		Name = "Tower13Zazhut",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagIsFalse	{Name = "mf_P710_ZazhutTower"},
			FigureIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower13", Range = 10},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "Tower13"},
			BuildingAbilityRemove	{Tag = "Tower13", AbilityId = 213},
			EventReEnable	{Name = "Tower13Zazhut_Reset"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower13Zazhut_Reset,
		Name = "Tower13Zazhut_Reset",
		Conditions = 
		{
			BuildingIsDead	{Tag = "Tower13"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P710_ZazhutFollow"},
			MapFlagSetFalse	{Name = "mf_P710_ZazhutTower"},
			AIEnemyListClear	{Player = "pl_Nameless_boss"},
			AIEnemyAdd	{Player = "pl_Nameless_boss", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "ZazhutFollow"},
		},
	};
		
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 10},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_LURE"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_LURE"},
			FigureIsInRangeToEntity	{Tag = "ZazhutLure", TargetTag = "Zarach_Shrine", Range = 20},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_LURE"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT"},
			MapTimerStart	{Name = "mt_P710_EndVideoTimer"},
		},
	},
	
	-- THE END - video 
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P710_EndVideoTimer", Seconds = 1},
		},
		Actions = 
		{
			CutscenePlayBinkVideo {File = "addon3/video/outro.bik"},
			--PlayerGameEnds	{},
		},
	},
	
	-- THE END - video 
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P710_EndVideoTimer", Seconds = 2},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_EndVideoTimer"},
			PlayerGameEnds	{},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower01"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower01", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower01_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower01", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 101},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower02"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower02", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower02_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower02", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 102},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower03"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower03", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower03_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower03", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 103},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower04"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower04", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower04_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower04", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 104},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower05"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower05", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower05_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower05", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 105},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower06"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower06", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower06_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower06", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 106},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower07"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower07", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower07_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower07", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 107},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower08"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower08", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower08_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower08", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 108},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower09"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower09", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower09_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower09", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 109},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower10"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower10", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower10_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower10", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 110},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower11"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower11", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower11_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower11", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 111},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower12"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower12", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower12_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower12", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 112},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			BuildingIsDead	{Tag = "Tower13"},
			BuildingIsInEntityRange	{Tag = "ZazhutLure", TargetTag = "Tower13", Range = 5},
			MapFlagIsTrue	{Name = "mf_P710_Tower13_Powered"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P710_DestroyedTowers"},
			EffectStart	{Tag = "Tower13", File = "Effect_Firestorm_Impact"},
			FogOfWarCloak	{FogOfWarId = 113},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 1},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 90},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 90},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 2},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 80},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 80},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 3},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 70},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 70},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 4},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 60},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 60},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 5},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 50},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 50},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 6},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 40},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 40},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 7},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 30},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 30},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 8},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 20},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 20},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_DestroyedTowers", Value = 9},
		},
		Actions = 
		{
			MapValueSet	{Name = "mv_P710_ZazhutHealthPercent", Value = 10},
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 10},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal100_01,
		Name = "ZazhutHeal100_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 100},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 100},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 100},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth100"},
			EventReEnable	{Name = "ZazhutHeal100_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal100_02,
		Name = "ZazhutHeal100_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth100"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth100"},
			EventReEnable	{Name = "ZazhutHeal100_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal90_01,
		Name = "ZazhutHeal90_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 90},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 90},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 90},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth90"},
			EventReEnable	{Name = "ZazhutHeal90_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal90_02,
		Name = "ZazhutHeal90_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth90"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth90"},
			EventReEnable	{Name = "ZazhutHeal90_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal80_01,
		Name = "ZazhutHeal80_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 80},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 80},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 80},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth80"},
			EventReEnable	{Name = "ZazhutHeal80_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal80_02,
		Name = "ZazhutHeal80_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth80"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth80"},
			EventReEnable	{Name = "ZazhutHeal80_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal70_01,
		Name = "ZazhutHeal70_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 70},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 70},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 70},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth70"},
			EventReEnable	{Name = "ZazhutHeal70_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal70_02,
		Name = "ZazhutHeal70_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth70"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth70"},
			EventReEnable	{Name = "ZazhutHeal70_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal60_01,
		Name = "ZazhutHeal60_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 60},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 60},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 60},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth60"},
			EventReEnable	{Name = "ZazhutHeal60_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal60_02,
		Name = "ZazhutHeal60_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth60"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth60"},
			EventReEnable	{Name = "ZazhutHeal60_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal50_01,
		Name = "ZazhutHeal50_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 50},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 50},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 50},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth50"},
			EventReEnable	{Name = "ZazhutHeal50_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal50_02,
		Name = "ZazhutHeal50_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth50"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth50"},
			EventReEnable	{Name = "ZazhutHeal50_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal40_01,
		Name = "ZazhutHeal40_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 40},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 40},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 40},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth40"},
			EventReEnable	{Name = "ZazhutHeal40_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal40_02,
		Name = "ZazhutHeal40_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth40"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth40"},
			EventReEnable	{Name = "ZazhutHeal40_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal30_01,
		Name = "ZazhutHeal30_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 30},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 30},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 30},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth30"},
			EventReEnable	{Name = "ZazhutHeal30_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal30_02,
		Name = "ZazhutHeal30_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth30"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth30"},
			EventReEnable	{Name = "ZazhutHeal30_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal20_01,
		Name = "ZazhutHeal20_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 20},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 20},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 20},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth20"},
			EventReEnable	{Name = "ZazhutHeal20_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal20_02,
		Name = "ZazhutHeal20_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth20"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth20"},
			EventReEnable	{Name = "ZazhutHeal20_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal10_01,
		Name = "ZazhutHeal10_01",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P710_ZazhutHealthPercent", Value = 10},
			FigureHasNotHealth	{Tag = "ZazhutLure", Percent = 10},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "ZazhutLure", Percent = 10},
			MapFlagSetTrue	{Name = "mf_P710_ZazhutHealth10"},
			EventReEnable	{Name = "ZazhutHeal10_02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = ZazhutHeal10_02,
		Name = "ZazhutHeal10_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_ZazhutHealth10"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P710_ZazhutHealth10"},
			EventReEnable	{Name = "ZazhutHeal10_01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower01Heal01,
		Name = "Tower01Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower01", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower01", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower01", Percent = 100},
			EventReEnable	{Name = "Tower01Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower01Heal02,
		Name = "Tower01Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower01", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower01", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower01", Percent = 100},
			EventReEnable	{Name = "Tower01Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower02Heal01,
		Name = "Tower02Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower02", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower02", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower02", Percent = 100},
			EventReEnable	{Name = "Tower02Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower02Heal02,
		Name = "Tower02Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower02", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower02", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower02", Percent = 100},
			EventReEnable	{Name = "Tower02Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower03Heal01,
		Name = "Tower03Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower03", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower03", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower03", Percent = 100},
			EventReEnable	{Name = "Tower03Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower03Heal02,
		Name = "Tower03Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower03", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower03", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower03", Percent = 100},
			EventReEnable	{Name = "Tower03Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower04Heal01,
		Name = "Tower04Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower04", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower04", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower04", Percent = 100},
			EventReEnable	{Name = "Tower04Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower04Heal02,
		Name = "Tower04Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower04", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower04", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower04", Percent = 100},
			EventReEnable	{Name = "Tower04Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower05Heal01,
		Name = "Tower05Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower05", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower05", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower05", Percent = 100},
			EventReEnable	{Name = "Tower05Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower05Heal02,
		Name = "Tower05Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower05", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower05", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower05", Percent = 100},
			EventReEnable	{Name = "Tower05Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower06Heal01,
		Name = "Tower06Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower06", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower06", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower06", Percent = 100},
			EventReEnable	{Name = "Tower06Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower06Heal02,
		Name = "Tower06Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower06", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower06", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower06", Percent = 100},
			EventReEnable	{Name = "Tower06Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower07Heal01,
		Name = "Tower07Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower07", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower07", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower07", Percent = 100},
			EventReEnable	{Name = "Tower07Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower07Heal02,
		Name = "Tower07Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower07", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower07", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower07", Percent = 100},
			EventReEnable	{Name = "Tower07Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower08Heal01,
		Name = "Tower08Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower08", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower08", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower08", Percent = 100},
			EventReEnable	{Name = "Tower08Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower08Heal02,
		Name = "Tower08Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower08", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower08", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower08", Percent = 100},
			EventReEnable	{Name = "Tower08Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower09Heal01,
		Name = "Tower09Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower09", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower09", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower09", Percent = 100},
			EventReEnable	{Name = "Tower09Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower09Heal02,
		Name = "Tower09Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower09", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower09", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower09", Percent = 100},
			EventReEnable	{Name = "Tower09Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower10Heal01,
		Name = "Tower10Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower10", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower10", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower10", Percent = 100},
			EventReEnable	{Name = "Tower10Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower10Heal02,
		Name = "Tower10Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower10", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower10", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower10", Percent = 100},
			EventReEnable	{Name = "Tower10Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower11Heal01,
		Name = "Tower11Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower11", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower11", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower11", Percent = 100},
			EventReEnable	{Name = "Tower11Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower11Heal02,
		Name = "Tower11Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower11", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower11", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower11", Percent = 100},
			EventReEnable	{Name = "Tower11Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower12Heal01,
		Name = "Tower12Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower12", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower12", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower12", Percent = 100},
			EventReEnable	{Name = "Tower12Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower12Heal02,
		Name = "Tower12Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower12", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower12", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower12", Percent = 100},
			EventReEnable	{Name = "Tower12Heal01"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Tower13Heal01,
		Name = "Tower13Heal01",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower13", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower13", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower13", Percent = 100},
			EventReEnable	{Name = "Tower13Heal02"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Tower13Heal02,
		Name = "Tower13Heal02",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			FigureIsNotInRangeToEntity	{Tag = "Tower13", TargetTag = "ZazhutLure", Range = 5},
			BuildingHasNotHealth	{Tag = "Tower13", Percent = 100},
		},
		Actions = 
		{
			BuildingHealthSet	{Tag = "Tower13", Percent = 100},
			EventReEnable	{Name = "Tower13Heal01"},
		},
	};
};