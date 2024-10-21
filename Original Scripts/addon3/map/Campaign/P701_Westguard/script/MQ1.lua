--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",


 
 OnOneTimeEvent
 {
  EventName = ">>> every adventurer died (the death of the dragon is handled in dragon.lua) <<<",
  Conditions = 
  {
   MapFlagIsTrue {Name = "mf_P701_Start_CS01_End"},
   FigureIsDead {Tag = "pl_HumanAvatar"},
   FigureIsDead {Tag = "pl_HumanHeroCaine"},
   FigureIsDead {Tag = "pl_HumanHeroOrc"},
   FigureIsDead {Tag = "pl_HumanHeroFirst"},
   FigureIsDead {Tag = "pl_HumanHeroSecond"},
   PlayerHasNotUnitAmount	{Player = "default", UnitId = 158, Amount = 1},
   --FigureIsDead {Tag = "pl_HumanHeroThird"},
  },
  Actions =
  {
   PlayerGameOver {Player = "default", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title"},
  },
 },
OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_Start_CS01_End"},
		},
		Actions =
		{
				
				DialogSetEnabled {Tag = "Lieutenant"},
				QuestSetActive	{Player = "default", Quest = "WGA3_ACT_1"},
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_1"},
				
				FigureVanish	{Tag = "AvatarSpirit"},
				FigureVanish	{Tag = "CraigSpirit"},
				FigureVanish	{Tag = "CaineCS"},
				FigureVanish	{Tag = "Sariel"},
				FigureVanish	{Tag = "Kelar"},
				FigureVanish	{Tag = "Soldier"},
				FigureVanish	{Tag = "Citizen01"},
				FigureVanish	{Tag = "Citizen02"},
				FigureVanish	{Tag = "Citizen03"},
				
				FigureVanish	{Tag = "KelarEnd"},
				FigureVanish	{Tag = "SoulcarrierEnd"},
				FigureVanish	{Tag = "NoradimEnd"},
				
				DialogSetDisabled {Tag = "Guardian_Of_Souls"},
				DialogSetDisabled {Tag = "Jasee"},
				
				DialogSetDisabled {Tag = "Nuri"},
				DialogSetDisabled {Tag = "Necros"},
				DialogSetDisabled {Tag = "Alana"},
				DialogSetDisabled {Tag = "Invictus"},
				MapValueSet	{Name = "mv_NumberOfHeroes", Value = 1},
				MapFlagSetTrue {Name = "mf_QuestStart"},
				MapFlagSetTrue{Name = "mf_SQ1_Accepted"},
				ObjectChange	{Tag = "HQGate_Broken", ObjectId = 1591, X = 304.273, Y = 302.452, Direction = 90},
				GateSetClosed	{Tag = "HQGate"},
				
				
				BuildingAbilityAdd {AbilityId = Ability.Liferegeneration200, Tag = "LighthouseBuilding"},
				BuildingAbilityAdd {AbilityId = Ability.Immortal, Tag = "ShaikanTower"},
				
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Darc"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Lieutenant"},
				-- Lich burn
				EffectStartAtEntityPosition {Tag = "Lich", File = "Effect_Misc_Cauldron"},
				EffectStartAtEntityPosition {Tag = "Lich", File = "Effect_Skulltile_Glow"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Lich"},
				FigureAbilityAdd {AbilityId = Ability.Manaregeneration250, Tag = "Lich"},
				--- Figure Immortality
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_3"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB1_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB1_1"},
				--- IPB 2
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_3"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_3"},
				--- IPB 3
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_3"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_3"},
				--- IPB 4
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_3"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_4"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_5"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB4_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB4_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB4_3"},
				--- IPB 5
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_3"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB5_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB5_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB5_3"},
				--- IPB 6
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_2"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_3"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_4"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_5"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB6_1"},
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB6_2"},

		},
	},	
	 OnOneTimeEvent
 {
  EventName = "BackForJaseeQuest",
  Conditions = 
  {
   
   QuestIsActive	{Player = "default", Quest = "SS_NOR_11"}, 
  },
  Actions = 
  {
 	 DialogSetEnabled {Tag = "Jasee"},
   
  },
 };
 
 	 OnOneTimeEvent
 {
  EventName = "JaseeQuestFinished",
  Conditions = 
  {
   MapFlagIsTrue {Name ="mf_P701_SQ_1486_Completed"}, 
    
  },
  Actions = 
  {
 	 DialogSetDisabled {Tag = "Jasee"},
   QuestSetSolved	{Player = "default", Quest = "SS_NOR_11"},
  },
 };
 
 
		OnOneTimeEvent
		{
		Conditions = 
		{
				
				MapFlagIsTrue {Name = "mf_HeroesAvailable"},
		},
		Actions =
		{
				ObjectVanish	{Tag = "LieutenantMarker"},
				
				
		},
	},



