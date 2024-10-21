--**************************************************************
--*                                                            *
--*   Icewastes of Shalibar :: Crystal Golem bossfight script  *
--*                                                            *
--**************************************************************

-- INITIALIZING LOCAL CONSTANTS

local vBoss3ID = 2066;

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
		EventName = ">>> Bossfight 03 starts | initializing Power Crystals <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_RainbowCrystalGolem"},

		},
		Actions =
		{

			EntityValueSet {Name = "ev_P709_DestroyedCrystals", Value = 0},
			
--	Reactivating Power Crystal's dialogs

			DialogSetEnabled {Tag = "nature_tower"},
			DialogSetEnabled {Tag = "death_tower"},
			DialogSetEnabled {Tag = "maze_tower"},

--	*****************************************************
--  *                                                   *
--  *   SET RAINBOW CRYSTAL GOLEM'S INITIAL ABILITIES   *
--  *                                                   *
--  *****************************************************

			MapFlagSetTrue {Name = "mf_P709_bossfight_03"},

			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantFire75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantIce75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantMental75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantBlack75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantProjectile75},

		},

		GotoState ="BOSSFIGHT_03",

	},

};

State
{

	StateName = "BOSSFIGHT_03",
	
--	*****************************************************
--  *                                                   *
--  *   SET RAINBOW CRYSTAL GOLEM'S INITIAL ABILITIES   *
--  *                                                   *
--  *****************************************************
	
-- Set Rainbow Crystal Golem's abilities - 1 tower destroyed
	
	OnOneTimeEvent
	{
		EventName = ">>> Set Rainbow Crystal Golem's abilities - 1 tower destroyed <<<",
		Conditions = 
		{
			
			EntityValueIsEqual {Name = "ev_P709_DestroyedTowers", Value = 1},

		},
		Actions =
		{
			
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantFire75},
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantIce75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantMental75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantBlack75},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantProjectile75},
			
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantFire50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantIce50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantMental50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantBlack50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantProjectile50},

		},

	},

-- Set Rainbow Crystal Golem's abilities - 2 towers destroyed
	
	OnOneTimeEvent
	{
		EventName = ">>> Set Rainbow Crystal Golem's abilities - 2 towers destroyed <<<",
		Conditions = 
		{
			
			EntityValueIsEqual {Name = "ev_P709_DestroyedTowers", Value = 2},

		},
		Actions =
		{
			
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantFire50},
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantIce50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantMental50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantBlack50},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantProjectile50},
			
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantFire25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantIce25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantMental25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantBlack25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantProjectile25},

		},

	},

-- Set Rainbow Crystal Golem's abilities - 3 towers destroyed
	
	OnOneTimeEvent
	{
		EventName = ">>> Set Rainbow Crystal Golem's abilities - 3 towers destroyed <<<",
		Conditions = 
		{

			EntityValueIsEqual {Name = "ev_P709_DestroyedTowers", Value = 3},

		},
		Actions =
		{
			
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantFire25},
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantIce25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantMental25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantBlack25},
			FigureAbilityAdd {Tag = "rainbow_crystal_golem", AbilityId = Ability.ResistantProjectile25},

		},

	},

--	Rainbow Crystal Golem agro when all of the power crystals are destroyed

	OnOneTimeEvent
	{
		EventName = ">>> Rainbow Crystal Golem agro when all of the power crystals are destroyed <<<",
		Conditions = 
		{
			
			BuildingIsDead {Tag = "nature_power_crystal"},
			BuildingIsDead {Tag = "death_power_crystal"},
			BuildingIsDead {Tag = "maze_power_crystal"},

		},
		Actions =
		{
			
			FigureAbilityRemove {Tag = "rainbow_crystal_golem", AbilityId = Ability.Immortal},
			
			MapFlagSetFalse {Name = "mf_P709_GolemParalized"},
			MapTimerStop {Name = "mt_P709_GolemParalized"},

			FigureTeamTransfer {Tag = "rainbow_crystal_golem", Team = "tm_Creep"},
			FigureForceAttackEntity	{Tag = "rainbow_crystal_golem", TargetTag = "pl_HumanAvatar"},

		},

	},

--	Rainbow Crystal Golem agro when the Avatar is not under attack

	OnEvent
	{
		EventName = ">>> Rainbow Crystal Golem agro when the Avatar is not under attack <<<",
		Conditions = 
		{

			FigureIsAlive	{Tag = "rainbow_crystal_golem"},

			MapFlagIsTrue {Name = "mf_P709_SailingFromPrisonIsland"},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapFlagIsFalse {Name = "mf_P709_GolemAgro"},

			FigureIsNotInCombat {Tag = "pl_HumanAvatar"},

		},
		Actions =
		{

			FigureTeamTransfer {Tag = "rainbow_crystal_golem", Team = "tm_Creep"},

			FigureForceAttackEntity	{Tag = "rainbow_crystal_golem", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_GolemAgro"},
			
			MapTimerStart	{Name = "mt_P709_GolemAgro"},

		},

	},
	
	OnEvent
	{
		EventName = ">>> Rainbow Crystal Golem agro TIMER <<<",
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P709_GolemAgro"},
				
				MapTimerIsElapsed {Name = "mt_P709_GolemAgro", Seconds = 2},

		},
		Actions =
		{

			MapFlagSetFalse {Name = "mf_P709_GolemAgro"},
			
			MapTimerStop	{Name = "mt_P709_GolemAgro"},

		},

	},

