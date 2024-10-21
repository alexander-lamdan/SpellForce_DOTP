------------------------------------------------------
---- 01: Hirin, god of the messengers and death ----
------------------------------------------------------


State
{
	StateName = "INIT",


	-------------------------------------------------
	-- Quest reset - at quest start, or if the anwer is wrong: after a new talk with the GuardianStone
	-------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Hirin_Reset",
		Name = "Hirin_Reset",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_HirinReset"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			PlayerTravelDisable	{},
			FigureRespawn	{Tag = "npc_Hirin01", X = 200, Y = 596},
			FigureDirectionSet	{Tag = "npc_Hirin01", Direction = 145},
			FigureTeamTransfer	{Tag = "npc_Hirin01", Team = "tm_Neutral"},
			FigureRespawn	{Tag = "npc_Hirin02", X = 155.5, Y = 584},
			FigureDirectionSet	{Tag = "npc_Hirin02", Direction = 239},
			FigureTeamTransfer	{Tag = "npc_Hirin02", Team = "tm_Neutral"},
			FigureRespawn	{Tag = "npc_Hirin03", X = 183, Y = 560},
			FigureDirectionSet	{Tag = "npc_Hirin03", Direction = 300},
			FigureTeamTransfer	{Tag = "npc_Hirin03", Team = "tm_Neutral"},
			DialogSetEnabled	{Tag = "npc_Hirin01"},
			DialogSetEnabled	{Tag = "npc_Hirin02"},
			DialogSetEnabled	{Tag = "npc_Hirin03"},
			DialogSetDisabled	{Tag = "qg_GuardianStone01"},
			QuestSetActive	{Player = "default", Quest = "SS_HIRIN"},
			
			MapFlagSetFalse	{Name = "mf_P702_Hirin01Known"},
			MapFlagSetFalse	{Name = "mf_P702_Hirin02Known"},
			MapFlagSetFalse	{Name = "mf_P702_Hirin03Known"},

			EventReEnable	{Name = "Hirin02level-diff1"},
			EventReEnable	{Name = "Hirin02level-diff2"},
			EventReEnable	{Name = "Hirin02level-diff34"},
			EventReEnable	{Name = "Hirin02set"},
			EventReEnable	{Name = "Hirin02dead"},
			EventReEnable	{Name = "Hirin03set"},
			EventReEnable	{Name = "Hirin_Wrong_Answer"},
			EventReEnable	{Name = "HirinGuardianStoneOutcry"},
			
			EventReEnable	{Name = "Hirin01dialogset"},
			EventReEnable	{Name = "Hirin-WrongANoFirst"},			

			MapFlagSetFalse	{Name = "mf_P702_HirinReset"},
			EventReEnable	{Name = "Hirin_Reset"},
		},
	};


	-------------------------------------------------
	-- -- Hirin npc 02 level set
	-------------------------------------------------
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Hirin02level-diff1",
		Name = "Hirin02level-diff1",
		Conditions = 
		{
			--MapFlagIsTrue{Name = "mf_P702_Hirin02Tamad"},
			QuestIsActive	{Player = "default", Quest = "SS_HIRIN"},
			FigureIsAlive	{Tag = "npc_Hirin02"},
			GameDifficulty {Value = 1},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			FigureUnitChange	{Tag = "npc_Hirin02", UnitId = 1951, Level = 9},
			DialogSetEnabled	{Tag = "npc_Hirin02"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Hirin02level-diff2",
		Name = "Hirin02level-diff2",
		Conditions = 
		{
			--MapFlagIsTrue{Name = "mf_P702_Hirin02Tamad"},
			QuestIsActive	{Player = "default", Quest = "SS_HIRIN"},
			FigureIsAlive	{Tag = "npc_Hirin02"},
			GameDifficulty {Value = 2},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			FigureUnitChange	{Tag = "npc_Hirin02", UnitId = 1951, Level = 10},
			DialogSetEnabled	{Tag = "npc_Hirin02"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Hirin02level-diff34",
		Name = "Hirin02level-diff34",
		Conditions = 
		{
			--MapFlagIsTrue{Name = "mf_P702_Hirin02Tamad"},
			QuestIsActive	{Player = "default", Quest = "SS_HIRIN"},
			FigureIsAlive	{Tag = "npc_Hirin02"},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			FigureUnitChange	{Tag = "npc_Hirin02", UnitId = 1951, Level = 9},
			FigureAbilityAdd	{Tag = "npc_Hirin02", AbilityId = 63},
			DialogSetEnabled	{Tag = "npc_Hirin02"},
		},
		GotoState = self,
	};	
	
	-------------------------------------------------
	-- Good answer section
	-------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Hirin npc 1 dialogset: good answer",
		Name = "Hirin01dialogset",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Hirin01Delivered"},
			SetUpdateInterval	{Steps = 5},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "npc_Hirin01"},
		},
		GotoState = self,
	};

	-- Hirin 02 npc beallitasa jo valasz eseten

	OnOneTimeRepeatEvent
	{
		EventName = "Hirin npc 2. set: good answer",
		Name = "Hirin02set",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Hirin02Tamad"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "npc_Hirin02"},
			FigureTeamTransfer	{Tag = "npc_Hirin02", Team = "tm_Creep"},
			MapFlagSetTrue{Name = "mf_P702_Hirin02Delivered"},
			MapFlagSetFalse	{Name = "mf_P702_Hirin02Tamad"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Hirin - npc_Hirin02_dead",
		Name = "Hirin02dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_HIRIN"},
			MapFlagIsFalse	{Name = "mf_P702_Hirin02Dead"},
			FigureIsDead	{Tag = "npc_Hirin02"},
			SetUpdateInterval	{Steps = 10},
			-- MapFlagIsTrue	{Name = "mf_P702_Hirin02Delivered"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Hirin02Dead"},
		},
	};
	
		-- Hirin 03 npc beallitasa jo valasz eseten  - ellenorizni, vegiggondolni!

	OnOneTimeRepeatEvent
	{
		EventName = "Hirin npc 3. setting after the good answer",
		Name = "Hirin03set",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Hirin03Delivered"},
			SetUpdateInterval	{Steps = 5},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "npc_Hirin03"},
			FigureKill	{Tag = "npc_Hirin03"},
			--MapFlagSetTrue	{Name = "mf_P702_Hirin03Dead"}
		},
		GotoState = self,
	};
	
	
	
	-- Hibas valasz eseten lefuto folyamatok:
		-- Dialogset-ek: Hirin npc 1-2-3 letiltasa
		-- Kuldetes elfogadasanak resetelese (KERDES: Quest beallitando-e vagy sem?)
		-- Megvarni, mig visszamegy beszelni a GuardianStone-val, utana:
			-- Item elvetele (NPC 1 adta)
			-- NPC 2 megolese, ha meg el
			-- NPC 2-3 "feltamasztasa" es kezdopozicioba helyezese
			-- Dialogok engedelyezese: NPC 1-2-3
			-- Quest ujra engedelyezese (Ha kellett tiltani)
	

	-------------------------------------------------
	-- Wrong answer section
	-------------------------------------------------
			
	OnOneTimeRepeatEvent
	{
		EventName = "Hirin_Wrong_Answer",
		Name = "Hirin_Wrong_Answer",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_HIRIN"},
			MapFlagIsTrue {Name = "mf_P702_HirinWrongA"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "npc_Hirin01"},
			DialogSetDisabled	{Tag = "npc_Hirin02"},
			DialogSetDisabled	{Tag = "npc_Hirin03"},
			DialogSetEnabled	{Tag = "qg_GuardianStone01"},
			
			QuestSetInactive	{Player = "default", Quest = "SS_HIRIN"},
			MapFlagSetFalse	{Name = "mf_P702_HirinAccepted"},
			--MapFlagSetTrue	{Name = "mf_P702_HirinWrongA01"},
			--MapFlagSetTrue	{Name = "mf_P702_HirinWrongA02"},
			MapFlagSetTrue	{Name = "mf_P702_HirinWrongAOutcry"},
			
			FigureVanish	{Tag = "npc_Hirin01"},
			FigureVanish	{Tag = "npc_Hirin02"},
			FigureVanish	{Tag = "npc_Hirin03"},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 625, Amount = 1},
			MapFlagSetFalse	{Name = "mf_P702_Hirin01Delivered"},
			MapFlagSetFalse	{Name = "mf_P702_Hirin02Delivered"},
			MapFlagSetFalse	{Name = "mf_P702_Hirin03Delivered"},
			
			MapFlagSetFalse	{Name = "mf_P702_HirinWrongA"},
		},
	};
	
	-------------------------------------------------
	-- Outcry section
	-------------------------------------------------
	
	
	OnOneTimeEvent
	{
		EventName = "Hirin before start: Outcry 01",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "qg_GuardianStone01", Range = 10},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureStop	{Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "HirinCry01", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Hirin-JustVisit",
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P702_GuardianStone01Known"},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Hirin_Bejarat", Range = 10},
				SetUpdateInterval	{Steps = 10},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "HirinCry02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "HirinCry03", Tag = "pl_HumanAvatar"},
			MapTimerStart	{Name = "HirinEntrance"},
		},
	};


	OnOneTimeRepeatEvent
	{
		EventName = "Hirin-JustVisit 3min",
		Name = "HirinGuardianStoneOutcry",
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P702_GuardianStone01Known"},
			MapTimerIsElapsed	{Name = "HirinEntrance", Seconds = 180},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "HirinEntrance"},
			FigureOutcry	{TextTag = "HirinCry03", Tag = "pl_HumanAvatar"},
			MapTimerStart	{Name = "HirinEntrance"},
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "Hirin Wrong anser outcry first time",
		Conditions = 
		{
			--QuestIsActive	{Player = "default", Quest = "SS_HIRIN"},
			MapFlagIsTrue {Name = "mf_P702_HirinWrongAOutcry"},
			MapFlagIsFalse {Name = "mf_P702_HirinWrongANoFirst"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "HirinCry04", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "HirinCry05", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "HirinCry06", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "HirinCry07", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse	{Name = "mf_P702_HirinWrongAOutcry"},
			MapFlagSetTrue	{Name = "mf_P702_HirinWrongANoFirst"}
		},
		GotoState = self,
	};

