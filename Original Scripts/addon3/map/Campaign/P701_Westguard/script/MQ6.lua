--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MQ6_CS06_TowerOfTheShaikan_End"},

		},
		Actions =
		{
			 
			ObjectSpawn {ObjectId = 3111, X = 89.1053, Y = 567.791, Direction = 0, Tag = "LichVoice"},
			MapFlagSetTrue {Name = "mf_MQ6_QuestStart"},
			MapTimerStart	{Name = "mt_P701_CS06_TowerOfTheShaikan_End"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Lich"},
			AIMilitaryOffensiveSet	{Player = "pl_UDLichGuard", Percent = 20},
			MapFlagSetFalse {Name = "mf_LichCameBack"},
		},
		
	},
	

		--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_CS06_TowerOfTheShaikan_End", Seconds = 5}
		},
		Actions =
		{
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_52"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_5"},

			
		},
	},	
	---	XP GIVE
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_CS06_TowerOfTheShaikan_End", Seconds = 10}
		},
		Actions =
		{
				AvatarXPGive	{Player = "default", Amount = 800},


		},
	},	
		-- Save
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_CS06_TowerOfTheShaikan_End", Seconds = 10}
		},
		Actions =
		{
				
				MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},	
			-- New Quests 
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_CS06_TowerOfTheShaikan_End", Seconds = 20}
		},
		Actions =
		{
				
			QuestSetActive	{Player = "default", Quest = "WGA3_MQ_6"},
				MapTimerStop	{Name = "mt_P701_CS06_TowerOfTheShaikan_End"},
				UIBossfightPanelShow { UnitTag1 = "Lich", UnitTag2 = "", PortraitImage = "boss_P701_lich", DisplayName = Boss_P701_Lich},
		},
		GotoState = "ALIVE",
	},
};	

	--*************************************************************************************************
	
	--                                     BOSSFIGHT
	
	--*************************************************************************************************
	local Building1 = "LichRebirth_01";
	local Building2 = "LichRebirth_02";
	local Building3 = "LichRebirth_03";
	local Building4 = "LichRebirth_04";
	local Building5 = "LichRebirth_05";
	
	local Lich = "Lich";
	
	local hpRefill = 20;
	local SkeletonNumber = 20;
	local SkeletonNumberSupport = 10;
