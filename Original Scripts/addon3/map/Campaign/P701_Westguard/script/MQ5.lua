--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")
local DefenseTimer = 300;
local AttackWave = 300;
State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_MQ5_CS04_AWC_End"},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "MQ5_QuestStart"},
			MapTimerStart	{Name = "mt_P701_MQ5_QuestStart"},
			GateSetOpen	{Tag = "HQGate"},
			ObjectVanish	{Tag = "Gate_Blocker_HQ"},
		},
	},
				--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ5_QuestStart", Seconds = 5}
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_42"},
			QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_4"},
			
		},
	},	
	---	XP GIVE
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ5_QuestStart", Seconds = 10}
		},
		Actions =
		{
				AvatarXPGive	{Player = "default", Amount = 800},


		},
	},	
		-- Save
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ5_QuestStart", Seconds = 10}
		},
		Actions =
		{
				
				MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},	
			-- New Quests 
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ5_QuestStart", Seconds = 20}
		},
		Actions =
		{
				
			QuestSetActive	{Player = "default", Quest = "WGA3_MQ_5"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_51"},
				MapTimerStop	{Name = "mt_P701_MQ5_QuestStart"},
		},
	},	
	
	
	OnOneTimeEvent
		{
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 65, TargetTag = "MQ5_HQDefense2"},
			QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_51"},
		},
		Actions =
		{	
			FigureCorpseRotForbid	{Tag = "Thor_Halicos"},
			FigureKill	{Tag = "Thor_Halicos"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard1", Tag = "pl_HumanHeroCaine"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard2", Tag = "Lich"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard3", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard4", Tag = "Lich"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard5", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard6", Tag = "Lich"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard7", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_MQ5_LichInWestguard8", Tag = "pl_HumanHeroCaine"},
			PlayerKitTransfer	{Player = "pl_UndeadHQ", PlayerKit = "pk_UndeadHQ"},
			MapFlagSetTrue {Name = "MQ5_CS05_LastRequest_TeamTransfer"},
			FigureTeleport	{Tag = "Lich", X = 120, Y = 580},
			FigureTeleport	{Tag = "Lich", X = 120, Y = 580},

		},
	},
OnOneTimeEvent
		{
		EventName = "LastReqestMovieStart",
		Conditions = 
		{
			MapFlagIsTrue {Name = "MQ5_CS05_LastRequest_TeamTransfer"},
			QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_51"},
			PlayerHasNotFigureAmount	{Player = "pl_UndeadHQ", Amount = 1},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_LastRequestStart"},
			
		},
	},
				OnOneTimeEvent
		{
		EventName = "LastRequestTimerFinished",
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_LastRequestStart", Seconds = 5},

		},
		Actions =
		{		
				MapFlagSetTrue {Name = "mf_MQ5_CS05_LastRequest_Start"},
				MapTimerStop	{Name = "mt_LastRequestStart"},
		},
	},
		OnOneTimeEvent
		{
		EventName = "DefenseTimerFinished",
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_LichDialogue", Seconds = 5},

		},
		Actions =
		{		
				MapFlagSetTrue {Name = "mf_MQ5_SUBQ_52_DefenseTimer_Finished"},
				
		},
	},	
	
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "MQ5_CS05_LastRequest_TeamTransfer"},
			PlayerHasNotFigureAmount	{Player = "pl_UndeadHQ", Amount = 1},
			QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_51"},
		},
		Actions =
		{
			
			QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_51"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_52"},
			MapFlagSetTrue {Name = "MQ5_SUBQ_52_LastRequest_Start"},
			
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ShaikanHQ"},
				
			PlayerResourceStoneGive	 {Player = "pl_Human", Amount = 2000 },
			PlayerResourceSilverGive {Player = "pl_Human", Amount = 2000 },
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 2000 },
			
			PlayerKitTransfer	{Player = "pl_UDLichGuard", PlayerKit = "pk_UndeadLich"},
			
			PlayerResourceStoneGive	 {Player = "pl_UDLichGuard", Amount = 300 },
			PlayerResourceSilverGive {Player = "pl_UDLichGuard", Amount = 300 },
			PlayerResourceLenyaGive	{Player = "pl_UDLichGuard", Amount = 300 },
			
			---------------------------------------------
		
		--Enemy Buildings
		
		-----------------------------------
			
			-- Stoneshaper
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 166},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 166},
			-- Skull Tower
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 167},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 167},
			-- Mausoleum / HQ
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 168},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 168},
			-- Hall of Bones
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 169},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 169},
			-- Temple of Whispers
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 170},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 170},
			-- Grave Mound
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 171},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 171},
			--Tomb
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 172},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 172},
			--Shrine of the Stalker
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 173},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 173},
			--Nightwing Lair
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 174},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 174},
			--Smeltery
			AITechTreeAddBuilding	{Player = "pl_UDLichGuard", BuildingId = 187},
			PlayerBuildingAdd	{Player = "pl_UDLichGuard", BuildingId = 187},
			--Burial Ground Upgrade
			AITechTreeAddBuildingUpgrade	{Player = "pl_UDLichGuard", UpgradeId = 41},
			PlayerBuildingUpgradeAdd	{Player = "pl_UDLichGuard", UpgradeId = 41},
			--Crypt Upgrade
			AITechTreeAddBuildingUpgrade	{Player = "pl_UDLichGuard", UpgradeId = 42},
			PlayerBuildingUpgradeAdd	{Player = "pl_UDLichGuard", UpgradeId = 42},
			
			
			-------------------------
			
			VisualTimerStart	{Seconds = DefenseTimer},
			MapTimerStart {Name = "mt_P701_MQ_5_DefenseTimer"},
		},
	},
