--*****************************************************
--*                                                   *
--*   Icewastes of Shalibar :: Main Quest 03 script   *
--*                                                   *
--*****************************************************

-- local constans for heroes

local vHero1ID = 182;
local vHero1sTag = "HeroCaine";
local vHero1fTag = "pl_HumanHeroCaine";

local vHero2ID = 250;
local vHero2sTag = "HeroOrc";
local vHero2fTag = "pl_HumanHeroOrc";

local vHero3ID = 251;
local vHero3sTag = "HeroFirst";
local vHero3fTag = "pl_HumanHeroFirst";

local vHero4ID = 257;
local vHero4sTag = "HeroSecond";
local vHero4fTag = "pl_HumanHeroSecond";

local vHero5ID = 260;
local vHero5sTag = "HeroThird";
local vHero5fTag = "pl_HumanHeroThird";

local vHero6ID = 259;
local vHero6sTag = "CompanionCraigHuman";
local vHero6fTag = "pl_HumanCompanionCraigHuman";

local vHero7ID = 262;
local vHero7sTag = "CompanionSariel";
local vHero7fTag = "pl_HumanCompanionSariel";

State
{

	StateName = "INIT",
	
-- Start cutscene	03

	OnOneTimeEvent
	{
		EventName = ">>> MQ#2 finished, cutscene 03 starts <<<",
		Conditions = 
		{

			FigureIsAlive {Tag = "pl_HumanAvatar"},

			QuestIsSolved {Quest = "IOS_MQ_2"},
			
			QuestIsNotSolved	{Player = "default", Quest = "IOS_MQ_3"},
			
			MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 25},

		},
		Actions =
		{
	
			MapTimerStop {Name = "mt_P709_FinishQuest"},
			
--	set coreography

			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_00", Level = 5, UnitId = 1198, X = 287.4, Y = 230.795, Team = "tm_Creep"}, },
			
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_01", Level = 4, UnitId = 116, X = 289.062, Y = 228.508, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_02", Level = 5, UnitId = 116, X = 285.52, Y = 228.147, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_03", Level = 4, UnitId = 81, X = 285.996, Y = 226.086, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_04", Level = 5, UnitId = 102, X = 285.435, Y = 228.32, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_05", Level = 4, UnitId = 116, X = 289.192, Y = 230.927, Team = "tm_Creep"}, },
			
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_06", Level = 4, UnitId = 81, X = 284.362, Y = 230.608, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_07", Level = 5, UnitId = 116, X = 289.112, Y = 234.536, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_08", Level = 4, UnitId = 102, X = 285.185, Y = 234.034, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_09", Level = 5, UnitId = 116, X = 288.407, Y = 236.275, Team = "tm_Creep"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_10", Level = 5, UnitId = 81, X = 285.63, Y = 237.051, Team = "tm_Creep"}, },

			FigureLookAtDirection	{Tag = "cs03_undead_00", Direction = 290},
			
			FigureLookAtDirection	{Tag = "cs03_undead_01", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_02", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_03", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_04", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_05", Direction = 290},

			FigureLookAtDirection	{Tag = "cs03_undead_06", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_07", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_08", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_09", Direction = 290},
			FigureLookAtDirection	{Tag = "cs03_undead_10", Direction = 290},

			FigureTeleport {Tag = "undead_captain", X = 264.947, Y = 233.888},

			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_01", Level = 4, UnitId = 118, X = 267.613, Y = 224.822, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_02", Level = 5, UnitId = 118, X = 265.338, Y = 226.077, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_03", Level = 3, UnitId = 118, X = 269.79, Y = 226.802, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_04", Level = 5, UnitId = 118, X = 269.272, Y = 229.831, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_05", Level = 4, UnitId = 118, X = 267.273, Y = 227.693, Team = "tm_Norcaine"}, },
			
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_06", Level = 4, UnitId = 118, X = 264.551, Y = 229.416, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_07", Level = 5, UnitId = 118, X = 268.991, Y = 233.548, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_08", Level = 3, UnitId = 118, X = 266.791, Y = 230.38, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_09", Level = 5, UnitId = 118, X = 263.75, Y = 231.647, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_10", Level = 4, UnitId = 118, X = 266.411, Y = 233.085, Team = "tm_Norcaine"}, },
			
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_11", Level = 4, UnitId = 118, X = 263.241, Y = 233.794, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_12", Level = 5, UnitId = 118, X = 268.15, Y = 237.138, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_13", Level = 3, UnitId = 118, X = 266.346, Y = 237.457, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_14", Level = 5, UnitId = 118, X = 263.003, Y = 240.58, Team = "tm_Norcaine"}, },
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "cs03_undead_ally_15", Level = 4, UnitId = 118, X = 265.144, Y = 240.964, Team = "tm_Norcaine"}, },
			
			FigureLookAtDirection	{Tag = "undead_captain", Direction = 120},
			
			FigureLookAtDirection	{Tag = "cs03_undead_ally_01", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_02", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_03", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_04", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_05", Direction = 120},
			
			FigureLookAtDirection	{Tag = "cs03_undead_ally_06", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_07", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_08", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_09", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_10", Direction = 120},
			
			FigureLookAtDirection	{Tag = "cs03_undead_ally_11", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_12", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_13", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_14", Direction = 120},
			FigureLookAtDirection	{Tag = "cs03_undead_ally_15", Direction = 120},
			
--	set coreography for the avatar, heroes and companions
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 276, Y = 226};
			
			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "pl_HumanAvatar"},
			
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 120},
			
			FigureLookAtDirection	{Tag = vHero1fTag, Direction = 120},
			FigureLookAtDirection	{Tag = vHero2fTag, Direction = 120},
			FigureLookAtDirection	{Tag = vHero3fTag, Direction = 120},
			FigureLookAtDirection	{Tag = vHero4fTag, Direction = 120},
			FigureLookAtDirection	{Tag = vHero5fTag, Direction = 120},
			FigureLookAtDirection	{Tag = vHero6fTag, Direction = 120},
			FigureLookAtDirection	{Tag = vHero7fTag, Direction = 120},
			
