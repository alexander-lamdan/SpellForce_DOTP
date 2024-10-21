dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

--------------------------
-- RESPAWN AND DEFEND
--------------------------

State
{
	StateName = "INIT",

--
--------
------------ pact 1 base defenders
--------
--

	OnEvent
	{
		EventName = "pact 1 base defenders died, respawn timer start",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},	-- eleg csak 2 sec-enkent, mert timert nezunk
			FigureIsDead	{Tag = "Pact_1_BaseDef_01"},
			FigureIsDead	{Tag = "Pact_1_BaseDef_02"},
			FigureIsDead	{Tag = "Pact_1_BaseDef_03"},
			MapTimerIsNotElapsed	{Name = "mt_P704_P1_Respawn_Defend", Seconds = 1 },
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P1_Respawn_Defend"},
		},
	};

-- level 1
	OnEvent
	{
		EventName = "pact 1 level 1 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P1_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_1_Building_1"},
				BuildingIsAlive	{Tag = "Pact_1_Building_2"},
				BuildingIsAlive	{Tag = "Pact_1_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P1_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_01" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact1_Level1a, TargetTag = "Pact_1_Building_1", PlayerKit = "pk_pact1_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_02" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact1_Level1a, TargetTag = "Pact_1_Building_2", PlayerKit = "pk_pact1_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_03" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact1_Level1a, TargetTag = "Pact_1_Building_3", PlayerKit = "pk_pact1_kit"},

			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_01", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_02", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_03", Team = "tm_Team1"},

			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_01", TargetTag = "Pact_1_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_02", TargetTag = "Pact_1_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_03", TargetTag = "Pact_1_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_03"},
		},
	};

-- level 2
	OnEvent
	{
		EventName = "pact 1 level 2 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P1_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_1_Building_1"},
				BuildingIsAlive	{Tag = "Pact_1_Building_2"},
				BuildingIsAlive	{Tag = "Pact_1_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P1_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_01" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact1_Level1b, TargetTag = "Pact_1_Building_1", PlayerKit = "pk_pact1_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_02" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact1_Level1b, TargetTag = "Pact_1_Building_2", PlayerKit = "pk_pact1_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_03" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact1_Level2, TargetTag = "Pact_1_Building_3", PlayerKit = "pk_pact1_kit"},

			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_01", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_02", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_03", Team = "tm_Team1"},

			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_01", TargetTag = "Pact_1_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_02", TargetTag = "Pact_1_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_03", TargetTag = "Pact_1_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_03"},
		},
	};

-- level 3
	OnEvent
	{
		EventName = "pact 1 level 3 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P1_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_1_Building_1"},
				BuildingIsAlive	{Tag = "Pact_1_Building_2"},
				BuildingIsAlive	{Tag = "Pact_1_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P1_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_01" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact1_Level2, TargetTag = "Pact_1_Building_1", PlayerKit = "pk_pact1_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_02" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact1_Level2, TargetTag = "Pact_1_Building_2", PlayerKit = "pk_pact1_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_1_BaseDef_03" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact1_Level2, TargetTag = "Pact_1_Building_3", PlayerKit = "pk_pact1_kit"},

			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_01", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_02", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "Pact_1_BaseDef_03", Team = "tm_Team1"},

			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_01", TargetTag = "Pact_1_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_02", TargetTag = "Pact_1_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_1_BaseDef_03", TargetTag = "Pact_1_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_1_BaseDef_03"},
		},
	};

--
--------
------------ pact 2 base defenders
--------
--

	OnEvent
	{
		EventName = "pact 2 base defenders died, respawn timer start",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},	-- eleg csak 2 sec-enkent, mert timert nezunk
			FigureIsDead	{Tag = "Pact_2_BaseDef_01"},
			FigureIsDead	{Tag = "Pact_2_BaseDef_02"},
			FigureIsDead	{Tag = "Pact_2_BaseDef_03"},
			MapTimerIsNotElapsed	{Name = "mt_P704_P2_Respawn_Defend", Seconds = 1 },
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P2_Respawn_Defend"},
		},
	};

