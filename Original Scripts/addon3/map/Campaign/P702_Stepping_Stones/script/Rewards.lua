-- 

Reward = 
{
		SS_MAIN	= 								{ XP =  0 ,   Gold = 0 },
    SS_HIRIN	= 							{ XP =  600 , Gold = 50 },
    SS_HIRIN_SQ1	= 					{ XP =	450 , Gold = 50 },
    SS_ELEN	= 								{ XP =	0 , 	Gold = 100 },
    IOS_SIDEQ_3 = 						{ XP =	0 , 	Gold = 0 },
    IOS_SIDEQ_3_ELEN_SQ1 = 		{ XP =	500 , Gold = 0 },
    IOS_SIDEQ_3_ELEN_SQ2 = 		{ XP =	700 , Gold = 0 },
    IOS_SIDEQ_3_ELEN_SQ21 = 	{ XP =	0 , 	Gold = 0 },
    SS_ZERBO_10	=						 	{ XP =	900 , Gold = 0 },
    SS_ZERBO_11	= 						{ XP =	0 , 	Gold = 0 },
    SS_NOR	= 								{ XP =	1100 ,Gold = 0 },
    SS_NOR_10	= 							{ XP =	600 , Gold = 0 },
    SS_NOR_11	= 							{ XP =	230 , Gold = 0 },
    SS_NIETHALF	= 						{ XP =	900 , Gold = 0 },
    SS_EREON	= 							{ XP =	200 , Gold = 0 },
    SS_SHANNA	= 							{ XP =	1100 ,Gold = 0 },
    SS_KERONA	= 							{ XP =	0 , 	Gold = 0 },
    SS_ZARACH	= 							{ XP =	1200 ,Gold = 0 },
    SS_TIARA	= 							{ XP =	0 , 	Gold = 0 },
		GhostCat01	= 						{ XP =	150 , Gold = 50 },
		GhostCat02	= 						{ XP =	200 , Gold = 100 },
		Monster01	= 							{ XP =	120 , Gold = 10 },
		Monster02	= 							{ XP =	200 , Gold = 20 },
		Monster03	= 							{ XP =	360 , Gold = 50 },
		Monster04	= 							{ XP =	0 , 	Gold = 200 },
}

GoldOutcry = 
{
    [10]	= "ExtraGold10",
    [20]	= "ExtraGold20",
    [50]	= "ExtraGold50",
    [100]	= "ExtraGold100",
    [200]	= "ExtraGold200",
    [500]	= "ExtraGold500",
    [1000]	= "ExtraGold1000",

}

