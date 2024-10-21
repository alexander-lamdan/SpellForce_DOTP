-- TODO: clear the new flags

-- *********************************************************************************
-- ** Handling Quest Branch including                                             **
-- ** MQ06_UNIFYSHAIKAN and its SQs: MQ061_FORWARD, MQ062_CONVINCE, MQ063_TAKEOVER**
-- ** MQ07_NLELIMINATE                                                            **
-- ** CS4_SCROLLSTOLEN                                                            **
-- *********************************************************************************


local otPos_PushForwardTarget = "Pos_PushForwardTarget";
local Distance = 20;

local otDuelPitGate = "DuelPitGate";
local otDuelPitGate2 = "DuelPitGate2";
local ftDuelPitGuard = "DuelPitGuard";

local ftEnemyShaikanBoss = "EnemyShaikanBoss"; -- set to immortal in _P706_Zarachs_People.lua /// also defined in Branch03_Battles_TeleportPreventer.lua
local ftNeutralShaikanBoss = "ShaikanBoss"; -- set to immortal in _P706_Zarachs_People.lua
local HPLimitPercent_ShaikanBoss = 15;
local HPLimitPercent_Avatar = 15;

local PosShaikanBoss = { X = 149.943, Y = 261.886 }; -- also defined in Branch03_Battles_TeleportPreventer.lua

local otPos_ArrivalPoint = "Pos_DuelPitArrivalPoint"; -- also defined in Branch03_Battles_TeleportPreventer.lua
local otPos_ExitPointOnLoose = "Pos_ExitPointOnLoose";

local MinimumForTakeOverTime = 300;
local TakoverBuildingNoLimit = 18; -- takover is completed when the player reaches this amount of buildings, but not earlier than the time limit

-- mv_P706_Progress_ShaikanDuel is set only in this script, read by ShaikanBoss.lsd: 0-default: waiting for init signal (in dlg) 1: lets duel
-- mv_P706_State_ShaikanBoss is used in dlg: 0-default: open for duel, 1: player lost, 2: player cheated, 3: player won

local DuelProgress = { DontDuel = 0, LetsDuel = 1 }; -- LetsDuel used to be called Preparations
local BossState = { OpenForDuel = 0, PlayerLost = 1, PlayerCheated = 2, PlayerWon = 3 };

local timeOTP_BeforeGoingIn = 0; -- Outside the Pit
local timeBD_BeforeDLGStarts = 2.5; -- Before Dialog
local timeID_BeforeDLGResultsAreMonitored = 1.5; -- In Dialog
local timeHO_BeforeTeleportingOut = 2; -- Heading Out
local timeBF_BeforeFight = 2; -- Before Fight
local timeFL_BeforeOutcry = 2; -- Fight lost
local timeFL_BeforeBFUI_OFF = 4; -- Fight lost
local timeFC_BeforeDLG = 2; -- Fight cheated 
local timeFC_BeforeTeleportOut = 3; -- Must be greater than timeFC_BeforeDLG by max 5 sec (this time must be shorter thatn the DLG could possibly end)

local dist_HeroConsideredInsideDuelPit = 5;
local dist_HeroConsideredInsideDuelPitFixSpot = 25;



State --**************************************************** INITIAL STATE: Avatar is outside the pit
{
	StateName = "PUSH_FORWARD",



	OnOneTimeEvent ------------------------------------------- Initializing ACT_2, MQ06_UNIFYSHAIKAN and MQ061_FORWARD
	{
		EventName = ">>> mf_P706_CS3_NLGathering_Ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P706_CS3_NLGathering_Ended"},		
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ACT_2"},
			QuestSetActive	{Player = "default", Quest = "MQ06_UNIFYSHAIKAN"},
			QuestSetActive	{Player = "default", Quest = "MQ061_FORWARD"},
		},
	},

  --************************************************************************************************ MQ061_FORWARD
	OnOneTimeEvent ------------------------------------------- Target reached
	{
		EventName = ">>> otPos_PushForwardTarget reached by an adventurer <<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = otPos_PushForwardTarget, Range = Distance},		
			QuestIsActive	{Player = "default", Quest = "MQ061_FORWARD"},
		},
		Actions =
		{
			FigureTeleport	{Tag = ftNeutralShaikanBoss, X = PosShaikanBoss.X, Y = PosShaikanBoss.Y },

			DialogSetEnabled {Tag = "DuelPitGuard"},
			
			QuestSetSolved {Player = "default", Quest = "MQ061_FORWARD"},
			QuestSetActive {Player = "default", Quest = "MQ062_CONVINCE"},

			FigureOutcry {TextTag = "cryShaikanBossLetsFindHim1", Tag = ftAvatar},
			MapTimerStart	{Name = "mt_P706_Battles"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Outcry 2nd part
	{
		EventName = ">>> Outcry 2nd part <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Battles", Seconds = 5},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryShaikanBossLetsFindHim2", Tag = ftAvatar, TargetTag = ftNeutralShaikanBoss},
			MapTimerStop	{Name = "mt_P706_Battles"},
		},
		GotoState = "OUTSIDE_THE_PIT",
	},
};
	










-- *********************************************************************************
-- ** 																																					  **
-- ** DUEL SCRIPT STARTS HERE, INCLUDING THE GUARD																**
-- ** 																																					  **
-- *********************************************************************************