-- level 1
	OnEvent
	{
		EventName = "pact 2 level 1 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P2_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_2_Building_1"},
				BuildingIsAlive	{Tag = "Pact_2_Building_2"},
				BuildingIsAlive	{Tag = "Pact_2_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P2_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_01" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact2_Level1a, TargetTag = "Pact_2_Building_1", PlayerKit = "pk_pact2_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_02" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact2_Level1a, TargetTag = "Pact_2_Building_2", PlayerKit = "pk_pact2_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_03" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact2_Level1a, TargetTag = "Pact_2_Building_3", PlayerKit = "pk_pact2_kit"},

			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_01", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_02", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_03", Team = "tm_Team2"},

			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_01", TargetTag = "Pact_2_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_02", TargetTag = "Pact_2_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_03", TargetTag = "Pact_2_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_03"},
		},
	};

-- level 2
	OnEvent
	{
		EventName = "pact 2 level 2 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P2_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_2_Building_1"},
				BuildingIsAlive	{Tag = "Pact_2_Building_2"},
				BuildingIsAlive	{Tag = "Pact_2_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P2_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_01" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact2_Level1b, TargetTag = "Pact_2_Building_1", PlayerKit = "pk_pact2_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_02" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact2_Level1b, TargetTag = "Pact_2_Building_2", PlayerKit = "pk_pact2_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_03" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact2_Level2, TargetTag = "Pact_2_Building_3", PlayerKit = "pk_pact2_kit"},

			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_01", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_02", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_03", Team = "tm_Team2"},

			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_01", TargetTag = "Pact_2_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_02", TargetTag = "Pact_2_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_03", TargetTag = "Pact_2_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_03"},
		},
	};

-- level 3
	OnEvent
	{
		EventName = "pact 2 level 3 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P2_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_2_Building_1"},
				BuildingIsAlive	{Tag = "Pact_2_Building_2"},
				BuildingIsAlive	{Tag = "Pact_2_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P2_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_01" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact2_Level2, TargetTag = "Pact_2_Building_1", PlayerKit = "pk_pact2_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_02" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact2_Level2, TargetTag = "Pact_2_Building_2", PlayerKit = "pk_pact2_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_2_BaseDef_03" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact2_Level2, TargetTag = "Pact_2_Building_3", PlayerKit = "pk_pact2_kit"},

			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_01", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_02", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "Pact_2_BaseDef_03", Team = "tm_Team2"},

			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_01", TargetTag = "Pact_2_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_02", TargetTag = "Pact_2_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_2_BaseDef_03", TargetTag = "Pact_2_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_2_BaseDef_03"},
		},
	};

--
--------
------------ pact 3 base defenders
--------
--

	OnEvent
	{
		EventName = "pact 3 base defenders died, respawn timer start",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},	-- eleg csak 2 sec-enkent, mert timert nezunk
			FigureIsDead	{Tag = "Pact_3_BaseDef_01"},
			FigureIsDead	{Tag = "Pact_3_BaseDef_02"},
			FigureIsDead	{Tag = "Pact_3_BaseDef_03"},
			MapTimerIsNotElapsed	{Name = "mt_P704_P3_Respawn_Defend", Seconds = 1 },
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P3_Respawn_Defend"},
		},
	};

-- level 1
	OnEvent
	{
		EventName = "pact 3 level 1 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P3_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_3_Building_1"},
				BuildingIsAlive	{Tag = "Pact_3_Building_2"},
				BuildingIsAlive	{Tag = "Pact_3_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P3_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_01" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact3_Level1a, TargetTag = "Pact_3_Building_1", PlayerKit = "pk_pact3_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_02" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact3_Level1a, TargetTag = "Pact_3_Building_2", PlayerKit = "pk_pact3_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_03" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact3_Level1a, TargetTag = "Pact_3_Building_3", PlayerKit = "pk_pact3_kit"},

			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_01", Team = "tm_Team3"},
			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_02", Team = "tm_Team3"},
			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_03", Team = "tm_Team3"},

			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_01", TargetTag = "Pact_3_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_02", TargetTag = "Pact_3_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_03", TargetTag = "Pact_3_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_03"},
		},
	};

