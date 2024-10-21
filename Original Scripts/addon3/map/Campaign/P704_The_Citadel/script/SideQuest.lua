dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

State
{
	StateName = "QuestBook",

--------------------
-- SIDE QUEST
--------------------

--
-- naldrommar kill
--

	OnOneTimeEvent
	{
	EventName = ">>> nal drommar killed <<<",
	Conditions = 
		{
				FigureIsDead	{Tag = "Big_Demon"},
		},
	Actions =
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.NalDrommar.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.NalDrommar.Gold },
			AvatarXPGive	{Player = "default", Amount = Reward.NalDrommar.XP },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.NalDrommar.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.NalDrommar.Gold},
--			AvatarItemMiscGive	{Player = "default", ItemId = xx, Amount = 1},
		},
	},	

--
-- flink side quest (from previous levels)
--
--[[
	OnOneTimeEvent
	{
		EventName = ">>> flink quest solved, lever set <<<",
		Conditions = 
		{
			-- TODO: KIJAVITANI A JO QUESTRE
			QuestIsSolved	{Player = "default", Quest = "WGA3_SIDEQ_1"},
			MapTimerIsElapsed	{Name = "mt_P704_General_Timer", Seconds = 2 },	-- bugjavitas miatt: hogy biztosan enabled legyen
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Flink_Lever"},
			LeverSetEnabled	{Tag = "Flink_Lever"},
		},
	},
]]

--
-- assistant sidequest (for next levels)
--

	OnOneTimeEvent
	{
		EventName = "sidequest 1 active (assistant)",
		Conditions = 
		{
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_FINDS1"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_FINDS1"},
			},
		},
		Actions = 
		{
			QuestSetActive	{Player = "default", Quest = "TC_SQ1_ASSISTANT"},
		},
	},

--
-- nightsong sidequest (from previous levels)
--

-- grave inits
	OnOneTimeEvent
	{
		EventName = "pact 1 leader dead and graved",
		Conditions = 
		{
--			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			FigureIsDead	{Tag = "Pact_1_Leader"},
			MapTimerIsElapsed	{Name = "mt_P704_General_Timer", Seconds = 20 },	-- ne egybol a halal utan jelenjen meg
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P704_Grave1_DialogEnabled"},
			MapTimerStop	{Name = "mt_P704_General_Timer"},
--			DialogSetEnabled	{Tag = "Grave_Leader_1"},
			ObjectSpawnToEntity	{ObjectId = 697, TargetTag = "Grave_Leader_1", Direction = 0, Tag = "default"},
		},
	},

	OnOneTimeEvent
	{
		EventName = "pact 2 leader dead and graved",
		Conditions = 
		{
--			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			FigureIsDead	{Tag = "Pact_2_Leader"},
			MapTimerIsElapsed	{Name = "mt_P704_General_Timer", Seconds = 20 },	-- ne egybol a halal utan jelenjen meg
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P704_Grave2_DialogEnabled"},
			MapTimerStop	{Name = "mt_P704_General_Timer"},
--			DialogSetEnabled	{Tag = "Grave_Leader_2"},
			ObjectSpawnToEntity	{ObjectId = 697, TargetTag = "Grave_Leader_2", Direction = 0, Tag = "default"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "pact 3 leader dead and graved",
		Conditions = 
		{
--			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			FigureIsDead	{Tag = "Pact_3_Leader"},
			MapTimerIsElapsed	{Name = "mt_P704_General_Timer", Seconds = 20 },	-- ne egybol a halal utan jelenjen meg
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P704_Grave3_DialogEnabled"},
			MapTimerStop	{Name = "mt_P704_General_Timer"},
--			DialogSetEnabled	{Tag = "Grave_Leader_3"},
			ObjectSpawnToEntity	{ObjectId = 697, TargetTag = "Grave_Leader_3", Direction = 0, Tag = "default"},
		},
	},


	OnOneTimeEvent
	{
		EventName = "pact 4 leader dead and graved",
		Conditions = 
		{
--			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			FigureIsDead	{Tag = "Pact_4_Leader"},
			MapTimerIsElapsed	{Name = "mt_P704_General_Timer", Seconds = 20 },	-- ne egybol a halal utan jelenjen meg
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P704_Grave4_DialogEnabled"},
			MapTimerStop	{Name = "mt_P704_General_Timer"},
--			DialogSetEnabled	{Tag = "Grave_Leader_4"},
			ObjectSpawnToEntity	{ObjectId = 697, TargetTag = "Grave_Leader_4", Direction = 0, Tag = "default"},
		},
	},

-- grave dialog enabled
	OnOneTimeEvent
	{
		EventName = "grave 1 dialog enable",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			MapFlagIsTrue{Name = "mf_P704_Grave1_DialogEnabled"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Grave_Leader_1"},
		},
	},

	OnOneTimeEvent
	{
		EventName = "grave 2 dialog enable",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			MapFlagIsTrue{Name = "mf_P704_Grave2_DialogEnabled"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Grave_Leader_2"},
		},
	},

	OnOneTimeEvent
	{
		EventName = "grave 3 dialog enable",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			MapFlagIsTrue{Name = "mf_P704_Grave3_DialogEnabled"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Grave_Leader_3"},
		},
	},

	OnOneTimeEvent
	{
		EventName = "grave 4 dialog enable",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			MapFlagIsTrue{Name = "mf_P704_Grave4_DialogEnabled"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Grave_Leader_4"},
		},
	},

-- sword taken
	OnOneTimeEvent
	{
		EventName = "sidequest 2 sword 1 taken (graves)",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P704_Grave_1_Searched"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 735, Amount = 1},
		},
	},

	OnOneTimeEvent
	{
		EventName = "sidequest 2 sword 2 taken (graves)",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P704_Grave_2_Searched"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 735, Amount = 1},
		},
	},

	OnOneTimeEvent
	{
		EventName = "sidequest 2 sword 3 taken (graves)",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P704_Grave_3_Searched"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 735, Amount = 1},
		},
	},

	OnOneTimeEvent
	{
		EventName = "sidequest 2 sword 4 taken (graves)",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P704_Grave_4_Searched"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "default", ItemId = 735, Amount = 1},
		},
	},

-- sidequest done
	OnOneTimeEvent
	{
		EventName = "sidequest 2 done (graves)",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_1"},
			AvatarHasItemMisc	{Player = "default", ItemId = 735, Amount = 3},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_05_1"},
		},
	},
	
}
