------------------------------------------------------------------
---- 09: Zarach, god of creation, renewal, growth and conquer ----
------------------------------------------------------------------
	
State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		EventName = "Zarach first arrival - step1",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_GuardianStone09Known"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_09_in", Range = 5 },
			SetUpdateInterval	{Steps = 5},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "ZarachCry01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "ZarachCry02", Tag = "pl_HumanAvatar"},
			MapTimerStart	{Name = "KeronaQuestEndTimer"},
			
			--FigureOutcry	{TextTag = "ZarachCry03", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zarach first arrival - step2",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "KeronaQuestEndTimer", Seconds = 5},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "SS_KERONA"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Zarach first arrial - step3",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "KeronaQuestEndTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "KeronaQuestEndTimer"},
			DialogSetEnabled	{Tag = "qg_GuardianStone09"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Zarach resource Diff1",
		Conditions = 
		{
			GameDifficulty {Value = 1},
			QuestIsActive	{Player = "default", Quest = "SS_ZARACH"},
			MapFlagIsFalse {Name = "mf_P702_ZarachStart1"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = ZDT.D1.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = ZDT.D1.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = ZDT.D1.St },
			MapFlagSetTrue {Name = "mf_P702_ZarachStart1"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Zarach resource Diff2",
		Conditions = 
		{
			GameDifficulty {Value = 2},
			QuestIsActive	{Player = "default", Quest = "SS_ZARACH"},
			MapFlagIsFalse {Name = "mf_P702_ZarachStart1"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = ZDT.D2.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = ZDT.D2.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = ZDT.D2.St },
			MapFlagSetTrue {Name = "mf_P702_ZarachStart1"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zarach resource Diff3",
		Conditions = 
		{
			GameDifficulty {Value = 3},
			QuestIsActive	{Player = "default", Quest = "SS_ZARACH"},
			MapFlagIsFalse {Name = "mf_P702_ZarachStart1"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = ZDT.D3.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = ZDT.D3.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = ZDT.D3.St },
			MapFlagSetTrue {Name = "mf_P702_ZarachStart1"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zarach resource Diff4",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			QuestIsActive	{Player = "default", Quest = "SS_ZARACH"},
			MapFlagIsFalse {Name = "mf_P702_ZarachStart1"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = ZDT.D4.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = ZDT.D4.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = ZDT.D4.St },
			MapFlagSetTrue {Name = "mf_P702_ZarachStart1"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Zarach Timer Delay",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P702_ZarachStart2"},
			GameInterfaceIsVisible {},
			SetUpdateInterval	{Steps = 11},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Zarach_Delay_Timer", Seconds = ZDT.D1.Time },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Zarach_Delay_Timer", Seconds = ZDT.D2.Time },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Zarach_Delay_Timer", Seconds = ZDT.D3.Time },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Zarach_Delay_Timer", Seconds = ZDT.D4.Time },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Zarach_Delay_Timer"},
			MapTimerStart	{Name = "Elemental-1"},
			MapTimerStart	{Name = "Elemental-2"},
			MapTimerStart	{Name = "Elemental-3"},
			MapTimerStart	{Name = "Elemental-4"},
			MapTimerStart	{Name = "Elemental-5"},
			MapTimerStart	{Name = "Elemental-6"},
			MapTimerStart	{Name = "Tartalek"},
			MapFlagSetTrue {Name = "mf_P702_ZarachStart2"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Zarach init end 
	------------------------------------------------------
	-- Zarach resource outcry section 
	------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Zarach_Outcry_Resource25",
		Name = "Zarach_Outcry_Resource25",
		Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L1.O1 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L1.O1 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L1.O1 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L2.O1 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L2.O1 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L2.O1 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L3.O1 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L3.O1 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L3.O1 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L4.O1 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L4.O1 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L4.O1 },
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZarachCry10", Tag = "noFigure"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Zarach_Outcry_Resource50",
		Name = "Zarach_Outcry_Resource50",
		Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L1.O2 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L1.O2 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L1.O2 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L2.O2 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L2.O2 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L2.O2 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L3.O2 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L3.O2 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L3.O2 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L4.O2 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L4.O2 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L4.O2 },
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZarachCry11", Tag = "noFigure"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Zarach_Outcry_Resource75",
		Name = "Zarach_Outcry_Resource75",
		Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L1.O3 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L1.O3 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L1.O3 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L2.O3 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L2.O3 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L2.O3 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L3.O3 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L3.O3 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L3.O3 },
				},
				
				AND
				{
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
					MapFlagIsTrue {Name = "mf_P702_Ziggurat-3"},
					MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
					PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L4.O3 },
					PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L4.O3 },
					PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L4.O3 },
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZarachCry12", Tag = "noFigure"},
		},
		GotoState = self,
	};
	
	
	
	------------------------------------------------------
	-- Zarach resource outcry section end 
	------------------------------------------------------
	-- Ziggurat building section 
	------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Zarach Ziggurat Phase 1",
		Name = "Zarach_Ziggurat_Phase_1",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-1"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L1.Si },
			PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L1.St },
			PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L1.Le },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Ziggurat-plus"},
			-- VisualTimerStart	{Seconds = 600},
			--FigureRtsSpawnToEntityWithTag {Tag = "Zigg" , Level = 10, UnitId = 2160, TargetTag = "mrk_Zigg", PlayerKit = "pk_coll"},
			--NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Zigg", Level = 9, UnitId = 2160, TargetTag = "mrk_Zigg", Team = "tm_Collect"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zigg", Level = 5, UnitId = 2160, X = 386, Y = 306, Team = "tm_Collect"},},
			FigureDirectionSet	{Tag = "Zigg", Direction = 90},
			FigureTeleportToEntity	{Tag = "Zigg", TargetTag = "mrk_Zigg"},
			PlayerResourceSilverTake	{Player = "pl_Collect", Amount = ZZi.L1.Si },
			PlayerResourceStoneTake	{Player = "pl_Collect", Amount = ZZi.L1.St },
			PlayerResourceLenyaTake	{Player = "pl_Collect", Amount = ZZi.L1.Le },
			FigureHoldPosition	{Tag = "Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_Ziggurat-1"},
			MapFlagSetFalse {Name = "mf_P702_Ziggurat-plus"},
			EventReEnable	{Name = "Zarach_Ziggurat_Phase_1_down"},
			EventReEnable	{Name = "Zarach_Outcry_Resource25"},
			EventReEnable	{Name = "Zarach_Outcry_Resource50"},
			EventReEnable	{Name = "Zarach_Outcry_Resource75"},
			
			
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Zarach Ziggurat Phase 2",
		Name = "Zarach_Ziggurat_Phase_2",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Ziggurat-1"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L2.Si },
			PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L2.St },
			PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L2.Le },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Ziggurat-plus"},
			-- MapFlagSetFalse	{Name = "mf_P702_Ziggurat-1"},
			FigureVanish	{Tag = "Zigg"},
			--FigureRtsSpawnToEntityWithTag {Tag = "Zigg" , Level = 7, UnitId = 2161, TargetTag = "mrk_Zigg", PlayerKit = "pk_coll"},
			--NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Zigg", Level = 7, UnitId = 2161, TargetTag = "mrk_Zigg", Team = "tm_Collect"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zigg", Level = 5, UnitId = 2161, X = 386, Y = 306, Team = "tm_Collect"},},
			FigureDirectionSet	{Tag = "Zigg", Direction = 90},
			FigureTeleportToEntity	{Tag = "Zigg", TargetTag = "mrk_Zigg"},
			PlayerResourceSilverTake	{Player = "pl_Collect", Amount = ZZi.L2.Si },
			PlayerResourceStoneTake	{Player = "pl_Collect", Amount = ZZi.L2.St },
			PlayerResourceLenyaTake	{Player = "pl_Collect", Amount = ZZi.L2.Le },
			FigureHoldPosition	{Tag = "Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_Ziggurat-2"},
			FigureOutcry	{TextTag = "ZarachCry03", Tag = "pl_HumanHeroCaine"},
			MapTimerStart	{Name = "Elemental-P21"},
			MapTimerStart	{Name = "Elemental-P22"},
			MapTimerStart	{Name = "Elemental-P23"},
			MapFlagSetFalse {Name = "mf_P702_Ziggurat-plus"},
			EventReEnable	{Name = "Zarach_Ziggurat_Phase_2_down"},
			EventReEnable	{Name = "Zarach_Outcry_Resource25"},
			EventReEnable	{Name = "Zarach_Outcry_Resource50"},
			EventReEnable	{Name = "Zarach_Outcry_Resource75"},
		},
	};

 	OnOneTimeRepeatEvent
	{
		EventName = "Zarach Ziggurat Phase 3",
		Name = "Zarach_Ziggurat_Phase_3",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Ziggurat-1"},
			MapFlagIsTrue{Name = "mf_P702_Ziggurat-2"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L3.Si },
			PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L3.St },
			PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L3.Le },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Ziggurat-plus"},
			-- MapFlagSetFalse	{Name = "mf_P702_Ziggurat-2"},
			FigureOutcry	{TextTag = "ZarachCry03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "ZarachCry05", Tag = "pl_HumanHeroCaine"},
			FigureVanish	{Tag = "Zigg"},
			--FigureRtsSpawnToEntityWithTag {Tag = "Zigg" , Level = 5, UnitId = 2162, TargetTag = "mrk_Zigg", PlayerKit = "pk_coll"},
			--NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Zigg", Level = 5, UnitId = 2162, TargetTag = "mrk_Zigg", Team = "tm_Collect"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zigg", Level = 5, UnitId = 2162, X = 386, Y = 306, Team = "tm_Collect"},},
			FigureDirectionSet	{Tag = "Zigg", Direction = 90},
			FigureTeleportToEntity	{Tag = "Zigg", TargetTag = "mrk_Zigg"},
			PlayerResourceSilverTake	{Player = "pl_Collect", Amount = ZZi.L3.Si },
			PlayerResourceStoneTake	{Player = "pl_Collect", Amount = ZZi.L3.St },
			PlayerResourceLenyaTake	{Player = "pl_Collect", Amount = ZZi.L3.Le },
			FigureHoldPosition	{Tag = "Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_Ziggurat-3"},
			MapTimerStart	{Name = "Elemental-P31"},
			MapTimerStart	{Name = "Elemental-P32"},
			MapTimerStart	{Name = "Elemental-P33"},
			MapFlagSetFalse {Name = "mf_P702_Ziggurat-plus"},
			EventReEnable	{Name = "Zarach_Ziggurat_Phase_3_down"},
			EventReEnable	{Name = "Zarach_Outcry_Resource25"},
			EventReEnable	{Name = "Zarach_Outcry_Resource50"},
			EventReEnable	{Name = "Zarach_Outcry_Resource75"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "Zarach Ziggurat Phase 4",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			MapFlagIsTrue{Name = "mf_P702_Ziggurat-1"},
			MapFlagIsTrue{Name = "mf_P702_Ziggurat-2"},
			MapFlagIsTrue{Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			PlayerHasResourceSilver	{Player = "pl_Collect", Amount = ZZi.L4.Si },
			PlayerHasResourceStone	{Player = "pl_Collect", Amount = ZZi.L4.St },
			PlayerHasResourceLenya	{Player = "pl_Collect", Amount = ZZi.L4.Le },
			SetUpdateInterval	{Steps = 10},
			-- egyeb feltetelek - ha kellenek
		},
		Actions = 
		{
			
			MapFlagSetTrue {Name = "mf_P702_Ziggurat-plus"},
			MapFlagSetTrue	{Name = "mf_P702_Ziggurat-4"},
			FigureVanish	{Tag = "Zigg"},
			--FigureRtsSpawnToEntityWithTag {Tag = "Zigg" , Level = 3, UnitId = 2163, TargetTag = "mrk_Zigg", PlayerKit = "pk_coll"},
			--NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Zigg", Level = 3, UnitId = 2163, TargetTag = "mrk_Zigg", Team = "tm_Collect"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zigg", Level = 5, UnitId = 2163, X = 386, Y = 306, Team = "tm_Collect"},},
			FigureDirectionSet	{Tag = "Zigg", Direction = 90},
			FigureTeleportToEntity	{Tag = "Zigg", TargetTag = "mrk_Zigg"},
			PlayerResourceSilverTake	{Player = "pl_Collect", Amount = ZZi.L4.Si },
			PlayerResourceStoneTake	{Player = "pl_Collect", Amount = ZZi.L4.St },
			PlayerResourceLenyaTake	{Player = "pl_Collect", Amount = ZZi.L4.Le },

			FigureKill	{Tag = "rts_elem-1"},
			FigureKill	{Tag = "rts_elem-1b"},
			FigureKill	{Tag = "rts_elem-2"},
			FigureKill	{Tag = "rts_elem-3"},
			FigureKill	{Tag = "rts_elem-4"},
			FigureKill	{Tag = "rts_elem-4b"},
			FigureKill	{Tag = "rts_elem-5"},
			FigureKill	{Tag = "rts_elem-6"},
			FigureKill	{Tag = "rts_elem-21"},
			FigureKill	{Tag = "rts_elem-22"},
			FigureKill	{Tag = "rts_elem-23"},
			FigureKill	{Tag = "rts_elem-31"},
			FigureKill	{Tag = "rts_elem-32"},
			FigureKill	{Tag = "rts_elem-33"},
			--MapFlagSetTrue	{Name = "mf_P702_ZarachDone"},
			
			MapFlagSetFalse {Name = "mf_P702_Ziggurat-plus"},
			--FigureOutcry	{TextTag = "ZarachCry03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "ZarachCry06", Tag = "pl_HumanHeroCaine"},
			MapTimerStart	{Name = "ZarachEndTimer"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zarach End Phase1",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZarachEndTimer", Seconds = 2 },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-1"},
			MapTimerStop	{Name = "Elemental-2"},
			MapTimerStop	{Name = "Elemental-3"},
			MapTimerStop	{Name = "Elemental-4"},
			MapTimerStop	{Name = "Elemental-5"},
			MapTimerStop	{Name = "Elemental-6"},
			MapTimerStop	{Name = "Elemental-P21"},
			MapTimerStop	{Name = "Elemental-P22"},
			MapTimerStop	{Name = "Elemental-P23"},
			MapTimerStop	{Name = "Elemental-P31"},
			MapTimerStop	{Name = "Elemental-P32"},
			MapTimerStop	{Name = "Elemental-P33"},
			MapTimerStop	{Name = "Tartalek"},
			PlayerBuildingTeamTransfer	{Player = "pl_Human", Team = "tm_Neutral"},
			PlayerResourceLenyaTake	{Player = "pl_Human", Amount = 50000},
			PlayerResourceSilverTake	{Player = "pl_Human", Amount = 50000},
			PlayerResourceStoneTake	{Player = "pl_Human", Amount = 50000},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zarach End Phase2",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZarachEndTimer", Seconds = 5 },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "ZarachCry08", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry03", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "ZarachCry09", Tag = "pl_HumanAvatar"},
			MapFlagSetTrue	{Name = "mf_P702_ZarachDone"},
			
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- Ziggurat lerombolasanak lepesei
	------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Zarach Ziggurat Phase 3 down",
		Name = "Zarach_Ziggurat_Phase_3_down",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
			MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
			MapFlagIsTrue {Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-plus"},
			FigureIsDead	{Tag = "Zigg"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZarachCry04", Tag = "pl_HumanHeroCaine"},
			MapFlagSetFalse	{Name = "mf_P702_Ziggurat-3"},
			--FigureRtsSpawnToEntityWithTag {Tag = "Zigg" , Level = 7, UnitId = 834, TargetTag = "mrk_Zigg", PlayerKit = "pk_coll"},
			--NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Zigg", Level = 7, UnitId = 2161, TargetTag = "mrk_Zigg", Team = "tm_Collect"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zigg", Level = 5, UnitId = 2161, X = 386, Y = 306, Team = "tm_Collect"},},
			FigureDirectionSet	{Tag = "Zigg", Direction = 90},
			FigureTeleportToEntity	{Tag = "Zigg", TargetTag = "mrk_Zigg"},
			FigureHoldPosition	{Tag = "Zigg"},
			MapTimerStop	{Name = "Elemental-P31"},
			MapTimerStop	{Name = "Elemental-P32"},
			MapTimerStop	{Name = "Elemental-P33"},	
			-- MapFlagSetTrue	{Name = "mf_P702_Ziggurat-2"},
			EventReEnable	{Name = "Zarach_Ziggurat_Phase_3"},
			EventReEnable	{Name = "Zarach_Outcry_Resource25"},
			EventReEnable	{Name = "Zarach_Outcry_Resource50"},
			EventReEnable	{Name = "Zarach_Outcry_Resource75"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Zarach Ziggurat Phase 2 down",
		Name = "Zarach_Ziggurat_Phase_2_down",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
			MapFlagIsTrue {Name = "mf_P702_Ziggurat-2"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-plus"},
			FigureIsDead	{Tag = "Zigg"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZarachCry04", Tag = "pl_HumanHeroCaine"},
			MapFlagSetFalse	{Name = "mf_P702_Ziggurat-2"},
			--FigureRtsSpawnToEntityWithTag {Tag = "Zigg" , Level = 7, UnitId = 834, TargetTag = "mrk_Zigg", PlayerKit = "pk_coll"},
			--NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "Zigg", Level = 9, UnitId = 2160, TargetTag = "mrk_Zigg", Team = "tm_Collect"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "Zigg", Level = 5, UnitId = 2160, X = 386, Y = 306, Team = "tm_Collect"},},
			FigureDirectionSet	{Tag = "Zigg", Direction = 90},
			FigureTeleportToEntity	{Tag = "Zigg", TargetTag = "mrk_Zigg"},
			FigureHoldPosition	{Tag = "Zigg"},
			-- MapFlagSetTrue	{Name = "mf_P702_Ziggurat-1"},
			MapTimerStop	{Name = "Elemental-P21"},
			MapTimerStop	{Name = "Elemental-P22"},
			MapTimerStop	{Name = "Elemental-P23"},	
			EventReEnable	{Name = "Zarach_Ziggurat_Phase_2"},
			EventReEnable	{Name = "Zarach_Outcry_Resource25"},
			EventReEnable	{Name = "Zarach_Outcry_Resource50"},
			EventReEnable	{Name = "Zarach_Outcry_Resource75"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Zarach Ziggurat Phase 1 down",
		Name = "Zarach_Ziggurat_Phase_1_down",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Ziggurat-1"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-2"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-3"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-plus"},
			FigureIsDead	{Tag = "Zigg"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZarachCry04", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "ZarachCry07", Tag = "pl_HumanHeroCaine"},
			MapFlagSetFalse	{Name = "mf_P702_Ziggurat-1"},
			MapTimerStart	{Name = "ZarachFailedTimer"},

		},
	};
	
	OnOneTimeEvent
	{
		EventName = "Zarach HQ down",
		Conditions = 
		{
			BuildingIsDead	{Tag = "zigg_hq_ally"},
			PlayerHasNotFigureAmount	{Player = "pl_Collect", Amount = 1 },
		},
		Actions = 
		{
			MapTimerStart	{Name = "ZarachFailedTimer"},
		},
		GotoState = self,
	};


	
	------------------------------------------------------
	-- Enemy spawn
	------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-1_Spawn",
		Name = "Elemental-1_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-1", Seconds = vTimerP11 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "SElemental-1", Seconds = ZEn.E11.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-1", Seconds = ZEn.E11.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-1", Seconds = ZEn.E11.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-1", Seconds = ZEn.E11.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-1"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-1", Level = ZEn.E11.Lev , UnitId = ZEn.E11.ID , TargetTag = "mrk_De1", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-1", AbilityId = 93 },
			FigureAttackEntity	{Tag = "rts_elem-1", TargetTag = "Zigg"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-1b", Level = ZEn.E11.Lev , UnitId = ZEn.E11.ID, TargetTag = "mrk_De1", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-1b", AbilityId = 93 },
			FigureAttackEntity	{Tag = "rts_elem-1b", TargetTag = "Zigg"},
			
			MapFlagSetTrue	{Name = "mf_P702_elem-1_van"},
			EventReEnable	{Name = "Elemental-1_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-1_KO",
		Name = "Elemental-1_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-1"},
			FigureIsDead{Tag = "rts_elem-1b"},
			MapFlagIsTrue	{Name = "mf_P702_elem-1_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-1_van"},
			MapTimerStart	{Name = "Elemental-1"},
			EventReEnable	{Name = "Elemental-1_Spawn"},
		},
	};


	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-2_Spawn",
		Name = "Elemental-2_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-2", Seconds = vTimerP12 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "SElemental-2", Seconds = ZEn.E12.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-2", Seconds = ZEn.E12.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-2", Seconds = ZEn.E12.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-2", Seconds = ZEn.E12.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-2"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-2", Level = ZEn.E12.Lev , UnitId = ZEn.E12.ID , TargetTag = "mrk_De2", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-2", AbilityId = 93 },
			--FigureRunToEntity {Tag = "rts_elem-2", TargetTag = "mrk_Zigg"},
			FigureAttackEntity	{Tag = "rts_elem-2", TargetTag = "Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-2_van"},
			EventReEnable	{Name = "Elemental-2_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-2_KO",
		Name = "Elemental-2_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-2"},
			MapFlagIsTrue	{Name = "mf_P702_elem-2_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-2_van"},
			MapTimerStart	{Name = "Elemental-2"},
			EventReEnable	{Name = "Elemental-2_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-3_Spawn",
		Name = "Elemental-3_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-3", Seconds = vTimerP13 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "SElemental-3", Seconds = ZEn.E13.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-3", Seconds = ZEn.E13.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-3", Seconds = ZEn.E13.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-3", Seconds = ZEn.E13.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-3"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-3", Level = ZEn.E13.Lev , UnitId = ZEn.E13.ID , TargetTag = "mrk_De3", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-3", AbilityId = 93 },
			--FigureRunToEntity {Tag = "rts_elem-3", TargetTag = "mrk_Zigg"},
			FigureAttackEntity	{Tag = "rts_elem-3", TargetTag = "Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-3_van"},
			EventReEnable	{Name = "Elemental-3_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-3_KO",
		Name = "Elemental-3_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-3"},
			MapFlagIsTrue	{Name = "mf_P702_elem-3_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-3_van"},
			MapTimerStart	{Name = "Elemental-3"},
			EventReEnable	{Name = "Elemental-3_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-4_Spawn",
		Name = "Elemental-4_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-4", Seconds = vTimerP11 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "SElemental-4", Seconds = ZEn.E14.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-4", Seconds = ZEn.E14.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-4", Seconds = ZEn.E14.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-4", Seconds = ZEn.E14.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-4"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-4", Level = ZEn.E14.Lev , UnitId = ZEn.E14.ID , TargetTag = "mrk_De2", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-4", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-4", TargetTag = "mrk_Zigg"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-4b", Level = ZEn.E14.Lev , UnitId = ZEn.E14.ID , TargetTag = "mrk_De2", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-4b", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-4b", TargetTag = "mrk_Zigg"},
			
			MapFlagSetTrue	{Name = "mf_P702_elem-4_van"},
			EventReEnable	{Name = "Elemental-4_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-4_KO",
		Name = "Elemental-4_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-4"},
			FigureIsDead{Tag = "rts_elem-4b"},
			MapFlagIsTrue	{Name = "mf_P702_elem-4_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-4_van"},
			MapTimerStart	{Name = "Elemental-4"},
			EventReEnable	{Name = "Elemental-4_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-5_Spawn",
		Name = "Elemental-5_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-5", Seconds = vTimerP12 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "SElemental-5", Seconds = ZEn.E15.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-5", Seconds = ZEn.E15.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-5", Seconds = ZEn.E15.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-5", Seconds = ZEn.E15.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-5"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-5", Level = ZEn.E15.Lev , UnitId = ZEn.E15.ID , TargetTag = "mrk_De3", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-5", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-5", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-5_van"},
			EventReEnable	{Name = "Elemental-5_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-5_KO",
		Name = "Elemental-5_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-5"},
			MapFlagIsTrue	{Name = "mf_P702_elem-5_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-5_van"},
			MapTimerStart	{Name = "Elemental-5"},
			EventReEnable	{Name = "Elemental-5_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-6_Spawn",
		Name = "Elemental-6_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-6", Seconds = vTimerP13 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "SElemental-6", Seconds = ZEn.E16.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-6", Seconds = ZEn.E16.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-6", Seconds = ZEn.E16.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-6", Seconds = ZEn.E16.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-6"},

			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-6", Level = ZEn.E16.Lev , UnitId = ZEn.E16.ID , TargetTag = "mrk_De1", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-6", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-6", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-6_van"},
			EventReEnable	{Name = "Elemental-6_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-6_KO",
		Name = "Elemental-6_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-6"},
			MapFlagIsTrue	{Name = "mf_P702_elem-6_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-6_van"},
			MapTimerStart	{Name = "Elemental-6"},
			EventReEnable	{Name = "Elemental-6_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P21_Spawn",
		Name = "Elemental-P21_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-P21", Seconds = vTimerP21 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P21", Seconds = ZEn.E21.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P21", Seconds = ZEn.E21.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P21", Seconds = ZEn.E21.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P21", Seconds = ZEn.E21.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-P21"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-21", Level = ZEn.E21.Lev , UnitId = ZEn.E21.ID , TargetTag = "mrk_De1", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-21", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-21", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-P21_van"},
			EventReEnable	{Name = "Elemental-P21_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P21_KO",
		Name = "Elemental-P21_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-21"},
			MapFlagIsTrue	{Name = "mf_P702_elem-P21_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-P21_van"},
			MapTimerStart	{Name = "Elemental-P21"},
			EventReEnable	{Name = "Elemental-P21_Spawn"},
		},
	};		
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P22_Spawn",
		Name = "Elemental-P22_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-P22", Seconds = vTimerP22 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P22", Seconds = ZEn.E22.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P22", Seconds = ZEn.E22.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P22", Seconds = ZEn.E22.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P22", Seconds = ZEn.E22.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-P22"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-22", Level = ZEn.E22.Lev , UnitId = ZEn.E22.ID , TargetTag = "mrk_De2", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-22", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-22", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-P22_van"},
			EventReEnable	{Name = "Elemental-P22_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P22_KO",
		Name = "Elemental-P22_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-22"},
			MapFlagIsTrue	{Name = "mf_P702_elem-P22_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-P22_van"},
			MapTimerStart	{Name = "Elemental-P22"},
			EventReEnable	{Name = "Elemental-P22_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P23_Spawn",
		Name = "Elemental-P23_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-P23", Seconds = vTimerP23 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P23", Seconds = ZEn.E23.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P23", Seconds = ZEn.E23.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P23", Seconds = ZEn.E23.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P23", Seconds = ZEn.E23.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-P23"},
			--FigureRtsSpawnToEntityWithTag {Tag = "rts_elem-23" , Level = 6, UnitId = 194, TargetTag = "mrk_De3", PlayerKit = "pk_elem"},
			--FigureTeamTransfer	{Tag = "rts_elem-23", Team = "tm_Elem"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-23", Level = ZEn.E23.Lev , UnitId = ZEn.E23.ID , TargetTag = "mrk_De3", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-23", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-23", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-P23_van"},
			EventReEnable	{Name = "Elemental-P23_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P23_KO",
		Name = "Elemental-P23_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-23"},
			MapFlagIsTrue	{Name = "mf_P702_elem-P23_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-P23_van"},
			MapTimerStart	{Name = "Elemental-P23"},
			EventReEnable	{Name = "Elemental-P23_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P31_Spawn",
		Name = "Elemental-P31_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-P31", Seconds = vTimerP31 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P31", Seconds = ZEn.E31.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P31", Seconds = ZEn.E31.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P31", Seconds = ZEn.E31.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P31", Seconds = ZEn.E31.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-P31"},
			--FigureRtsSpawnToEntityWithTag {Tag = "rts_elem-31" , Level = 6, UnitId = 671, TargetTag = "mrk_De1", PlayerKit = "pk_elem"},
			--FigureTeamTransfer	{Tag = "rts_elem-31", Team = "tm_Elem"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-31", Level = ZEn.E31.Lev , UnitId = ZEn.E31.ID , TargetTag = "mrk_De1", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-31", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-31", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-P31_van"},
			EventReEnable	{Name = "Elemental-P31_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P31_KO",
		Name = "Elemental-P31_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-31"},
			MapFlagIsTrue	{Name = "mf_P702_elem-P31_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-P31_van"},
			MapTimerStart	{Name = "Elemental-P31"},
			EventReEnable	{Name = "Elemental-P31_Spawn"},
		},
	};	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P32_Spawn",
		Name = "Elemental-P32_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-P32", Seconds = vTimerP32 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P32", Seconds = ZEn.E32.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P32", Seconds = ZEn.E32.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P32", Seconds = ZEn.E32.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P32", Seconds = ZEn.E32.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-P32"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-32", Level = ZEn.E32.Lev , UnitId = ZEn.E32.ID , TargetTag = "mrk_De2", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-32", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-32", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-P32_van"},
			EventReEnable	{Name = "Elemental-P32_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P32_KO",
		Name = "Elemental-P32_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-32"},
			MapFlagIsTrue	{Name = "mf_P702_elem-P32_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-P32_van"},
			MapTimerStart	{Name = "Elemental-P32"},
			EventReEnable	{Name = "Elemental-P32_Spawn"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P33_Spawn",
		Name = "Elemental-P33_Spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "Elemental-P33", Seconds = vTimerP33 },
			MapFlagIsFalse {Name = "mf_P702_Ziggurat-4"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P33", Seconds = ZEn.E33.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P33", Seconds = ZEn.E33.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P33", Seconds = ZEn.E33.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "Elemental-P33", Seconds = ZEn.E33.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "Elemental-P33"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "rts_elem-33", Level = ZEn.E33.Lev , UnitId = ZEn.E33.ID , TargetTag = "mrk_De3", Team = "tm_Elem"},},
			FigureAbilityAdd	{Tag = "rts_elem-33", AbilityId = 93 },
			FigureRunToEntity {Tag = "rts_elem-33", TargetTag = "mrk_Zigg"},
			MapFlagSetTrue	{Name = "mf_P702_elem-P33_van"},
			EventReEnable	{Name = "Elemental-P33_KO"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elemental-P33_KO",
		Name = "Elemental-P33_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ZARACH"},
			FigureIsDead{Tag = "rts_elem-33"},
			MapFlagIsTrue	{Name = "mf_P702_elem-P33_van"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_elem-P33_van"},
			MapTimerStart	{Name = "Elemental-P33"},
			EventReEnable	{Name = "Elemental-P33_Spawn"},
		},
	};
	
	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_Caine",
		Name = "Teleport_Zarach_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_HeroFirst",
		Name = "Teleport_Zarach_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_HeroSecond",
		Name = "Teleport_Zarach_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_HeroThird",
		Name = "Teleport_Zarach_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_HeroOrc",
		Name = "Teleport_Zarach_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_CompanionCraigHuman",
		Name = "Teleport_Zarach_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zarach_CompanionSariel",
		Name = "Teleport_Zarach_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Zigg", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_Zigg", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zarach_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
}