-- level 2
	OnEvent
	{
		EventName = "pact 3 level 2 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P3_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_3_Building_1"},
				BuildingIsAlive	{Tag = "Pact_3_Building_2"},
				BuildingIsAlive	{Tag = "Pact_3_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P3_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_01" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact3_Level1b, TargetTag = "Pact_3_Building_1", PlayerKit = "pk_pact3_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_02" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact3_Level1b, TargetTag = "Pact_3_Building_2", PlayerKit = "pk_pact3_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_03" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact3_Level2, TargetTag = "Pact_3_Building_3", PlayerKit = "pk_pact3_kit"},

			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_01", Team = "tm_Team3"},
			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_02", Team = "tm_Team3"},
			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_03", Team = "tm_Team3"},

			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_01", TargetTag = "Pact_3_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_02", TargetTag = "Pact_3_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_03", TargetTag = "Pact_3_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_03"},
		},
	};

-- level 3
	OnEvent
	{
		EventName = "pact 3 level 3 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P3_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_3_Building_1"},
				BuildingIsAlive	{Tag = "Pact_3_Building_2"},
				BuildingIsAlive	{Tag = "Pact_3_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P3_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_01" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact3_Level2, TargetTag = "Pact_3_Building_1", PlayerKit = "pk_pact3_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_02" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact3_Level2, TargetTag = "Pact_3_Building_2", PlayerKit = "pk_pact3_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_3_BaseDef_03" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact3_Level2, TargetTag = "Pact_3_Building_3", PlayerKit = "pk_pact3_kit"},

			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_01", Team = "tm_Team3"},
			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_02", Team = "tm_Team3"},
			FigureTeamTransfer	{Tag = "Pact_3_BaseDef_03", Team = "tm_Team3"},

			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_01", TargetTag = "Pact_3_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_02", TargetTag = "Pact_3_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_3_BaseDef_03", TargetTag = "Pact_3_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_3_BaseDef_03"},
		},
	};

--
--------
------------ pact 4 base defenders
--------
--

	OnEvent
	{
		EventName = "pact 3 base defenders died, respawn timer start",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},	-- eleg csak 2 sec-enkent, mert timert nezunk
			FigureIsDead	{Tag = "Pact_4_BaseDef_01"},
			FigureIsDead	{Tag = "Pact_4_BaseDef_02"},
			FigureIsDead	{Tag = "Pact_4_BaseDef_03"},
			MapTimerIsNotElapsed	{Name = "mt_P704_P4_Respawn_Defend", Seconds = 1 },
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn_Defend"},
		},
	};

-- level 1
	OnEvent
	{
		EventName = "pact 4 level 1 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P4_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_01" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_02" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_03" , Level = Value_Pact_UnitLevel + 2, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_01", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_02", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_03", Team = "tm_Team4"},

			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_01", TargetTag = "Pact_4_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_02", TargetTag = "Pact_4_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_03", TargetTag = "Pact_4_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_03"},
		},
	};

-- level 2
	OnEvent
	{
		EventName = "pact 4 level 2 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P4_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_01" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_02" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_03" , Level = Value_Pact_UnitLevel + 3, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_01", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_02", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_03", Team = "tm_Team4"},

			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_01", TargetTag = "Pact_4_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_02", TargetTag = "Pact_4_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_03", TargetTag = "Pact_4_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_03"},
		},
	};

-- level 3
	OnEvent
	{
		EventName = "pact 4 level 3 base defenders respawned",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn_Defend", Seconds = Time_Respawn_Pact_Defend },
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_P4_Respawn_Defend"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_01" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_02" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_BaseDef_03" , Level = Value_Pact_UnitLevel + 4, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_01", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_02", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_BaseDef_03", Team = "tm_Team4"},

			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_01", TargetTag = "Pact_4_DefSpot1"},
			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_02", TargetTag = "Pact_4_DefSpot2"},
			FigureWalkToEntity	{Tag = "Pact_4_BaseDef_03", TargetTag = "Pact_4_DefSpot3"},

			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_01"},
			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_02"},
			FigureRoamingEnable	{Tag = "Pact_4_BaseDef_03"},
		},
	};

}
