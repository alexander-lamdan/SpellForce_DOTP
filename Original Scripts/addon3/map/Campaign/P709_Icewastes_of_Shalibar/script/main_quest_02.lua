--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Main Quest 02 script  *
--*                                                  *
--*                 Secure the area                  *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",
	
--	Activate Main Quest #2
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate Main Quest #2 <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_MQ_1"},
			
			QuestIsNotSolved	{Player = "default", Quest = "IOS_MQ_2"},

			MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 20},

		},
		Actions =
		{

			QuestSetActive {Quest = "IOS_MQ_2"},

			MapTimerStop {Name = "mt_P709_FinishQuest"},

			MapTimerStart {Name = "mt_P709_ActivateQuest"},

		},

	},
	
--	Activate Main Quest #2 Subquest #1
	
	OnOneTimeEvent
	{
		EventName = ">>> Activate Main Quest #2 Subquest #1 <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_MQ_2"},

			MapTimerIsElapsed {Name = "mt_P709_ActivateQuest", Seconds = 5},

		},
		Actions =
		{

			QuestSetActive {Quest = "IOS_SUBQ_21"},

		},

	},
	
--	OUTCRY: P709_CRY_MQ_2_T001_AVATAR

	OnOneTimeEvent
	{
		EventName = ">>> OUTCRY: P709_CRY_MQ_2_T001_AVATAR <<<",
		Conditions = 
		{

			QuestIsActive	{Player = "default", Quest = "IOS_SUBQ_21"},

			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 10},

		},
		Actions =
		{

			FigureOutcry {TextTag = "P709_CRY_MQ_2_T001_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapTimerStop {Name = "mt_P709_ActivateQuest"},

		},

		GotoState = "IOS_SUBQ_21",

	},

};

--	IOS_SUBQ_21

State
{

		StateName = "IOS_SUBQ_21",


--	Activate signal fire 1
	
	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_1", Range = 4},

		},
		Actions =
		{

			ObjectVanish {Tag = "signal_fire_1"},
			ObjectSpawn	{ObjectId = 2063, X = 32.85, Y = 170, Direction = 0, Tag = "signal_fire_1_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 32.7914, Y = 172.402, Direction = 0, Tag = "signal_fire_1_FX"},
			
			ObjectVanish	{Tag = "signal_fire_2_KO"},
			ObjectSpawn	{ObjectId = 1228, X = 145.625, Y = 132.878, Direction = 0, Tag = "signal_fire_2"},

			FigureOutcry {TextTag = "P709_CRY_MQ_2_T002_AVATAR", Tag = "pl_HumanAvatar"},

			MapFlagSetTrue {Name = "mf_P709_signal_fire_1"},

		},
	},
	
--	Activate signal fire 2
	
	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue	{Name = "mf_P709_signal_fire_1"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_2", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_2"},
			ObjectSpawn	{ObjectId = 2063 , X = 145.625, Y = 132.878, Direction = 0, Tag = "signal_fire_2_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 145.544, Y = 134.966, Direction = 0, Tag = "signal_fire_2_FX"},
			
			ObjectVanish	{Tag = "signal_fire_3_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 158.324, Y = 34.1236, Direction = 0, Tag = "signal_fire_3"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T002_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_2"},

		},
	},
	
--	Activate signal fire 3

	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue	{Name = "mf_P709_signal_fire_2"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_3", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_3"},
			ObjectSpawn	{ObjectId = 2063 , X = 158.324, Y = 34.1236, Direction = 0, Tag = "signal_fire_3_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 156.215, Y = 34.028, Direction = 0, Tag = "signal_fire_3_FX"},
			
			ObjectVanish {Tag = "signal_fire_4_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 257.961, Y = 37.3034, Direction = 0, Tag = "signal_fire_4"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T002_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_3"},

		},
	},
	
--	Activate signal fire 4

	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue	{Name = "mf_P709_signal_fire_3"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_4", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_4"},
			ObjectSpawn	{ObjectId = 2063 , X = 257.961, Y = 37.3034, Direction = 0, Tag = "signal_fire_4_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 259.74, Y = 39.6247, Direction = 0, Tag = "signal_fire_4_FX"},
			
			ObjectVanish	{Tag = "signal_fire_5_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 219.229, Y = 227.464, Direction = 0, Tag = "signal_fire_5"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T002_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_4"},

		},
	},
	
