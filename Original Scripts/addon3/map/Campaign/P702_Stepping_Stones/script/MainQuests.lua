--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")


State
{
	StateName = "QuestBook",

-- Tesztelehez, torolheto!


-- Tesztresz vege!




------------------------------------------------------
---- 01: Hirin, god of the messengers and death ----
------------------------------------------------------
	
	-- Feladat elfogadasa
	
	OnOneTimeEvent
	{
		EventName = "Hirin_Accepted",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_HirinAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			-- MapFlagIsTrue	{Name = "mf_P702_HirinReset"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "HirinEntrance"},
			MapFlagSetFalse	{Name = "mf_P702_HirinDone"},
			FigureOutcry	{TextTag = "TrialsCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "TrialsCry02", Tag = "pl_HumanAvatar"},
			
			--MapFlagSetTrue {Name = "mf_P702_HirinReset"},
		},
		-- GotoState = "SS_01_Hirin",
	};

-- Quest elvegzese - alapbol kifagy, a vegso elfogadas kesleltetve vagy a bejarathoz visszamenve kell!

OnOneTimeEvent
	{
		EventName = "Hirin done - phase 1",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Hirin01Delivered"},	
			MapFlagIsTrue	{Name = "mf_P702_Hirin02Delivered"},	
			MapFlagIsTrue	{Name = "mf_P702_Hirin03Delivered"},
			MapFlagIsTrue	{Name = "mf_P702_Hirin02Dead"},
			--MapFlagIsTrue	{Name = "mf_P702_Hirin03Dead"},
			--FigureIsDead	{Tag = "npc_Hirin02"},
			--FigureIsDead	{Tag = "npc_Hirin03"},
		},
		Actions = 
		{
			--DialogSetDisabled	{Tag = "qg_GuardianStone01"},
			DialogSetDisabled	{Tag = "npc_Hirin01"},
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "HirinCry09", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			
			--AvatarXPGive	{Player = "default", Amount = 600},
			
			MapFlagSetTrue	{Name = "mf_P702_HirinSQActive"},
			MapTimerStart	{Name = "HirinDoneTimer"},
		},
	};