--MQ4_DefenseTimerDone

	OnOneTimeEvent
		{
		EventName = "DefenseTimerFinished",
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_DefenseTimer", Seconds = DefenseTimer},

		},
		Actions =
		{		
				MapFlagSetTrue {Name = "mf_MQ5_SUBQ_52_DefenseTimer_Finished"},
				VisualTimerStop	{},
		},
	},	
	--MQ4_ShaikanTower

	OnOneTimeEvent
		{

		Conditions = 
		{
				
				MapFlagIsTrue {Name = "mf_MQ5_SUBQ_52_DefenseTimer_Finished"},
				BuildingHasNotHealth	{Tag = "ShaikanTower", Percent = 10},
		},
		Actions =
		{		
				BuildingAbilityAdd	{Tag = "ShaikanTower", AbilityId = 527},
				EffectStartAtEntityPosition	{Tag = "ShaikanTower", File = "Effect_Firestorm_Impact"},
				FigureOutcry {TextTag = "OC_MQ5_ShaikanTowerSelfDefense", Tag = "ShaikanTower"},
				EntityTimerStart	{Name = "et_ShaikanTower"},
		},
	},	
	
		OnOneTimeEvent
		{

		Conditions = 
		{
				
				MapFlagIsTrue {Name = "mf_MQ5_SUBQ_52_DefenseTimer_Finished"},
				EntityTimerIsElapsed	{Name = "et_ShaikanTower", Seconds = 4},
		},
		Actions =
		{		
				BuildingAbilityRemove	{Tag = "ShaikanTower", AbilityId = 527},
				EffectStop	{Tag = "Effect_Firestorm_Impact"},
				
				EntityTimerStop	{Name = "et_ShaikanTower"},
		},
	},	
			OnOneTimeEvent
		{

		Conditions = 
		{
				
				MapFlagIsTrue {Name = "mf_MQ5_SUBQ_52_DefenseTimer_Finished"},
				BuildingHasNotHealth	{Tag = "ShaikanTower", Percent = 1},

		},
		Actions =
		{		
				PlayerGameEnds	{},
		},
	},	
	
--MQ4_DefenseTimerDone

	OnOneTimeEvent
		{
		EventName = "DefenseTimerFinished",
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_MQ5_SUBQ_52_DefenseTimer_Finished"},

		},
		Actions =
		{		
				
				VisualTimerStart	{Seconds = AttackWave},
				ObjectVanish	{Tag = "LichRock01"},
				ObjectVanish	{Tag = "LichRock02"},
				ObjectVanish	{Tag = "LichRock03"},
				MapTimerStart {Name = "mt_P701_MQ_5_AttackWave1"},
				FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "ShaikanTowerAttackMarker", Amount = 15 },
				FigureOutcry {TextTag = "OC_MQ5_AttaclWave1", Tag = "pl_HumanAvatar"},
				AIAttackFrequencySet	{Player = "pl_UDLichGuard", Minutes = 0},
				AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 100},
		},
	},
		--MQ4_AttackWave1Finish

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_AttackWave1", Seconds = 2},

		},
		Actions =
		{
				AIAttackFrequencySet	{Player = "pl_UDLichGuard", Minutes = 2},
				AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 0},
		},
	},
	
	--MQ4_AttackWave2

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_AttackWave1", Seconds = 120},

		},
		Actions =
		{
				--FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "ShaikanTowerAttackMarker", Amount = 20 },
				FigureOutcry {TextTag = "OC_MQ5_AttaclWave2", Tag = "pl_HumanHeroCaine"},
								AIAttackFrequencySet	{Player = "pl_UDLichGuard", Minutes = 0},
				AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 100},
		},
	},
			--MQ4_AttackWave2Finish

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_AttackWave1", Seconds = 122},

		},
		Actions =
		{
				AIAttackFrequencySet	{Player = "pl_UDLichGuard", Minutes = 2},
				AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 0},
		},
	},
		--MQ4_AttackWave2

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_AttackWave1", Seconds = 240},

		},
		Actions =
		{
				--FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "ShaikanTowerAttackMarker", Amount = 30 },
				FigureOutcry {TextTag = "OC_MQ5_AttaclWave3", Tag = "pl_HumanAvatar"},
				AIAttackFrequencySet	{Player = "pl_UDLichGuard", Minutes = 0},
				AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 100},
		},
	},
				--MQ4_AttackWave2Finish

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_AttackWave1", Seconds = 242},

		},
		Actions =
		{
				AIAttackFrequencySet	{Player = "pl_UDLichGuard", Minutes = 5},
				AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 20},
		},
	},
--MQ4_AttackWavesTimerDone

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P701_MQ_5_AttackWave1", Seconds = AttackWave},

		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_MQ5_SUBQ_52_AttackTimer1_Finished"},
				VisualTimerStop	{},
		},
	},
--MQ4_AttackTimer1Done

	OnOneTimeEvent
		{
		EventName = "AttackTimer1Finished",
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_MQ5_SUBQ_52_AttackTimer1_Finished"},
				BuildingIsAlive	{Tag = "ShaikanTower"},
		},
		Actions =
		{		
				MapFlagSetTrue {Name = "mf_P701_MQ_5_Completed"},
		},
	},
	
--MQ4_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_5_Completed"},

		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_MQ6_CS06_TowerOfTheShaikan_Start"},
		},
	},	
	
}


	
	
