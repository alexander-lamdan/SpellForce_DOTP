------------------------------------------------------
---- 02: Elen, god of the hunt ----
------------------------------------------------------

State
{
	StateName = "INIT",
	
	-- Ami kell:
	-- Bestiak megolese utani rewardok!
	-- Palyara atnyulo questek (2 db)
	-- Sajat, kitalalt quest megoldasa: Az atnyulo quest "folytatasa". - Talaj meg nehany szellemmacskat, vadaszd le oket, hogy a farkas lelke (szelleme) bekeben nyugodhasson.
	-- Farkas nyughelye.
	-- Cutscene: cs_02_Elen_01.lua Terv: Farkas+Avatar+Caine: Macskaszagot erzek! Tisztitsd meg toluk a nyughelyem, mielott eltemeted a maradvanyaimat!
	
	
	------------------------------------------------------
	-- Debug-section Start
	------------------------------------------------------
	
	------------------------------------------------------
	-- Debug-section End
	------------------------------------------------------
	-- Arrival
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Elen Arrival first time",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};


	
	
	------------------------------------------------------
	-- Main Quest --
	------------------------------------------------------
			-- Monsters level set - dificulty!
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Elen - monster set - diff1",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Elen_Init"},
			--QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			GameDifficulty {Value = 1},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "mst_Hornet", Level = El.E10.L1 , UnitId = El.E10.ID , X = 209, Y = 57, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Spider", Level = El.E20.L1 , UnitId = El.E20.ID , X = 160, Y = 55, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Jaguar", Level = El.E30.L1 , UnitId = El.E30.ID , X = 128, Y = 90, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Wolf", Level = El.E40.L1 , UnitId = El.E40.ID , X = 183, Y = 124, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Bear", Level = El.E50.L1 , UnitId = El.E50.ID , X = 172, Y = 172, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Raptor", Level = El.E60.L1 , UnitId = El.E60.ID , X = 108, Y = 189, Team = "tm_Creep"},
			FigureRoamingEnable	{Tag = "mst_Hornet"},
			FigureRoamingEnable	{Tag = "mst_Jaguar"},
			FigureRoamingEnable	{Tag = "mst_Bear"},
			FigureDirectionSet	{Tag = "mst_Spider", Direction = 86},
			FigureDirectionSet	{Tag = "mst_Wolf", Direction = 345},
			FigureDirectionSet	{Tag = "mst_Raptor", Direction = 97},
			MapFlagSetFalse {Name = "mf_P702_Elen_Init"},
		},
		GotoState = self,
	};

		OnOneTimeEvent
	{
		EventName = "Elen - monster set - diff2",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Elen_Init"},
			--QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "mst_Hornet", Level = El.E10.L2 , UnitId = El.E10.ID , X = 209, Y = 57, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Spider", Level = El.E20.L2 , UnitId = El.E20.ID , X = 160, Y = 55, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Jaguar", Level = El.E30.L2 , UnitId = El.E30.ID , X = 128, Y = 90, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Wolf", Level = El.E40.L2 , UnitId = El.E40.ID , X = 183, Y = 124, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Bear", Level = El.E50.L2 , UnitId = El.E50.ID , X = 172, Y = 172, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Raptor", Level = El.E60.L2 , UnitId = El.E60.ID , X = 108, Y = 189, Team = "tm_Creep"},
			FigureRoamingEnable	{Tag = "mst_Hornet"},
			FigureRoamingEnable	{Tag = "mst_Jaguar"},
			FigureRoamingEnable	{Tag = "mst_Bear"},
			FigureDirectionSet	{Tag = "mst_Spider", Direction = 86},
			FigureDirectionSet	{Tag = "mst_Wolf", Direction = 345},
			FigureDirectionSet	{Tag = "mst_Raptor", Direction = 97},
			
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s1", Level = El.E11.L2 , UnitId = El.E11.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s2", Level = El.E12.L2 , UnitId = El.E12.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			FigureRoamingEnable	{Tag = "mst_Hornet_s1"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s2"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s1", Level = El.E21.L2 , UnitId = El.E21.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s2", Level = El.E22.L2 , UnitId = El.E22.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			MapFlagSetFalse {Name = "mf_P702_Elen_Init"},
		},
		GotoState = self,
	};


	OnOneTimeEvent
	{
		EventName = "Elen - monster set - diff3",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Elen_Init"},
			--QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			GameDifficulty {Value = 3},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "mst_Hornet", Level = El.E10.L3 , UnitId = El.E10.ID , X = 209, Y = 57, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Spider", Level = El.E20.L3 , UnitId = El.E20.ID , X = 160, Y = 55, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Jaguar", Level = El.E30.L3 , UnitId = El.E30.ID , X = 128, Y = 90, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Wolf", Level = El.E40.L3 , UnitId = El.E40.ID , X = 183, Y = 124, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Bear", Level = El.E50.L3 , UnitId = El.E50.ID , X = 172, Y = 172, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Raptor", Level = El.E60.L3 , UnitId = El.E60.ID , X = 108, Y = 189, Team = "tm_Creep"},
			FigureRoamingEnable	{Tag = "mst_Hornet"},
			FigureRoamingEnable	{Tag = "mst_Jaguar"},
			FigureRoamingEnable	{Tag = "mst_Bear"},
			FigureDirectionSet	{Tag = "mst_Spider", Direction = 86},
			FigureDirectionSet	{Tag = "mst_Wolf", Direction = 345},
			FigureDirectionSet	{Tag = "mst_Raptor", Direction = 97},
			
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s1", Level = El.E11.L3 , UnitId = El.E11.ID, TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s2", Level = El.E12.L3 , UnitId = El.E12.ID, TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s3", Level = El.E13.L3 , UnitId = El.E13.ID, TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			FigureRoamingEnable	{Tag = "mst_Hornet_s1"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s2"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s3"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s1", Level = El.E21.L3 , UnitId = El.E21.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s2", Level = El.E22.L3 , UnitId = El.E22.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s3", Level = El.E23.L3 , UnitId = El.E23.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			MapFlagSetFalse {Name = "mf_P702_Elen_Init"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Elen - monster set - diff4",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Elen_Init"},
			--QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "mst_Hornet", Level = El.E10.L4 , UnitId = El.E10.ID , X = 209, Y = 57, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Spider", Level = El.E20.L4 , UnitId = El.E20.ID , X = 160, Y = 55, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Jaguar", Level = El.E30.L4 , UnitId = El.E30.ID , X = 128, Y = 90, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Wolf", Level = El.E40.L4 , UnitId = El.E40.ID , X = 183, Y = 124, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Bear", Level = El.E50.L4 , UnitId = El.E50.ID , X = 172, Y = 172, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mst_Raptor", Level = El.E60.L4 , UnitId = El.E60.ID , X = 108, Y = 189, Team = "tm_Creep"},
			FigureRoamingEnable	{Tag = "mst_Hornet"},
			FigureRoamingEnable	{Tag = "mst_Jaguar"},
			FigureRoamingEnable	{Tag = "mst_Bear"},
			FigureDirectionSet	{Tag = "mst_Spider", Direction = 86},
			FigureDirectionSet	{Tag = "mst_Wolf", Direction = 345},
			FigureDirectionSet	{Tag = "mst_Raptor", Direction = 97},
			
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s1", Level = El.E11.L4 , UnitId = El.E11.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s2", Level = El.E12.L4 , UnitId = El.E12.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s3", Level = El.E13.L4 , UnitId = El.E13.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s4", Level = El.E14.L4 , UnitId = El.E14.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Hornet_s5", Level = El.E15.L4 , UnitId = El.E15.ID , TargetTag = "mst_Hornet", Team = "tm_Creep"},},
			FigureRoamingEnable	{Tag = "mst_Hornet_s1"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s2"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s3"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s4"},
			FigureRoamingEnable	{Tag = "mst_Hornet_s5"},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s1", Level = El.E21.L4 , UnitId = El.E21.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s2", Level = El.E22.L4 , UnitId = El.E22.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s3", Level = El.E23.L4 , UnitId = El.E23.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s4", Level = El.E24.L4 , UnitId = El.E24.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			NoSpawnEffect {Spawn = FigureNpcSpawnToEntity	{Tag = "mst_Spider_s5", Level = El.E25.L4 , UnitId = El.E25.ID , TargetTag = "mst_Spider", Team = "tm_Creep"},},
			MapFlagSetFalse {Name = "mf_P702_Elen_Init"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
			-- Monsters level set - dificulty! End
	------------------------------------------------------
			-- Monsters path set
	------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elen_Jaguar_Path1",
		Name = "Elen_Jaguar_Path1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsInRange	{Tag = "mst_Jaguar", Range = 1, X = 128, Y = 90 },
			SetUpdateInterval	{Steps = 30},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRun	{Tag = "mst_Jaguar", X = 92, Y = 80 },
				Points = {"97, 57", "141, 60", }, 
				--Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			EventReEnable	{Name = "Elen_Jaguar_Path2"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Elen_Jaguar_Path2",
		Name = "Elen_Jaguar_Path2",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsInRange	{Tag = "mst_Jaguar", Range = 1, X = 141, Y = 60 },
			SetUpdateInterval	{Steps = 30},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRun	{Tag = "mst_Jaguar", X = 77, Y = 53 },
				Points = {"78, 77", "128, 90", }, 
				--Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			EventReEnable	{Name = "Elen_Jaguar_Path1"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elen_Bear_Path1",
		Name = "Elen_Bear_Path1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsInRange	{Tag = "mst_Bear", Range = 1, X = 172, Y = 172 },
			SetUpdateInterval	{Steps = 30},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalk	{Tag = "mst_Bear", X = 213, Y = 171 },
				Points = {"233, 154", "235, 136", }, 
				--Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			EventReEnable	{Name = "Elen_Bear_Path2"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Elen_Bear_Path2",
		Name = "Elen_Bear_Path2",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsInRange	{Tag = "mst_Bear", Range = 1, X = 235, Y = 136 },
			SetUpdateInterval	{Steps = 30},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalk	{Tag = "mst_Bear", X = 204, Y = 133 },
				Points = {"215, 150", "172, 172", }, 
				--Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			EventReEnable	{Name = "Elen_Bear_Path1"},
		},
		GotoState = self,
	};
	
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Elen_Raptor_Path1",
		Name = "Elen_Raptor_Path1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsInRange	{Tag = "mst_Raptor", Range = 1, X = 108, Y = 189 },
			SetUpdateInterval	{Steps = 30},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalk	{Tag = "mst_Raptor", X = 91, Y = 176 },
				Points = {"105, 153", "120, 154",}, 
				--Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			EventReEnable	{Name = "Elen_Raptor_Path2"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Elen_Raptor_Path2",
		Name = "Elen_Raptor_Path2",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsInRange	{Tag = "mst_Raptor", Range = 1, X = 120, Y = 154 },
			SetUpdateInterval	{Steps = 30},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalk	{Tag = "mst_Raptor", X = 138, Y = 161 },
				Points = {"146, 176", "108, 189", }, 
				--Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			EventReEnable	{Name = "Elen_Raptor_Path1"},
		},
		GotoState = self,
	};
	
	
	
	------------------------------------------------------
			-- Monsters path set End
	------------------------------------------------------
			-- Cutscene And Oucry
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_01-before",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_GuardianStone02Known"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "qg_GuardianStone02", Range = 25},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_Elen_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_01",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_Elen_01", Seconds = 5},
			MapFlagIsFalse{Name = "mf_P702_GuardianStone02Known"},
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "qg_GuardianStone02", Range = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_Elen_01"},
			FigureOutcry	{TextTag = "ElenCry01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "ElenCry02", Tag = "pl_HumanHeroCaine"},
			
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_Hornet",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Hornet"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ElenCry03", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_Spider",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Spider"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ElenCry04", Tag = "pl_HumanHeroCaine"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_Jaguar",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Jaguar"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ElenCry05", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_Raptor",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ELEN"},
			--FigureIsDead	{Tag = "mst_Hornet"},
			--FigureIsDead	{Tag = "mst_Spider"},
			--FigureIsDead	{Tag = "mst_Jaguar"},
			--FigureIsDead	{Tag = "mst_Wolf"},
			--FigureIsDead	{Tag = "mst_Bear"},
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "mst_Raptor"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ElenCry06", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "ElenCry07", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "ElenCry08", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "ElenCry09", Tag = "pl_HumanAvatar"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Elen_Outcry_QuestEnd",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ELEN"},
			--QuestIsSolved	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Hornet"},
			FigureIsDead	{Tag = "mst_Spider"},
			FigureIsDead	{Tag = "mst_Jaguar"},
			FigureIsDead	{Tag = "mst_Wolf"},
			FigureIsDead	{Tag = "mst_Bear"},
			FigureIsDead	{Tag = "mst_Raptor"},
			--QuestIsSolved	{Player = "default", Quest = "SS_ELEN"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "ElenCry10", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			MapTimerStart	{Name = "ElenQuestEndTimer"},
		},
		GotoState = self,
	};
	
	
	------------------------------------------------------
	-- Main Quest End --
	------------------------------------------------------
	-- Side Quest: Wolf Burial: CatHunt --
	------------------------------------------------------
	
	
	
	OnOneTimeEvent
	{
		EventName = "Elen SQ1: Cutscene Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Elen_SQ02_BurialActive"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "qg_GuardianStone02", Range = 5},
		},
		Actions = 
		{
			FigureStop	{Tag = "pl_HumanAvatar"},
			MapFlagSetTrue {Name = "mf_P702_CS02_Elen_Start"},
		},
		GotoState = self,
	};
		
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 01 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_01"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 135},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 02 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_02"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 135},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 03 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_03"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 135},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 04 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_04"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 135},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 05 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_05"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 135},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 06 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_06"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 135},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 07 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_07"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_02"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1163},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Szellemmacska 08 halott",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_08"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_ghostcat_02"},
			PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1163},
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- Side Quest: Wolf Burial: CatHunt End --
	------------------------------------------------------
	-- Side Quest: Wolf Burial: The Burial --
	------------------------------------------------------
	
	
		
		OnOneTimeEvent
	{
		EventName = "Elen - Before Burial",
		Conditions = 
		{
			QuestIsSolved {Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "npc_WolfSpirit", TargetTag = "mrk_WolfGrave"},
			FigureDirectionSet	{Tag = "npc_WolfSpirit", Direction = 90},
			DialogSetEnabled	{Tag = "npc_WolfSpirit"},
			
			-- map marker beállítása ha kell!!
		},
		GotoState = self,
	};


		
		
	OnOneTimeEvent
	{
		EventName = "Elen_SQ2_Burial_Done",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Elen_SQ02_BurialDone"}, --WolSpirit dialog!!!
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 610, TargetTag = "mrk_WolfGrave", Direction = 270, Tag = "Wolf_Grave"},
			DialogSetDisabled	{Tag = "npc_WolfSpirit"},
			FigureVanish	{Tag = "npc_WolfSpirit"},
			MapFlagSetTrue {Name = "mf_P702_Elen_SQ01_HonourDone"},
			
			-- Esetleg: Dialogban kesobb csak koszonetet mond.
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Side Quest: Wolf Burial: The Burial End --
	------------------------------------------------------
	
	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_Caine",
		Name = "Teleport_Elen_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_HeroFirst",
		Name = "Teleport_Elen_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_HeroSecond",
		Name = "Teleport_Elen_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_HeroThird",
		Name = "Teleport_Elen_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_HeroOrc",
		Name = "Teleport_Elen_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_CompanionCraigHuman",
		Name = "Teleport_Elen_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Elen_CompanionSariel",
		Name = "Teleport_Elen_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_el01", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_el02", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_el03", Range = 60},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_el04", Range = 60},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Elen_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
}