-- mf_P706_State_DuelPitGuard_LetIn - is set to true once the DLG with the guard ended, and the player wants to go in
-- it is never deleted in the DLG, that must be done here


State --******************************************************************************************** Avatar is outside the pit
{
	StateName = "OUTSIDE_THE_PIT",

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> state init <<<",
		Name = "OTP_InitState",		
		Conditions = 
		{
		},
		Actions =
		{	
			FigureTeleport	{Tag = ftNeutralShaikanBoss, X = PosShaikanBoss.X, Y = PosShaikanBoss.Y},

			PlayerTravelEnable	{},
			MapFlagSetFalse	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},
			
			MapFlagSetFalse	{Name = "mf_P706_ShaikanDuel_TeleportOut"}, -- set in DLG, shows that the avatar should be teleported out
			MapValueSet	{Name = "mv_P706_Progress_ShaikanDuel", Value = DuelProgress.DontDuel}, -- set to 1 in DLG, causes a switch to BEFORE_FIGHT
			MapValueSet	{Name = "mv_P706_State_ShaikanBoss", Value = BossState.OpenForDuel}, -- resets Yasha's state

			MapFlagSetFalse	{Name = "mf_P706_State_DuelPitGuard_LetIn"},
			DialogSetEnabled	{Tag = ftDuelPitGuard},

			EventReEnable {Name = "OTP_LetInIsTrue"},
			EventReEnable {Name = "OTP_DisableGuardDLG"},
			
			EventReEnable {Name = "OTP_TeleportOutCaine"},
			EventReEnable {Name = "OTP_TeleportOutCraig"},
			EventReEnable {Name = "OTP_TeleportOutOrcHero"},
			EventReEnable {Name = "OTP_TeleportOutHero1"},
			EventReEnable {Name = "OTP_TeleportOutHero2"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> disable the Duel Pit Guard DLG as soon as possible <<<",	
		Name = "OTP_DisableGuardDLG",		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_State_DuelPitGuard_LetIn"},
		},
		Actions =
		{	
			DialogSetDisabled	{Tag = ftDuelPitGuard},
		},
	},	
		
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> player wants to go in <<<",
		Name = "OTP_LetInIsTrue",		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_State_DuelPitGuard_LetIn"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{	
			DialogSetDisabled	{Tag = ftDuelPitGuard},

			MapTimerStart	{Name = "mt_P706_Duel_OTP_LetIn"},
			
			EventReEnable {Name = "OTP_SwitchTo_BD"},
		},
	},	
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> 2 sec passed, switching state to BEFORE_DLG... <<<",
		Name = "OTP_SwitchTo_BD",		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_OTP_LetIn", Seconds = timeOTP_BeforeGoingIn},
		},
		Actions =
		{	
			MapTimerStop	{Name = "mt_P706_Duel_OTP_LetIn"},

			EventReEnable {Name = "OTP_InitState"},
		},
		GotoState = "BEFORE_DLG",
	},	
	
	-- Cheat prevention: a hero is inside the pit... this could only happen in a previous duel try... moving them out
	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, teleports outside the gate: Caine... <<<",
		Name = "OTP_TeleportOutCaine",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_HeroCaine"},
--				FigureIsInRangeToEntity	{Tag = ftHeroCaine, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
				FigureIsInRangeToEntity	{Tag = ftHeroCaine, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPitFixSpot},
			},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_HeroCaine"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, teleports outside the gate: Craig... <<<",
		Name = "OTP_TeleportOutCraig",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_CompCraig"},
--				FigureIsInRangeToEntity	{Tag = ftCompCraig, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
				FigureIsInRangeToEntity	{Tag = ftCompCraig, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPitFixSpot},
			},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_CompCraig"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, teleports outside the gate: Orc Hero... <<<",
		Name = "OTP_TeleportOutOrcHero",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_HeroOrc"},
--				FigureIsInRangeToEntity	{Tag = ftHeroOrc, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
				FigureIsInRangeToEntity	{Tag = ftHeroOrc, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPitFixSpot},
			},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_HeroOrc"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, teleports outside the gate: Hero 1st... <<<",
		Name = "OTP_TeleportOutHero1",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_Hero1"},
--				FigureIsInRangeToEntity	{Tag = ftHero1, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
				FigureIsInRangeToEntity	{Tag = ftHero1, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPitFixSpot},
			},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_Hero1"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, teleports outside the gate: Hero 2nd... <<<",
		Name = "OTP_TeleportOutHero2",
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_Hero2"},
--				FigureIsInRangeToEntity	{Tag = ftHero2, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
				FigureIsInRangeToEntity	{Tag = ftHero2, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPitFixSpot},
			},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_Hero2"},
		},
	},	
};
	
	
	
	
	
	
State --******************************************************************************************** Avatar is inside the pit, before the DLG
{
	StateName = "BEFORE_DLG",

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> state init <<<",
		Name = "BD_InitState",		
		Conditions = 
		{
		},
		Actions =
		{				
			PlayerTravelDisable	{},
			MapFlagSetTrue	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},
			
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = otPos_ArrivalPoint},
			FigureLookAtDirection	{Tag = ftAvatar, Direction = 257},		

			MapFlagSetFalse	{Name = "mf_P706_DuelPit_HeroSummoned"},
			
			MapTimerStart	{Name = "mt_P706_Duel_BD_Wait"},

			EventReEnable {Name = "BD_SwitchTo_ID"},
		},
	},
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> 4 sec passed, switching to IN_DIALOG state... <<<",
		Name = "BD_SwitchTo_ID",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_BD_Wait", Seconds = timeBD_BeforeDLGStarts},
		},
		Actions =
		{	
			MapTimerStop	{Name = "mt_P706_Duel_BD_Wait"},

			EventReEnable {Name = "BD_InitState"},
		},
		GotoState = "IN_DIALOG",
	},
};

	
	
	
	



