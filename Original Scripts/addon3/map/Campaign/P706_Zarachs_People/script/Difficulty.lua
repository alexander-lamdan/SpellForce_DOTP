local otBeastSpawnPoint = "pos_BeastSpawnPoint";

--local lvlTheBeast = {
--	["Easy"]			= 8,
--	["Normal"]		= 11,
--	["Hard"]			= 14,
--	["Extreme"]		= 17,
--};

local lvlTowerProtector = {
	["Easy"]			= 2,
	["Normal"]		= 5,
	["Hard"]			= 8,
	["Extreme"]		= 11,
};

--local lvlBossfightFighter = {
--	["Easy"]			= 10,
--	["Normal"]		= 11,
--	["Hard"]			= 12,
--	["Extreme"]		= 13,
--};


State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Switch to DEFAULT state <<<",
		Conditions = 
		{
			GameIsUnBlocked{},
		},
		Actions =
		{
		},
		GotoState = "DEFAULT",
	},


--	OnOneTimeEvent
--	{
--		EventName = ">>> EASY: Clearing Difficulty-flags and values... <<<",
--		Conditions = 
--		{
--			GameIsUnBlocked{},
--		  GameDifficulty {Value = Diff.Easy},				
--		},
--		Actions =
--		{
--			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Easy},
--		},
--		GotoState = "DEFAULT",
--	},
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> NORMAL: Clearing Difficulty-flags and values... <<<",
--		Conditions = 
--		{
--			GameIsUnBlocked{},
--		  GameDifficulty {Value = Diff.Normal},				
--		},
--		Actions =
--		{
--			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Normal},
--		},
--		GotoState = "DEFAULT",
--	},
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> HARD: Clearing Difficulty-flags and values... <<<",
--		Conditions = 
--		{
--			GameIsUnBlocked{},
--		  GameDifficulty {Value = Diff.Hard},				
--		},
--		Actions =
--		{
--			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Hard},
--		},
--		GotoState = "DEFAULT",
--	},
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> EXTREME: Clearing Difficulty-flags and values... <<<",
--		Conditions = 
--		{
--			GameIsUnBlocked{},
--		  GameDifficulty {Value = Diff.Extreme},				
--		},
--		Actions =
--		{
--			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Extreme},
--		},
--		GotoState = "DEFAULT",
--	},
};








State
{
	StateName = "DEFAULT",
	
  --***************************************************************************************************** The Beast
	OnOneTimeEvent ------------------------------------------- Bear needs to be spawned
	{
		EventName = ">>> DIFF EASY: mt_MQ031_SUMMON_completed > 9 - Bear has been just respawned <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 9 },
		  GameDifficulty {Value = Diff.Easy},		
		},
		Actions =
		{
--			FigureNpcSpawnLRTAToEntity	{Tag = "TheBeast", Player = "pl_Creep", Level = 8, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 8, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 15, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"}, 
--			FigureLevelSet	{Tag = "TheBeast", Level = 8},
		},
	},

	OnOneTimeEvent ------------------------------------------- Bear needs to be spawned
	{
		EventName = ">>> DIFF NORM: mt_MQ031_SUMMON_completed > 9 - Bear has been just respawned <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 9 },
		  GameDifficulty {Value = Diff.Normal},		
		},
		Actions =
		{
--			FigureNpcSpawnLRTAToEntity	{Tag = "TheBeast", Player = "pl_Creep", Level = 11, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 11, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 18, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureLevelSet	{Tag = "TheBeast", Level = 11},
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- Bear needs to be spawned
	{
		EventName = ">>> DIFF HARD: mt_MQ031_SUMMON_completed > 9 - Bear has been just respawned <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 9 },
		  GameDifficulty {Value = Diff.Hard},		
		},
		Actions =
		{
--			FigureNpcSpawnLRTAToEntity	{Tag = "TheBeast", Player = "pl_Creep", Level = 13, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},			
			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 13, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 20, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureLevelSet	{Tag = "TheBeast", Level = 13},
		},
	},	

	OnOneTimeEvent ------------------------------------------- Bear needs to be spawned
	{
		EventName = ">>> DIFF EXTREME: mt_MQ031_SUMMON_completed > 9 - Bear has been just respawned <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 9 },
		  GameDifficulty {Value = Diff.Extreme},		
		},
		Actions =
		{
--			FigureNpcSpawnLRTAToEntity	{Tag = "TheBeast", Player = "pl_Creep", Level = 15, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 15, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 22, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureLevelSet	{Tag = "TheBeast", Level = 15},
		},
	},	
	
	
	
	
	
	
	
	

	--***************************************************************************************************** Pushing forward towards the NL too early
	OnOneTimeEvent
	{
		EventName = ">>> Player pushes forward to NL too early, stage 1 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 25},

			MapFlagIsFalse	{Name = "mf_P706_CS5_ForSariel_Ended"},
			OR
			{
				GameDifficulty {Value = Diff.Easy},
				GameDifficulty {Value = Diff.Normal},
				GameDifficulty {Value = Diff.Hard},
			},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 35, TargetTag = "pos_Diff_NL_Warning1"},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryHintWeAreWeakForThis1", Tag = ftCompCraig, TargetTag = "pos_Diff_NL_Warning1"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Player pushes forward to NL too early, stage 2 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 15},

			MapFlagIsFalse	{Name = "mf_P706_CS5_ForSariel_Ended"},
			OR
			{
				GameDifficulty {Value = Diff.Easy},
				GameDifficulty {Value = Diff.Normal},
				GameDifficulty {Value = Diff.Hard},
			},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 18, TargetTag = "pos_Diff_NL_Warning2"},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryHintWeAreWeakForThis2", Tag = ftCompCraig, TargetTag = "pos_Diff_NL_Warning2"},
		},
	},
	
	
	
	
	
	
	
	
	--*********************************************************************************** Figure levels
	OnEvent
	{
		EventName = ">>> LEVEL EASY: set figure levels <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			
			GameDifficulty {Value = Diff.Easy},									
			MapValueIsNotEqual	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Easy},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Easy},