OnOneTimeEvent
	{
		EventName = "Hirin done - phase 2",
		Conditions = 
		{
			-- MapFlagIsTrue	{Name = "mf_P702_HirinDone"},
			-- FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Hirin_Bejarat", Range = 10 },
			MapTimerIsElapsed	{Name = "HirinDoneTimer", Seconds = 10},
		},
		Actions = 
		{			
			MapTimerStop	{Name = "HirinDoneTimer"},
			PortalEnable	{Tag = "prt_01_out"},
			PortalEnable	{Tag = "prt_02_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone02"},
			FigureOutcry	{TextTag = "HirinCry10", Tag = "pl_HumanHeroCaine"},
			MapFlagSetTrue	{Name = "mf_P702_HirinDone"},
			QuestSetSolved  {Player = "default", Quest = "SS_HIRIN"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		--GotoState = "QuestBook",
	};


------------------------------------------------------
---- 02: Elen, god of the hunt ----
------------------------------------------------------

OnOneTimeEvent
	{
		EventName = "Elen Main Quest Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ElenAccepted"},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 23},
		},
		Actions = 
		{
			--Monster spawn?
			ObjectSpawn	{ObjectId = 1433, X = 209, Y = 57, Direction = 0, Tag = "Treasure_Hornet"},
			ObjectLootItemEquipmentAdd	{Tag = "Treasure_Hornet", DropChance = 100, ItemId = 374},

			PlayerTravelDisable	{},
			QuestSetActive	{Player = "default", Quest = "SS_ELEN"},

			DialogSetDisabled	{Tag = "qg_GuardianStone02"},
			MapFlagSetTrue {Name = "mf_P702_Elen_Init"},
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "ElenComplette",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Hornet"},
			FigureIsDead	{Tag = "mst_Spider"},
			FigureIsDead	{Tag = "mst_Jaguar"},
			FigureIsDead	{Tag = "mst_Wolf"},
			FigureIsDead	{Tag = "mst_Bear"},
			FigureIsDead	{Tag = "mst_Raptor"},
			SetUpdateInterval	{Steps = 20},
			MapTimerIsElapsed	{Name = "ElenQuestEndTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "ElenQuestEndTimer"},
			
			-- DialogSetDisabled	{Tag = "qg_GuardianStone02"},
			--AvatarXPGive	{Player = "default", Amount = 300},
			PortalEnable	{Tag = "prt_02_out"},
			PortalEnable	{Tag = "prt_03_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone03"},
			MapFlagSetTrue	{Name = "mf_P702_ElenDone"},
			QuestSetSolved	{Player = "default", Quest = "SS_ELEN"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		-- GotoState = self,
	};


------------------------------------------------------
---- 03: Zerbo, god of the thieves and games ----
------------------------------------------------------

	OnOneTimeEvent
	{
		EventName = "Quest elfogadasa",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ZerboAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			
			FigureNpcSpawnToEntity	{Tag = "npc_Jorgos", Level = 1, UnitId = 1956 , TargetTag = "mrk_Jorgos", Team = "tm_Neutral"},
			--FigureNpcSpawnToEntity	{Tag = "npc_FlickedBoss", Level = 5, UnitId = 1958 , TargetTag = "mrk_FlickedBoss", Team = "tm_Neutral"},
			FigureHoldPosition	{Tag = "npc_Jorgos"},
			ObjectSpawnToEntity	{ObjectId = 2213, TargetTag = "mrk_barrel", Direction = 0, Tag = "obj_barrel"},
			--FigureNpcSpawnToEntity	{Tag = "npc_BarrelBlower", Level = 5, UnitId = 1957 , TargetTag = "mrk_BarrelBlower", Team = "tm_Neutral"},
			FigureRespawnToEntity	{Tag = "npc_BarrelBlower", TargetTag = "mrk_BarrelBlower"},
			FigureRespawnToEntity	{Tag = "npc_MarriedMan", TargetTag = "mrk_MarriedMan"},
			FigureRespawnToEntity	{Tag = "npc_FruitVendor", TargetTag = "mrk_FruitVendor"},
			FigureTeamTransfer	{Tag = "npc_MarriedMan", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "npc_BarrelBlower", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "npc_FruitVendor", Team = "tm_Neutral"},
			--FigureTeamTransfer	{Tag = "npc_FlickedBoss", Team = "tm_Neutral"},
			
			DialogSetEnabled	{Tag = "npc_FruitVendor"},
			DialogSetEnabled	{Tag = "npc_BarrelBlower"},
			DialogSetEnabled	{Tag = "npc_MarriedMan"},
			DialogSetDisabled	{Tag = "qg_GuardianStone03"},
			--DialogSetEnabled	{Tag = "npc_FlickedBoss"},
			--DialogSetEnabled	{Tag = "obj_barrel"},
			PlayerTravelDisable	{},
			MapTimerStop	{Name = "ZerboOutcryTimer"},
			QuestSetActive	{Player = "default", Quest = "SS_ZERBO_10"},
			--FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona10_Out", Range = 40, Height = 30},
			--FogOfWarReveal	{FogOfWarId = default, X = 575, Y = 358, Range = 150, Height = 50},
		},
	};


	
-- Megoldas, fail.

OnOneTimeEvent
	{
		EventName = "Mission ZERBO failed",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			--FigureHasNotHealth	{Tag = "pl_HumanAvatar", Percent = 100},
			MapTimerIsElapsed	{Name = "ZerboFailTimer", Seconds = 5},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			--QuestSetUnsolvable	{Player = "default", Quest = "SS_ZERBO_10"},
			MapTimerStop	{Name = "ZerboFailTimer"},
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
		GotoState = self,
	};


OnOneTimeEvent
	{
		EventName = "ZERBO Quest End",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			MapFlagIsFalse	{Name = "mf_P702_Zerbo_GuardsInCombat"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureTeamTransfer {Tag = "rts_ZerboOr01", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr02", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr03", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr04", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr05", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr06", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr07", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr08", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr09", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr10", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr11", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr12", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr13", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr14", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr15", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr16", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "rts_ZerboOr17", Team = "tm_Neutral"},
			
			FigureVanish	{Tag = "rts_ZerboOr07"},
			FigureVanish	{Tag = "rts_ZerboOr12"},
			FigureVanish	{Tag = "rts_ZerboOr13"},
			FigureVanish	{Tag = "rts_ZerboOr14"},
			FigureVanish	{Tag = "rts_ZerboOr15"},

			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "ZerboCry10", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			MapFlagSetTrue	{Name = "mf_P702_ZerboDone"},
			MapTimerStart	{Name = "ZerboQuestEndTimer"},	

		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zerbo Quest Done",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZerboQuestEndTimer", Seconds = 10},
		},
		Actions = 
		{
			PortalEnable	{Tag = "prt_03_out"},
			PortalEnable	{Tag = "prt_04_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone04"},
			QuestSetSolved	{Player = "default", Quest = "SS_ZERBO_10"},
			--AvatarXPGive	{Player = "default", Amount = 1000 },
			MapTimerStop	{Name = "ZerboQuestEndTimer"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		GotoState = self,
	};




------------------------------------------------------
---- 04: Nor, god of the Moon ----
------------------------------------------------------

-- Kuldetes inditasa

	OnOneTimeEvent
	{
		EventName = "Nor Quest Activator",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			PortalDisable	{Tag = "prt_04_in"},
			--PortalDisable	{Tag = "prt_04_out"},
			PlayerTravelDisable	{},
			MapTimerStop	{Name = "NorOutcryTimer"},
			MapFlagSetTrue{Name = "mf_P702_NorStartMinOnce"},
			MapTimerStart	{Name = "NorQuestStartTimer"},
			
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "NorStart",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			MapTimerIsElapsed	{Name = "NorQuestStartTimer", Seconds = 2},
		},
		Actions = 
		{
			MapTimerStop	{Name = "NorQuestStartTimer"},
			QuestSetActive	{Player = "default", Quest = "SS_NOR"},
			DialogSetDisabled	{Tag = "qg_GuardianStone04"},
			DaytimeChange {Minutes = 1080},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "NorFailed",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_NOR"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "NorCry09", Tag = "Trialmaster"},
			MapFlagSetTrue	{Name = "mf_P702_NorTimerStopper"},
			
			PortalEnable	{Tag = "prt_04_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone04"},
			QuestSetUnsolvable	{Player = "default", Quest = "SS_NOR"},
			MapTimerStart	{Name = "NorFailedTimer"},
			
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "NorGameOver",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "NorFailedTimer", Seconds = 8},
		},
		Actions = 
		{
			MapTimerStop	{Name = "NorFailedTimer"},
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
		GotoState = self,
	};



OnOneTimeEvent
	{
		EventName = "NorComplette",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorEndOutcry"},
			MapTimerIsElapsed	{Name = "NorEndTimer", Seconds = 10},
			--PlayerHasFigureAmount	{Player = "pl_Undead", Amount = 0},
			--MapFlagIsTrue{Name = "mf_P702_NorU-00_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-01_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-02_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-03_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-04_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-05_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-06_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-66_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorU-99_kill"},
			--MapFlagIsTrue{Name = "mf_P702_NorBoss_kill"},
		},
		Actions = 
		{
			--FigureOutcry	{TextTag = "NorCry02", Tag = "pl_HumanAvatar"},
			MapFlagSetTrue	{Name = "mf_P702_NorTimerStopper"},
			
			PlayerTravelEnable	{},
			PortalEnable	{Tag = "prt_04_in"},
			PortalEnable	{Tag = "prt_04_out"},
			PortalEnable	{Tag = "prt_05_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone05"},
			--AvatarXPGive	{Player = "default", Amount = 1000 },
			MapFlagSetTrue	{Name = "mf_P702_NorDone"},
			QuestSetSolved	{Player = "default", Quest = "SS_NOR"},
			MapTimerStart	{Name = "AutosaveTimer"},
			
		},
		-- GotoState = self,
	};


----------------------------------------------------------
---- 05: Niethalf, god of the forging and the dwarves ----
----------------------------------------------------------


-- Niethalf Quest Start!

OnOneTimeEvent
	{
		EventName = "Niethalf Quest Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NiethalfAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "qg_GuardianStone05"},
			PlayerTravelDisable	{},
			QuestSetActive	{Player = "default", Quest = "SS_NIETHALF"},
		},
	};

