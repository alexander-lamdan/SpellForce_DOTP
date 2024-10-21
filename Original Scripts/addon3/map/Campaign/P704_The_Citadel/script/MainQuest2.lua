dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

-- MainQuests for pact 2 clan

State
{
	StateName = "QuestBook",


------------------------------------------
-- MQ2A
------------------------------------------

	OnToggleEvent
	{
		EventName = ">>> TC_MQ2A_WIPEP1 toggled! <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ2A_Accepted"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_OPENGATE2"},
				EventReEnable	{Name = "Event_MQ2A_WIPEP1_OPENGATE2_Done"},

				-- unitok megjelennek es elindulnak
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P1_Through_Nameless"},
				FogOfWarTeamAdd	{Team = "tm_Team2"},
				FogOfWarRevealAtEntity	{FogOfWarId = 2, Tag = "Pact_2_Leader", Range = 50, Height = 5},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ2A_Accepted"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_OPENGATE2"},
				FogOfWarTeamRemove	{Team = "tm_Team2"},
				FogOfWarCloak	{FogOfWarId = 2 },
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ2A_WIPEP1_TALKP3 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP3"},
				EventReEnable	{Name = "Event_MQ2A_WIPEP1_TALKP3_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP3"},
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ2A_WIPEP1_TALKP4 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP4"},
				EventReEnable	{Name = "Event_MQ2A_WIPEP1_TALKP4_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP4"},
			},
	},

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2A_WIPEP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				BuildingIsDead	{Tag = "Pact_1_Building_1"},
				BuildingIsDead	{Tag = "Pact_1_Building_2"},
				BuildingIsDead	{Tag = "Pact_1_Building_3"},
				FigureIsDead	{Tag = "Pact_1_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact1", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact1", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1_OPENGATE2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP3"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP4"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
				MapFlagSetTrue	{Name = "mf_P704_MQ2A_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate2"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P3 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P4"},
				-- P4 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P2"},
				-- P2 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P3"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2A_WIPEP1_TALKP3_Done",
		EventName = ">>> TC_MQ2A_WIPEP1_TALKP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP3"},
				MapFlagIsTrue {Name = "mf_P704_MQ2A_P3LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP3"},

				-- P3 team aggrozza a P1-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P1"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2A_WIPEP1_TALKP4_Done",
		EventName = ">>> TC_MQ2A_WIPEP1_TALKP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP4"},
				MapFlagIsTrue {Name = "mf_P704_MQ2A_P4LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1_TALKP4"},

				-- P4 team aggrozza a P1-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P1"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2A_WIPEP1_OPENGATE2_Done",
		EventName = ">>> TC_MQ2A_WIPEP1_OPENGATE2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2A_WIPEP1_OPENGATE2"},
				GateIsOpen	{Tag = "Gate2"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1_OPENGATE2"},
				LeverSetDisabled	{Tag = "Gate_2_Lever"},
				-- P2 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P1_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP2Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ2B
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ2B_WIPEP3 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ2B_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_TALKP4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE5"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE6"},
				EventReEnable	{Name = "Event_MQ2B_WIPEP3_TALKP4_Done"},
				EventReEnable	{Name = "Event_MQ2B_WIPEP3_OPENGATE5_Done"},
				EventReEnable	{Name = "Event_MQ2B_WIPEP3_OPENGATE6_Done"},
				EventReEnable	{Name = "Event_OPENGATE5_OPENGATE6_Done"},

				-- P2 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P3"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ2B_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_TALKP4"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE5"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE6"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ2B_WIPEP3_FINDS2 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_RETRIEVES2P2"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_FINDS2"},
				EventReEnable	{Name = "Event_MQ2B_WIPEP3_FINDS2_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_FINDS2"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2B_WIPEP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				BuildingIsDead	{Tag = "Pact_3_Building_1"},
				BuildingIsDead	{Tag = "Pact_3_Building_2"},
				BuildingIsDead	{Tag = "Pact_3_Building_3"},
				FigureIsDead	{Tag = "Pact_3_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact3", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact3", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_TALKP4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_FINDS2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_RETRIEVES2P2"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3"},
				MapFlagSetTrue	{Name = "mf_P704_MQ2B_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate5"},
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P2 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P4"},
				-- P4 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P2"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2B_WIPEP3_TALKP4_Done",
		EventName = ">>> TC_MQ2B_WIPEP3_TALKP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_TALKP4"},
				MapFlagIsTrue {Name = "mf_P704_MQ2B_P4LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_TALKP4"},

				-- P4 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P3"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2B_WIPEP3_OPENGATE5_Done",
		EventName = ">>> TC_MQ2B_WIPEP3_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2B_WIPEP3_OPENGATE6_Done",
		EventName = ">>> TC_MQ2B_WIPEP3_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_OPENGATE5_OPENGATE6_Done",
		EventName = "OPENGATE5 and OPENGATE6 done, new P2 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE5"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_OPENGATE6"},
			},
		Actions =
			{
				-- P2 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP2Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	


	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2B_WIPEP3_FINDS2_Done",
		EventName = ">>> TC_MQ2B_WIPEP3_FINDS2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_FINDS2"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_FINDS2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_RETRIEVES2P2"},

--				FigureOutcry	{TextTag = "BonesRetrieveP2Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2B_WIPEP3_RETRIEVES2P2 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP2"},	-- Pact_2_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ2B_WIPEP3_RETRIEVES2P2"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2B_WIPEP3_RETRIEVES2P2"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p2 unit upgrade
				MapValueSet	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P2_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ2C
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ2C_WIPEP4 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ2C_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_TALKP3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_OPENGATE5"},
				EventReEnable	{Name = "Event_MQ2C_WIPEP4_TALKP3_Done"},
				EventReEnable	{Name = "Event_MQ2C_WIPEP4_OPENGATE5_Done"},

				-- P2 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P4"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ2C_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_TALKP3"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_OPENGATE5"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ2C_WIPEP4_FINDS2 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_RETRIEVES2P2"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_FINDS2"},
				EventReEnable	{Name = "Event_MQ2C_WIPEP4_FINDS2_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_FINDS2"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2C_WIPEP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				BuildingIsDead	{Tag = "Pact_4_Building_1"},
				BuildingIsDead	{Tag = "Pact_4_Building_2"},
				BuildingIsDead	{Tag = "Pact_4_Building_3"},
				FigureIsDead	{Tag = "Pact_4_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact4", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact4", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_TALKP3"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_FINDS2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_RETRIEVES2P2"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4"},
				MapFlagSetTrue	{Name = "mf_P704_MQ2C_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate5"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P3 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P2"},
				-- P2 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P3"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2C_WIPEP4_TALKP3_Done",
		EventName = ">>> TC_MQ2C_WIPEP4_TALKP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_TALKP3"},
				MapFlagIsTrue {Name = "mf_P704_MQ2C_P3LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_TALKP3"},

				-- P3 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P4"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2C_WIPEP4_OPENGATE5_Done",
		EventName = ">>> TC_MQ2C_WIPEP4_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},
				-- P2 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP2Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ2C_WIPEP4_FINDS2_Done",
		EventName = ">>> TC_MQ2C_WIPEP4_FINDS2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_FINDS2"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_FINDS2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_RETRIEVES2P2"},

--				FigureOutcry	{TextTag = "BonesRetrieveP2Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2C_WIPEP4_RETRIEVES2P2 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP2"},	-- Pact_2_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ2C_WIPEP4_RETRIEVES2P2"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2C_WIPEP4_RETRIEVES2P2"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p2 unit upgrade
				MapValueSet	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P2_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ2D
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2D_WIPEP3 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ2D_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ2D_WIPEP3"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE5"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_1", DropChance = 100, ItemId = 678},

				-- P2 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P3"},

				-- p3 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P3"},
				DialogSetDisabled	{Tag = "Pact_3_Leader"},
				FigureTeamTransfer	{Tag = "Pact_3_Leader", Team = "tm_Team3"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2D_WIPEP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3"},
				BuildingIsDead	{Tag = "Pact_3_Building_1"},
				BuildingIsDead	{Tag = "Pact_3_Building_2"},
				BuildingIsDead	{Tag = "Pact_3_Building_3"},
				FigureIsDead	{Tag = "Pact_3_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact3", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact3", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_RETRIEVEBONESP2"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3"},
				MapFlagSetTrue	{Name = "mf_P704_MQ2D_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate5"},
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2D_WIPEP3_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2D_WIPEP3_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = "OPENGATE5 and OPENGATE6 done, new P2 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE5"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_OPENGATE6"},
			},
		Actions =
			{
				-- P2 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP2Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2D_WIPEP3_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 678, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_RETRIEVEBONESP2"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP2Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2D_WIPEP3_RETRIEVEBONESP2 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP2"},	-- Pact_2_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ2D_WIPEP3_RETRIEVEBONESP2"},
				AvatarHasItemMisc	{Player = "default", ItemId = 678, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3_RETRIEVEBONESP2"},
				AvatarItemMiscTake	{Player = "default", ItemId = 678, Amount = 1},

				-- p2 unit upgrade
				MapValueSet	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P2_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ2E
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2E_WIPEP4 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ2E_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ2E_WIPEP4"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_OPENGATE5"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_COLLECTBONES"},
	
				FigureLootItemMiscAdd {Tag = "Grave_Leader_1", DropChance = 100, ItemId = 678},

				-- P2 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P4"},

				-- p4 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P4"},
				DialogSetDisabled	{Tag = "Pact_4_Leader"},
				FigureTeamTransfer	{Tag = "Pact_4_Leader", Team = "tm_Team4"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2E_WIPEP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4"},
				BuildingIsDead	{Tag = "Pact_4_Building_1"},
				BuildingIsDead	{Tag = "Pact_4_Building_2"},
				BuildingIsDead	{Tag = "Pact_4_Building_3"},
				FigureIsDead	{Tag = "Pact_4_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact4", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact4", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_RETRIEVEBONESP2"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4"},
				MapFlagSetTrue	{Name = "mf_P704_MQ2E_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate5"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2E_WIPEP4_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},
				-- P2 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP2Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2E_WIPEP4_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 678, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_RETRIEVEBONESP2"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP2Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ2E_WIPEP4_RETRIEVEBONESP2 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP2"},	-- Pact_2_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ2E_WIPEP4_RETRIEVEBONESP2"},
				AvatarHasItemMisc	{Player = "default", ItemId = 678, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4_RETRIEVEBONESP2"},
				AvatarItemMiscTake	{Player = "default", ItemId = 678, Amount = 1},

				-- p2 unit upgrade
				MapValueSet	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P2_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ6
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ6_TALKP2 active <<<",
		Conditions = 
			{
				OR
				{
					QuestIsSolved	{Player = "default", Quest = "TC_MQ2D_WIPEP3"},
					QuestIsSolved	{Player = "default", Quest = "TC_MQ2E_WIPEP4"},
					AND
					{
						QuestIsSolved	{Player = "default", Quest = "TC_MQ2A_WIPEP1"},
						FigureIsAlive	{Tag = "Pact_2_Leader"},
						MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 1 },
					},
				},
--				FigureIsAlive	{Tag = "Pact_2_Leader"},
--				FigureIsDead	{Tag = "Pact_1_Leader"},
--				FigureIsDead	{Tag = "Pact_3_Leader"},
--				FigureIsDead	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				MapFlagSetTrue	{Name = "mf_P704_MQ6_Accepted"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ6_TALKP2"},
--				FigureOutcry	{TextTag = "LastRemainedClanP2Cry", Tag = "pl_HumanAvatar"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ6_TALKP2 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_P2LeaderTalkedLast"},		-- P2 leader utolso dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ6_TALKP2"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
			},

		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ6_TALKP2"},

				MapFlagSetTrue{Name = "mf_P704_LibraryPortal_Enabled"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

}
