State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			QuestIsNotSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate0", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate1", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate2", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate3", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate4", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate5", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate6", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate7", Range = 20},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate8", Range = 20},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Realm_Lieutenant"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Realm_Lieutenant_RepairtheGates"},
		},
		Actions = 
		{
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
			DialogSetEnabled	{Tag = "Ruined_Sawmill01"},
			DialogSetEnabled	{Tag = "Ruined_Sawmill02"},
			DialogSetEnabled	{Tag = "Ruined_Sawmill03"},
			DialogSetEnabled	{Tag = "Ruined_Sawmill04"},
			DialogSetEnabled	{Tag = "Ruined_Sawmill05"},
			MapValueRandomize	{Name = "mv_P710_Ruined_Sawmill_Cog_Location", MinValue = 1, MaxValue = 5},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P710_Sawmill01_Searched"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Ruined_Sawmill01"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P710_Sawmill02_Searched"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Ruined_Sawmill02"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P710_Sawmill03_Searched"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Ruined_Sawmill03"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P710_Sawmill04_Searched"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Ruined_Sawmill04"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P710_Sawmill05_Searched"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Ruined_Sawmill05"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarIsNotTalking	{},
			MapFlagIsTrue{Name = "mf_P710_Gate_Cog_Retrieved"},
		},
		Actions = 
		{
			
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_PUTCOG"},
			AvatarItemMiscGive	{Player = "default", ItemId = 766, Amount = 1},
			DialogSetEnabled	{Tag = "Gate_Lever"},
			DialogSetEnabled	{Tag = "Gate_Lever_Dummy"},
			DialogSetDisabled	{Tag = "Ruined_Sawmill01"},
			DialogSetDisabled	{Tag = "Ruined_Sawmill02"},
			DialogSetDisabled	{Tag = "Ruined_Sawmill03"},
			DialogSetDisabled	{Tag = "Ruined_Sawmill04"},
			DialogSetDisabled	{Tag = "Ruined_Sawmill05"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarIsNotTalking	{},
			MapFlagIsTrue{Name = "mf_P710_Gate_Repaired"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Gate_Lever"},
			DialogSetDisabled	{Tag = "Gate_Lever_Dummy"},
			LeverSetOn	{Tag = "Gate_Lever"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_PUTCOG"},
			QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			AvatarItemMiscTake	{Player = "default", ItemId = 766, Amount = 1},
			LeverSetEnabled	{Tag = "Lever0"},
			LeverSetEnabled	{Tag = "Lever1"},
			LeverSetEnabled	{Tag = "Lever2"},
			LeverSetEnabled	{Tag = "Lever3"},
			LeverSetEnabled	{Tag = "Lever4"},
			LeverSetEnabled	{Tag = "Lever5"},
			LeverSetEnabled	{Tag = "Lever6"},
			LeverSetEnabled	{Tag = "Lever7"},
			LeverSetEnabled	{Tag = "Lever8"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever0"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate0"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever1"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate1"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever2"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate2"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever3"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate3"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever4"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate4"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever5"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate5"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever6"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate6"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever7"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate7"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			LeverIsOn	{Tag = "Lever8"},
			QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
		},
		Actions = 
		{
			GateSetClosed	{Tag = "Gate8"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate0Close,
		Name = "Gate0Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate0CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever0"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate0CloseTimer"},
			GateSetClosed	{Tag = "Gate0"},
			EventReEnable	{Name = "Gate0OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate0OpenTimer,
		Name = "Gate0OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate0"},
			LeverIsOn	{Tag = "Lever0"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate0OpenTimer"},
			EventReEnable	{Name = "Gate0Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate0Open,
		Name = "Gate0Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate0OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever0"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate0OpenTimer"},
			GateSetOpen	{Tag = "Gate0"},
			EventReEnable	{Name = "Gate0CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate0CloseTimer,
		Name = "Gate0CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate0"},
			LeverIsOff	{Tag = "Lever0"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate0CloseTimer"},
			EventReEnable	{Name = "Gate0Close"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate1Close,
		Name = "Gate1Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate1CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever1"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate1CloseTimer"},
			GateSetClosed	{Tag = "Gate1"},
			EventReEnable	{Name = "Gate1OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate1OpenTimer,
		Name = "Gate1OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate1"},
			LeverIsOn	{Tag = "Lever1"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate1OpenTimer"},
			EventReEnable	{Name = "Gate1Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate1Open,
		Name = "Gate1Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate1OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever1"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate1OpenTimer"},
			GateSetOpen	{Tag = "Gate1"},
			EventReEnable	{Name = "Gate1CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate1CloseTimer,
		Name = "Gate1CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate1"},
			LeverIsOff	{Tag = "Lever1"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate1CloseTimer"},
			EventReEnable	{Name = "Gate1Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate2Close,
		Name = "Gate2Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate2CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever2"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate2CloseTimer"},
			GateSetClosed	{Tag = "Gate2"},
			EventReEnable	{Name = "Gate2OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate2OpenTimer,
		Name = "Gate2OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate2"},
			LeverIsOn	{Tag = "Lever2"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate2OpenTimer"},
			EventReEnable	{Name = "Gate2Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate2Open,
		Name = "Gate2Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate2OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever2"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate2OpenTimer"},
			GateSetOpen	{Tag = "Gate2"},
			EventReEnable	{Name = "Gate2CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate2CloseTimer,
		Name = "Gate2CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate2"},
			LeverIsOff	{Tag = "Lever2"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate2CloseTimer"},
			EventReEnable	{Name = "Gate2Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate3Close,
		Name = "Gate3Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate3CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever3"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate3CloseTimer"},
			GateSetClosed	{Tag = "Gate3"},
			EventReEnable	{Name = "Gate3OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate3OpenTimer,
		Name = "Gate3OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate3"},
			LeverIsOn	{Tag = "Lever3"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate3OpenTimer"},
			EventReEnable	{Name = "Gate3Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate3Open,
		Name = "Gate3Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate3OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever3"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate3OpenTimer"},
			GateSetOpen	{Tag = "Gate3"},
			EventReEnable	{Name = "Gate3CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate3CloseTimer,
		Name = "Gate3CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate3"},
			LeverIsOff	{Tag = "Lever3"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate3CloseTimer"},
			EventReEnable	{Name = "Gate3Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate4Close,
		Name = "Gate4Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate4CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever4"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate4CloseTimer"},
			GateSetClosed	{Tag = "Gate4"},
			EventReEnable	{Name = "Gate4OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate4OpenTimer,
		Name = "Gate4OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate4"},
			LeverIsOn	{Tag = "Lever4"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate4OpenTimer"},
			EventReEnable	{Name = "Gate4Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate4Open,
		Name = "Gate4Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate4OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever4"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate4OpenTimer"},
			GateSetOpen	{Tag = "Gate4"},
			EventReEnable	{Name = "Gate4CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate4CloseTimer,
		Name = "Gate4CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate4"},
			LeverIsOff	{Tag = "Lever4"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate4CloseTimer"},
			EventReEnable	{Name = "Gate4Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate5Close,
		Name = "Gate5Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate5CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever5"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate5CloseTimer"},
			GateSetClosed	{Tag = "Gate5"},
			EventReEnable	{Name = "Gate5OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate5OpenTimer,
		Name = "Gate5OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate5"},
			LeverIsOn	{Tag = "Lever5"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate5OpenTimer"},
			EventReEnable	{Name = "Gate5Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate5Open,
		Name = "Gate5Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate5OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever5"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate5OpenTimer"},
			GateSetOpen	{Tag = "Gate5"},
			EventReEnable	{Name = "Gate5CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate5CloseTimer,
		Name = "Gate5CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate5"},
			LeverIsOff	{Tag = "Lever5"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate5CloseTimer"},
			EventReEnable	{Name = "Gate5Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate6Close,
		Name = "Gate6Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate6CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever6"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate6CloseTimer"},
			GateSetClosed	{Tag = "Gate6"},
			EventReEnable	{Name = "Gate6OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate6OpenTimer,
		Name = "Gate6OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate6"},
			LeverIsOn	{Tag = "Lever6"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate6OpenTimer"},
			EventReEnable	{Name = "Gate6Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate6Open,
		Name = "Gate6Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate6OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever6"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate6OpenTimer"},
			GateSetOpen	{Tag = "Gate6"},
			EventReEnable	{Name = "Gate6CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate6CloseTimer,
		Name = "Gate6CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate6"},
			LeverIsOff	{Tag = "Lever6"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate6CloseTimer"},
			EventReEnable	{Name = "Gate6Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate7Close,
		Name = "Gate7Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate7CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever7"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate7CloseTimer"},
			GateSetClosed	{Tag = "Gate7"},
			EventReEnable	{Name = "Gate7OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate7OpenTimer,
		Name = "Gate7OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate7"},
			LeverIsOn	{Tag = "Lever7"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate7OpenTimer"},
			EventReEnable	{Name = "Gate7Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate7Open,
		Name = "Gate7Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate7OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever7"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate7OpenTimer"},
			GateSetOpen	{Tag = "Gate7"},
			EventReEnable	{Name = "Gate7CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate7CloseTimer,
		Name = "Gate7CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate7"},
			LeverIsOff	{Tag = "Lever7"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate7CloseTimer"},
			EventReEnable	{Name = "Gate7Close"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate8Close,
		Name = "Gate8Close",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Gate8CloseTimer", Seconds = 3},
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			LeverIsOn	{Tag = "Lever8"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate8CloseTimer"},
			GateSetClosed	{Tag = "Gate8"},
			EventReEnable	{Name = "Gate8OpenTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate8OpenTimer,
		Name = "Gate8OpenTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsClosed	{Tag = "Gate8"},
			LeverIsOn	{Tag = "Lever8"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate8OpenTimer"},
			EventReEnable	{Name = "Gate8Open"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = Gate8Open,
		Name = "Gate8Open",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			MapTimerIsElapsed	{Name = "mt_P710_Gate8OpenTimer", Seconds = 3},
			LeverIsOff	{Tag = "Lever8"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Gate8OpenTimer"},
			GateSetOpen	{Tag = "Gate8"},
			EventReEnable	{Name = "Gate8CloseTimer"},
		},
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = Gate8CloseTimer,
		Name = "Gate8CloseTimer",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_REPAIRTHEGATES"},
			GateIsOpen	{Tag = "Gate8"},
			LeverIsOff	{Tag = "Lever8"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Gate8CloseTimer"},
			EventReEnable	{Name = "Gate8Close"},
		},
	};
};

