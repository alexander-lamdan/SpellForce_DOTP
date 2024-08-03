--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Main Quest 01 script  *
--*                                                  *
--*              Where are the scouts?               *
--*                                                  *
--****************************************************

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

-- Start Norcaine leader's Dialog for Main Quest #1

	OnOneTimeEvent
	{
		EventName = ">>> Start Norcaine leader's Dialog for Main Quest #1 <<<",
		Conditions = 
		{

			MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			DialogSetEnabled	{Tag = "norcaine_leader"},

			MapTimerStop {Name = "mt_P709_FinishQuest"},

		},
	},
	
--	Activate Main Quest #1
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate Main Quest #1 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Accepted"},

			QuestIsNotSolved {Player = "default", Quest = "IOS_MQ_1"},

		},
		Actions =
		{
			
			MapTimerStart {Name = "mt_P709_ActivateQuest"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},
	},

--	ACTIVATING QUEST MQ 1

	OnOneTimeEvent
	{
		EventName = ">>> ACTIVATING QUEST MQ 1 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Accepted"},

			MapTimerIsElapsed {Name = "mt_P709_ActivateQuest", Seconds = 6},

		},
		Actions =
		{

			QuestSetActive {Quest = "IOS_MQ_1"},

		},

	},
	
--	OUTCRY: P709_CRY_MQ_1_T001_CAINE

	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_MQ_1_T001_CAINE <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Accepted"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 10},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_MQ_1_T001_CAINE", Tag = "pl_HumanHeroCaine"},

		},

	},
	
--	OUTCRY: P709_CRY_MQ_1_T002_AVATAR

	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_MQ_1_T002_AVATAR <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Accepted"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 15},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_MQ_1_T002_AVATAR", Tag = "pl_HumanAvatar"},

		},

	},
	
--	OUTCRY: P709_CRY_MQ_1_T003_CRAIG

	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_MQ_1_T003_CRAIG <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Accepted"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 20},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_MQ_1_T003_CRAIG", Tag = "pl_HumanCompanionCraigHuman"},

			MapTimerStop {Name = "mt_P709_ActivateQuest"},

		},

	},
	
--	Dead scout 01 check

	OnOneTimeEvent
	{
		EventName = ">>> Dead scout 01 check + OUTRCY <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_MQ_1"},
	
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
	
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "dead_scout_1", Range = 5},

		},
		Actions =
		{

			ObjectVanish {Tag = "dead_scout_1"},

			MapFlagSetTrue {Name = "mf_P709_DeadScout1"},

		},
	},

--	Dead scout 02 check

	OnOneTimeEvent
	{
		EventName = ">>> Dead scout 02 check  + OUTCRIES <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_MQ_1"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "dead_scout_2", Range = 5},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "dead_scout_2"},
			
			MapFlagSetTrue {Name = "mf_P709_DeadScout2"},

		},
	},
	
--	OUTCRIES: P709_CRY_MQ_1_T004_SARIEL & P709_CRY_MQ_1_T005_ORCHERO
	
	OnOneTimeEvent
	{
		EventName = ">>> OUTCRIES: P709_CRY_MQ_1_T004_SARIEL & P709_CRY_MQ_1_T005_ORCHERO <<<",
		Conditions = 
		{

			OR
			{
				
				MapFlagIsTrue	{Name = "mf_P709_DeadScout1"},
				MapFlagIsTrue	{Name = "mf_P709_DeadScout2"},
				
			},

		},
		Actions =
		{
			
			FigureOutcry {TextTag = "P709_CRY_MQ_1_T004_SARIEL", Tag = "pl_HumanCompanionSariel"},
			FigureOutcry {TextTag = "P709_CRY_MQ_1_T005_ORCHERO", Tag = "pl_HumanHeroOrc"},

		},
	},
		
--	OUTCRY: P709_CRY_MQ_1_T006_AVATAR
			
	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_MQ_1_T006_AVATAR <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_DeadScout1"},
			MapFlagIsTrue	{Name = "mf_P709_DeadScout2"},

		},
		Actions =
		{
			
			FigureOutcry {TextTag = "P709_CRY_MQ_1_T006_AVATAR", Tag = "pl_HumanAvatar"},

		},
	},

--	Report back Main Quest #1

	OnOneTimeEvent
	{
		EventName = ">>> Report back Main Quest #1 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_DeadScout1"},
			MapFlagIsTrue	{Name = "mf_P709_DeadScout2"},

		},
		Actions =
		{
			
			DialogSetEnabled	{Tag = "norcaine_leader"},

		},
	},
	
-- ********************************
-- *                              *
-- *   Completing Main Quest #1   *
-- *                              *
-- ********************************

	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #1 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Completed"},

		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_FinishQuest"},

			QuestSetSolved {Quest = "IOS_MQ_1"},
			
		},

	},
	
--	Completing Main Quest #1 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #1 - XP REWARD <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardMQ1"},
			AvatarSpellGive {Player = "pl_Human", Spell = 483},
			FigureOutcry {TextTag = "crySpell3", Tag = "noFigure"},
			
		},

	},
	
--	Completing Main Quest #1 - SAVING
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #1 - SAVING <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_1_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 10},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_MQ_1_FINISHED",

	},

};

State
{

	StateName = "IOS_MQ_1_FINISHED",

};