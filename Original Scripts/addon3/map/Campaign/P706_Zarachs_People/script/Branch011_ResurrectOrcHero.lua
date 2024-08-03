-- ***************************************************************************
-- ** Handling Quest Branch including                                       **
-- ** CS2a_ORCHERODIE                                                       **
-- ** MQ05_RESURRECTORC                                                     **
-- ***************************************************************************

local secWaitBeforeResurrectQuest = 30; -- MQ04_DEFEND starts at 20

local ftHeroOrc_NPC_version = "OrcHero"; 
local ftHeroOrc_Corpse_version = "OrcHeroCorpse";
local ftHeroOrc_Inventory_version = 702;

local rangeFromCorpseToOutcry = 15;

local LenyaNeededToResurrect = 0; -- warning: this number is referred to in the localized quest texts
--local LenyaNeededToResurrect = 250; -- warning: this number is referred to in the localized quest texts
local Pos_RespawnHero = "Pos_OrcHeroResurrection";



State --************************************************* Death of the Orc Hero
{
	StateName = "DEAD",
	
	----------------------------------------------------------------------- just died, cs ended, lets wait
	OnOneTimeEvent
	{
		EventName = ">>> Orc Hero died right now, wait a bit before proceeding <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P706_CS2a_OrcHeroDie_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_OrcHero"},
		},
	},


	---------------------------------------------------------------------- activate MQ05_RESURRECTORC
	OnOneTimeEvent
	{
		EventName = ">>> secWaitBeforeResurrectQuest passed, activate MQ05_RESURRECTORC <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_OrcHero", Seconds = secWaitBeforeResurrectQuest},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "MQ05_RESURRECTORC"},
			MapTimerStart	{Name = "mt_P706_OrcHero"},
		},
	},




	----------------------------------------------------------------------- outcry he felt it, when approached
	OnOneTimeEvent
	{
		EventName = ">>> Corpse of the Orc Hero approached, outcries: he felt it <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = rangeFromCorpseToOutcry, TargetTag = ftHeroOrc_Corpse_version},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryHeFelt1", Tag = ftAvatar},
			FigureOutcry	{TextTag = "cryHeFelt2", Tag = ftHeroCaine},
		},
	},

	-- Corpse: missing from inventory (Altar: doesn't matter, Lenya: doesn't matter)
	OnEvent -- Timer for cryOrcHeroLetsCarry
	{
		EventName = ">>> cryOrcHeroLetsCarry    mt_P706_OrcHero <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_OrcHero", Seconds = 120},
			MapFlagIsFalse	{Name = "mf_P706_SurroundingOutcriesInProgress"},
			AvatarHasNotItemMisc	{Player = "default", ItemId = ftHeroOrc_Inventory_version , Amount = 1},