--	Activate signal fire 5

	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue	{Name = "mf_P709_signal_fire_4"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_5", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_5"},
			ObjectSpawn	{ObjectId = 2063 , X = 219.229, Y = 227.464, Direction = 0, Tag = "signal_fire_5_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 220.987, Y = 228.901, Direction = 0, Tag = "signal_fire_5_FX"},
			
			ObjectVanish	{Tag = "signal_fire_6_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 32.6966, Y = 244.036, Direction = 0, Tag = "signal_fire_6"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T003_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_5"},

		},
	},
	
--	Activate signal fire 6

	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue	{Name = "mf_P709_signal_fire_5"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_6", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_6"},
			ObjectSpawn	{ObjectId = 2063 , X = 32.6966, Y = 244.036, Direction = 0, Tag = "signal_fire_6_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 35.177, Y = 244.247, Direction = 0, Tag = "signal_fire_6_FX"},
			
			ObjectVanish	{Tag = "signal_fire_7_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 159.068, Y = 348.933, Direction = 0, Tag = "signal_fire_7"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T003_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_6"},

		},
	},
	
--	Activate signal fire 7

	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue	{Name = "mf_P709_signal_fire_6"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_7", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_7"},
			ObjectSpawn	{ObjectId = 2063 , X = 159.068, Y = 348.933, Direction = 0, Tag = "signal_fire_7_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 161.363, Y = 347.799, Direction = 0, Tag = "signal_fire_7_FX"},
			
			ObjectVanish	{Tag = "signal_fire_8_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 133.244, Y = 511.243, Direction = 0, Tag = "signal_fire_8"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T003_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_7"},

		},
	},
	
--	Activate signal fire 8

	OnOneTimeEvent
	{
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue {Name = "mf_P709_signal_fire_7"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_8", Range = 4},

		},
		Actions =
		{
			
			ObjectVanish {Tag = "signal_fire_8"},
			ObjectSpawn	{ObjectId = 2063 , X = 133.244, Y = 511.243, Direction = 0, Tag = "signal_fire_8_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 134.283, Y = 513.721, Direction = 0, Tag = "signal_fire_8_FX"},
			
			ObjectVanish {Tag = "signal_fire_9_KO"},
			ObjectSpawn	{ObjectId = 1228 , X = 45.2132, Y = 567.493, Direction = 0, Tag = "signal_fire_9"},
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T003_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_8"},

		},
	},

--	Activate signal fire 9 -- Heroes are in range

	OnOneTimeEvent
	{
		EventName = ">>> Activate signal fire 9 -- Heroes are in range <<<",
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue {Name = "mf_P709_signal_fire_8"},
			MapFlagIsFalse {Name = "mf_P709_signal_fire_9"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_9", Range = 4},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "signal_fire_9", Range = 15},

		},
		Actions =
		{
			
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T004_CAINE", Tag = "pl_HumanHeroCaine"},
			FigureOutcry {TextTag = "P709_CRY_MQ_2_T005_AVATAR", Tag = "pl_HumanAvatar"},
			
			MapTimerStop {Name = "mt_P709_FinishQuest"},
			
			MapTimerStart	{Name = "mt_P709_ActivateQuest"},
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_9"},

		},
	},

--	Signal fire check, start wolfpack attack
	
	OnOneTimeEvent
	{
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_signal_fire_9"},
			
			MapTimerIsElapsed	{Name = "mt_P709_ActivateQuest", Seconds = 8},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_9", Range = 4},

		},
		Actions =
		{
	
			MapTimerStop {Name = "mt_P709_ActivateQuest"},
	
			ObjectVanish {Tag = "signal_fire_9"},
			ObjectSpawn	{ObjectId = 2063 , X = 45.2132, Y = 567.493, Direction = 0, Tag = "signal_fire_9_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 43, Y = 569, Direction = 0, Tag = "signal_fire_9_FX"},
	
			FigureTeamTransfer {Tag = "wolfpack_0201", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0202", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0203", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0204", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0205", Team = "tm_Creep"},
			
			FigureTeamTransfer {Tag = "wolfpack_0206", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0207", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0208", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0209", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0210", Team = "tm_Creep"},
			
			FigureTeamTransfer {Tag = "wolfpack_0211", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0212", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0213", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0214", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0215", Team = "tm_Creep"},

		},
	},

--	Activate signal fire 9 -- Heroes are NOT in range

	OnOneTimeEvent
	{
		EventName = ">>> Activate signal fire 9 -- Heroes are NOT in range <<<",
		Conditions = 
		{

			QuestIsActive {Quest = "IOS_MQ_2"},
			
			MapFlagIsTrue {Name = "mf_P709_signal_fire_8"},
			MapFlagIsFalse {Name = "mf_P709_signal_fire_9"},
			
			AvatarFlagIsFalse {Name = "af_DragonMounted"},
			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "signal_fire_9", Range = 4},
			FigureIsNotInRangeToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "signal_fire_9", Range = 15},

		},
		Actions =
		{
			
			MapFlagSetTrue {Name = "mf_P709_signal_fire_9"},
			
			ObjectVanish {Tag = "signal_fire_9"},
			ObjectSpawn	{ObjectId = 2063 , X = 45.2132, Y = 567.493, Direction = 0, Tag = "signal_fire_9_OK"},
			ObjectSpawn	{ObjectId = 2253, X = 43, Y = 569, Direction = 0, Tag = "signal_fire_9_FX"},
	
			FigureTeamTransfer {Tag = "wolfpack_0201", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0202", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0203", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0204", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0205", Team = "tm_Creep"},
			
			FigureTeamTransfer {Tag = "wolfpack_0206", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0207", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0208", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0209", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0210", Team = "tm_Creep"},
			
			FigureTeamTransfer {Tag = "wolfpack_0211", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0212", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0213", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0214", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "wolfpack_0215", Team = "tm_Creep"},

		},
	},
	
