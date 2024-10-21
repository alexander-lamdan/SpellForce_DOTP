--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_MQ2_CS02_GatesAreStillOpen_End"},
		},
		Actions =
		{
				
				MapFlagSetTrue {Name = "MQ2_QuestStart"},
				MapFlagSetFalse{Name = "mf_P701_MQ_1_Completed"},
				MapFlagSetFalse{Name = "mf_P701_GuardsGuards_CS02_End"},
				ObjectVanish	{Tag = "Roadblock01"},
				ObjectVanish	{Tag = "Roadblock02"},
				MapTimerStart {Name = "mt_P701_GuardsGuards_CS02"},
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_2"},
			
		},
	},	
	--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_GuardsGuards_CS02", Seconds = 5}
		},
		Actions =
		{
				

				--QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_11"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_1"},
			
		},
	},	
	---	XP GIVE
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_GuardsGuards_CS02", Seconds = 10}
		},
		Actions =
		{
				AvatarXPGive	{Player = "default", Amount = 500},
				
		},
	},	
		--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_GuardsGuards_CS02", Seconds = 10}
		},
		Actions =
		{
				
				MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},	
			--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_GuardsGuards_CS02", Seconds = 20}
		},
		Actions =
		{
				
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_2"},
				MapTimerStop	{Name = "mt_P701_GuardsGuards_CS02"},
		},
	},	
	--MQ2_IPG1

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				FigureIsDead	{Tag = "Undead_IPG1_1"},
				FigureIsDead	{Tag = "Undead_IPG1_2"},
				FigureIsDead	{Tag = "Undead_IPG1_3"},
				FigureIsDead	{Tag = "Undead_IPG1_4"},
				FigureIsDead	{Tag = "Undead_IPG1_5"},
				FigureIsDead	{Tag = "Undead_IPG1_6"},

		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG1Completed"},
			
		},
	},
--MQ2_IPG1 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				OR
				{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 12, TargetTag = "Marker_IPG1"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Guards_IPG1_2"},
			}
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG1TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPG1_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG1_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG1_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG1_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG1_5", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG1_6", Team = "tm_Undead"},

			
		},
	},
--MQ2_IPG2

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				FigureIsDead	{Tag = "Undead_IPG2_1"},
				FigureIsDead	{Tag = "Undead_IPG2_2"},
				FigureIsDead	{Tag = "Undead_IPG2_3"},
				FigureIsDead	{Tag = "Undead_IPG2_4"},
				FigureIsDead	{Tag = "Undead_IPG2_5"},
				FigureIsDead	{Tag = "Undead_IPG2_6"},
		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG2Completed"},
			
		},
	},
--MQ2_IPG2 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Guards_IPG2_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG2TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPG2_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG2_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG2_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG2_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG2_5", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG2_6", Team = "tm_Undead"},

			
		},
	},
--MQ2_IPG3

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				FigureIsDead	{Tag = "Undead_IPG3_1"},
				FigureIsDead	{Tag = "Undead_IPG3_2"},
				FigureIsDead	{Tag = "Undead_IPG3_3"},
				FigureIsDead	{Tag = "Undead_IPG3_4"},
				FigureIsDead	{Tag = "Undead_IPG3_5"},
				FigureIsDead	{Tag = "Undead_IPG3_6"},
		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG3Completed"},
			
		},
	},
	
			--MQ2_IPG3 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Guards_IPG3_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG3TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPG3_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG3_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG3_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG3_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG3_5", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG3_6", Team = "tm_Undead"},

			
		},
	},
--MQ2_IPG4

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				FigureIsDead	{Tag = "Undead_IPG4_1"},
				FigureIsDead	{Tag = "Undead_IPG4_2"},
				FigureIsDead	{Tag = "Undead_IPG4_3"},
				FigureIsDead	{Tag = "Undead_IPG4_4"},
				FigureIsDead	{Tag = "Undead_IPG4_5"},
				FigureIsDead	{Tag = "Undead_IPG4_6"},
				FigureIsDead	{Tag = "Undead_IPG4_7"},
		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG4Completed"},
			
		},
	},

