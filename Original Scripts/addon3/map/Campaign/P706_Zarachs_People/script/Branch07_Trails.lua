-- ***************************************************************************
-- ** SQ02_TRAILS			                                                       **
-- ***************************************************************************


local btExpansion = "ShaikanExpansion";
local otExpansion = "pos_ShaikanExpansion";

local plShaikanExpansion = "pl_ShaikanExpansion";
local tmShaikan = "tm_Shaikan";

local otTrails = "Pos_Trails";
local distTrails = 20;

local distCryFound = 30;

local ftTargetUnit01 = "ShaikanExpansionWorker1";
local ftTargetUnit02 = "ShaikanExpansionWorker2";
local ftTargetUnit03 = "ShaikanExpansionWorker3";

local ftTargetUnit04 = "ShaikanExpansionSoldier1";
local ftTargetUnit05 = "ShaikanExpansionSoldier2";
local ftTargetUnit06 = "ShaikanExpansionSoldier3";
local ftTargetUnit07 = "ShaikanExpansionSoldier4";
local ftTargetUnit08 = "ShaikanExpansionSoldier5";
local ftTargetUnit09 = "ShaikanExpansionSoldier6";



State --*********************************************************************************************************** INIT State
{
	StateName = "INIT",

	------------------------------------------------------------------------------ Switch mode when Yasha is beaten
	OnOneTimeEvent
	{
		EventName = ">>> Switch mode when Yasha is beaten <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ062_CONVINCE_Completed", Seconds = 0},
			MapValueIsLess	{Name = "mv_P706_Trails_Progress", Value = 6}, -- switch only if not yet finished completely
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_SQ02_TRAILS_solved"},
		},
		GotoState = "DUEL_WON",
	},
	
	------------------------------------------------------------------------------ Outcries when spotted the trails
	OnOneTimeEvent
	{
		EventName = ">>> Found trails outcries, Pos_Trails approached by distTrails (20) <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = distTrails, TargetTag = otTrails},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryTrails1", Tag = ftHeroCaine, TargetTag = otTrails},
			FigureOutcryAlert	{TextTag = "cryTrails2", Tag = ftHeroCaine, TargetTag = otTrails},
			FigureOutcryAlert	{TextTag = "cryTrails3", Tag = ftHeroCaine, TargetTag = otTrails},
			MapValueSet	{Name = "mv_P706_Trails_Progress", Value = 1},
		},
	},

	------------------------------------------------------------------------------ Outcry when spotted the expansion itself
	OnOneTimeEvent
	{
		EventName = ">>> Found the expansion, btExpansion approached by distCryFound (30) <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = distCryFound, TargetTag = btExpansion},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryTrails4", Tag = ftHeroCaine},
			MapValueSet	{Name = "mv_P706_Trails_Progress", Value = 2},
		},
	},
	
	------------------------------------------------------------------------------ Expansion eliminated
	OnOneTimeEvent
	{
		EventName = ">>> Expansion eliminated <<<",
		Conditions = 
		{
--			QuestIsActive	{Player = "default", Quest = "SQ02_TRAILS"}, -- not activate: this way it will be a hidden quest
			BuildingIsDead	{Tag = btExpansion},
--			FigureIsDead	{Tag = ftTargetUnit01},
--			FigureIsDead	{Tag = ftTargetUnit02},
--			FigureIsDead	{Tag = ftTargetUnit03},
--			FigureIsDead	{Tag = ftTargetUnit04},
--			FigureIsDead	{Tag = ftTargetUnit05},
--			FigureIsDead	{Tag = ftTargetUnit06},
--			FigureIsDead	{Tag = ftTargetUnit07},
--			FigureIsDead	{Tag = ftTargetUnit08},
--			FigureIsDead	{Tag = ftTargetUnit09},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryTrails5", Tag = ftHeroCaine},
			MapTimerStart	{Name = "mt_P706_SQ02_TRAILS_solved"},			
			FigureVanish	{Tag = ftTargetUnit01},
			FigureVanish	{Tag = ftTargetUnit02},
			FigureVanish	{Tag = ftTargetUnit03},
			MapValueSet	{Name = "mv_P706_Trails_Progress", Value = 3},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> mt_P706_SQ02_TRAILS_solved >  5 - Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ02_TRAILS_solved", Seconds = 5},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SQ02_TRAILS"},
			MapValueSet	{Name = "mv_P706_Trails_Progress", Value = 4},
		},
	},
		
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> mt_P706_SQ02_TRAILS_solved > 10 - Gold reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ02_TRAILS_solved", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SQ02_TRAILS.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SQ02_TRAILS.Gold },	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SQ02_TRAILS.Gold},		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SQ02_TRAILS.Gold},		
			MapValueSet	{Name = "mv_P706_Trails_Progress", Value = 5},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> mt_P706_SQ02_TRAILS_solved > 15 - AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ02_TRAILS_solved", Seconds = 15 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			MapTimerStop	{Name = "mt_P706_SQ02_TRAILS_solved"},
			MapValueSet	{Name = "mv_P706_Trails_Progress", Value = 6},
		},
	},
};























State --*********************************************************************************************************** DUEL WON State
{
	StateName = "DUEL_WON",

-- mv_P706_Trails_Progress: 1 - spotted outcry played; 2 - found outcry played; 3 - eliminated
-- 4 - quest solved, 5 - gold rewarded, 6 - autosaved (no need to handle this, never happen in the following state)
		
	OnOneTimeEvent
	{
		EventName = ">>> starting the timer mt_P706_SQ02_TRAILS_solved... <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P706_SecondsSinceShaikanDuel", Seconds = 40},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_SQ02_TRAILS_solved"},						
		},
	},
	
	------------------------------------------------------------------------------ Outcry for the expansion HQ
	OnOneTimeEvent
	{
		EventName = ">>> mv_P706_Trails_Progress < 2 (not found the HQ yet) -> play the found HQ cry... <<<",
		Conditions = 
		{
			MapValueIsLess	{Name = "mv_P706_Trails_Progress", Value = 2}, -- not yet found the base
			MapTimerIsElapsed	{Name = "mt_P706_SQ02_TRAILS_solved", Seconds = 0},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryTrails4", Tag = ftHeroCaine, TargetTag = otExpansion},
		},
	},

	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> mt_P706_SQ02_TRAILS_solved >  5 - Quest solved <<<",
		Conditions = 
		{
			MapValueIsLess	{Name = "mv_P706_Trails_Progress", Value = 4}, -- quest had not been set to solved yet

			MapTimerIsElapsed	{Name = "mt_P706_SQ02_TRAILS_solved", Seconds = 5},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SQ02_TRAILS"},
		},
	},
		
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> mt_P706_SQ02_TRAILS_solved > 10 - Gold reward <<<",
		Conditions = 
		{
			MapValueIsLess	{Name = "mv_P706_Trails_Progress", Value = 5}, -- no gold rewarded yet

			MapTimerIsElapsed	{Name = "mt_P706_SQ02_TRAILS_solved", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.SQ02_TRAILS.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.SQ02_TRAILS.Gold },	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.SQ02_TRAILS.Gold},		
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.SQ02_TRAILS.Gold},		
		},
	},
	
	-- autosave is not needed here, because the code cannot reach this part if the autosave had already been done
};