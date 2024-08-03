--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "DEBUG",


OnOneTimeEvent
	{
		EventName = "CheatWeapons",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P701_Start_CS01_End"},
		},
		Actions = 
		{
							-------------------------------------------------------------------------------------------------
-- CHEAT mode
-------------------------------------------------------------------------------------------------
				AvatarItemEquipmentGive {Player = "default", ItemId = 1115 , Amount = 1 },
				AvatarItemEquipmentGive {Player = "default", ItemId = 1116 , Amount = 1 },
				AvatarItemEquipmentGive {Player = "default", ItemId = 1117 , Amount = 1 },
				
				AvatarGoldGive	{Player = "default", Amount = 300},
				AvatarValueAdd {Player = "default", Name = "ach_dotp_gold", Value = 300},
				
				ObjectSpawn	{ObjectId = 1089, X = 387.085, Y = 298.267,  Direction = 0, Tag = "CheatLever_NextMap"},
				MapFlagSetTrue	{Name = "mf_P701_MQ_3_DEATH"},
				--ObjectSpawn	{ObjectId = 1089, X = 390.085, Y = 298.267,  Direction = 0, Tag = "MQ3_Cheat"},
		},

	};

	OnLeverEvent
	{
		EventName = ">>> Cheat: Screenshot cutscene <<<",
		Delay = 3,
		Lever = "cheat_lever_50",
		OnConditions = 
		{
			LeverIsOn	{Tag = "cheat_lever_50"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_CS_50_Start"},
		},
	},
--	CHEAT 3 ON
	OnOneTimeEvent
	{
		EventName = ">>> CHEAT Cheat_CS2 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Cheat_CS2"},
		},
		Actions = 
		{
				FigureTeleport	{Tag = "pl_HumanAvatar", X = 582, Y = 88},
				AvatarXPGive	{Player = "default", Amount = 1000},
				MapFlagSetFalse{Name = "mf_P701_Start_CS01_End"},
				MapFlagSetFalse{Name = "mf_SQ1_Completed"},
				MapFlagSetFalse{Name = "mf_P701_MQ_1_Completed"},

	
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
				MapFlagSetTrue {Name = "mf_MQ2_CS02_GatesAreStillOpen_Start"},
				MapFlagSetTrue {Name = "mf_P701_SQ_1_Completed"},
				MapFlagSetTrue {Name = "mf_SQ2_Available"},
				--DialogSetDisabled {Tag = "Lieutenant"},
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Westguard"},
								--- Figure Immortality
				FigureAbilityRemove {AbilityId = Ability.Immortal,Tag = "Undead_IPB1_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB1_2"},

				--- IPB 2
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_1"},

				--- IPB 3
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_1"},

				--- IPB 4
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_5"},

				--- IPB 5
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_3"},

				--- IPB 6
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_5"},
				
				--KILL
				FigureKill	{Tag = "Undead_IPB1_1"},
				FigureKill	{ Tag = "Undead_IPB1_2"},
				FigureKill	{ Tag = "Undead_IPB1_3"},
				FigureKill	{ Tag = "CityGuard_IPB1_2"},

				--- IPB 2
				FigureKill	{ Tag = "Undead_IPB2_1"},
				FigureKill	{ Tag = "Undead_IPB2_2"},
				FigureKill	{ Tag = "Undead_IPB2_3"},
				FigureKill	{ Tag = "CityGuard_IPB2_1"},

				--- IPB 3
				FigureKill	{ Tag = "Undead_IPB3_1"},
				FigureKill	{ Tag = "Undead_IPB3_2"},
				FigureKill	{ Tag = "Undead_IPB3_3"},
				FigureKill	{ Tag = "CityGuard_IPB3_1"},

				--- IPB 4
				FigureKill	{ Tag = "Undead_IPB4_1"},
				FigureKill	{ Tag = "Undead_IPB4_2"},
				FigureKill	{ Tag = "Undead_IPB4_3"},
				FigureKill	{ Tag = "Undead_IPB4_4"},
				FigureKill	{ Tag = "Undead_IPB4_5"},

				--- IPB 5
				FigureKill	{ Tag = "Undead_IPB5_1"},
				FigureKill	{ Tag = "Undead_IPB5_2"},
				FigureKill	{ Tag = "Undead_IPB5_3"},

				--- IPB 6
				FigureKill	{ Tag = "Undead_IPB6_1"},
				FigureKill	{ Tag = "Undead_IPB6_2"},
				FigureKill	{ Tag = "Undead_IPB6_3"},
				FigureKill	{ Tag = "Undead_IPB6_4"},
				FigureKill	{ Tag = "Undead_IPB6_5"},
				
				LeverSetOff	{Tag = "MQ3_Cheat"},
		},
	},