State --******************************************************************************************** DLG and its outcomes
{
	StateName = "IN_DIALOG",

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> state init <<<",
		Name = "ID_InitState",		
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Duel_EscapedFromPit"},
		},
		Actions =
		{				
--			DialogSetEnabled	{Tag = "ShaikanBoss"},
			DialogBegin	{Player = "pl_Human", Tag = ftNeutralShaikanBoss},
			
			MapTimerStart	{Name = "mt_P706_Duel_ID_Since"},

			EventReEnable {Name = "ID_PlayerChoseToFight"},
			EventReEnable {Name = "ID_PlayerChoseNotToFight"},
			EventReEnable {Name = "ID_ESC_Pressed"},

			EventReEnable {Name = "ID_TeleportOutCaine"},
			EventReEnable {Name = "ID_TeleportOutCraig"},
			EventReEnable {Name = "ID_TeleportOutOrcHero"},
			EventReEnable {Name = "ID_TeleportOutHero1"},
			EventReEnable {Name = "ID_TeleportOutHero2"},

		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> teleporting outside the gate: Caine... <<<",
		Name = "ID_TeleportOutCaine",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FC_BeforeTeleportOut", Seconds = timeFC_BeforeTeleportOut},
			MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_HeroCaine"},
--			FigureIsInRangeToEntity	{Tag = ftHeroCaine, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_HeroCaine"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> teleporting outside the gate: Craig... <<<",
		Name = "ID_TeleportOutCraig",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FC_BeforeTeleportOut", Seconds = timeFC_BeforeTeleportOut},
			MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_CompCraig"},
--			FigureIsInRangeToEntity	{Tag = ftCompCraig, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_CompCraig"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> teleporting outside the gate: Orc Hero... <<<",
		Name = "ID_TeleportOutOrcHero",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FC_BeforeTeleportOut", Seconds = timeFC_BeforeTeleportOut},
			MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_HeroOrc"},			
--			FigureIsInRangeToEntity	{Tag = ftHeroOrc, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_HeroOrc"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> teleporting outside the gate: Hero 1st... <<<",
		Name = "ID_TeleportOutHero1",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FC_BeforeTeleportOut", Seconds = timeFC_BeforeTeleportOut},
			MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_Hero1"},			
--			FigureIsInRangeToEntity	{Tag = ftHero1, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_Hero1"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> teleporting outside the gate: Hero 2nd... <<<",
		Name = "ID_TeleportOutHero2",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FC_BeforeTeleportOut", Seconds = timeFC_BeforeTeleportOut},
			MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_Hero2"},
--			FigureIsInRangeToEntity	{Tag = ftHero2, TargetTag = otPos_ArrivalPoint, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{		
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = otPos_ExitPointOnLoose},
			MapFlagSetFalse	{Name = "mf_P706_Duel_Summoned_Hero2"},
		},
	},	

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> player wants to fight, switching to BEFORE_FIGHT state... <<<",
		Name = "ID_PlayerChoseToFight",		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_ID_Since", Seconds = timeID_BeforeDLGResultsAreMonitored},
			MapValueIsEqual	{Name = "mv_P706_Progress_ShaikanDuel", Value = DuelProgress.LetsDuel},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{				
--			DialogSetDisabled	{Tag = "ShaikanBoss"},

			MapTimerStop	{Name = "mt_P706_Duel_ID_Since"},

			EventReEnable {Name = "ID_InitState"},
		},
		GotoState = "BEFORE_FIGHT",
	},		
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> player don't want to fight, switching to HEADING_OUT state... <<<",
		Name = "ID_PlayerChoseNotToFight",		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_ID_Since", Seconds = timeID_BeforeDLGResultsAreMonitored},
			MapFlagIsTrue	{Name = "mf_P706_ShaikanDuel_TeleportOut"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{				
--			DialogSetDisabled	{Tag = "ShaikanBoss"},

			MapTimerStop	{Name = "mt_P706_Duel_ID_Since"},

			EventReEnable {Name = "ID_InitState"},
		},
		GotoState = "HEADING_OUT",
	},	
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> ESC pressed during dialog, switching to HEADING_OUT state... <<<",
		Name = "ID_ESC_Pressed",		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_ID_Since", Seconds = timeID_BeforeDLGResultsAreMonitored},
			MapValueIsNotEqual	{Name = "mv_P706_Progress_ShaikanDuel", Value = DuelProgress.LetsDuel}, -- player don't want to fight
			MapFlagIsFalse	{Name = "mf_P706_ShaikanDuel_TeleportOut"}, -- and don't want to leave... so ESC was pressed
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{				
--			DialogSetDisabled	{Tag = "ShaikanBoss"},

			MapTimerStop	{Name = "mt_P706_Duel_ID_Since"},

			EventReEnable {Name = "ID_InitState"},
		},
		GotoState = "HEADING_OUT",
	},
};








State --******************************************************************************************** Heading out
{
	StateName = "HEADING_OUT",

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> state init <<<",
		Name = "HO_InitState",		
		Conditions = 
		{
		},
		Actions =
		{						
			MapTimerStart	{Name = "mt_P706_Duel_HO_Since"},

			EventReEnable {Name = "HO_TeleportOutAvatar"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, teleports outside the gate: Avatar... <<<",
		Name = "HO_TeleportOutAvatar",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_HO_Since", Seconds = timeHO_BeforeTeleportingOut},
		},
		Actions =
		{		
			MapValueSet	{Name = "mv_P706_State_DuelPitGuard", Value = 1}, -- already been in

			FigureAbilityRemove	{Tag = ftAvatar, AbilityId = Ability.Immortal},
			FigureHealthSet	{Tag = ftAvatar, Percent = 100},
			FigureManaSet	{Tag = ftAvatar, Percent = 100},

			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = otPos_ExitPointOnLoose},

			EventReEnable {Name = "HO_InitState"},
		},
		GotoState = "OUTSIDE_THE_PIT",		
	},	
};
	
	




