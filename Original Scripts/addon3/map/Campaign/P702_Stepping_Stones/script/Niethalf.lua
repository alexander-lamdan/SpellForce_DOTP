----------------------------------------------------------
---- 05: Niethalf, god of the forging and the dwarves ----
----------------------------------------------------------

State
{
	StateName = "INIT",
	
	--Game over when all of the darwes died
	
	OnOneTimeEvent
	{
		EventName = "GameOver - every dwarves died",
		Conditions = 
		{
			FigureIsDead	{Tag = "al_nf_01"},
			FigureIsDead	{Tag = "al_nf_02"},
			FigureIsDead	{Tag = "al_nf_03"},
			FigureIsDead	{Tag = "al_nf_04"},
			FigureIsDead	{Tag = "al_nf_05"},
			FigureIsDead	{Tag = "al_nf_06"},
			FigureIsDead	{Tag = "al_nf_07"},
			FigureIsDead	{Tag = "al_nf_08"},
			SetUpdateInterval	{Steps = 50},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
	},
			
	
	
	OnOneTimeEvent
	{
		EventName = "Niethalf init",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_NiethalfAccepted"},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{

			--ObjectChange	{Tag = "mother_load", ObjectId = 2464, X = 464, Y = 66, Direction = 110},
			
			ObjectSpawn	{ObjectId = 2463, X = 463, Y = 68, Direction = 358, Tag = "ml1"},
			ObjectSpawn	{ObjectId = 2463, X = 463, Y = 65.5, Direction = 193, Tag = "ml2"},
			ObjectSpawn	{ObjectId = 2463, X = 462.5, Y = 63, Direction = 124, Tag = "ml3"},
			ObjectSpawn	{ObjectId = 2463, X = 465, Y = 63, Direction = 243, Tag = "ml4"},
			ObjectSpawn	{ObjectId = 2463, X = 464, Y = 66, Direction = 211, Tag = "mother_load"},
			ObjectLootItemGenericAdd	{Tag = "mother_load", DropChance = 100, Level = 9, Skill = 6},
			
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_01", Level = Nh.E01.L1 , UnitId = Nh.E01.ID , X = 388, Y = 88, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_02", Level = Nh.E02.L1 , UnitId = Nh.E02.ID , X = 409, Y = 126, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_03", Level = Nh.E03.L1 , UnitId = Nh.E03.ID , X = 424, Y = 72, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_04", Level = Nh.E04.L1 , UnitId = Nh.E04.ID , X = 419, Y = 65, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_05", Level = Nh.E05.L1 , UnitId = Nh.E05.ID , X = 447, Y = 118, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_06", Level = Nh.E06.L1 , UnitId = Nh.E06.ID , X = 452, Y = 117, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_07", Level = Nh.E07.L1 , UnitId = Nh.E07.ID , X = 459, Y = 33, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_08", Level = Nh.E08.L1 , UnitId = Nh.E08.ID , X = 462, Y = 30, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_09", Level = Nh.E09.L1 , UnitId = Nh.E09.ID , X = 478, Y = 76, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_10", Level = Nh.E10.L1 , UnitId = Nh.E10.ID , X = 483, Y = 58, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_11", Level = Nh.E11.L1 , UnitId = Nh.E11.ID , X = 480, Y = 67, Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "Niklor", Level = Nh.Boss.L1 , UnitId = Nh.Boss.ID , X = 466, Y = 66, Team = "tm_Creep"},},
			FigureDirectionSet	{Tag = "en_nf_01", Direction = 0},
			FigureDirectionSet	{Tag = "en_nf_02", Direction = 320},
			FigureDirectionSet	{Tag = "en_nf_03", Direction = 245},
			FigureDirectionSet	{Tag = "en_nf_04", Direction = 185},
			FigureDirectionSet	{Tag = "en_nf_05", Direction = 348},
			FigureDirectionSet	{Tag = "en_nf_06", Direction = 300},
			FigureDirectionSet	{Tag = "en_nf_07", Direction = 300},
			FigureDirectionSet	{Tag = "en_nf_08", Direction = 228},
			FigureDirectionSet	{Tag = "en_nf_09", Direction = 222},
			FigureDirectionSet	{Tag = "en_nf_10", Direction = 10},
			FigureDirectionSet	{Tag = "en_nf_11", Direction = 308},
			FigureRoamingEnable	{Tag = "en_nf_02"},
			FigureRoamingEnable	{Tag = "en_nf_05"},
			FigureRoamingEnable	{Tag = "en_nf_06"},
			FigureRoamingEnable	{Tag = "en_nf_07"},
			FigureRoamingEnable	{Tag = "en_nf_08"},
			FigureRoamingEnable	{Tag = "en_nf_11"},
			
			FigurePlayerTransfer	{Tag = "al_nf_01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_04", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_05", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_06", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_07", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "al_nf_08", Player = "pl_Human"},

			MapFlagSetTrue	{Name = "mf_P702_NiethalfDiffInit"},
		},
		-- GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "DiffInit-1",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 19},
			MapFlagIsTrue{Name = "mf_P702_NiethalfDiffInit"},
			GameDifficulty {Value = 1},
		},
		Actions = 
		{
			
			FigureUnitChange	{Tag = "en_nf_01", UnitId = Nh.E01.ID , Level = Nh.E01.L1 },
			FigureUnitChange	{Tag = "en_nf_02", UnitId = Nh.E02.ID , Level = Nh.E02.L1 },
			FigureUnitChange	{Tag = "en_nf_03", UnitId = Nh.E03.ID , Level = Nh.E03.L1 },
			FigureUnitChange	{Tag = "en_nf_04", UnitId = Nh.E04.ID , Level = Nh.E04.L1 },
			FigureUnitChange	{Tag = "en_nf_05", UnitId = Nh.E05.ID , Level = Nh.E05.L1 },
			FigureUnitChange	{Tag = "en_nf_06", UnitId = Nh.E06.ID , Level = Nh.E06.L1 },
			FigureUnitChange	{Tag = "en_nf_07", UnitId = Nh.E07.ID , Level = Nh.E07.L1 },
			FigureUnitChange	{Tag = "en_nf_08", UnitId = Nh.E08.ID , Level = Nh.E08.L1 },
			FigureUnitChange	{Tag = "en_nf_09", UnitId = Nh.E09.ID , Level = Nh.E09.L1 },
			FigureUnitChange	{Tag = "en_nf_10", UnitId = Nh.E10.ID , Level = Nh.E10.L1 },
			FigureUnitChange	{Tag = "en_nf_11", UnitId = Nh.E11.ID , Level = Nh.E11.L1 },
			
			FigureUnitChange	{Tag = "al_nf_01", UnitId = Nh.A05.ID , Level = Nh.A05.L1 },
			FigureUnitChange	{Tag = "al_nf_02", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			FigureUnitChange	{Tag = "al_nf_03", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			FigureUnitChange	{Tag = "al_nf_04", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			FigureUnitChange	{Tag = "al_nf_05", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			FigureUnitChange	{Tag = "al_nf_06", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			FigureUnitChange	{Tag = "al_nf_07", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			FigureUnitChange	{Tag = "al_nf_08", UnitId = Nh.A01.ID , Level = Nh.A01.L1 },
			
			FigureLootItemGenericAdd	{Tag = "en_nf_01", DropChance = 100, Level = 9, Skill = 42},
			FigureLootItemGenericAdd	{Tag = "en_nf_02", DropChance = 100, Level = 10, Skill = 9},
			FigureLootItemGenericAdd	{Tag = "en_nf_04", DropChance = 100, Level = 9, Skill = 75},
			FigureLootItemGenericAdd	{Tag = "en_nf_06", DropChance = 100, Level = 10, Skill = 78},
			FigureLootItemGenericAdd	{Tag = "en_nf_08", DropChance = 100, Level = 9, Skill = 111},
			FigureLootItemGenericAdd	{Tag = "en_nf_11", DropChance = 100, Level = 10, Skill = 150},
			
			MapFlagSetTrue	{Name = "mf_P702_NiethalfInitDone"},
			MapFlagSetFalse	{Name = "mf_P702_NiethalfDiffInit"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "DiffInit-2",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 19},
			MapFlagIsTrue{Name = "mf_P702_NiethalfDiffInit"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			
			FigureUnitChange	{Tag = "en_nf_01", UnitId = Nh.E01.ID , Level = Nh.E01.L2 },
			FigureUnitChange	{Tag = "en_nf_02", UnitId = Nh.E02.ID , Level = Nh.E02.L2 },
			FigureUnitChange	{Tag = "en_nf_03", UnitId = Nh.E03.ID , Level = Nh.E03.L2 },
			FigureUnitChange	{Tag = "en_nf_04", UnitId = Nh.E04.ID , Level = Nh.E04.L2 },
			FigureUnitChange	{Tag = "en_nf_05", UnitId = Nh.E05.ID , Level = Nh.E05.L2 },
			FigureUnitChange	{Tag = "en_nf_06", UnitId = Nh.E06.ID , Level = Nh.E06.L2 },
			FigureUnitChange	{Tag = "en_nf_07", UnitId = Nh.E07.ID , Level = Nh.E07.L2 },
			FigureUnitChange	{Tag = "en_nf_08", UnitId = Nh.E08.ID , Level = Nh.E08.L2 },
			FigureUnitChange	{Tag = "en_nf_09", UnitId = Nh.E09.ID , Level = Nh.E09.L2 },
			FigureUnitChange	{Tag = "en_nf_10", UnitId = Nh.E10.ID , Level = Nh.E10.L2 },
			FigureUnitChange	{Tag = "en_nf_11", UnitId = Nh.E11.ID , Level = Nh.E11.L2 },
			
			FigureUnitChange	{Tag = "al_nf_01", UnitId = Nh.A05.ID , Level = Nh.A05.L2 },
			FigureUnitChange	{Tag = "al_nf_02", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			FigureUnitChange	{Tag = "al_nf_03", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			FigureUnitChange	{Tag = "al_nf_04", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			FigureUnitChange	{Tag = "al_nf_05", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			FigureUnitChange	{Tag = "al_nf_06", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			FigureUnitChange	{Tag = "al_nf_07", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			FigureUnitChange	{Tag = "al_nf_08", UnitId = Nh.A01.ID , Level = Nh.A01.L2 },
			
			FigureLootItemGenericAdd	{Tag = "en_nf_01", DropChance = 90, Level = 9, Skill = 42},
			FigureLootItemGenericAdd	{Tag = "en_nf_02", DropChance = 90, Level = 10, Skill = 9},
			FigureLootItemGenericAdd	{Tag = "en_nf_04", DropChance = 90, Level = 9, Skill = 75},
			FigureLootItemGenericAdd	{Tag = "en_nf_06", DropChance = 90, Level = 10, Skill = 78},
			FigureLootItemGenericAdd	{Tag = "en_nf_08", DropChance = 90, Level = 9, Skill = 111},
			FigureLootItemGenericAdd	{Tag = "en_nf_11", DropChance = 90, Level = 10, Skill = 150},
			
			MapFlagSetTrue	{Name = "mf_P702_NiethalfInitDone"},
			MapFlagSetFalse	{Name = "mf_P702_NiethalfDiffInit"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "DiffInit-3",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 19},
			MapFlagIsTrue{Name = "mf_P702_NiethalfDiffInit"},
			GameDifficulty {Value = 3},
		},
		Actions = 
		{
			
			FigureUnitChange	{Tag = "en_nf_01", UnitId = Nh.E01.ID , Level = Nh.E01.L3 },
			FigureUnitChange	{Tag = "en_nf_02", UnitId = Nh.E02.ID , Level = Nh.E02.L3 },
			FigureUnitChange	{Tag = "en_nf_03", UnitId = Nh.E03.ID , Level = Nh.E03.L3 },
			FigureUnitChange	{Tag = "en_nf_04", UnitId = Nh.E04.ID , Level = Nh.E04.L3 },
			FigureUnitChange	{Tag = "en_nf_05", UnitId = Nh.E05.ID , Level = Nh.E05.L3 },
			FigureUnitChange	{Tag = "en_nf_06", UnitId = Nh.E06.ID , Level = Nh.E06.L3 },
			FigureUnitChange	{Tag = "en_nf_07", UnitId = Nh.E07.ID , Level = Nh.E07.L3 },
			FigureUnitChange	{Tag = "en_nf_08", UnitId = Nh.E08.ID , Level = Nh.E08.L3 },
			FigureUnitChange	{Tag = "en_nf_09", UnitId = Nh.E09.ID , Level = Nh.E09.L3 },
			FigureUnitChange	{Tag = "en_nf_10", UnitId = Nh.E10.ID , Level = Nh.E10.L3 },
			FigureUnitChange	{Tag = "en_nf_11", UnitId = Nh.E11.ID , Level = Nh.E11.L3 },
			
			FigureUnitChange	{Tag = "al_nf_01", UnitId = Nh.A05.ID , Level = Nh.A05.L3 },
			FigureUnitChange	{Tag = "al_nf_02", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			FigureUnitChange	{Tag = "al_nf_03", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			FigureUnitChange	{Tag = "al_nf_04", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			FigureUnitChange	{Tag = "al_nf_05", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			FigureUnitChange	{Tag = "al_nf_06", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			FigureUnitChange	{Tag = "al_nf_07", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			FigureUnitChange	{Tag = "al_nf_08", UnitId = Nh.A01.ID , Level = Nh.A01.L3 },
			
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "en_nf_12", Level = Nh.E12.L3 , UnitId = Nh.E12.ID , TargetTag = "mrk_NiethalfHard1", Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "en_nf_13", Level = Nh.E13.L3 , UnitId = Nh.E13.ID , TargetTag = "mrk_NiethalfHard1", Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_16", Level = Nh.E16.L3 , UnitId = Nh.E16.ID , X = 469, Y = 66, Team = "tm_Creep"},},
			FigureDirectionSet	{Tag = "en_nf_16", Direction = 100},
			
			FigureLootItemGenericAdd	{Tag = "en_nf_01", DropChance = 70, Level = 9, Skill = 42},
			FigureLootItemGenericAdd	{Tag = "en_nf_02", DropChance = 70, Level = 10, Skill = 9},
			FigureLootItemGenericAdd	{Tag = "en_nf_04", DropChance = 70, Level = 9, Skill = 75},
			FigureLootItemGenericAdd	{Tag = "en_nf_06", DropChance = 70, Level = 10, Skill = 78},
			FigureLootItemGenericAdd	{Tag = "en_nf_08", DropChance = 70, Level = 9, Skill = 111},
			FigureLootItemGenericAdd	{Tag = "en_nf_11", DropChance = 70, Level = 10, Skill = 150},
			FigureLootItemGenericAdd	{Tag = "en_nf_12", DropChance = 70, Level = 10, Skill = 11},
			
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en1m1"},
			MapFlagSetTrue	{Name = "mf_P702_NiethalfInitDone"},
			MapFlagSetFalse	{Name = "mf_P702_NiethalfDiffInit"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "DiffInit-4",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 19},
			MapFlagIsTrue{Name = "mf_P702_NiethalfDiffInit"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			
			FigureUnitChange	{Tag = "en_nf_01", UnitId = Nh.E01.ID , Level = Nh.E01.L4 },
			FigureUnitChange	{Tag = "en_nf_02", UnitId = Nh.E02.ID , Level = Nh.E02.L4 },
			FigureUnitChange	{Tag = "en_nf_03", UnitId = Nh.E03.ID , Level = Nh.E03.L4 },
			FigureUnitChange	{Tag = "en_nf_04", UnitId = Nh.E04.ID , Level = Nh.E04.L4 },
			FigureUnitChange	{Tag = "en_nf_05", UnitId = Nh.E05.ID , Level = Nh.E05.L4 },
			FigureUnitChange	{Tag = "en_nf_06", UnitId = Nh.E06.ID , Level = Nh.E06.L4 },
			FigureUnitChange	{Tag = "en_nf_07", UnitId = Nh.E07.ID , Level = Nh.E07.L4 },
			FigureUnitChange	{Tag = "en_nf_08", UnitId = Nh.E08.ID , Level = Nh.E08.L4 },
			FigureUnitChange	{Tag = "en_nf_09", UnitId = Nh.E09.ID , Level = Nh.E09.L4 },
			FigureUnitChange	{Tag = "en_nf_10", UnitId = Nh.E10.ID , Level = Nh.E10.L4 },
			FigureUnitChange	{Tag = "en_nf_11", UnitId = Nh.E11.ID , Level = Nh.E11.L4 },
			FigureUnitChange	{Tag = "en_nf_12", UnitId = Nh.E12.ID , Level = Nh.E12.L4 },
			FigureUnitChange	{Tag = "en_nf_13", UnitId = Nh.E13.ID , Level = Nh.E13.L4 },
			FigureUnitChange	{Tag = "en_nf_16", UnitId = Nh.E16.ID , Level = Nh.E16.L4 },
			
			FigureUnitChange	{Tag = "al_nf_01", UnitId = Nh.A05.ID , Level = Nh.A05.L4 },
			FigureUnitChange	{Tag = "al_nf_02", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			FigureUnitChange	{Tag = "al_nf_03", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			FigureUnitChange	{Tag = "al_nf_04", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			FigureUnitChange	{Tag = "al_nf_05", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			FigureUnitChange	{Tag = "al_nf_06", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			FigureUnitChange	{Tag = "al_nf_07", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			FigureUnitChange	{Tag = "al_nf_08", UnitId = Nh.A01.ID , Level = Nh.A01.L4 },
			
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "en_nf_12", Level = Nh.E12.L4 , UnitId = Nh.E12.ID , TargetTag = "mrk_NiethalfHard1", Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "en_nf_13", Level = Nh.E13.L4 , UnitId = Nh.E13.ID , TargetTag = "mrk_NiethalfHard1", Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "en_nf_14", Level = Nh.E14.L4 , UnitId = Nh.E14.ID , TargetTag = "mrk_NiethalfHard3", Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "en_nf_15", Level = Nh.E15.L4 , UnitId = Nh.E15.ID , TargetTag = "mrk_NiethalfHard3", Team = "tm_Creep"},},
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "en_nf_16", Level = Nh.E16.L4 , UnitId = Nh.E16.ID , X = 469, Y = 66, Team = "tm_Creep"},},
			FigureDirectionSet	{Tag = "en_nf_16", Direction = 100},
			
			FigureLootItemGenericAdd	{Tag = "en_nf_01", DropChance = 50, Level = 9, Skill = 42},
			FigureLootItemGenericAdd	{Tag = "en_nf_02", DropChance = 50, Level = 10, Skill = 9},
			FigureLootItemGenericAdd	{Tag = "en_nf_04", DropChance = 50, Level = 9, Skill = 75},
			FigureLootItemGenericAdd	{Tag = "en_nf_06", DropChance = 50, Level = 10, Skill = 78},
			FigureLootItemGenericAdd	{Tag = "en_nf_08", DropChance = 50, Level = 9, Skill = 111},
			FigureLootItemGenericAdd	{Tag = "en_nf_11", DropChance = 50, Level = 10, Skill = 150},
			FigureLootItemGenericAdd	{Tag = "en_nf_12", DropChance = 50, Level = 10, Skill = 11},
			FigureLootItemGenericAdd	{Tag = "en_nf_14", DropChance = 50, Level = 12, Skill = 44},
			
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en1m1"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en2m3"},
			MapFlagSetTrue	{Name = "mf_P702_NiethalfInitDone"},
			MapFlagSetFalse	{Name = "mf_P702_NiethalfDiffInit"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Niethal outcry: No Dwarves",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_NIETHALF"},
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "pl_HumanHeroCaine", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "pl_HumanHeroFirst", Range = 15, X = 480, Y = 67},
			},
			FigureIsNotInRange	{Tag = "al_nf_01", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_02", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_03", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_04", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_05", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_06", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_07", Range = 15, X = 480, Y = 67},
			FigureIsNotInRange	{Tag = "al_nf_08", Range = 15, X = 480, Y = 67},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "NiethalfCry01", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};	
	
	OnOneTimeRepeatEvent
	{
		EventName = "en12_A",
		Name = "en12_A",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en1m1"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard1", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard1", Range = 3 },
			},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
			
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en1m1"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en1m2"},
			FigureWalkToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard2"},
			FigureWalkToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard2"},
			EventReEnable	{Name = "en12_B"},
			
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "en12_B",
		Name = "en12_B",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en1m2"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard2", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard2", Range = 3 },
			},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
			
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en1m2"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en1m3"},
			FigureWalkToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard3"},
			FigureWalkToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard3"},
			EventReEnable	{Name = "en12_C"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "en12_C",
		Name = "en12_C",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en1m3"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard3", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard3", Range = 3 },
			},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en1m3"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en1m4"},
			FigureWalkToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard4"},
			FigureWalkToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard4"},
			EventReEnable	{Name = "en12_D"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "en12_D",
		Name = "en12_D",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en1m4"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard4", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard4", Range = 3 },
			},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en1m4"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en1m1"},
			FigureWalkToEntity	{Tag = "en_nf_12", TargetTag = "mrk_NiethalfHard1"},
			FigureWalkToEntity	{Tag = "en_nf_13", TargetTag = "mrk_NiethalfHard1"},
			EventReEnable	{Name = "en12_A"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "en14_A",
		Name = "en14_A",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en2m3"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_14", TargetTag = "mrk_NiethalfHard3", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_15", TargetTag = "mrk_NiethalfHard3", Range = 3 },
			},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en2m3"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en2m5"},
			FigureWalkToEntity	{Tag = "en_nf_14", TargetTag = "mrk_NiethalfHard5"},
			FigureWalkToEntity	{Tag = "en_nf_15", TargetTag = "mrk_NiethalfHard5"},
			EventReEnable	{Name = "en14_B"},
			
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "en14_B",
		Name = "en14_B",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en2m5"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_14", TargetTag = "mrk_NiethalfHard5", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_15", TargetTag = "mrk_NiethalfHard5", Range = 3 },
			},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en2m5"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en2m4"},
			FigureWalkToEntity	{Tag = "en_nf_14", TargetTag = "mrk_NiethalfHard4"},
			FigureWalkToEntity	{Tag = "en_nf_15", TargetTag = "mrk_NiethalfHard4"},
			EventReEnable	{Name = "en14_C"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "en14_C",
		Name = "en14_C",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			MapFlagIsTrue	{Name = "mf_P702_Niethalf_en2m4"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "en_nf_14", TargetTag = "mrk_NiethalfHard4", Range = 3 },
				FigureIsInRangeToEntity	{Tag = "en_nf_15", TargetTag = "mrk_NiethalfHard4", Range = 3 },
			},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Niethalf_en2m4"},
			MapFlagSetTrue	{Name = "mf_P702_Niethalf_en2m3"},
			FigureWalkToEntity	{Tag = "en_nf_14", TargetTag = "mrk_NiethalfHard3"},
			FigureWalkToEntity	{Tag = "en_nf_15", TargetTag = "mrk_NiethalfHard3"},
			EventReEnable	{Name = "en14_A"},
			
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Achievement - Niethalf",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SS_NIETHALF"},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
			FigureIsAlive	{Tag = "al_nf_01"},
			FigureIsAlive	{Tag = "al_nf_02"},
			FigureIsAlive	{Tag = "al_nf_03"},
			FigureIsAlive	{Tag = "al_nf_04"},
			FigureIsAlive	{Tag = "al_nf_05"},
			FigureIsAlive	{Tag = "al_nf_06"},
			FigureIsAlive	{Tag = "al_nf_07"},
			FigureIsAlive	{Tag = "al_nf_08"},
			SetUpdateInterval	{Steps = 50},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P702_Niethalf1_Completed"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Niethalf Quest End",
		Conditions = 
		{
			QuestIsActive {Player = "default", Quest = "SS_NIETHALF"},
			MapFlagIsTrue{Name = "mf_P702_NiethalfInitDone"},
			FigureIsDead	{Tag = "en_nf_01"},
			FigureIsDead	{Tag = "en_nf_02"},
			FigureIsDead	{Tag = "en_nf_03"},
			FigureIsDead	{Tag = "en_nf_04"},
			FigureIsDead	{Tag = "en_nf_05"},
			FigureIsDead	{Tag = "en_nf_06"},
			FigureIsDead	{Tag = "en_nf_07"},
			FigureIsDead	{Tag = "en_nf_08"},
			FigureIsDead	{Tag = "en_nf_09"},
			FigureIsDead	{Tag = "en_nf_10"},
			FigureIsDead	{Tag = "en_nf_11"},
			FigureIsDead	{Tag = "en_nf_12"},
			FigureIsDead	{Tag = "en_nf_13"},
			FigureIsDead	{Tag = "en_nf_14"},
			FigureIsDead	{Tag = "en_nf_15"},
			FigureIsDead	{Tag = "en_nf_16"},
			FigureIsDead	{Tag = "Niklor"},
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "pl_HumanHeroCaine", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "pl_HumanHeroFirst", Range = 15, X = 480, Y = 67},
			},
			OR
			{
				FigureIsInRange	{Tag = "al_nf_01", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_02", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_03", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_04", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_05", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_06", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_07", Range = 15, X = 480, Y = 67},
				FigureIsInRange	{Tag = "al_nf_08", Range = 15, X = 480, Y = 67},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "NiethalfCry02", Tag = "pl_HumanHeroCaine"},
			FigurePlayerTransfer	{Tag = "al_nf_01", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_02", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_03", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_04", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_05", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_06", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_07", Player = "pl_Niethalf"},
			FigurePlayerTransfer	{Tag = "al_nf_08", Player = "pl_Niethalf"},
			FigureOutcry	{TextTag = "TrialCry01", Tag = "Trialmaster"},
			FigureOutcry	{TextTag = "NiethalfCry03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "TrialCry02", Tag = "Trialmaster"},
			MapTimerStart	{Name = "NiethalfQuestEndTimer"},
		},
		GotoState = self,
	};




	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_Caine",
		Name = "Teleport_Niethalf_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_HeroFirst",
		Name = "Teleport_Niethalf_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_HeroSecond",
		Name = "Teleport_Niethalf_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_HeroThird",
		Name = "Teleport_Niethalf_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_HeroOrc",
		Name = "Teleport_Niethalf_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_CompanionCraigHuman",
		Name = "Teleport_Niethalf_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Niethalf_CompanionSariel",
		Name = "Teleport_Niethalf_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_ni01", Range = 80},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_tpzone_ni02", Range = 45},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Niethalf_CompanionSariel"},
		},
		GotoState = self,
	};

	
}