--	reinitialize the dialog of the Norcaine Leader for the side quests

			DialogSetEnabled {Tag = "norcaine_leader"},

--	cutscene starts

			MapFlagSetTrue {Name = "mf_P709_CS03_Start"},

		},

	},
	
--	OUTCRIES: P709_CRY_MQ_3_T001_CRAIG & P709_CRY_MQ_3_T002_AVATAR

	OnOneTimeEvent
	{
		EventName = ">>> OUTCRIES: P709_CRY_MQ_3_T001_CRAIG & P709_CRY_MQ_3_T002_AVATAR <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_CS03_End"},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_MQ_3_T001_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			FigureOutcry {TextTag = "P709_CRY_MQ_3_T002_AVATAR", Tag = "pl_HumanAvatar"},

		},

	},

-- Cutscene 03b TIMER starts

	OnOneTimeEvent
	{
		EventName = ">>> Cutscene 03b TIMER starts <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_CS03_End"},

			FigureIsDead {Tag = "cs03_undead_00"},

			FigureIsDead {Tag = "cs03_undead_01"},
			FigureIsDead {Tag = "cs03_undead_02"},
			FigureIsDead {Tag = "cs03_undead_03"},
			FigureIsDead {Tag = "cs03_undead_04"},
			FigureIsDead {Tag = "cs03_undead_05"},

			FigureIsDead {Tag = "cs03_undead_06"},
			FigureIsDead {Tag = "cs03_undead_07"},
			FigureIsDead {Tag = "cs03_undead_08"},
			FigureIsDead {Tag = "cs03_undead_09"},
			FigureIsDead {Tag = "cs03_undead_10"},

		},
		Actions =
		{
	
			MapTimerStart {Name = "mt_P709_CS03b_Start"},

		},
		
	},

-- Cutscene 03b starts

	OnOneTimeEvent
	{
		EventName = ">>> Cutscene 03b starts <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_CS03b_Start", Seconds = 5},

		},
		Actions =
		{
	
			MapTimerStop {Name = "mt_P709_CS03b_Start"},
	
			MapFlagSetTrue {Name = "mf_P709_CS03b_Start"},

		},
		
	},
	
