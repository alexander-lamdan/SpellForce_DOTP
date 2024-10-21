--******************************************************************
--*                                                                *
--*   Icewastes of Shalibar :: Initializing debug and cheat modes  *
--*                                                                *
--******************************************************************

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

--	INITIALIZING DEBUG / CHEAT MODES

	OnOneTimeEvent
	{
		EventName = ">>> INITIALIZING DEBUG / CHEAT MODES <<<",
		Conditions = 
		{

				GameIsUnBlocked{},

		},
		Actions =
		{
--	remove the comment before MapFlagSetTrue {Name = "mf_P709_Quest3Debug"} if you'd like to start from Main Quest 3

--			MapFlagSetTrue {Name = "mf_P709_Quest3Debug"},

--	remove the comment before MapFlagSetTrue {Name = "mf_P709_Quest5Debug"} if you'd like to start from Main Quest 5

--			MapFlagSetTrue {Name = "mf_P709_Quest5Debug"},

--	remove the comment before MapFlagSetTrue {Name = "mf_P709_DragonDebug"} if you'd like to start the level with a Dragon available to mount

--			MapFlagSetTrue {Name = "mf_P709_DragonDebug"},

--	remove the comment before {Name = "mf_P709_Cheat"} if you'd like to start the level with cheat weapons available

			MapFlagSetTrue {Name = "mf_P709_Cheat"},

		},
	},

--******************************************************************************
--*                                                                            *
--*                             QUEST DEBUG mode                               *
--*                                                                            *
--******************************************************************************

--	START MAIN QUEST #3 DEBUG

	OnOneTimeEvent
	{
		EventName = ">>> *** TEMPORARY *** START MAIN QUEST #3 DEBUG <<<",
		Conditions = 
		{

				GameIsUnBlocked{},

				MapFlagIsTrue	{Name = "mf_P709_Quest3Debug"},

		},
		Actions =
		{

			FigureTeleport {Tag = "pl_HumanAvatar", X = 280, Y = 240},
			
			AvatarItemMiscGive {Player = "default", ItemId = 745, Amount = 1},

			QuestSetActive {Quest = "IOS_ACT_1"},

			QuestSetSolved {Quest = "IOS_MQ_1"},
			QuestSetSolved {Quest = "IOS_MQ_2"},
			
			ObjectVanish {Tag = "blocked_cave_marker_5"},
			
			FigureTeleport {Tag = "undead_captain", X = 264.947, Y = 233.888},
			
			MapTimerStart	{Name = "mt_P709_QuestDebug"},

		},
	},

--	START MAIN QUEST #5 DEBUG

	OnOneTimeEvent
	{
		EventName = ">>> *** TEMPORARY *** START MAIN QUEST #5 DEBUG <<<",
		Conditions = 
		{

				GameIsUnBlocked{},
				
				MapFlagIsTrue	{Name = "mf_P709_Quest5Debug"},

		},
		Actions =
		{

			FigureTeleport	{Tag = "pl_HumanAvatar", X = 280, Y = 240},

			AvatarItemMiscGive {Player = "default", ItemId = 745, Amount = 1},
			AvatarItemMiscGive {Player = "default", ItemId = 746, Amount = 1},
			AvatarItemMiscGive {Player = "default", ItemId = 747, Amount = 1},
			
			AvatarItemMiscGive {Player = "default", ItemId = 757, Amount = 1},
			
			AvatarItemMiscGive {Player = "default", ItemId = 764, Amount = 1},

			QuestSetActive {Quest = "IOS_ACT_1"},

			QuestSetSolved {Quest = "IOS_MQ_1"},
			QuestSetSolved {Quest = "IOS_MQ_2"},
			QuestSetSolved {Quest = "IOS_MQ_3"},
			QuestSetSolved {Quest = "IOS_MQ_4"},

			DialogSetEnabled {Tag = "nature_tower"},
			DialogSetEnabled {Tag = "death_tower"},
			DialogSetEnabled {Tag = "maze_tower"},
			
			GateSetOpen {Tag = "undead_base_gate_1"},
			GateSetOpen {Tag = "undead_base_gate_2"},
			
			FigureTeleport {Tag = "undead_captain", X = 264.947, Y = 233.888},
			
			MapTimerStart {Name = "mt_P709_QuestDebug"},

		},
	},
	
