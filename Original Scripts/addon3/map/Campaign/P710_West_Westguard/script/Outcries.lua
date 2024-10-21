State
	{	
	StateName = "INIT",
			
	OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "NamelessBase1Destroyed", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "NamelessBase2Destroyed", Tag = "pl_HumanHeroCaine"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsNotActive	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
				QuestIsNotSolved	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
				OR
				{
					QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
					QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
				},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "TalktoShaikanLeader", Tag = "pl_HumanHeroCaine"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RealmLeaderAttacks1", Tag = "pl_HumanHeroCaine"},
				FigureOutcry	{TextTag = "RealmLeaderAttacks2", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsDead	{Tag = "Realm_Leader"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RealmLeaderDies1", Tag = "pl_HumanHeroCaine"},
				FigureOutcry	{TextTag = "RealmLeaderDies2", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_Realm_Lieutenant_Timer", Seconds = 5},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "TalktoRealmLieutenant1", Tag = "pl_HumanHeroCaine"},
				FigureOutcry	{TextTag = "TalktoRealmLieutenant2", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_REPAIR"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Tower_Lever", Range = 30},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersRepair", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue{Name = "mf_P710_Towers_Repaired"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersGather", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue{Name = "mf_P710_Towers_Repaired"},
				AvatarHasItemMisc	{Player = "pl_Human", ItemId = 765, Amount = 1},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersCrystalPickup", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower01_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower02_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower03_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower04_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower05_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower06_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower07_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower08_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower09_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower10_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower11_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower12_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Tower13_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "PowertheTowersAllTowerPowered", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mt_P710_Zazhut_1_Spawn"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "DefeatSarielandZazhut", Tag = "pl_HumanHeroCaine"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mt_P710_Zazhut_2_Spawn"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "DefeatSarielandZazhut", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mt_P710_Zazhut_3_Spawn"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "DefeatSarielandZazhut", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
		EventName = "AvatarLeave2",
		Name = "AvatarLeave2",
		Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_AvatarLeave", Seconds = 1},
			},
			Actions =
			{
				FigureOutcry	{TextTag = "AvatarLeave", Tag = "pl_HumanAvatar"},
				EventReEnable	{Name = "AvatarLeave3"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "LureZazhut", Range = 10},
				FigureIsInCombat	{Tag = "LureZazhut"},
				FigureIsInCombat	{Tag = "pl_HumanAvatar"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutInvincible", Tag = "pl_HumanCompanionCraigHuman"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower01"},
				MapFlagIsFalse	{Name = "mf_P710_Tower01_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanHeroOrc"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower02"},
				MapFlagIsFalse	{Name = "mf_P710_Tower02_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower03"},
				MapFlagIsFalse	{Name = "mf_P710_Tower03_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower04"},
				MapFlagIsFalse	{Name = "mf_P710_Tower04_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower05"},
				MapFlagIsFalse	{Name = "mf_P710_Tower05_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower06"},
				MapFlagIsFalse	{Name = "mf_P710_Tower06_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower07"},
				MapFlagIsFalse	{Name = "mf_P710_Tower07_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower08"},
				MapFlagIsFalse	{Name = "mf_P710_Tower08_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower09"},
				MapFlagIsFalse	{Name = "mf_P710_Tower09_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower10"},
				MapFlagIsFalse	{Name = "mf_P710_Tower10_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower11"},
				MapFlagIsFalse	{Name = "mf_P710_Tower11_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower12"},
				MapFlagIsFalse	{Name = "mf_P710_Tower12_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower13"},
				MapFlagIsFalse	{Name = "mf_P710_Tower13_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutUnpoweredTowerDestroy", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower01"},
				MapFlagIsTrue	{Name = "mf_P710_Tower01_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower02"},
				MapFlagIsTrue	{Name = "mf_P710_Tower02_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower03"},
				MapFlagIsTrue	{Name = "mf_P710_Tower03_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower04"},
				MapFlagIsTrue	{Name = "mf_P710_Tower04_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower05"},
				MapFlagIsTrue	{Name = "mf_P710_Tower05_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower06"},
				MapFlagIsTrue	{Name = "mf_P710_Tower06_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower07"},
				MapFlagIsTrue	{Name = "mf_P710_Tower07_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower08"},
				MapFlagIsTrue	{Name = "mf_P710_Tower08_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower09"},
				MapFlagIsTrue	{Name = "mf_P710_Tower09_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower10"},
				MapFlagIsTrue	{Name = "mf_P710_Tower10_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower11"},
				MapFlagIsTrue	{Name = "mf_P710_Tower11_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower12"},
				MapFlagIsTrue	{Name = "mf_P710_Tower12_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsLess	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry", Value = 4},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
				BuildingIsDead	{Tag = "Tower13"},
				MapFlagIsTrue	{Name = "mf_P710_Tower13_Powered"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutPoweredTowerDestroy", Tag = "pl_HumanCompanionCraigHuman"},
				MapValueIncrease	{Name = "mv_P710_LureZazhutPoweredTowerDestroyOutcry"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_LUREZAZHUT_LURE"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "LureZazhutWeakened", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Ruined_Sawmill01", Range = 15},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesSawmill", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Ruined_Sawmill02", Range = 15},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesSawmill", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Ruined_Sawmill03", Range = 15},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesSawmill", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Ruined_Sawmill04", Range = 15},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesSawmill", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Ruined_Sawmill05", Range = 15},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesSawmill", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarHasItemMisc	{Player = "default", ItemId = 766, Amount = 1},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesCogfound", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesLever", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesLeverPulled", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "RepairtheGatesLeverPulled", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsEqual	{Name = "mv_P710_Corrupted_Towers_Destroyed", Value = 1},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "CorruptedTowersOneDown", Tag = "pl_HumanHeroCaine"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsEqual	{Name = "mv_P710_Corrupted_Towers_Destroyed", Value = 2},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "CorruptedTowersTwoDown", Tag = "pl_HumanHeroCaine"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsEqual	{Name = "mv_P710_Corrupted_Towers_Destroyed", Value = 3},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "CorruptedTowersThreeDown", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapValueIsEqual	{Name = "mv_P710_Corrupted_Towers_Destroyed", Value = 3},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "CorruptedTowersThreeDown", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Undead_Arrived"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "UndeadArrival", Tag = "Undead_Lich"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarHasItemMisc	{Player = "default", ItemId = 768, Amount = 40},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "UndeadMoreCorpse", Tag = "Undead_Lich"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarHasItemMisc	{Player = "default", ItemId = 768, Amount = 80},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "UndeadMoreCorpse", Tag = "pl_HumanAvatar"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
				MapTimerIsElapsed	{Name = "mt_P710_FourTwiddle", Seconds = 120},
				OR
				{
					MapFlagIsFalse	{Name = "mf_P710_Twiddle2_Sesame"},
					MapFlagIsFalse	{Name = "mf_P710_Twiddle3_Sesame"},
					MapFlagIsFalse	{Name = "mf_P710_Twiddle4_Sesame"},
				},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "TwiddleFailed", Tag = "default"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle2_Sesame"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "Twiddle2Revived", Tag = "Twiddle2_Sesame"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle3_Sesame"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "Twiddle3Revived", Tag = "Twiddle3_Sesame"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle4_Sesame"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "Twiddle4Revived", Tag = "Twiddle4_Sesame"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mt_P710_Ghost_Spawned"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "KhoorSummon", Tag = "Khoor"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mt_P710_Khoor_Died"},
				QuestIsNotSolved	{Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = "KhoorDied", Tag = "pl_HumanHeroOrc"},
			},
		},
	};