-- MQ#3 - Undead Captain's dialog starts

	OnOneTimeEvent
	{
		EventName = ">>> MQ#3 - Undead Captain's dialog starts <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_CS03b_End"},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "undead_captain"},

		},
		
	},
	
--	Activate Main Quest #3
	
	OnOneTimeEvent
	{
		EventName = ">>> MQ#3 accepted, got from the Undead Captain <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_3_Accepted"},

		},
		Actions =
		{

			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_kit2"},
			PlayerKitTransfer	{Player = "pl_Undead", PlayerKit = "pk_kitEnemy2"},
			
-- Pact upgrades are available to the player
			
			PlayerBuildingAdd	{BuildingId = 133},
			PlayerBuildingAdd	{BuildingId = 134},
			PlayerBuildingAdd	{BuildingId = 136},
			PlayerBuildingAdd	{BuildingId = 137},
			PlayerBuildingAdd	{BuildingId = 138},
			PlayerBuildingAdd	{BuildingId = 139},
			PlayerBuildingAdd	{BuildingId = 140},
			PlayerBuildingAdd	{BuildingId = 141},
			PlayerBuildingAdd	{BuildingId = 142},
			PlayerBuildingAdd	{BuildingId = 143},
			PlayerBuildingAdd	{BuildingId = 144},
			PlayerBuildingAdd	{BuildingId = 145},
			PlayerBuildingAdd	{BuildingId = 146},
			PlayerBuildingAdd	{BuildingId = 147},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 26},
			PlayerBuildingUpgradeAdd	{UpgradeId = 24},
			PlayerBuildingUpgradeAdd	{UpgradeId = 28},
			PlayerBuildingUpgradeAdd	{UpgradeId = 20},
			PlayerBuildingUpgradeAdd	{UpgradeId = 30},
			PlayerBuildingUpgradeAdd	{UpgradeId = 22},
			PlayerBuildingUpgradeAdd	{UpgradeId = 36},
			PlayerBuildingUpgradeAdd	{UpgradeId = 38},
			PlayerBuildingUpgradeAdd	{UpgradeId = 32},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18},
			PlayerBuildingUpgradeAdd	{UpgradeId = 34},

--	Set Main Quest #3 and its #1 Subquest to active

			QuestSetActive {Quest = "IOS_MQ_3"},
			QuestSetActive {Quest = "IOS_SUBQ_31"},
			
			MapTimerStart	{Name = "mt_P709_ActivateQuest"},

		},

		

	},
	
--	Subquest 31 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Subquest 31 - SAVING <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_SUBQ_31"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 10},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },
			
			MapTimerStop {Name = "mt_P709_ActivateQuest"},

		},

		GotoState = "IOS_SUBQ_31_32",

	},

};

-- Main Quest #3 Subquest #1

State
{

	StateName = "IOS_SUBQ_31_32",
	
-- Timer starts, the player has 15 minutes to prepare for war

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - timer starts, the player got 15 mins to prepare for war <<<",
		Conditions = 
		{
		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_PrepareForWar"},

		},

	},
	
-- After 15 minutes the war begins

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - after 15 minutes the war begins <<<",
		Conditions = 
		{

			MapTimerIsElapsed {Name = "mt_P709_PrepareForWar", Seconds = 900},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_PrepareForWar"},

			QuestSetSolved {Player = "default", Quest = "IOS_SUBQ_31"},
			QuestSetActive {Player = "default", Quest = "IOS_SUBQ_32"},
			
			GateSetOpen {Tag = "undead_base_gate_1"},
			GateSetOpen {Tag = "undead_base_gate_2"},

			MapTimerStart	{Name = "mt_P709_ActivateQuest"},

		},

	},
	
--	After 15 minutes the war begins - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> After 15 minutes the war begins - SAVING <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_SUBQ_32"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 10},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },
			
			MapTimerStop {Name = "mt_P709_ActivateQuest"},

		},

	},
	