--	CHEAT 3 ON
	OnOneTimeEvent
	{
		EventName = ">>> CHEAT 3 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "MQ3_Cheat"},
		},
		Actions = 
		{
				FigureTeleport	{Tag = "pl_HumanAvatar", X = 582, Y = 88},
				AvatarXPGive	{Player = "default", Amount = 1000},
				MapFlagSetFalse{Name = "mf_P701_Start_CS01_End"},
				MapFlagSetFalse{Name = "mf_SQ1_Completed"},
				MapFlagSetFalse{Name = "mf_P701_MQ_1_Completed"},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_Completed"},
				MapFlagSetTrue {Name = "mf_SQ6_Accepted"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
				MapFlagSetTrue {Name = "mf_P701_Lighthouse_CS03_End"},
				MapFlagSetTrue {Name = "mf_P701_SQ_1_Completed"},
				MapFlagSetTrue {Name = "mf_SQ2_Available"},
				--DialogSetDisabled {Tag = "Lieutenant"},
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Westguard"},
								--- Figure Immortality
				FigureAbilityRemove {AbilityId = Ability.Immortal,Tag = "Undead_IPB1_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB1_2"},

				--- IPB 2
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_1"},

				--- IPB 3
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_1"},

				--- IPB 4
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_5"},

				--- IPB 5
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_3"},

				--- IPB 6
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_5"},
				
				--KILL
				FigureKill	{Tag = "Undead_IPB1_1"},
				FigureKill	{ Tag = "Undead_IPB1_2"},
				FigureKill	{ Tag = "Undead_IPB1_3"},
				FigureKill	{ Tag = "CityGuard_IPB1_2"},

				--- IPB 2
				FigureKill	{ Tag = "Undead_IPB2_1"},
				FigureKill	{ Tag = "Undead_IPB2_2"},
				FigureKill	{ Tag = "Undead_IPB2_3"},
				FigureKill	{ Tag = "CityGuard_IPB2_1"},

				--- IPB 3
				FigureKill	{ Tag = "Undead_IPB3_1"},
				FigureKill	{ Tag = "Undead_IPB3_2"},
				FigureKill	{ Tag = "Undead_IPB3_3"},
				FigureKill	{ Tag = "CityGuard_IPB3_1"},

				--- IPB 4
				FigureKill	{ Tag = "Undead_IPB4_1"},
				FigureKill	{ Tag = "Undead_IPB4_2"},
				FigureKill	{ Tag = "Undead_IPB4_3"},
				FigureKill	{ Tag = "Undead_IPB4_4"},
				FigureKill	{ Tag = "Undead_IPB4_5"},

				--- IPB 5
				FigureKill	{ Tag = "Undead_IPB5_1"},
				FigureKill	{ Tag = "Undead_IPB5_2"},
				FigureKill	{ Tag = "Undead_IPB5_3"},

				--- IPB 6
				FigureKill	{ Tag = "Undead_IPB6_1"},
				FigureKill	{ Tag = "Undead_IPB6_2"},
				FigureKill	{ Tag = "Undead_IPB6_3"},
				FigureKill	{ Tag = "Undead_IPB6_4"},
				FigureKill	{ Tag = "Undead_IPB6_5"},
				
				LeverSetOff	{Tag = "MQ3_Cheat"},
		},
	},