State --******************************************************************************************** Before fight
{
	StateName = "BEFORE_FIGHT",

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> state init <<<",
		Name = "BF_InitState",		
		Conditions = 
		{
		},
		Actions =
		{				
			MapTimerStart	{Name = "mt_P706_Duel_BF_Wait"},

			EventReEnable {Name = "BF_SwitchTo_IF"},
		},
	},
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> 3 sec passed, switching to IN_FIGHT state... <<<",
		Name = "BF_SwitchTo_IF",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_BF_Wait", Seconds = timeBF_BeforeFight},
		},
		Actions =
		{	
			MapTimerStop	{Name = "mt_P706_Duel_BF_Wait"},

			FigureTeleport	{Tag = ftNeutralShaikanBoss, X = 1, Y = 1},
			NoSpawnEffect {Spawn = FigureRespawn	{Tag = ftEnemyShaikanBoss, X = PosShaikanBoss.X, Y = PosShaikanBoss.Y},},

			FigureAbilityAdd	{Tag = ftEnemyShaikanBoss, AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = ftAvatar, AbilityId = Ability.Immortal}, 

			FigureHealthSet	{Tag = ftAvatar, Percent = 100},
			FigureHealthSet	{Tag = ftEnemyShaikanBoss, Percent = 100},

			FigureManaSet	{Tag = ftAvatar, Percent = 100},
			FigureManaSet	{Tag = ftEnemyShaikanBoss, Percent = 100},
			
			UIBossfightPanelShow { UnitTag1 = ftEnemyShaikanBoss, UnitTag2 = "", PortraitImage = "boss_P706_yasha_ashir", DisplayName = Boss_P706_ShaikanBoss},

			EventReEnable {Name = "BF_InitState"},
		},
		GotoState = "IN_FIGHT",
	},
};







State --******************************************************************************************** In fight
{
	StateName = "IN_FIGHT",

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> state init <<<",
		Name = "IF_InitState",		
		Conditions = 
		{
		},
		Actions =
		{				
			EventReEnable {Name = "IF_PlayerWin"},
			EventReEnable {Name = "IF_PlayerLost"},
--			EventReEnable {Name = "IF_CheckForHeroes"},
			EventReEnable {Name = "IF_CheckForHeroCaine"},
			EventReEnable {Name = "IF_CheckForHeroOrc"},
			EventReEnable {Name = "IF_CheckForHero1"},
			EventReEnable {Name = "IF_CheckForHero2"},
			EventReEnable {Name = "IF_CheckForCompCraig"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> player win... <<<",
		Name = "IF_PlayerWin",		
		Conditions = 
		{
			FigureHasNotHealth	{Tag = ftEnemyShaikanBoss, Percent = HPLimitPercent_ShaikanBoss},
		},
		Actions =
		{
			EventReEnable {Name = "IF_InitState"},
		},
		GotoState = "FIGHT_WON",		
	},
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> player lost... <<<",
		Name = "IF_PlayerLost",		
		Conditions = 
		{
			FigureHasNotHealth	{Tag = ftAvatar, Percent = HPLimitPercent_Avatar},
		},
		Actions =
		{
			EventReEnable {Name = "IF_InitState"},
		},
		GotoState = "FIGHT_LOST",		
	},
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> Caine is summoned to the avatar in the pit <<<",
		Name = "IF_CheckForHeroCaine",		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftHeroCaine,	TargetTag = ftAvatar, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Duel_Summoned_HeroCaine"},
			MapTimerStart	{Name = "mt_P706_Duel_SomebodySummoned"},
			EventReEnable	{Name = "IF_CheckForHeroes"},
		},
	},	
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> Hero Orc is summoned to the avatar in the pit <<<",
		Name = "IF_CheckForHeroOrc",		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftHeroOrc,	TargetTag = ftAvatar, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Duel_Summoned_HeroOrc"},
			MapTimerStart	{Name = "mt_P706_Duel_SomebodySummoned"},
			EventReEnable	{Name = "IF_CheckForHeroes"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> Hero1 is summoned to the avatar in the pit <<<",
		Name = "IF_CheckForHero1",		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftHero1,	TargetTag = ftAvatar, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Duel_Summoned_Hero1"},
			MapTimerStart	{Name = "mt_P706_Duel_SomebodySummoned"},
			EventReEnable	{Name = "IF_CheckForHeroes"},		
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> Hero2 is summoned to the avatar in the pit <<<",
		Name = "IF_CheckForHero2",		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftHero2,	TargetTag = ftAvatar, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Duel_Summoned_Hero2"},
			MapTimerStart	{Name = "mt_P706_Duel_SomebodySummoned"},
			EventReEnable	{Name = "IF_CheckForHeroes"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> Comp Craig is summoned to the avatar in the pit <<<",
		Name = "IF_CheckForCompCraig",		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftCompCraig,	TargetTag = ftAvatar, Range = dist_HeroConsideredInsideDuelPit},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Duel_Summoned_CompCraig"},
			MapTimerStart	{Name = "mt_P706_Duel_SomebodySummoned"},
			EventReEnable	{Name = "IF_CheckForHeroes"},
		},
	},
		
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> one of the heroes is summoned to the fighting pit <<<",
		Name = "IF_CheckForHeroes",		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_SomebodySummoned", Seconds = 0.1},