State
{


StateName = "ALIVE",

	OnOneTimeRepeatEvent
	{
		EventName = "ChoiceDeath",
		Name = "DEATH",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P701_MQ_3_DEATH"},
			FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 20, TargetTag = "Grave_03"},
		},
		Actions = 
		{
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "Grave_01", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "Grave_02", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "Grave_03", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "Grave_04", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadHQ", TargetTag = "Grave_05", Amount = SkeletonNumberSupport },
			FigureRespawnToEntity	{Tag = "Watcher_Of_Souls", TargetTag = "WatcherRespawn"},
			FigureTeamTransfer	{Tag = "Watcher_Of_Souls", Team = "tm_Neutral"},
			FigureOutcry {TextTag = "OC_MQ6_DEATH", Tag = "Watcher_Of_Souls"},
			
			
		},
		
	},
	
		OnOneTimeRepeatEvent
	{
		EventName = "ChoiceVeneration",
		Name = "VENERATION",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P701_MQ_3_VENERATION"},
			FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 20, TargetTag = "Grave_03"},
		},
		Actions = 
		{
				
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_GuardianOfSouls", TargetTag = "Grave_01", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_GuardianOfSouls", TargetTag = "Grave_02", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_GuardianOfSouls", TargetTag = "Grave_03", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_GuardianOfSouls", TargetTag = "Grave_04", Amount = SkeletonNumberSupport },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_GuardianOfSouls", TargetTag = "Grave_05", Amount = SkeletonNumberSupport },
			FigureOutcry {TextTag = "OC_MQ6_VENERATION", Tag = "Watcher_Of_Souls"},
		},
		
	},

	OnOneTimeRepeatEvent
	{
		EventName = "LichDies",
		Name = "en_LichDiesEvent",
		Conditions = 
		{
			FigureIsDead	{Tag = "Lich"},
		},
		Actions = 
		{
			FigureCorpseRotForbid	{Tag = "Lich"},
			MapFlagSetTrue	{Name = "mf_LichDead"},
			MapFlagSetFalse{Name = "mf_SkeletoneRespawn"},
			EventReEnable	{Name = "en_SpawnSkeletonsEvent"},
			EventReEnable	{Name = "en_NomoreSkeletonsEvent"},
			FigureOutcry {TextTag = "OC_MQ6_LichDead", Tag = "LichVoice"},
		},
		
	},



	OnOneTimeRepeatEvent
	{
		EventName = "SpawnSkeletons",
		Name = "en_SpawnSkeletonsEvent",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_LichDead"},
			MapFlagIsFalse	{Name = "mf_SkeletoneRespawn"},
		},
		Actions = 
		{
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadLich", TargetTag = Building1, Amount = SkeletonNumber },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadLich", TargetTag = Building2, Amount = SkeletonNumber },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadLich", TargetTag = Building3, Amount = SkeletonNumber },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadLich", TargetTag = Building4, Amount = SkeletonNumber },
			FigureRtsPlayerSpawnToEntity {UnitId = 127, Player = "pl_UndeadLich", TargetTag = Building5, Amount = SkeletonNumber },
			MapFlagSetTrue{Name = "mf_SkeletoneRespawn"},
		},
		
	},

	
	--MQ6_LichKilled

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_MQ6_QuestStart"},
				MapFlagIsTrue	{Name = "mf_LichDead"},
				PlayerHasNotBuildingAmount	{Player = "pl_UndeadLich", Amount = 1, OnlyCompleted = true},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_6_Completed"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_4"},
				
		},
	},	
	
		OnOneTimeRepeatEvent
	{
		EventName = "NomoreSkeletons",
		Name = "en_NomoreSkeletonsEvent",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_LichDead"},
			PlayerHasNotFigureAmount	{Player = "pl_UndeadLich", Amount = 1},
			PlayerHasBuildingAmount	{Player = "pl_UndeadLich", Amount = 1, OnlyCompleted = true},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_LichRespawn"},
			FigureRespawnToEntity	{Tag = "Lich", TargetTag = "LichRespawn"},
			MapFlagSetFalse	{Name = "mf_LichDead"},
			MapFlagSetTrue {Name = "mf_LichCameBack"},
			EventReEnable	{Name = "en_LichDiesEvent"},
			FigureOutcry {TextTag = "OC_MQ6_LichRespawn", Tag = "LichVoice"},
		},
		
	},

	
--MQ6_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_6_Completed"},

		},
		Actions =
		{
				MapTimerStart	{Name = "mt_P701_MQ6_BossKilled"},
				UIBossfightPanelHide {},
		},
	},	
	--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ6_BossKilled", Seconds = 5}
		},
		Actions =
		{
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_6"},
			
		},
	},	
	---	XP GIVE
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ6_BossKilled", Seconds = 10}
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 700},
			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
		},
	},	
		-- Save
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ6_BossKilled", Seconds = 10}
		},
		Actions =
		{
				
				MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},	
			-- New Quests 
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_MQ6_BossKilled", Seconds = 20}
		},
		Actions =
		{
				MapFlagSetTrue	{Name = "mf_MQ6_CS06_VictoryAfterParley_Start"},
				MapTimerStop	{Name = "mt_P701_MQ6_BossKilled"},
		},
	},	
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_MQ6_CS06_VictoryAfterParley_End"},
		},
		Actions =
		{
				
				PlayerMapTravelAddon3	{Map = "Campaign/P702_Stepping_Stones", TargetTag = "Map_Start_Point"},
				
		},
	},	
};


	
	
