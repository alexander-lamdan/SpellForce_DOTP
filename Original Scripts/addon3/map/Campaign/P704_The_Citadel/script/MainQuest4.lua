dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

-- MainQuests for pact 4 clan

State
{
	StateName = "QuestBook",


------------------------------------------
-- MQ4A
------------------------------------------

	OnToggleEvent
	{
		EventName = ">>> TC_MQ4A_WIPEP2 toggled! <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ4A_Accepted"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_OPENGATE5"},
				EventReEnable	{Name = "Event_MQ4A_WIPEP2_OPENGATE5_Done"},

				-- unitok megjelennek es elindulnak
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
				FogOfWarTeamAdd	{Team = "tm_Team4"},
				FogOfWarRevealAtEntity	{FogOfWarId = 4, Tag = "Pact_4_Leader", Range = 50, Height = 5},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ4A_Accepted"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_OPENGATE5"},
				FogOfWarTeamRemove	{Team = "tm_Team4"},
				FogOfWarCloak	{FogOfWarId = 4 },
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ4A_WIPEP2_TALKP3 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP3"},
				EventReEnable	{Name = "Event_MQ4A_WIPEP2_TALKP3_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP3"},
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ4A_WIPEP2_TALKP1 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP1"},
				EventReEnable	{Name = "Event_MQ4A_WIPEP2_TALKP1_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP1"},
			},
	},

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4A_WIPEP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				BuildingIsDead	{Tag = "Pact_2_Building_1"},
				BuildingIsDead	{Tag = "Pact_2_Building_2"},
				BuildingIsDead	{Tag = "Pact_2_Building_3"},
				FigureIsDead	{Tag = "Pact_2_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact2", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact2", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2_OPENGATE5"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP3"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
				MapFlagSetTrue	{Name = "mf_P704_MQ4A_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate5"},

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
				-- P4 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P1"},
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
		Name = "Event_MQ4A_WIPEP2_TALKP3_Done",
		EventName = ">>> TC_MQ4A_WIPEP2_TALKP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP3"},
				MapFlagIsTrue {Name = "mf_P704_MQ4A_P3LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP3"},

				-- P3 team aggrozza a P2-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P2"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4A_WIPEP2_TALKP1_Done",
		EventName = ">>> TC_MQ4A_WIPEP2_TALKP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP1"},
				MapFlagIsTrue {Name = "mf_P704_MQ4A_P1LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2_TALKP1"},

				-- P1 team aggrozza a P2-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P2"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4A_WIPEP2_OPENGATE5_Done",
		EventName = ">>> TC_MQ4A_WIPEP2_OPENGATE5 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4A_WIPEP2_OPENGATE5"},
				GateIsOpen	{Tag = "Gate5"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2_OPENGATE5"},
				LeverSetDisabled	{Tag = "Gate_5_Lever"},
				-- P4 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP4Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ4B
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ4B_WIPEP1 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ4B_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_TALKP3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE4"},
				EventReEnable	{Name = "Event_MQ4B_WIPEP1_TALKP3_Done"},
				EventReEnable	{Name = "Event_MQ4B_WIPEP1_OPENGATE6_Done"},
				EventReEnable	{Name = "Event_MQ4B_WIPEP1_OPENGATE4_Done"},
				EventReEnable	{Name = "Event_OPENGATE6_OPENGATE4_Done"},

				-- P4 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P1"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ4B_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_TALKP3"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE6"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE4"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ4B_WIPEP1_FINDS3 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_RETRIEVES3P4"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_FINDS3"},
				EventReEnable	{Name = "Event_MQ4B_WIPEP1_FINDS3_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_FINDS3"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4B_WIPEP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				BuildingIsDead	{Tag = "Pact_1_Building_1"},
				BuildingIsDead	{Tag = "Pact_1_Building_2"},
				BuildingIsDead	{Tag = "Pact_1_Building_3"},
				FigureIsDead	{Tag = "Pact_1_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact1", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact1", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_TALKP3"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_FINDS3"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_RETRIEVES3P4"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1"},
				MapFlagSetTrue	{Name = "mf_P704_MQ4B_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate4"},
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

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
		Name = "Event_MQ4B_WIPEP1_TALKP3_Done",
		EventName = ">>> TC_MQ4B_WIPEP1_TALKP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_TALKP3"},
				MapFlagIsTrue {Name = "mf_P704_MQ4B_P3LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_TALKP3"},

				-- P3 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P3_Move_P1"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4B_WIPEP1_OPENGATE4_Done",
		EventName = ">>> TC_MQ4B_WIPEP1_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4B_WIPEP1_OPENGATE6_Done",
		EventName = ">>> TC_MQ4B_WIPEP1_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_OPENGATE6_OPENGATE4_Done",
		EventName = "OPENGATE6 and OPENGATE4 done, new P4 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE6"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_OPENGATE4"},
			},
		Actions =
			{
				-- P4 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP4Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	


	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4B_WIPEP1_FINDS3_Done",
		EventName = ">>> TC_MQ4B_WIPEP1_FINDS3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_FINDS3"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_FINDS3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_RETRIEVES3P4"},

--				FigureOutcry	{TextTag = "BonesRetrieveP4Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4B_WIPEP1_RETRIEVES3P4 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP4"},	-- Pact_4_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ4B_WIPEP1_RETRIEVES3P4"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4B_WIPEP1_RETRIEVES3P4"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p4 unit upgrade
				MapValueSet	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P4_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ4C
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ4C_WIPEP3 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ4C_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_TALKP1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_OPENGATE6"},
				EventReEnable	{Name = "Event_MQ4C_WIPEP3_TALKP1_Done"},
				EventReEnable	{Name = "Event_MQ4C_WIPEP3_OPENGATE6_Done"},

				-- P4 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P3"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ4C_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_TALKP1"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_OPENGATE6"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ4C_WIPEP3_FINDS3 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_RETRIEVES3P4"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_FINDS3"},
				EventReEnable	{Name = "Event_MQ4C_WIPEP3_FINDS3_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_FINDS3"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4C_WIPEP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				BuildingIsDead	{Tag = "Pact_3_Building_1"},
				BuildingIsDead	{Tag = "Pact_3_Building_2"},
				BuildingIsDead	{Tag = "Pact_3_Building_3"},
				FigureIsDead	{Tag = "Pact_3_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact3", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact3", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_TALKP1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_FINDS3"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_RETRIEVES3P4"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3"},
				MapFlagSetTrue	{Name = "mf_P704_MQ4C_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P4 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P1"},
				-- P1 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P4"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4C_WIPEP3_TALKP1_Done",
		EventName = ">>> TC_MQ4C_WIPEP3_TALKP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_TALKP1"},
				MapFlagIsTrue {Name = "mf_P704_MQ4C_P1LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_TALKP1"},

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
		Name = "Event_MQ4C_WIPEP3_OPENGATE6_Done",
		EventName = ">>> TC_MQ4C_WIPEP3_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},
				-- P4 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP4Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ4C_WIPEP3_FINDS3_Done",
		EventName = ">>> TC_MQ4C_WIPEP3_FINDS3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_FINDS3"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_FINDS3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_RETRIEVES3P4"},

--				FigureOutcry	{TextTag = "BonesRetrieveP4Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4C_WIPEP3_RETRIEVES3P4 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP4"},	-- Pact_4_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ4C_WIPEP3_RETRIEVES3P4"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4C_WIPEP3_RETRIEVES3P4"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p4 unit upgrade
				MapValueSet	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P4_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ4D
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4D_WIPEP3 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ4D_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ4D_WIPEP3"},
				FigureIsAlive	{Tag = "Pact_3_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_2", DropChance = 100, ItemId = 677},

				-- P4 team aggrozza a P3-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P3"},

				-- p3 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P3"},
				DialogSetDisabled	{Tag = "Pact_3_Leader"},
				FigureTeamTransfer	{Tag = "Pact_3_Leader", Team = "tm_Team3"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4D_WIPEP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3"},
				BuildingIsDead	{Tag = "Pact_3_Building_1"},
				BuildingIsDead	{Tag = "Pact_3_Building_2"},
				BuildingIsDead	{Tag = "Pact_3_Building_3"},
				FigureIsDead	{Tag = "Pact_3_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact3", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact3", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_RETRIEVEBONESP4"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3"},
				MapFlagSetTrue	{Name = "mf_P704_MQ4D_Completed"},

				-- nameless kaput visszazarja
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
		EventName = ">>> TC_MQ4D_WIPEP3_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},
				-- P4 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP4Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4D_WIPEP3_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 677, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_RETRIEVEBONESP4"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP4Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4D_WIPEP3_RETRIEVEBONESP4 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP4"},	-- Pact_4_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ4D_WIPEP3_RETRIEVEBONESP4"},
				AvatarHasItemMisc	{Player = "default", ItemId = 677, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3_RETRIEVEBONESP4"},
				AvatarItemMiscTake	{Player = "default", ItemId = 677, Amount = 1},

				-- p4 unit upgrade
				MapValueSet	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P4_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ4E
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4E_WIPEP1 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ4E_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ4E_WIPEP1"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_2", DropChance = 100, ItemId = 677},

				-- P4 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P1"},

				-- p1 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P1"},
				DialogSetDisabled	{Tag = "Pact_1_Leader"},
				FigureTeamTransfer	{Tag = "Pact_1_Leader", Team = "tm_Team1"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4E_WIPEP1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1"},
				BuildingIsDead	{Tag = "Pact_1_Building_1"},
				BuildingIsDead	{Tag = "Pact_1_Building_2"},
				BuildingIsDead	{Tag = "Pact_1_Building_3"},
				FigureIsDead	{Tag = "Pact_1_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact1", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact1", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_RETRIEVEBONESP4"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1"},
				MapFlagSetTrue	{Name = "mf_P704_MQ4E_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate4"},
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
		EventName = ">>> TC_MQ4E_WIPEP1_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4E_WIPEP1_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = "OPENGATE6 and OPENGATE4 done, new P4 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE6"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_OPENGATE4"},
			},
		Actions =
			{
				-- P4 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP4Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4E_WIPEP1_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 677, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_RETRIEVEBONESP4"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP4Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ4E_WIPEP1_RETRIEVEBONESP2 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP4"},	-- Pact_4_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ4E_WIPEP1_RETRIEVEBONESP4"},
				AvatarHasItemMisc	{Player = "default", ItemId = 677, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1_RETRIEVEBONESP4"},
				AvatarItemMiscTake	{Player = "default", ItemId = 677, Amount = 1},

				-- p4 unit upgrade
				MapValueSet	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P4_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ8
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ8_TALKP4 active <<<",
		Conditions = 
			{
				OR
				{
					QuestIsSolved	{Player = "default", Quest = "TC_MQ4D_WIPEP3"},
					QuestIsSolved	{Player = "default", Quest = "TC_MQ4E_WIPEP1"},
					AND
					{
						QuestIsSolved	{Player = "default", Quest = "TC_MQ4A_WIPEP2"},
						FigureIsAlive	{Tag = "Pact_4_Leader"},
						MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 1 },
					},
				},
--				FigureIsAlive	{Tag = "Pact_4_Leader"},
--				FigureIsDead	{Tag = "Pact_1_Leader"},
--				FigureIsDead	{Tag = "Pact_2_Leader"},
--				FigureIsDead	{Tag = "Pact_3_Leader"},
			},

		Actions =
			{
				MapFlagSetTrue	{Name = "mf_P704_MQ8_Accepted"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ8_TALKP4"},
--				FigureOutcry	{TextTag = "LastRemainedClanP4Cry", Tag = "pl_HumanAvatar"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ8_TALKP4 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_P4LeaderTalkedLast"},		-- P4 leader utolso dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ8_TALKP4"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ8_TALKP4"},

				MapFlagSetTrue{Name = "mf_P704_LibraryPortal_Enabled"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

}
