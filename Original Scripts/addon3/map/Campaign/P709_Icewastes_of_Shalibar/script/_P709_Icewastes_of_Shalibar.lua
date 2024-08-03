--*************************************************************************
--*                                                                       *
--*   Icewastes of Shalibar :: Main Script -- Prologue and Initial Quest  *
--*                                                                       *
--*************************************************************************

State
{

	StateName = "INIT",
	
-- Start cutscene	01, spawn heroes

	OnOneTimeEvent
	{
		EventName = ">>> Start cutscene 01, spawn heroes <<<",
		Conditions = 
		{

				GameIsUnBlocked{},

		},
		Actions =
		{

--	Set initial daytime

		DaytimeChange {Minutes = 510},
		DaytimeFreeze {Freeze = true},
		
--	Set the starting position of the avatar

			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 180},

--	Switching off dragon mount possibility
			
			AvatarFlagSetFalse {Name = "af_DragonMountEnabled"},
			
			AvatarFlagSetTrue {Name = "af_DeadDragonIsGameOver"},

--	Set IMMORTALITY for key NPC's

			FigureAbilityAdd {Tag = "norcaine_leader", AbilityId = Ability.Immortal},

			FigureAbilityAdd {Tag = "norcaine_smith", AbilityId = Ability.Immortal},

			FigureAbilityAdd {Tag = "norcaine_vendor", AbilityId = Ability.Immortal},

			FigureAbilityAdd {Tag = "undead_captain", AbilityId = Ability.Immortal},

			FigureAbilityAdd {Tag = "transport_boat", AbilityId = Ability.Immortal},

			FigureAbilityAdd {Tag = "wolf_spirit", AbilityId = Ability.Immortal},
			
--	Cutscene 01 starts

			MapFlagSetTrue {Name = "mf_P709_CS01_Start"},	

		}
	},
------------------------
-- Autosave Handling
------------------------
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Autosave called <<<",
		Name = "AutosaveTimer",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Autosave" },
		},	
		Actions =
		{	
			EventReEnable {Name = "AutosaveNow"},
			MapTimerStart {Name = "mt_Autosave"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> Autosave execute <<<",
		Name = "AutosaveNow",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Autosave" },
			MapTimerIsElapsed	{Name = "mt_Autosave", Seconds = 5},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},	
		Actions =
		{	
			EventReEnable {Name = "AutosaveTimer"},
			MapTimerStop {Name = "mt_Autosave"},
			MapFlagSetFalse { Name = "mf_Autosave" },
			DoAutoSave {},
		},
	},

--******************************************************************************
--*                                                                            *
--*                             STARTING THE GAME                              *
--*                                                                            *
--******************************************************************************

--	Activate IOS ACT 1

	OnOneTimeEvent
	{
		EventName =">>> Activate IOS ACT  1 <<<",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_P709_CS01_End"},

		},
		Actions =
		{
			AvatarFlagSetFalse {Name = "af_DragonMountEnabled"},	
			
			QuestSetActive {Quest = "IOS_ACT_1"},

			FigureTeamTransfer {Tag = "wolfpack_0101", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0102", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0103", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0104", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0105", Team = "tm_Creep"},
			
			FigureTeamTransfer {Tag = "wolfpack_0106", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0107", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0108", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0109", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0110", Team = "tm_Creep"},
			
			FigureForceAttackEntity	{Tag = "wolfpack_0101", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0102", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0103", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0104", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0105", TargetTag = "norcaine_leader"},
			
			FigureForceAttackEntity	{Tag = "wolfpack_0106", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0107", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0108", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0109", TargetTag = "norcaine_leader"},
			FigureForceAttackEntity	{Tag = "wolfpack_0110", TargetTag = "norcaine_leader"},
			
			MapTimerStart	{Name = "mt_P709_ActivateQuest"},

		},
	},

--	INITIAL SAVING

	OnOneTimeEvent
	{
		EventName = ">>> INITIAL SAVING <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 0.1},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

	},

--	OUTCRY: P709_CRY_INTRO_T001_NORCAINEGUARD
	
	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_INTRO_T001_NORCAINEGUARD <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 10},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_INTRO_T001_NORCAINEGUARD", Tag = "norcaine_guard_1"},
			
			DialogSetEnabled {Tag = "solution_key"},
			
			DialogSetEnabled {Tag = "maze_gate"},

		},

	},

--	OUTCRY: P709_CRY_INTRO_T002_NORCAINEGUARD

	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_INTRO_T002_NORCAINEGUARD <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 15},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_INTRO_T002_NORCAINEGUARD", Tag = "norcaine_guard_1"},
			
			MapTimerStop	{Name = "mt_P709_ActivateQuest"},

		},

	},
	