--	Quest debug dialogs initialized, sailing available
	
	OnOneTimeEvent
	{
		EventName = ">>> *** TEMPORARY *** Quest debug dialogs initialized, sailing available <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_QuestDebug", Seconds = 2},

		},
		Actions =
		{
			
			MapTimerStop {Name = "mt_P709_QuestDebug"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingFromMainIsland"},
			
			FigureTeleport {Tag = "transport_boat", X = 281, Y = 245},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 0},
			
			EntityValueSet {Name = "ev_P709_SailingHeroCheck", Value = 0},
	
			DialogSetEnabled {Tag = "transport_boat"},

			DialogSetEnabled {Tag = "undead_captain"},
			
			DialogSetEnabled {Tag = "solution_key"},

		},
	},
	
--	DRAGON DEBUG TIMER initialized
	
	OnOneTimeEvent
	{
		EventName = ">>> *** TEMPORARY *** DRAGON DEBUG TIMER initialized <<<",
		Conditions = 
		{

			GameIsUnBlocked{},

			MapFlagIsTrue	{Name = "mf_P709_DragonDebug"},

		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_DragonDebug"},

		},
	},
	
--	DRAGON DEBUG initialized
	
	OnOneTimeEvent
	{
		EventName = ">>> *** TEMPORARY *** DRAGON DEBUG initialized <<<",
		Conditions = 
		{

			MapTimerIsElapsed {Name = "mt_P709_DragonDebug", Seconds = 2},

		},
		Actions =
		{

			FigureTeamTransfer {Tag = "Surian", Team = "tm_Player"},
			
			FigurePlayerTransfer {Tag = "Surian", Player = "default"},

			FigureFollowEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},

			AvatarFlagSetTrue {Name = "af_DragonAdded"},

			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},
			
			MapTimerStop {Name = "mt_P709_DragonDebug"},

		},
	},
	
--	CHEAT weapons and gold
	
	OnOneTimeEvent
	{
		EventName = ">>> *** TEMPORARY *** CHEAT weapons and gold <<<",
		Conditions = 
		{
	
				MapFlagIsTrue {Name = "mf_P709_Cheat"},

		},
		Actions =
		{

--******************************
--*                            *
--*   CHEAT weapons and gold   *
--*                            *
--******************************
			

		},
	},

--******************************************************************************************
--*                                                                                        *
--*   Arrived from previous map is false - XP cheat initialized (level 24), HEROES added   *
--*                                                                                        *
--******************************************************************************************

	OnOneTimeEvent
	{
		EventName = ">>> af_ArrivedFromPreviousMap is false <<<",
		Conditions = 
		{

			AvatarFlagIsFalse	{Player = "default", Name = "af_ArrivedFromPreviousMap"},

		},
		Actions =
		{

			AvatarXPGive {Player = "default", Amount = 138250},
			
--	Caine spawns
			
			PlayerHeroAdd {HeroId = vHero1ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero1sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},

--	Orc spawns
			
			PlayerHeroAdd {HeroId = vHero2ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero2sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},
			
--	1st optional hero spawns
			
			PlayerHeroAdd {HeroId = vHero3ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero3sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},
			
--	2nd optional hero spawns
			
			PlayerHeroAdd {HeroId = vHero4ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero4sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},
			
--	3rd optional hero spawns
			
			PlayerHeroAdd {HeroId = vHero5ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero5sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},
			
--	1st Companion: Craig (Human) spawns
			
			PlayerHeroAdd {HeroId = vHero6ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero6sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},
			
--	2nd Companion: Sariel spawns
			
			PlayerHeroAdd {HeroId = vHero7ID},
			NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = vHero7sTag, TargetTag = "pl_HumanAvatar", Direction = 90},},

		},

	},
	
--**************************************
--*                                    *
--*   CheatLever_NextMap is turned on  *
--*                                    *
--**************************************

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
	
	OnOneTimeEvent
	{
		EventName = ">>> CheatLever_NextMap is turned on <<<",
		Conditions = 
		{

			LeverIsOn	{Tag = "CheatLever_NextMap"},

		},
		
		Actions =
		{
			
			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
			
			AvatarXPGive {Player = "default", Amount = 41006},
			
			QuestSetSolved {Player = "default", Quest = "IOS_ACT_1"},

			PlayerMapTravelAddon3 {Map = "Campaign/P710_West_Westguard", TargetTag = "Map_Start_Point"},
			
			PlayerHeroRemove {Player = "default", Tag = vHero7sTag},
			
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},

			AvatarFlagSetFalse {Name = "af_DeadDragonIsGameOver"},

			FigureTeamTransfer {Tag = "Surian", Team = "tm_Player"},
			
			FigurePlayerTransfer {Tag = "Surian", Player = "default"},

			AvatarFlagSetTrue {Name = "af_DragonAdded"},

		},
	},

};