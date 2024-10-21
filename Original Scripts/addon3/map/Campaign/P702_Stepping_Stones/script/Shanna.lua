------------------------------------------------------
---- 07: Shanna, god of healing ----
------------------------------------------------------

-- units:
					-- 188: Demonic Slave (worker)
					-- 189: Demonic Warrior
					-- 190: Demonic Mage
					-- 191: Demonic Artillery
					-- 192: The Chosen 
					-- 193: Grand Master
					-- 194: Demonic Titan
					-- 195: Demonic Spike
					-- 196: Demonic Offender
					


State
{
	StateName = "INIT",

	
	OnOneTimeEvent
	{
		EventName = "Shanna Quest Init",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaAccepted"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "ShannaDelayTimer"},
			MapTimerStart	{Name = "ShannaQuest"},
			
			--VisualTimerStart	{Seconds = vShanna_time },

			DialogSetEnabled	{Tag = "npc_ElvenTree"},
			PlayerKitTransfer	{ Player = "pl_Human", PlayerKit = "pk_shn"},			
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna - Resources - Diff1",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaAccepted"},
			GameDifficulty {Value = 1},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = SDT.D1.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = SDT.D1.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = SDT.D1.St },
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Shanna - Resources - Diff2",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaAccepted"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = SDT.D2.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = SDT.D2.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = SDT.D2.St },
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna - Resources - Diff3",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaAccepted"},
			GameDifficulty {Value = 3},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = SDT.D3.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = SDT.D3.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = SDT.D3.St },
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna - Resources - Diff4",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaAccepted"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = SDT.D4.Le },
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = SDT.D4.Si },
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = SDT.D4.St },
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna Start - delay",
		Conditions = 
		{
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaDelayTimer", Seconds = SDT.D1.Time },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaDelayTimer", Seconds = SDT.D2.Time },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaDelayTimer", Seconds = SDT.D3.Time },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaDelayTimer", Seconds = SDT.D4.Time },
					GameDifficulty {Value = 4},
				},
			},			
			
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_ShannaD-01_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-02_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-03_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-04_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-05_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-06_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-07_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-08_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-09_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaBrutal01_kill"},
			MapFlagSetTrue{Name = "mf_P702_ShannaElixirCarrier_kill"},
			
			MapFlagSetTrue{Name = "mf_P702_ShannaTimers"},
		},
		GotoState = self,
	};	
	
	OnOneTimeEvent
	{
		EventName = "Shanna Timers Start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ShannaTimers"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "ShannaTimerD-01"},
			MapTimerStart	{Name = "ShannaTimerD-02"},
			MapTimerStart	{Name = "ShannaTimerD-03"},
			MapTimerStart	{Name = "ShannaTimerD-04"},
			MapTimerStart	{Name = "ShannaTimerD-05"},
			MapTimerStart	{Name = "ShannaTimerD-06"},
			MapTimerStart	{Name = "ShannaTimerD-07"},
			MapTimerStart	{Name = "ShannaTimerD-08"},
			MapTimerStart	{Name = "ShannaTimerD-09"},
			MapTimerStart	{Name = "ShannaElixircarrier"},
			MapTimerStop	{Name = "ShannaDelayTimer"},
		},
		GotoState = self,
	};
	
		OnOneTimeEvent
	{
		EventName = "Shanna_brutal_timer",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ShannaQuest", Seconds = vShanna_time2 },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_ShannaBrutal01_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna Quest Time End",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_SHANNA"},
			MapTimerIsElapsed	{Name = "ShannaQuest", Seconds = vShanna_time },
			-- egyeb feltetelek!
		},
		Actions = 
		{
			--VisualTimerStop	{},
			MapTimerStop	{Name = "ShannaTimerD-01"},
			MapTimerStop	{Name = "ShannaTimerD-02"},
			MapTimerStop	{Name = "ShannaTimerD-03"},
			MapTimerStop	{Name = "ShannaTimerD-04"},
			MapTimerStop	{Name = "ShannaTimerD-05"},
			MapTimerStop	{Name = "ShannaTimerD-06"},
			MapTimerStop	{Name = "ShannaTimerD-07"},
			MapTimerStop	{Name = "ShannaTimerD-08"},
			MapTimerStop	{Name = "ShannaTimerD-09"},
			MapTimerStop	{Name = "ShannaElixircarrier"},
			MapTimerStop	{Name = "ShannaQuest"},
			--MapFlagSetTrue	{Name = "mf_P702_ShannaTimeEnd"},
			MapTimerStart	{Name = "ShannaLastTimer"},
			EventReEnable	{Name = "Shanna_brutal_spawn"},
			MapFlagSetTrue{Name = "mf_P702_ShannaBrutal01_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "ShannaLastTimeEnd",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ShannaLastTimer", Seconds = 3 },
		},
		Actions = 
		{
			MapTimerStop	{Name = "ShannaLastTimer"},
			MapFlagSetTrue	{Name = "mf_P702_ShannaTimeEnd"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna tree alive",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue	{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-01_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-02_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-03_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-04_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-05_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-06_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-07_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-08_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-09_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaBrutal01_kill"},
			MapFlagIsTrue{Name = "mf_P702_ShannaElixirCarrier_kill"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_ShannaDone"},
		},
		GotoState = self,
	};


	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna Done Afterworks" ,
		Name = "Shanna_Done_Afterworks",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_ShannaDone"},
			AvatarHasItemMisc	{Player = "default", ItemId = 638 , Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 638 , Amount = 1},
			EventReEnable	{Name = "Shanna_Done_Afterworks"},
		},
		GotoState = self,
	};



	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-00 spawn" ,
		Name = "Shanna_D00_spawn",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ShannaQuest", Seconds = 5},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild00a" , Level = 1, UnitId = 189, TargetTag = "fx_demon_01", PlayerKit = "pk_demon"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild00b" , Level = 1, UnitId = 189, TargetTag = "fx_demon_02", PlayerKit = "pk_demon"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild00c" , Level = 1, UnitId = 189, TargetTag = "fx_demon_03", PlayerKit = "pk_demon"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild00d" , Level = 1, UnitId = 189, TargetTag = "fx_demon_04", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild00a", Team = "tm_Demon"},
			FigureTeamTransfer	{Tag = "rts_Demonchild00b", Team = "tm_Demon"},
			FigureTeamTransfer	{Tag = "rts_Demonchild00c", Team = "tm_Demon"},
			FigureTeamTransfer	{Tag = "rts_Demonchild00d", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild00a", TargetTag = "npc_ElvenTree"},
   		FigureRunToEntity {Tag = "rts_Demonchild00b", TargetTag = "npc_ElvenTree"},
   		FigureRunToEntity {Tag = "rts_Demonchild00c", TargetTag = "npc_ElvenTree"},
   		FigureRunToEntity {Tag = "rts_Demonchild00d", TargetTag = "npc_ElvenTree"},
			
			--MapTimerStop	{Name = "ShannaTimerD-01"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-00"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-00_kill"},
			--EventReEnable	{Name = "Shanna_D01_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-00 KO",
		Name = "Shanna_D00_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-00"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaD-01_kill"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			FigureIsDead	{Tag = "rts_Demonchild00a"},
			FigureIsDead	{Tag = "rts_Demonchild00b"},
			FigureIsDead	{Tag = "rts_Demonchild00c"},
			FigureIsDead	{Tag = "rts_Demonchild00d"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-00"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-00_kill"},
			--EventReEnable	{Name = "Shanna_D01_spawn"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-01 spawn" ,
		Name = "Shanna_D01_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-01", Seconds = Sh.E10.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-01", Seconds = Sh.E10.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-01", Seconds = Sh.E10.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-01", Seconds = Sh.E10.T4 },
					GameDifficulty {Value = 4},
				},
			},			
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild01" , Level = Sh.E10.Lev , UnitId = Sh.E10.ID , TargetTag = "fx_demon_01", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild01", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild01", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-01"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-01"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-01_kill"},
			EventReEnable	{Name = "Shanna_D01_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-01 KO",
		Name = "Shanna_D01_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-01"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaD-01_kill"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			FigureIsDead	{Tag = "rts_Demonchild01"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-01"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-01_kill"},
			MapTimerStart {Name = "ShannaTimerD-01"},
			EventReEnable	{Name = "Shanna_D01_spawn"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-02 spawn" ,
		Name = "Shanna_D02_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-02", Seconds = Sh.E20.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-02", Seconds = Sh.E20.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-02", Seconds = Sh.E20.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-02", Seconds = Sh.E20.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild02" , Level = Sh.E20.Lev , UnitId = Sh.E20.ID , TargetTag = "fx_demon_02", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild02", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild02", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-02"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-02"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-02_kill"},
			EventReEnable	{Name = "Shanna_D02_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-02 KO",
		Name = "Shanna_D02_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-02"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaD-01_kill"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			FigureIsDead	{Tag = "rts_Demonchild02"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-02"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-02_kill"},
			MapTimerStart {Name = "ShannaTimerD-02"},
			EventReEnable	{Name = "Shanna_D02_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-03 spawn" ,
		Name = "Shanna_D03_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-03", Seconds = Sh.E30.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-03", Seconds = Sh.E30.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-03", Seconds = Sh.E30.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-03", Seconds = Sh.E30.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild03" , Level = Sh.E30.Lev , UnitId = Sh.E30.ID , TargetTag = "fx_demon_03", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild03", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild03", TargetTag = "npc_ElvenTree"},
   		NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild03b" , Level = Sh.E31.Lev , UnitId = Sh.E31.ID , TargetTag = "fx_demon_03", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild03b", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild03b", TargetTag = "npc_ElvenTree"},
			--FigureAttackEntity	{Tag = "rts_Demonchild03b", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-03"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-03"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-03_kill"},
			EventReEnable	{Name = "Shanna_D03_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-03 KO",
		Name = "Shanna_D03_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-03"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaD-01_kill"},
			--MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			FigureIsDead	{Tag = "rts_Demonchild03"},
			FigureIsDead	{Tag = "rts_Demonchild03b"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-03"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-03_kill"},
			MapTimerStart {Name = "ShannaTimerD-03"},
			EventReEnable	{Name = "Shanna_D03_spawn"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-04 spawn" ,
		Name = "Shanna_D04_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-04", Seconds = Sh.E40.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-04", Seconds = Sh.E40.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-04", Seconds = Sh.E40.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-04", Seconds = Sh.E40.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild04" , Level = Sh.E40.Lev , UnitId = Sh.E40.ID , TargetTag = "fx_demon_04", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild04", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild04", TargetTag = "npc_ElvenTree"},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild04b" , Level = Sh.E41.Lev , UnitId = Sh.E41.ID , TargetTag = "fx_demon_04", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild04b", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild04b", TargetTag = "npc_ElvenTree"},
   		
			MapTimerStop	{Name = "ShannaTimerD-04"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-04"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-04_kill"},
			EventReEnable	{Name = "Shanna_D04_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-04 KO",
		Name = "Shanna_D04_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-04"},
			FigureIsDead	{Tag = "rts_Demonchild04"},
			FigureIsDead	{Tag = "rts_Demonchild04b"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-04"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-04_kill"},
			MapTimerStart {Name = "ShannaTimerD-04"},
			EventReEnable	{Name = "Shanna_D04_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-05 spawn" ,
		Name = "Shanna_D05_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-05", Seconds = Sh.E50.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-05", Seconds = Sh.E50.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-05", Seconds = Sh.E50.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-05", Seconds = Sh.E50.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild05" , Level = Sh.E50.Lev , UnitId = Sh.E50.ID , TargetTag = "fx_demon_01", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild05", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild05", TargetTag = "npc_ElvenTree"},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild05b" , Level = Sh.E51.Lev , UnitId = Sh.E51.ID , TargetTag = "fx_demon_01", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild05b", Team = "tm_Demon"},
   		--FigureRunToEntity {Tag = "rts_Demonchild05b", TargetTag = "npc_ElvenTree"},
   		FigureAttackEntity	{Tag = "rts_Demonchild05b", TargetTag = "npc_ElvenTree"},
   		
			MapTimerStop	{Name = "ShannaTimerD-05"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-05"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-05_kill"},
			EventReEnable	{Name = "Shanna_D05_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-05 KO",
		Name = "Shanna_D05_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-05"},
			FigureIsDead	{Tag = "rts_Demonchild05"},
			FigureIsDead	{Tag = "rts_Demonchild05b"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-05"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-05_kill"},
			MapTimerStart {Name = "ShannaTimerD-05"},
			EventReEnable	{Name = "Shanna_D05_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-06 spawn" ,
		Name = "Shanna_D06_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-06", Seconds = Sh.E60.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-06", Seconds = Sh.E60.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-06", Seconds = Sh.E60.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-06", Seconds = Sh.E60.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild06" , Level = Sh.E60.Lev , UnitId = Sh.E60.ID , TargetTag = "fx_demon_02", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild06", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild06", TargetTag = "npc_ElvenTree"},
   		NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild06b" , Level = Sh.E61.Lev , UnitId = Sh.E61.ID , TargetTag = "fx_demon_02", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild06b", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild06b", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-06"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-06"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-06_kill"},
			EventReEnable	{Name = "Shanna_D06_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-06 KO",
		Name = "Shanna_D06_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-06"},
			FigureIsDead	{Tag = "rts_Demonchild06"},
			FigureIsDead	{Tag = "rts_Demonchild06b"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-06"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-06_kill"},
			MapTimerStart {Name = "ShannaTimerD-06"},
			EventReEnable	{Name = "Shanna_D06_spawn"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-07 spawn" ,
		Name = "Shanna_D07_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-07", Seconds = Sh.E70.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-07", Seconds = Sh.E70.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-07", Seconds = Sh.E70.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-07", Seconds = Sh.E70.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild07" , Level = Sh.E70.Lev , UnitId = Sh.E70.ID , TargetTag = "fx_demon_03", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild07", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild07", TargetTag = "npc_ElvenTree"},
   		NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild07b" , Level = Sh.E71.Lev , UnitId = Sh.E71.ID , TargetTag = "fx_demon_03", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild07b", Team = "tm_Demon"},
   		--FigureRunToEntity {Tag = "rts_Demonchild07b", TargetTag = "npc_ElvenTree"},
			FigureAttackEntity	{Tag = "rts_Demonchild07b", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-07"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-07"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-07_kill"},
			EventReEnable	{Name = "Shanna_D07_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-07 KO",
		Name = "Shanna_D07_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-07"},
			FigureIsDead	{Tag = "rts_Demonchild07"},
			FigureIsDead	{Tag = "rts_Demonchild07b"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-07"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-07_kill"},
			MapTimerStart {Name = "ShannaTimerD-07"},
			EventReEnable	{Name = "Shanna_D07_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-08 spawn" ,
		Name = "Shanna_D08_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-08", Seconds = Sh.E80.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-08", Seconds = Sh.E80.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-08", Seconds = Sh.E80.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-08", Seconds = Sh.E80.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild08" , Level = Sh.E80.Lev , UnitId = Sh.E80.ID , TargetTag = "fx_demon_04", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild08", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild08", TargetTag = "npc_ElvenTree"},
   		NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild08b" , Level = Sh.E81.Lev , UnitId = Sh.E81.ID , TargetTag = "fx_demon_04", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild08b", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild08b", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-08"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-08"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-08_kill"},
			EventReEnable	{Name = "Shanna_D08_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-08 KO",
		Name = "Shanna_D08_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-08"},
			FigureIsDead	{Tag = "rts_Demonchild08"},
			FigureIsDead	{Tag = "rts_Demonchild08b"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-08"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-08_kill"},
			MapTimerStart {Name = "ShannaTimerD-08"},
			EventReEnable	{Name = "Shanna_D08_spawn"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-09 spawn" ,
		Name = "Shanna_D09_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-09", Seconds = Sh.E90.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-09", Seconds = Sh.E90.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-09", Seconds = Sh.E90.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaTimerD-09", Seconds = Sh.E90.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Demonchild09" , Level = Sh.E90.Lev , UnitId = Sh.E90.ID , TargetTag = "fx_demon_04", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_Demonchild09", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_Demonchild09", TargetTag = "npc_ElvenTree"},
			
			MapTimerStop	{Name = "ShannaTimerD-09"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-09"},
			MapFlagSetFalse{Name = "mf_P702_ShannaD-09_kill"},
			EventReEnable	{Name = "Shanna_D09_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Demon-09 KO",
		Name = "Shanna_D09_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaD-09"},
			FigureIsDead	{Tag = "rts_Demonchild09"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaD-09"},
			MapFlagSetTrue{Name = "mf_P702_ShannaD-09_kill"},
			MapTimerStart {Name = "ShannaTimerD-09"},
			EventReEnable	{Name = "Shanna_D09_spawn"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Elixircarrier spawn" ,
		Name = "Shanna_EC_spawn",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_ShannaTimeEnd"},
			MapFlagIsFalse{Name = "mf_P702_ShannaBrutal01"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaElixircarrier", Seconds = Sh.Eli.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaElixircarrier", Seconds = Sh.Eli.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaElixircarrier", Seconds = Sh.Eli.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "ShannaElixircarrier", Seconds = Sh.Eli.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "ShannaElixircarrier"},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_elixircarrier" , Level = Sh.Eli.Lev , UnitId = Sh.Eli.ID , TargetTag = "fx_demon_03", PlayerKit = "pk_demon"},},
			--FigureLootItemMiscAdd	{Tag = "rts_elixircarrier", DropChance = 100, ItemId = 638},
			FigureTeamTransfer	{Tag = "rts_elixircarrier", Team = "tm_Demon"},
			FigureRunToEntity {Tag = "rts_elixircarrier", TargetTag = "npc_ElvenTree"},
			FigureLootItemMiscAdd	{Tag = "rts_elixircarrier", DropChance = 100, ItemId = 638},
			MapFlagSetTrue{Name = "mf_P702_ShannaElixirCarrier"},
			MapFlagSetFalse{Name = "mf_P702_ShannaElixirCarrier_kill"},
			EventReEnable	{Name = "Shanna_EC_KO"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna - Elixircarrier KO",
		Name = "Shanna_EC_KO",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_SHANNA"},
			FigureIsDead{Tag = "rts_elixircarrier"},
			MapFlagIsTrue	{Name = "mf_P702_ShannaElixirCarrier"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			--FigureLootItemMiscRemove	{Tag = "rts_elixircarrier_dead", ItemId = 638},
			MapTimerStart	{Name = "ShannaElixircarrier"},
			MapFlagSetTrue{Name = "mf_P702_ShannaElixirCarrier_kill"},
			MapFlagSetFalse{Name = "mf_P702_ShannaElixirCarrier"},
			--FigureLootItemMiscAdd	{Tag = "rts_elixircarrier_dead", DropChance = 100, ItemId = 638},
			EventReEnable	{Name = "Shanna_EC_spawn"},			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Shanna_brutal_spawn",
		Name = "Shanna_brutal_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "ShannaQuest", Seconds = vShanna_time2 },
			MapFlagIsTrue{Name = "mf_P702_ShannaBrutal01_spawn"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaBrutal01_spawn"},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_BrutalDemon01" , Level = Sh.Ebt.Lev , UnitId = Sh.Ebt.ID , TargetTag = "fx_demon_02", PlayerKit = "pk_demon"},},
			FigureTeamTransfer	{Tag = "rts_BrutalDemon01", Team = "tm_Demon"},
   		FigureRunToEntity {Tag = "rts_BrutalDemon01", TargetTag = "npc_ElvenTree"},
			MapFlagSetTrue{Name = "mf_P702_ShannaBrutal01"},
			MapFlagSetFalse{Name = "mf_P702_ShannaBrutal01_kill"},
			MapTimerStop	{Name = "ShannaTimerD-01"},
			MapTimerStop	{Name = "ShannaTimerD-02"},
			MapTimerStop	{Name = "ShannaTimerD-03"},
			MapTimerStop	{Name = "ShannaTimerD-04"},
			MapTimerStop	{Name = "ShannaTimerD-05"},
			MapTimerStop	{Name = "ShannaTimerD-06"},
			MapTimerStop	{Name = "ShannaTimerD-07"},
			MapTimerStop	{Name = "ShannaTimerD-08"},
			MapTimerStop	{Name = "ShannaTimerD-09"},
			MapTimerStop	{Name = "ShannaElixircarrier"},
			EventReEnable	{Name = "Shanna_brutal_killed"},
		},
		GotoState = self,
	};


	OnOneTimeRepeatEvent
	{
		EventName = "Shanna_brutal_killed",
		Name = "Shanna_brutal_killed",
		Conditions = 
		{
			--QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			MapFlagIsTrue{Name = "mf_P702_ShannaBrutal01"},
			FigureIsDead	{Tag = "rts_BrutalDemon01"},
			SetUpdateInterval	{Steps = 10},		
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_ShannaBrutal01"},
			MapFlagSetTrue{Name = "mf_P702_ShannaBrutal01_kill"},
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_02"},
			MapFlagSetTrue{Name = "mf_P702_SB_Timer_Restarter"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Shanna_Timers_Restart",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_SB_Timer_Restarter"},
			QuestIsActive	{Player = "default", Quest = "SS_SHANNA"},
			SetUpdateInterval	{Steps = 16},	
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_SB_Timer_Restarter"},
			MapTimerStart	{Name = "ShannaTimerD-01"},
			MapTimerStart	{Name = "ShannaTimerD-02"},
			MapTimerStart	{Name = "ShannaTimerD-03"},
			MapTimerStart	{Name = "ShannaTimerD-04"},
			MapTimerStart	{Name = "ShannaTimerD-05"},
			MapTimerStart	{Name = "ShannaTimerD-06"},
			MapTimerStart	{Name = "ShannaTimerD-07"},
			MapTimerStart	{Name = "ShannaTimerD-08"},
			MapTimerStart	{Name = "ShannaTimerD-09"},
			MapTimerStart	{Name = "ShannaElixircarrier"},
		},
		GotoState = self,
	};




	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_Caine",
		Name = "Teleport_Shanna_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_HeroFirst",
		Name = "Teleport_Shanna_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_HeroSecond",
		Name = "Teleport_Shanna_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_HeroThird",
		Name = "Teleport_Shanna_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_HeroOrc",
		Name = "Teleport_Shanna_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_CompanionCraigHuman",
		Name = "Teleport_Shanna_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Shanna_CompanionSariel",
		Name = "Teleport_Shanna_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_ElvenTree", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "npc_ElvenTree", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Shanna_CompanionSariel"},
		},
		GotoState = self,
	};
	

	
}