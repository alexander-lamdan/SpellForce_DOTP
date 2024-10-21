dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

--------------------------
-- RESPAWN AND ATTACK
--------------------------

State
{
	StateName = "INIT",

--
--------
------------ pact 4 unit respawn
------------ upgrade level 1
--------
--

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: all, route: defend, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Defend"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},

		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_4_DefSpot3"},
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: all, route: defend, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Defend"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_4_DefSpot3"},
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: all, route: defend, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Defend"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_4_DefSpot3"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_4_DefSpot1"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_4_DefSpot2"},
			FigurePatrolWalkToEntity	{Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_4_DefSpot3"},
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P3, route: nameless, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsClosed	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P3, route: gates, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P2, route: nameless, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsClosed	{Tag = "Gate5"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P2, route: gates, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate5"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P1, route: nameless, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			OR
			{
				GateIsClosed	{Tag = "Gate4"},
				GateIsClosed	{Tag = "Gate6"},
			},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P1, route: gates, level: 1",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate4"},
			GateIsOpen	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_1_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_1_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_1_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
		},
	};


--
-- pact 4 upgrade level 2
--

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P3, route: nameless, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsClosed	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P3, route: gates, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P2, route: nameless, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsClosed	{Tag = "Gate5"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P2, route: gates, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate5"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P1, route: nameless, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			OR
			{
				GateIsClosed	{Tag = "Gate4"},
				GateIsClosed	{Tag = "Gate6"},
			},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P1, route: gates, level: 2",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate4"},
			GateIsOpen	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_2_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_2_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_2_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
		},
	};


--
-- pact 4 upgrade level 3
--

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P3, route: nameless, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsClosed	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P3, route: gates, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = aPath_Pact4_Pact3_Gates },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P2, route: nameless, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsClosed	{Tag = "Gate5"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P2, route: gates, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate5"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_2_HQ"}, Tags = aPath_Pact4_Pact2_Gates },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P1, route: nameless, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			OR
			{
				GateIsClosed	{Tag = "Gate4"},
				GateIsClosed	{Tag = "Gate6"},
			},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Nameless },
		},
	};

	OnEvent
	{
		EventName = "pact 4 army respawned - enemy: P1, route: gates, level: 3",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Gates"},
			MapValueIsEqual	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
			OR
			{
				BuildingIsAlive	{Tag = "Pact_4_Building_1"},
				BuildingIsAlive	{Tag = "Pact_4_Building_2"},
				BuildingIsAlive	{Tag = "Pact_4_Building_3"},
			},
			GateIsOpen	{Tag = "Gate4"},
			GateIsOpen	{Tag = "Gate6"},
			MapTimerIsElapsed	{Name = "mt_P704_P4_Respawn", Seconds = Time_Respawn_Pact_Squads },
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3a"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3b"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3c"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_1d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_2d"},
			FigureIsDead	{Tag = "Pact_4_Level_3_Unit_3d"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1a, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3a" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level1b, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3b" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level2, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3c" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_1d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_1", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_2d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_2", PlayerKit = "pk_pact4_kit"},
--			FigureRtsSpawnToEntityWithTag {Tag = "Pact_4_Level_3_Unit_3d" , Level = Value_Pact_UnitLevel, UnitId = ID_Pact4_Level3, TargetTag = "Pact_4_Building_3", PlayerKit = "pk_pact4_kit"},

			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_1d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_2d", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3a", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3b", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3c", Team = "tm_Team4"},
			FigureTeamTransfer	{Tag = "Pact_4_Level_3_Unit_3d", Team = "tm_Team4"},

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_4_HQ"}, Tags = aPath_Pact4_Pact1_Gates },
		},
	};

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

--
-- pact 4 move commands for alive units
--

	OnOneTimeRepeatEvent
	{
		Name = "me_P704_Event_P4_Move_Defend",
		EventName = "pact 4 army move alive units to: defend",
		Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Defend"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_4_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_4_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_4_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_4_HQ"},
		},
	};

	OnOneTimeRepeatEvent
	{
		Name = "me_P704_Event_P4_Move_P2",
		EventName = "pact 4 army move alive units to: P2",
		Conditions = 
		{
			OR
			{
				MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
				MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Gates"},
			},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_2_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_2_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_2_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_2_HQ"},
		},
	};

	OnOneTimeRepeatEvent
	{
		Name = "me_P704_Event_P4_Move_P3",
		EventName = "pact 4 army move alive units to: P3",
		Conditions = 
		{
			OR
			{
				MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
				MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Gates"},
			},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_3_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_3_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_3_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_3_HQ"},
		},
	};

	OnOneTimeRepeatEvent
	{
		Name = "me_P704_Event_P4_Move_P1",
		EventName = "pact 4 army move alive units to: P1",
		Conditions = 
		{
			OR
			{
				MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Gates"},
			},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1d", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2d", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3d", TargetTag = "Pact_1_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1d", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2d", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3d", TargetTag = "Pact_1_HQ"},

			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3a", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3b", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3c", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1d", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2d", TargetTag = "Pact_1_HQ"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3d", TargetTag = "Pact_1_HQ"},
		},
	};

}