--	the Rainbow Crystal Golem's health set back to 10% when his HP is less than 20%, then paralized, power crystals can be destroyed

	OnEvent
	{
		EventName = ">>> the Rainbow Crystal Golem's health set back to 100% when his HP is less than 20%, then paralized, power crystals can be damaged <<<",
		Conditions = 
		{
			
			EntityValueIsLessOrEqual {Name = "ev_P709_DestroyedTowers", Value = 2},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			FigureHasNotHealth { Tag = "rainbow_crystal_golem", Percent = 20},

		},
		Actions =
		{
			
			FigureHealthSet	{Tag = "rainbow_crystal_golem", Percent = 100},
			
			MapFlagSetTrue {Name = "mf_P709_GolemParalized"},
			
			MapTimerStart	{Name = "mt_P709_GolemParalized"},

--	Power Crystals can be destroyed
			
			FigureTeamTransfer {Tag = "rainbow_crystal_golem", Team = "tm_Neutral"},
			
			FigureStop	{Tag = "rainbow_crystal_golem"},
			
			BuildingTeamTransfer {Tag = "nature_power_crystal", Team = "tm_Creep"},
			BuildingTeamTransfer {Tag = "death_power_crystal", Team = "tm_Creep"},
			BuildingTeamTransfer {Tag = "maze_power_crystal", Team = "tm_Creep"},
			
--	Stop attacking the Rainbow Crystal Golem

			MapFlagSetTrue {Name = "mf_P709_StopTheAttack"},

		},

	},

--	end of the paralizing of the Rainbow Crystal Golem's, power crystals can not be damaged destroyed

	OnEvent
	{
		EventName = ">>> end of the paralizing of the Rainbow Crystal Golem's, power crystals can not be damaged destroyed <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_GolemParalized"},

			MapTimerIsElapsed	{Name = "mt_P709_GolemParalized", Seconds = 30},

		},
		Actions =
		{

			FigureHealthSet	{Tag = "rainbow_crystal_golem", Percent = 100},

			MapFlagSetFalse {Name = "mf_P709_GolemParalized"},

			MapTimerStop {Name = "mt_P709_GolemParalized"},

--	Power Crystals can be destroyed

			FigureTeamTransfer {Tag = "rainbow_crystal_golem", Team = "tm_Creep"},
			FigureForceAttackEntity	{Tag = "rainbow_crystal_golem", TargetTag = "pl_HumanAvatar"},

			BuildingTeamTransfer {Tag = "nature_power_crystal", Team = "tm_Neutral"},
			BuildingTeamTransfer {Tag = "death_power_crystal", Team = "tm_Neutral"},
			BuildingTeamTransfer {Tag = "maze_power_crystal", Team = "tm_Neutral"},
			
--	Stop the action of the Avatar

			MapFlagSetTrue	{Name = "mf_P709_AvatarHateClear"},

		},

	},

--	Stop the action of the Avatar, get away from the Nature Power Crystal
	
	OnEvent
	{
		EventName = ">>> stop the action of the Avatar, get away from the Nature Power Crystal <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_AvatarHateClear"},

			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "nature_power_crystal", Range = 5},

		},
		Actions =
		{

			FigureWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "nature_power_crystal_start"},
			
			MapFlagSetFalse {Name = "mf_P709_AvatarHateClear"},

		},

	},
	
--	Stop the action of the Avatar, get away from the Death Power Crystal
	
	OnEvent
	{
		EventName = ">>> stop the action of the Avatar, get away from the Death Power Crystal <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_AvatarHateClear"},

			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "death_power_crystal", Range = 5},

		},
		Actions =
		{

			FigureWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "death_power_crystal_start"},

			MapFlagSetFalse {Name = "mf_P709_AvatarHateClear"},

		},

	},

--	Stop the action of the Avatar, get away from the Maze Power Crystal
	
	OnEvent
	{
		EventName = ">>> stop the action of the Avatar, get away from the Maze Power Crystal <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_AvatarHateClear"},

			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "maze_power_crystal", Range = 5},

		},
		Actions =
		{

			FigureWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "maze_power_crystal_start"},

			MapFlagSetFalse {Name = "mf_P709_AvatarHateClear"},

		},

	},
	
-- *****************************************************
-- *                                                   *
-- *   STOP THE ATTACKS OF THE RAINBOW CRYSTAL GOLEM   *
-- *                                                   *
-- *****************************************************

--	Avatar stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> Avatar stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = "pl_HumanAvatar"},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = "pl_HumanAvatar", TargetTag = "rainbow_crystal_golem"},

		},

	},