-----------------------------------------------------------------------------
--HeroChoosing Ceremony 
-----------------------------------------------------------------------------

	-- Necros is chosen
		OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ_1_NecrosFollow"},
				
		},
		Actions =
		{

				PlayerHeroAdd	{ HeroId = 252},
   			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroFirst", TargetTag = "Necros", Direction = 20},},
				FigureVanish	{Tag = "Necros"},
				MapValueSubtract	{Name = "mv_NumberOfHeroes", Value = 1},
				FigureForcedRunToEntity	{Tag = "Nuri", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Invictus", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Alana", TargetTag = "Hero_Hide"},
		},
	},
			OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ_1_NuriFollow"},
				
		},
		Actions =
		{

				PlayerHeroAdd	{ HeroId = 254},
   			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroFirst", TargetTag = "Nuri", Direction = 20},},
				FigureVanish	{Tag = "Nuri"},
				MapValueSubtract	{Name = "mv_NumberOfHeroes", Value = 1},
				FigureForcedWalkToEntity	{Tag = "Necros", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Invictus", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Alana", TargetTag = "Hero_Hide"},
		},
	},
			OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ_1_ZweihanderFollow"},
				
		},
		Actions =
		{

				PlayerHeroAdd	{ HeroId = 253},
   			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroFirst", TargetTag = "Invictus", Direction = 20},},
				FigureVanish	{Tag = "Invictus"},
				MapValueSubtract	{Name = "mv_NumberOfHeroes", Value = 1},
				FigureForcedWalkToEntity	{Tag = "Necros", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Nuri", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Alana", TargetTag = "Hero_Hide"},
		},
	},
			OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ_1_AlanaFollow"},
				
		},
		Actions =
		{

				PlayerHeroAdd	{ HeroId = 251},
   			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroFirst", TargetTag = "Alana", Direction = 20},},
				FigureVanish	{Tag = "Alana"},
				MapValueSubtract	{Name = "mv_NumberOfHeroes", Value = 1},
				FigureForcedWalkToEntity	{Tag = "Necros", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Invictus", TargetTag = "Hero_Hide"},
				FigureForcedRunToEntity	{Tag = "Nuri", TargetTag = "Hero_Hide"},
		},
	},
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapValueIsEqual	{Name = "mv_NumberOfHeroes", Value = 0},
				MapFlagIsTrue {Name = "mf_QuestStart"},
		},
		Actions =
		{
				DialogSetDisabled {Tag = "Alana"},
				DialogSetDisabled {Tag = "Nuri"},
				DialogSetDisabled {Tag = "Necros"},
				DialogSetDisabled {Tag = "Invictus"},
				
		},
	},
	OnOneTimeEvent
		{
		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "Alana", TargetTag = "Hero_Hide", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "Alana"},
		},
	},
		OnOneTimeEvent
		{
		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "Nuri", TargetTag = "Hero_Hide", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "Nuri"},
		},
	},
		OnOneTimeEvent
		{
		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "Necros", TargetTag = "Hero_Hide", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "Necros"},
		},
	},
		OnOneTimeEvent
		{
		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "Invictus", TargetTag = "Hero_Hide", Range = 3},
		},
		Actions =
		{
			FigureVanish	{Tag = "Invictus"},
		},
	},
	--MQ1_IPB1

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				FigureIsDead	{Tag = "Undead_IPB1_1"},
				FigureIsDead	{Tag = "Undead_IPB1_2"},
				FigureIsDead	{Tag = "Undead_IPB1_3"},

		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB1Completed"},

				FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcPlace"},
				
								
				FigureWalkToEntity	{Tag = "Nadya", TargetTag = "Nadya_Place"},
				FigureWalkToEntity	{Tag = "Jasee", TargetTag = "Jasee_Place"},
				FigureNpcSpawnToEntity	{Tag = "Worker1", Level = 1, UnitId = 811, TargetTag = "Worker_Spawn", Team = "tm_Natural"},
				FigureForcedRunToEntity	{Tag = "Worker1", TargetTag = "MarkettableTomatoes"},
		},
	},
			--Worker1
				OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "Worker1", TargetTag = "MarkettableTomatoes", Range = 2},
				
		},
		Actions =	
		{
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "Worker1", Direction = 0, Tag = "SQ5_Sack1_W1EMarker"},		
			FigureVanish	{Tag = "Worker1"},		
			ObjectChange	{Tag = "MarketstallMeat", ObjectId = 323, X = 396.194, Y = 397.359, Direction = 90},
			ObjectChange	{Tag = "MarkettablePotatoes", ObjectId = 326, X = 400.367, Y = 386.465, Direction = 47.5555},
			ObjectChange	{Tag = "MarkettableTomatoes", ObjectId = 326, X = 403.833, Y = 387.565, Direction = 0},
			FigureNpcSpawnToEntity	{Tag = "Worker1Sack", Level = 1, UnitId = 696, TargetTag = "SQ5_Sack1_W1EMarker", Team = "tm_Natural"},		
			FigureForcedRunToEntity	{Tag = "Worker1Sack", TargetTag = "Worker_Spawn"},
		},
	},
			--Worker1Sack
				OnOneTimeEvent
		{
		Conditions = 
		{
			
				FigureIsInRangeToEntity	{Tag = "Worker1Sack", TargetTag = "Worker_Spawn", Range = 3},
				
		},
		Actions =
		{
			FigureVanish	{Tag = "Worker1Sack"},
		},
	},
