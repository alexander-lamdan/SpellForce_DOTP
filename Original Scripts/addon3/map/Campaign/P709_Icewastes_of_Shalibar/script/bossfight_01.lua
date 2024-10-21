--*************************************************************
--*                                                           *
--*   Icewastes of Shalibar :: Wolf Spirit bossfight script   *
--*                                                           *
--*************************************************************

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

	OnOneTimeEvent
	{
		EventName = ">>> Wolf Spirit bossfight -- set the boss to invunlnerable <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_SUBQ_22"},

		},
		Actions =
		{

			EntityFlagSetTrue {Name = "ef_P709_Wolf_Spirit_is_invulnerable"},

			UIBossfightPanelShow { UnitTag1 = "wolf_spirit", UnitTag2 = "", PortraitImage = "boss_P709_wolf", DisplayName = Boss_P709_Wolf},

		},
		
		GotoState ="BOSSFIGHT_01",

	},
};

State
{

	StateName = "BOSSFIGHT_01",

--	Wolf Spirit is invulnerable and stands still

	OnEvent
	{
		EventName = ">>> Wolf Spirit is invulnerable so stands still <<<",
		Conditions = 
		{

			EntityFlagIsTrue {Name = "ef_P709_Wolf_Spirit_is_invulnerable"},

		},
		Actions =
		{

			FigureHoldPosition	{Tag = "wolf_spirit"},

		},

	},
	
	OnEvent
	{
		EventName = ">>> the invulnerable Wolf Spirit's health set to 100% when get hit <<<",
		Conditions = 
		{

			EntityFlagIsTrue {Name = "ef_P709_Wolf_Spirit_is_invulnerable"},
			
			FigureHasNotHealth { Tag = "wolf_spirit", Percent = 100},

		},
		Actions =
		{
			
			FigureHealthSet	{Tag = "wolf_spirit", Percent = 100},

		},

	},

-- CHEAT BUSTER - the invulnerable boss will respawn after killed by a cheated-weapon

	OnEvent
	{
		EventName = ">>> CHEAT BUSTER - the invulnerable boss will respawn after killed by a cheated-weapon <<<",
		Conditions = 
		{

			EntityFlagIsTrue {Name = "ef_P709_Wolf_Spirit_is_invulnerable"},
			
			FigureIsDead	{Tag = "wolf_spirit"},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wolf_spirit", X = 20.7098, Y = 433.43},
			FigureDirectionSet	{Tag = "wolf_spirit", Direction = 223.453},

		},

	},
	
--	Wolf Spirit attacks

	OnOneTimeEvent
	{
		EventName = ">>> Wolf Spirit attacks after the den's destroyed <<<",
		Conditions = 
		{

			EntityIsNotExisting	{Tag = "wolfs_den_1"},
			EntityIsNotExisting	{Tag = "wolfs_den_2"},
			EntityIsNotExisting	{Tag = "wolfs_den_3"},

		},
		Actions =
		{

			EntityFlagSetFalse {Name = "ef_P709_Wolf_Spirit_is_invulnerable"},
			
			FigureAbilityRemove {Tag = "wolf_spirit", AbilityId = Ability.Immortal},
			
			FigureLootItemMiscAdd	{Tag = "wolf_spirit", DropChance = 100, ItemId = 745},
			
			FigureForceAttackEntity	{Tag = "wolf_spirit", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_bossfight_01"},

		},

	},
	
--	Bossfight finished

	OnOneTimeEvent
	{
		EventName = ">>> Wolf Spirit bossfight finished <<<",
		Conditions = 
		{

			FigureIsDead	{Tag = "wolf_spirit"},

			FigureIsDead	{Tag = "wolf_spirit_guard_1"},
			FigureIsDead	{Tag = "wolf_spirit_guard_2"},
			FigureIsDead	{Tag = "wolf_spirit_guard_3"},

		},
		Actions =
		{

			QuestSetSolved	{Player = "default", Quest = "IOS_SUBQ_22"},
			
			MapTimerStart {Name = "mt_P709_FinishQuest"},

			UIBossfightPanelHide {},

		},
		
		GotoState = "BOSSFIGHT_FINISHED",

	},

--	Outcries before the initial agro of the wolves

	OnOneTimeEvent
	{
		EventName = ">>> Outcries before the initial agro of the wolves <<<",
		Conditions = 
		{

			OR
			{

				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "cave_3b_out", Range = 4},
				FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "cave_3b_out", Range = 4},

			},

		},
		Actions =
		{

			FigureOutcry	{TextTag = "P709_CRY_SUBQ_22_T001_WOLFSPIRIT", Tag = "wolf_spirit"},
			FigureOutcry	{TextTag = "P709_CRY_SUBQ_22_T002_SARIEL", Tag = "pl_HumanCompanionSariel"},
			FigureOutcry	{TextTag = "P709_CRY_SUBQ_22_T003_ORCHERO", Tag = "pl_HumanHeroOrc"},
			FigureOutcry	{TextTag = "P709_CRY_SUBQ_22_T004_AVATAR", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "P709_CRY_SUBQ_22_T005_CAINE", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "P709_CRY_SUBQ_22_T006_CAINE", Tag = "pl_HumanHeroCaine"},
			
			MapTimerStart	{Name = "mt_P709_WolfSpirit"},

		},

	},

