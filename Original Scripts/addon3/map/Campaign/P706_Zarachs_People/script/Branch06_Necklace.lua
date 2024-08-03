-- ***************************************************************************
-- ** Handles Quest Branch including:                                       **
-- ** SQ01_TROLLCOLLECT                                                     **
-- ** SQ03_CREATEFLYING                                                     **
-- ** SQ031_TALKTOSPIRITIST                                                 **
-- ** SQ04_BRINGNECKLACE                                                    **
-- ***************************************************************************

local SpawnPointForTotems = "Spiritist";
local SpawnPointForSpiritists = "pl_HumanAvatar";




State --**************************************************** INIT State
{
	StateName = "INIT",


	--************************************************************************************************** SQ01_TROLLCOLLECT
	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> mv_P706_State_TrollHunter = 2 --> Branch06_Necklace initiated <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_TrollHunter", Value = 2 }, -- 2 = Quest given
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SQ01_TROLLCOLLECT"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Complete wolf claw quest
	{
		EventName = ">>> mv_P706_State_TrollHunter = 3 --> SQ01_TROLLCOLLECT solved <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_TrollHunter", Value = 3 }, -- 3 = Quest completed
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 703 , Amount = 6 }, -- Wolf claws
			AvatarItemMiscGive	{Player = "default", ItemId = 704 , Amount = 1 }, -- Necklace made of claws
			
			EntityTimerStart	{Name = "et_P706_SQ01_RewardTimer"},
		},
	},

	OnOneTimeEvent ------------------------------------------- SQ01_TROLLCOLLECT complete
	{
		EventName = ">>> et_P706_SQ01_RewardTimer: 5 sec: quest complete <<<",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_P706_SQ01_RewardTimer", Seconds = 5},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ01_TROLLCOLLECT"},
		},
	},

	OnOneTimeEvent ------------------------------------------- SQ01_TROLLCOLLECT Reward XP
	{
		EventName = ">>> et_P706_SQ01_RewardTimer: 10 sec: XP <<<",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_P706_SQ01_RewardTimer", Seconds = 10},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ01_TROLLCOLLECT.XP },
		},
	},

	OnOneTimeEvent ------------------------------------------- SQ01_TROLLCOLLECT AutoSave
	{
		EventName = ">>> et_P706_SQ01_RewardTimer: 15 sec: AutoSave <<<",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_P706_SQ01_RewardTimer", Seconds = 15},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave{},
			
			EntityTimerStop	{Name = "et_P706_SQ01_RewardTimer"},
		},
	},







