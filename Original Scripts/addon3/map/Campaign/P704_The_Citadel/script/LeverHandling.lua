dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

--------------------------------
-- STATE OF LEVERS AND GATES
--------------------------------

State
{
	StateName = "INIT",


	OnToggleEvent
	{
		EventName = ">>> gate 1 toggled <<<",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Gate_1_Lever"},
		},
		OnActions = 
		{
			GateSetClosed	{Tag = "Gate1"},
		},
		OffConditions = 
		{
			LeverIsOff	{Tag = "Gate_1_Lever"},
		},
		OffActions = 
		{
			GateSetOpen	{Tag = "Gate1"},
			LeverSetDisabled	{Tag = "Gate_1_Lever"},
--			FigureOutcry	{TextTag = "GateLeverBrokenCry", Tag = "pl_HumanAvatar"},
		},
	},


	OnToggleEvent
	{
		EventName = ">>> gate 2 toggled <<<",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Gate_2_Lever"},
		},
		OnActions = 
		{
			GateSetClosed	{Tag = "Gate2"},
		},
		OffConditions = 
		{
			LeverIsOff	{Tag = "Gate_2_Lever"},
		},
		OffActions = 
		{
			GateSetOpen	{Tag = "Gate2"},
		},
	};

	OnToggleEvent
	{
		EventName = ">>> gate 3 toggled <<<",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Gate_3_Lever"},
		},
		OnActions = 
		{
			GateSetClosed	{Tag = "Gate3"},
			GateSetClosed	{Tag = "Gate3b"},
		},
		OffConditions = 
		{
			LeverIsOff	{Tag = "Gate_3_Lever"},
		},
		OffActions = 
		{
			GateSetOpen	{Tag = "Gate3"},
			GateSetOpen	{Tag = "Gate3b"},
			LeverSetDisabled	{Tag = "Gate_3_Lever"},

			-- a legelso tamadasnal megegyszer kiadjuk a P1 tamadast, mert megakadtak a zart kapunal
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_1a", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_1b", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_1c", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_1d", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_2a", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_2b", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_2c", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_2d", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_3a", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_3b", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_3c", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Pact_1_Level_1_Unit_3d", TargetTag = "Pact_3_HQ"}, Tags = "Pact_3_HQ" },

--			FigureOutcry	{TextTag = "GateLeverBrokenCry", Tag = "pl_HumanAvatar"},
		},
	},

	OnToggleEvent
	{
		EventName = ">>> gate 4 toggled <<<",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Gate_4_Lever"},
		},
		OnActions = 
		{
			GateSetClosed	{Tag = "Gate4"},
		},
		OffConditions = 
		{
			LeverIsOff	{Tag = "Gate_4_Lever"},
		},
		OffActions = 
		{
			GateSetOpen	{Tag = "Gate4"},
		},
	},

	OnToggleEvent
	{
		EventName = ">>> gate 5 toggled <<<",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Gate_5_Lever"},
		},
		OnActions = 
		{
			GateSetClosed	{Tag = "Gate5"},
		},
		OffConditions = 
		{
			LeverIsOff	{Tag = "Gate_5_Lever"},
		},
		OffActions = 
		{
			GateSetOpen	{Tag = "Gate5"},
		},
	},

	OnToggleEvent
	{
		EventName = ">>> gate 6 toggled <<<",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Gate_6_Lever"},
		},
		OnActions = 
		{
			GateSetClosed	{Tag = "Gate6"},
		},
		OffConditions = 
		{
			LeverIsOff	{Tag = "Gate_6_Lever"},
		},
		OffActions = 
		{
			GateSetOpen	{Tag = "Gate6"},
		},
	},

--
-- library gate open (automatic)
--
	OnOneTimeEvent
	{
		EventName = ">>> library gate opens <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate_Library", Range = 10 },
		},
		Actions = 
		{
			GateSetOpen	{Tag = "Gate_Library"},
		},
	},

--
-- flink lever
--

	OnOneTimeEvent
	{
		EventName = ">>> flink lever turned on <<<",
		Conditions = 
		{
			LeverIsOn	{Tag = "Flink_Lever"},
		},
		Actions = 
		{
			LeverSetDisabled	{Tag = "Flink_Lever"},
--			FigureOutcry	{TextTag = "FlinkLeverOnCry", Tag = "pl_HumanAvatar"},
--			GateSetOpen	{Tag = "Gate_Flink"},	-- treasure room?
		},
	},

--
-- gate closing by creep events
--
	OnEvent
	{
		EventName = ">>> gate 2 closed by creep <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P704_CreepCloseGate2"},
			LeverIsOff	{Tag = "Flink_Lever"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P704_CreepCloseGate2"},
			LeverSetEnabled	{Tag = "Gate_2_Lever"},
			LeverSetOn	{Tag = "Gate_2_Lever"},

			MapFlagSetTrue	{Name = "mf_P704_Lever_2_Demon_Respawn"},
			MinimapAlertSetToEntity	{Tag = "Gate_2_Lever", Type = 2},

			MapTimerStart	{Name = "mt_P704_Gate2Closed"},
		},
	},

	OnEvent
	{
		EventName = ">>> gate 4 closed by creep <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P704_CreepCloseGate4"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P704_CreepCloseGate4"},
			LeverSetEnabled	{Tag = "Gate_4_Lever"},
			LeverSetOn	{Tag = "Gate_4_Lever"},

			MapFlagSetTrue	{Name = "mf_P704_Lever_4_Demon_Respawn"},
			MinimapAlertSetToEntity	{Tag = "Gate_4_Lever", Type = 2},

			MapTimerStart	{Name = "mt_P704_Gate4Closed"},
		},
	},

	OnEvent
	{
		EventName = ">>> gate 5 closed by creep <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P704_CreepCloseGate5"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P704_CreepCloseGate5"},
			LeverSetEnabled	{Tag = "Gate_5_Lever"},
			LeverSetOn	{Tag = "Gate_5_Lever"},

			MapFlagSetTrue	{Name = "mf_P704_Lever_5_Demon_Respawn"},
			MinimapAlertSetToEntity	{Tag = "Gate_5_Lever", Type = 2},

			MapTimerStart	{Name = "mt_P704_Gate5Closed"},
		},
	},

	OnEvent
	{
		EventName = ">>> gate 6 closed by creep <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P704_CreepCloseGate6"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P704_CreepCloseGate6"},
			LeverSetEnabled	{Tag = "Gate_6_Lever"},
			LeverSetOn	{Tag = "Gate_6_Lever"},

			MapFlagSetTrue	{Name = "mf_P704_Lever_6_Demon_Respawn"},
			MinimapAlertSetToEntity	{Tag = "Gate_6_Lever", Type = 2},

			MapTimerStart	{Name = "mt_P704_Gate6Closed"},
		},
	},

}