--	Wolf Spirit guard initial agro

	OnOneTimeEvent
	{
		EventName = ">>> Wolf Spirit guard's initial agro <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_WolfSpirit", Seconds = 35},

		},
		Actions =
		{

			MapTimerStop	{Name = "mt_P709_WolfSpirit"},

			BuildingTeamTransfer	{Tag = "wolfs_den_1", Team = "tm_Creep"},
			BuildingTeamTransfer	{Tag = "wolfs_den_2", Team = "tm_Creep"},
			BuildingTeamTransfer	{Tag = "wolfs_den_3", Team = "tm_Creep"},

			FigureTeamTransfer {Tag = "wolf_spirit", Team = "tm_Creep"},

			FigureTeamTransfer {Tag = "wolf_spirit_guard_1", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolf_spirit_guard_2", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolf_spirit_guard_3", Team = "tm_Creep"},

			FigureForceAttackEntity	{Tag = "wolf_spirit_guard_1", TargetTag = "pl_HumanAvatar"},
			FigureForceAttackEntity	{Tag = "wolf_spirit_guard_2", TargetTag = "pl_HumanAvatar"},
			FigureForceAttackEntity	{Tag = "wolf_spirit_guard_3", TargetTag = "pl_HumanAvatar"},

		},

	},

--	Wolf Spirit guard 1 respawn

	OnEvent
	{
		EventName = ">>> Wolf Spirit guard 1 respawn <<<",
		Conditions = 
		{

			EntityIsExisting	{Tag = "wolfs_den_1"},
			
			BuildingHasHealth	{Tag = "wolfs_den_1", Percent = 1},

			FigureIsDead	{Tag = "wolf_spirit_guard_1"},

		},
		Actions =
		{
			
			FigureRespawnToEntity	{Tag = "wolf_spirit_guard_1", TargetTag = "wolfs_den_1"},
			
			FigureForceAttackEntity	{Tag = "wolf_spirit_guard_1", TargetTag = "pl_HumanAvatar"},

		},

	},
	
--	Wolf Spirit guard 2 respawn

	OnEvent
	{
		EventName = ">>> Wolf Spirit guard 2 respawn <<<",
		Conditions = 
		{

			EntityIsExisting	{Tag = "wolfs_den_2"},

			BuildingHasHealth	{Tag = "wolfs_den_2", Percent = 1},

			FigureIsDead	{Tag = "wolf_spirit_guard_2"},

		},
		Actions =
		{
			
			FigureRespawnToEntity	{Tag = "wolf_spirit_guard_2", TargetTag = "wolfs_den_2"},

			FigureForceAttackEntity	{Tag = "wolf_spirit_guard_2", TargetTag = "pl_HumanAvatar"},

		},

	},
	
--	Wolf Spirit guard 3 respawn

	OnEvent
	{
		EventName = ">>> Wolf Spirit guard 3 respawn <<<",
		Conditions = 
		{

			EntityIsExisting	{Tag = "wolfs_den_3"},

			BuildingHasHealth	{Tag = "wolfs_den_3", Percent = 1},

			FigureIsDead	{Tag = "wolf_spirit_guard_3"},

		},
		Actions =
		{
			
			FigureRespawnToEntity	{Tag = "wolf_spirit_guard_3", TargetTag = "wolfs_den_3"},

			FigureForceAttackEntity	{Tag = "wolf_spirit_guard_3", TargetTag = "pl_HumanAvatar"},

		},

	},

};

State
{

	StateName = "BOSSFIGHT_FINISHED",

};