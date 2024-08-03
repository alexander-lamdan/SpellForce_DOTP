--*****************************************************
--*                                                   *
--*   Icewastes of Shalibar :: Boat transport script  *
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

-- Sailing is available

	OnOneTimeEvent
	{
		EventName = ">>> Sailing is available <<<",
		Conditions = 
		{
			
			OR
			{

				QuestIsSolved {Quest = "IOS_MQ_3"},
				
			}

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_SailingFromMainIsland"},
			
			FigureTeleport {Tag = "transport_boat", X = 281, Y = 245},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 0},
			
			EntityValueSet {Name = "ev_P709_SailingHeroCheck", Value = 0},
			
			DialogSetEnabled {Tag = "transport_boat"},

		},
	},
	
-- ******************************
-- *                            *
-- *   Sailing to Main Island   *
-- *                            *
-- ******************************

	OnEvent
	{
		EventName = ">>> Sailing cutscene TIMER starts -- sailing to Main Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SailingToMainIsland"},

		},
		Actions =
		{

			DialogSetDisabled	{Tag = "transport_boat"},
			
			MapFlagSetTrue {Name = "mf_P709_CS04_MainIslandStart"},

			MapTimerStart	{Name = "mt_P709_CS04"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingToMainIsland"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingFromWolfSpiritIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromLichIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPuzzleIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPrisonIsland"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingFromMainIsland"},
			
-- Setup for heroes' sailing
			
			ObjectVanish {Tag = "transport_boat_marker"},
			ObjectSpawn {ObjectId = 1591, X = 279, Y = 237, Direction = 0, Tag = "transport_boat_marker"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingHeroCheck"},

		},
	},
	
	OnEvent
	{
		EventName = ">>> Sailing CUTSCENE starts -- sailing to ANY Island <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_CS04", Seconds = 1},

		},
		Actions =
		{

			MapTimerStop	{Name = "mt_P709_CS04"},

			MapFlagSetTrue {Name = "mf_P709_CS04_Start"},
	
		},
	},

	OnEvent
	{
		EventName = ">>> Sailing cutscene ends -- arriving to Main Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS04_End"},
			
			MapFlagIsTrue {Name = "mf_P709_SailingFromMainIsland"},

		},
		Actions =
		{
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 278, Y = 242},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 40},
			
			FigureTeleport {Tag = "transport_boat", X = 281, Y = 245},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 0},
			
			DialogSetEnabled {Tag = "transport_boat"},

			MapFlagSetFalse {Name = "mf_P709_CS04_End"},

		},
	},
	
-- *************************************
-- *                                   *
-- *   Sailing to Wolf Spirit Island   *
-- *                                   *
-- *************************************

	OnEvent
	{
		EventName = ">>> Sailing cutscene TIMER starts -- sailing to Wolf Spirit Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SailingToWolfSpiritIsland"},

		},
		Actions =
		{

			DialogSetDisabled	{Tag = "transport_boat"},

			MapFlagSetTrue {Name = "mf_P709_CS04_WolfSpiritIslandStart"},

			MapTimerStart	{Name = "mt_P709_CS04"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingToWolfSpiritIsland"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingFromMainIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromLichIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPuzzleIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPrisonIsland"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingFromWolfSpiritIsland"},
			
-- Setup for heroes' sailing
			
			ObjectVanish {Tag = "transport_boat_marker"},
			ObjectSpawn {ObjectId = 1591, X = 464, Y = 384, Direction = 0, Tag = "transport_boat_marker"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingHeroCheck"},


		},
	},

	OnEvent
	{
		EventName = ">>> Sailing cutscene ends -- arriving to Wolf Spirit Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS04_End"},

			MapFlagIsTrue {Name = "mf_P709_SailingFromWolfSpiritIsland"},

		},
		Actions =
		{
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 465, Y = 380},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 200},
			
			FigureTeleport {Tag = "transport_boat", X = 467, Y = 382},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 320},
			
			DialogSetEnabled {Tag = "transport_boat"},

			MapFlagSetFalse {Name = "mf_P709_CS04_End"},

		},
	},

-- ******************************
-- *                            *
-- *   Sailing to Lich Island   *
-- *                            *
-- ******************************

	OnEvent
	{
		EventName = ">>> Sailing cutscene TIMER starts -- sailing to Lich Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SailingToLichIsland"},

		},
		Actions =
		{

			DialogSetDisabled	{Tag = "transport_boat"},
			
			MapFlagSetTrue {Name = "mf_P709_CS04_LichIslandStart"},

			MapTimerStart	{Name = "mt_P709_CS04"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingToLichIsland"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingFromMainIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromWolfSpiritIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPuzzleIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPrisonIsland"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingFromLichIsland"},
			
-- Setup for heroes' sailing
			
			ObjectVanish {Tag = "transport_boat_marker"},
			ObjectSpawn {ObjectId = 1591, X = 220, Y = 614, Direction = 0, Tag = "transport_boat_marker"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingHeroCheck"},

		},
	},

	OnEvent
	{
		EventName = ">>> Sailing cutscene ends -- arriving to Lich Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS04_End"},

			MapFlagIsTrue {Name = "mf_P709_SailingFromLichIsland"},

		},
		Actions =
		{
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 220, Y = 609},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 170},
			
			FigureTeleport {Tag = "transport_boat", X = 222, Y = 608},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 230},
			
			DialogSetEnabled {Tag = "transport_boat"},

			MapFlagSetFalse {Name = "mf_P709_CS04_End"},

		},
	},