State
{
	StateName = "INIT",
	
	--Rewards: All XP, Gold, some loot
	
	------------------------------------------------------
	-- Rewards: Monsters, Creeps
	------------------------------------------------------
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Monster rewards 01",
		Name = "Monster_rewards_01",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Rewards_monster_01"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.Monster01.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.Monster01.Gold], Tag = noFigure},
			AvatarGoldGive {Player = "default", Amount = Reward.Monster01.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.Monster01.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.Monster01.Gold },
			--AvatarGoldGive	{Player = "default", Amount = 10},
			--AvatarXPGive	{Player = "default", Amount = 300},
			--FigureOutcry	{TextTag = "ExtraGold10", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse	{Name = "mf_P702_Rewards_monster_01"},
			EventReEnable	{Name = "Monster_rewards_01"},
		},
		GotoState = self,
	};


	OnOneTimeRepeatEvent
	{
		EventName = "Monster rewards 02",
		Name = "Monster_rewards_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Rewards_monster_02"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.Monster02.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.Monster02.Gold], Tag = noFigure},
			AvatarGoldGive {Player = "default", Amount = Reward.Monster02.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.Monster02.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.Monster02.Gold },
			--AvatarGoldGive	{Player = "default", Amount = 20},
			--AvatarXPGive	{Player = "default", Amount = 500},
			--FigureOutcry	{TextTag = "ExtraGold20", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse	{Name = "mf_P702_Rewards_monster_02"},
			EventReEnable	{Name = "Monster_rewards_02"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Monster rewards 03",
		Name = "Monster_rewards_03",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Rewards_monster_03"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.Monster03.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.Monster03.Gold], Tag = noFigure},
			AvatarGoldGive {Player = "default", Amount = Reward.Monster03.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.Monster03.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.Monster03.Gold },
			--AvatarGoldGive	{Player = "default", Amount = 50},
			--AvatarXPGive	{Player = "default", Amount = 800},
			--FigureOutcry	{TextTag = "ExtraGold50", Tag = "pl_HumanAvatar"},			
			MapFlagSetFalse	{Name = "mf_P702_Rewards_monster_03"},

			EventReEnable	{Name = "Monster_rewards_03"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Monster rewards 04",
		Name = "Monster_rewards_04",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Rewards_monster_04"},
		},
		Actions = 
		{
			--AvatarXPGive {Player = "default", Amount = Reward.Monster04.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.Monster04.Gold], Tag = noFigure},
			AvatarGoldGive {Player = "default", Amount = Reward.Monster04.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.Monster04.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.Monster04.Gold },
			--AvatarGoldGive	{Player = "default", Amount = 50},
			--AvatarXPGive	{Player = "default", Amount = 800},
			--FigureOutcry	{TextTag = "ExtraGold50", Tag = "pl_HumanAvatar"},			
			MapFlagSetFalse	{Name = "mf_P702_Rewards_monster_04"},

			EventReEnable	{Name = "Monster_rewards_04"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Hirin MQ
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Quest Reward - Hirin - 1",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_HirinDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_HIRIN.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.SS_HIRIN.Gold], Tag = noFigure },
			AvatarGoldGive {Player = "default", Amount = Reward.SS_HIRIN.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.SS_HIRIN.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SS_HIRIN.Gold },
			--AvatarXPGive	{Player = "default", Amount = 600},
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- Rewards: Hirin SQ
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Hirin_SQ1_Reward",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "HirinSQEndTimer", Seconds = 25},
			MapFlagIsTrue	{Name = "mf_P702_HirinSQDone"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "HirinSQEndTimer"},
			AvatarXPGive {Player = "default", Amount = Reward.SS_HIRIN_SQ1.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.SS_HIRIN_SQ1.Gold], Tag = noFigure },
			AvatarGoldGive {Player = "default", Amount = Reward.SS_HIRIN_SQ1.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.SS_HIRIN_SQ1.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SS_HIRIN_SQ1.Gold },
			--AvatarXPGive	{Player = "default", Amount = 400},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Elen MQ
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Hornet is dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Hornet"},
		},
		Actions = 
		{
			--FigureLootItemEquipmentAdd	{Tag = "mst_Hornet_Dead", DropChance = 100, ItemId = 374},
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Spider is dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Spider"},
		},
		Actions = 
		{
			FigureLootItemEquipmentAdd	{Tag = "mst_Spider_dead", DropChance = 100, ItemId = 312},
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Jaguar is dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Jaguar"},
		},
		Actions = 
		{
			FigureLootItemEquipmentAdd	{Tag = "mst_Jaguar_dead", DropChance = 100, ItemId = 311},
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Wolf is dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Wolf"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Bear is dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Bear"},
		},
		Actions = 
		{
			FigureLootItemGenericAdd	{Tag = "mst_Bear_dead", DropChance = 25, Level = 9, Skill = 5 },
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Raptor is dead",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ELEN"},
			FigureIsDead	{Tag = "mst_Raptor"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_02"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Elen SQ
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "IOS_SIDEQ_3_ELEN_SQ1 solved",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ1"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.IOS_SIDEQ_3_ELEN_SQ1.XP },
			--FigureOutcry {TextTag = GoldOutcry[Reward.IOS_SIDEQ_3_ELEN_SQ1.Gold], Tag = noFigure },
			--AvatarGoldGive {Player = "default", Amount = Reward.IOS_SIDEQ_3_ELEN_SQ1.Gold },
			--AvatarXPGive	{Player = "default", Amount = 500},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "IOS_SIDEQ_3",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "IOS_SIDEQ_3"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.IOS_SIDEQ_3.XP },
			--AvatarXPGive	{Player = "default", Amount = 700},		
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Ghostcat rewards 01",
		Name = "Ghostcat_rewards_01",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Rewards_ghostcat_01"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.GhostCat01.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.GhostCat01.Gold], Tag = noFigure },
			AvatarGoldGive {Player = "default", Amount = Reward.GhostCat01.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.GhostCat01.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.GhostCat01.Gold },
			--AvatarGoldGive	{Player = "default", Amount = 50},
			--AvatarXPGive	{Player = "default", Amount = 150},
			MapFlagSetFalse	{Name = "mf_P702_Rewards_ghostcat_01"},
			--FigureOutcry	{TextTag = "ExtraGold50", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Ghostcat_rewards_01"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Ghostcat rewards 02",
		Name = "Ghostcat_rewards_02",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Rewards_ghostcat_02"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.GhostCat02.XP },
			FigureOutcry {TextTag = GoldOutcry[Reward.GhostCat02.Gold], Tag = noFigure },
			AvatarGoldGive {Player = "default", Amount = Reward.GhostCat02.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = Reward.GhostCat02.Gold },
			AvatarValueAdd {Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.GhostCat02.Gold },
			--AvatarGoldGive	{Player = "default", Amount = 100},
			--AvatarXPGive	{Player = "default", Amount = 200},
			MapFlagSetFalse	{Name = "mf_P702_Rewards_ghostcat_02"},
			--FigureOutcry	{TextTag = "ExtraGold100", Tag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Ghostcat_rewards_02"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Zerbo MQ
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Zerbo MQ Reward",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_ZERBO_10.XP },
			--FigureOutcry {TextTag = GoldOutcry[Reward.SS_ZERBO_10.Gold], Tag = noFigure },
			--AvatarGoldGive {Player = "default", Amount = Reward.SS_ZERBO_10.Gold },
			--AvatarXPGive	{Player = "default", Amount = 1000 },
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Nor MQ Reward
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Nor MQ Reward",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_NorDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_NOR.XP },
			--FigureOutcry {TextTag = GoldOutcry[Reward.SS_NOR.Gold], Tag = noFigure },
			--AvatarGoldGive {Player = "default", Amount = Reward.SS_NOR.Gold },
			--AvatarXPGive	{Player = "default", Amount = 1000 },
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Nor SQ Phase 1 Reward
	------------------------------------------------------
	
	--Ha megvan minden naploreszlet
	
	
	------------------------------------------------------
	-- Rewards: Niethalf encounters
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Team 1: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_01"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		-- GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Team 2: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_02"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Team 3: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_03"},
			FigureIsDead	{Tag = "en_nf_04"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Team 4: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_05"},
			FigureIsDead	{Tag = "en_nf_06"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Team 5: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_07"},
			FigureIsDead	{Tag = "en_nf_08"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = self,
	};
	
OnOneTimeEvent
	{
		EventName = "Team 6: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_09"},
			FigureIsDead	{Tag = "en_nf_10"},
			FigureIsDead	{Tag = "en_nf_11"},
			FigureIsDead	{Tag = "en_nf_16"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 100},
		},
		GotoState = self,
	};				

	OnOneTimeEvent
	{
		EventName = "Extra Team 1: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_12"},
			FigureIsDead	{Tag = "en_nf_13"},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Extra Team 2: KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_14"},
			FigureIsDead	{Tag = "en_nf_15"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 50},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Niethalf Main Quest
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Niethalf MQ Reward",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_NiethalfDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_NIETHALF.XP },
			--AvatarXPGive	{Player = "default", Amount = 1000 },
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Shanna MQ
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Shanna MQ Reward",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_ShannaDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_SHANNA.XP },
			--AvatarXPGive	{Player = "default", Amount = 1000 },
		},
		GotoState = self,
	};
	
		
	
	------------------------------------------------------
	-- Rewards: Ereon
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Ereon MQ Reward",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_EreonDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_EREON.XP },
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: Zarach
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Zarach MQ Reward",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_ZarachDone"},
		},
		Actions = 
		{
			AvatarXPGive {Player = "default", Amount = Reward.SS_ZARACH.XP },
			--AvatarXPGive	{Player = "default", Amount = 1000 },
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Rewards: 
	------------------------------------------------------
	
	
	------------------------------------------------------
	-- Rewards: 
	------------------------------------------------------
	
	
};