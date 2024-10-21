-- ***************************************************************************
-- ** Handling Quest Branch including                                       **
-- ** MQ01_FINDTHECLANS                                                     **
-- ** Fight scene                                                           **
-- ** MQ04_DEFEND                                                           **
-- ** +Branch02_Shaman.lua                                                  **
-- ***************************************************************************


local ftFigureClansBoss = "ClansBoss";
local BossDistanceToApproach = 35;

local btClansHQ = "ClansHQ";
local distSurroundingOutcries = 40;

local SecondsBeforeSurroundingOutcries = 40;
local SecondsBeforeCorpseOutcries = 70;
local SecondsBeforeImmortalRemove = 70;
local SecondsBeforeShaikanWaves = 120;
local SecondsBeforeNL1Waves = 300;
local SecondsToProtectTheBase = 1300;




State --*********************************************************************************************************** INIT State
{
	StateName = "INIT",


	--*********************************************************************************************************** MQ01_FINDTHECLANS
	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest ACT_1 started <<<",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ACT_1"},
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "MQ01_FINDTHECLANS"},			
		},
	},






	OnOneTimeEvent ----------------------------------------- Fight cutscene ended
	{
		EventName = ">>> CS2a_OrcHeroDie ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P706_CS2a_OrcHeroDie_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_MQ01_FINDTHECLANS_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ01_FINDTHECLANS_completed", Seconds = 5},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ01_FINDTHECLANS"},
		},
	},	
		
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> mt_P706_MQ01_FINDTHECLANS_completed >  5 - Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ01_FINDTHECLANS_completed", Seconds = 5},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ01_FINDTHECLANS"},
		},
	},			
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> mt_P706_MQ01_FINDTHECLANS_completed > 10 - XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ01_FINDTHECLANS_completed", Seconds = 10 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ01_FINDTHECLANS.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> mt_P706_MQ01_FINDTHECLANS_completed > 15 - AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ01_FINDTHECLANS_completed", Seconds = 15 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Next quest: MQ04_DEFEND
	{
		EventName = ">>> mt_P706_MQ01_FINDTHECLANS_completed > 20 - Next Quest <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ01_FINDTHECLANS_completed", Seconds = 20 }, -- MQ05_RESURRECTORC starts at 30
		},
		Actions =
		{
			QuestSetActive {Player = "default", Quest = "MQ04_DEFEND"},

			------------------------------------------------------------------------------------- Enable buildings and upgrades
			-- HQ
			PlayerBuildingAdd	{BuildingId = 163}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 33}, -- HQ Barbarian Upgrd (400st): enables the construction of advanced Barbarian buildings and enables you to raise the number of slots for military units.
			PlayerBuildingUpgradeAdd	{UpgradeId = 29}, -- HQ Orc Upgrd (400st): enables the constr of adv Orc buildings and enables you to raise the no of slots for military units.
			PlayerBuildingUpgradeAdd	{UpgradeId = 31}, -- HQ Troll Upgrd (400st): enables the const of adv troll buildings and enables you to raise the slots for military units

			-- Resource Buildings:
			PlayerBuildingAdd	{BuildingId = 149}, -- Stonemason (50st)
			PlayerBuildingAdd	{BuildingId = 150}, -- Smeltery (50st) - for silver
			PlayerBuildingAdd	{BuildingId = 152}, -- Alchemyst (50st) - for lenya
			
			-- Field Camp (HQ Orc upgr + 200st) - Produces Archers, Shamans, Veterans and Totems
			PlayerBuildingAdd	{BuildingId = 153}, 
			
			-- Tower (190st + 60si) - Defense building
			PlayerBuildingAdd	{BuildingId = 154}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 19}, -- Tower Barbarian Upgrd (80st): enemies attaching the tower in melee suffer higher dmg
			PlayerBuildingUpgradeAdd	{UpgradeId = 21}, -- Tower Orc Upgrd (80L): fire projectiles cause more dmg
			PlayerBuildingUpgradeAdd	{UpgradeId = 23}, -- Tower Troll Upgrd (80st): lowers the armor of enemies, as long as they are in the vicinity of the tower.
			
			-- Fighting Pit (HQ Barbr upg + 200st) - Produces Axemen and if enabled: Spiritists and Berserks
			PlayerBuildingAdd	{BuildingId = 155}, 
			
			-- Altar of Life (1000st)
			PlayerBuildingAdd	{BuildingId = 156}, 
			
			-- Troll Lair (HQ Troll upgr + 200st) - Produces Hurlers, Devastators and Fire Catapults
			PlayerBuildingAdd	{BuildingId = 157}, 
			
			-- Arena (Field Camp + 400st) - Enables the production of Veterans in the field camp
			PlayerBuildingAdd	{BuildingId = 158}, 
--			PlayerBuildingUpgradeAdd	{UpgradeId = 35}, -- Zarach Temple (from Arena, 400st): enables the prod of Veterans and Totems (flying) in the Field Camp.
			
			-- Mace Carver (Troll lair + 400st) - Enables the production of Devastators in the Troll Lair. Can be upgraded to a Siege Workshop.
			PlayerBuildingAdd	{BuildingId = 159}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 37}, -- Siege Workshop (from Mace Carver, 500st): enables the prod of Devastators and Fire Catapults in the Troll Lair.
			
			-- Shrine of Wrath (Fighting pit + 400st) - Enables the production of Spiritists in the Fighting Pit
