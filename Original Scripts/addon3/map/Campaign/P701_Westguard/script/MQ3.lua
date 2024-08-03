--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
		MapFlagIsTrue {Name = "mf_P701_Lighthouse_CS03_End"},

		},
		Actions =
		{
		ObjectVanish	{Tag = "LieutenantMarker"},
		MapFlagSetFalse{Name = "mf_P701_MQ_2_Completed"},
		MapTimerStart	{Name = "mt_P701_Lighthouse_CS03"},	
		},
	},
		--Quests Solved
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_Lighthouse_CS03", Seconds = 5}
		},
		Actions =
		{
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_21"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_2"},
				
		},
	},	
	---	XP GIVE
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_Lighthouse_CS03", Seconds = 10}
		},
		Actions =
		{
				AvatarXPGive	{Player = "default", Amount = 500},
				
		},
	},	
		-- Save
	OnOneTimeEvent
		{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P701_Lighthouse_CS03", Seconds = 10}
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
				MapTimerIsElapsed	{Name = "mt_P701_Lighthouse_CS03", Seconds = 20}
		},
		Actions =
		{
				
				QuestSetActive	{Player = "default", Quest = "WGA3_MQ_3"},
				MapTimerStop	{Name = "mt_P701_Lighthouse_CS03"},
		},
	},	

	--MQ2_IPG1

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_3"},
				FigureIsDead	{Tag = "Undead_IPLh1_1"},
				FigureIsDead	{Tag = "Undead_IPLh1_2"},
				FigureIsDead	{Tag = "Undead_IPLh1_3"},
				FigureIsDead	{Tag = "Undead_IPLh1_4"},
				FigureIsDead	{Tag = "Undead_IPLh1_5"},
				FigureIsDead	{Tag = "Undead_IPLh1_6"},

		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_3_IPLh1Completed"},
			
		},
	},
--MQ2_IPG1 Unit Team Transfer

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_MQ_3"},
				OR	{
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 20, TargetTag = "LighthouseGuidepost"},
				FigureTeamIsInRangeToEntity	{Team = "pl_Team1", Range = 25, TargetTag = "Undead_IPLh1_6"},
				},
		},
		Actions =
		{


				MapFlagSetTrue {Name = "mf_P701_MQ_3_IPLh1TeamChange"},

				FigureForcedRunToEntity	{Tag = "Undead_IPLh1_6", TargetTag = "Lighthouse"},
				
				
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_31"},		
	
				FigureTeamTransfer	{Tag = "LighthouseBuilding", Team = "tm_Lighthouse"},
				BuildingTeamTransfer	{Tag = "LighthouseBuilding", Team = "tm_Lighthouse"},
				
				
				
				FigureOutcry {TextTag = "OC_MQ3_Lighthouse1", Tag = "pl_HumanAvatar"},
				FigureOutcry {TextTag = "OC_MQ3_Lighthouse2", Tag = "pl_HumanAvatar"},
				FigureOutcry {TextTag = "OC_MQ3_Lighthouse3", Tag = "Lighthouse"},
				FigureOutcry {TextTag = "OC_MQ3_Lighthouse4", Tag = "pl_HumanAvatar"},
				
				MapFlagSetTrue {Name = "mf_P701_MQ_3_IPLh2TeamChange"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_1", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_2", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_3", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_4", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_5", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_6", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_7", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_8", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_9", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_10", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_11", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_12", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_13", Team = "tm_UndeadLighthouse"},
				FigureTeamTransfer	{Tag = "Undead_IPLh2_14", Team = "tm_UndeadLighthouse"},
				EntityTimerStart	{Name = "UndeadTeamChange"},
		},
	},
--MQ2_IPG2

	OnOneTimeEvent
		{
		Conditions = 
		{
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_31"},
				MapFlagIsTrue {Name = "mf_P701_MQ_3_IPLh2TeamChange"},
				FigureIsDead	{Tag = "Undead_IPLh2_1"},
				FigureIsDead	{Tag = "Undead_IPLh2_2"},
				FigureIsDead	{Tag = "Undead_IPLh2_3"},
				FigureIsDead	{Tag = "Undead_IPLh2_4"},
				FigureIsDead	{Tag = "Undead_IPLh2_5"},
				FigureIsDead	{Tag = "Undead_IPLh2_6"},
				FigureIsDead	{Tag = "Undead_IPLh2_7"},
				FigureIsDead	{Tag = "Undead_IPLh2_8"},
				FigureIsDead	{Tag = "Undead_IPLh2_9"},
				FigureIsDead	{Tag = "Undead_IPLh2_10"},
				FigureIsDead	{Tag = "Undead_IPLh2_11"},
				FigureIsDead	{Tag = "Undead_IPLh2_12"},
				FigureIsDead	{Tag = "Undead_IPLh2_13"},
				FigureIsDead	{Tag = "Undead_IPLh2_14"},
				FigureIsDead	{Tag = "Undead_IPLh2_15"},
				FigureIsDead	{Tag = "Undead_IPLh2_16"},
		},
		Actions =
		{

				--PlayerNPCKillCountIncrease	{Player = "default", UnitId = 1654},
				MapFlagSetTrue {Name = "mf_P701_MQ_3_IPLh2Completed"},
			
		},
	},