--	CHEAT 4 ON


	OnOneTimeEvent
	{
		EventName = ">>> CHEAT 4 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "MQ4_Cheat"},
		},
		Actions = 
		{
				MapFlagSetTrue {Name = "MQ3_CS03_ShaikanCouncil_End"},
				FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "HarbourRock01"},
				ObjectVanish	{Tag = "HarbourRock01"},
				MapFlagSetFalse{Name = "mf_P701_Start_CS01_End"},
				MapFlagSetFalse{Name = "mf_P701_MQ_1_Completed"},
				MapFlagSetFalse{Name = "mf_P701_MQ_2_Completed"},
				MapFlagSetTrue{Name = "mf_P701_MQ_3_Completed"},
				DialogSetEnabled {Tag = "Merchant_Odelle"},
				MapFlagSetTrue{Name = "mf_SQ6_Available"},
				AvatarItemMiscGive	{Player = "default", ItemId = 605, Amount = 1},
				AvatarItemMiscGive	{Player = "default", ItemId = 606, Amount = 1},
				AvatarItemMiscGive	{Player = "default", ItemId = 607, Amount = 1},
				AvatarItemMiscGive	{Player = "default", ItemId = 608, Amount = 1},
				PlayerResourceStoneGive	 {Player = "pl_Human", Amount = 5000 },
				PlayerResourceSilverGive {Player = "pl_Human", Amount = 5000 },
				PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 5000 },
				--MQ4 AllVanish
				ObjectChange	{Tag = "MarketstallBread", ObjectId = 322, X = 411.564, Y = 394.907, Direction = 0},
				--MQ1 IPB2
				ObjectChange	{Tag = "MarketstallMeat", ObjectId = 323, X = 396.194, Y = 397.359, Direction = 90},
				--MQ1 IPB1
				ObjectChange	{Tag = "MarkettablePotatoes", ObjectId = 326, X = 400.367, Y = 386.465, Direction = 47.5555},
				ObjectChange	{Tag = "MarkettableTomatoes", ObjectId = 326, X = 403.833, Y = 387.565, Direction = 0},
				--MQ3 AllEventsCompleted
				ObjectChange	{Tag = "MarketstallCheese", ObjectId = 323, X = 411.491, Y = 386.582, Direction = 0},
				--
				ObjectChange	{Tag = "MarketstallJars", ObjectId = 322, X = 403.958, Y = 397.401, Direction = 90},
				
				
				--QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
				-------------------------------------------------------------------------------------------------
-- CHEAT mode
-------------------------------------------------------------------------------------------------
			--	AvatarItemEquipmentGive {Player = "default", ItemId = 1115 , Amount = 1 },
			--	AvatarItemEquipmentGive {Player = "default", ItemId = 1116 , Amount = 1 },
				--AvatarItemEquipmentGive {Player = "default", ItemId = 1117 , Amount = 1 },
				
				LeverSetOff	{Tag = "MQ4_Cheat"},
		},
	},
	
	
--	CHEAT 5 ON


	OnOneTimeEvent
	{
		EventName = ">>> CHEAT 5 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "MQ5_Cheat"},
		},
		Actions = 
		{

				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
				MapFlagSetTrue{Name = "mf_MQ5_CS04_AWC_Start"},
				-------------------------------------------------------------------------------------------------
-- CHEAT mode
-------------------------------------------------------------------------------------------------
				AvatarItemEquipmentGive {Player = "default", ItemId = 1115 , Amount = 1 },
				AvatarItemEquipmentGive {Player = "default", ItemId = 1116 , Amount = 1 },
				AvatarItemEquipmentGive {Player = "default", ItemId = 1117 , Amount = 1 },
				FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MQ5_HQDefense1"},
				FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MQ5_HQDefense1"},
				LeverSetOff	{Tag = "MQ5_Cheat"},
		},
	},