-- OUTCRY: P709_CRY_MQ_3_T003_DRACONTALSHALIR

	OnOneTimeEvent
	{
		
		EventName = ">>> OUTCRY: P709_CRY_MQ_3_T003_DRACONTALSHALIR <<<",
		Conditions =
		{

			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "norcaine_hq", Range = 15},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_MQ_3_T003_DRACONTALSHALIR", Tag = "norcaine_leader"},

		},

	},

--	First arrival of the Lich boss, OUTCRY: P709_CRY_MQ_3_T004_CRAIG

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - Lich boss joins the fight when one of the towers being attacked by the player, OUTCRY: P709_CRY_MQ_3_T004_CRAIG <<<",
		Conditions =
		{

			OR
			{

				FigureHasNotHealth { Tag = "undead_tower_1", Percent = 100},
				FigureHasNotHealth { Tag = "undead_tower_2", Percent = 100},
				FigureHasNotHealth { Tag = "undead_tower_3", Percent = 100},

			},

		},
		Actions =
		{

			FigureNpcSpawnToEntity {Tag = "lich", Level = 10, UnitId = 2065, TargetTag = "lich_spawnpoint", Team = "tm_Undead"},

			MapFlagSetTrue {Name = "mf_P709_bossfight_02"},

			FigureForceAttackEntity {Tag = "lich", TargetTag = "pl_HumanAvatar"},

			FigureOutcry {TextTag = "P709_CRY_MQ_3_T004_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},
			
			EntityValueSet {Name = "ev_P709_DestroyedTowers", Value = 0},
			
			EntityFlagSetTrue {Name = "mf_P709_LichWasBorn"},

			UIBossfightPanelShow { UnitTag1 = "lich", UnitTag2 = "", PortraitImage = "boss_P709_lich", DisplayName = Boss_P709_Lich},

		},

	},
	
-- The avatar killed the Lich once after he was born the first time, OUTCRY: P709_CRY_MQ_3_T005_LICH

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - the avatar killed the Lich once after he was born the first time, OUTCRY: P709_CRY_MQ_3_T005_LICH <<<",
		Conditions =
		{

			EntityIsNotExisting	{Tag = "lich"},
			
			EntityFlagIsTrue {Name = "mf_P709_LichWasBorn"},

		},
		Actions =
		{
			
			MapFlagSetTrue	{Name = "mf_P709_LichIsDeadOnce"},
			
			ObjectSpawn	{ObjectId = 3111, X = 8, Y = 25, Direction = 0, Tag = "lich_potlek"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_3_T005_LICH", Tag = "lich_potlek"},

			UIBossfightPanelHide {},

		},

	},

