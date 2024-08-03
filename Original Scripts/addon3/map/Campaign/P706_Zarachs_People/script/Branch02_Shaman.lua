-- ***************************************************************************
-- ** Handling Quest Branch including                                       **
-- ** Starting CS2_TOSHAMAN                                                 **
-- ** MQ02_MASKPARTS                                                        **
-- ** MQ03_THEBEAST, including MQ031_SUMMON, MQ032_KILL, and MQ033_HANDIN   **
-- ** SQ02_CREATELENYA                                                      **
-- ***************************************************************************


local otTheStatue = "TheStatue";
local StatueRange = 15;

local ftBeast = "TheBeast";
local BearMaskID = 3001;
local otBeastSpawnPoint = "pos_BeastSpawnPoint";

local ftExitGuardBoss = "ExitGuardBoss";
local ExitGuardRange = 20;




State --**************************************************** Initial State
{
	StateName = "EXITGUARDS_ON",


--************************************************************************************************************** Do not let the avatar escape
	OnOneTimeEvent ------------------------------------------- Disable the map travel
	{
		EventName = " Disabling the map travel... <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P706_CS2_ToShaman_Ended"},		
		},
		Actions =
		{
			PlayerTravelDisable {},			
		},
	},

	OnOneTimeRepeatEvent ------------------------------------------- Can't teleport out from the highland
	{
		EventName = ">>> Just used a Journey Stone to leave the highland. Teleporting back. <<<",
		Name = "TELEPORTED_OUT_ILLEGALLY",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_EscapedFromShamanHighland"},
			FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_TrollHunter", Range = 10},

			MapFlagIsTrue {Name="mf_P706_CS2_ToShaman_Ended"}, 
			QuestIsNotSolved	{Player = "default", Quest = "MQ033_HANDIN"},
		},
		Actions =
		{
			FigureAbilityAdd	{Tag = ftAvatar, AbilityId = Ability.Immortal},

			MapFlagSetTrue	{Name = "mf_P706_EscapedFromShamanHighland"},
			MapTimerStart	{Name = "mt_P706_EscapedFromShamanHighland"},
			
			EventReEnable	{Name = "TELEPORT_BACK"},
		},
	},

	OnOneTimeRepeatEvent ------------------------------------------- Time to teleport back
	{
		EventName = ">>> Time to teleport back <<<",
		Name = "TELEPORT_BACK",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_EscapedFromShamanHighland", Seconds = 1},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = "CS2_ToShaman_Pos2"},
			FigureLookAtDirection {Tag = ftAvatar, Direction = 180},
			
			FigureAbilityRemove	{Tag = ftAvatar, AbilityId = Ability.Immortal},

			EventReEnable	{Name = "TELEPORT_BACK_OUTCRY"},
		},
	},

	OnOneTimeRepeatEvent ------------------------------------------- Outcry and finish
	{
		EventName = ">>> Outcry and finish teleport back sequence <<<",
		Name = "TELEPORT_BACK_OUTCRY",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_EscapedFromShamanHighland", Seconds = 2},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryShamanNoTeleport", Tag = "Shaman"},
			MapFlagSetFalse	{Name = "mf_P706_EscapedFromShamanHighland"},
			MapTimerStop	{Name = "mt_P706_EscapedFromShamanHighland"},

			EventReEnable	{Name = "TELEPORTED_OUT_ILLEGALLY"},
		},
	},