OnOneTimeEvent
	{
		EventName = "Niethalf failed",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_NIETHALF"},
			FigureIsDead	{Tag = "al_nf_01"},
			FigureIsDead	{Tag = "al_nf_02"},
			FigureIsDead	{Tag = "al_nf_03"},
			FigureIsDead	{Tag = "al_nf_04"},
			FigureIsDead	{Tag = "al_nf_05"},
			FigureIsDead	{Tag = "al_nf_06"},
			FigureIsDead	{Tag = "al_nf_07"},
			FigureIsDead	{Tag = "al_nf_08"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
		GotoState = self,
	};




	OnOneTimeEvent
	{
		EventName = "Niethalf Quest Complette",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_NIETHALF"},
			MapTimerIsElapsed	{Name = "NiethalfQuestEndTimer", Seconds = 10},
		},
		Actions = 
		{
			PortalEnable	{Tag = "prt_05_out"},
			PortalEnable	{Tag = "prt_06_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone06"},
			QuestSetSolved	{Player = "default", Quest = "SS_NIETHALF"},
			MapTimerStart	{Name = "AutosaveTimer"},
			PlayerTravelEnable	{},
		},
		GotoState = self,
	};



------------------------------------------------------
---- 06: Ereon, god of the knowledge ----
------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Ereon Quest Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_EreonAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			--PortalDisable	{Tag = "prt_06_in"},
			DialogSetEnabled	{Tag = "npc_Falkmar"},
			DialogSetEnabled	{Tag = "npc_Dr_Mauser"},
			DialogSetEnabled	{Tag = "npc_Einar"},
			DialogSetEnabled	{Tag = "npc_Agathos"},
			DialogSetEnabled	{Tag = "npc_Urgi"},
			QuestSetActive	{Player = "default", Quest = "SS_EREON"},
			PlayerTravelDisable	{},
		},
		GotoState = self,
	};

	
	OnOneTimeEvent
	{
		EventName = "Ereon Quest Done",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_EreonDone"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "qg_GuardianStone06"},
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "EreonCry03", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			MapTimerStart	{Name = "EreonDoneTimer"},		
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Ereon Quest End",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_EREON"},
			MapTimerIsElapsed	{Name = "EreonDoneTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "EreonDoneTimer"},
			PortalEnable	{Tag = "prt_06_out"},
			PortalEnable	{Tag = "prt_07_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone07"},
			QuestSetSolved	{Player = "default", Quest = "SS_EREON"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		GotoState = self,
	};

------------------------------------------------------
---- 07: Shanna, god of healing ----
------------------------------------------------------


	OnOneTimeEvent
	{
		EventName = "Shanna Quest Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			--PortalDisable	{Tag = "prt_07_in"},
			DialogSetDisabled	{Tag = "qg_GuardianStone07"},
			QuestSetActive	{Player = "default", Quest = "SS_SHANNA"},
			PlayerTravelDisable	{},
		},
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Shanna Tree Dead",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_SHANNA"},
			FigureIsDead	{Tag = "npc_ElvenTree"},
		},
		Actions = 
		{
			VisualTimerStop	{},
			MapTimerStop	{Name = "ShannaTimerD-01"},
			MapTimerStop	{Name = "ShannaTimerD-02"},
			MapTimerStop	{Name = "ShannaTimerD-03"},
			MapTimerStop	{Name = "ShannaTimerD-04"},
			MapTimerStop	{Name = "ShannaTimerD-05"},
			MapTimerStop	{Name = "ShannaTimerD-06"},
			MapTimerStop	{Name = "ShannaTimerD-07"},
			MapTimerStop	{Name = "ShannaTimerD-08"},
			MapTimerStop	{Name = "ShannaTimerD-09"},
			MapTimerStop	{Name = "ShannaElixirhordozo"},
			MapTimerStop	{Name = "ShannaQuest"},
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna Quest Done",
		Conditions = 
		{
			--QuestIsActive {Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue	{Name = "mf_P702_ShannaDone"},
			-- egyeb feltetelek!
		},
		Actions = 
		{
			FigureLootItemMiscRemove	{Tag = "rts_elixirhordozo_dead", ItemId = 638},
			PlayerBuildingTeamTransfer	{Player = "pl_Human", Team = "tm_Neutral"},
			
			PlayerResourceLenyaTake	{Player = "pl_Human", Amount = 50000},
			PlayerResourceSilverTake	{Player = "pl_Human", Amount = 50000},
			PlayerResourceStoneTake	{Player = "pl_Human", Amount = 50000},
			
			FigureOutcry	{TextTag = "ShannaCry01", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "ShannaCry02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			MapTimerStart	{Name = "ShannaDoneTimer"},
			
			--PortalEnable	{Tag = "prt_07_in"},
			
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Shanna Quest End",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_SHANNA"},
			MapTimerIsElapsed	{Name = "ShannaDoneTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "ShannaDoneTimer"},
			PortalEnable	{Tag = "prt_07_out"},
			PortalEnable	{Tag = "prt_08_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone08"},
			QuestSetSolved	{Player = "default", Quest = "SS_SHANNA"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		GotoState = self,
	};




------------------------------------------------------
---- 08: Kerona, goddess of the time ----
------------------------------------------------------	


	OnOneTimeEvent
	{
		EventName = "Kerona Quest Active",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "qg_GuardianStone08"},
			QuestSetActive	{Player = "default", Quest = "SS_KERONA"},
			--PortalDisable	{Tag = "prt_08_in"},
			PlayerTravelDisable	{},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Kerona Quest Complette",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_KERONA"},
			MapFlagIsTrue{Name = "mf_P702_Kerona1_Done"},
			MapFlagIsTrue{Name = "mf_P702_Kerona2_Done"},
			MapFlagIsTrue{Name = "mf_P702_Kerona3_Done"},
			MapFlagIsTrue{Name = "mf_P702_Kerona4_Done"},
			MapFlagIsTrue{Name = "mf_P702_Kerona5_Done"},
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona56_Out", Range = 5 },
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_09_in", Range = 10},
			SetUpdateInterval	{Steps = 30},
			-- egyeb feltetelek - ha kellenek
		},
		Actions = 
		{
			PortalEnable	{Tag = "prt_08_out"},
			PortalEnable	{Tag = "prt_09_in"},
			--DialogSetEnabled	{Tag = "qg_GuardianStone09"},
			-- Quest end: after arrival to Zarach, and after the outcrys
		},
		-- GotoState = self,
	};
	
	--MapFlagSetTrue {Name = "mf_P702_CS01_Start"},


------------------------------------------------------------------
---- 09: Zarach, god of creation, renewal, growth and conquer ----
------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Zarach Quest Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ZarachAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			--PortalDisable	{Tag = "prt_09_in"},
			DialogSetDisabled	{Tag = "qg_GuardianStone09"},
			PlayerKitTransfer	{ Player = "pl_Human", PlayerKit = "pk_zigg"},
			PlayerKitTransfer	{ Player = "pl_Collect", PlayerKit = "pk_collect"},
			BuildingAbilityRemove	{Tag = "zigg_hq_ally", AbilityId = 442 },
			MapTimerStart	{Name = "Zarach_Delay_Timer"},
			QuestSetActive	{Player = "default", Quest = "SS_ZARACH"},
			PlayerTravelDisable	{},
			
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "Zarach Quest Failed",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZarachFailedTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "ZarachFailedTimer"},
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
		GotoState = self,
	};


	
	OnOneTimeEvent
	{
		EventName = "Zarach Quest Done",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZarachEndTimer", Seconds = 15 },
			MapFlagIsTrue	{Name = "mf_P702_ZarachDone"},
			--MapFlagIsTrue{Name = "mf_P702_Ziggurat-4"},
			--PlayerHasNotFigureAmount	{Player = "pl_Elem", Amount = 1 },
		},
		Actions = 
		{
			
			
			--PortalEnable	{Tag = "prt_09_in"},
			--MapFlagSetTrue	{Name = "mf_P702_ZarachDone"},
			PortalEnable	{Tag = "prt_09_out"},
			PortalEnable	{Tag = "prt_10_in"},
			DialogSetEnabled	{Tag = "qg_GuardianStone10"},
			QuestSetSolved	{Player = "default", Quest = "SS_ZARACH"},
			PlayerTravelEnable	{},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		GotoState = self,
	};