--			PlayerBuildingAdd	{BuildingId = 160}, 
--			PlayerBuildingUpgradeAdd	{UpgradeId = 39}, -- Shrine of Blood (from Shrine of Wrath, 500st): enables the prod of Spiritists and Berserkers in the Fighting Pit
			
			-- Bowyer (100st) - Enables the production of Archers in the HQ. Can be upgraded to Armory.
			PlayerBuildingAdd	{BuildingId = 161}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 27}, -- Armory (from Bowyer, 200st): enables the prod of Archers and Mercenaries in the HQ
			
			-- Farm (50st) - can be upgraded to Pig Farm.
			PlayerBuildingAdd	{BuildingId = 162}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 25}, -- Pig Farm (from Farm, 100st): more slots
			------------------------------------------------------------------------------------- Enable buildings and upgrades ends here
			
			PlayerResourceStoneGive	 {Player = "default", Amount = 250 },
			PlayerResourceSilverGive {Player = "default", Amount = 250 },
												
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Clans"},
			
			MapTimerStart {Name = "mt_ProtectTheClansBase"},
		},
		GotoState = "DEFEND",
	},
};




State --****************************************************************** Defend the base phase MQ04_DEFEND, 1816
{
	StateName = "DEFEND",

	OnOneTimeEvent ----------------------------------------- Outcries: introduce the surrounding
	{
		EventName = ">>> Outcries: introduce the surrounding <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_ProtectTheClansBase", Seconds = SecondsBeforeSurroundingOutcries},
			FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = btClansHQ, Range = distSurroundingOutcries},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_SurroundingOutcriesInProgress"},
			MapTimerStart	{Name = "mt_P706_SurroundingOutcriesInProgress"},
			
			FigureOutcry	{TextTag = "crySurrounding1", Tag = ftFigureClansBoss},
			FigureOutcry	{TextTag = "crySurrounding2", Tag = ftFigureClansBoss},
			FigureOutcry	{TextTag = "crySurrounding3", Tag = ftFigureClansBoss},
			FigureOutcry	{TextTag = "crySurrounding4", Tag = ftFigureClansBoss},
			FigureOutcry	{TextTag = "crySurrounding5", Tag = ftFigureClansBoss},
			FigureOutcry	{TextTag = "crySurrounding6", Tag = ftFigureClansBoss},
		},
	},

	OnOneTimeEvent ----------------------------------------- Surrounding outcries ended... aproximately
	{
		EventName = ">>> Surrounding outcries ended... aproximately <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P706_SurroundingOutcriesInProgress", Seconds = 90},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_SurroundingOutcriesInProgress"},
			MapTimerStop	{Name = "mt_P706_SurroundingOutcriesInProgress"},
		},
	},

	OnOneTimeEvent ----------------------------------------- Immortal ability removed from clans boss
	{
		EventName = ">>> Immortal ability removed from Clan's Boss <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_ProtectTheClansBase", Seconds = SecondsBeforeImmortalRemove},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = ftFigureClansBoss, AbilityId = Ability.Immortal}, 	
		},
	},

	OnOneTimeEvent ----------------------------------------- Start the shaikan waves
	{
		EventName = ">>> Starting Shaikan waves <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_ProtectTheClansBase", Seconds = SecondsBeforeShaikanWaves},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Spawner_Shaikan1_Enabled"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Start the NL waves
	{
		EventName = ">>> Starting NL1 waves <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_ProtectTheClansBase", Seconds = SecondsBeforeNL1Waves},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_Enabled"},
		},
	},
	
	OnOneTimeEvent -------------------------------------------- Defend completed 
	{
		EventName = ">>> Defend completed: survived long enough (later: or strenght increased) <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_ProtectTheClansBase", Seconds = SecondsToProtectTheBase},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ04_DEFEND"},

			MapTimerStop	{Name = "mt_ProtectTheClansBase"},			
			
			MapTimerStart	{Name = "mt_P706_MQ04_DEFEND_completed"},
		},
	},

	OnOneTimeEvent -------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ04_DEFEND_completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ04_DEFEND_completed", Seconds = 5 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ04_DEFEND.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ04_DEFEND_completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ04_DEFEND_completed", Seconds = 10 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},	

	OnOneTimeEvent ----------------------------------------- Defend Failed
	{
		EventName = ">>> Defend failed: HQ destroyed <<<",
		Conditions = 
		{
			BuildingIsDead	{Tag = btClansHQ},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = btClansHQ, LocaTag = "IGMenuGameOver_Title"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Act 1 ended, no more things to do here
	{
		EventName = ">>> Act 1 ended, no more things to do here <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ACT_1"},
		},
		Actions =
		{
		},
		GotoState = "ENDED",
	},	
};



State --****************************************************************** Ended
{
	StateName = "ENDED",
};