--MQ2_IPG4 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Guards_IPG4_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG4TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_5", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_6", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG4_7", Team = "tm_Undead"},			
		},
	},
--MQ2_IPG5

	OnOneTimeEvent
		{
		Conditions = 
		{
				--QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				FigureIsDead	{Tag = "Undead_IPG5_1"},
				FigureIsDead	{Tag = "Undead_IPG5_2"},
				FigureIsDead	{Tag = "Undead_IPG5_3"},
				FigureIsDead	{Tag = "Undead_IPG5_4"},
				FigureIsDead	{Tag = "Undead_IPG5_5"},
		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG5Completed"},
			
		},
	},	
	
--MQ2_IPG5 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Guards_IPG5_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG5TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPG5_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG5_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG5_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG5_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG5_5", Team = "tm_Undead"},
	
		},
	},
--MQ2_IPG6

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				FigureIsDead	{Tag = "Undead_IPG6_1"},
				FigureIsDead	{Tag = "Undead_IPG6_2"},
				FigureIsDead	{Tag = "Undead_IPG6_3"},
				FigureIsDead	{Tag = "Undead_IPG6_4"},
				FigureIsDead	{Tag = "Undead_IPG6_5"},
				FigureIsDead	{Tag = "Undead_IPG6_6"},
				FigureIsDead	{Tag = "Undead_IPG6_7"},
				FigureIsDead	{Tag = "Undead_IPG6_8"},
				FigureIsDead	{Tag = "Undead_IPG6_9"},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG6Completed"},

		},
	},	
--MQ2_IPG6 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_2"},
				
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 8, TargetTag = "Guards_IPG6_2"},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_2_IPG6TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_1", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_2", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_3", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_4", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_5", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_6", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_7", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_8", Team = "tm_Undead"},
				FigureTeamTransfer	{Tag = "Undead_IPG6_9", Team = "tm_Undead"},
	
		},
	},	
--MQ2_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_2_IPG1Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_2_IPG2Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_2_IPG3Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_2_IPG4Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_2_IPG5Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_2_IPG6Completed"},
		},
		Actions =
		{
				MapFlagSetFalse {Name = "mf_P701_MQ_2_IPG1Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_2_IPG2Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_2_IPG3Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_2_IPG4Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_2_IPG5Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_2_IPG6Completed"},
				MapFlagSetTrue {Name = "mf_P701_MQ_2_Completed"},
				
				ObjectSpawn	{ObjectId = 1591, X = 396.486, Y = 294.44,  Direction = 0, Tag = "LieutenantMarker"},
				DialogSetEnabled {Tag = "Lieutenant"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_21"},
				
		},
	},	
	--   Sack1
---------------------
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ_2_Completed"},
				
				
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "MQ5_Sack1_W1E", Level = 1, UnitId = 811, TargetTag = "SQ5_Sack1_PigPlace", Team = "tm_Natural"},
			
			FigureRunToEntity	{Tag = "MQ5_Sack1_W1E", TargetTag = "MarketstallJars"},
			
		},
	},


	--Worker1
				OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack1_W1E", TargetTag = "MarketstallJars", Range = 2},
				
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack1_W1E", Direction = 0, Tag = "SQ5_Sack1_W1EMarker"},		
			ObjectChange	{Tag = "MarketstallJars", ObjectId = 322, X = 403.958, Y = 397.401, Direction = 90},
			FigureVanish	{Tag = "SQ5_Sack1_W1E"},		
			ObjectVanish	{Tag = "SQ5_Sack1_W1Target"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_W1", Level = 1, UnitId = 696, TargetTag = "SQ5_Sack1_W1EMarker", Team = "tm_Natural"},		
			FigureRunToEntity	{Tag = "MQ5_Sack1_W1", TargetTag = "SQ5_Sack1_PigPlace"},
		},
	},--Worker1
				OnOneTimeEvent
		{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack1_W1", TargetTag = "SQ5_Sack1_PigPlace", Range = 2},
				
		},
		Actions =
		{
			
			FigureVanish	{Tag = "SQ5_Sack1_W1"},		
			
		},
	},
}


	
	
