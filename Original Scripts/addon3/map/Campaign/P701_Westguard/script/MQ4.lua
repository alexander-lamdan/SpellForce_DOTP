--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MQ3_CS03_ShaikanCouncil_End"},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_MQ4_QuestStart"},
			MapFlagSetTrue {Name = "mf_MQ4_Available"},
			DialogSetEnabled {Tag = "Lieutenant"},
			PlayerHeroAdd { HeroId = 255 }, 
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 20},},
   		FigureVanish	{Tag = "Sariel"},
   		FigureVanish	{Tag = "CaineCS"},
		},
	},

OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ4_QuestAccepted"},

		},
		Actions =
		{	
		
		ObjectVanish	{Tag = "LieutenantMarker"},	
				
		MapTimerStart	{Name = "mt_P701_MQ4_QuestAccepted"},
		MapFlagSetFalse {Name = "mf_MQ4_Available"},	
		FigureTeamTransfer	{Tag = "Refugee_IPR1_1", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR1_2", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR1_3", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR2_1", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR2_2", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR2_3", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR3_1", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR3_2", Team = "tm_Lighthouse"},
		FigureTeamTransfer	{Tag = "Refugee_IPR3_3", Team = "tm_Lighthouse"},
		

				MapFlagSetTrue {Name = "mf_MQ4_QuestStart"},
				
				ObjectVanish	{Tag = "HarbourRock01"},
				ObjectVanish	{Tag = "HarbourRock02"},
				
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Shaikan"},
				
				PlayerResourceStoneGive	 {Player = "pl_Human", Amount = 500 },
			PlayerResourceSilverGive {Player = "pl_Human", Amount = 500 },
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 500 },

			-- HQ (550st): produces Builders, Blademasters, Marksmen and Titans.
			PlayerBuildingAdd	{BuildingId = 191}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 45}, -- Shaikan HQ Upgrd (250st) 
			PlayerBuildingUpgradeAdd	{UpgradeId = 46}, -- Blades HQ Upgrd (250st)
			PlayerBuildingUpgradeAdd	{UpgradeId = 47}, -- Dragons HQ Upgrd (250st)

			-- Food Store (40st)
			PlayerBuildingAdd	{BuildingId = 192}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 48}, -- Depot (From Food Store, 90st)

			-- Resource buildings
			PlayerBuildingAdd	{BuildingId = 193}, -- Stonemason (60st)
			PlayerBuildingAdd	{BuildingId = 194}, -- Smeltery (60st)
			PlayerBuildingAdd	{BuildingId = 195}, -- Alchemist (60st)
			
			-- Altar of Life (HQ, 1000st)
			PlayerBuildingAdd	{BuildingId = 196}, 

			-- Practice Ground (HQ, 100st) enables the prod of Bladesmasters in HQ + upgrades Blademasters 
			PlayerBuildingAdd	{BuildingId = 197}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 52}, -- Weapons Master (From Practice Ground, 180st): enables the prod of Marksmen in HQ + upgrades Marksmen 

			-- Tower (190st, 60si)
			PlayerBuildingAdd	{BuildingId = 198}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 49}, -- Tower Blade Upgrd (30st, 30L)
			PlayerBuildingUpgradeAdd	{UpgradeId = 50}, -- Tower Dragon Upgrd (40si)
			PlayerBuildingUpgradeAdd	{UpgradeId = 51}, -- Tower Shaikan Upgrd (100L) - conjures a flying dragonling to defend

			-- Nexus (Blades HQ Upgrd, 300st), produces: Minion, and if unlocked: Spellbreaker and Destroyer
			PlayerBuildingAdd	{BuildingId = 199}, 

			-- Blades Soulforge (Nexus, 250st), unlocks Spellbreaker in Nexus
			PlayerBuildingAdd	{BuildingId = 200}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 53}, -- Blades Black Anvil (From Blades Soulforge, 350st): unlocks Destroyer in Nexus

			-- Den (Dragons HQ Upgr + 250st)
			PlayerBuildingAdd	{BuildingId = 201}, -- produces Wyrm (non-flying)