--MQ1_IPB1 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "CityGuard_IPB1_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB1TeamChange"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB1_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB1_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB1_1"},
				FigureHealthSet	{Tag = "Undead_IPB1_1", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB1_2", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB1_3", Percent = 99},
				FigureHealthSet	{Tag = "CityGuard_IPB1_1", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB1_2", Percent = 75},
				FigureTeamTransfer	{Tag = "Darc", Team = "tm_Westguard"},
				FigureForceAttackEntity	{Tag = "Darc", TargetTag = "Undead_IPB1_3"},
				
		},
	},
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				FigureHasNotHealth	{Tag = "Darc", Percent = 30},
				OR	{
					MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB2Completed"},
					},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Darc", Team = "tm_Neutral"},			
			FigureForcedRunToEntity	{Tag = "Darc", TargetTag = "DarcPlace"},
		},
	},
--MQ1_IPB2

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				FigureIsDead	{Tag = "Undead_IPB2_1"},
				FigureIsDead	{Tag = "Undead_IPB2_2"},
				FigureIsDead	{Tag = "Undead_IPB2_3"},

		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB2Completed"},

		},
	},

	
--MQ1_IPB2 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				OR
				{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 12, TargetTag = "CityGuard_IPB2_2"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 12, TargetTag = "Undead_IPB2_2"},
			}	
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB2TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPB2_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB2_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB2_3", Team = "tm_Undead"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB2_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB2_3"},
				FigureHealthSet	{Tag = "Undead_IPB2_1", Percent = 75},
				FigureHealthSet	{Tag = "Undead_IPB2_2", Percent = 75},
				FigureHealthSet	{Tag = "Undead_IPB2_3", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB2_1", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB2_2", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB2_3", Percent = 75},
			
		},
	},
--MQ1_IPB3

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				FigureIsDead	{Tag = "Undead_IPB3_1"},
				FigureIsDead	{Tag = "Undead_IPB3_2"},
				FigureIsDead	{Tag = "Undead_IPB3_3"},

		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB3Completed"},


			
		},
	},
	
			--MQ1_IPB3 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				OR
			{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 13, TargetTag = "CityGuard_IPB3_2"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 13, TargetTag = "Undead_IPB3_1"},
				
			}
		},
		Actions =
		{
				FigureRoamingDisable	{Tag = "Nadya"},
				FigureOutcry	{TextTag = "OC_MQ1_Save_us2", Tag = "Nadya"},
				FigureForcedRunToEntity	{Tag = "Nadya", TargetTag = "Nadya_Hide"},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB3TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPB3_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB3_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB3_3", Team = "tm_Undead"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB3_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB3_3"},
				FigureHealthSet	{Tag = "Undead_IPB3_1", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB3_2", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB3_3", Percent = 99},
				FigureHealthSet	{Tag = "CityGuard_IPB3_1", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB3_2", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB3_3", Percent = 75},
			
		},
	},
--MQ1_IPB4

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				FigureIsDead	{Tag = "Undead_IPB4_1"},
				FigureIsDead	{Tag = "Undead_IPB4_2"},
				FigureIsDead	{Tag = "Undead_IPB4_3"},
				FigureIsDead	{Tag = "Undead_IPB4_4"},
				FigureIsDead	{Tag = "Undead_IPB4_5"},

		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB4Completed"},
			
		},
	},

