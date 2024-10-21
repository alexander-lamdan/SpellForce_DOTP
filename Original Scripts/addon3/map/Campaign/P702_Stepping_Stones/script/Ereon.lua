------------------------------------------------------
---- 06: Ereon, god of the knowledge ----
------------------------------------------------------

State
{
	StateName = "INIT",
	
	OnOneTimeRepeatEvent
	{
		EventName = "Ereon_Reset_Outcry",
		Name = "Ereon_Reset_Outcry",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_EreonResetOutcry"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "EreonCry01", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse{Name = "mf_P702_EreonResetOutcry"},
			--EventReEnable	{Name = "Ereon_Reset_Outcry"},
		},
		GotoState = self,
	};


	
	
	OnOneTimeEvent
	{
		EventName = "Ereon - Hirin SQ: Timer start + quest misc take",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_P702_HirinSQDone"},
				MapFlagIsTrue	{Name = "mf_P702_HirinSQFailed"},
			},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 625, Amount = 1},
			MapTimerStart	{Name = "HirinSQEndTimer"},
		},
		GotoState = self,
	};


	
	OnOneTimeEvent
	{
		EventName = "Hirin SQ: Good choice",
		Conditions = 
		{
			-- MapTimerIsElapsed	{Name = "HirinSQEndTimer", Seconds = 5},
			MapFlagIsTrue	{Name = "mf_P702_HirinSQDone"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "EreonCry01", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Hirin SQ: Bad choice",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "HirinSQEndTimer", Seconds = 5},
			MapFlagIsTrue	{Name = "mf_P702_HirinSQFailed"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "EreonCry02", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Ereon Dialog Disabler",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SS_EREON"},
			OR
			{
				QuestIsSolved	{Player = "default", Quest = "SS_HIRIN_SQ1"},
				QuestIsUnsolvable	{Player = "default", Quest = "SS_HIRIN_SQ1"},
			},
			SetUpdateInterval	{Steps = 50},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "npc_Falkmar"},
			DialogSetDisabled	{Tag = "npc_Dr_Mauser"},
			DialogSetDisabled	{Tag = "npc_Einar"},
			DialogSetDisabled	{Tag = "npc_Agathos"},
			DialogSetDisabled	{Tag = "npc_Urgi"},
		},
		GotoState = self,
	};


	
	
	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_Caine",
		Name = "Teleport_Ereon_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_HeroFirst",
		Name = "Teleport_Ereon_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_HeroSecond",
		Name = "Teleport_Ereon_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_HeroThird",
		Name = "Teleport_Ereon_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_HeroOrc",
		Name = "Teleport_Ereon_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_CompanionCraigHuman",
		Name = "Teleport_Ereon_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Ereon_CompanionSariel",
		Name = "Teleport_Ereon_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 47},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "prt_06_in", Range = 47},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Ereon_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
	
}