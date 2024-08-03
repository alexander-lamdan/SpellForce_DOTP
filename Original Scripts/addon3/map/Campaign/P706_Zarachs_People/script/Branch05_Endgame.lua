-- *********************************************************************************
-- ** Handling Quest Branch including                                             **
-- ** MQ11_FINDTHESOURCE                                                          **
-- ** MQ12_ELIMINATETHESOURCE including MQ121_DESTROYBUILDINGS, MQ122_KILLTHEBOSS **
-- ** communicates with the bossfight																							**
-- ** leads to CS7_OUTRO                                                          **
-- *********************************************************************************


local posEaglesNest = "Pos_EaglesNest";
local distApproachDistance_EaglesNest = 50;
local distApproachDistance_Boss = 25;

local btBuildingEaglesNest01 = "BuildingEaglesNest01";
local btBuildingEaglesNest02 = "BuildingEaglesNest02";
local btBuildingEaglesNest03 = "BuildingEaglesNest03";

local ftBossWithBreathFire = "BossWithBreathFire";
local ftBossWithoutBreathFire = "BossWithoutBreathFire";

local distBoss2ShamanBig = 40;
local distBoss2ShamanSmall = 20;
local otResurrectedDragon = "Pos_ResurrectedDragon";
local posShaman = "pos_ShamanEndGame";