--	HERO 1 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 1 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero1fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero1fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero1fTag, TargetTag = "rainbow_crystal_golem"},

		},
		
	},

--	HERO 2 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 2 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero2fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero2fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero2fTag, TargetTag = "rainbow_crystal_golem"},

		},
		
	},

--	HERO 3 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 3 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero3fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero3fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero3fTag, TargetTag = "rainbow_crystal_golem"},

		},

	},

--	HERO 4 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 4 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero4fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero4fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero4fTag, TargetTag = "rainbow_crystal_golem"},

		},

	},

--	HERO 5 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 5 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero5fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero5fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero5fTag, TargetTag = "rainbow_crystal_golem"},

		},

	},

--	HERO 6 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 6 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero6fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero6fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero6fTag, TargetTag = "rainbow_crystal_golem"},

		},
		
	},

--	HERO 7 stops attacking the Rainbow Crystal Golem
	
	OnEvent
	{
		EventName = ">>> HERO 7 stops attacking the Rainbow Crystal Golem <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_StopTheAttack"},

			FigureIsInEntityRange	{Tag = vHero7fTag, TargetTag = "rainbow_crystal_golem", Range = 5},

			FigureIsInCombat	{Tag = vHero7fTag},

		},
		Actions =
		{

			FigureForcedWalkToEntity	{Tag = vHero7fTag, TargetTag = "rainbow_crystal_golem"},

			MapFlagSetFalse {Name = "mf_P709_StopTheAttack"},

		},

	},

-- ***************************
-- *                         *
-- *   POWER CRYSTAL CHECK   *
-- *                         *
-- ***************************

--	Nature Power Crystal check

	OnOneTimeEvent
	{
		EventName = ">>> Nature Power Crystal check <<<",
		Conditions = 
		{
			
			BuildingIsDead {Tag = "nature_power_crystal"},
			
			MapFlagIsFalse {Name = "mf_P709_NatureTowerRestart"},

		},
		Actions =
		{
			
			DialogSetDisabled {Tag = "nature_tower"},
			
			EntityValueIncrease	{Name = "ev_P709_DestroyedTowers"},

		},

	},
	
--	Nature Tower restarted

	OnOneTimeEvent
	{
		EventName = ">>> Nature tower restarted <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_NatureTowerRestart"},

		},
		Actions =
		{
			
			DialogSetDisabled {Tag = "nature_tower"},
			
			EntityValueIncrease	{Name = "ev_P709_DestroyedTowers"},
			
			BuildingDestroy {Tag = "nature_power_crystal"},
			
			ObjectSpawn	{ObjectId = 1959, X = 431.81, Y = 506.169, Direction = 0, Tag = "FX_2_tower_of_wolf_spirit"},

		},

	},

--	Death Power Crystal check

	OnOneTimeEvent
	{
		EventName = ">>> Death Power Crystal check <<<",
		Conditions = 
		{
			
			BuildingIsDead {Tag = "death_power_crystal"},
			
			MapFlagIsFalse {Name = "mf_P709_DeathTowerRestart"},

		},
		Actions =
		{
			
			DialogSetDisabled {Tag = "death_tower"},
			
			EntityValueIncrease	{Name = "ev_P709_DestroyedTowers"},

		},

	},
	
--	Death Tower restarted

	OnOneTimeEvent
	{
		EventName = ">>> Death tower restarted <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_DeathTowerRestart"},

		},
		Actions =
		{

			DialogSetDisabled {Tag = "death_tower"},

			EntityValueIncrease	{Name = "ev_P709_DestroyedTowers"},

			BuildingDestroy {Tag = "death_power_crystal"},

			ObjectSpawn	{ObjectId = 1958, X = 387.618, Y = 579.008, Direction = 0, Tag = "FX_2_tower_of_lich"},

		},

	},

--	Maze Power Crystal check

	OnOneTimeEvent
	{
		EventName = ">>> Maze Power Crystal check <<<",
		Conditions = 
		{

			BuildingIsDead {Tag = "maze_power_crystal"},
			
			MapFlagIsFalse {Name = "mf_P709_MazeTowerRestart"},

		},
		Actions =
		{

			DialogSetDisabled {Tag = "maze_tower"},

			EntityValueIncrease	{Name = "ev_P709_DestroyedTowers"},

		},

	},
	
--	Maze Tower restarted

	OnOneTimeEvent
	{
		EventName = ">>> Maze tower restarted <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_MazeTowerRestart"},

		},
		Actions =
		{

			DialogSetDisabled {Tag = "maze_tower"},

			EntityValueIncrease	{Name = "ev_P709_DestroyedTowers"},

			BuildingDestroy {Tag = "maze_power_crystal"},

			ObjectSpawn	{ObjectId = 1957, X = 474.591, Y = 580.022, Direction = 0, Tag = "FX_2_tower_of_puzzle"},

		},

	},

};