OnOneTimeRepeatEvent
	{
		EventName = "Hirin-WrongANoFirst",
		Name = "Hirin-WrongANoFirst",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_HirinWrongAOutcry"},
			MapFlagIsTrue {Name = "mf_P702_HirinWrongANoFirst"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "HirinCry04", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "HirinCry08", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse	{Name = "mf_P702_HirinWrongAOutcry"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Hirin afterwork - Vanish npc_Hirin01",
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P702_HirinDone"},
				FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "npc_Hirin01", Range = 80},
				FigureIsNotInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "npc_Hirin01", Range = 80},
				FigureIsNotInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "npc_Hirin01", Range = 80},
				SetUpdateInterval	{Steps = 50},
		},
		Actions =
		{
			FigureVanish	{Tag = "npc_Hirin01"},
		},
	};

	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_Caine",
		Name = "Teleport_Hirin_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_HeroFirst",
		Name = "Teleport_Hirin_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_HeroSecond",
		Name = "Teleport_Hirin_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_HeroThird",
		Name = "Teleport_Hirin_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_HeroOrc",
		Name = "Teleport_Hirin_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_CompanionCraigHuman",
		Name = "Teleport_Hirin_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Hirin_CompanionSariel",
		Name = "Teleport_Hirin_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "ts_Hirin", Range = 15},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_hi01", Range = 80},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Hirin_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
}