--			OR
--			{
--				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_HeroCaine"},
--				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_HeroOrc"},
--				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_Hero1"},
--				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_Hero2"},
--				MapFlagIsTrue	{Name = "mf_P706_Duel_Summoned_CompCraig"},
--			},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_Duel_SomebodySummoned"},
			EventReEnable {Name = "IF_InitState"},
		},
		GotoState = "FIGHT_CHEATED",		
	},
};




State --******************************************************************************************** Fight won
{
	StateName = "FIGHT_WON",

	OnOneTimeEvent 
	{
		EventName = ">>> state init <<<",
		Conditions = 
		{
		},
		Actions =
		{				
			FigureStop {Tag = ftAvatar},
			FigureStop {Tag = ftEnemyShaikanBoss},
						
			UIBossfightPanelHide {},

--			FigureVanish	{Tag = ftEnemyShaikanBoss},
--			FigureTeleport	{Tag = ftNeutralShaikanBoss, X = PosShaikanBoss.X , Y = PosShaikanBoss.Y },

			MapValueSet	{Name = "mv_P706_State_ShaikanBoss", Value = BossState.PlayerWon}, -- 3-Player won - this starts the CS4_ScrollStolen
		},
	},

	OnOneTimeEvent ------------------------------------------- Stop the boss immediately
	{
		EventName = ">>> Set quest solved: mt_P706_MQ062_CONVINCE_Completed > 0 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 0 }, -- started in CS4_ScrollStolen.lua
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},

			FigureVanish {Tag = ftNeutralShaikanBoss},
			FigureVanish {Tag = ftEnemyShaikanBoss},
			FigureVanish	{Tag = "DuelPitGuard"},
			FigureVanish	{Tag = "DuelPitGuard2"},			
			
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_01"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_02"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_03"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_04"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_05"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_06"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_07"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_08"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_09"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_10"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_11"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_12"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_1_13"},

			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_01"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_02"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_03"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_04"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_05"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_06"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_07"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_08"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_09"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_10"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_11"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_2_12"},
			
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_01"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_02"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_03"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_04"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_05"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_06"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_07"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_08"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_09"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_10"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_11"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_12"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_13"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_14"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_15"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_16"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_17"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_18"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_19"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_20"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_21"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_3_22"},
			
			FigureVanish	{Tag = "Shaikan_TakeFromBase_4_01"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_4_02"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_4_03"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_4_04"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_4_05"},
			
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_01"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_02"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_03"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_04"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_05"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_06"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_07"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_08"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_09"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_10"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_11"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_12"},
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_13"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_14"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_15"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_16"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_17"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_18"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_19"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_20"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_21"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_22"},						
			FigureVanish	{Tag = "Shaikan_TakeFromBase_5_23"},	

			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_01"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_02"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_03"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_04"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_05"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_06"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_07"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_6_08"},	

			FigureVanish	{Tag = "Shaikan_TakeFromBase_7_01"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_7_02"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_7_03"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_7_04"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_7_05"},	
			FigureVanish	{Tag = "Shaikan_TakeFromBase_7_06"},	
			
			FigureVanish	{Tag = "ShaikanExpansionSoldier1"},	
			FigureVanish	{Tag = "ShaikanExpansionSoldier2"},	
			FigureVanish	{Tag = "ShaikanExpansionSoldier3"},	
			FigureVanish	{Tag = "ShaikanExpansionSoldier4"},	
			FigureVanish	{Tag = "ShaikanExpansionSoldier5"},	
			FigureVanish	{Tag = "ShaikanExpansionSoldier6"},	
			
--			BuildingDestroy	{Tag = "NL_BridgeTowerN1"},
--			BuildingDestroy	{Tag = "NL_BridgeTowerN2"},
			BuildingDestroy	{Tag = "NL_BridgeTowerW1"},