--MQ3_LighthouseSaved

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_3_IPLh1Completed"},
				MapFlagIsTrue {Name = "mf_P701_MQ_3_IPLh2Completed"},
				EntityTimerIsElapsed	{Name = "UndeadTeamChange", Seconds = 1},

		},
		Actions =
		{
				MapFlagSetFalse {Name = "mf_P701_MQ_3_IPLh1Completed"},
				MapFlagSetFalse {Name = "mf_P701_MQ_3_IPLh2Completed"},
				MapFlagSetTrue {Name = "mf_P701_LighthouseSaved"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_31"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_32"},
				DialogSetEnabled {Tag = "Lighthouse"},
				
				
		},
	},	
--MQ3_LighthouseDestroyed

	OnOneTimeEvent
		{
		Conditions = 
		{

				FigureIsDead	{Tag = "LighthouseBuilding"},

		},
		Actions =
		{
				PlayerGameOver	{Player = "default", Tag = "default", LocaTag = "IGMenuGameOver_Title"},
				
				
		},
	},	
	
	--MQ3_LighthouseConversationEnd

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_3_LighthouseConversationEnd"},
			

		},
		Actions =
		{
			PlayerTravelDisable {},
			DialogSetDisabled {Tag = "Lighthouse"},
			DialogSetEnabled {Tag = "Watcher_Of_Souls"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 25, Y = 660},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 25, Y = 660},
			
		},
	},	
	
	
	
--MQ3_Choice_Death

	OnOneTimeEvent
		{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P701_MQ_3_LighthouseConversationEnd"},
				MapFlagIsTrue {Name = "mf_P701_MQ_3_DEATH"},
				FigureIsAlive	{Tag = "Watcher_Of_Souls"},
		},
		Actions =
		{
				FigureTeamTransfer	{Tag = "Watcher_Of_Souls", Team = "tm_UndeadLighthouse"},
				DialogSetDisabled {Tag = "Watcher_Of_Souls"},
			
				
		},
	},		
	
--MQ3_Guarian_of_Souls_Killed

	OnOneTimeEvent
		{
		Conditions = 
		{

				FigureIsDead	{Tag = "Watcher_Of_Souls"},
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_32"},
				
		},
		Actions =
		{
				
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_32"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_33"},
				PlayerTravelEnable {},
		},
	},

	OnOneTimeEvent
		{
		Conditions = 
		{

				FigureIsDead	{Tag = "Watcher_Of_Souls"},
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Westguard_MistyCoast", Range = 35},
				QuestIsActive	{Player = "default", Quest = "WGA3_SUBQ_33"},
		},
		Actions =
		{
				EntityTimerStart	{Name = "et_WatcherDead"},
				

		},
	},
	
	--MQ3_Guarian_of_Souls_Killed

	OnOneTimeEvent
		{
		Conditions = 
		{

				FigureIsDead	{Tag = "Watcher_Of_Souls"},
				EntityTimerIsElapsed	{Name = "et_WatcherDead", Seconds = 5},

		},
		Actions =
		{
				EntityTimerStop	{Name = "et_WatcherDead"},
				MapFlagSetTrue {Name = "mf_P701_MQ_3_Completed"},
				
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_32"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_33"},
				
				
		},
	},
	
	--MQ3_Choice_Peace

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_3_PEACE"},
				MapFlagIsTrue {Name = "mf_P701_MQ_3_LighthouseConversationEnd"},
		},
		Actions =
		{
				MapFlagSetTrue{Name = "mf_P701_MQ_3_PEACE"},
				MapFlagSetTrue {Name = "mf_P701_MQ_3_Completed"},
				PlayerTravelEnable {},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_32"},
				QuestSetActive	{Player = "default", Quest = "WGA3_SUBQ_33"},
				
		},
	},	
	
	--MQ3_Choice_Veneration

	OnOneTimeEvent
		{
		Conditions = 
		{
			
				MapFlagIsTrue {Name = "mf_P701_MQ_3_VENERATION"},
				MapFlagIsTrue {Name = "mf_P701_MQ_3_LighthouseConversationEnd"},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P701_MQ_3_Completed"},
				PlayerTravelEnable {},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SUBQ_32"},
				QuestSetSolved	{Player = "default", Quest = "WGA3_MQ_3"},
				
		},
	},			
--MQ3_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_MQ_3_Completed"},

		},
		Actions =
		{
     EntityTimerStart	{Name = "et_MQ3Endtimer"},
				
		},
	},	
		OnOneTimeEvent
		{
		Conditions = 
		{

				EntityTimerIsElapsed {Name = "et_MQ3Endtimer", Seconds = 3},

		},
		Actions =
		{
				EntityTimerStop	{Name = "et_MQ3Endtimer"},
				ObjectChange	{Tag = "MarketstallCheese", ObjectId = 323, X = 411.491, Y = 386.582, Direction = 0},
				
				MapFlagSetTrue {Name = "mf_MQ3_CS03_ShaikanCouncil_Start"},
				
				
		},
	},	
	
}


	
	