--************************************************************************************************************** MQ02_MASKPARTS
	OnOneTimeEvent ------------------------------------------- Initializing MQ02_MASKPARTS
	{
		EventName = ">>> mf_P706_CS2_ToShaman_Ended <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name="mf_P706_CS2_ToShaman_Ended"},		
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_ShamanExitClosed"},
			QuestSetActive	{Player = "default", Quest = "MQ02_MASKPARTS"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Enable DLG when everything collected
	{
		EventName = ">>> enable DLG when all the maskparts are collected <<<",
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 705, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 706, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 707, Amount = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Shaman"},			
		},
	},

	OnOneTimeEvent ------------------------------------------- MQ02_MASKPARTS completed
	{
		EventName = ">>> MQ02_MASKPARTS completed: mt_P706_MQ02_MASKPARTS_Solved > 0.1 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ02_MASKPARTS_Solved", Seconds = 0.1},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},			
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P706_MQ02_MASKPARTS_Solved"}, 
			MapTimerStart	{Name = "mt_P706_MQ02_MASKPARTS_Solved2"}, 			
		},
	},

	OnOneTimeEvent ------------------------------------------- Set solved
	{
		EventName = ">>> AutoSave: mt_P706_MQ02_MASKPARTS_Solved2 > 2 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ02_MASKPARTS_Solved2", Seconds = 2 },
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ02_MASKPARTS"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- MQ02_MASKPARTS XP Reward
	{
		EventName = ">>> MQ02_MASKPARTS XP reward: mt_P706_MQ02_MASKPARTS_Solved2 > 7 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ02_MASKPARTS_Solved2", Seconds = 7},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ02_MASKPARTS.XP },			
		},
	},

	OnOneTimeEvent ------------------------------------------- MQ02_MASKPARTS Gold Reward
	{
		EventName = ">>> MQ02_MASKPARTS Gold reward: mt_P706_MQ02_MASKPARTS_Solved2 > 12 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ02_MASKPARTS_Solved2", Seconds = 12},
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.MQ02_MASKPARTS.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.MQ02_MASKPARTS.Gold },	
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.MQ02_MASKPARTS.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.MQ02_MASKPARTS.Gold},			
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ02_MASKPARTS_Solved2 > 17 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ02_MASKPARTS_Solved2", Seconds = 17 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},

	OnOneTimeEvent ------------------------------------------- Enable dlg again
	{
		EventName = ">>> AutoSave: mt_P706_MQ02_MASKPARTS_Solved2 > 22 sec <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ02_MASKPARTS_Solved2", Seconds = 22 },
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Shaman"},
			MapTimerStop	{Name = "mt_P706_MQ02_MASKPARTS_Solved2"},
		},
	},


--************************************************************************************************************** MQ031_SUMMON
	OnOneTimeEvent ------------------------------------------- Summoned
	{
		EventName = ">>> Bear mask equipped near the Statue of Grogo <<<",
		Conditions = 
		{
			AvatarHasItemEquipped	{Player = "default", ItemId = BearMaskID},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = otTheStatue, Range = StatueRange},		
		},
		Actions =
		{						
			SoundGlobalPlayOnce	{File = "01_ambient/amb_windgust_creepy1"},

			MapTimerStart	{Name = "mt_MQ031_SUMMON_completed"},
		},
	},

--	OnOneTimeEvent ------------------------------------------- Ambient sound: windgust
--	{
--		EventName = ">>> mt_MQ031_SUMMON_completed > 3 - Ambient sound: windgust <<<",
--		Conditions = 
--		{
--			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 3 },
--		},
--		Actions =
--		{
--			SoundGlobalPlayOnceAddon3	{File = "01_ambient/amb_windgust_creepy1"},
--
----			SoundGlobalPlayOnceAddon3	{File = "02_units/creep_dragon_ur_idle1"},
----			SoundAmbientPlayOnce	{File = "01_ambient/amb_windgust_creepy1", X = 558, Y = 206,  Z = 0, MaxRange = 150, FallOffRange = default}, -- YZ change?
----			SoundGlobalPlayOnceAddon3 {File = "speech/P701_CUT_ARMYWITHOUT_T004_ALARM"},
--
--		},
--	},	
		
	OnOneTimeEvent ------------------------------------------- Ambient sound: beast roar
	{
		EventName = ">>> mt_MQ031_SUMMON_completed > 5 - Ambient sound: beast roar <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 5 },
		},
		Actions =
		{
--			SoundAmbientPlayOnce	{File = "02_units/creep_dragon_ur_idle1", X = 558, Y = 206,  Z = 0, MaxRange = 50, FallOffRange = default}, -- YZ change?
			SoundGlobalPlayOnceAddon3	{File = "02_units/creep_dragon_ur_idle1"},
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- Quest complete
	{
		EventName = ">>> mt_MQ031_SUMMON_completed > 8 - Quest complete <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 8 },
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ031_SUMMON"},

			SoundGlobalPlayOnceAddon3	{File = "02_units/creep_dragon_ur_idle1" },
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- Bear spawns and starts running, outcry, ambient again
	{
		EventName = ">>> mt_MQ031_SUMMON_completed > 10 - Bear spawns and starts running, outcry <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 10 },
		},
		Actions =
		{

--			FigureNpcSpawnToEntity	{Tag = "TheBeast", Level = 11, UnitId = 2022, TargetTag = otBeastSpawnPoint, Team = "tm_Creep"},
--			FigureRespawnToEntity	{Tag = ftBeast, TargetTag = otBeastSpawnPoint}, -- moved to difficulty.lua
			FigureLootItemGenericAdd	{Tag = ftBeast, DropChance = 100, Level = 17, Skill = 0}, -- TODO: test
			FigureRunToEntity {Tag = ftBeast, TargetTag = otTheStatue},

			UIBossfightPanelShow { UnitTag1 = ftBeast, UnitTag2 = "", PortraitImage = "boss_P706_the_beast", DisplayName = Boss_P706_TheBeast},
			
			FigureOutcryAlert	{TextTag = "cryBearSpotted", Tag = ftCompCraig, TargetTag = ftBeast},
		},
	},		
	
	OnOneTimeEvent ------------------------------------------- Next quest: MQ032_KILL
	{
		EventName = ">>> mt_MQ031_SUMMON_completed > 15 - Next quest: MQ032_KILL <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_MQ031_SUMMON_completed", Seconds = 15 },
		},
		Actions =
		{		
			QuestSetActive	{Player = "default", Quest = "MQ032_KILL"},

			MapTimerStop	{Name = "mt_MQ031_SUMMON_completed"},			
		},
	},
		
	
	
	
	
	
	
	
	
	