-- ********************************
-- *                              *
-- *   Sailing to Puzzle Island   *
-- *                              *
-- ********************************

	OnEvent
	{
		EventName = ">>> Sailing cutscene TIMER starts -- sailing to Puzzle Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SailingToPuzzleIsland"},

		},
		Actions =
		{

			DialogSetDisabled	{Tag = "transport_boat"},
			
			MapFlagSetTrue {Name = "mf_P709_CS04_PuzzleIslandStart"},

			MapTimerStart	{Name = "mt_P709_CS04"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingToPuzzleIsland"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingFromMainIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromWolfSpiritIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromLichIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPrisonIsland"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingFromPuzzleIsland"},
			
-- Setup for heroes' sailing
			
			ObjectVanish {Tag = "transport_boat_marker"},
			ObjectSpawn {ObjectId = 1591, X = 589, Y = 628, Direction = 0, Tag = "transport_boat_marker"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingHeroCheck"},

		},
	},

	OnEvent
	{
		EventName = ">>> Sailing cutscene ends -- arriving to Puzzle Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS04_End"},

			MapFlagIsTrue {Name = "mf_P709_SailingFromPuzzleIsland"},

		},
		Actions =
		{
			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 590.75, Y = 632},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 5},
			
			FigureTeleport {Tag = "transport_boat", X = 592.5, Y = 633},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 325},
			
			DialogSetEnabled {Tag = "transport_boat"},

			MapFlagSetFalse {Name = "mf_P709_CS04_End"},

		},
	},
	
-- ********************************
-- *                              *
-- *   Sailing to Prison Island   *
-- *                              *
-- ********************************

	OnEvent
	{
		EventName = ">>> Sailing cutscene TIMER starts -- sailing to Prison Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SailingToPrisonIsland"},

		},
		Actions =
		{

			DialogSetDisabled	{Tag = "transport_boat"},

			MapFlagSetTrue {Name = "mf_P709_CS04_PrisonIslandStart"},

			MapTimerStart	{Name = "mt_P709_CS04"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingToPrisonIsland"},
			
			MapFlagSetFalse {Name = "mf_P709_SailingFromMainIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromWolfSpiritIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromLichIsland"},
			MapFlagSetFalse {Name = "mf_P709_SailingFromPuzzleIsland"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingFromPrisonIsland"},

-- Setup for heroes' sailing
			
			ObjectVanish {Tag = "transport_boat_marker"},
			ObjectSpawn {ObjectId = 1591, X = 430.25, Y = 520, Direction = 0, Tag = "transport_boat_marker"},
			
			MapFlagSetTrue {Name = "mf_P709_SailingHeroCheck"},

		},
	},

	OnEvent
	{
		EventName = ">>> Sailing cutscene ends -- arriving to Prison Island <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS04_End"},

			MapFlagIsTrue {Name = "mf_P709_SailingFromPrisonIsland"},

		},
		Actions =
		{

			FigureTeleport {Tag = "pl_HumanAvatar", X = 430, Y = 514},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 180},
			
			FigureTeleport {Tag = "transport_boat", X = 425.5, Y = 516},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 80},
			
			DialogSetEnabled {Tag = "transport_boat"},

			MapFlagSetFalse {Name = "mf_P709_CS04_End"},

		},
	},
	
-- ***********************************************
-- *                                             *
-- *   Move heroes if they are willing to sail   *
-- *                                             *
-- ***********************************************

-- Check if Hero 1 is ready to sail

	OnEvent
	{
		EventName = ">>> Check if Hero 1 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},

			FigureIsInRangeToEntity	{Tag = vHero1fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero1fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero1fTag, Direction = 0},

		},
	},

-- Check if Hero 2 is ready to sail
	
	OnEvent
	{
		EventName = ">>> Check if Hero 2 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},
			
			FigureIsInRangeToEntity	{Tag = vHero2fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero2fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero2fTag, Direction = 0},

		},
	},
	
-- Check if Hero 3 is ready to sail
	
	OnEvent
	{
		EventName = ">>> Check if Hero 3 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},
			
			FigureIsInRangeToEntity	{Tag = vHero3fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero3fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero3fTag, Direction = 0},

		},
	},
	
-- Check if Hero 4 is ready to sail
	
	OnEvent
	{
		EventName = ">>> Check if Hero 4 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},

			FigureIsInRangeToEntity	{Tag = vHero4fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero4fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero4fTag, Direction = 0},

		},
	},
	
-- Check if Hero 5 is ready to sail
	
	OnEvent
	{
		EventName = ">>> Check if Hero 5 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},

			FigureIsInRangeToEntity	{Tag = vHero5fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero5fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero5fTag, Direction = 0},

		},
	},
	
-- Check if Companion 1 is ready to sail
	
	OnEvent
	{
		EventName = ">>> Check if Companion 1 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},
			
			FigureIsInRangeToEntity	{Tag = vHero6fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero6fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero6fTag, Direction = 0},

		},
	},
	
-- Check if Companion 2 is ready to sail
	
	OnEvent
	{
		EventName = ">>> Check if Companion 2 is ready to sail <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},

			FigureIsInRangeToEntity	{Tag = vHero7fTag, TargetTag = "transport_boat", Range = 14},

		},
		Actions =
		{

			FigureTeleportToEntity {Tag = vHero7fTag, TargetTag = "transport_boat_marker"},
			FigureDirectionSet {Tag = vHero7fTag, Direction = 0},

		},
	},

-- Reset transport boat hero check variables

	OnEvent
	{
		EventName = ">>> Reset transport boat hero check variables <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_SailingHeroCheck"},

			MapFlagIsTrue {Name = "mf_P709_CS04_Playing"},

		},
		Actions =
		{

			MapFlagSetFalse {Name = "mf_P709_SailingHeroCheck"},
			
			MapFlagSetFalse {Name = "mf_P709_CS04_Playing"},

		},
	},
};