--MQ1_IPB4 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				OR
				{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 10, TargetTag = "CityGuard_IPB4_2"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 12, TargetTag = "Undead_IPB4_4"},
			}
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB4TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPB4_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB4_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB4_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB4_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB4_5", Team = "tm_Undead"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB4_5"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB4_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB4_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB4_3"},
				FigureHealthSet	{Tag = "Undead_IPB4_1", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB4_2", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB4_3", Percent = 99},
				FigureHealthSet	{Tag = "CityGuard_IPB4_1", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB4_2", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB4_3", Percent = 75},
				FigureForceAttackEntity	{Tag = "Undead_IPB4_4", TargetTag = "CityGuard_IPB4_1"},
				FigureForceAttackEntity	{Tag = "Undead_IPB4_5", TargetTag = "CityGuard_IPB4_3"},
		},
	},
--MQ1_IPB5

	OnOneTimeEvent
		{
		Conditions = 
		{
				--QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				MapFlagIsTrue{Name = "mf_P701_Start_CS01_End"},
				FigureIsDead	{Tag = "Undead_IPB5_1"},
				FigureIsDead	{Tag = "Undead_IPB5_2"},
				FigureIsDead	{Tag = "Undead_IPB5_3"},
				FigureIsDead	{Tag = "Undead_IPB5_4"},
				FigureIsDead	{Tag = "Undead_IPB5_5"},
		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB5Completed"},
			
		},
	},	
	
			--MQ1_IPB5 Unit movements

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				OR
				{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 7, TargetTag = "CityGuard_IPB5_2"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 15, TargetTag = "Undead_IPB5_4"},
			}
		},
		Actions =
		{

				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB5_5"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB5_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB5_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB5_3"},
				FigureHealthSet	{Tag = "Undead_IPB5_1", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB5_2", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB5_3", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB5_4", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB5_5", Percent = 99},
				FigureHealthSet	{Tag = "CityGuard_IPB5_1", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB5_2", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB5_3", Percent = 75},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB5Running"},
				FigureForcedRunToEntity	{Tag = "Merchant_Kurt", TargetTag = "SQ5_Sack1_PigPlace"},
				
				FigureOutcry {TextTag = "OC_MQ1_Save_us", Tag = "Merchant_Kurt"},

				FigureForceAttackEntity	{Tag = "Undead_IPB5_5", TargetTag = "pl_HumanAvatar"},
		},
	},
--MQ1_IPB6

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				FigureIsDead	{Tag = "Undead_IPB6_1"},
				FigureIsDead	{Tag = "Undead_IPB6_2"},
				FigureIsDead	{Tag = "Undead_IPB6_3"},
				FigureIsDead	{Tag = "Undead_IPB6_4"},
				FigureIsDead	{Tag = "Undead_IPB6_5"},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB6Completed"},

		},
	},	
--MQ1_IPB6 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_1"},
				
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 12, TargetTag = "CityGuard_IPB6_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_1_IPB6TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPB6_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB6_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB6_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB6_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPB6_5", Team = "tm_Undead"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_2"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_3"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_4"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Undead_IPB6_5"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB6_1"},
				FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "CityGuard_IPB6_2"},

				FigureHealthSet	{Tag = "Undead_IPB6_1", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB6_2", Percent = 99},
				FigureHealthSet	{Tag = "Undead_IPB6_3", Percent = 99},
				FigureHealthSet	{Tag = "CityGuard_IPB6_1", Percent = 75},
				FigureHealthSet	{Tag = "CityGuard_IPB6_2", Percent = 75},

				FigureForceAttackEntity	{Tag = "Undead_IPB6_4", TargetTag = "CityGuard_IPB6_1"},
				FigureForceAttackEntity	{Tag = "Undead_IPB6_5", TargetTag = "CityGuard_IPB6_2"},
		},
	},	
--MQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB1Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB2Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB3Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB4Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB5Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_1_IPB6Completed"},
		},
		Actions =
		{
				
				MapFlagSetFalse {Name = "mf_P701_Start_CS01_End"},
				MapFlagSetFalse {Name = "mf_P701_MQ_1_IPB1Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_1_IPB2Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_1_IPB3Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_1_IPB4Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_1_IPB5Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_1_IPB6Completed"},
				MapFlagSetTrue {Name = "mf_P701_MQ_1_Completed"},
				--DialogSetEnabled {Tag = "Lieutenant"},
				MapFlagSetTrue {Name = "mf_MQ2_CS02_GatesAreStillOpen_Start"},
				--QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_11"},
				
		},
	},	
	
}


	
	
                      