--			BuildingDestroy	{Tag = "NL_BridgeTowerW2"},
			BuildingDestroy	{Tag = "NL_BridgeTowerW3"},
--			BuildingDestroy	{Tag = "NL_BridgeTowerW4"},
			BuildingDestroy	{Tag = "NL_BridgeTowerW5"},
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- CS4_ScrollStolen ended and thus MQ062_CONVINCE ended
	{
		EventName = ">>> Set quest solved: mt_P706_MQ062_CONVINCE_Completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 5 },
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = ftAvatar, AbilityId = Ability.Immortal},

			QuestSetSolved	{Player = "default", Quest = "MQ062_CONVINCE"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Open the gate
	{
		EventName = ">>> Open the gate: mt_P706_MQ062_CONVINCE_Completed > 7 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 7},
		},
		Actions =
		{
			PlayerTravelEnable	{},
			
			GateSetOpen	{Tag = otDuelPitGate},
			GateSetOpen	{Tag = otDuelPitGate2},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP Reward for MQ062_CONVINCE
	{
		EventName = ">>> XP reward: mt_P706_MQ062_CONVINCE_Completed > 10 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 10},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ062_CONVINCE.XP },			
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ062_CONVINCE_Completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 15 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest: mt_P706_MQ062_CONVINCE_Completed > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 20 },
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_MQ062_CONVINCE_Completed"},

			QuestSetActive	{Player = "default", Quest = "MQ063_TAKEOVER"},
			MapTimerStart	{Name = "mt_P706_SecondsSinceShaikanDuel"}, 
		},
		GotoState = "TAKEOVER",
	},	
};







State --******************************************************************************************** Fight lost
{
	StateName = "FIGHT_LOST",	
	
	OnOneTimeRepeatEvent
	{
		EventName = ">> init state... <<",
		Name = "FL_InitState",
		Conditions = 
		{
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_State_ShaikanBoss", Value = BossState.PlayerLost}, -- 1-Player lost
			MapValueAdd	{Name = "mv_P706_State_DuelFailedNo", Value = 1}, -- for achievement

			FigureTeleportToEntity	{Tag = ftNeutralShaikanBoss, TargetTag = ftEnemyShaikanBoss},
			FigureLookAtEntity	{Tag = ftNeutralShaikanBoss, TargetTag = ftAvatar},
			
			FigureTeleport	{Tag = ftEnemyShaikanBoss, X = 1, Y = 1},

			FigureHateClear	{Tag = ftEnemyShaikanBoss},
			
			FigureHateClear	{Tag = ftAvatar},
			FigureHoldPosition	{Tag = ftAvatar},			
			FigureStop	{Tag = ftAvatar},
	
			MapTimerStart	{Name = "mt_P706_Duel_FL"},
			EventReEnable {Name = "FL_Outcry"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> mt_P706_Duel_FL >  2 - Outcry <<<",
		Name = "FL_Outcry",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FL", Seconds = timeFL_BeforeOutcry},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryShaikanBossWon", Tag = ftNeutralShaikanBoss}, 

			EventReEnable {Name = "FL_BossfightUI_OFF"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = ">>> mt_P706_Duel_FL >  4 - Remove the Bossfight UI <<<",
		Name = "FL_BossfightUI_OFF",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FL", Seconds = timeFL_BeforeBFUI_OFF},
		},
		Actions =
		{
			UIBossfightPanelHide {},
			FigureVanish	{Tag = ftEnemyShaikanBoss}, -- who is at 1, 1 ATM

			EventReEnable {Name = "FL_InitState"},
		},
		GotoState = "HEADING_OUT",
	},	
};	






State --******************************************************************************************** Fight cheated
{
	StateName = "FIGHT_CHEATED",	
	
	OnOneTimeRepeatEvent
	{
		EventName = ">> init state... <<",
		Name = "FC_InitState",
		Conditions = 
		{
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_Duel_FC_BeforeTeleportOut"},

			UIBossfightPanelHide {},

			FigureHateClear	{Tag = ftEnemyShaikanBoss},
			FigureAbilityRemove	{Tag = ftEnemyShaikanBoss, AbilityId = Ability.Immortal},
			FigureVanish	{Tag = ftEnemyShaikanBoss},
			
			FigureTeleport	{Tag = ftNeutralShaikanBoss, X = PosShaikanBoss.X, Y = PosShaikanBoss.Y },

			FigureHateClear	{Tag = ftAvatar},
			FigureHoldPosition	{Tag = ftAvatar},			
			FigureStop	{Tag = ftAvatar},

			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = otPos_ArrivalPoint},		
			FigureLookAtEntity	{Tag = ftAvatar, TargetTag = ftNeutralShaikanBoss},
			
			EventReEnable {Name = "FC_SwitchTo_ID"},
		},
	},
		
	OnOneTimeRepeatEvent
	{
		EventName = ">>> wait ended, start the dialog... <<<",
		Name = "FC_SwitchTo_ID",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_FC_BeforeTeleportOut", Seconds = timeFC_BeforeDLG},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},	
		},
		Actions =
		{		
--			MapTimerStop	{Name = "mt_P706_Duel_FC_BeforeTeleportOut"},
			
			MapValueSet	{Name = "mv_P706_Progress_ShaikanDuel", Value = DuelProgress.DontDuel},
			MapValueSet	{Name = "mv_P706_State_ShaikanBoss", Value = BossState.PlayerCheated}, -- 2-Player cheated

			EventReEnable {Name = "FC_InitState"},
		},
		GotoState = "IN_DIALOG",
	},	
};


