--************************************************************************************************************** MQ032_KILL	
	OnOneTimeEvent ------------------------------------------- Bear Died -> Completed
	{
		EventName = ">>> Bear died <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = ftBeast},
			QuestIsActive	{Player = "default", Quest = "MQ032_KILL"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_MQ032_KILL_completed"},
			QuestSetSolved	{Player = "default", Quest = "MQ032_KILL"},
		},
	},

	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ032_KILL_completed > 5 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ032_KILL_completed", Seconds = 5 },
		},
		Actions =
		{
			UIBossfightPanelHide {},

			AvatarXPGive	{Player = "default", Amount = Reward.MQ032_KILL.XP },
		},
	},

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ032_KILL_completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ032_KILL_completed", Seconds = 10 },
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
		EventName = ">>> Next Quest: mt_P706_MQ032_KILL_completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ032_KILL_completed", Seconds = 15 },
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Shaman"},		

			QuestSetActive	{Player = "default", Quest = "MQ033_HANDIN"},			
			MapTimerStop	{Name = "mt_P706_MQ032_KILL_completed"},
		},
	},


--************************************************************************************************************** MQ033_HANDIN

	OnOneTimeEvent ------------------------------------------- Hand-in dialogue ended (Shaman)
	{
		EventName = ">>> Hand-in dialogue ended (Shaman) <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_MQ033_HANDIN_Solved"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_MQ033_HANDIN_Solved"},		
		},
	},

	OnOneTimeEvent ------------------------------------------- Set solved
	{
		EventName = ">>> Complete Quest: mt_P706_MQ033_HANDIN_Solved > 3 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ033_HANDIN_Solved", Seconds = 3 },
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ033_HANDIN"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Gold reward
	{
		EventName = ">>> Gold reward: mt_P706_MQ033_HANDIN_Solved > 8 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ033_HANDIN_Solved", Seconds = 8 },
		},
		Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.MQ033_HANDIN.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.MQ033_HANDIN.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.MQ033_HANDIN.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.MQ033_HANDIN.Gold},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Parent quest complete (MQ03_THEBEAST)
	{
		EventName = ">>> Parent Quest Complete: mt_P706_MQ033_HANDIN_Solved > 13 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ033_HANDIN_Solved", Seconds = 13 },
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ03_THEBEAST"},
		},
	},	

	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ033_HANDIN_Solved > 23 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ033_HANDIN_Solved", Seconds = 23 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},






	
--************************************************************************************************************** Exit Guards ON and OFF
	OnOneTimeEvent ------------------------------------------- Exit first approached
	{
		EventName = ">>> Exit approached first time <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = ExitGuardRange, TargetTag = ftExitGuardBoss},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryExitCaveClosed", Tag = ftExitGuardBoss, TargetTag = ftAvatar},
			MapTimerStart	{Name = "mt_P706_cryExitCaveClosed"},
		},
	},	

	OnEvent ------------------------------------------- Exit approached again
	{
		EventName = ">>> Exit approached again <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_cryExitCaveClosed", Seconds = 20 },			
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = ExitGuardRange, TargetTag = ftExitGuardBoss},
			},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryExitCaveClosed", Tag = ftExitGuardBoss, TargetTag = ftAvatar},
			MapTimerStart	{Name = "mt_P706_cryExitCaveClosed"},
		},
	},	

	OnOneTimeEvent ------------------------------------------- MQ033_HANDIN completed
	{
		EventName = ">>> MQ033_HANDIN completed <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ033_HANDIN_Solved", Seconds = 26 },
		},
		Actions =
		{
			PlayerTravelEnable	{},
			
			MapFlagSetFalse	{Name = "mf_P706_ShamanExitClosed"},
			MapTimerStop	{Name = "mt_P706_MQ033_HANDIN_Solved"},			
			MapTimerStop	{Name = "mt_P706_cryExitCaveClosed"},			
		},
		GotoState = "EXITGUARDS_OFF",
	},
};



State --**************************************************** Exit Guards OFF
{
	StateName = "EXITGUARDS_OFF",
};