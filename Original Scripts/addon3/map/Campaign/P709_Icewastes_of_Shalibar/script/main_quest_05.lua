--*****************************************************
--*                                                   *
--*   Icewastes of Shalibar :: Main Quest 05 script   *
--*                                                   *
--*****************************************************

-- local constant for Sariel

local vHero7ID = 262;
local vHero7sTag = "CompanionSariel";
local vHero7fTag = "pl_HumanCompanionSariel";

State
{

	StateName = "INIT",

-- Activate Main Quest #5
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate Main Quest 5 after completing Main Quest 4 (with 25 sec delay) or by quest debug cheat <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_MQ_4"},
			
			AND
			{

				OR
				{

					MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 25},

					MapFlagIsTrue {Name = "mf_P709_Quest5Debug"},

				}

			}

		},
		Actions =
		{
	
			QuestSetActive {Quest = "IOS_MQ_5"},
			QuestSetActive {Quest = "IOS_SUBQ_51"},
	
			MapValueSet	{Name = "mv_P709_DeactivatedTowers", Value = 0},
			
			DialogSetEnabled	{Tag = "nature_tower"},
			DialogSetEnabled	{Tag = "death_tower"},
			DialogSetEnabled	{Tag = "maze_tower"},
			
			MapTimerStop	{Name = "mt_P709_FinishQuest"},

		},
		
		GotoState ="IOS_SUBQ_51",

	},
	
};

-- Main Quest #5 Subquest #1
	
State
{

	StateName = "IOS_SUBQ_51",

--	Activate Tower of Wolf Spirit
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate the Tower of Wolf Spirit <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_NatureTower"},

		},
		Actions =
		{
			
			ObjectVanish	{Tag = "tower_of_wolf_spirit"},
			ObjectVanish	{Tag = "FX_2_tower_of_wolf_spirit"},
			
			DialogSetDisabled {Tag = "nature_tower"},
			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 431, Y = 387.5},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 330},
			
			AvatarItemMiscTake	{Player = "default", ItemId = 745, Amount = 1},
			
			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSUB_Q511"},
			
			MapValueIncrease	{Name = "mv_P709_DeactivatedTowers"},

		},

	},
	
--	Activate Tower of Lich
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate the Tower of Lich <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_DeathTower"},

		},
		Actions =
		{
			
			ObjectVanish	{Tag = "tower_of_lich"},
			ObjectVanish	{Tag = "FX_2_tower_of_lich"},
			
			DialogSetDisabled {Tag = "death_tower"},

			FigureTeleport	{Tag = "pl_HumanAvatar", X = 274, Y = 640.5},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 300},

			AvatarItemMiscTake {Player = "default", ItemId = 746, Amount = 1},

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSUB_Q512"},

	 		MapValueIncrease	{Name = "mv_P709_DeactivatedTowers"},

		},

	},

--	Activate Tower of Puzzle (Maze)
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate the Tower of Puzzle (Maze) <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MazeTower"},

		},
		Actions =
		{
			
			ObjectVanish	{Tag = "tower_of_puzzle"},
			ObjectVanish	{Tag = "FX_2_tower_of_puzzle"},
			
			DialogSetDisabled {Tag = "maze_tower"},

			FigureTeleport	{Tag = "pl_HumanAvatar", X = 564, Y = 634},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},

			AvatarItemMiscTake {Player = "default", ItemId = 747, Amount = 1},

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardSUB_Q513"},

			MapValueIncrease {Name = "mv_P709_DeactivatedTowers"},

		},

	},
	
-- Check the three towers if they are deactivated
	
	OnOneTimeEvent
	{
		EventName = ">>> Check the three towers if they are deactivated <<<",
		Conditions = 
		{

			MapValueIsEqual	{Name = "mv_P709_DeactivatedTowers", Value = 3},

		},
		Actions =
		{

			QuestSetSolved	{Player = "default", Quest = "IOS_SUBQ_51"},
			
--	Dragon Mount enabled

			FigureTeamTransfer {Tag = "Surian", Team = "tm_Player"},
			
			FigurePlayerTransfer {Tag = "Surian", Player = "default"},

			FigureFollowEntity {Tag = "Surian", TargetTag = "pl_HumanAvatar"},

			FigureOutcry {TextTag = "P709_CRY_MQ_5_T001_JORBAL", Tag = "surian"},

			AvatarFlagSetTrue {Name = "af_DragonAdded"},

			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},
			
			MapTimerStart {Name = "mt_P709_FinishQuest"},

		},

	},
	
--	Completing Main Quest #5 Subquest #1 - SAVING
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #5 Subquest #1 - SAVING <<<",
		Conditions = 
		{

			QuestIsSolved {Player = "default", Quest = "IOS_SUBQ_51"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 15},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SUBQ_52",

	},

};

-- Main Quest #5 Subquest #2
	
State
{

	StateName = "IOS_SUBQ_52",

--	Activate Main Quest #5 Subquest #2
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate Main Quest #5 Subquest #2 <<<",
		Conditions = 
		{

			QuestIsSolved {Player = "default", Quest = "IOS_SUBQ_51"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 25},

		},
		Actions =
		{

			QuestSetActive {Quest = "IOS_SUBQ_52"},
			
			MapTimerStop {Name = "mt_P709_FinishQuest"},

		},
		
	},