State --******************************************************************************************************************* TAKEOVER STATE
{
	StateName = "TAKEOVER",

	OnOneTimeEvent ------------------------------------------- Init
	{
		EventName = ">>> Unlocking shaikan buildings, no event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_Shaikan1_Enabled"},
			MapFlagSetTrue	{Name = "mf_P706_Spawner_Shaikan1_Exterminate"},
			MapFlagSetTrue	{Name = "mf_P706_Spawner_NL2_Enabled"},
			
			BuildingHealthSet	{Tag = "ShaikanHQ1", Percent = 100},
			BuildingAbilityRemove	{Tag = "ShaikanHQ1", AbilityId = Ability.Immortal},

-- WORKAROUND EXPERIMENTATION START:
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ShaikanBaseDefenders"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ShaikanExpansionSoldiers"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ShaikanDuelAudience"},

			PlayerTeamTransfer	{Player = "pl_Shaikan", Team = "tm_Human"},
			PlayerTeamTransfer	{Player = "pl_ShaikanExpansion", Team = "tm_Human"},
--			AIEnemyListClear	{Player = "pl_Shaikan"},
--			AIEnemyRemove	{Player = "pl_Shaikan", Tag = ftAvatar},
			FigureHateClear {Tag = ftAvatar},
--			AIPlayerDeactivate	{Player = "pl_Shaikan"},
--			PlayerBuildingTeamTransfer	{Player = "pl_AI", Team = "tm_Human"},
--			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_AI"},
-- WORKAROUND EXPERIMENTATION ENDED
						
			TransferComputerToHuman { AIPlayer = "pl_Shaikan", Player = "pl_Human" },
			TransferComputerToHuman { AIPlayer = "pl_ShaikanExpansion", Player = "pl_Human" },

			-- HQ (550st): produces Builders, Blademasters, Marksmen and Titans.
			PlayerBuildingAdd	{BuildingId = 191}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 45}, -- Shaikan HQ Upgrd (250st) 
			PlayerBuildingUpgradeAdd	{UpgradeId = 46}, -- Blades HQ Upgrd (250st)
			PlayerBuildingUpgradeAdd	{UpgradeId = 47}, -- Dragons HQ Upgrd (250st)

			-- Food Store (40st)
			PlayerBuildingAdd	{BuildingId = 192}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 48}, -- Depot (From Food Store, 90st)

			-- Resource buildings
			PlayerBuildingAdd	{BuildingId = 193}, -- Stonemason (60st)
			PlayerBuildingAdd	{BuildingId = 194}, -- Smeltery (60st)
			PlayerBuildingAdd	{BuildingId = 195}, -- Alchemist (60st)
			
			-- Altar of Life (HQ, 1000st)
			PlayerBuildingAdd	{BuildingId = 196}, 

			-- Practice Ground (HQ, 100st) enables the prod of Bladesmasters in HQ + upgrades Blademasters 
			PlayerBuildingAdd	{BuildingId = 197}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 52}, -- Weapons Master (From Practice Ground, 180st): enables the prod of Marksmen in HQ + upgrades Marksmen 

			-- Tower (190st, 60si)
			PlayerBuildingAdd	{BuildingId = 198}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 49}, -- Tower Blade Upgrd (30st, 30L)
			PlayerBuildingUpgradeAdd	{UpgradeId = 50}, -- Tower Dragon Upgrd (40si)
			PlayerBuildingUpgradeAdd	{UpgradeId = 51}, -- Tower Shaikan Upgrd (100L) - conjures a flying dragonling to defend

			-- Nexus (Blades HQ Upgrd, 300st), produces: Minion, and if unlocked: Spellbreaker and Destroyer
			PlayerBuildingAdd	{BuildingId = 199}, 

			-- Blades Soulforge (Nexus, 250st), unlocks Spellbreaker in Nexus
			PlayerBuildingAdd	{BuildingId = 200}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 53}, -- Blades Black Anvil (From Blades Soulforge, 350st): unlocks Destroyer in Nexus

			-- Den (Dragons HQ Upgr + 250st)
			PlayerBuildingAdd	{BuildingId = 201}, -- produces Wyrm (non-flying)