--************************************************************************************************* SQ03_CREATEFLYING & SQ031_TALKTOSPIRITIST
--	OnOneTimeEvent ------------------------------------------- Outcry: we need flying units
--	{
--		EventName = ">>> mt_P706_After_ACT3_Start timer reached 50 seconds <<<",
--		Conditions = 
--		{
--			MapTimerIsElapsed	{Name = "mt_P706_After_ACT3_Start", Seconds = 20}, -- Started in Acts.lua
--		},
--		Actions =
--		{
--			FigureOutcry	{TextTag = "cryNLBaseCleared4", Tag = ftAvatar},
--		},
--	},
	
	OnOneTimeEvent ------------------------------------------- Start SQ03_CREATEFLYING
	{
		EventName = ">>> mt_P706_After_ACT3_Start timer reached 55 seconds <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_After_ACT3_Start", Seconds = 25}, -- Started in Acts.lua
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "SQ03_CREATEFLYING"},
			QuestSetActive	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"},
			
			MapValueSet	{Name = "mv_P706_State_Spiritist", Value = 2}, -- CState_ReadyToGiveTotems
			DialogSetEnabled	{Tag = "Spiritist"},

			MapTimerStop	{Name = "mt_P706_After_ACT3_Start"},
		},
	},
	
	
	
	
	
	--***************************************************************** SOLVE version 1 ******************************************************************
	OnOneTimeEvent ------------------------------------- Unlocked totems but not spiritists + necklace quest rejected
	{
		EventName = ">>> mv_P706_State_Spiritist = 3 (TotemsGiven) <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 3 }, -- 3 = CState_TotemsGiven
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ031_TALKTOSPIRITIST"},

			MapTimerStart	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1 > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1", Seconds = 5 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 3 }, -- 3 = CState_TotemsGiven
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ031_TALKTOSPIRITIST.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Parent quest solve
	{
		EventName = ">>> Complete Quest: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1 > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1", Seconds = 10 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 3 }, -- 3 = CState_TotemsGiven
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ03_CREATEFLYING"},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 35}, -- Zarach Temple (from Arena, 400st): enables the prod of Veterans and Totems (flying) in the Field Camp.
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1 > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1", Seconds = 15 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 3 }, -- 3 = CState_TotemsGiven
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			MapTimerStop	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_1"},
		},
	},	
	
	
	
	
	
	-- mv_P706_State_Spiritist == 4 can mean: 
	-- a.) totems were just unlocked and the player now agreed to bring the necklace -> a quest completion is needed
	-- b.) the totems were unlocked earlier, but refused to bring or give the necklace, and now the player agreed to bring the necklace -> _no_ quest completion needed
		

	--***************************************************************** SOLVE version 2 / a.) *************************************************************
	OnOneTimeEvent ------------------------------------- Unlocked totems but not spiritists + necklace quest accepted - all at the same time
	{
		EventName = ">>> mv_P706_State_Spiritist = 4 (WaitingForNecklace) - SQ031_TALKTOSPIRITIST not yet solved (solving now) <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 4 }, -- 4 = CState_WaitingForNecklace + necklace quest accepted
			QuestIsNotSolved	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ031_TALKTOSPIRITIST"},

			MapTimerStart	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2 > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2", Seconds = 5 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 4 }, -- 4 = CState_WaitingForNecklace + necklace quest accepted
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ031_TALKTOSPIRITIST.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Parent quest solve
	{
		EventName = ">>> Complete Parent Quest: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2 > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2", Seconds = 10 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 4 }, -- 4 = CState_WaitingForNecklace + necklace quest accepted
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ03_CREATEFLYING"},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 35}, -- Zarach Temple (from Arena, 400st): enables the prod of Veterans and Totems (flying) in the Field Camp.
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2 > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2", Seconds = 15 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 4 }, -- 4 = CState_WaitingForNecklace + necklace quest accepted
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
		EventName = ">>> Next Quest: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2 > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2", Seconds = 20 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 4 }, -- 4 = CState_WaitingForNecklace + necklace quest accepted
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SQ04_BRINGNECKLACE"},
			MapTimerStop	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode_2"},
		},
	},








	--***************************************************************** SOLVE version 2 / b.) *************************************************************
  -- supplement for SOLVE version 2 / a
	OnOneTimeEvent ------------------------------------- Totems but not spiritists were unlocked in the past, and now the necklace quest become accepted
	{
		EventName = ">>> mv_P706_State_Spiritist = 4 (WaitingForNecklace) - SQ031_TALKTOSPIRITIST already solved <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 4 }, -- 4 = CState_WaitingForNecklace + necklace quest accepted
			QuestIsSolved	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "SQ04_BRINGNECKLACE"},
		},
	},
 
  
  
  
  
  




	--***************************************************************** SOLVE version 3 (SQ04_BRINGNECKLACE) *******************************************************	
	OnOneTimeEvent ------------------------------------- Unlocked spiritists (totems were unlocked earlier)
	{
		EventName = ">>> mv_P706_State_Spiritist = 5 && SQ031_TALKTOSPIRITIST is already solved <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 5 }, -- 5 = everything given out
			MapValueIsNotEqual	{Name = "mv_P706_SQ04_BRINGNECKLACE_completed_SolveMode", Value = 4}, -- to prevent mixing solve mode 3 and 4 events
			QuestIsSolved	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"}, -- earlier
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 704 , Amount = 1 }, -- Necklace made of claws
			QuestSetSolved {Player = "default", Quest = "SQ04_BRINGNECKLACE"},
			
			PlayerBuildingAdd	{BuildingId = 160}, -- Shrine of Wrath (Fighting pit + 400st) - Enables the production of Spiritists in the Fighting Pit
			PlayerBuildingUpgradeAdd	{UpgradeId = 39}, -- Shrine of Blood (from Shrine of Wrath, 500st): enables the prod of Spiritists and Berserkers in the Fighting Pit

			MapTimerStart	{Name = "mt_P706_SQ04_BRINGNECKLACE_completed_SolveMode_3"},			
			MapValueSet	{Name = "mv_P706_SQ04_BRINGNECKLACE_completed_SolveMode", Value = 3},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_SQ04_BRINGNECKLACE_completed_SolveMode_3 > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ04_BRINGNECKLACE_completed_SolveMode_3", Seconds = 5 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 5 }, -- 5 = everything given out
			QuestIsSolved	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"}, -- earlier
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ04_BRINGNECKLACE.XP },
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_SQ04_BRINGNECKLACE_completed_SolveMode_3 > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ04_BRINGNECKLACE_completed_SolveMode_3", Seconds = 10 },
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 5 }, -- 5 = everything given out
			QuestIsSolved	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"}, -- earlier
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			MapTimerStop	{Name = "mt_P706_SQ04_BRINGNECKLACE_completed_SolveMode_3"},
		},
	},	
		
	
	
	
	
	
	
	
	
	--***************************************************************** SOLVE version 4 ******************************************************************	
	OnOneTimeEvent ------------------------------------------- Unlocked both spiritists and totems at the same time
	{
		EventName = ">>> mv_P706_State_Spiritist = 5 (everything given out) <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_State_Spiritist", Value = 5 }, -- 5 = everything given out
			QuestIsNotSolved	{Player = "default", Quest = "SQ031_TALKTOSPIRITIST"}, -- so it happens at the same time
			MapValueIsNotEqual	{Name = "mv_P706_SQ04_BRINGNECKLACE_completed_SolveMode", Value = 3}, -- to prevent mixing solve mode 3 and 4 events
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 704 , Amount = 1 }, -- Necklace made of claws

			QuestSetSolved {Player = "default", Quest = "SQ031_TALKTOSPIRITIST"},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 35}, -- Zarach Temple (from Arena, 400st): enables the prod of Veterans and Totems (flying) in the Field Camp.
			PlayerBuildingAdd	{BuildingId = 160}, -- Shrine of Wrath (Fighting pit + 400st) - Enables the production of Spiritists in the Fighting Pit
			PlayerBuildingUpgradeAdd	{UpgradeId = 39}, -- Shrine of Blood (from Shrine of Wrath, 500st): enables the prod of Spiritists and Berserkers in the Fighting Pit

			MapTimerStart	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4"},
			MapValueSet	{Name = "mv_P706_SQ04_BRINGNECKLACE_completed_SolveMode", Value = 4},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4 > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4", Seconds = 5 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ031_TALKTOSPIRITIST.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Parent quest solve
	{
		EventName = ">>> Complete Quest: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4 > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4", Seconds = 10 },
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ03_CREATEFLYING"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Next quest solve
	{
		EventName = ">>> Complete Quest: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4 > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4", Seconds = 15 },
		},
		Actions =
		{
			QuestSetSolved {Player = "default", Quest = "SQ04_BRINGNECKLACE"},
		},
	},

	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4 > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4", Seconds = 20 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ04_BRINGNECKLACE.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4 > 25 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4", Seconds = 25 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
			MapTimerStop	{Name = "mt_P706_SQ031_TALKTOSPIRITIST_completed_SolveMode4"},
		},
	},		
};