-- Start cutscene	02 TIMER

	OnOneTimeEvent
	{
		EventName = ">>> Start cutscene	02 TIMER <<<",
		Conditions = 
		{

				FigureIsAlive {Tag = "pl_HumanAvatar"},

				FigureIsDead	{Tag = "wolfpack_0101"},
				FigureIsDead	{Tag = "wolfpack_0102"},
				FigureIsDead	{Tag = "wolfpack_0103"},
				FigureIsDead	{Tag = "wolfpack_0104"},
				FigureIsDead	{Tag = "wolfpack_0105"},
				FigureIsDead	{Tag = "wolfpack_0106"},
				FigureIsDead	{Tag = "wolfpack_0107"},
				FigureIsDead	{Tag = "wolfpack_0108"},
				FigureIsDead	{Tag = "wolfpack_0109"},
				FigureIsDead	{Tag = "wolfpack_0110"},

		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_CS02_Start"},

		},
	},
	
--	Start cutscene 02
	
	OnOneTimeEvent
	{
		EventName = ">>> Start cutscene	02 <<<",
		Conditions = 
		{

			FigureIsAlive {Tag = "pl_HumanAvatar"},

			MapTimerIsElapsed	{Name = "mt_P709_CS02_Start", Seconds = 5},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_CS02_Start"},

			MapFlagSetTrue {Name = "mf_P709_CS02_Start"},

		},
	},
	
-- Main Quest 0 solved
	
	OnOneTimeEvent
	{
		EventName = ">>> Main Quest 0 solved <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_CS02_End"},

		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_FinishQuest"},
			
--	Set Norcaine Smith active
			
			FigureTeamTransfer	{Tag = "norcaine_smith", Team = "tm_Norcaine"},

			DialogSetEnabled	{Tag = "norcaine_smith"},

		},
	},

--******************************************************************************
--*                                                                            *
--*                       EVENTS CAN BE HAPPENED ANYTIME                       *
--*                                                                            *
--******************************************************************************

-- OUTCRY: P709_CRY_SUBQ_22_T007_AVATAR
	
	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_SUBQ_22_T007_AVATAR <<<",
		Conditions =
		{

			AvatarHasItemMisc	{Player = "default", ItemId = 745, Amount = 1},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_SUBQ_22_T007_AVATAR", Tag = "pl_HumanAvatar"},

		},
	},
	
--	Avatar positioning after dialog - Nature tower

	OnEvent
	{
		EventName = ">>> Avatar positioning after dialog - Nature tower <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_NatureTowerPositioning"},

		},
		Actions =
		{
			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 431, Y = 387.5},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 330},

			MapFlagSetFalse {Name = "mf_P709_NatureTowerPositioning"},

		},

	},

--	Avatar positioning after dialog - Death tower
	
	OnEvent
	{
		EventName = ">>> Avatar positioning after dialog - Death tower <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_DeathTowerPositioning"},

		},
		Actions =
		{

			FigureTeleport	{Tag = "pl_HumanAvatar", X = 274, Y = 640.5},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 300},

			MapFlagSetFalse {Name = "mf_P709_DeathTowerPositioning"},

		},

	},
	
--	Avatar positioning after dialog - Maze tower

	OnEvent
	{
		EventName = ">>> Avatar positioning after dialog - Maze tower <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MazeTowerPositioning"},

		},
		Actions =
		{

			FigureTeleport	{Tag = "pl_HumanAvatar", X = 564, Y = 634},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},

			MapFlagSetFalse {Name = "mf_P709_MazeTowerPositioning"},

		},

	},
	
-- Get the Solution Key

	OnOneTimeEvent
	{
		EventName = ">>> Get the Solution Key <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_SolutionKey"},

		},
		Actions =
		{

			DialogSetDisabled {Tag = "solution_key"},

			ObjectVanish {Tag = "solution_key"},
			
			AvatarItemMiscGive {Player = "default", ItemId = 758, Amount = 1},

		},

	},

	OnEvent
	{
		EventName = "PostMapTravelEnableDragon",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
			QuestIsSolved	{Player = "default", Quest = "IOS_SUBQ_51"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},	
		},
	};

	OnEvent
	{
		EventName = "PostMapTravelDisableDragon",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
			QuestIsNotSolved	{Player = "default", Quest = "IOS_SUBQ_51"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			AvatarFlagSetFalse {Name = "af_DragonMountEnabled"},	
		},
	};

------------------------
-- Death handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> every adventurer died (the death of the dragon is handled in dragon.lua) <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
			FigureIsDead	{Tag = "pl_HumanHeroFirst"},
			FigureIsDead	{Tag = "pl_HumanHeroSecond"},
			FigureIsDead	{Tag = "pl_HumanHeroThird"},
			FigureIsDead	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsDead	{Tag = "pl_HumanCompanionSariel"},
			PlayerHasNotBuildingAmount	{Player = "pl_Human", Amount = 1, OnlyCompleted = default},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title"},
		},
	},

};