State --******************** STARTER STATE to conserve resources, switches to another state when started
{
	StateName = "STARTER",

--	OnOneTimeEvent
--	{
--		EventName = ">>> LEVEL EASY: vanish tower guards  <<<",
--		Conditions = 
--		{
--				GameIsUnBlocked{},
--			  GameDifficulty {Value = Diff.Easy},									
--		},
--		Actions =
--		{
----			FigureVanish	{Tag = "TowerProtector_1_01"},
----			FigureVanish	{Tag = "TowerProtector_1_02"},
----			FigureVanish	{Tag = "TowerProtector_1_03"},
--			FigureVanish	{Tag = "TowerProtector_1_04"},
--			FigureVanish	{Tag = "TowerProtector_1_05"},
--			FigureVanish	{Tag = "TowerProtector_1_06"},
--
----			FigureVanish	{Tag = "TowerProtector_2_01"},
----			FigureVanish	{Tag = "TowerProtector_2_02"},
--			FigureVanish	{Tag = "TowerProtector_2_03"},
--			FigureVanish	{Tag = "TowerProtector_2_04"},
--
----			FigureVanish	{Tag = "TowerProtector_3_01"},
----			FigureVanish	{Tag = "TowerProtector_3_02"},
--			FigureVanish	{Tag = "TowerProtector_3_03"},
--			FigureVanish	{Tag = "TowerProtector_3_04"},
--
----			FigureVanish	{Tag = "TowerProtector_4_01"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_02"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_03"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_04"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_05"}, -- roaming		
--		},
--	},
--
--	OnOneTimeEvent
--	{
--		EventName = ">>> LEVEL NORMAL: vanish tower guards  <<<",
--		Conditions = 
--		{
--				GameIsUnBlocked{},
--			  GameDifficulty {Value = Diff.Normal},									
--		},
--		Actions =
--		{
----			FigureVanish	{Tag = "TowerProtector_1_01"},
----			FigureVanish	{Tag = "TowerProtector_1_02"},
----			FigureVanish	{Tag = "TowerProtector_1_03"},
----			FigureVanish	{Tag = "TowerProtector_1_04"},
--			FigureVanish	{Tag = "TowerProtector_1_05"},
--			FigureVanish	{Tag = "TowerProtector_1_06"},
--
----			FigureVanish	{Tag = "TowerProtector_2_01"},
----			FigureVanish	{Tag = "TowerProtector_2_02"},
----			FigureVanish	{Tag = "TowerProtector_2_03"},
--			FigureVanish	{Tag = "TowerProtector_2_04"},
--
----			FigureVanish	{Tag = "TowerProtector_3_01"},
----			FigureVanish	{Tag = "TowerProtector_3_02"},
----			FigureVanish	{Tag = "TowerProtector_3_03"},
--			FigureVanish	{Tag = "TowerProtector_3_04"},
--
----			FigureVanish	{Tag = "TowerProtector_4_01"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_02"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_03"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_04"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_05"}, -- roaming		
--		},
--	},
--	
--		OnOneTimeEvent
--	{
--		EventName = ">>> LEVEL HARD: vanish tower guards  <<<",
--		Conditions = 
--		{
--				GameIsUnBlocked{},
--			  GameDifficulty {Value = Diff.Hard},									
--		},
--		Actions =
--		{
----			FigureVanish	{Tag = "TowerProtector_1_01"},
----			FigureVanish	{Tag = "TowerProtector_1_02"},
----			FigureVanish	{Tag = "TowerProtector_1_03"},
----			FigureVanish	{Tag = "TowerProtector_1_04"},
----			FigureVanish	{Tag = "TowerProtector_1_05"},
--			FigureVanish	{Tag = "TowerProtector_1_06"},
--
----			FigureVanish	{Tag = "TowerProtector_2_01"},
----			FigureVanish	{Tag = "TowerProtector_2_02"},
----			FigureVanish	{Tag = "TowerProtector_2_03"},
----			FigureVanish	{Tag = "TowerProtector_2_04"},
--
----			FigureVanish	{Tag = "TowerProtector_3_01"},
----			FigureVanish	{Tag = "TowerProtector_3_02"},
----			FigureVanish	{Tag = "TowerProtector_3_03"},
----			FigureVanish	{Tag = "TowerProtector_3_04"},
--
----			FigureVanish	{Tag = "TowerProtector_4_01"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_02"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_03"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_04"}, -- roaming
--			FigureVanish	{Tag = "TowerProtector_4_05"}, -- roaming		
--		},
--	},
--
--	OnOneTimeEvent
--	{
--		EventName = ">>> LEVEL VERY HARD: vanish tower guards  <<<",
--		Conditions = 
--		{
--				GameIsUnBlocked{},
--			  GameDifficulty {Value = Diff.Extreme},									
--		},
--		Actions =
--		{
----			FigureVanish	{Tag = "TowerProtector_1_01"},
----			FigureVanish	{Tag = "TowerProtector_1_02"},
----			FigureVanish	{Tag = "TowerProtector_1_03"},
----			FigureVanish	{Tag = "TowerProtector_1_04"},
----			FigureVanish	{Tag = "TowerProtector_1_05"},
----			FigureVanish	{Tag = "TowerProtector_1_06"},
--
----			FigureVanish	{Tag = "TowerProtector_2_01"},
----			FigureVanish	{Tag = "TowerProtector_2_02"},
----			FigureVanish	{Tag = "TowerProtector_2_03"},
----			FigureVanish	{Tag = "TowerProtector_2_04"},
--
----			FigureVanish	{Tag = "TowerProtector_3_01"},
----			FigureVanish	{Tag = "TowerProtector_3_02"},
----			FigureVanish	{Tag = "TowerProtector_3_03"},
----			FigureVanish	{Tag = "TowerProtector_3_04"},
--
----			FigureVanish	{Tag = "TowerProtector_4_01"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_02"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_03"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_04"}, -- roaming
----			FigureVanish	{Tag = "TowerProtector_4_05"}, -- roaming		
--		},
--	},

	OnOneTimeEvent ------------------------------------------- Engdame phase init, start the quest MQ11_FINDTHESOURCE
	{
		EventName = ">>> mt_P706_After_ACT3_Start timer reached 10 seconds <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_After_ACT3_Start", Seconds = 10}, -- Started in Acts.lua
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "MQ11_FINDTHESOURCE"},
		},
		GotoState = "ENDGAME",
	},
};