--	CHEAT 6 ON


	OnOneTimeEvent
	{
		EventName = ">>> CHEAT 6 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "MQ6_Cheat"},
		},
		Actions = 
		{
			
			MapFlagSetFalse{Name = "mf_P701_MQ_2_Completed"},
			QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
				
			MapFlagSetTrue{Name = "mf_MQ6_CS06_TowerOfTheShaikan_End"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 200, Y = 504},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 200, Y = 504},
				
			FigureTeleportToEntity	{Tag = "Lich", TargetTag = "LichRespawnFix"},
			FigureTeleportToEntity	{Tag = "Lich", TargetTag = "LichRespawnFix"},
				
			LeverSetOff	{Tag = "MQ6_Cheat"},
		},
	},

--	CHEAT CS5 ON


	OnOneTimeEvent
	{
		EventName = ">>> CHEAT CS5 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Cheat_LastRequest"},
		},
		Actions = 
		{
			


				

				
			FigureCorpseRotForbid	{Tag = "Thor_Halicos"},
			FigureKill	{Tag = "Thor_Halicos"},
			
			FigureTeleportToEntity	{Tag = "Lich", TargetTag = "LichRespawnFix"},
			FigureTeleportToEntity	{Tag = "Lich", TargetTag = "LichRespawnFix"},
			
			MapFlagSetTrue{Name = "mf_MQ5_CS05_LastRequest_Start"},

				
			LeverSetOff	{Tag = "Cheat_LastRequest"},
		},
	},

--	CHEAT CS6 ON


	OnOneTimeEvent
	{
		EventName = ">>> CHEAT 6 ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Cheat_TowerOfTheShaikan"},
		},
		Actions = 
		{		

				MapFlagSetTrue {Name = "mf_SQ7_Accepted"},
				MapFlagSetTrue {Name = "mf_SQ8_Accepted"},
				FigureTeleportToEntity	{Tag = "Darc", TargetTag = "DarcRunpoint1"},

				FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "DarcRunpoint1"},
			LeverSetOff	{Tag = "Cheat_TowerOfTheShaikan"},
		},
	},

--	CHEAT CS7 ON


	OnOneTimeEvent
	{
		EventName = ">>> Cheat_VictoryAfterParley <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Cheat_VictoryAfterParley"},
		},
		Actions = 
		{
		
			FigureTeleportToEntity	{Tag = "Lich", TargetTag = "LichRespawnFix"},
			FigureTeleportToEntity	{Tag = "Lich", TargetTag = "LichRespawnFix"},
			
			MapFlagSetTrue{Name = "mf_MQ6_CS06_VictoryAfterParley_Start"},
			
			LeverSetOff	{Tag = "Cheat_VictoryAfterParley"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> CHEAT DEATH ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Cheat_DEATH"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P701_MQ_3_DEATH"},
			LeverSetOff	{Tag = "Cheat_DEATH"},
		},
	},
	
		OnOneTimeEvent
	{
		EventName = ">>> CHEAT VENERATION ON <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Cheat_VENERATION"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P701_MQ_3_VENERATION"},
			LeverSetOff	{Tag = "Cheat_VENERATION"},
		},
	},	
	--- MAP CHANGE TO STEPPING STONES
		OnOneTimeEvent
	{
		
		EventName = ">>> CheatLever_NextMap is turned on <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "CheatLever_NextMap"},
		},
		Actions =
		{
			--AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
			AvatarXPGive	{Player = "default", Amount = 3900},
			QuestSetActive	{Player = "default", Quest = "SS_NOR_11"},
			PlayerHeroAdd {HeroId = 251 },
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroFirst", TargetTag = "pl_HumanAvatar", Direction = 90},},
			PlayerHeroAdd {HeroId = 255 },
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 90},},

			--PlayerMapTravelAddon3	{Map = "Campaign/P702_Stepping_Stones", TargetTag = "Map_Start_Point"},
	},
},


---------
---------
---------

	OnOneTimeEvent
	{
		EventName = ">>> CHEAT xxx OFF <<<",
		Conditions = 
		{
--			LeverIsOff	{Tag = "Cheat_Lever_1"},
		},
		Actions = 
		{
		},
	},

}
