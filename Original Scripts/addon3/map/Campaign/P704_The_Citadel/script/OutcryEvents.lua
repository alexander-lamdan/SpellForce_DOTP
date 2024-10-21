dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

----------------
-- OUTCRY EVENTS
----------------

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
	EventName = ">>> level begin outcry <<<",
	Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P704_CS01_Intro_End"},	-- intro CS utan
		},
	Actions =
		{
				FigureOutcry	{TextTag = "Nightsong1Cry", Tag = "pl_HumanCompanionCraigHuman"},
				FigureOutcry	{TextTag = "Nightsong2Cry", Tag = "pl_HumanAvatar"},
				FigureOutcry	{TextTag = "Nightsong3Cry", Tag = "pl_HumanCompanionCraigHuman"},
		},
	},	

--
----
--

	OnOneTimeEvent
	{
	EventName = ">>> nal drommar outcry <<<",
	Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Big_Demon", Range = 20},
		},
	Actions =
		{
				FigureOutcry	{TextTag = "NalDrommar1Cry", Tag = "pl_HumanHeroCaine"},
				FigureOutcry	{TextTag = "NalDrommar2Cry", Tag = "pl_HumanAvatar"},
				FigureOutcry	{TextTag = "NalDrommar3Cry", Tag = "pl_HumanCompanionCraigHuman"},
		},
	},	

--
----
--

	OnOneTimeEvent
	{
	EventName = ">>> gate closed first outcry 1 <<<",
	Conditions = 
		{
			OR
			{
				MapTimerIsElapsed	{Name = "mt_P704_Gate2Closed", Seconds = 1 },
				MapTimerIsElapsed	{Name = "mt_P704_Gate4Closed", Seconds = 1 },
				MapTimerIsElapsed	{Name = "mt_P704_Gate5Closed", Seconds = 1 },
				MapTimerIsElapsed	{Name = "mt_P704_Gate6Closed", Seconds = 1 },
			},
		},
	Actions =
		{
				FigureOutcry	{TextTag = "DemonsClosedGateFirst1Cry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> gate closed first outcry 2 <<<",
	Conditions = 
		{
			OR
			{
				MapTimerIsElapsed	{Name = "mt_P704_Gate2Closed", Seconds = 4 },
				MapTimerIsElapsed	{Name = "mt_P704_Gate4Closed", Seconds = 4 },
				MapTimerIsElapsed	{Name = "mt_P704_Gate5Closed", Seconds = 4 },
				MapTimerIsElapsed	{Name = "mt_P704_Gate6Closed", Seconds = 4 },
			},
		},
	Actions =
		{
				FigureOutcry	{TextTag = "DemonsClosedGateFirst2Cry", Tag = "pl_HumanCompanionCraigHuman"},
		},
	},	

	OnEvent
	{
	EventName = ">>> gate 2 closed outcry <<<",
	Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P704_Gate2Closed", Seconds = 7 },
		},
	Actions =
		{
				FigureOutcry	{TextTag = "DemonsClosedGate2Cry", Tag = "pl_HumanHeroCaine"},
				MapTimerStop	{Name = "mt_P704_Gate2Closed"},
		},
	},	

	OnEvent
	{
	EventName = ">>> gate 4 closed outcry <<<",
	Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P704_Gate4Closed", Seconds = 7 },
		},
	Actions =
		{
				FigureOutcry	{TextTag = "DemonsClosedGate4Cry", Tag = "pl_HumanHeroCaine"},
				MapTimerStop	{Name = "mt_P704_Gate4Closed"},
		},
	},	

	OnEvent
	{
	EventName = ">>> gate 5 closed outcry <<<",
	Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P704_Gate5Closed", Seconds = 7 },
		},
	Actions =
		{
				FigureOutcry	{TextTag = "DemonsClosedGate5Cry", Tag = "pl_HumanHeroCaine"},
				MapTimerStop	{Name = "mt_P704_Gate5Closed"},
		},
	},	

	OnEvent
	{
	EventName = ">>> gate 6 closed outcry <<<",
	Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P704_Gate6Closed", Seconds = 7 },
		},
	Actions =
		{
				FigureOutcry	{TextTag = "DemonsClosedGate6Cry", Tag = "pl_HumanHeroCaine"},
				MapTimerStop	{Name = "mt_P704_Gate6Closed"},
		},
	},	

--
----
--