State --**************************************************** ENDGAME STATE
{
	StateName = "ENDGAME",	
	
	--************************************************************************************************** MQ11_FINDTHESOURCE
	OnOneTimeEvent
	{
		EventName = ">>> tm_Human approached the Eagle's Nest <<<",
		Conditions = 
		{
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = distApproachDistance_EaglesNest, TargetTag = posEaglesNest},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = distApproachDistance_Boss, TargetTag = ftBossWithBreathFire},
			},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryBossThisIsTheirSource", Tag = ftHeroCaine, TargetTag = posEaglesNest},
			FigureOutcry	{TextTag = "cryBossADragon", Tag = ftHeroCaine },
			QuestSetSolved	{Player = "default", Quest = "MQ11_FINDTHESOURCE"},

			MapTimerStart	{Name = "mt_P706_MQ11_FINDTHESOURCE_completed"},
		},
	},
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward: mt_P706_MQ11_FINDTHESOURCE_completed > 10 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ11_FINDTHESOURCE_completed", Seconds = 10 },
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.MQ11_FINDTHESOURCE.XP },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave: mt_P706_MQ11_FINDTHESOURCE_completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ11_FINDTHESOURCE_completed", Seconds = 15 },
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
		EventName = ">>> Next Quest: mt_P706_MQ11_FINDTHESOURCE_completed > 20 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ11_FINDTHESOURCE_completed", Seconds = 20 },
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "MQ12_ELIMINATETHESOURCE"},

			FigureOutcry	{TextTag = "cryBossBuildings", Tag = ftHeroCaine },
			QuestSetActive	{Player = "default", Quest = "MQ121_DESTROYBUILDINGS"},		

			MapTimerStop	{Name = "mt_P706_MQ11_FINDTHESOURCE_completed"},
		},
	},
	
	
	
	
	--******************************************************************************************************* MQ121_DESTROYBUILDINGS
	OnOneTimeEvent 
	{
		EventName = ">>> All buildings destroyed <<<",
		Conditions = 
		{
			BuildingIsDead	{Tag = btBuildingEaglesNest01},
			BuildingIsDead	{Tag = btBuildingEaglesNest02},
			BuildingIsDead	{Tag = btBuildingEaglesNest03},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_NL1_Enabled"},

			QuestSetSolved	{Player = "default", Quest = "MQ121_DESTROYBUILDINGS"},

			FigureTeleportToEntity	{Tag = "Shaman", TargetTag = posShaman},
			FigureLookAtEntity	{Tag = "Shaman", TargetTag = "BossWithBreathFire"},
			DialogSetDisabled	{Tag = "Shaman"},
			
			MapTimerStart	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed"},
			MapFlagSetTrue	{Name = "mf_P706_StartBossTransmute"}, -- used in EndBoss.lua
			MapFlagSetFalse	{Name = "mf_P706_WeatherChangeEnabled"},
		},
	},
		
--	OnOneTimeEvent ------------------------------------------- XP reward
--	{
--		EventName = ">>> XP reward: mt_P706_MQ121_DESTROYBUILDINGS_completed > 5 <<<",
--		Conditions = 
--		{
--			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 5 },
--		},
--		Actions =
--		{
--			AvatarXPGive	{Player = "default", Amount = Reward.MQ121_DESTROYBUILDINGS.XP },
--		},
--	},		
	
--	OnOneTimeEvent ------------------------------------------- AutoSave
--	{
--		EventName = ">>> AutoSave: mt_P706_MQ121_DESTROYBUILDINGS_completed > 10 <<<",
--		Conditions = 
--		{
--			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 10 },
--			AvatarIsNotTalking	{},
--			GameInterfaceIsVisible {},
--		},
--		Actions =
--		{
--			DoAutoSave {},
--		},
--	},	






	--******************************************************************************************************* Bossfight, MQ122_KILLTHEBOSS