--	Crystal Golem cutscene starts

	OnOneTimeEvent
	{
		EventName = ">>> Crystal Golem agro <<<",
		Conditions = 
		{

			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 40, X = 431 , Y = 555},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_CS05_Start"},

		},

	},

--	Crystal Golem agro
	
	OnOneTimeEvent
	{
		EventName = ">>> Crystal Golem agro <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_CS05_End"},

		},
		Actions =
		{

			FigureTeamTransfer {Tag = "crystal_golem_1", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "crystal_golem_2", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "crystal_golem_3", Team = "tm_Creep"},

		},

	},
	
-- Globe Prison dialog starts
	
	OnOneTimeEvent
	{
		EventName = ">>> Globe Prison dialog starts <<<",
		Conditions = 
		{

			FigureIsDead	{Tag = "crystal_golem_1"},
			FigureIsDead	{Tag = "crystal_golem_2"},
			FigureIsDead	{Tag = "crystal_golem_3"},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "globe_prison"},

		},

	},
	
-- Rainbow Crystal Golem spawns
	
	OnOneTimeEvent
	{
		EventName = ">>> Rainbow Crystal Golem spawns <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_Prison"},

		},
		Actions =
		{

			FigureOutcry	{TextTag = "P709_CRY_MQ_5_T002_AVATAR", Tag = "pl_HumanAvatar"},

			DialogSetDisabled {Tag = "globe_prison"},

			FigureNpcSpawnToEntity	{Tag = "rainbow_crystal_golem", Level = 12, UnitId = 2066, TargetTag = "pl_HumanAvatar", Team = "tm_Creep"},

			FigureAbilityAdd	{Tag = "rainbow_crystal_golem", AbilityId = Ability.Immortal},

			MapFlagSetTrue	{Name = "mf_P709_RainbowCrystalGolem"},

			UIBossfightPanelShow { UnitTag1 = "rainbow_crystal_golem", UnitTag2 = "", PortraitImage = "boss_P709_golem", DisplayName = Boss_P709_Golem},

		},

	},
	
--	Rainbow Crystal Golem died
	
	OnOneTimeEvent
	{
		EventName = ">>> Rainbow Crystal Golem died <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_Prison"},

			FigureIsDead	{Tag = "rainbow_crystal_golem"},
			
			FigureIsDead	{Tag = "crystal_golem_1"},
			FigureIsDead	{Tag = "crystal_golem_2"},
			FigureIsDead	{Tag = "crystal_golem_3"},

		},
		Actions =
		{
			
			DialogSetEnabled {Tag = "globe_prison"},
			
			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemKilled"},

			UIBossfightPanelHide {},
			DaytimeFreeze {Freeze = false},

		},

	},
	
--	Rainbow Crystal Golem died, final cutscene starts
	
	OnOneTimeEvent
	{
		EventName = ">>> Rainbow Crystal Golem died, final cutscene starts <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_PrisonOpened"},

		},
		Actions =
		{
			
			DialogSetDisabled {Tag = "globe_prison"},

			MapTimerStart	{Name = "mf_P709_FinishQuest"},

		},

	},
	
--	Final cutscene starts | ACHIEVEMENT: FROZEN STEPS

		OnOneTimeEvent
	{
		EventName = ">>> Final cutscene starts | ACHIEVEMENT: FROZEN STEPS <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_PrisonOpened"},
			
			MapTimerIsElapsed	{Name = "mf_P709_FinishQuest", Seconds = 1},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "prison"},
			
			AvatarFlagSetTrue {Name = "af_Achievement_P709_Completed"},
			
			MapFlagSetTrue {Name = "mf_P709_CS06_Start"},

			MapTimerStop {Name = "mf_P709_FinishQuest"},

		},

	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P709_CS_06_Start"},
			MapFlagIsFalse {Name = "mf_P709_CS_06_End"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},

-- FIN

	OnOneTimeEvent
	{
		EventName = ">>> FIN <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_CS06_End"},

		},
		Actions =
		{			

--	set the position and initial flags of the boat transport

			MapFlagSetTrue {Name = "mf_P709_SailingFromMainIsland"},

			MapFlagSetFalse {Name = "mf_P709_SailingFromPrisonIsland"},

			FigureTeleport {Tag = "transport_boat", X = 281, Y = 245},
			FigureLookAtDirection	{Tag = "transport_boat", Direction = 0},

--	solve quests, add reward

			QuestSetSolved {Player = "default", Quest = "IOS_SUBQ_52"},
			
			QuestSetSolved {Player = "default", Quest = "IOS_MQ_5"},
			
			QuestSetSolved {Player = "default", Quest = "IOS_ACT_1"},
			
			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardMQ5"},

--	get out Sariel from the party

			PlayerHeroRemove {Player = "default", Tag = vHero7sTag},

--	game ends

			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},

			PlayerMapTravelAddon3 {Map = "Campaign/P710_West_Westguard", TargetTag = "Map_Start_Point"},

		},

	},

};