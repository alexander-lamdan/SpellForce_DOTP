dofile("addon3/map/Campaign/P706_Zarachs_People/script/Globals.lua");
dofile("addon3/map/Campaign/P706_Zarachs_People/script/Rewards.lua");



local TravelStoneRange = 15;




State
{
	-- ***************************************************************************
	-- ** Main initialization                                                   **
	-- ***************************************************************************
	StateName = "INIT",


	OnOneTimeEvent
	{
		EventName = ">>> Game is unblocked <<<",
		Conditions = 
		{
			GameIsUnBlocked{},
		},
		Actions =
		{
			PlayerTravelDisable {},
			
			FigureAbilityAdd	{Tag = "NLLeavingBoss", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansBoss", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanBoss", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "EnemyShaikanBoss", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "BossWithBreathFire", AbilityId = Ability.Immortal},
			
			BuildingAbilityAdd	{Tag = "ShaikanHQ1", AbilityId = Ability.Immortal},
			BuildingAbilityAdd	{Tag = "NLHQ2", AbilityId = Ability.Immortal},
			
			-- North-West corner
			FigureVanish	{Tag = "EnemyShaikanBoss"},
			
			-- NE
			FigureVanish	{Tag = "BossWithoutBreathFire"},
			
			-- SW
			FigureVanish	{Tag = "ShaikanThief1"},
			FigureVanish	{Tag = "ShaikanThief2"},
			FigureVanish	{Tag = "ShaikanThief3"},
			FigureVanish	{Tag = "ShaikanThief4"},
			FigureVanish	{Tag = "ShaikanThief5"},
			
			-- SE
			FigureVanish	{Tag = "TheBeast"},
			FigureVanish	{Tag = "OrcHero"},

			MapFlagSetTrue{ Name = "mf_P706_MainInit_Ended" },
			
			BuildingAbilityAdd	{Tag = "BuildingEaglesNest01", AbilityId = 78}, -- vulnerable to fire
			BuildingAbilityAdd	{Tag = "BuildingEaglesNest01", AbilityId = 79}, -- vulnerable to ice
			BuildingAbilityAdd	{Tag = "BuildingEaglesNest02", AbilityId = 78}, -- vulnerable to fire
			BuildingAbilityAdd	{Tag = "BuildingEaglesNest02", AbilityId = 79}, -- vulnerable to ice
			BuildingAbilityAdd	{Tag = "BuildingEaglesNest03", AbilityId = 78}, -- vulnerable to fire
			BuildingAbilityAdd	{Tag = "BuildingEaglesNest03", AbilityId = 79}, -- vulnerable to ice
			
			PlayerIncrementWarriorUnitCap {Player = "pl_Nameless", Amount = 30},
--			PlayerIncrementWarriorUnitCap {Player = "pl_Shaikan", Amount = -70},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar approached a travel stone <<<",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_TrollHunter", Range = TravelStoneRange },
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_Shaman", Range = TravelStoneRange },
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_Spiritist", Range = TravelStoneRange },
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_ClanBase", Range = TravelStoneRange },
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_ShaikanBase", Range = TravelStoneRange },
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_ShaikanBaseWest", Range = TravelStoneRange },
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_NorthernCrossroads", Range = TravelStoneRange },
			},
		},	
		Actions =
		{	
			PlayerTravelEnable	{},
		},
	},
	
	-- Achievement: Lost Recon
	OnOneTimeEvent
	{
		EventName = ">>> Achievement unlocked: Lost Recon <<<",
		Conditions = 
		{
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 18 , TargetTag = "pos_Camp"},
		},
		Actions =
		{
--			FigureOutcryAlert	{TextTag = "cryCamp", Tag = ftAvatar, TargetTag = "pos_Camp"}, -- no VO
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_Achievement_P706_Silversmith"},		
		},
	},

	-- Achievement: Spider
	OnOneTimeEvent
	{
		EventName = ">>> Achievement unlocked: Spider-Hunter <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "AchievementSpider01"},
			FigureIsDead	{Tag = "AchievementSpider02"},
			FigureIsDead	{Tag = "AchievementSpider03"},
			FigureIsDead	{Tag = "AchievementSpider04"},
			FigureIsDead	{Tag = "AchievementSpider05"},
			FigureIsDead	{Tag = "AchievementSpider06"},
			FigureIsDead	{Tag = "AchievementSpider07"},
		},
		Actions =
		{
--			FigureOutcry	{TextTag = "crySpiders", Tag = ftAvatar}, -- no VO
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_Achievement_P706_Spider"},
		},
	},

	-- Achievement: Spider
	OnOneTimeEvent
	{
		EventName = ">>> Achievement unlocked: Duel-Master <<<",
		Conditions = 
		{
--			MapValueIsEqual	{Name = "mv_P706_State_ShaikanBoss", Value = 3}, -- this value can be set too early, the next line is better:
			QuestIsSolved	{Player = "default", Quest = "MQ062_CONVINCE"}, -- player won the duel
			MapValueIsEqual	{Name = "mv_P706_State_DuelFailedNo", Value = 0}, -- won at the 1st attempt
		},
		Actions =
		{
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_Achievement_P706_Duel"},
		},
	},

	OnEvent
	{
		EventName = "PostMapTravelEnableDragon",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},	
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
		},
	};

	-- every adventurer died (the death of the dragon is handled in dragon.lua)
	OnOneTimeEvent
	{
		EventName = ">>> every adventurer died (the death of the dragon is handled in dragon.lua) <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = ftAvatar},
			FigureIsDead	{Tag = ftHeroCaine},
			FigureIsDead	{Tag = ftHeroOrc},
			FigureIsDead	{Tag = ftHero1},
			FigureIsDead	{Tag = ftHero2},
			FigureIsDead	{Tag = ftHero3},
			FigureIsDead	{Tag = ftCompCraig},
			FigureIsDead	{Tag = ftCompSariel},
			PlayerHasNotBuildingAmount	{Player = "pl_Human", Amount = 1, OnlyCompleted = default},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = ftAvatar, LocaTag = "IGMenuGameOver_Title"},
		},
	},

	-- spawn Fire Golems when the Armory of Eo is approached
	OnOneTimeEvent
	{
		EventName = ">>> Hirin's Shield is approached, spawning Fire Golems... <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "Effect_Darkness"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "default", Level = 16, UnitId = 398, TargetTag = "Effect_Darkness", Team = "tm_Nameless"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 16, UnitId = 398, TargetTag = "Effect_Darkness", Team = "tm_Nameless"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 16, UnitId = 398, TargetTag = "Effect_Darkness", Team = "tm_Nameless"},
		},
	},	
	
	-- turn off the effect when the Armory of Eo item is aquired
	OnOneTimeEvent
	{
		EventName = ">>> Hirin's Shield is in the inventory <<<",
		Conditions = 
		{
			AvatarHasItemEquipment	{Player = "pl_Human", ItemId = 3053, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
		},
		Actions =
		{
			--FigureOutcry	{TextTag = "crySetItem", Tag = ftAvatar},
			ObjectVanish	{Tag = "Effect_Darkness"},
		},
	},
};


