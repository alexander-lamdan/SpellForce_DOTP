-- *********************************************************************************
-- ** Handling Quest Branch including                                             **
-- ** MQ08_SCROLLRECOVER, MQ09_SCROLLTOSPIRITIST, MQ10_DRAGONRESURRECT            **
-- ** CS6_DRAGONRESURRECTION                                                      **
-- *********************************************************************************


local SecondsSinceShaikanDuel = 25;
local DragonStatue = "DragonStatue";

local ShaikanThief1 = "ShaikanThief1";
local ShaikanThief2 = "ShaikanThief2";
local ShaikanThief3 = "ShaikanThief3";
local ShaikanThief4 = "ShaikanThief4";
local ShaikanThief5 = "ShaikanThief5";

local Pos_ShaikanThief1 = "Pos_ShaikanThief1";
local Pos_ShaikanThief2 = "Pos_ShaikanThief2";
local Pos_ShaikanThief3 = "Pos_ShaikanThief3";
local Pos_ShaikanThief4 = "Pos_ShaikanThief4";
local Pos_ShaikanThief5 = "Pos_ShaikanThief5";



State --**************************************************** INITIAL STATE
{
	StateName = "INIT",


  --****************************************************************************************************** MQ08_SCROLLRECOVER
	OnOneTimeEvent ------------------------------------------- Initializing 
	{
		EventName = ">>> 'SecondsSinceShaikanDuel' seconds passed since shaikan duel <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SecondsSinceShaikanDuel", Seconds = SecondsSinceShaikanDuel},
		},
		Actions =
		{
			FigureRespawnToEntity	{Tag = ShaikanThief1, TargetTag = Pos_ShaikanThief1},
			FigureRespawnToEntity	{Tag = ShaikanThief2, TargetTag = Pos_ShaikanThief2},
			FigureRespawnToEntity	{Tag = ShaikanThief3, TargetTag = Pos_ShaikanThief3},
			FigureRespawnToEntity	{Tag = ShaikanThief4, TargetTag = Pos_ShaikanThief4},
			FigureRespawnToEntity	{Tag = ShaikanThief5, TargetTag = Pos_ShaikanThief5},

			QuestSetActive	{Player = "default", Quest = "MQ08_SCROLLRECOVER"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Scroll recovered, quest completed
	{
		EventName = ">>> Scroll recovered <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 700, Amount = 1}, -- Scroll of Dragon Reanimation
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "MQ08_SCROLLRECOVER"},
			MapTimerStart	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed"},
			DialogSetEnabled	{Tag = "Spiritist"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward: mt_P706_MQ08_SCROLLRECOVER_Completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed", Seconds = 5 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.MQ08_SCROLLRECOVER.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.MQ08_SCROLLRECOVER.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.MQ08_SCROLLRECOVER.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.MQ08_SCROLLRECOVER.Gold},
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ08_SCROLLRECOVER_Completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed", Seconds = 10 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Outcry... we got it... a resurrection scroll would be better
	{
		EventName = ">>> Outcry: mt_P706_MQ08_SCROLLRECOVER_Completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed", Seconds = 15 },
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryScrollOfReanimation", Tag = ftAvatar, TargetTag = "Spiritist"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Next quest
	{
		EventName = ">>> Next Quest: mt_P706_MQ08_SCROLLRECOVER_Completed > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed", Seconds = 20 },
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "MQ09_SCROLLTOSPIRITIST"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Outcry: scroll should be converted
	{
		EventName = ">>> cryScrollToTheSpiritist    mt_P706_MQ08_SCROLLRECOVER_Completed > 30 <<<",
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed", Seconds = 30},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryScrollToTheSpiritist", Tag = ftHeroOrc, TargetTag = "Spiritist"},
			MapTimerStop	{Name = "mt_P706_MQ08_SCROLLRECOVER_Completed"},
		},
	},




  --************************************************************************************************************ MQ09_SCROLLTOSPIRITIST
	OnOneTimeEvent ------------------------------------------- Spiritist DLG ended
	{
		EventName = ">>> Spiritist DLG ended <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 1}, -- 1 = After conversion (from Scroll of Dragon Reanimation to Scroll of Dragon Resurrection)
			AvatarIsNotTalking {},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 700 , Amount = 1},
			AvatarItemMiscGive	{Player = "default", ItemId = 701 , Amount = 1},

			MapTimerStart	{Name = "mt_P706_MQ09_SCROLLTOSPIRITIST_Completed"},		
		},
	},

	OnOneTimeEvent ------------------------------------------- Set completed
	{
		EventName = ">>> Set completed: mt_P706_MQ09_SCROLLTOSPIRITIST_Completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ09_SCROLLTOSPIRITIST_Completed", Seconds = 5},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ09_SCROLLTOSPIRITIST"},
		},
	},

	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ09_SCROLLTOSPIRITIST_Completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ09_SCROLLTOSPIRITIST_Completed", Seconds = 10 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ09_SCROLLTOSPIRITIST.XP },
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ09_SCROLLTOSPIRITIST_Completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ09_SCROLLTOSPIRITIST_Completed", Seconds = 15 },
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
		EventName = ">>> Next Quest: mt_P706_MQ09_SCROLLTOSPIRITIST_Completed > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ09_SCROLLTOSPIRITIST_Completed", Seconds = 20 },
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "MQ10_DRAGONRESURRECT"},
			DialogSetEnabled	{Tag = "DragonStatue"}, -- continued in CS6_DragonResurrection.lua

			MapTimerStop	{Name = "mt_P706_MQ09_SCROLLTOSPIRITIST_Completed"},
		},
	},

  --************************************************************************************************************ DLG HACK
  -- DLG stucks. Teleport the avatar away when finished
	OnEvent ------------------------------------------- Check wheter the DLG has just ended
	{
		EventName = ">>> mf_P706_AvatarIsTalkingToDragonStatue AND avatar is not talking <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			MapFlagIsTrue	{Name = "mf_P706_AvatarIsTalkingToDragonStatue"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsTalkingToDragonStatue"},
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = "Pos_AvatarAfterDragonDLG"},
		},
	},

  --************************************************************************************************************ MQ10_DRAGONRESURRECT
	OnOneTimeEvent ------------------------------------------- Dragon just resurrected
	{
		EventName = ">>> mf_P706_CS6_DragonResurrection_Ended <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_CS6_DragonResurrection_Ended"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 701 , Amount = 1}, -- Scroll of Dragon Resurrection
			DialogSetDisabled {Tag = "DragonStatue"}, 
			FigureForcedWalk	{Tag = "Surian", X = 507, Y = 340 }, -- close to the avatar

			MapTimerStart	{Name = "mt_P706_MQ10_DRAGONRESURRECT_Completed"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Set solved
	{
		EventName = ">>> Complete Quest: mt_P706_MQ10_DRAGONRESURRECT_Completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ10_DRAGONRESURRECT_Completed", Seconds = 5 },
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ10_DRAGONRESURRECT"},
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ10_DRAGONRESURRECT_Completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ10_DRAGONRESURRECT_Completed", Seconds = 10 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ10_DRAGONRESURRECT.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ10_DRAGONRESURRECT_Completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ10_DRAGONRESURRECT_Completed", Seconds = 15 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			-- mt_P706_MQ10_DRAGONRESURRECT_Completed not stopped, because Acts.lua uses it
		},
	},	
};