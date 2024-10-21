State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Nameless3_SaveTimer", Seconds = 10},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStop	{Name = "mt_P710_Nameless3_SaveTimer"},
			MapFlagSetTrue {Name = "mf_P710_StartSarielCS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Nameless3_SaveTimer", Seconds = 10},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P710_Nameless3_SaveTimer"},
			MapFlagSetTrue {Name = "mf_P710_StartSarielCS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			MapFlagSetFalse {Name = "mf_P710_StartSarielCS"},
			FigureNpcSpawn	{Tag = "Zazhut_1", Level = 5, UnitId = 2080, X = 440, Y = 640, Team = "tm_Nameless"},
			FigureNpcSpawn	{Tag = "Sariel_1", Level = 5, UnitId = 2085, X = 435, Y = 635, Team = "tm_Nameless"},
			FigureCastSpellToEntity	{Tag = "Sariel_1", Spell = 350, Power = 30, TargetTag = "Sariel_1"},
			FigureManaSet	{Tag = "Zazhut_1", Percent = 0},
			FigureManaSet	{Tag = "Sariel_1", Percent = 0},
			MapValueSet	{Name = "mv_P710_SarielandZazhut_SharedHealth", Value = 200},
			MapFlagSetTrue	{Name = "mf_P710_AddAbilities"},
			AvatarFlagSetTrue {Name = "af_DragonMountDisabled"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
		},
		Actions =
		{
			AvatarFlagSetFalse {Name = "af_DeadDragonIsGameOver"},
			AvatarFlagSetFalse {Name = "af_DragonMountEnabled"},		
			PlayerBuildingTeamTransfer {Player = "pl_Human", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Realm", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Shaikan", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Undead", Team = "tm_Neutral"},
			FigureKill	{Tag = "Twiddle1"},
			FigureKill	{Tag = "Twiddle2"},
			FigureKill	{Tag = "Twiddle3"},
			FigureKill	{Tag = "Twiddle4"},
			FigureKill	{Tag = "Twiddle2_Sesame"},
			FigureKill	{Tag = "Twiddle3_Sesame"},
			FigureKill	{Tag = "Twiddle4_Sesame"},
			FigureKill	{Tag = "Twiddle_Titan"},
			FigureKill	{Tag = "Human_Merchant"},
			FigureKill	{Tag = "Shaikan_Merchant"},
			FigureKill	{Tag = "Shaikan_Leader"},
			FigureKill	{Tag = "Realm_Lieutenant"},
			FigureKill	{Tag = "Realm_Leader"},
			FigureKill	{Tag = "Undead_Lich"},
			MapTimerStart	{Name = "mt_P710_DragonDead"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_DragonDead", Seconds = 1},
		},
		Actions =
		{
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 10 , UnitId = 2222 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Player = "default", Tag = "Surian" },			
			AvatarFlagSetTrue {Name = "af_DeadDragonIsGameOver"},
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},		
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			MapFlagIsFalse	{Name = "mt_P710_Khoor_Died"},
		},
		Actions =
		{
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Khoor", Level = 30, UnitId = 2099, X = 444, Y = 625, Team = "tm_Neutral"},},
			FigureTeamTransfer	{Tag = "Khoor", Team = "tm_Allies"},
			FigurePlayerTransfer	{Tag = "Khoor", Player = "pl_Human"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DESTROYTOWERS"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_DESTROYTOWERS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_TWIDDLE_OPENSESAME"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_TWIDDLE_OPENSESAME"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_PUTCOG"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_PUTCOG"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_GATHER"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_GATHER"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartSarielCS_End"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},			
		},
		Actions =
		{
			QuestSetUnsolvable	{Player = "default", Quest = "ADDON3_MAP09_UNDEADS_BRING"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "AvatarLeave1",
	Name = "AvatarLeave1",
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureIsNotInRange	{Tag = "pl_HumanAvatar", Range = 45, X = 430, Y = 645},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P710_AvatarLeave"},
			EventReEnable	{Name = "AvatarLeave2"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "AvatarLeave3",
	Name = "AvatarLeave3",
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_AvatarLeave", Seconds = 2},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P710_AvatarLeave"},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 440, Y = 630},
			EventReEnable	{Name = "AvatarLeave1"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "Zazhut1A",
		Name = "Zazhut1A",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureHasNotHealth	{Tag = "Zazhut_1", Percent = 71},
			OR
			{
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 1},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 2},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 3},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 4},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 5},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 6},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 7},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 8},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 9},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 10},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 11},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 12},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 13},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 14},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 15},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 16},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 17},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 18},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 19},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 20},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 21},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 22},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 23},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 24},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 25},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 26},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 27},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 28},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 29},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 30},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 31},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 32},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 33},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 34},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 35},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 36},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 37},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 38},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 39},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 40},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 41},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 42},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 43},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 44},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 45},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 46},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 47},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 48},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 49},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 50},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 51},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 52},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 53},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 54},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 55},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 56},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 57},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 58},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 59},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 60},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 61},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 62},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 63},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 64},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 65},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 66},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 67},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 68},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 69},
				FigureHasHealth	{Tag = "Zazhut_1", Percent = 70},
			},
		},
		Actions =
		{
			FigureAbilityAdd	{Tag = "Zazhut_1", AbilityId = 95},
			FigureTeamTransfer	{Tag = "Zazhut_1", Team = "tm_Neutral"},
			FigureCastSpellToEntity	{Tag = "Zazhut_1", Spell = 306, Power = 30, TargetTag = "Zazhut_1"},
			FigureForcedRun	{Tag = "Zazhut_1", X = 430, Y = 675},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut1B",
	Name = "Zazhut1B",
	Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P710_Zazhut_1_Spawn"},
			MapFlagIsFalse	{Name = "mf_P710_Zazhut_2_Spawn"},
			MapFlagIsFalse	{Name = "mf_P710_Zazhut_3_Spawn"},
			FigureIsInRange	{Tag = "Zazhut_1", Range = 0.5, X = 430, Y = 675},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Zazhut_1", Team = "tm_Neutral"},
			EffectStartAddon2	{Tag = "DemonPortal", File = "Effect_Teleport"},
			FigureVanish	{Tag = "Zazhut_1"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zazhut_2", Level = 5, UnitId = 2081, X = 430, Y = 675, Team = "tm_Neutral"},},
			FigureHealthSet	{Tag = "Zazhut_2", Percent = 70},
			FigureAbilityAdd	{Tag = "Zazhut_2", AbilityId = 95},
			MapTimerStart	{Name = "mt_P710_ZazhutPortal"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut1C",
	Name = "Zazhut1C",
	Conditions = 
		{
			FigureIsAlive	{Tag = "Zazhut_2"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			MapTimerIsElapsed	{Name = "mt_P710_ZazhutPortal", Seconds = 3},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P710_ZazhutPortal"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut1C_Nameless01", Level = 30, UnitId = 189, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut1C_Nameless02", Level = 30, UnitId = 189, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut1C_Nameless03", Level = 30, UnitId = 195, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut1C_Nameless04", Level = 30, UnitId = 195, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureTeamTransfer	{Tag = "Zazhut1C_Nameless01", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut1C_Nameless02", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut1C_Nameless03", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut1C_Nameless04", Team = "tm_Nameless"},
			FigureRunToEntity	{Tag = "Zazhut1C_Nameless01", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut1C_Nameless02", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut1C_Nameless03", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut1C_Nameless04", TargetTag = "pl_HumanAvatar"},
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_1_Spawn"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut1D",
	Name = "Zazhut1D",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_1_Spawn"},
			FigureIsDead	{Tag = "Zazhut1C_Nameless01"},
			FigureIsDead	{Tag = "Zazhut1C_Nameless02"},
			FigureIsDead	{Tag = "Zazhut1C_Nameless03"},
			FigureIsDead	{Tag = "Zazhut1C_Nameless04"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_1_Spawn_Dead"},
			EffectStop	{Tag = "DemonPortal"},
			FigureTeamTransfer	{Tag = "Zazhut_2", Team = "tm_Nameless"},
			FigureCastSpellToEntity	{Tag = "Zazhut_2", Spell = 306, Power = 30, TargetTag = "Zazhut_2"},
			FigureAbilityRemove	{Tag = "Zazhut_2", AbilityId = 95},
			FigureRunToEntity	{Tag = "Zazhut_2", TargetTag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "Zazhut2A",
		Name = "Zazhut2A",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_1_Spawn_Dead"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureHasNotHealth	{Tag = "Zazhut_2", Percent = 51},
			OR
			{
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 1},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 2},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 3},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 4},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 5},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 6},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 7},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 8},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 9},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 10},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 11},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 12},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 13},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 14},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 15},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 16},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 17},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 18},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 19},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 20},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 21},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 22},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 23},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 24},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 25},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 26},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 27},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 28},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 29},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 30},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 31},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 32},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 33},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 34},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 35},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 36},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 37},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 38},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 39},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 40},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 41},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 42},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 43},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 44},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 45},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 46},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 47},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 48},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 49},
				FigureHasHealth	{Tag = "Zazhut_2", Percent = 50},
			},
		},
		Actions =
		{
			FigureAbilityAdd	{Tag = "Zazhut_2", AbilityId = 95},
			FigureTeamTransfer	{Tag = "Zazhut_2", Team = "tm_Neutral"},
			FigureCastSpellToEntity	{Tag = "Zazhut_2", Spell = 306, Power = 30, TargetTag = "Zazhut_2"},
			FigureForcedRun	{Tag = "Zazhut_2", X = 430, Y = 675},
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_2_Attack"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut2B",
	Name = "Zazhut2B",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_1_Spawn"},
			MapFlagIsFalse	{Name = "mf_P710_Zazhut_2_Spawn"},
			MapFlagIsFalse	{Name = "mf_P710_Zazhut_3_Spawn"},
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_2_Attack"},
			FigureIsInRange	{Tag = "Zazhut_2", Range = 0.5, X = 430, Y = 675},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Zazhut_2", Team = "tm_Neutral"},
			EffectStartAddon2	{Tag = "DemonPortal", File = "Effect_Teleport"},
			FigureVanish	{Tag = "Zazhut_2"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zazhut_3", Level = 5, UnitId = 2082, X = 430, Y = 675, Team = "tm_Neutral"},},
			FigureHealthSet	{Tag = "Zazhut_3", Percent = 40},
			FigureAbilityAdd	{Tag = "Zazhut_3", AbilityId = 95},
			MapTimerStart	{Name = "mt_P710_ZazhutPortal"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut2C",
	Name = "Zazhut2C",
	Conditions = 
		{
			FigureIsAlive	{Tag = "Zazhut_3"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			MapTimerIsElapsed	{Name = "mt_P710_ZazhutPortal", Seconds = 3},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P710_ZazhutPortal"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless01", Level = 30, UnitId = 189, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless02", Level = 30, UnitId = 189, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless03", Level = 30, UnitId = 195, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless04", Level = 30, UnitId = 195, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless05", Level = 30, UnitId = 190, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless06", Level = 30, UnitId = 190, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut2C_Nameless07", Level = 30, UnitId = 192, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless01", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless02", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless03", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless04", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless05", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless06", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut2C_Nameless07", Team = "tm_Nameless"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless01", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless02", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless03", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless04", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless05", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless06", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut2C_Nameless07", TargetTag = "pl_HumanAvatar"},
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_2_Spawn"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut2D",
	Name = "Zazhut2D",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_2_Spawn"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless01"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless02"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless03"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless04"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless05"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless06"},
			FigureIsDead	{Tag = "Zazhut2C_Nameless07"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_2_Spawn_Dead"},
			EffectStop	{Tag = "DemonPortal"},
			FigureTeamTransfer	{Tag = "Zazhut_3", Team = "tm_Nameless"},
			FigureCastSpellToEntity	{Tag = "Zazhut_3", Spell = 306, Power = 30, TargetTag = "Zazhut_3"},
			FigureAbilityRemove	{Tag = "Zazhut_3", AbilityId = 95},
			FigureRunToEntity	{Tag = "Zazhut_3", TargetTag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "Zazhut3A",
		Name = "Zazhut3A",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_2_Spawn_Dead"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureHasNotHealth	{Tag = "Zazhut_3", Percent = 11},
			OR
			{
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 1},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 2},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 3},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 4},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 5},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 6},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 7},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 8},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 9},
				FigureHasHealth	{Tag = "Zazhut_3", Percent = 10},
			},
		},
		Actions =
		{
			FigureAbilityAdd	{Tag = "Zazhut_3", AbilityId = 95},
			FigureTeamTransfer	{Tag = "Zazhut_3", Team = "tm_Neutral"},
			FigureCastSpellToEntity	{Tag = "Zazhut_3", Spell = 306, Power = 30, TargetTag = "Zazhut_3"},
			FigureForcedRun	{Tag = "Zazhut_3", X = 430, Y = 675},
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_3_Attack"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut3B",
	Name = "Zazhut3B",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_1_Spawn"},
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_2_Spawn"},
			MapFlagIsFalse	{Name = "mf_P710_Zazhut_3_Spawn"},
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_3_Attack"},
			FigureIsInRange	{Tag = "Zazhut_3", Range = 0.5, X = 430, Y = 675},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Zazhut_3", Team = "tm_Neutral"},
			EffectStartAddon2	{Tag = "DemonPortal", File = "Effect_Teleport"},
			FigureVanish	{Tag = "Zazhut_3"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zazhut_4", Level = 5, UnitId = 2083, X = 430, Y = 675, Team = "tm_Neutral"},},
			FigureHealthSet	{Tag = "Zazhut_4", Percent = 10},
			FigureAbilityAdd	{Tag = "Zazhut_4", AbilityId = 95},
			MapTimerStart	{Name = "mt_P710_ZazhutPortal"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut3C",
	Name = "Zazhut3C",
	Conditions = 
		{
			FigureIsAlive	{Tag = "Zazhut_4"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			MapTimerIsElapsed	{Name = "mt_P710_ZazhutPortal", Seconds = 3},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P710_ZazhutPortal"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless01", Level = 30, UnitId = 189, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless02", Level = 30, UnitId = 189, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless03", Level = 30, UnitId = 195, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless04", Level = 30, UnitId = 195, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless05", Level = 30, UnitId = 190, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless06", Level = 30, UnitId = 190, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless07", Level = 30, UnitId = 192, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless08", Level = 30, UnitId = 191, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureRtsSpawnToEntityWithTag	{Tag = "Zazhut3C_Nameless09", Level = 30, UnitId = 193, TargetTag = "DemonPortal", PlayerKit = "pk_Nameless_boss"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless01", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless02", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless03", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless04", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless05", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless06", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless07", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless08", Team = "tm_Nameless"},
			FigureTeamTransfer	{Tag = "Zazhut3C_Nameless09", Team = "tm_Nameless"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless01", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless02", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless03", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless04", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless05", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless06", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless07", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless08", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity	{Tag = "Zazhut3C_Nameless09", TargetTag = "pl_HumanAvatar"},
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_3_Spawn"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Zazhut3D",
	Name = "Zazhut3D",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Zazhut_3_Spawn"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless01"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless02"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless03"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless04"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless05"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless06"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless07"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless08"},
			FigureIsDead	{Tag = "Zazhut3C_Nameless09"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P710_Zazhut_3_Spawn_Dead"},
			EffectStop	{Tag = "DemonPortal"},
			FigureTeamTransfer	{Tag = "Zazhut_4", Team = "tm_Nameless"},
			FigureCastSpellToEntity	{Tag = "Zazhut_4", Spell = 306, Power = 30, TargetTag = "Zazhut_4"},
			FigureAbilityRemove	{Tag = "Zazhut_4", AbilityId = 95},
			FigureRunToEntity	{Tag = "Zazhut_4", TargetTag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Sariel 1st A",
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureHasNotHealth	{Tag = "Sariel_1", Percent = 76},
			OR
			{
				FigureHasHealth	{Tag = "Sariel_1", Percent = 1},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 2},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 3},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 4},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 5},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 6},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 7},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 8},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 9},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 10},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 11},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 12},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 13},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 14},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 15},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 16},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 17},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 18},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 19},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 20},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 21},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 22},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 23},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 24},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 25},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 26},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 27},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 28},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 29},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 30},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 31},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 32},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 33},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 34},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 35},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 36},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 37},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 38},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 39},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 40},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 41},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 42},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 43},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 44},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 45},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 46},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 47},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 48},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 49},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 50},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 51},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 52},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 53},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 54},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 55},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 56},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 57},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 58},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 59},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 60},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 61},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 62},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 63},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 64},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 65},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 66},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 67},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 68},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 69},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 70},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 71},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 72},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 73},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 74},
				FigureHasHealth	{Tag = "Sariel_1", Percent = 75},
			},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1102, TargetTag = "Sariel_1", Direction = 0, Tag = "Sariel_Respawn_Node"},
			EffectStartAddon1	{Tag = "Sariel_Respawn_Node", File = "Effect_Misc_Warming"},
			MapFlagSetTrue	{Name = "mf_P710_Sariel_1"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Sariel 1st B",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Sariel_1"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Sariel_1"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Sariel_2", Level = 5, UnitId = 2086, TargetTag = "Sariel_Respawn_Node", Team = "tm_Nameless"},},
			FigureHealthSet	{Tag = "Sariel_2", Percent = 75},
			FigureCastSpellToEntity	{Tag = "Sariel_2", Spell = 350, Power = 30, TargetTag = "Sariel_2"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Sariel 2nd A",
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureHasNotHealth	{Tag = "Sariel_2", Percent = 51},
			OR
			{
				FigureHasHealth	{Tag = "Sariel_2", Percent = 1},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 2},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 3},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 4},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 5},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 6},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 7},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 8},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 9},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 10},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 11},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 12},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 13},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 14},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 15},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 16},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 17},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 18},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 19},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 20},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 21},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 22},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 23},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 24},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 25},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 26},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 27},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 28},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 29},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 30},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 31},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 32},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 33},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 34},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 35},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 36},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 37},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 38},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 39},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 40},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 41},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 42},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 43},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 44},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 45},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 46},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 47},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 48},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 49},
				FigureHasHealth	{Tag = "Sariel_2", Percent = 50},
			},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sariel_Respawn_Node"},
			ObjectSpawnToEntity	{ObjectId = 1102, TargetTag = "Sariel_2", Direction = 0, Tag = "Sariel_Respawn_Node"},
			EffectStartAddon1	{Tag = "Sariel_Respawn_Node", File = "Effect_Misc_Warming"},
			MapFlagSetTrue	{Name = "mf_P710_Sariel_2"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Sariel 2nd B",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Sariel_2"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Sariel_2"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Sariel_3", Level = 5, UnitId = 2087, TargetTag = "Sariel_Respawn_Node", Team = "tm_Nameless"},},
			FigureHealthSet	{Tag = "Sariel_3", Percent = 50},
			FigureCastSpellToEntity	{Tag = "Sariel_3", Spell = 350, Power = 30, TargetTag = "Sariel_3"},
			ObjectVanish	{Tag = "Sariel_Respawn_Node"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Sariel 3rd A",
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureHasNotHealth	{Tag = "Sariel_3", Percent = 26},
			OR
			{
				FigureHasHealth	{Tag = "Sariel_3", Percent = 1},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 2},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 3},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 4},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 5},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 6},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 7},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 8},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 9},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 10},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 11},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 12},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 13},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 14},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 15},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 16},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 17},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 18},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 19},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 20},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 21},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 22},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 23},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 24},
				FigureHasHealth	{Tag = "Sariel_3", Percent = 25},
			},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Sariel_Respawn_Node"},
			ObjectSpawnToEntity	{ObjectId = 1102, TargetTag = "Sariel_3", Direction = 0, Tag = "Sariel_Respawn_Node"},
			EffectStartAddon1	{Tag = "Sariel_Respawn_Node", File = "Effect_Misc_Warming"},
			MapFlagSetTrue	{Name = "mf_P710_Sariel_3"},
		},
	},
	
	OnOneTimeEvent
	{
	EventName = "Sariel 3rd B",
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Sariel_3"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Sariel_3"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Sariel_4", Level = 5, UnitId = 2088, TargetTag = "Sariel_Respawn_Node", Team = "tm_Nameless"},},
			FigureHealthSet	{Tag = "Sariel_4", Percent = 25},
			FigureCastSpellToEntity	{Tag = "Sariel_4", Spell = 350, Power = 30, TargetTag = "Sariel_4"},
			ObjectVanish	{Tag = "Sariel_Respawn_Node"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureIsDead	{Tag = "Sariel_1"},
			FigureIsDead	{Tag = "Sariel_2"},
			FigureIsDead	{Tag = "Sariel_3"},
			FigureIsDead	{Tag = "Sariel_4"},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P710_StartZazhutCS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_StartZazhutCS", Seconds = 10},
			AvatarIsNotTalking	{},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
			MapTimerStop	{Name = "mt_P710_StartZazhutCS"},
			FigureVanish	{Tag = "Zazhut_1"},
			FigureVanish	{Tag = "Zazhut_2"},
			FigureVanish	{Tag = "Zazhut_3"},
			FigureVanish	{Tag = "Zazhut_4"},
			FigureVanish	{Tag = "Zazhut1C_Nameless01"},
			FigureVanish	{Tag = "Zazhut1C_Nameless02"},
			FigureVanish	{Tag = "Zazhut1C_Nameless03"},
			FigureVanish	{Tag = "Zazhut1C_Nameless04"},
			FigureVanish	{Tag = "Zazhut2C_Nameless01"},
			FigureVanish	{Tag = "Zazhut2C_Nameless02"},
			FigureVanish	{Tag = "Zazhut2C_Nameless03"},
			FigureVanish	{Tag = "Zazhut2C_Nameless04"},
			FigureVanish	{Tag = "Zazhut2C_Nameless05"},
			FigureVanish	{Tag = "Zazhut2C_Nameless06"},
			FigureVanish	{Tag = "Zazhut2C_Nameless07"},
			FigureVanish	{Tag = "Zazhut3C_Nameless01"},
			FigureVanish	{Tag = "Zazhut3C_Nameless02"},
			FigureVanish	{Tag = "Zazhut3C_Nameless03"},
			FigureVanish	{Tag = "Zazhut3C_Nameless04"},
			FigureVanish	{Tag = "Zazhut3C_Nameless05"},
			FigureVanish	{Tag = "Zazhut3C_Nameless06"},
			FigureVanish	{Tag = "Zazhut3C_Nameless07"},
			FigureVanish	{Tag = "Zazhut3C_Nameless08"},
			FigureVanish	{Tag = "Zazhut3C_Nameless09"},
			MapFlagSetTrue {Name = "mf_P710_StartZazhutCS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_StartZazhutCS", Seconds = 10},
			AvatarIsNotTalking	{},
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P710_StartZazhutCS"},
			FigureVanish	{Tag = "Zazhut_1"},
			FigureVanish	{Tag = "Zazhut_2"},
			FigureVanish	{Tag = "Zazhut_3"},
			FigureVanish	{Tag = "Zazhut_4"},
			FigureVanish	{Tag = "Zazhut1C_Nameless01"},
			FigureVanish	{Tag = "Zazhut1C_Nameless02"},
			FigureVanish	{Tag = "Zazhut1C_Nameless03"},
			FigureVanish	{Tag = "Zazhut1C_Nameless04"},
			FigureVanish	{Tag = "Zazhut2C_Nameless01"},
			FigureVanish	{Tag = "Zazhut2C_Nameless02"},
			FigureVanish	{Tag = "Zazhut2C_Nameless03"},
			FigureVanish	{Tag = "Zazhut2C_Nameless04"},
			FigureVanish	{Tag = "Zazhut2C_Nameless05"},
			FigureVanish	{Tag = "Zazhut2C_Nameless06"},
			FigureVanish	{Tag = "Zazhut2C_Nameless07"},
			FigureVanish	{Tag = "Zazhut3C_Nameless01"},
			FigureVanish	{Tag = "Zazhut3C_Nameless02"},
			FigureVanish	{Tag = "Zazhut3C_Nameless03"},
			FigureVanish	{Tag = "Zazhut3C_Nameless04"},
			FigureVanish	{Tag = "Zazhut3C_Nameless05"},
			FigureVanish	{Tag = "Zazhut3C_Nameless06"},
			FigureVanish	{Tag = "Zazhut3C_Nameless07"},
			FigureVanish	{Tag = "Zazhut3C_Nameless08"},
			FigureVanish	{Tag = "Zazhut3C_Nameless09"},
			MapFlagSetTrue {Name = "mf_P710_StartZazhutCS"},
			--UIBossfightPanelShow {UnitTag1 = "Zazhut_1", UnitTag2 = "Sariel_1", PortraitImage = "", DisplayName = "Zazhut & Sariel"}
		},
	},
};