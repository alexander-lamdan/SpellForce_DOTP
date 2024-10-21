State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Game is unblocked <<<",
		Conditions = 
		{
				GameIsUnBlocked{},
		},
		Actions =
		{
			PlayerTravelDisable	{},
			
			MapFlagSetTrue {Name = "mf_P708_Nightsong_SQ_05"},
			
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Shadow_Realm_Rift.tga", BlendDuration = 0.0 },
			
			MapFlagSetTrue{ Name = "mf_P708_MainInit_Ended" },	
			MapFlagSetTrue {Name = "mf_P708_CS_01_Start"},
			ColorGradingChange {LUTFile = "addon3/gfx/lut/LUT_Shadow_Realm.tga", BlendDuration = 4.0 },
			--QuestSetActive	{Player = "default", Quest = "SSSR_MQ_05"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> MountedDragon before cutscene <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_CS_01_Start"},
			MapFlagIsFalse {Name = "mf_P708_CS_01_Ended"},
			AvatarFlagIsTrue {Name = "af_DragonMounted"},
		},
		Actions =
		{
			AvatarMountUnmountDragon {Player = "pl_Human"},
		},
	},	

-----------------------------------
--------  Dragon handling
-----------------------------------
	OnOneTimeEvent
	{
		EventName = "Sárkánylovaglás bekapcs",
		Conditions = 
		{
			AvatarFlagIsFalse	{Player = "default", Name = "af_ArrivedFromPreviousMap"},
			MapFlagIsTrue {Name = "mf_P708_CS_01_Ended"},
		},
		Actions = 
		{
			AvatarFlagSetTrue {Name = "af_OnlyCloseDragonMount"},
			AvatarFlagSetTrue	{Name = "af_DragonMountEnabled"},
		},
	};

	OnEvent
	{
		EventName = "PostMapTravelEnableDragon",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},	
		},
	};
	

-----------------------------------
--------  Travel Handling
-----------------------------------
	OnOneTimeEvent
	{
		EventName = ">>> Avatar approached a travel stone <<<",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TravelStone1", Range = 15 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TravelStone2", Range = 15 },
			},
		},	
		Actions =
		{	
			PlayerTravelEnable	{},
		},
	},

------------------------
-- Autosave Handling
------------------------
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Autosave called <<<",
		Name = "AutosaveTimer",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Autosave" },
		},	
		Actions =
		{	
			EventReEnable {Name = "AutosaveNow"},
			MapTimerStart {Name = "mt_Autosave"},
		},
	},

	OnOneTimeRepeatEvent
	{
		EventName = ">>> Autosave execute <<<",
		Name = "AutosaveNow",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Autosave" },
			MapTimerIsElapsed	{Name = "mt_Autosave", Seconds = 5},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},	
		Actions =
		{	
			EventReEnable {Name = "AutosaveTimer"},
			MapTimerStop {Name = "mt_Autosave"},
			MapFlagSetFalse { Name = "mf_Autosave" },
			DoAutoSave {},
		},
	},
			
