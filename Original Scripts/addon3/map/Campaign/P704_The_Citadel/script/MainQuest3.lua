dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

-- MainQuests for pact 3 clan

State
{
	StateName = "QuestBook",


------------------------------------------
-- MQ3A
------------------------------------------

	OnToggleEvent
	{
		EventName = ">>> TC_MQ3A_WIPEP4 toggled! <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ3A_Accepted"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_OPENGATE6"},
				EventReEnable	{Name = "Event_MQ3A_WIPEP4_OPENGATE6_Done"},

				-- unitok megjelennek es elindulnak
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P4_Through_Nameless"},
				FogOfWarTeamAdd	{Team = "tm_Team3"},
				FogOfWarRevealAtEntity	{FogOfWarId = 3, Tag = "Pact_3_Leader", Range = 50, Height = 5},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ3A_Accepted"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_OPENGATE6"},
				FogOfWarTeamRemove	{Team = "tm_Team3"},
				FogOfWarCloak	{FogOfWarId = 3 },
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ3A_WIPEP4_TALKP1 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP1"},
				EventReEnable	{Name = "Event_MQ3A_WIPEP4_TALKP1_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP1"},
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ3A_WIPEP4_TALKP2 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP2"},
				EventReEnable	{Name = "Event_MQ3A_WIPEP4_TALKP2_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP2"},
			},
	},

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3A_WIPEP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				BuildingIsDead	{Tag = "Pact_4_Building_1"},
				BuildingIsDead	{Tag = "Pact_4_Building_2"},
				BuildingIsDead	{Tag = "Pact_4_Building_3"},
				FigureIsDead	{Tag = "Pact_4_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact4", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact4", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP2"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
				MapFlagSetTrue	{Name = "mf_P704_MQ3A_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

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
				-- P1 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P3"},
				-- P2 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P1"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3A_WIPEP4_TALKP1_Done",
		EventName = ">>> TC_MQ3A_WIPEP4_TALKP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP1"},
				MapFlagIsTrue {Name = "mf_P704_MQ3A_P1LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP1"},

				-- P1 team aggrozza a P4-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P4"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3A_WIPEP4_TALKP2_Done",
		EventName = ">>> TC_MQ3A_WIPEP4_TALKP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP2"},
				MapFlagIsTrue {Name = "mf_P704_MQ3A_P2LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4_TALKP2"},

				-- P2 team aggrozza a P4-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P4"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3A_WIPEP4_OPENGATE6_Done",
		EventName = ">>> TC_MQ3A_WIPEP4_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3A_WIPEP4_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},
				-- P3 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P4_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP3Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ3B
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ3B_WIPEP1 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ3B_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
			},

		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_TALKP2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_OPENGATE4"},
				EventReEnable	{Name = "Event_MQ3B_WIPEP1_TALKP2_Done"},
				EventReEnable	{Name = "Event_MQ3B_WIPEP1_OPENGATE4_Done"},

				-- P3 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P1"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ3B_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_TALKP2"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_OPENGATE4"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ3B_WIPEP1_FINDS1 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_RETRIEVES1P3"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_FINDS1"},
				EventReEnable	{Name = "Event_MQ3B_WIPEP1_FINDS1_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_FINDS1"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3B_WIPEP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				BuildingIsDead	{Tag = "Pact_1_Building_1"},
				BuildingIsDead	{Tag = "Pact_1_Building_2"},
				BuildingIsDead	{Tag = "Pact_1_Building_3"},
				FigureIsDead	{Tag = "Pact_1_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact1", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact1", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_TALKP2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_FINDS1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_RETRIEVES1P3"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1"},
				MapFlagSetTrue	{Name = "mf_P704_MQ3B_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate4"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P2 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P3"},
				-- P3 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P2"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3B_WIPEP1_TALKP2_Done",
		EventName = ">>> TC_MQ3B_WIPEP1_TALKP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_TALKP2"},
				MapFlagIsTrue {Name = "mf_P704_MQ3B_P2LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_TALKP2"},

				-- P2 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P1"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3B_WIPEP1_OPENGATE4_Done",
		EventName = ">>> TC_MQ3B_WIPEP1_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},
				-- P3 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP3Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3B_WIPEP1_FINDS1_Done",
		EventName = ">>> TC_MQ3B_WIPEP1_FINDS1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_FINDS1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_FINDS1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_RETRIEVES1P3"},

--				FigureOutcry	{TextTag = "BonesRetrieveP3Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3B_WIPEP1_RETRIEVES1P3 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP3"},	-- Pact_3_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ3B_WIPEP1_RETRIEVES1P3"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3B_WIPEP1_RETRIEVES1P3"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p3 unit upgrade
				MapValueSet	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P3_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ3C
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ3C_WIPEP2 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ3C_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_TALKP1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE5"},
				EventReEnable	{Name = "Event_MQ3C_WIPEP2_TALKP1_Done"},
				EventReEnable	{Name = "Event_MQ3C_WIPEP2_OPENGATE6_Done"},
				EventReEnable	{Name = "Event_MQ3C_WIPEP2_OPENGATE5_Done"},
				EventReEnable	{Name = "Event_OPENGATE6_OPENGATE5_Done"},

				-- P3 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P2"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ3C_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_TALKP1"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE6"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE5"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ3C_WIPEP2_FINDS1 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_RETRIEVES1P3"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_FINDS1"},
				EventReEnable	{Name = "Event_MQ3C_WIPEP2_FINDS1_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_FINDS1"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3C_WIPEP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				BuildingIsDead	{Tag = "Pact_2_Building_1"},
				BuildingIsDead	{Tag = "Pact_2_Building_2"},
				BuildingIsDead	{Tag = "Pact_2_Building_3"},
				FigureIsDead	{Tag = "Pact_2_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact2", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact2", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_TALKP1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_FINDS1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_RETRIEVES1P3"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2"},
				MapFlagSetTrue	{Name = "mf_P704_MQ3C_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate5"},
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P3 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P1"},
				-- P1 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P3"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3C_WIPEP2_TALKP1_Done",
		EventName = ">>> TC_MQ3C_WIPEP2_TALKP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_TALKP1"},
				MapFlagIsTrue {Name = "mf_P704_MQ3C_P1LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_TALKP1"},

				-- P1 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P2"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3C_WIPEP2_OPENGATE5_Done",
		EventName = ">>> TC_MQ3C_WIPEP2_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3C_WIPEP2_OPENGATE6_Done",
		EventName = ">>> TC_MQ3C_WIPEP2_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_OPENGATE6_OPENGATE5_Done",
		EventName = "OPENGATE6 and OPENGATE5 done, new P3 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE6"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_OPENGATE5"},
			},
		Actions =
			{
				-- P3 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP3Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ3C_WIPEP2_FINDS1_Done",
		EventName = ">>> TC_MQ3C_WIPEP2_FINDS1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_FINDS1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_FINDS1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_RETRIEVES1P3"},

