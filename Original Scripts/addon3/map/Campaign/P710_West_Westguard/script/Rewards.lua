State
{
	StateName = "INIT",
	
	--Main quests
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TALKTOREALMORSHAIKANLEADER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_SHAIKAN"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_REPAIR"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_GATHER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_POWER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 8000},
		},
	},
	
	--Side quests
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REPAIRTHEGATES_PUTCOG"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_UNDEADS_GATHER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_UNDEADS_BRING"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYTOWERS"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TWIDDLE_OPENSESAME"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human", Amount = 4000},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Creep_Spawn"},
			FigureIsDead{Tag = "Area01_Pack01_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack01_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack01_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack01_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack02_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack02_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack02_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack02_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack02_Nameless05"},
			FigureIsDead{Tag = "Area01_Pack02_Nameless06"},
			FigureIsDead{Tag = "Area01_Pack02_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack03_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack03_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack03_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack03_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack03_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack04_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack04_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack04_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack04_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack04_Nameless05"},
			FigureIsDead{Tag = "Area01_Pack04_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack05_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack05_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack05_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack05_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack06_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack06_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack06_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack06_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack06_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack07_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack07_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack07_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack07_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack07_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack08_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack08_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack08_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack08_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack09_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack09_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack09_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack09_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack10_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack10_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack10_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack10_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack11_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack11_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack11_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack11_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack11_Nameless05"},
			FigureIsDead{Tag = "Area01_Pack11_Nameless06"},
			FigureIsDead{Tag = "Area01_Pack11_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack12_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack12_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack12_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack12_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack13_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack13_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack13_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack13_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack13_Nameless05"},
			FigureIsDead{Tag = "Area01_Pack13_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack14_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack14_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack14_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack14_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack15_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack15_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack15_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack15_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack16_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack16_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack16_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack16_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack16_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack17_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack17_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack17_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack17_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack18_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack18_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack18_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack18_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack18_Nameless05"},
			FigureIsDead{Tag = "Area01_Pack18_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack19_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack19_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack19_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack19_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack19_Nameless05"},
			FigureIsDead{Tag = "Area01_Pack19_Nameless06"},
			MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack20_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack20_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack20_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack20_Nameless04"},
			MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area01_Pack21_Nameless01"},
			FigureIsDead{Tag = "Area01_Pack21_Nameless02"},
			FigureIsDead{Tag = "Area01_Pack21_Nameless03"},
			FigureIsDead{Tag = "Area01_Pack21_Nameless04"},
			FigureIsDead{Tag = "Area01_Pack21_Nameless05"},
			MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack01_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack01_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack01_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack01_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack01_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack02_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack02_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack02_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack02_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack02_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack03_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack03_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack03_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack03_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack04_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack04_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack04_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack04_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack05_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack05_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack05_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack05_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack05_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack06_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack06_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack06_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack06_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack07_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack07_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack07_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack07_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack07_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack08_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack08_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack08_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack08_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack09_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack09_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack10_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack10_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack11_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack11_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack12_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack12_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack12_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack12_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack12_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack12_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack12_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold1000", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack13_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack13_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack13_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack13_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack13_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack13_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack13_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack14_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack14_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack15_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack15_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack15_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack15_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack15_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack15_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack15_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack16_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack16_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack17_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack17_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack18_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack18_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack18_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack18_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack18_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack18_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack19_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack19_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack19_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack19_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack19_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack19_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack20_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless08"},
			FigureIsDead{Tag = "Area02_Pack20_Nameless09"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack21_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless08"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless09"},
			FigureIsDead{Tag = "Area02_Pack21_Nameless10"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack22_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack22_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack22_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack22_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack22_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack23_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless08"},
			FigureIsDead{Tag = "Area02_Pack23_Nameless09"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack24_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack24_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack24_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack24_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack25_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack25_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack25_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack25_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack25_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area02_Pack26_Nameless01"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless02"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless03"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless04"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless05"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless06"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless07"},
			FigureIsDead{Tag = "Area02_Pack26_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack01_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack01_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack01_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack01_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack02_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack02_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold1000", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack03_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack03_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack03_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack03_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack03_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack03_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack04_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack04_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold1000", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack05_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack05_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack05_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack05_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack05_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack06_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack06_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack06_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack06_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack06_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack06_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack06_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack07_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack07_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack08_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack08_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack08_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack08_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack08_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack08_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack09_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack09_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack09_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack09_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack09_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack09_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack09_Nameless07"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold1000", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack10_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack10_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack10_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack10_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack10_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack11_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack11_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack12_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack12_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack13_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack13_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack13_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack13_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack13_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack14_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack14_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack14_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack14_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack15_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack15_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack15_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack15_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack15_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack15_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack16_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack16_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack16_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack16_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack16_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack17_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack17_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack17_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack17_Nameless04"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack18_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack18_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack19_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack19_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack19_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack19_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack19_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack20_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless06"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless07"},
			FigureIsDead{Tag = "Area03_Pack20_Nameless08"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack21_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack21_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack21_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack21_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack21_Nameless05"},
			FigureIsDead{Tag = "Area03_Pack21_Nameless06"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			FigureOutcry	{TextTag = "ExtraGold500", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "Area03_Pack22_Nameless01"},
			FigureIsDead{Tag = "Area03_Pack22_Nameless02"},
			FigureIsDead{Tag = "Area03_Pack22_Nameless03"},
			FigureIsDead{Tag = "Area03_Pack22_Nameless04"},
			FigureIsDead{Tag = "Area03_Pack22_Nameless05"},
		},
		Actions = 
		{
			AvatarGoldGive	{Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			FigureOutcry	{TextTag = "ExtraGold200", Tag = "pl_HumanAvatar"},
		},
	};
	
};