-- Wolfpack check, solve Main Quest #2's Sub Quest 1

	OnOneTimeEvent
	{
		EventName = ">>> Wolfpack check, solve Main Quest #2's Sub Quest 1 <<<",
		Conditions = 
		{

				FigureIsDead	{Tag = "wolfpack_0201"},
				FigureIsDead	{Tag = "wolfpack_0202"},
				FigureIsDead	{Tag = "wolfpack_0203"},
				FigureIsDead	{Tag = "wolfpack_0204"},
				FigureIsDead	{Tag = "wolfpack_0205"},
				
				FigureIsDead	{Tag = "wolfpack_0206"},
				FigureIsDead	{Tag = "wolfpack_0207"},
				FigureIsDead	{Tag = "wolfpack_0208"},
				FigureIsDead	{Tag = "wolfpack_0209"},
				FigureIsDead	{Tag = "wolfpack_0210"},
				
				FigureIsDead	{Tag = "wolfpack_0211"},
				FigureIsDead	{Tag = "wolfpack_0212"},
				FigureIsDead	{Tag = "wolfpack_0213"},
				FigureIsDead	{Tag = "wolfpack_0214"},
				FigureIsDead	{Tag = "wolfpack_0215"},

		},
		Actions =
		{

			QuestSetSolved	{Player = "default", Quest = "IOS_SUBQ_21"},
	
			MapTimerStart {Name = "mt_P709_FinishQuest"},

		},
	},

--	Start Main Quest #2's Sub Quest #2
	
	OnOneTimeEvent
	{
		EventName = ">>> Start Main Quest #2's Sub Quest #2 <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_21"},
			
			MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			QuestSetActive {Quest = "IOS_SUBQ_22"},

		},

	},
	
--	Sub Quest #2-1 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Sub Quest #2-1 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 10},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_FinishQuest"},

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_SUBQ_22",

	},

};

State
{

	StateName = "IOS_SUBQ_22",

-- ********************************
-- *                              *
-- *   Completing Main Quest #2   *
-- *                              *
-- ********************************

--	Main Quest #2 report back

	OnOneTimeEvent
	{
		EventName = ">>> Main Quest #2 report back <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_SUBQ_22"},
			MapTimerIsElapsed {Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			DialogSetEnabled {Tag = "norcaine_leader"},

		},
	},

--	Completing Main Quest #2

	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #2 <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_2_Completed"},

		},
		Actions =
		{

			MapTimerStart {Name = "mt_P709_FinishQuest"},

			QuestSetSolved {Quest = "IOS_MQ_2"},

		},
		
	},
	
--	Completing Main Quest #2 - XP REWARD
	
	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #2 - XP REWARD <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_2_Completed"},
	
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_P709_QuestXPRewardMQ2"},

		},

	},

--	Completing Main Quest #2 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Completing Main Quest #2 - SAVING <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_MQ_2_Completed"},
			
			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 10},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState = "IOS_MQ_2_FINISHED",

	},

};

State
{

	StateName = "IOS_MQ_2_FINISHED",

};