--			PlayerBuildingUpgradeAdd	{UpgradeId = 54}, -- Dragon Fire Mountain (From Den, 250st): Produces Fire Drake (flying)
--			PlayerBuildingUpgradeAdd	{UpgradeId = 57}, -- Dragon Stone of Ethernity (From Fire Mountain, 250st): Produces Crystal Drake (flying)

			-- Barracks (Shaikan HQ Upgr + 350st): Produces Vanguards (plus Blademasters and Marksmen)
			PlayerBuildingAdd	{BuildingId = 203}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 55}, -- Garrison (From Barracks, 250st): Produces Standard Bearer
			PlayerBuildingUpgradeAdd	{UpgradeId = 56}, -- Dragon Keep (From Barracks, Garrison + 250st): Produces Blood Mages

			-- Halls of Teaching (From Barracks, 300st, 100si, 100L): upgrades the units from Barracks
			PlayerBuildingAdd	{BuildingId = 204}, 			
			
			PlayerUnitUpgradeAdd { UpgradeId = 9},
			PlayerUnitUpgradeAdd { UpgradeId = 10},
			PlayerUnitUpgradeAdd { UpgradeId = 11},
			PlayerUnitUpgradeAdd { UpgradeId = 12},
			PlayerUnitUpgradeAdd { UpgradeId = 13},
			PlayerUnitUpgradeAdd { UpgradeId = 14},
			PlayerUnitUpgradeAdd { UpgradeId = 15},
			PlayerUnitUpgradeAdd { UpgradeId = 16},
			PlayerUnitUpgradeAdd { UpgradeId = 17},
			PlayerUnitUpgradeAdd { UpgradeId = 18},
		},
	},	

	OnOneTimeEvent ------------------------------------------- takover end
	{
		EventName = ">>> player has enough fully restored buildings && mt_P706_SecondsSinceShaikanDuel ended <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SecondsSinceShaikanDuel", Seconds = MinimumForTakeOverTime},
			PlayerHasBuildingAmount	{Player = "default", Amount = TakoverBuildingNoLimit, OnlyCompleted = true},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "MQ063_TAKEOVER"},
			MapTimerStart	{Name = "mt_P706_MQ063_TAKEOVER_Completed"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ063_TAKEOVER_Completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ063_TAKEOVER_Completed", Seconds = 5 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ063_TAKEOVER.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Parent quest complete
	{
		EventName = ">>> Parent quest complete: mt_P706_MQ063_TAKEOVER_Completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ063_TAKEOVER_Completed", Seconds = 10},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "MQ06_UNIFYSHAIKAN"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward: mt_P706_MQ063_TAKEOVER_Completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ063_TAKEOVER_Completed", Seconds = 15 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.MQ06_UNIFYSHAIKAN.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.MQ06_UNIFYSHAIKAN.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.MQ06_UNIFYSHAIKAN.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.MQ06_UNIFYSHAIKAN.Gold},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ063_TAKEOVER_Completed > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ063_TAKEOVER_Completed", Seconds = 20 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			-- timer not stopped because CS5_ForSariel.lua uses it
		},
	},	
	

	
	
	OnOneTimeEvent --------------------------------------------- CS5_ForSariel cutscene ended 
	{
		EventName = ">>> mf_P706_CS5_ForSariel_Ended <<<", 
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P706_CS5_ForSariel_Ended"},
		},
		Actions =
		{
		},
		GotoState = "NLELIMINATE",	
	},
};

	
	



State --**************************************************** NL ELIMINATE STATE
{
	StateName = "NLELIMINATE",

	OnOneTimeEvent ------------------------------------------- Init
	{
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "MQ07_NLELIMINATE"},

			BuildingAbilityRemove	{Tag = "NLHQ2", AbilityId = Ability.Immortal},
		},
	},

	OnOneTimeEvent ------------------------------------------- All buildings destroyed
	{
		EventName = ">>> No NL buildings left <<<",
		Conditions =
		{
--			PlayerHasNotBuildingAmount {Player = "pl_Nameless", Amount = 1, OnlyCompleted = true},
			PlayerBuildingIsNotInRange	{Player = "pl_Nameless", BuildingId = 0 , Range = 240, X = 126, Y = 680}, -- both nl bases
--			PlayerBuildingIsNotInRange	{Player = "pl_Nameless", BuildingId = 0 , Range = 60, X = 83, Y = 600}, -- west nl base only
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ07_NLELIMINATE"},
			MapTimerStart	{Name = "mt_P706_MQ07_NLELIMINATE_Completed"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ07_NLELIMINATE_Completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 5 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ07_NLELIMINATE.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ07_NLELIMINATE_Completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 10 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			-- mt_P706_MQ07_NLELIMINATE_Completed is not stopped here, because Acts.lua uses it
		},
	},
	
	
	
	
	
	
	OnOneTimeEvent ------------------------------------------- 
	{
		EventName = ">>> 15 sec: cryNLBaseCleared1 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 15},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryNLBaseCleared1", Tag = ftHeroCaine, TargetTag = "TeleportExit"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- 
	{
		EventName = ">>> 20 sec: cryNLBaseCleared2 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 20},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryNLBaseCleared2", Tag = ftAvatar },
		},
	},

	OnOneTimeEvent ------------------------------------------- 
	{
		EventName = ">>> 25 sec: cryNLBaseCleared3 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 25},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryNLBaseCleared3", Tag = ftAvatar, TargetTag = "Spiritist"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Outcry: we need flying units
	{
		EventName = ">>> mt_P706_After_ACT3_Start timer reached 50 seconds <<<",
		Conditions = 
		{		
			MapTimerIsElapsed	{Name = "mt_P706_MQ07_NLELIMINATE_Completed", Seconds = 35},
			AvatarHasItemMisc	{Player = "default", ItemId = 700, Amount = 1}, -- Scroll of Dragon Reanimation			
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryNLBaseCleared4", Tag = ftHeroOrc},
		},
	},
};