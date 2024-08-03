-- spawns and respawns some creep groups to repopulate already cleared areas


local freq = 50;

State
{
	StateName = "DEFAULT",


	OnOneTimeEvent ------------------------------------------- Spawn wolfs near the Trool Hunter
	{
		EventName = ">>> Spawn wolfs near the Trool Hunter <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			MapFlagIsTrue {Name="mf_P706_CS2_ToShaman_Ended"}, 
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "SpawnedCreep_TrollHunter_1_01", Level = 7, UnitId = 793, X = 235, Y = 170, Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_1_02", Level = 7, UnitId = 502, TargetTag = "SpawnedCreep_TrollHunter_1_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_1_03", Level = 7, UnitId = 502, TargetTag = "SpawnedCreep_TrollHunter_1_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_1_04", Level = 7, UnitId = 502, TargetTag = "SpawnedCreep_TrollHunter_1_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_1_05", Level = 7, UnitId = 502, TargetTag = "SpawnedCreep_TrollHunter_1_01", Team = "tm_Creep"},		

			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_1_01"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_1_02"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_1_03"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_1_04"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_1_05"},

			FigureNpcSpawn	{Tag = "SpawnedCreep_TrollHunter_2_01", Level = 7, UnitId = 792, X = 370, Y = 70, Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_2_02", Level = 7, UnitId = 788, TargetTag = "SpawnedCreep_TrollHunter_2_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_2_03", Level = 7, UnitId = 788, TargetTag = "SpawnedCreep_TrollHunter_2_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_2_04", Level = 7, UnitId = 788, TargetTag = "SpawnedCreep_TrollHunter_2_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_TrollHunter_2_05", Level = 7, UnitId = 788, TargetTag = "SpawnedCreep_TrollHunter_2_01", Team = "tm_Creep"},		

			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_2_01"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_2_02"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_2_03"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_2_04"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_TrollHunter_2_05"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Spawn spiders at the Shaman Crossroad
	{
		EventName = ">>> Spawn spiders at the Shaman Crossroad <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},
			
			FigureIsAlive	{Tag = "TheBeast"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "SpawnedCreep_ShamanCrossroads_01", Level = 7, UnitId = 408, X = 612, Y = 177, Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_ShamanCrossroads_02", Level = 7, UnitId = 289, TargetTag = "SpawnedCreep_ShamanCrossroads_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_ShamanCrossroads_03", Level = 7, UnitId = 289, TargetTag = "SpawnedCreep_ShamanCrossroads_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_ShamanCrossroads_04", Level = 7, UnitId = 289, TargetTag = "SpawnedCreep_ShamanCrossroads_01", Team = "tm_Creep"},		
			FigureNpcSpawnToEntity	{Tag = "SpawnedCreep_ShamanCrossroads_05", Level = 7, UnitId = 289, TargetTag = "SpawnedCreep_ShamanCrossroads_01", Team = "tm_Creep"},		

			FigureRoamingEnable	{Tag = "SpawnedCreep_ShamanCrossroads_01"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_ShamanCrossroads_02"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_ShamanCrossroads_03"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_ShamanCrossroads_04"},
			FigureRoamingEnable	{Tag = "SpawnedCreep_ShamanCrossroads_05"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Respawn wolf group 19
	{
		EventName = ">>> Respawn wolf group 19 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			QuestIsKnown	{Player = "default", Quest = "MQ05_RESURRECTORC"},
			
			FigureIsDead	{Tag = "creep_19_01_wolf"},
			FigureIsDead	{Tag = "creep_19_02_wolf"},
			FigureIsDead	{Tag = "creep_19_03_wolf"},
			FigureIsDead	{Tag = "creep_19_04_wolf"},
		},
		Actions =
		{
			FigureRespawn	{Tag = "creep_19_01_wolf", X = 574, Y = 54},
			FigureRespawnToEntity	{Tag = "creep_19_02_wolf", TargetTag = "creep_19_01_wolf"},
			FigureRespawnToEntity	{Tag = "creep_19_03_wolf", TargetTag = "creep_19_01_wolf"},
			FigureRespawnToEntity	{Tag = "creep_19_04_wolf", TargetTag = "creep_19_01_wolf"},

			FigureRoamingEnable	{Tag = "creep_19_01_wolf"},
			FigureRoamingEnable	{Tag = "creep_19_02_wolf"},
			FigureRoamingEnable	{Tag = "creep_19_03_wolf"},
			FigureRoamingEnable	{Tag = "creep_19_04_wolf"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Respawn spider group 08
	{
		EventName = ">>> Respawn spider group 08 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			QuestIsKnown	{Player = "default", Quest = "MQ05_RESURRECTORC"},
			
			FigureIsDead	{Tag = "creep_08_01_spider"},
			FigureIsDead	{Tag = "creep_08_02_spider"},
			FigureIsDead	{Tag = "creep_08_03_spider"},
			FigureIsDead	{Tag = "creep_08_04_spider"},
			FigureIsDead	{Tag = "creep_08_05_spider"},
		},
		Actions =
		{
			FigureRespawn	{Tag = "creep_08_01_spider", X = 612, Y = 177},
			FigureRespawnToEntity	{Tag = "creep_08_02_spider", TargetTag = "creep_08_01_spider"},
			FigureRespawnToEntity	{Tag = "creep_08_03_spider", TargetTag = "creep_08_01_spider"},
			FigureRespawnToEntity	{Tag = "creep_08_04_spider", TargetTag = "creep_08_01_spider"},
			FigureRespawnToEntity	{Tag = "creep_08_05_spider", TargetTag = "creep_08_01_spider"},
				
			FigureRoamingEnable	{Tag = "creep_08_01_spider"},
			FigureRoamingEnable	{Tag = "creep_08_02_spider"},
			FigureRoamingEnable	{Tag = "creep_08_03_spider"},
			FigureRoamingEnable	{Tag = "creep_08_04_spider"},
			FigureRoamingEnable	{Tag = "creep_08_05_spider"},				
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- Respawn bear group 24
	{
		EventName = ">>> Respawn bear group 24 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = freq},

			QuestIsKnown	{Player = "default", Quest = "MQ05_RESURRECTORC"},
			
			FigureIsDead	{Tag = "creep_24_01_bear"},
			FigureIsDead	{Tag = "creep_24_02_bear"},
			FigureIsDead	{Tag = "creep_24_03_bear"},
		},
		Actions =
		{
			FigureRespawn	{Tag = "creep_24_01_bear", X = 644, Y = 519},
			FigureRespawnToEntity	{Tag = "creep_24_02_bear", TargetTag = "creep_24_01_bear"},
			FigureRespawnToEntity	{Tag = "creep_24_03_bear", TargetTag = "creep_24_01_bear"},
			
			FigureRoamingEnable	{Tag = "creep_24_01_bear"},
			FigureRoamingEnable	{Tag = "creep_24_02_bear"},
			FigureRoamingEnable	{Tag = "creep_24_03_bear"},
		},
	},	
};