--	Lich respawn timer, OUTCRY: P709_CRY_MQ_3_T006_LICH 

	OnEvent
	{
		
		EventName = ">>> MQ#3 - Lich respawn timer, OUTCRY: P709_CRY_MQ_3_T006_LICH <<<",
		Conditions =
		{

			EntityIsNotExisting	{Tag = "lich"},
			
			MapFlagIsTrue {Name = "mf_P709_LichIsDeadOnce"},
			
			EntityFlagIsFalse {Name = "et_P709_LichRespawnTimerStarted"},

			AND
			{

				OR
				{

					EntityIsExisting {Tag = "undead_tower_1"},
					EntityIsExisting {Tag = "undead_tower_2"},
					EntityIsExisting {Tag = "undead_tower_3"},

				}

			},

		},
		Actions =
		{

			EntityTimerStart {Name = "et_P709_LichRespawn"},
			
			EntityFlagSetTrue {Name = "et_P709_LichRespawnTimerStarted"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_3_T006_LICH", Tag = "lich_potlek"},

			UIBossfightPanelHide {},

		},

	},
	
	OnEvent
	{
		
		EventName = ">>> MQ#3 - Lich respawn timer allows the lich to respawn after X sec <<<",
		Conditions =
		{
	
			EntityTimerIsElapsed {Name = "et_P709_LichRespawn", Seconds = 20},

--			EntityTimerIsElapsed	{Name = "et_P709_LichRespawn", Seconds = 600},

		},
		Actions =
		{

			EntityTimerStop {Name = "et_P709_LichRespawn"},
			
			EntityFlagSetTrue	{Name = "mf_P709_LichRespawn"},

		},

	},

--	Lich respawn with 100% health -- 0 destroyed towers

	OnEvent
	{
		
		EventName = ">>> MQ#3 - respawn the Lich boss with 100% health | 0 destroyed towers <<<",
		Conditions =
		{
	
			EntityFlagIsTrue	{Name = "mf_P709_LichRespawn"},
			
			EntityValueIsEqual {Name = "ev_P709_DestroyedTowers", Value = 0},

		},
		Actions =
		{

			FigureNpcSpawnToEntity {Tag = "lich", Level = 10, UnitId = 2065, TargetTag = "lich_spawnpoint", Team = "tm_Undead"},

			FigureForceAttackEntity {Tag = "lich", TargetTag = "pl_HumanAvatar"},
			
			EntityFlagSetFalse {Name = "mf_P709_LichRespawn"},
			
			EntityFlagSetFalse {Name = "et_P709_LichRespawnTimerStarted"},

			UIBossfightPanelShow { UnitTag1 = "lich", UnitTag2 = "", PortraitImage = "boss_P709_lich", DisplayName = Boss_P709_Lich},

		},

	},
	
--	Lich respawn with 66% health -- 1 destroyed towers

	OnEvent
	{

		EventName = ">>> MQ#3 - respawn the Lich boss with 66% health | 1 destroyed towers <<<",
		Conditions =
		{

			EntityFlagIsTrue {Name = "mf_P709_LichRespawn"},
			
			EntityValueIsEqual {Name = "ev_P709_DestroyedTowers", Value = 1},

		},
		Actions =
		{

			FigureNpcSpawnToEntity {Tag = "lich", Level = 10, UnitId = 2065, TargetTag = "lich_spawnpoint", Team = "tm_Undead"},

			FigureHealthSet	{Tag = "lich", Percent = 66},

			FigureForceAttackEntity {Tag = "lich", TargetTag = "pl_HumanAvatar"},
			
			EntityFlagSetFalse {Name = "mf_P709_LichRespawn"},
			
			EntityFlagSetFalse {Name = "et_P709_LichRespawnTimerStarted"},

			UIBossfightPanelShow { UnitTag1 = "lich", UnitTag2 = "", PortraitImage = "boss_P709_lich", DisplayName = Boss_P709_Lich},

		},

	},

--	Lich respawn with 33% health -- 2 destroyed towers

	OnEvent
	{

		EventName = ">>> MQ#3 - respawn the Lich boss with 33% health | 2 destroyed towers <<<",
		Conditions =
		{

			EntityFlagIsTrue	{Name = "mf_P709_LichRespawn"},
			
			EntityValueIsEqual {Name = "ev_P709_DestroyedTowers", Value = 2},

		},
		Actions =
		{

			FigureNpcSpawnToEntity {Tag = "lich", Level = 10, UnitId = 2065, TargetTag = "lich_spawnpoint", Team = "tm_Undead"},

			FigureHealthSet	{Tag = "lich", Percent = 33},

			FigureForceAttackEntity {Tag = "lich", TargetTag = "pl_HumanAvatar"},
			
			EntityFlagSetFalse {Name = "mf_P709_LichRespawn"},
			
			EntityFlagSetFalse {Name = "et_P709_LichRespawnTimerStarted"},

			UIBossfightPanelShow { UnitTag1 = "lich", UnitTag2 = "", PortraitImage = "boss_P709_lich", DisplayName = Boss_P709_Lich},

		},

	},

--	1st undead tower is destroyed

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - 1st undead tower destroyed <<<",
		Conditions =
		{

			EntityIsNotExisting	{Tag = "undead_tower_1"},

		},
		Actions =
		{

			EntityValueIncrease {Name = "ev_P709_DestroyedTowers"},

		},

	},
	
--	2nd undead tower is destroyed

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - 2nd undead tower destroyed <<<",
		Conditions =
		{

			EntityIsNotExisting	{Tag = "undead_tower_2"},

		},
		Actions =
		{

			EntityValueIncrease {Name = "ev_P709_DestroyedTowers"},

		},

	},
	