--			OR
--			{
--				PlayerHasNotBuilding	{Player = "default", BuildingId = 156, Amount = 1, OnlyCompleted = true},
--				PlayerHasNotResourceLenya	{Player = "default", Amount = LenyaNeededToResurrect},			
--			},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryOrcHeroCarry", Tag = ftAvatar, TargetTag = ftHeroOrc_Corpse_version},
			EntityTimerStop	{Name = "mt_P706_OrcHero"},
			MapTimerStart	{Name = "mt_P706_OrcHero"},
		},
	},	
	
	-- Corpse: OK, Altar: missing (Lenya: doesn't matter)
	OnOneTimeEvent
	{
		EventName = ">>> Corpse is in the inventory but no Altar of Life <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = ftHeroOrc_Inventory_version , Amount = 1},
			PlayerHasNotBuilding	{Player = "default", BuildingId = 156, Amount = 1, OnlyCompleted = true},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryOrcHeroWeCouldResurrectHim", Tag = ftAvatar},
			EntityTimerStop	{Name = "mt_P706_OrcHero"},
			MapTimerStart	{Name = "mt_P706_OrcHero"},						
		},
	},

	OnEvent -- Timer for cryOrcHeroWeCouldResurrectHim
	{
		EventName = ">>> cryOrcHeroWeCouldResurrectHim    mt_P706_OrcHero <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_OrcHero", Seconds = 120},
			AvatarHasItemMisc	{Player = "default", ItemId = ftHeroOrc_Inventory_version , Amount = 1},
			PlayerHasNotBuilding	{Player = "default", BuildingId = 156, Amount = 1, OnlyCompleted = true},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryOrcHeroWeCouldResurrectHim", Tag = ftHeroCaine},
			EntityTimerStop	{Name = "mt_P706_OrcHero"},
			MapTimerStart	{Name = "mt_P706_OrcHero"},
		},
	},



	-- Corpse: OK, Altar: OK, Lenya: missing
	OnOneTimeEvent
	{
		EventName = ">>> Altar of Life built + there is NOT enough lenya <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = ftHeroOrc_Inventory_version , Amount = 1},
			PlayerHasBuilding	{Player = "default", BuildingId = 156, Amount = 1, OnlyCompleted = true},
			PlayerHasNotResourceLenya	{Player = "default", Amount = LenyaNeededToResurrect},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryOrcHeroWishWeHadLenya", Tag = ftHeroCaine},
			EntityTimerStop	{Name = "mt_P706_OrcHero"},
			MapTimerStart	{Name = "mt_P706_OrcHero"},			
		},
	},
	
	OnEvent -- Timer for cryOrcHeroWeCouldResurrectHim
	{
		EventName = ">>> cryOrcHeroWishWeHadLenya    mt_P706_OrcHero <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_OrcHero", Seconds = 120},
			AvatarHasItemMisc	{Player = "default", ItemId = ftHeroOrc_Inventory_version , Amount = 1},
			PlayerHasBuilding	{Player = "default", BuildingId = 156, Amount = 1, OnlyCompleted = true},
			PlayerHasNotResourceLenya	{Player = "default", Amount = LenyaNeededToResurrect},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryOrcHeroWishWeHadLenya", Tag = ftHeroCaine},
			EntityTimerStop	{Name = "mt_P706_OrcHero"},
			MapTimerStart	{Name = "mt_P706_OrcHero"},
		},
	},




	-- Corpse: OK, Altar: OK, Lenya: OK
	OnOneTimeEvent
	{
		EventName = ">>> Altar of Life built + there is enough lenya <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = ftHeroOrc_Inventory_version , Amount = 1},
			PlayerHasBuilding	{Player = "default", BuildingId = 156, Amount = 1, OnlyCompleted = true},
			PlayerHasResourceLenya	{Player = "default", Amount = LenyaNeededToResurrect},
		},
		Actions =
		{
			FigureRespawnToEntity	{Tag = ftHeroOrc_NPC_version, TargetTag = Pos_RespawnHero},
			PlayerKitTransfer	{Player = "pl_Clans", PlayerKit = "pk_OrcHero"},
			
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = ftHeroOrc_Inventory_version, Amount = 1},

			FigureOutcryAlert	{TextTag = "cryOrcHeroTalkToHim", Tag = ftHeroCaine, TargetTag = ftHeroOrc_NPC_version},
			MapTimerStart	{Name = "mt_P706_TalkToTheOrcHero"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Enable the dialogue with some delay to avoid problems <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_TalkToTheOrcHero", Seconds = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "OrcHero"},
		},
		GotoState = "ALIVE",
	},	
};




State --****************************************** From the moment on when the Orc Hero becomes resurrected
{
	StateName = "ALIVE",

	-------------------------------------------------------------- Warning to talk to him
	OnEvent -- Timer for cryOrcHeroWeCouldResurrectHim
	{
		EventName = ">>> cryOrcHeroTalkToHim - mt_P706_TalkToTheOrcHero > 90 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_TalkToTheOrcHero", Seconds = 90},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryOrcHeroTalkToHim", Tag = ftHeroCaine, TargetTag = ftHeroOrc_NPC_version},
			MapTimerStart	{Name = "mt_P706_TalkToTheOrcHero"},
		},
	},	

	-------------------------------------------------------------- Joined
	OnOneTimeEvent
	{
		EventName = ">>> mf_P706_OrcHero_Joining <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P706_OrcHero_Joining"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_TalkToTheOrcHero"},
			
			FigureVanish	{Tag = ftHeroOrc_NPC_version},

			PlayerHeroAdd { HeroId = 250 },
			FigureHeroSpawnToEntity {Tag = "HeroOrc", TargetTag = "pl_HumanAvatar", Direction = 135},

			QuestSetSolved {Player = "default", Quest = "MQ05_RESURRECTORC"},
			MapTimerStart	{Name = "mt_P706_MQ05_RESURRECTORC_completed"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ05_RESURRECTORC_completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ05_RESURRECTORC_completed", Seconds = 5 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ05_RESURRECTORC.XP },
		},
	},

	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward: mt_P706_MQ05_RESURRECTORC_completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ05_RESURRECTORC_completed", Seconds = 10 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.MQ05_RESURRECTORC.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.MQ05_RESURRECTORC.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.MQ05_RESURRECTORC.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.MQ05_RESURRECTORC.Gold},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ05_RESURRECTORC_completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ05_RESURRECTORC_completed", Seconds = 15 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},
};