--				FigureOutcry	{TextTag = "BonesRetrieveP3Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3C_WIPEP2_RETRIEVES1P3 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP3"},	-- Pact_3_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ3C_WIPEP2_RETRIEVES1P3"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3C_WIPEP2_RETRIEVES1P3"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p3 unit upgrade
				MapValueSet	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P3_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ3D
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3D_WIPEP1 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ3D_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ3D_WIPEP1"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_OPENGATE4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_4", DropChance = 100, ItemId = 679},

				-- P3 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P1"},

				-- p1 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P1"},
				DialogSetDisabled	{Tag = "Pact_1_Leader"},
				FigureTeamTransfer	{Tag = "Pact_1_Leader", Team = "tm_Team1"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3D_WIPEP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1"},
				BuildingIsDead	{Tag = "Pact_1_Building_1"},
				BuildingIsDead	{Tag = "Pact_1_Building_2"},
				BuildingIsDead	{Tag = "Pact_1_Building_3"},
				FigureIsDead	{Tag = "Pact_1_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact1", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact1", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_RETRIEVEBONESP3"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1"},
				MapFlagSetTrue	{Name = "mf_P704_MQ3D_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate4"},

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
		EventName = ">>> TC_MQ3D_WIPEP1_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},
				-- P3 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP3Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3D_WIPEP1_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 679, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_RETRIEVEBONESP3"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP3Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3D_WIPEP1_RETRIEVEBONESP3 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP3"},	-- Pact_3_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ3D_WIPEP1_RETRIEVEBONESP3"},
				AvatarHasItemMisc	{Player = "default", ItemId = 679, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1_RETRIEVEBONESP3"},
				AvatarItemMiscTake	{Player = "default", ItemId = 679, Amount = 1},

				-- p3 unit upgrade
				MapValueSet	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P3_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ3E
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3E_WIPEP2 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ3E_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ3E_WIPEP2"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE5"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_4", DropChance = 100, ItemId = 679},

				-- P3 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P2"},

				-- p2 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P2"},
				DialogSetDisabled	{Tag = "Pact_2_Leader"},
				FigureTeamTransfer	{Tag = "Pact_2_Leader", Team = "tm_Team2"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3E_WIPEP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2"},
				BuildingIsDead	{Tag = "Pact_2_Building_1"},
				BuildingIsDead	{Tag = "Pact_2_Building_2"},
				BuildingIsDead	{Tag = "Pact_2_Building_3"},
				FigureIsDead	{Tag = "Pact_2_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact2", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact2", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_RETRIEVEBONESP3"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2"},
				MapFlagSetTrue	{Name = "mf_P704_MQ3E_Completed"},

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
		EventName = ">>> TC_MQ3E_WIPEP2_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3E_WIPEP2_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = "OPENGATE5 and OPENGATE6 done, new P3 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE5"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_OPENGATE6"},
			},
		Actions =
			{
				-- P3 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP3Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3E_WIPEP2_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 679, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_RETRIEVEBONESP3"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP3Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ3E_WIPEP2_RETRIEVEBONESP3 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP3"},	-- Pact_3_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ3E_WIPEP2_RETRIEVEBONESP3"},
				AvatarHasItemMisc	{Player = "default", ItemId = 679, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2_RETRIEVEBONESP3"},
				AvatarItemMiscTake	{Player = "default", ItemId = 679, Amount = 1},

				-- p3 unit upgrade
				MapValueSet	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P3_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ7
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ7_TALKP3 active <<<",
		Conditions = 
			{
				OR
				{
					QuestIsSolved	{Player = "default", Quest = "TC_MQ3D_WIPEP1"},
					QuestIsSolved	{Player = "default", Quest = "TC_MQ3E_WIPEP2"},
					AND
					{
						QuestIsSolved	{Player = "default", Quest = "TC_MQ3A_WIPEP4"},
						FigureIsAlive	{Tag = "Pact_3_Leader"},
						MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 1 },
					},
				},
--				FigureIsAlive	{Tag = "Pact_3_Leader"},
--				FigureIsDead	{Tag = "Pact_1_Leader"},
--				FigureIsDead	{Tag = "Pact_2_Leader"},
--				FigureIsDead	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				MapFlagSetTrue	{Name = "mf_P704_MQ7_Accepted"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ7_TALKP3"},
--				FigureOutcry	{TextTag = "LastRemainedClanP3Cry", Tag = "pl_HumanAvatar"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ7_TALKP3 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_P3LeaderTalkedLast"},		-- P3 leader utolso dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ7_TALKP3"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
			},

		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ7_TALKP3"},

				MapFlagSetTrue{Name = "mf_P704_LibraryPortal_Enabled"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

}
