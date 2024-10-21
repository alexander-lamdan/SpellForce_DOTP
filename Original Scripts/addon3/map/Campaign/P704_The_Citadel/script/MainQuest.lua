--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")
dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

-- MainQuests for pact 1 clan

State
{
	StateName = "QuestBook",

	OnOneTimeEvent
	{
		EventName = ">>> quest ACT1 started <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_CS01_Intro_End"},
			},
		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_ACT1"},
				MinimapAlertSetToEntity	{Tag = "Gate_1_Lever", Type = 5},
				MinimapAlertSetToEntity	{Tag = "Gate1", Type = 3},
			},
	},	


------------------------------------------
-- MQ1A
------------------------------------------

	OnToggleEvent
	{
		EventName = ">>> TC_MQ1A_WIPEP3 toggled! <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ1A_Accepted"},
--				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_OPENGATE4"},
				EventReEnable	{Name = "Event_MQ1A_WIPEP3_OPENGATE4_Done"},

				-- unitok megjelennek es elindulnak
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P3_Through_Nameless"},
				FogOfWarTeamAdd	{Team = "tm_Team1"},
				FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "Pact_1_Leader", Range = 50, Height = 5},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ1A_Accepted"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_OPENGATE4"},
				FogOfWarTeamRemove	{Team = "tm_Team1"},
				FogOfWarCloak	{FogOfWarId = 1 },
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ1A_WIPEP3_TALKP2 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP2"},
				EventReEnable	{Name = "Event_MQ1A_WIPEP3_TALKP2_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP2"},
			},
	},

	OnToggleEvent
	{
		EventName = ">>> TC_MQ1A_WIPEP3_TALKP4 toggled! <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},
		OnActions = 
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP4"},
				EventReEnable	{Name = "Event_MQ1A_WIPEP3_TALKP4_Done"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
			},
		OffActions = 
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP4"},
			},
	},

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1A_WIPEP3 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
--				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},		-- kell-e?
--				QuestIsSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP2"},	-- szuksegesek-e a subquestek figyelesei?
				BuildingIsDead	{Tag = "Pact_3_Building_1"},
				BuildingIsDead	{Tag = "Pact_3_Building_2"},
				BuildingIsDead	{Tag = "Pact_3_Building_3"},
				FigureIsDead	{Tag = "Pact_3_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact3", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact3", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP4"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
				MapFlagSetTrue	{Name = "mf_P704_MQ1A_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate4"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P1 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P4"},
				-- P4 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P2"},
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
		Name = "Event_MQ1A_WIPEP3_TALKP2_Done",
		EventName = ">>> TC_MQ1A_WIPEP3_TALKP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP2"},
				MapFlagIsTrue {Name = "mf_P704_MQ1A_P2LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP2"},

				-- P2 team aggrozza a P3-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P3"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1A_WIPEP3_TALKP4_Done",
		EventName = ">>> TC_MQ1A_WIPEP3_TALKP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP4"},
				MapFlagIsTrue {Name = "mf_P704_MQ1A_P4LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_TALKP4"},

				-- P4 team aggrozza a P3-at
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P3_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P3"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1A_WIPEP3_OPENGATE4_Done",
		EventName = ">>> TC_MQ1A_WIPEP3_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1A_WIPEP3_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},
				-- P1 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P3_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP1Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ1B
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ1B_WIPEP2 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ1B_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_TALKP4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_OPENGATE2"},
				EventReEnable	{Name = "Event_MQ1B_WIPEP2_TALKP4_Done"},
				EventReEnable	{Name = "Event_MQ1B_WIPEP2_OPENGATE2_Done"},

				-- P1 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P2"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ1B_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_TALKP4"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_OPENGATE2"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ1B_WIPEP2_FINDS1 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_RETRIEVES1P1"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_FINDS1"},
				EventReEnable	{Name = "Event_MQ1B_WIPEP2_FINDS1_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_FINDS1"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1B_WIPEP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				BuildingIsDead	{Tag = "Pact_2_Building_1"},
				BuildingIsDead	{Tag = "Pact_2_Building_2"},
				BuildingIsDead	{Tag = "Pact_2_Building_3"},
				FigureIsDead	{Tag = "Pact_2_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact2", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact2", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_OPENGATE2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_TALKP4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_FINDS1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_RETRIEVES1P1"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2"},
				MapFlagSetTrue	{Name = "mf_P704_MQ1B_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate2"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P1 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P4"},
				-- P4 team aggrozza a P1-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P1_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P4_Move_P1"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1B_WIPEP2_TALKP4_Done",
		EventName = ">>> TC_MQ1B_WIPEP2_TALKP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_TALKP4"},
				MapFlagIsTrue {Name = "mf_P704_MQ1B_P4LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_TALKP4"},

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
		Name = "Event_MQ1B_WIPEP2_OPENGATE2_Done",
		EventName = ">>> TC_MQ1B_WIPEP2_OPENGATE2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_OPENGATE2"},
				GateIsOpen	{Tag = "Gate2"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_OPENGATE2"},
				LeverSetDisabled	{Tag = "Gate_2_Lever"},
				-- P1 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP1Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	


	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1B_WIPEP2_FINDS1_Done",
		EventName = ">>> TC_MQ1B_WIPEP2_FINDS1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_FINDS1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_FINDS1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_RETRIEVES1P1"},

--				FigureOutcry	{TextTag = "BonesRetrieveP1Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1B_WIPEP2_RETRIEVES1P1 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP1"},	-- Pact_1_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ1B_WIPEP2_RETRIEVES1P1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1B_WIPEP2_RETRIEVES1P1"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p1 unit upgrade
				MapValueSet	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P1_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- p1 tower upgrade
				BuildingAbilityAdd	{Tag = "Pact_1_Tower_1", AbilityId = 446},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ1C
------------------------------------------

	OnToggleEvent
		{
		EventName = ">>> TC_MQ1C_WIPEP4 toggled <<<",
		OnConditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ1C_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_TALKP2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE6"},
				EventReEnable	{Name = "Event_MQ1C_WIPEP4_TALKP2_Done"},
				EventReEnable	{Name = "Event_MQ1C_WIPEP4_OPENGATE4_Done"},
				EventReEnable	{Name = "Event_MQ1C_WIPEP4_OPENGATE6_Done"},
				EventReEnable	{Name = "Event_OPENGATE4_OPENGATE6_Done"},

				-- P1 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P4"},
			},
		OffConditions = 
			{
				MapFlagIsFalse {Name = "mf_P704_MQ1C_Accepted"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_TALKP2"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE4"},
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE6"},
			},
	},	

	OnToggleEvent
		{
		EventName = ">>> TC_MQ1C_WIPEP4_FINDS1 active/inactive toggled <<<",
		OnConditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_RETRIEVES1P1"},
			},
		OnActions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_FINDS1"},
				EventReEnable	{Name = "Event_MQ1C_WIPEP4_FINDS1_Done"},

				MapFlagSetTrue{Name = "mf_P704_Bones_For_Nameless"},
			},
		OffConditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				QuestIsNotSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
			},
		OffActions =
			{
				QuestSetInactive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_FINDS1"},

				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1C_WIPEP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				BuildingIsDead	{Tag = "Pact_4_Building_1"},
				BuildingIsDead	{Tag = "Pact_4_Building_2"},
				BuildingIsDead	{Tag = "Pact_4_Building_3"},
				FigureIsDead	{Tag = "Pact_4_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact4", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact4", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_TALKP2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_FINDS1"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_RETRIEVES1P1"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4"},
				MapFlagSetTrue	{Name = "mf_P704_MQ1C_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate4"},
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate6"},

				-- vmi jelzes, h menjen egy leaderhez
				MinimapAlertSetToEntity	{Tag = "Pact_1_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_2_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_3_Leader", Type = 3},
				MinimapAlertSetToEntity	{Tag = "Pact_4_Leader", Type = 3},

				-- uj parancs a unitoknak
				-- P1 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P2"},
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
		Name = "Event_MQ1C_WIPEP4_TALKP2_Done",
		EventName = ">>> TC_MQ1C_WIPEP4_TALKP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_TALKP2"},
				MapFlagIsTrue {Name = "mf_P704_MQ1C_P2LeaderTalked"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_TALKP2"},

				-- P2 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P2_Move_P4"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1C_WIPEP4_OPENGATE4_Done",
		EventName = ">>> TC_MQ1C_WIPEP4_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1C_WIPEP4_OPENGATE6_Done",
		EventName = ">>> TC_MQ1C_WIPEP4_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_OPENGATE4_OPENGATE6_Done",
		EventName = "OPENGATE4 and OPENGATE6 done, new P1 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE4"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_OPENGATE6"},
			},
		Actions =
			{
				-- P1 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP1Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	

	OnOneTimeRepeatEvent
		{
		Name = "Event_MQ1C_WIPEP4_FINDS1_Done",
		EventName = ">>> TC_MQ1C_WIPEP4_FINDS1 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_FINDS1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_FINDS1"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_RETRIEVES1P1"},

--				FigureOutcry	{TextTag = "BonesRetrieveP1Cry", Tag = "pl_HumanAvatar"},
				MapFlagSetFalse{Name = "mf_P704_Bones_For_Nameless"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1C_WIPEP4_RETRIEVES1P1 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveArtifactP1"},	-- Pact_1_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ1C_WIPEP4_RETRIEVES1P1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 675, Amount = iBonesToCollect},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1C_WIPEP4_RETRIEVES1P1"},
				AvatarItemMiscTake	{Player = "default", ItemId = 675, Amount = iBonesToCollect},

				-- p1 unit upgrade
				MapValueSet	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 2 },
--				MapValueIncrease	{Name = "mv_704_P1_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- p1 tower upgrade
				BuildingAbilityAdd	{Tag = "Pact_1_Tower_1", AbilityId = 446},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

------------------------------------------
-- MQ1D
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1D_WIPEP2 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ1D_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ1D_WIPEP2"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_2_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_OPENGATE2"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_3", DropChance = 100, ItemId = 676},

				-- P1 team aggrozza a P2-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P2"},

				-- p2 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P2"},
				DialogSetDisabled	{Tag = "Pact_2_Leader"},
				FigureTeamTransfer	{Tag = "Pact_2_Leader", Team = "tm_Team2"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1D_WIPEP2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2"},
				BuildingIsDead	{Tag = "Pact_2_Building_1"},
				BuildingIsDead	{Tag = "Pact_2_Building_2"},
				BuildingIsDead	{Tag = "Pact_2_Building_3"},
				FigureIsDead	{Tag = "Pact_2_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact2", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact2", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_OPENGATE2"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_RETRIEVEBONESP1"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2"},
				MapFlagSetTrue	{Name = "mf_P704_MQ1D_Completed"},

				-- nameless kaput visszazarja
				MapFlagSetTrue {Name = "mf_P704_CreepCloseGate2"},

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
		EventName = ">>> TC_MQ1D_WIPEP2_OPENGATE2 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_OPENGATE2"},
				GateIsOpen	{Tag = "Gate2"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_OPENGATE2"},
				LeverSetDisabled	{Tag = "Gate_2_Lever"},
				-- P1 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P2_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP1Cry", Tag = "pl_HumanCompanionCraigHuman"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1D_WIPEP2_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 676, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_RETRIEVEBONESP1"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP1Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1D_WIPEP2_RETRIEVEBONESP1 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP1"},	-- Pact_1_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ1D_WIPEP2_RETRIEVEBONESP1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 676, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2_RETRIEVEBONESP1"},
				AvatarItemMiscTake	{Player = "default", ItemId = 676, Amount = 1},

				-- p1 unit upgrade
				MapValueSet	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P1_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ1E
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1E_WIPEP4 active <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_MQ1E_Accepted"},
				QuestIsNotKnown	{Player = "default", Quest = "TC_MQ1E_WIPEP4"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
				FigureIsAlive	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				QuestSetActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4"},
--				QuestSetActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_DESTROY"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE4"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE6"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_COLLECTBONES"},

				FigureLootItemMiscAdd {Tag = "Grave_Leader_3", DropChance = 100, ItemId = 676},

				-- P1 team aggrozza a P4-t
--				PlayerTeamTransfer	{Player = "pl_Pactx", Team = "tm_xxx"},
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Nameless"},
				EventReEnable	{Name = "me_P704_Event_P1_Move_P4"},

				-- p4 ellenseges lesz playerrel
				PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P4"},
				DialogSetDisabled	{Tag = "Pact_4_Leader"},
				FigureTeamTransfer	{Tag = "Pact_4_Leader", Team = "tm_Team4"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1E_WIPEP4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4"},
				BuildingIsDead	{Tag = "Pact_4_Building_1"},
				BuildingIsDead	{Tag = "Pact_4_Building_2"},
				BuildingIsDead	{Tag = "Pact_4_Building_3"},
				FigureIsDead	{Tag = "Pact_4_Leader"},
--				PlayerHasNotBuildingAmount	{Player = "pl_Pact4", Amount = 1, OnlyCompleted = true},
--				PlayerHasNotFigureAmountEx	{Player = "pl_Pact4", Amount = 1, CountWorkers = false, CountAvatarAndHeroes = false},
			},
		Actions =
			{
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE4"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE6"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_COLLECTBONES"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_RETRIEVEBONESP1"},

				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
--				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_DESTROY"},
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4"},
				MapFlagSetTrue	{Name = "mf_P704_MQ1E_Completed"},

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
		EventName = ">>> TC_MQ1E_WIPEP4_OPENGATE4 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE4"},
				GateIsOpen	{Tag = "Gate4"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE4"},
				LeverSetDisabled	{Tag = "Gate_4_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1E_WIPEP4_OPENGATE6 done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE6"},
				GateIsOpen	{Tag = "Gate6"},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE6"},
				LeverSetDisabled	{Tag = "Gate_6_Lever"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = "OPENGATE4 and OPENGATE6 done, new P1 route",
		Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE4"},
				QuestIsSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_OPENGATE6"},
			},
		Actions =
			{
				-- P1 kikerulo utvonalon tamad
				MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P4_Through_Gates"},
				FigureOutcry	{TextTag = "ClearedWayForP1Cry", Tag = "pl_HumanCompanionCraigHuman"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1E_WIPEP4_COLLECTBONES done <<<",
		Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_COLLECTBONES"},
				AvatarHasItemMisc	{Player = "default", ItemId = 676, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_COLLECTBONES"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_RETRIEVEBONESP1"},

--				FigureOutcry	{TextTag = "ArtifactRetrieveP1Cry", Tag = "pl_HumanAvatar"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ1E_WIPEP4_RETRIEVEBONESP1 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_GiveBonesP1"},	-- Pact_1_Leader dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ1E_WIPEP4_RETRIEVEBONESP1"},
				AvatarHasItemMisc	{Player = "default", ItemId = 676, Amount = 1},
			},
		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPSub },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4_RETRIEVEBONESP1"},
				AvatarItemMiscTake	{Player = "default", ItemId = 676, Amount = 1},

				-- p1 unit upgrade
				MapValueSet	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 3 },
--				MapValueIncrease	{Name = "mv_704_P1_Unit_Upgrade_Level"},	-- vagy ez vagy a masik

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	


------------------------------------------
-- MQ5
------------------------------------------

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ5_TALKP1 active <<<",
		Conditions = 
			{
				OR
				{
					QuestIsSolved	{Player = "default", Quest = "TC_MQ1D_WIPEP2"},
					QuestIsSolved	{Player = "default", Quest = "TC_MQ1E_WIPEP4"},
					AND
					{
						QuestIsSolved	{Player = "default", Quest = "TC_MQ1A_WIPEP3"},
						FigureIsAlive	{Tag = "Pact_1_Leader"},
						MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 1 },
					},
				},
--				FigureIsAlive	{Tag = "Pact_1_Leader"},
--				FigureIsDead	{Tag = "Pact_2_Leader"},
--				FigureIsDead	{Tag = "Pact_3_Leader"},
--				FigureIsDead	{Tag = "Pact_4_Leader"},
			},

		Actions =
			{
				MapFlagSetTrue	{Name = "mf_P704_MQ5_Accepted"},
				QuestSetActive	{Player = "default", Quest = "TC_MQ5_TALKP1"},
--				FigureOutcry	{TextTag = "LastRemainedClanP1Cry", Tag = "pl_HumanAvatar"},
			},
	},	

	OnOneTimeEvent
		{
		EventName = ">>> TC_MQ5_TALKP1 done <<<",
		Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P704_P1LeaderTalkedLast"},		-- P1 leader utolso dialog utan
				QuestIsActive	{Player = "default", Quest = "TC_MQ5_TALKP1"},
				FigureIsAlive	{Tag = "Pact_1_Leader"},
			},

		Actions =
			{
				-- reward
				AvatarXPGive	{Player = "default", Amount = iMissionXPMain },
				QuestSetSolved	{Player = "default", Quest = "TC_MQ5_TALKP1"},

				MapFlagSetTrue{Name = "mf_P704_LibraryPortal_Enabled"},

				-- save inditas par sec mulva
				MapTimerStart	{Name = "mt_P704_Saving"},
			},
	},	

}
