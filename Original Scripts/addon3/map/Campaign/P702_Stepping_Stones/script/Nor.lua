------------------------------------------------------
---- 04: Nor, god of the Moon ----
------------------------------------------------------

State
{
	StateName = "INIT",
	
	------------------------------------------------------
	-- Nor timers section
	------------------------------------------------------

	OnOneTimeEvent
	{
		EventName = "Nor Timers Start",
		Conditions = 
		{
			--MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapTimerStart	{Name = "NorTimer"},
			MapTimerStart	{Name = "NorTimerU-00"},
			MapTimerStart	{Name = "NorTimerU-01"},
			MapTimerStart	{Name = "NorTimerU-02"},
			MapTimerStart	{Name = "NorTimerU-03"},
			MapTimerStart	{Name = "NorTimerU-04"},
			MapTimerStart	{Name = "NorTimerU-05"},
			MapTimerStart	{Name = "NorTimerU-06"},
			MapTimerStart	{Name = "NorTimerU-07"},
			MapTimerStart	{Name = "NorTimerU-08"},
			MapTimerStart	{Name = "NorTimerU-09"},
			MapTimerStart	{Name = "NorTimerU-10"},
			MapTimerStart	{Name = "NorTimerU-11"},
			MapTimerStart	{Name = "NorTimerU-12"},
			MapTimerStart	{Name = "NorTimerU-13"},
			MapTimerStart	{Name = "NorTimerU-14"},
			MapTimerStart	{Name = "NorTimerU-15"},
			MapTimerStart	{Name = "NorTimerU-99"},
			MapTimerStart	{Name = "NorHealTimer"},
			--VisualTimerStart	{Seconds = vVisualNorTimer },
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_HealTimer_Start",
		Conditions = 
		{
			--MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			GameDifficulty {Value = 1},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapTimerStart	{Name = "NorHealTimer"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_Timer_Stopper",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_NorTimerStopper"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "NorTimer"},
			MapTimerStop	{Name = "NorTimerU-01"},
			MapTimerStop	{Name = "NorTimerU-02"},
			MapTimerStop	{Name = "NorTimerU-03"},
			MapTimerStop	{Name = "NorTimerU-04"},
			MapTimerStop	{Name = "NorTimerU-05"},
			MapTimerStop	{Name = "NorTimerU-06"},
			MapTimerStop	{Name = "NorTimerU-07"},
			MapTimerStop	{Name = "NorTimerU-08"},
			MapTimerStop	{Name = "NorTimerU-09"},
			MapTimerStop	{Name = "NorTimerU-10"},
			MapTimerStop	{Name = "NorTimerU-11"},
			MapTimerStop	{Name = "NorTimerU-12"},
			MapTimerStop	{Name = "NorTimerU-13"},
			MapTimerStop	{Name = "NorTimerU-14"},
			MapTimerStop	{Name = "NorTimerU-15"},
			MapTimerStop	{Name = "NorTimerU-99"},
			MapTimerStop	{Name = "NorHealTimer"},
			--VisualTimerStop	{},
			MapFlagSetFalse	{Name = "mf_P702_NorTimerStopper"},
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- Nor timers section end
	------------------------------------------------------
	-- Nor outcry
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Nor Starting Outcry",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_04_in", Range = 7},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "NorCry01", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_Easy_Healer_Outcry",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			GameDifficulty {Value = 1},
			MapTimerIsElapsed	{Name = "NorHealTimer", Seconds = 30},
			MapFlagIsTrue{Name = "mf_P702_NorAvatarHealed"},
			OR
			{
				--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorHealer", Range = 15},
				--FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "NorHealer", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "NorHealer", Range = 8 },
				FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "NorHealer", Range = 8 },
				FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "NorHealer", Range = 8 },
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "NorCry06", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_End_Outcry",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "NorCry07", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "NorCry08", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			MapFlagSetTrue{Name = "mf_P702_NorEndOutcry"},
			MapTimerStart	{Name = "NorEndTimer"},
		},
		GotoState = self,
	};


	------------------------------------------------------
	-- Nor outcry end
	------------------------------------------------------
	-- Nor grave init
	------------------------------------------------------


	OnOneTimeEvent
	{
		EventName = "Nor Loot Init",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			ObjectLootItemEquipmentAdd	{Tag = "grave_1", DropChance = 100, ItemId = 2001},
			ObjectLootItemEquipmentAdd	{Tag = "grave_2", DropChance = 100, ItemId = 2002},
			ObjectLootItemEquipmentAdd	{Tag = "grave_3", DropChance = 100, ItemId = 2003},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Nor Grave_1 event",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NorStartMinOnce"},
			--MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			--QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "grave_1", Range = 6},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "grave_1", Range = 6},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "grave_1", Range = 6},
			},
		},
		Actions = 
		{
			--FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_Undead", TargetTag = "Grave_1", Amount = 4 },
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_1a" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_1", PlayerKit = "pk_undead"},},
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_1b" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_1", PlayerKit = "pk_undead"},},
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_1c" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_1", PlayerKit = "pk_undead"},},
		FigureTeamTransfer	{Tag = "rts_Grave_1a", Team = "tm_Undead"},
		FigureTeamTransfer	{Tag = "rts_Grave_1b", Team = "tm_Undead"},
		FigureTeamTransfer	{Tag = "rts_Grave_1c", Team = "tm_Undead"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor Grave_2 event",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			MapFlagIsTrue{Name = "mf_P702_NorStartMinOnce"},
			--MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			--QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "grave_2", Range = 6},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "grave_2", Range = 6},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "grave_2", Range = 6},
			},
		},
		Actions = 
		{
			--FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_Undead", TargetTag = "Grave_1", Amount = 4 },
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_2a" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_2", PlayerKit = "pk_undead"},},
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_2b" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_2", PlayerKit = "pk_undead"},},
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_2c" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_2", PlayerKit = "pk_undead"},},
		FigureTeamTransfer	{Tag = "rts_Grave_2a", Team = "tm_Undead"},
		FigureTeamTransfer	{Tag = "rts_Grave_2b", Team = "tm_Undead"},
		FigureTeamTransfer	{Tag = "rts_Grave_2c", Team = "tm_Undead"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Nor Grave_3 event",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			MapFlagIsTrue{Name = "mf_P702_NorStartMinOnce"},
			--MapFlagIsTrue{Name = "mf_P702_NorAccepted"},
			--QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "grave_3", Range = 6},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "grave_3", Range = 6},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "grave_3", Range = 6},
			},
		},
		Actions = 
		{
			--FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_Undead", TargetTag = "Grave_1", Amount = 4 },
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_3a" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_3", PlayerKit = "pk_undead"},},
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_3b" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_3", PlayerKit = "pk_undead"},},
		NoSpawnEffect {Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Grave_3c" , Level = NorEnemy.Egrv.Lev , UnitId = NorEnemy.Egrv.ID , TargetTag = "grave_3", PlayerKit = "pk_undead"},},
		FigureTeamTransfer	{Tag = "rts_Grave_3a", Team = "tm_Undead"},
		FigureTeamTransfer	{Tag = "rts_Grave_3b", Team = "tm_Undead"},
		FigureTeamTransfer	{Tag = "rts_Grave_3c", Team = "tm_Undead"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Nor grave init end
	------------------------------------------------------
	-- Nor spawn
	------------------------------------------------------
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Nor Undead-00 spawn",
		Name = "Nor_Undead-00_spawn",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "NorTimerU-00", Seconds = NorEnemy.E000.T1 },
			SetUpdateInterval	{Steps = 10},
			--MapFlagIsFalse{Name = "mf_P702_NorEnd"},
		},
		
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00a" , Level = NorEnemy.E000.Lev , UnitId = NorEnemy.E000.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00b" , Level = NorEnemy.E001.Lev , UnitId = NorEnemy.E001.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00c" , Level = NorEnemy.E002.Lev , UnitId = NorEnemy.E002.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00d" , Level = NorEnemy.E003.Lev , UnitId = NorEnemy.E003.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00e" , Level = NorEnemy.E004.Lev , UnitId = NorEnemy.E004.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00f" , Level = NorEnemy.E005.Lev , UnitId = NorEnemy.E005.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00g" , Level = NorEnemy.E006.Lev , UnitId = NorEnemy.E006.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00h" , Level = NorEnemy.E007.Lev , UnitId = NorEnemy.E007.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-00i" , Level = NorEnemy.E008.Lev , UnitId = NorEnemy.E008.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			FigureTeamTransfer	{Tag = "rts_Undead-00a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00b", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00c", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00d", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00e", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00f", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00g", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00h", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-00i", Team = "tm_Undead"},

			MapFlagSetTrue{Name = "mf_P702_NorU-00"},
			MapFlagSetFalse{Name = "mf_P702_NorU-00_kill"},
			
			MapTimerStop	{Name = "NorTimerU-00"},
			
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00c", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00d", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00e", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00f", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00g", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00h", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-00i", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			EventReEnable	{Name = "Nor_Undead-00_KO"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-00_KO",
		Name = "Nor_Undead-00_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-00"},
			FigureIsDead	{Tag = "rts_Undead-00a"},
			FigureIsDead	{Tag = "rts_Undead-00b"},
			FigureIsDead	{Tag = "rts_Undead-00c"},
			FigureIsDead	{Tag = "rts_Undead-00d"},
			FigureIsDead	{Tag = "rts_Undead-00e"},
			FigureIsDead	{Tag = "rts_Undead-00f"},
			FigureIsDead	{Tag = "rts_Undead-00g"},
			FigureIsDead	{Tag = "rts_Undead-00h"},
			FigureIsDead	{Tag = "rts_Undead-00i"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-00"},
			MapFlagSetTrue{Name = "mf_P702_NorU-00_kill"},
			EventReEnable	{Name = "Nor_Undead-00_spawn"},
		},
		-- GotoState = self,
	};	

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-01_spawn",
		Name = "Nor_Undead-01_spawn",
		Conditions = 
		{
			
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-01", Seconds = NorEnemy.E010.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-01", Seconds = NorEnemy.E010.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-01", Seconds = NorEnemy.E010.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-01", Seconds = NorEnemy.E010.T4 },
					GameDifficulty {Value = 4},
				},
			},			
		},
		Actions = 
		{
			--MapFlagSetFalse	{Name = "mf_P702_NorU-01_spawn"},
			MapTimerStop	{Name = "NorTimerU-01"},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-01a" , Level = NorEnemy.E010.Lev , UnitId = NorEnemy.E010.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-01b" , Level = NorEnemy.E010.Lev , UnitId = NorEnemy.E010.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-01c" , Level = NorEnemy.E010.Lev , UnitId = NorEnemy.E010.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-01d" , Level = NorEnemy.E010.Lev , UnitId = NorEnemy.E010.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			FigureTeamTransfer	{Tag = "rts_Undead-01a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-01b", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-01c", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-01d", Team = "tm_Undead"},
			
			MapFlagSetTrue{Name = "mf_P702_NorU-01"},
			MapFlagSetFalse{Name = "mf_P702_NorU-01_kill"},
			
			EventReEnable	{Name = "Nor_Undead-01_KO"},
			EventReEnable	{Name = "Nor_Undead-01_path-1"},
			EventReEnable	{Name = "Nor_Undead-01_path-2"},
		},
		GotoState = self,
	};





	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-01_path-1",
		Name = "Nor_Undead-01_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-01a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-01b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-01c", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-01d", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-01_path-2",
		Name = "Nor_Undead-01_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-01a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-01b", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-01c", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-01d", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};



	OnOneTimeRepeatEvent
	{
		EventName = "Undead-01 KO",
		Name = "Nor_Undead-01_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-01"},
			FigureIsDead	{Tag = "rts_Undead-01a"},
			FigureIsDead	{Tag = "rts_Undead-01b"},
			FigureIsDead	{Tag = "rts_Undead-01c"},
			FigureIsDead	{Tag = "rts_Undead-01d"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-01"},
			MapFlagSetTrue{Name = "mf_P702_NorU-01_kill"},
			MapTimerStart {Name = "NorTimerU-01"},
			EventReEnable	{Name = "Nor_Undead-01_spawn"},
		},
		-- GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-02 spawn",
		Name = "Nor_Undead-02_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "NorTimerU-02", Seconds = 67},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-02", Seconds = NorEnemy.E020.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-02", Seconds = NorEnemy.E020.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-02", Seconds = NorEnemy.E020.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-02", Seconds = NorEnemy.E020.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-02a" , Level = NorEnemy.E020.Lev , UnitId = NorEnemy.E020.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-02b" , Level = NorEnemy.E020.Lev , UnitId = NorEnemy.E020.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-02c" , Level = NorEnemy.E020.Lev , UnitId = NorEnemy.E020.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-02d" , Level = NorEnemy.E021.Lev , UnitId = NorEnemy.E021.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-02a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-02b", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-02c", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-02d", Team = "tm_Undead"},

			MapTimerStop	{Name = "NorTimerU-02"},
			MapFlagSetTrue{Name = "mf_P702_NorU-02"},
			MapFlagSetFalse{Name = "mf_P702_NorU-02_kill"},
			
			EventReEnable	{Name = "Nor_Undead-02_KO"},
			EventReEnable	{Name = "Nor_Undead-02_path-1"},
			EventReEnable	{Name = "Nor_Undead-02_path-2"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-02_path-1",
		Name = "Nor_Undead-02_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-02a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-02b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-02c", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-02d", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-02_path-2",
		Name = "Nor_Undead-02_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-02a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-02b", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-02c", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-02d", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-02 KO",
		Name = "Nor_Undead-02_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-02"},
			FigureIsDead	{Tag = "rts_Undead-02a"},
			FigureIsDead	{Tag = "rts_Undead-02b"},
			FigureIsDead	{Tag = "rts_Undead-02c"},
			FigureIsDead	{Tag = "rts_Undead-02d"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-02"},
			MapFlagSetTrue{Name = "mf_P702_NorU-02_kill"},
			MapTimerStart {Name = "NorTimerU-02"},
			EventReEnable	{Name = "Nor_Undead-02_spawn"},
		},
		-- GotoState = self,
	};


	OnOneTimeRepeatEvent
	{
		EventName = "Undead-03 spawn",
		Name = "Nor_Undead-03_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "NorTimerU-03", Seconds = 107},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-03", Seconds = NorEnemy.E030.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-03", Seconds = NorEnemy.E030.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-03", Seconds = NorEnemy.E030.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-03", Seconds = NorEnemy.E030.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-03a" , Level = NorEnemy.E030.Lev , UnitId = NorEnemy.E030.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-03b" , Level = NorEnemy.E030.Lev , UnitId = NorEnemy.E030.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-03c" , Level = NorEnemy.E030.Lev , UnitId = NorEnemy.E030.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-03d" , Level = NorEnemy.E031.Lev , UnitId = NorEnemy.E031.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-03a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-03b", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-03c", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-03d", Team = "tm_Undead"},

			MapTimerStop	{Name = "NorTimerU-03"},
			MapFlagSetTrue{Name = "mf_P702_NorU-03"},
			MapFlagSetFalse{Name = "mf_P702_NorU-03_kill"},
			
			EventReEnable	{Name = "Nor_Undead-03_path-1"},
			EventReEnable	{Name = "Nor_Undead-03_path-2"},
			EventReEnable	{Name = "Nor_Undead-03_KO"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-03_path-1",
		Name = "Nor_Undead-03_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-03a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-03b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-03c", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-03d", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-03_path-2",
		Name = "Nor_Undead-03_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-03a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-03b", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-03c", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-03d", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-03 KO",
		Name = "Nor_Undead-03_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-03"},
			FigureIsDead	{Tag = "rts_Undead-03a"},
			FigureIsDead	{Tag = "rts_Undead-03b"},
			FigureIsDead	{Tag = "rts_Undead-03c"},
			FigureIsDead	{Tag = "rts_Undead-03d"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-03"},
			MapFlagSetTrue{Name = "mf_P702_NorU-03_kill"},
			MapTimerStart {Name = "NorTimerU-03"},
			EventReEnable	{Name = "Nor_Undead-03_spawn"},
		},
		-- GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-04 spawn",
		Name = "Nor_Undead-04_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "NorTimerU-04", Seconds = 137},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-04", Seconds = NorEnemy.E040.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-04", Seconds = NorEnemy.E040.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-04", Seconds = NorEnemy.E040.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-04", Seconds = NorEnemy.E040.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-04a" , Level = NorEnemy.E040.Lev , UnitId = NorEnemy.E040.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-04b" , Level = NorEnemy.E041.Lev , UnitId = NorEnemy.E041.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-04a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-04b", Team = "tm_Undead"},

   		--FigureRunToEntity {Tag = "rts_Undead-04a", TargetTag = "pl_HumanAvatar"},
   		--FigureForceAttackEntity	{Tag = "rts_Undead-04a", TargetTag = "pl_HumanAvatar"},
			MapTimerStop	{Name = "NorTimerU-04"},
			MapFlagSetTrue{Name = "mf_P702_NorU-04"},
			MapFlagSetFalse{Name = "mf_P702_NorU-04_kill"},
						
			EventReEnable	{Name = "Nor_Undead-04_path-1"},
			EventReEnable	{Name = "Nor_Undead-04_path-2"},
			EventReEnable	{Name = "Nor_Undead-04_KO"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-04_path-1",
		Name = "Nor_Undead-04_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-04a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-04b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-04_path-2",
		Name = "Nor_Undead-04_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-04a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-04b", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-04 KO",
		Name = "Nor_Undead-04_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-04"},
			FigureIsDead	{Tag = "rts_Undead-04a"},
			FigureIsDead	{Tag = "rts_Undead-04b"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-04"},
			MapFlagSetTrue{Name = "mf_P702_NorU-04_kill"},
			MapTimerStart {Name = "NorTimerU-04"},
			EventReEnable	{Name = "Nor_Undead-04_spawn"},
		},
		-- GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-05 spawn",
		Name = "Nor_Undead-05_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "NorTimerU-05", Seconds = 157},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-05", Seconds = NorEnemy.E050.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-05", Seconds = NorEnemy.E050.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-05", Seconds = NorEnemy.E050.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-05", Seconds = NorEnemy.E050.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-05a" , Level = NorEnemy.E050.Lev , UnitId = NorEnemy.E050.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-05b" , Level = NorEnemy.E051.Lev , UnitId = NorEnemy.E051.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-05a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-05b", Team = "tm_Undead"},
			MapTimerStop	{Name = "NorTimerU-05"},
			MapFlagSetTrue{Name = "mf_P702_NorU-05"},
			MapFlagSetFalse{Name = "mf_P702_NorU-05_kill"},
			
			EventReEnable	{Name = "Nor_Undead-05_path-1"},
			EventReEnable	{Name = "Nor_Undead-05_path-2"},
			EventReEnable	{Name = "Nor_Undead-05_KO"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-05_path-1",
		Name = "Nor_Undead-05_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-05a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-05b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-05_path-2",
		Name = "Nor_Undead-05_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-05a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-05b", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-05 KO",
		Name = "Nor_Undead-05_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-05"},
			FigureIsDead	{Tag = "rts_Undead-05a"},
			FigureIsDead	{Tag = "rts_Undead-05b"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-05"},
			MapFlagSetTrue{Name = "mf_P702_NorU-05_kill"},
			MapTimerStart {Name = "NorTimerU-05"},
			EventReEnable	{Name = "Nor_Undead-05_spawn"},
		},
		-- GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-06 spawn",
		Name = "Nor_Undead-06_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "NorTimerU-06", Seconds = 197},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
			OR
			{
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-06", Seconds = NorEnemy.E060.T1 },
					GameDifficulty {Value = 1},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-06", Seconds = NorEnemy.E060.T2 },
					GameDifficulty {Value = 2},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-06", Seconds = NorEnemy.E060.T3 },
					GameDifficulty {Value = 3},
				},
				AND
				{
					MapTimerIsElapsed	{Name = "NorTimerU-06", Seconds = NorEnemy.E060.T4 },
					GameDifficulty {Value = 4},
				},
			},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-06a" , Level = NorEnemy.E060.Lev , UnitId = NorEnemy.E060.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-06b" , Level = NorEnemy.E061.Lev , UnitId = NorEnemy.E061.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-06c" , Level = NorEnemy.E062.Lev , UnitId = NorEnemy.E062.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-06a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-06b", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-06c", Team = "tm_Undead"},
   		--FigureRunToEntity {Tag = "rts_Undead-06a", TargetTag = "pl_HumanAvatar"},
   		--FigureForceAttackEntity	{Tag = "rts_Undead-06a", TargetTag = "pl_HumanAvatar"},
			MapTimerStop	{Name = "NorTimerU-06"},
			MapFlagSetTrue{Name = "mf_P702_NorU-06"},
			MapFlagSetFalse{Name = "mf_P702_NorU-06_kill"},
			
			EventReEnable	{Name = "Nor_Undead-06_path-1"},
			EventReEnable	{Name = "Nor_Undead-06_path-2"},
			EventReEnable	{Name = "Nor_Undead-06_KO"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-06_path-1",
		Name = "Nor_Undead-06_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-06a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-06b", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_Undead-06c", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-06_path-2",
		Name = "Nor_Undead-06_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-06a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-06b", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-06c", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-06 KO",
		Name = "Nor_Undead-06_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-06"},
			FigureIsDead	{Tag = "rts_Undead-06a"},
			FigureIsDead	{Tag = "rts_Undead-06b"},
			FigureIsDead	{Tag = "rts_Undead-06c"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-06"},
			MapFlagSetTrue{Name = "mf_P702_NorU-06_kill"},
			MapTimerStart {Name = "NorTimerU-06"},
			EventReEnable	{Name = "Nor_Undead-06_spawn"},
		},
		-- GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Undead-07 spawn",
		Name = "Nor_Undead-07_spawn",
		Conditions = 
		{
			--MapTimerIsElapsed	{Name = "NorTimerU-06", Seconds = 219},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			MapTimerIsElapsed	{Name = "NorTimerU-07", Seconds = NorEnemy.E070.T4 },
			GameDifficulty {Value = 4},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-07a" , Level = NorEnemy.E070.Lev , UnitId = NorEnemy.E070.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-07a", Team = "tm_Undead"},
			
			MapTimerStop	{Name = "NorTimerU-07"},
			MapFlagSetTrue{Name = "mf_P702_NorU-07"},
			MapFlagSetFalse{Name = "mf_P702_NorU-07_kill"},
			
			EventReEnable	{Name = "Nor_Undead-07_path-1"},
			EventReEnable	{Name = "Nor_Undead-07_path-2"},
			EventReEnable	{Name = "Nor_Undead-07_KO"},
		},
	};
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-07_path-1",
		Name = "Nor_Undead-07_path-1",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			EffectStart	{Tag = "rts_Undead-07a", File = "Effect_Misc_ElementalSpawn_Fire"},
			FigurePathGoto	
			{
				Goto = FigureForcedWalkToEntity	{Tag = "rts_Undead-07a", TargetTag = "n06"},
				Tags = {	"n01", "n02", "n03", "n04", "n05", "n07", "n08", "n09", "n10", "n11", "NorCenter", },
			},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Undead-07_path-2",
		Name = "Nor_Undead-07_path-2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "rts_Undead-07a", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Undead-07 KO",
		Name = "Nor_Undead-07_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-07"},
			FigureIsDead	{Tag = "rts_Undead-07a"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			EffectStop	{Tag = "rts_Undead-07a"},
			MapFlagSetFalse{Name = "mf_P702_NorU-07"},
			MapFlagSetTrue{Name = "mf_P702_NorU-07_kill"},
			MapTimerStart {Name = "NorTimerU-07"},
			EventReEnable	{Name = "Nor_Undead-07_spawn"},
		},
		-- GotoState = self,
	};
	
	
	
	
	OnOneTimeEvent
	{
		EventName = "Nor Subquest Phase1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapTimerIsElapsed	{Name = "NorTimerU-99", Seconds = NorEnemy.E990.T1 },
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-99" , Level = NorEnemy.E990.Lev , UnitId = NorEnemy.E990.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			
			FigureTeamTransfer	{Tag = "rts_Undead-99", Team = "tm_Undead"},

			MapFlagSetTrue{Name = "mf_P702_NorSQ1Avialable"},
			MapTimerStop	{Name = "NorTimerU-99"},
			FigureAttackEntity	{Tag = "rts_Undead-99", TargetTag = "pl_HumanAvatar"},			
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Nor Subquest Phase2",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NorSQ1Avialable"},
			FigureIsDead	{Tag = "rts_Undead-99"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_NorU-99_kill"},
			FigureLootItemMiscAdd	{Tag = "rts_Undead-99_Dead", DropChance = 100, ItemId = 635}, --naploreszlet (630-635: naploreszletek)
			FigureRespawnToEntity	{Tag = "npc_TravelerGhost", TargetTag = "rts_Undead-99_Dead"},
			FigureRunToEntity	{Tag = "npc_TravelerGhost", TargetTag = "mrk_TravelerGhost"},
			FigureDirectionSetToEntity	{Tag = "npc_TravelerGhost", TargetTag = "pl_HumanAvatar"},
			DialogSetEnabled	{Tag = "npc_TravelerGhost"},
			
		},
		GotoState = self,
	};
	

	OnOneTimeEvent
	{
		EventName = "Nor_Time_Reset_VHard1",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			MapTimerIsElapsed	{Name = "NorTimer", Seconds = vVisualNorTimer},
			SetUpdateInterval	{Steps = 11},
		},
		Actions = 
		{
			--VisualTimerStop	{},
			MapTimerStop {Name = "NorTimer"},
			FigureOutcry	{TextTag = "NorCry03", Tag = "Lich"},
			MapTimerStart {Name = "NorTimer"},
			MapFlagSetTrue{Name = "mf_P702_NorAgain"},
			FigureOutcry	{TextTag = "NorCry04", Tag = "Lich"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_Time_Reset_VHard2",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			MapTimerIsElapsed	{Name = "NorTimer", Seconds = 8},
			MapFlagIsTrue{Name = "mf_P702_NorAgain"},
			SetUpdateInterval	{Steps = 11},
		},
		Actions = 
		{
			DaytimeChange {Minutes = 1},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Nor_Time_Reset_VHard3",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			MapTimerIsElapsed	{Name = "NorTimer", Seconds = 10},
			MapFlagIsTrue{Name = "mf_P702_NorAgain"},
			SetUpdateInterval	{Steps = 13},
		},
		Actions = 
		{
			MapTimerStop {Name = "NorTimer"},
			
			MapTimerStart {Name = "NorTimer"},
			--VisualTimerStop	{},
			--VisualTimerStart	{Seconds = vVNTimer2},
			FigureOutcry	{TextTag = "NorCry05", Tag = "pl_HumanAvatar"},
			
			
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_End_D123",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 13},
			QuestIsActive {Player = "default", Quest = "SS_NOR"},
			MapTimerIsElapsed	{Name = "NorTimer", Seconds = vVisualNorTimer },
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_NorEnd"},
			--FigureOutcry	{TextTag = "NorCry02", Tag = "pl_HumanAvatar"},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-boss1" , Level = NorEnemy.Boss1.Lev , UnitId = NorEnemy.Boss1.ID , TargetTag = "ggroup_1", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-boss2" , Level = NorEnemy.Boss1.Lev , UnitId = NorEnemy.Boss1.ID , TargetTag = "ggroup_2", PlayerKit = "pk_undead"},},
			NoSpawnEffect	{Spawn = FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-boss3" , Level = NorEnemy.Boss1.Lev , UnitId = NorEnemy.Boss1.ID , TargetTag = "ggroup_3", PlayerKit = "pk_undead"},},
			FigureTeamTransfer	{Tag = "rts_Undead-boss1", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-boss2", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-boss3", Team = "tm_Undead"},
			FigureAttackEntity	{Tag = "rts_Undead-boss1", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_Undead-boss2", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_Undead-boss3", TargetTag = "pl_HumanAvatar"},
			MapFlagSetTrue{Name = "mf_P702_NorBoss"},
			MapFlagSetFalse{Name = "mf_P702_NorBoss_kill"},
			EventReEnable	{Name = "Nor_Boss_KO"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor_End_D4",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 11},
			QuestIsActive {Player = "default", Quest = "SS_NOR"},
			MapTimerIsElapsed	{Name = "NorTimer", Seconds = vVNTimer2 },
			GameDifficulty {Value = 4},
			MapFlagIsTrue{Name = "mf_P702_NorAgain"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_NorEnd"},
			--FigureOutcry	{TextTag = "NorCry02", Tag = "pl_HumanAvatar"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "rts_Undead-boss1" , Level = NorEnemy.Boss4.Lev , UnitId = NorEnemy.Boss4.ID , TargetTag = "ggroup_3", Team = "tm_Undead"},},

			FigureRunToEntity	{Tag = "rts_Undead-boss1", TargetTag = "mrk_lich"},

			MapFlagSetTrue{Name = "mf_P702_NorBoss"},
			MapFlagSetFalse{Name = "mf_P702_NorBoss_kill"},
			EventReEnable	{Name = "Nor_Boss_KO"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "LichDirection",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			FigureIsInRangeToEntity	{Tag = "rts_Undead-boss1", TargetTag = "mrk_lich", Range = 1},
			SetUpdateInterval	{Steps = 19},
		},
		Actions = 
		{
			FigureStop	{Tag = "rts_Undead-boss1"},
			FigureDirectionSet	{Tag = "rts_Undead-boss1", Direction = 180},
		},
		GotoState = self,
	};



	OnOneTimeEvent
	{
		EventName = "Nor_Boss_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue	{Name = "mf_P702_NorBoss"},
			FigureIsDead	{Tag = "rts_Undead-boss1"},
			FigureIsDead	{Tag = "rts_Undead-boss2"},
			FigureIsDead	{Tag = "rts_Undead-boss3"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_NorBoss_kill"},
			MapFlagSetTrue	{Name = "mf_P702_Rewards_monster_04"},
		},
		GotoState = self,
	};



	OnOneTimeRepeatEvent
	{
		EventName = "Nor_Easy_HealTimer",
		Name = "Nor_Easy_HealTimer",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			--FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "NorHealer", Range = 10},
			GameDifficulty {Value = 1},
			MapTimerIsElapsed	{Name = "NorHealTimer", Seconds = 31},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			--FigureHealthAdd	{Tag = "pl_HumanAvatar", Percent = 10},
			MapTimerStop	{Name = "NorHealTimer"},
			MapFlagSetFalse{Name = "mf_P702_NorAvatarHealed"},
			MapFlagSetFalse{Name = "mf_P702_NorCaineHealed"},
			MapFlagSetFalse{Name = "mf_P702_NorHeroFirstHealed"},
			MapTimerStart	{Name = "NorHealTimer"},
			EventReEnable	{Name = "Nor_Easy_HealTimer"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Nor Easy Heal: Avatar",
		Name = "Nor_Easy_Heal_Avatar",
		Conditions = 
		{
			GameDifficulty {Value = 1},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "NorHealer", Range = 8},
			MapTimerIsElapsed	{Name = "NorHealTimer", Seconds = 30},
			MapFlagIsFalse{Name = "mf_P702_NorAvatarHealed"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureHealthAdd	{Tag = "pl_HumanAvatar", Percent = 10},
			MapFlagSetTrue{Name = "mf_P702_NorAvatarHealed"},
			EventReEnable	{Name = "Nor_Easy_Heal_Avatar"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Nor Easy Heal: Caine",
		Name = "Nor_Easy_Heal_Caine",
		Conditions = 
		{
			GameDifficulty {Value = 1},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "NorHealer", Range = 8},
			MapTimerIsElapsed	{Name = "NorHealTimer", Seconds = 30},
			MapFlagIsFalse{Name = "mf_P702_NorCaineHealed"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureHealthAdd	{Tag = "pl_HumanHeroCaine", Percent = 10},
			MapFlagSetTrue{Name = "mf_P702_NorCaineHealed"},
			EventReEnable	{Name = "Nor_Easy_Heal_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Nor Easy Heal: HeroFirst",
		Name = "Nor_Easy_Heal_HeroFirst",
		Conditions = 
		{
			GameDifficulty {Value = 1},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "NorHealer", Range = 8},
			MapTimerIsElapsed	{Name = "NorHealTimer", Seconds = 30},
			MapFlagIsFalse{Name = "mf_P702_NorHeroFirstHealed"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			FigureHealthAdd	{Tag = "pl_HumanHeroFirst", Percent = 10},
			MapFlagSetTrue{Name = "mf_P702_NorHeroFirstHealed"},
			EventReEnable	{Name = "Nor_Easy_Heal_HeroFirst"},
		},
		GotoState = self,
	};

	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_1",
		Name = "Penta_1",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00b", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00c", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00d", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00e", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00f", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00g", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00h", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00i", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01b", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01c", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01d", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02b", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02c", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02d", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03b", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03c", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03d", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04b", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05b", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06a", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06b", TargetTag = "n01", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06c", TargetTag = "n01", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-07a", TargetTag = "n01", Range = 1.5},
			},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1587, TargetTag = "n01", Direction = 0, Tag = "fire01"},
			MapFlagSetTrue	{Name = "mf_P702_n01"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Penta_2",
		Name = "Penta_2",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00b", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00c", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00d", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00e", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00f", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00g", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00h", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00i", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01b", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01c", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01d", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02b", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02c", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02d", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03b", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03c", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03d", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04b", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05b", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06a", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06b", TargetTag = "n02", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06c", TargetTag = "n02", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-07a", TargetTag = "n02", Range = 1.5},
			},
			MapFlagIsTrue	{Name = "mf_P702_n01"},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1587, TargetTag = "n02", Direction = 0, Tag = "fire02"},
			MapFlagSetTrue	{Name = "mf_P702_n02"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Penta_3",
		Name = "Penta_3",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00b", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00c", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00d", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00e", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00f", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00g", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00h", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00i", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01b", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01c", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01d", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02b", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02c", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02d", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03b", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03c", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03d", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04b", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05b", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06a", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06b", TargetTag = "n03", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06c", TargetTag = "n03", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-07a", TargetTag = "n03", Range = 1.5},
			},
			MapFlagIsTrue	{Name = "mf_P702_n02"},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1587, TargetTag = "n03", Direction = 0, Tag = "fire03"},
			MapFlagSetTrue	{Name = "mf_P702_n03"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_4",
		Name = "Penta_4",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00b", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00c", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00d", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00e", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00f", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00g", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00h", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00i", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01b", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01c", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01d", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02b", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02c", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02d", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03b", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03c", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03d", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04b", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05b", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06a", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06b", TargetTag = "n04", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06c", TargetTag = "n04", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-07a", TargetTag = "n04", Range = 1.5},
			},
			MapFlagIsTrue	{Name = "mf_P702_n03"},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1587, TargetTag = "n04", Direction = 0, Tag = "fire04"},
			MapFlagSetTrue	{Name = "mf_P702_n04"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_5",
		Name = "Penta_5",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00b", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00c", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00d", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00e", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00f", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00g", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00h", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-00i", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01b", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01c", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-01d", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02b", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02c", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-02d", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03b", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03c", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-03d", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-04b", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-05b", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06a", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06b", TargetTag = "n05", Range = 1.5},
				FigureIsInRangeToEntity	{Tag = "rts_Undead-06c", TargetTag = "n05", Range = 1.5},
				
				FigureIsInRangeToEntity	{Tag = "rts_Undead-07a", TargetTag = "n05", Range = 1.5},
			},
			MapFlagIsTrue	{Name = "mf_P702_n04"},
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1587, TargetTag = "n05", Direction = 0, Tag = "fire05"},
			MapFlagSetTrue	{Name = "mf_P702_n05"},
			MapFlagSetTrue{Name = "mf_P702_NorPentaFirstActive"},
			MapTimerStart	{Name = "NorPentaTimer"},
			ObjectVanish	{Tag = "NorCenterTree"},
			ObjectVanish	{Tag = "norblock-01"},
			ObjectVanish	{Tag = "norblock-02"},
			ObjectVanish	{Tag = "norblock-03"},
			ObjectVanish	{Tag = "norblock-04"},
			ObjectVanish	{Tag = "norblock-05"},
			ObjectSpawnToEntity	{ObjectId = 1957, TargetTag = "NorCenter", Direction = 0, Tag = "SpawnFireGreen"},
			ObjectSpawnToEntity	{ObjectId = 1958, TargetTag = "NorCenter", Direction = 0, Tag = "SpawnFireBlue"},
			ObjectSpawnToEntity	{ObjectId = 1959, TargetTag = "NorCenter", Direction = 0, Tag = "SpawnFireRed"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_magic_fire_1",
		Name = "Penta_magic_fire_1",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapTimerIsElapsed	{Name = "NorPentaTimer", Seconds = 3},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
		},
		Actions = 
		{			
			ObjectVanish	{Tag = "SpawnFireGreen"},			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_magic_fire_2",
		Name = "Penta_magic_fire_2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapTimerIsElapsed	{Name = "NorPentaTimer", Seconds = 6},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
		},
		Actions = 
		{			
			ObjectVanish	{Tag = "SpawnFireBlue"},			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_magic_fire_3",
		Name = "Penta_magic_fire_3",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			MapTimerIsElapsed	{Name = "NorPentaTimer", Seconds = 9},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
		},
		Actions = 
		{			
			ObjectVanish	{Tag = "SpawnFireRed"},
			ObjectVanish	{Tag = "fire01"},
			ObjectVanish	{Tag = "fire02"},
			ObjectVanish	{Tag = "fire03"},
			ObjectVanish	{Tag = "fire04"},
			ObjectVanish	{Tag = "fire05"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_Mass_Spawn_5s_Effect",
		Name = "Penta_Mass_Spawn_5s_Effect",
		Conditions = 
		{
			OR
			{
				MapTimerIsElapsed	{Name = "NorPentaTimer", Seconds = 89},
				MapFlagIsTrue{Name = "mf_P702_NorPentaFirstActive"},
			},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
			MapFlagIsTrue	{Name = "mf_P702_n05"},
			SetUpdateInterval	{Steps = 11},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorPentaFirstActive"},
			EffectStart	{Tag = "NorPentaCentre", File = "Effect_AreaDecay_Impact"},
			EffectStart	{Tag = "NorPentaCentre", File = "Effect_Building_Darkness"},
			MapTimerStop	{Name = "NorPentaTimer"},
			MapTimerStart	{Name = "NorPentaEffectTimer"},
		},
		GotoState = self,
	};


	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Penta_mass_spawn_1",
		Name = "Penta_mass_spawn_1",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "NorPentaEffectTimer", Seconds = 5},
			MapFlagIsFalse{Name = "mf_P702_NorEnd"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "NorPentaEffectTimer"},
			EffectStop	{Tag = "NorPentaCentre"},
			EffectStop	{Tag = "NorPentaCentre"},
			--EffectStop	{Tag = "Effect_Building_Darkness"},
			--EffectStop	{Tag = "Effect_AreaDecay_Impact"},
			
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66a" , Level = NorEnemy.E660.Lev , UnitId = NorEnemy.E660.ID , TargetTag = "n01", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66b" , Level = NorEnemy.E660.Lev , UnitId = NorEnemy.E660.ID , TargetTag = "n02", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66c" , Level = NorEnemy.E660.Lev , UnitId = NorEnemy.E660.ID , TargetTag = "n03", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66d" , Level = NorEnemy.E660.Lev , UnitId = NorEnemy.E660.ID , TargetTag = "n04", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66e" , Level = NorEnemy.E660.Lev , UnitId = NorEnemy.E660.ID , TargetTag = "n05", PlayerKit = "pk_undead"},
			--FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66f" , Level = 2 , UnitId = 127, TargetTag = "n06", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66g" , Level = NorEnemy.E661.Lev , UnitId = NorEnemy.E661.ID , TargetTag = "n07", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66h" , Level = NorEnemy.E661.Lev , UnitId = NorEnemy.E661.ID , TargetTag = "n08", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66i" , Level = NorEnemy.E661.Lev , UnitId = NorEnemy.E661.ID , TargetTag = "n09", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66j" , Level = NorEnemy.E661.Lev , UnitId = NorEnemy.E661.ID , TargetTag = "n10", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66f" , Level = NorEnemy.E661.Lev , UnitId = NorEnemy.E661.ID , TargetTag = "n11", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66k" , Level = NorEnemy.E660.Lev , UnitId = NorEnemy.E660.ID , TargetTag = "NorCenter", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66l" , Level = NorEnemy.E661.Lev , UnitId = NorEnemy.E661.ID , TargetTag = "NorCenter", PlayerKit = "pk_undead"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_Undead-66m" , Level = NorEnemy.E662.Lev , UnitId = NorEnemy.E662.ID , TargetTag = "NorCenter", PlayerKit = "pk_undead"},
			
			FigureTeamTransfer	{Tag = "rts_Undead-66a", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66b", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66c", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66d", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66e", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66f", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66g", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66h", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66i", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66j", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66k", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66l", Team = "tm_Undead"},
			FigureTeamTransfer	{Tag = "rts_Undead-66m", Team = "tm_Undead"},
			
   		FigureAttackEntity	{Tag = "rts_Undead-66a", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66b", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66c", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66d", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66e", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66f", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66g", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66h", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66i", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66j", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66k", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66l", TargetTag = "pl_HumanAvatar"},
   		FigureAttackEntity	{Tag = "rts_Undead-66m", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P702_NorU-66"},
			MapFlagSetFalse {Name = "mf_P702_NorU-66_kill"},
			--MapTimerStop	{Name = "NorPentaTimer"},
			EventReEnable	{Name = "Penta_mass_spawn_KO"},
		},
	};
	

	OnOneTimeRepeatEvent
	{
		EventName = "Penta_mass_spawn_KO",
		Name = "Penta_mass_spawn_KO",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR"},
			MapFlagIsTrue{Name = "mf_P702_NorU-66"},
			FigureIsDead	{Tag = "rts_Undead-66a"},
			FigureIsDead	{Tag = "rts_Undead-66b"},
			FigureIsDead	{Tag = "rts_Undead-66c"},
			FigureIsDead	{Tag = "rts_Undead-66d"},
			FigureIsDead	{Tag = "rts_Undead-66e"},
			FigureIsDead	{Tag = "rts_Undead-66f"},
			FigureIsDead	{Tag = "rts_Undead-66g"},
			FigureIsDead	{Tag = "rts_Undead-66h"},
			FigureIsDead	{Tag = "rts_Undead-66i"},
			FigureIsDead	{Tag = "rts_Undead-66j"},
			FigureIsDead	{Tag = "rts_Undead-66k"},
			FigureIsDead	{Tag = "rts_Undead-66l"},
			FigureIsDead	{Tag = "rts_Undead-66m"},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_P702_NorU-66"},
			MapFlagSetTrue{Name = "mf_P702_NorU-66_kill"},
			MapTimerStart {Name = "NorPentaTimer"},
			EventReEnable	{Name = "Penta_mass_spawn_1"},
			EventReEnable	{Name = "Penta_Mass_Spawn_5s_Effect"},
		},
		-- GotoState = self,
	};

	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------




	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_Caine",
		Name = "Teleport_Nor_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_HeroFirst",
		Name = "Teleport_Nor_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_HeroSecond",
		Name = "Teleport_Nor_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_HeroThird",
		Name = "Teleport_Nor_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_HeroOrc",
		Name = "Teleport_Nor_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_CompanionCraigHuman",
		Name = "Teleport_Nor_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Nor_CompanionSariel",
		Name = "Teleport_Nor_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "NorCenter", Range = 90},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "NorCenter", Range = 90},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Nor_CompanionSariel"},
		},
		GotoState = self,
	};
	
}