--[[
	OnOneTimeEvent
	{
	EventName = ">>> outcry gate 1 found <<<",
	Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate1", Range = 5},
				MapFlagIsFalse {Name = "mf_P704_FirstGateOrLeverFound"},
		},
	Actions =
		{
				FigureOutcry	{TextTag = "Gate1FoundCry", Tag = "pl_HumanAvatar"},
				MapFlagSetTrue {Name = "mf_P704_FirstGateOrLeverFound"},
		},
	},	
]]

	OnOneTimeEvent
	{
	EventName = ">>> outcry lever 1 found <<<",
	Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_1_Lever", Range = 5},
--				MapFlagIsFalse {Name = "mf_P704_FirstGateOrLeverFound"},
		},
	Actions =
		{
				FigureOutcry	{TextTag = "Gate1LeverFoundCry", Tag = "pl_HumanAvatar"},
--				MapFlagSetTrue {Name = "mf_P704_FirstGateOrLeverFound"},
		},
	},	


	OnOneTimeEvent
	{
	EventName = ">>> outcry lever 2 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_2_Lever", Range = 5},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "Gate2LeverFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry lever 3 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_3_Lever", Range = 5},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "Gate3LeverFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry lever 4 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_4_Lever", Range = 5},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "Gate4LeverFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry lever 5 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_5_Lever", Range = 5},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "Gate5LeverFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry lever 6 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_6_Lever", Range = 5},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "Gate6LeverFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

--
----
--

--[[
	OnOneTimeEvent
	{
	EventName = ">>> outcry artifact 1 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Artifact_S1", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_COLLECTBONES"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_COLLECTBONES"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "ArtifactFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry artifact 2 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Artifact_S2", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_COLLECTBONES"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_COLLECTBONES"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "ArtifactFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry artifact 3 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Artifact_S3", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_COLLECTBONES"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_COLLECTBONES"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "ArtifactFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> outcry artifact 4 found <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Artifact_S4", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_COLLECTBONES"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_COLLECTBONES"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "ArtifactFoundCry", Tag = "pl_HumanAvatar"},
		},
	},	
]]

--
----
--

	OnOneTimeEvent
	{
	EventName = ">>> avatar warns hostile P1 clan <<<",
	Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Defend"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_1_Leader", Range = 20},
		},
	Actions =
		{
--			FigureOutcry	{TextTag = "AnyClanHostileWhenFoundCry", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "P1ClanWarningCry", Tag = "Pact_1_Leader"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> avatar warns hostile P2 clan <<<",
	Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Defend"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_2_Leader", Range = 20},
		},
	Actions =
		{
--			FigureOutcry	{TextTag = "AnyClanHostileWhenFoundCry", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "P2ClanWarningCry", Tag = "Pact_2_Leader"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> avatar warns hostile P3 clan <<<",
	Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Defend"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_3_Leader", Range = 20},
		},
	Actions =
		{
--			FigureOutcry	{TextTag = "AnyClanHostileWhenFoundCry", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "P3ClanWarningCry", Tag = "Pact_3_Leader"},
		},
	},	

	OnOneTimeEvent
	{
	EventName = ">>> avatar warns hostile P4 clan <<<",
	Conditions = 
		{
			MapValueIsEqualToVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Defend"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_4_Leader", Range = 20},
		},
	Actions =
		{
--			FigureOutcry	{TextTag = "AnyClanHostileWhenFoundCry", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "P4ClanWarningCry", Tag = "Pact_4_Leader"},
		},
	},	

--
----
--

-- ezek az outcry-ok megsem lesznek
--[[
	OnOneTimeRepeatEvent
	{
	Name = "Event_P1_WarningOutcry",
	EventName = ">>> P1 clan warns avatar <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_1_Leader", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "P1ClanWarningCry", Tag = "Pact_1_Leader"},
			MapTimerStart	{Name = "mt_P704_WarningOutcryTimer"},
		},
	},	

	OnOneTimeRepeatEvent
	{
	Name = "Event_P2_WarningOutcry",
	EventName = ">>> P2 clan warns avatar <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_2_Leader", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "P2ClanWarningCry", Tag = "Pact_2_Leader"},
			MapTimerStart	{Name = "mt_P704_WarningOutcryTimer"},
		},
	},	

	OnOneTimeRepeatEvent
	{
	Name = "Event_P3_WarningOutcry",
	EventName = ">>> P3 clan warns avatar <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_3_Leader", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "P3ClanWarningCry", Tag = "Pact_3_Leader"},
			MapTimerStart	{Name = "mt_P704_WarningOutcryTimer"},
		},
	},	

	OnOneTimeRepeatEvent
	{
	Name = "Event_P4_WarningOutcry",
	EventName = ">>> P4 clan warns avatar <<<",
	Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_4_Leader", Range = 20},
			OR
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4"},
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
			},
		},
	Actions =
		{
			FigureOutcry	{TextTag = "P4ClanWarningCry", Tag = "Pact_4_Leader"},
			MapTimerStart	{Name = "mt_P704_WarningOutcryTimer"},
		},
	},	


	OnEvent
	{
	EventName = ">>> warning outcry reenable <<<",
	Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_WarningOutcryTimer", Seconds = 120},
		},
	Actions =
		{
			MapTimerStop	{Name = "mt_P704_WarningOutcryTimer"},
			EventReEnable	{Name = "Event_P1_WarningOutcry"},
			EventReEnable	{Name = "Event_P2_WarningOutcry"},
			EventReEnable	{Name = "Event_P3_WarningOutcry"},
			EventReEnable	{Name = "Event_P4_WarningOutcry"},
		},
	},	
]]

}