-----------------------------------
--------  Gates control
-----------------------------------

	OnLeverEvent
	{
		EventName = ">>> Lever1a Used <<<",
		Delay = 4,
		Lever = "Lever1a",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate01_LeverOn" },	
		},
	},
	OnLeverEvent
	{
		EventName = ">>> Lever1b Used <<<",
		Delay = 4,
		Lever = "Lever1b",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate01_LeverOn" },	
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate01 Close <<<",
		Name = "Gate01Close",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate01_LeverOn" },	
			GateIsOpen	{Tag = "Gate01"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate01_LeverOn" },	
			GateSetClosed	{Tag = "Gate01"},
			EventReEnable	{Name = "Gate01Open"},
		},
	};
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate01 Open <<<",
		Name = "Gate01Open",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate01_LeverOn" },	
			GateIsClosed	{Tag = "Gate01"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate01_LeverOn" },	
			GateSetOpen	{Tag = "Gate01"},
			EventReEnable	{Name = "Gate01Close"},
		},
	};

	OnLeverEvent
	{
		EventName = ">>> Lever2a Used <<<",
		Delay = 4,
		Lever = "Lever2a",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate02_LeverOn" },	
		},
	},
	OnLeverEvent
	{
		EventName = ">>> Lever2b Used <<<",
		Delay = 4,
		Lever = "Lever2b",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate02_LeverOn" },	
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate02 Close <<<",
		Name = "Gate02Close",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate02_LeverOn" },	
			GateIsOpen	{Tag = "Gate02"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate02_LeverOn" },	
			GateSetClosed	{Tag = "Gate02"},
			EventReEnable	{Name = "Gate02Open"},
		},
	};
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate02 Open <<<",
		Name = "Gate02Open",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate02_LeverOn" },	
			GateIsClosed	{Tag = "Gate02"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate02_LeverOn" },	
			GateSetOpen	{Tag = "Gate02"},
			EventReEnable	{Name = "Gate02Close"},
		},
	};

	OnLeverEvent
	{
		EventName = ">>> Lever3a Used <<<",
		Delay = 4,
		Lever = "Lever3a",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate03_LeverOn" },	
		},
	},
	OnLeverEvent
	{
		EventName = ">>> Lever3b Used <<<",
		Delay = 4,
		Lever = "Lever3b",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate03_LeverOn" },	
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate03 Close <<<",
		Name = "Gate03Close",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate03_LeverOn" },	
			GateIsOpen	{Tag = "Gate03"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate03_LeverOn" },	
			GateSetClosed	{Tag = "Gate03"},
			EventReEnable	{Name = "Gate03Open"},
		},
	};
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate03 Open <<<",
		Name = "Gate03Open",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate03_LeverOn" },	
			GateIsClosed	{Tag = "Gate03"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate03_LeverOn" },	
			GateSetOpen	{Tag = "Gate03"},
			EventReEnable	{Name = "Gate03Close"},
		},
	};

	OnLeverEvent
	{
		EventName = ">>> Lever4a Used <<<",
		Delay = 4,
		Lever = "Lever4a",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate04_LeverOn" },	
		},
	},
	OnLeverEvent
	{
		EventName = ">>> Lever4b Used <<<",
		Delay = 4,
		Lever = "Lever4b",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue{ Name = "mf_Gate04_LeverOn" },	
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate04 Close <<<",
		Name = "Gate04Close",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate04_LeverOn" },	
			GateIsOpen	{Tag = "Gate04"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate04_LeverOn" },	
			GateSetClosed	{Tag = "Gate04"},
			EventReEnable	{Name = "Gate04Open"},
		},
	};
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Gate04 Open <<<",
		Name = "Gate04Open",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_Gate04_LeverOn" },	
			GateIsClosed	{Tag = "Gate04"},
		},
		Actions = 
		{
			MapFlagSetFalse{ Name = "mf_Gate04_LeverOn" },	
			GateSetOpen	{Tag = "Gate04"},
			EventReEnable	{Name = "Gate04Close"},
		},
	};

-----------------------------------
--------  Dialog Handling
-----------------------------------
	OnOneTimeEvent
	{
		EventName = ">>> No more to say <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P708_FirstShadowDiscussed"},
			MapFlagIsTrue {Name = "mf_P708_WastelandDiscussed"},
			MapFlagIsTrue {Name = "mf_P708_Hesitate1Discussed"},
			MapFlagIsTrue {Name = "mf_P708_Hesitate2Discussed"},
			MapFlagIsTrue {Name = "mf_P708_ShowDiscussed"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Shadowwarrior"},
		},
	};
	
	OnOneTimeEvent
	{
		EventName = ">>> Merchant ready <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "Opposer"},
		},
		Actions = 
		{
			FigureForcedWalkToEntity	{Tag = "Merchant", TargetTag = "Mplace"},
			FigureDirectionSet	{Tag = "Merchant", Direction = 270},
		},
	};
	
------------------------
-- Death handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> every adventurer died (the death of the dragon is handled in dragon.lua) <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
			FigureIsDead	{Tag = "pl_HumanHeroFirst"},
			FigureIsDead	{Tag = "pl_HumanHeroSecond"},
			FigureIsDead	{Tag = "pl_HumanHeroThird"},
			FigureIsDead	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsDead	{Tag = "pl_HumanCompanionSariel"},
			PlayerHasNotBuildingAmount	{Player = "pl_Human", Amount = 1, OnlyCompleted = default},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title"},
		},
	},
};