--	3rd undead tower is destroyed, loot initialized

	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 - 3rd undead tower destroyed, loot initialized <<<",
		Conditions =
		{

			EntityIsNotExisting	{Tag = "undead_tower_3"},

		},
		Actions =
		{

			EntityValueIncrease {Name = "ev_P709_DestroyedTowers"},

			ObjectSpawn	{ObjectId = 1918, X = 677.5, Y = 492, Direction = 35, Tag = "undead_tower_3_loot"},

			ObjectLootItemMiscAdd	{Tag = "undead_tower_3_loot", DropChance = 100, ItemId = 755},
			ObjectLootItemMiscAdd	{Tag = "undead_tower_3_loot", DropChance = 100, ItemId = 757},
			ObjectLootItemMiscAdd	{Tag = "undead_tower_3_loot", DropChance = 100, ItemId = 752},

		},

	},
	
--	ACHIEVEMENT: STEAL THE KEY
	
	OnOneTimeEvent
	{
		
		EventName = ">>> ACHIEVEMENT: STEAL THE KEY <<<",
		Conditions =
		{

			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},

			AvatarHasItemMisc	{Player = "default", ItemId = 757, Amount = 1},
			
			MapFlagIsFalse {Name = "mf_P709_LichIsDeadOnce"},

		},
		Actions =
		{

			AvatarFlagSetTrue {Name = "af_Achievement_P709_Steal"},

		},

	},
	
-- Main Quest #3 report back
	
	OnOneTimeEvent
	{
		
		EventName = ">>> MQ#3 report back <<<",
		Conditions = 
		{
		
			QuestIsActive	{Player = "default", Quest = "IOS_SUBQ_32"},
	
			PlayerHasNotBuildingAmount	{Player = "pl_Undead", Amount = 1, OnlyCompleted = true},

			EntityIsNotExisting	{Tag = "lich"},

			EntityIsNotExisting	{Tag = "undead_hq_1"},

			EntityIsNotExisting	{Tag = "undead_tower_1"},
			EntityIsNotExisting	{Tag = "undead_tower_2"},
			EntityIsNotExisting	{Tag = "undead_tower_3"},
			
			AvatarHasItemMisc	{Player = "default", ItemId = 755, Amount = 1},
			
		},
		Actions =
		{

			QuestSetSolved	{Player = "default", Quest = "IOS_SUBQ_32"},

			DialogSetEnabled {Tag = "undead_captain"},
			
			MapTimerStart {Name = "mt_P709_ActivateQuest"},

		},

	},
	
--	MQ#3 report back - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> MQ#3 report back - SAVING <<<",
		Conditions = 
		{

			QuestIsSolved	{Player = "default", Quest = "IOS_SUBQ_32"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },
			
			MapTimerStop {Name = "mt_P709_ActivateQuest"},

		},

	},
	
-- ********************************
-- *                              *
-- *   Completing Main Quest #3   *
-- *                              *
-- ********************************

--	Completing Main Quest #3

	OnOneTimeEvent
	{
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_3_Completed"},

--			AvatarHasItemMisc	{Player = "default", ItemId = 755, Amount = 1},

		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_FinishQuest"},

			QuestSetSolved {Quest = "IOS_MQ_3"},

		},
		
	},
	
--	Completing Main Quest #3 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #3 - XP REWARD <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_3_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardMQ3"},

		},

	},

--	Completing Main Quest #3 - ITEM REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #3 - ITEM REWARD <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_3_Completed"},

			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 10},

		},
		Actions =
		{

--	Take the Lich Skull from the player
			
			AvatarItemMiscTake {Player = "default", ItemId = 755, Amount = 1},

--	Give the Crystal Key Death to the player
			
			AvatarItemMiscGive {Player = "default", ItemId = 746, Amount = 1},

		},

	},
	
--	Completing Main Quest #3 - SAVING
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #3 - SAVING <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_3_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 15},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_MQ_3_FINISHED",

	},

};

-- Main Quest #3 finished

State
{

	StateName = "IOS_MQ_3_FINISHED",
	
};