--			PlayerBuildingUpgradeAdd	{UpgradeId = 54}, -- Dragon Fire Mountain (From Den, 250st): Produces Fire Drake (flying)
--			PlayerBuildingUpgradeAdd	{UpgradeId = 57}, -- Dragon Stone of Ethernity (From Fire Mountain, 250st): Produces Crystal Drake (flying)

			-- Barracks (Shaikan HQ Upgr + 350st): Produces Vanguards (plus Blademasters and Marksmen)
			PlayerBuildingAdd	{BuildingId = 203}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 55}, -- Garrison (From Barracks, 250st): Produces Standard Bearer
			PlayerBuildingUpgradeAdd	{UpgradeId = 56}, -- Dragon Keep (From Barracks, Garrison + 250st): Produces Blood Mages

			-- Halls of Teaching (From Barracks, 300st, 100si, 100L): upgrades the units from Barracks
			PlayerBuildingAdd	{BuildingId = 204}, 
		----------------------------------------
			
		},
	},
		--HQ Destroyed
	OnOneTimeEvent
		{
		Conditions = 
		{
				BuildingIsDead	{Tag = "PlayerHQ1"},
				PlayerHasNotUnitAmount	{Player = "default", UnitId = 158, Amount = 1},
		},
		Actions =
		{
										
				PlayerGameOver	{Player = "default", Tag = "PlayerHQ1", LocaTag = "IGMenuGameOver_Title"},
		
			
		},
	},	
			--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ4_QuestAccepted", Seconds = 5}
		},
		Actions =
		{
										
						QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_33"},
						QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_3"},
		
			
		},
	},	
	---	XP GIVE
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ4_QuestAccepted", Seconds = 10}
		},
		Actions =
		{
				AvatarXPGive	{Player = "default", Amount = 600},
		
				
		},
	},	
		-- Save
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ4_QuestAccepted", Seconds = 10}
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
				MapTimerIsElapsed	{Name = "mt_P701_MQ4_QuestAccepted", Seconds = 20}
		},
		Actions =
		{
				
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_4"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_41"},
				--MapTimerStop	{Name = "mt_P701_MQ4_QuestAccepted"},
		},
	},	
	
	---	AI ATTACK
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ4_QuestAccepted", Seconds = 400}
		},
		Actions =
		{
				FigureAttackEntity	{Tag = "RaiderHQ1", TargetTag = "PlayerHQ1"},
				FigureAttackEntity	{Tag = "RaiderHQ2", TargetTag = "PlayerHQ1"},
				FigureAttackEntity	{Tag = "RaiderHQ3", TargetTag = "PlayerHQ1"},
				FigureAttackEntity	{Tag = "RaiderHQ4", TargetTag = "PlayerHQ1"},
				FigureAttackEntity	{Tag = "RaiderHQ5", TargetTag = "PlayerHQ1"},
		},
	},
		---	AI ATTACK
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ4_QuestAccepted", Seconds = 600}
		},
		Actions =
		{
				--- Enemy Player Kit transfer
		
		------------------------------------------
			PlayerKitTransfer	{Player = "pl_EnemyHarbour", PlayerKit = "pk_UndeadHarbour"},
		
			PlayerResourceStoneGive	 {Player = "pl_EnemyHarbour", Amount = 500 },
			PlayerResourceSilverGive {Player = "pl_EnemyHarbour", Amount = 500 },
			PlayerResourceLenyaGive	{Player = "pl_EnemyHarbour", Amount = 500 },
		---------------------------------------------
		
		--Enemy Buildings
		
		-----------------------------------
			
			-- Stoneshaper
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 166},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 166},
			-- Skull Tower
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 167},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 167},
			-- Mausoleum / HQ
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 168},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 168},
			-- Hall of Bones
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 169},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 169},
			-- Temple of Whispers
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 170},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 170},
			-- Grave Mound
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 171},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 171},
			--Tomb
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 172},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 172},
			--Shrine of the Stalker
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 173},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 173},
			--Nightwing Lair
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 174},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 174},
			--Smeltery
			AITechTreeAddBuilding	{Player = "pl_EnemyHarbour", BuildingId = 187},
			--PlayerBuildingAdd	{Player = "pl_EnemyHarbour", BuildingId = 187},
			--Burial Ground Upgrade
			AITechTreeAddBuildingUpgrade	{Player = "pl_EnemyHarbour", UpgradeId = 41},
			--PlayerBuildingUpgradeAdd	{Player = "pl_EnemyHarbour", UpgradeId = 41},
			--Crypt Upgrade
			AITechTreeAddBuildingUpgrade	{Player = "pl_EnemyHarbour", UpgradeId = 42},
			--PlayerBuildingUpgradeAdd	{Player = "pl_EnemyHarbour", UpgradeId = 42},
			
			
			-------------------------
			
			
			
			

				
		},
	},	
	OnOneTimeEvent
		{
		Conditions = 
		{
				
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_41"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Refugee_IPR1_1"},
		},
		Actions =
		{
				FigureOutcry	{TextTag = "OC_SQ6_SACK1UP", Tag = "Refugee_IPR1_3"},
				FigureFollowEntity	{Tag = "Refugee_IPR1_1", TargetTag = "pl_HumanAvatar"},
				FigureFollowEntity	{Tag = "Refugee_IPR1_2", TargetTag = "pl_HumanAvatar"},
				FigureFollowEntity	{Tag = "Refugee_IPR1_3", TargetTag = "pl_HumanAvatar"},
				FigureTeamTransfer	{Tag = "Refugee_IPR1_1", Team = "tm_Lighthouse"},
				FigureTeamTransfer	{Tag = "Refugee_IPR1_2", Team = "tm_Lighthouse"},
				FigureTeamTransfer	{Tag = "Refugee_IPR1_3", Team = "tm_Lighthouse"},
				FigureAttackEntity	{Tag = "Raiders1_1", TargetTag = "Refugee_IPR1_1"},
				FigureAttackEntity	{Tag = "Raiders1_2", TargetTag = "Refugee_IPR1_1"},
				FigureForceAttackEntity	{Tag = "Raiders1_3", TargetTag = "Refugee_IPR1_2"},
				FigureAttackEntity	{Tag = "Raiders1_4", TargetTag = "Refugee_IPR1_3"},
				FigureForceAttackEntity	{Tag = "Raiders1_5", TargetTag = "Refugee_IPR1_3"},
		},
	},	
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_41"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Refugee_IPR2_1"},
				
		},
		Actions =
		{
				FigureOutcry	{TextTag = "OC_SQ6_SACK1UP", Tag = "Refugee_IPR2_3"},
				FigureFollowEntity	{Tag = "Refugee_IPR2_1", TargetTag = "pl_HumanAvatar"},
				FigureFollowEntity	{Tag = "Refugee_IPR2_2", TargetTag = "pl_HumanAvatar"},
				FigureFollowEntity	{Tag = "Refugee_IPR2_3", TargetTag = "pl_HumanAvatar"},
				FigureTeamTransfer	{Tag = "Refugee_IPR2_1", Team = "tm_Lighthouse"},
				FigureTeamTransfer	{Tag = "Refugee_IPR2_2", Team = "tm_Lighthouse"},
				FigureTeamTransfer	{Tag = "Refugee_IPR2_3", Team = "tm_Lighthouse"},
		},
	},

		OnOneTimeEvent
		{
		Conditions = 
		{
				
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_41"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Refugee_IPR3_1"},

		},
		Actions =
		{
				FigureOutcry	{TextTag = "OC_MQ1_Saved1", Tag = "Refugee_IPR3_3"},
				FigureFollowEntity	{Tag = "Refugee_IPR3_1", TargetTag = "pl_HumanAvatar"},
				FigureFollowEntity	{Tag = "Refugee_IPR3_2", TargetTag = "pl_HumanAvatar"},
				FigureFollowEntity	{Tag = "Refugee_IPR3_3", TargetTag = "pl_HumanAvatar"},
				FigureTeamTransfer	{Tag = "Refugee_IPR3_1", Team = "tm_Lighthouse"},
				FigureTeamTransfer	{Tag = "Refugee_IPR3_2", Team = "tm_Lighthouse"},
				FigureTeamTransfer	{Tag = "Refugee_IPR3_3", Team = "tm_Lighthouse"},
				FigureAttackEntity	{Tag = "Raiders2_1", TargetTag = "Refugee_IPR3_1"},
				FigureForceAttackEntity	{Tag = "Raiders2_2", TargetTag = "Refugee_IPR3_1"},
				FigureAttackEntity	{Tag = "Raiders2_3", TargetTag = "Refugee_IPR3_2"},
				FigureForceAttackEntity	{Tag = "Raiders2_4", TargetTag = "Refugee_IPR3_2"},
				FigureForceAttackEntity	{Tag = "Raiders2_5", TargetTag = "Refugee_IPR3_3"},
		},
	},
	
	-- MQ4 SUBQ_41 RefugeesAreSafeOrDead
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_41"},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR1_1"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR1_1", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR1_2"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR1_2", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR1_3"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR1_3", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
						OR	{
					FigureIsDead	{Tag = "Refugee_IPR2_1"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR2_1", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR2_2"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR2_2", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR2_3"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR2_3", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
						OR	{
					FigureIsDead	{Tag = "Refugee_IPR3_1"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR3_1", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR3_2"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR3_2", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
					OR	{
					FigureIsDead	{Tag = "Refugee_IPR3_3"},
					FigureIsInRangeToEntity	{Tag = "Refugee_IPR3_3", TargetTag = "MQ4_RescueEndZone", Range = 20},
					},
	
		},
		Actions =
		{

				MapFlagSetTrue {Name = "MQ4_SubQuest41Finish"},
				
		},
	},	
				-- MQ4 SUBQ_41 RefugeesAreAllAlive
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				MapFlagIsTrue {Name = "MQ4_SubQuest41Finish"},
				FigureIsAlive	{Tag = "Refugee_IPR1_1"},
				FigureIsAlive	{Tag = "Refugee_IPR2_1"},
				FigureIsAlive	{Tag = "Refugee_IPR3_1"},
				FigureIsAlive	{Tag = "Refugee_IPR1_2"},
				FigureIsAlive	{Tag = "Refugee_IPR2_2"},
				FigureIsAlive	{Tag = "Refugee_IPR3_2"},
				FigureIsAlive	{Tag = "Refugee_IPR1_3"},
				FigureIsAlive	{Tag = "Refugee_IPR2_3"},
				FigureIsAlive	{Tag = "Refugee_IPR3_3"},
			},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_AllRefugeeSaved"},
		},
	},	
		-- MQ4 SUBQ_41 RefugeesAreSafeOrDead
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "MQ4_SubQuest41Finish"},
			},	
		Actions =
		{
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_41"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_42"},
				FigureVanish	{Tag = "Refugee_IPR1_1"},
				FigureVanish	{Tag = "Refugee_IPR2_1"},
				FigureVanish	{Tag = "Refugee_IPR3_1"},
				FigureVanish	{Tag = "Refugee_IPR1_2"},
				FigureVanish	{Tag = "Refugee_IPR2_2"},
				FigureVanish	{Tag = "Refugee_IPR3_2"},
				FigureVanish	{Tag = "Refugee_IPR1_3"},
				FigureVanish	{Tag = "Refugee_IPR2_3"},
				FigureVanish	{Tag = "Refugee_IPR3_3"},
				ObjectChange	{Tag = "MarketstallBread", ObjectId = 322, X = 411.564, Y = 394.907, Direction = 0},
				
		},
	},	
	
	--MQ4_SUBQ_41_AllRefugeesAreDead

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_41"},
				FigureIsDead	{Tag = "Refugee_IPR1_1"},
				FigureIsDead	{Tag = "Refugee_IPR2_1"},
				FigureIsDead	{Tag = "Refugee_IPR3_1"},
				FigureIsDead	{Tag = "Refugee_IPR1_2"},
				FigureIsDead	{Tag = "Refugee_IPR2_2"},
				FigureIsDead	{Tag = "Refugee_IPR3_2"},
				FigureIsDead	{Tag = "Refugee_IPR1_3"},
				FigureIsDead	{Tag = "Refugee_IPR2_3"},
				FigureIsDead	{Tag = "Refugee_IPR3_3"},

		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_4_Failed"},
				PlayerGameEnds {},
		},
	},

	--MQ4_SUBQ_41_AllRefugeesAreDead

	OnOneTimeEvent
		{
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_42"},
			
			FigureIsDead	{Tag = "UndeadShipGuard_1"},
			FigureIsDead	{Tag = "UndeadShipGuard_2"},
			FigureIsDead	{Tag = "UndeadShipGuard_3"},
			FigureIsDead	{Tag = "UndeadShipGuard_4"},
			
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 166, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 167, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 168, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 169, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 170, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 171, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 172, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 173, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 174, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 187, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 41, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerBuildingIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", BuildingId = 42, Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			PlayerFigureIsNotInRangeToEntity	{Player = "pl_EnemyHarbour", Range = 45, TargetTag = "MQ4_HarbourMapLocator"},
			SetUpdateInterval	{Steps = 15},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_4_Completed"},
				
		},
	},

--MQ4_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_4_Completed"},

		},
		Actions =
		{

				
				MapFlagSetTrue {Name = "mf_MQ5_CS04_AWC_Start"},
				
		},
	},	
	
}


	
	