--	OnOneTimeEvent ------------------------------------------- Start the boss transmutation
--	{
--		EventName = ">>> Start the boss transmutation: mt_P706_MQ121_DESTROYBUILDINGS_completed > 5 <<<",
--		Conditions = 
--		{
--			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 5 },
--		},
--		Actions =
--		{
--			MapFlagSetTrue	{Name = "mf_P706_StartBossTransmute"}, -- used in EndBoss.lua
--		},
--	},
	


	
--	OnOneTimeEvent ------------------------------------------- Outcry
--	{
--		EventName = ">>> Outcry: mt_P706_MQ121_DESTROYBUILDINGS_completed > 12 <<<",
--		Conditions = 
--		{
--			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 12 },
--		},
--		Actions =
--		{
--			FigureOutcryAlert	{TextTag = "cryBossThisIsIt", Tag = "Shaman", TargetTag = otResurrectedDragon},
--		},
--	},


	OnOneTimeEvent ------------------------------------ Initial outcries: Lure him here 
	{
		EventName = ">>> One-time outcry: Lure him here <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 70},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryBossThisIsIt1", Tag = "Shaman", TargetTag = "Shaman"},			
		},
	},

	OnOneTimeEvent ------------------------------------ Initial outcries: Be careful
	{
		EventName = ">>> One-time outcry: Be careful <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 75},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryBossThisIsIt2", Tag = ftDragon},
		},
	},

	OnOneTimeEvent ------------------------------------ Initial outcries: I've waited my whole life
	{
		EventName = ">>> One-time outcry: I've waited my whole life <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 80},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryBossThisIsIt3", Tag = "Shaman", TargetTag = "Shaman"},			
			MapTimerStart	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed"},			
		},
	},
	
	OnEvent ------------------------------------------- Periodical outcry: Lure him to me periodically
	{
		EventName = ">>> Periodic outcry: Lure him here <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed", Seconds = 90}, -- every 90 sec
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryBossLureHimHere", Tag = "Shaman", TargetTag = "Shaman"},
			MapTimerStart	{Name = "mt_P706_MQ121_DESTROYBUILDINGS_completed"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Boss is near the Shaman, make the EndBoss lua switch to BOSSFIGHT_ENDED state
	{
		EventName = ">>> Boss is near the Shaman, make the EndBoss lua switch to BOSSFIGHT_ENDED state... <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftBossWithoutBreathFire, TargetTag = posShaman, Range = distBoss2ShamanBig},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_NLBossGoingToShaman"},	
		},
	},

	OnOneTimeEvent ------------------------------------------- EndBoss lua is in BOSSFIGHT_ENDED state -> now move the boss closer
	{
		EventName = ">>> EndBoss lua is in BOSSFIGHT_ENDED state -> now move the boss closer... <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_NLBossIsIn_BOSSFIGHT_ENDED_State"},
		},
		Actions =
		{
--			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = posShaman}, 
			FigureForcedRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = posShaman},
		},
	},

	OnOneTimeEvent ------------------------------------------- Boss at Shaman's
	{
		EventName = ">>> Boss has been successfully lured to the Shaman <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = ftBossWithoutBreathFire, TargetTag = otResurrectedDragon, Range = distBoss2ShamanSmall},
		},
		Actions =
		{
			UIBossfightPanelHide {},			
			MapFlagSetFalse	{Name = "mf_P706_NLBossGoingToShaman"},				
			MapFlagSetTrue	{Name = "mf_P706_StartTheCSOutro"},
		},
		GotoState = "END",
	},

-- *********************************************************************************
-- ** Bossfight ends here                                                       **
-- *********************************************************************************
};	





State --******************** LEVEL END STATE to close things and to avoid conflicts
{
	StateName = "END",


	OnOneTimeEvent ------------------------------------------- Map End
	{
		EventName = ">>> End map: mf_P706_CSOutroEnded <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_CSOutroEnded"},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "MQ122_KILLTHEBOSS"},
			AvatarXPGive	{Player = "default", Amount = Reward.MQ122_KILLTHEBOSS.XP },

			QuestSetSolved	{Player = "default", Quest = "MQ12_ELIMINATETHESOURCE"},
			QuestSetSolved	{Player = "default", Quest = "ACT_3"},

			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
			PlayerMapTravelAddon3	{Map = "Campaign/P707_Steel_Shore", TargetTag = "Map_Start_Point"},
		},
	},
};