--			-- The Beast:
--			FigureUnitChange	{Tag = "TheBeast", UnitId = 2022, Level = lvlTheBeast.Easy},			
			
			-- Tower protector fighters:			
			FigureUnitChange	{Tag = "TowerProtector_1_01", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_1_02", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_1_03", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_1_04", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_2_01", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_2_02", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_2_03", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_2_04", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_3_01", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_3_02", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_3_03", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_3_04", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_4_01", UnitId = 2033, Level = lvlTowerProtector.Easy},
			FigureUnitChange	{Tag = "TowerProtector_4_02", UnitId = 2033, Level = lvlTowerProtector.Easy},

--			-- Bossfight's spawned fighters:
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_01", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_02", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_03", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_04", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_05", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_06", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_07", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_08", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_09", UnitId = 2033, Level = lvlBossfightFighter.Easy},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_10", UnitId = 2033, Level = lvlBossfightFighter.Easy},
		},
	},	
	
	OnEvent
	{
		EventName = ">>> LEVEL NORMAL: set figure levels <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			
			GameDifficulty {Value = Diff.Normal},									
			MapValueIsNotEqual	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Normal},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Normal},
			
--			-- The Beast:
--			FigureUnitChange	{Tag = "TheBeast", UnitId = 2022, Level = lvlTheBeast.Normal},			
			
			-- Tower protector fighters:			
			FigureUnitChange	{Tag = "TowerProtector_1_01", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_1_02", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_1_03", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_1_04", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_2_01", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_2_02", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_2_03", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_2_04", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_3_01", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_3_02", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_3_03", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_3_04", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_4_01", UnitId = 2033, Level = lvlTowerProtector.Normal},
			FigureUnitChange	{Tag = "TowerProtector_4_02", UnitId = 2033, Level = lvlTowerProtector.Normal},
			
--			-- Bossfight's spawned fighters:
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_01", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_02", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_03", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_04", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_05", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_06", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_07", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_08", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_09", UnitId = 2033, Level = lvlBossfightFighter.Normal},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_10", UnitId = 2033, Level = lvlBossfightFighter.Normal},			
		},
	},		
	
	OnEvent
	{
		EventName = ">>> LEVEL HARD: set figure levels <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			
			GameDifficulty {Value = Diff.Hard},									
			MapValueIsNotEqual	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Hard},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Hard},
			
--			-- The Beast:
--			FigureUnitChange	{Tag = "TheBeast", UnitId = 2022, Level = lvlTheBeast.Hard},			
			
			-- Tower protector fighters:			
			FigureUnitChange	{Tag = "TowerProtector_1_01", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_1_02", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_1_03", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_1_04", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_2_01", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_2_02", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_2_03", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_2_04", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_3_01", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_3_02", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_3_03", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_3_04", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_4_01", UnitId = 2033, Level = lvlTowerProtector.Hard},
			FigureUnitChange	{Tag = "TowerProtector_4_02", UnitId = 2033, Level = lvlTowerProtector.Hard},
			
--			-- Bossfight's spawned fighters:
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_01", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_02", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_03", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_04", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_05", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_06", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_07", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_08", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_09", UnitId = 2033, Level = lvlBossfightFighter.Hard},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_10", UnitId = 2033, Level = lvlBossfightFighter.Hard},						
		},
	},			
	
	OnEvent
	{
		EventName = ">>> LEVEL EXTREME: set figure levels <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			
			GameDifficulty {Value = Diff.Extreme},									
			MapValueIsNotEqual	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Extreme},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_CurrentDifficulty", Value = Diff.Extreme},
			
--			-- The Beast:
--			FigureUnitChange	{Tag = "TheBeast", UnitId = 2022, Level = lvlTheBeast.Extreme},			
			
			-- Tower protector fighters:			
			FigureUnitChange	{Tag = "TowerProtector_1_01", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_1_02", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_1_03", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_1_04", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_2_01", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_2_02", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_2_03", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_2_04", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_3_01", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_3_02", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_3_03", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_3_04", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_4_01", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			FigureUnitChange	{Tag = "TowerProtector_4_02", UnitId = 2033, Level = lvlTowerProtector.Extreme},
			
--				-- Bossfight's spawned fighters:
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_01", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_02", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_03", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_04", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_05", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_06", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_07", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_08", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_09", UnitId = 2033, Level = lvlBossfightFighter.Extreme},
--			FigureUnitChange	{Tag = "Spawned_NL_BossFighter_10", UnitId = 2033, Level = lvlBossfightFighter.Extreme},				
		},
	},	
};