------------------------------------------------------
---- 10: Tiara, god of the Sun ----
------------------------------------------------------

OnOneTimeEvent
	{
		EventName = "Tiara Quest Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_TiaraAccepted"},
			SetUpdateInterval	{Steps = 10},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "qg_GuardianStone10"},
			DialogSetEnabled	{Tag = "obj_Sword"},
			DialogSetEnabled	{Tag = "obj_Shield"},
			DialogSetEnabled	{Tag = "obj_Cup"},
			DialogSetEnabled	{Tag = "obj_Crystal"},
			DialogSetEnabled	{Tag = "obj_Chest"},
			DialogSetEnabled	{Tag = "obj_Torch"},
			DialogSetEnabled	{Tag = "obj_Cauldron"},
			DialogSetEnabled	{Tag = "obj_Statue"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "mrk_Tiara_centrum", Range = 35, Height = 35},
			QuestSetActive	{Player = "default", Quest = "SS_TIARA"},
			
			EntityValueAdd	{Name = "ev_TiaraReset", Value = 0}, 					-- 5. alkalommal, + utana minden 3.
			EntityValueAdd	{Name = "ev_TiaraNoFirst", Value = 0},				-- Nem az elso - 3x
			EntityValueAdd	{Name = "ev_TiaraWrongDirection", Value = 0},	-- Rossz irany - 3x
			EntityValueAdd	{Name = "ev_TiaraResetOutcry", Value = 0},		-- Easy-nel masodik alkalommal - Caine outcry
			EntityValueAdd	{Name = "ev_TiaraActivated", Value = 0},			-- Hany van aktivalva (outcry-hoz)
			EntityValueAdd	{Name = "ev_TiaraCauldron", Value = 0},				-- Easy-nel 3. alkalommal koran van a cauldron (Caine)
			
			PlayerTravelDisable	{},
			--FigureOutcry	{TextTag = "TiaraCry01", Tag = "pl_HumanHeroCaine"},
			MapFlagSetTrue{Name = "mf_P702_TiaraResetFirst"},
			MapFlagSetTrue	{Name = "mf_P702_TiaraReset"},
			--EntityValueSet	{Name = "ev_TiaraReset", Value = 0},
		},
	};

	OnOneTimeEvent
	{
		EventName = "Tiara Quest Done",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_TIARA"},
			--MapFlagIsTrue{Name = "mf_P702_TiaraDone"},
			--MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCauldronActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCupActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCrystalActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraChestActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraStatueActivated"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			-- egyeb feltetelek - ha kellenek
		},
		Actions = 
		{
			ObjectVanish	{Tag = "tiara_blocker-01"},
			ObjectVanish	{Tag = "tiara_blocker-02"},
			ObjectVanish	{Tag = "tiara_blocker-03"},
			ObjectVanish	{Tag = "tiara_blocker-04"},
			ObjectVanish	{Tag = "tiara_blocker-05"},
			ObjectVanish	{Tag = "tiara_blocker-06"},
			ObjectVanish	{Tag = "tiara_blocker-07"},
			ObjectVanish	{Tag = "tiara_blocker-08"},
			ObjectVanish	{Tag = "tiara_blocker-09"},
			ObjectVanish	{Tag = "tiara_blocker-10"},
			ObjectVanish	{Tag = "tiara_blocker-11"},
			DialogSetDisabled	{Tag = "obj_Sword"},
			DialogSetDisabled	{Tag = "obj_Shield"},
			DialogSetDisabled	{Tag = "obj_Cup"},
			DialogSetDisabled	{Tag = "obj_Crystal"},
			DialogSetDisabled	{Tag = "obj_Chest"},
			DialogSetDisabled	{Tag = "obj_Torch"},
			DialogSetDisabled	{Tag = "obj_Cauldron"},
			DialogSetDisabled	{Tag = "obj_Statue"},
			ObjectVanish	{Tag = "Tiara_fire_Z1"},
			ObjectVanish	{Tag = "Tiara_fire_Z2"},
			ObjectVanish	{Tag = "Tiara_fire_K1"},
			ObjectVanish	{Tag = "Tiara_fire_K2"},
			
			
			FigureOutcry	{TextTag = "TiaraCry05", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry04", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "TrialCry05", Tag = "Trialmaster"},
			MapTimerStart	{Name = "TiaraDoneTimer"},
			
			--PlayerMapTravelAddon3  {Map = "Campaign/P703_Realm_of_the_Gods", TargetTag = "Map_Start_Point"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Tiara Quest End",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_TIARA"},
			MapTimerIsElapsed	{Name = "TiaraDoneTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "TiaraDoneTimer"},
			QuestSetSolved	{Player = "default", Quest = "SS_TIARA"},
			QuestSetSolved	{Player = "default", Quest = "SS_MAIN"},
			PlayerTravelEnable	{},
			EventReEnable	{Name = "Map_Travel"},
			--MapFlagSetTrue	{Name = "mf_P702_SteppingStonesMainQuestDone"},
			ObjectSpawnToEntity	{ObjectId = 1432, TargetTag = "mrk_Tiara_centrum", Direction = 0, Tag = "SS_Exit_field"},
			MapTimerStart	{Name = "AutosaveTimer"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Stepping Stones Exit Point",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 2 },
			QuestIsSolved	{Player = "default", Quest = "SS_MAIN"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "MapTravelTimer"},
		},
		GotoState = self,
	};




------------------------------------------------------
----  ----
------------------------------------------------------





}