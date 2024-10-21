------------------------------------------------------
---- 10: Tiara, god of the Sun ----
------------------------------------------------------
Tiara = 
{
	Cauldron	= { X =  351,  Y = 303, Direction = 0 },
	Chest	= 		{ X = 340.8, Y = 313.5, Direction = 125},
	Crystal =		{ X = 334.7, Y = 309, Direction = 0},
	Cup =				{ X = 330.4, Y = 303, Direction = 70},
	Shield =		{ X = 334.7, Y = 297.5, Direction = 10},
 	Statue =		{ X = 346.6, Y = 297.5, Direction = 238},
	Sword =			{ X = 340.8, Y = 293, Direction = 150},
	Torch =			{ X = 346.6, Y = 309, Direction = 0}, 
}


State
{
	StateName = "INIT",
	
-- Ide majd jonnek a beallitasok reszletei!	

	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Reset",
		Name = "Tiara_Reset",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraReset"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			--MapFlagSetTrue{Name = "mf_P702_TiaraResetOutcry"},
			MapFlagSetFalse{Name = "mf_P702_TiaraSwordActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraCupActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraCrystalActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraChestActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraTorchActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraCauldronActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraStatueActivated"},
			MapFlagSetFalse{Name = "mf_P702_TiaraSwordEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraCupEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraCrystalEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraChestEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraTorchEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraCauldronEffect"},
			MapFlagSetFalse{Name = "mf_P702_TiaraStatueEffect"},
			-- Forgatasok!!
			ObjectChange	{Tag = "pzl_TiaraSword", ObjectId = 859, X = Tiara.Sword.X , Y = Tiara.Sword.Y , Direction = Tiara.Sword.Direction },
			ObjectChange	{Tag = "t_b_sword", ObjectId = 1542, X = 342, Y = 295, Direction = 0 },
			ObjectChange	{Tag = "pzl_TiaraStatue", ObjectId = 2110, X = Tiara.Statue.X , Y = Tiara.Statue.Y , Direction = Tiara.Statue.Direction },
			ObjectChange	{Tag = "pzl_TiaraChest", ObjectId = 1918, X = Tiara.Chest.X , Y = Tiara.Chest.Y , Direction = Tiara.Chest.Direction },
			ObjectChange	{Tag = "pzl_TiaraShield", ObjectId = 860, X = Tiara.Shield.X , Y = Tiara.Shield.Y , Direction = Tiara.Shield.Direction },
			
			MapFlagSetTrue{Name = "mf_P702_TiaraSwordFacNowhere"},
			MapFlagSetTrue{Name = "mf_P702_TiaraStatFacNowhere"},
			MapFlagSetTrue{Name = "mf_P702_TiaraChestFacNowhere"},
			MapFlagSetTrue{Name = "mf_P702_TiaraShieldFacNowhere"},
			
			MapFlagSetFalse{Name = "mf_P702_TiaraChestFacCrystal"},
			MapFlagSetFalse{Name = "mf_P702_TiaraChestFacTorch"},
			MapFlagSetFalse{Name = "mf_P702_TiaraChestFacStatue"},
			MapFlagSetFalse{Name = "mf_P702_TiaraChestFacCauldron"},
			
			MapFlagSetFalse{Name = "mf_P702_TiaraStatFacTorch"},
			MapFlagSetFalse{Name = "mf_P702_TiaraStatFacSword"},
			MapFlagSetFalse{Name = "mf_P702_TiaraStatFacCauldron"},
			MapFlagSetFalse{Name = "mf_P702_TiaraStatFacCup"},			

			MapFlagSetFalse{Name = "mf_P702_TiaraSwordFacShield"},
			MapFlagSetFalse{Name = "mf_P702_TiaraSwordFacStatue"},
			MapFlagSetFalse{Name = "mf_P702_TiaraSwordFacCup"},
			MapFlagSetFalse{Name = "mf_P702_TiaraSwordFacChest"},
			
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldFacTorch"},
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldFacChest"},
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldFacCauldron"},
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldFacCup"},
			
			MapFlagSetFalse{Name = "mf_P702_TiaraCauldronWrong"},
			
			EntityValueIncrease	{Name = "ev_TiaraReset"},
			MapFlagSetFalse{Name = "mf_P702_TiaraReset"},
			
			EventReEnable	{Name = "Tiara_Cauldron_Wrong"},
			EventReEnable	{Name = "Tiara_Cup_Wrong"},
			EventReEnable	{Name = "Tiara_Crystal_Wrong"},
			EventReEnable	{Name = "Tiara_Shield_Wrong"},
			EventReEnable	{Name = "Tiara_Shield_WrongDirection"},
			EventReEnable	{Name = "Tiara_Chest_Wrong"},
			EventReEnable	{Name = "Tiara_Chest_WrongDirection"},
			EventReEnable	{Name = "Tiara_Sword_Wrong"},
			EventReEnable	{Name = "Tiara_Sword_WrongDirection"},
			EventReEnable	{Name = "Tiara_Statue_Wrong"},
			EventReEnable	{Name = "Tiara_Statue_WrongDirection"},
			EventReEnable	{Name = "Tiara_Outcry_NoFirst"},
			EventReEnable	{Name = "Tiara_Outcry_WrongDirection"},
			EventReEnable	{Name = "Tiara_Outcry_Reset-3x"},
			EventReEnable	{Name = "Tiara_Outcry_SwordActivated"},
			EventReEnable	{Name = "Tiara_Outcry_TorchActivated"},
			EventReEnable	{Name = "Tiara_Outcry_ShieldActivated"},
			EventReEnable	{Name = "Tiara_Outcry_ChestHelp"},
			EventReEnable	{Name = "Tiara_Outcry_CauldronHelp"},
			EventReEnable	{Name = "Tiara_Cauldron_Effect"},
			EventReEnable	{Name = "Tiara_Chest_Effect"},
			EventReEnable	{Name = "Tiara_Crystal_Effect"},
			EventReEnable	{Name = "Tiara_Cup_Effect"},
			EventReEnable	{Name = "Tiara_Shield_Effect"},
			EventReEnable	{Name = "Tiara_Sword_Effect"},
			EventReEnable	{Name = "Tiara_Statue_Effect"},
			EventReEnable	{Name = "Tiara_Torch_Effect"},
			
			ObjectVanish	{Tag = "Tiara_fire_Z1"},
			ObjectVanish	{Tag = "Tiara_fire_Z2"},
			ObjectVanish	{Tag = "Tiara_fire_K1"},
			ObjectVanish	{Tag = "Tiara_fire_K2"},
			ObjectVanish	{Tag = "Tiara_fire_P1"},
			ObjectVanish	{Tag = "Tiara_fire_P2"},
			ObjectVanish	{Tag = "Tiara_fire_P3"},
			
			MapTimerStart	{Name = "TiaraResetOutcryTimer"},
			--MapFlagSetTrue{Name = "mf_P702_TiaraResetOutcry"},
			MapFlagSetFalse{Name = "mf_P702_TiaraReset"},
			--MapFlagSetFalse{Name = "mf_P702_TiaraResetFirst"},
			--FigureOutcry	{TextTag = "TiaraCry13", Tag = "Trialmaster"},
			
			EventReEnable	{Name = "Tiara_Reset"},
			--DialogSetEnabled	{Tag = "qg_GuardianStone10"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Tiara_Reset_First",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_TiaraResetFirst"},
			MapTimerIsElapsed	{Name = "TiaraResetOutcryTimer", Seconds = 1},
			SetUpdateInterval	{Steps = 9},
		},
		Actions = 
		{
			MapTimerStop	{Name = "TiaraResetOutcryTimer"},
			MapFlagSetFalse{Name = "mf_P702_TiaraResetFirst"},
		},
		GotoState = self,
	};


	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Reset_Outcry",
		Name = "Tiara_Reset_Outcry",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "TiaraResetOutcryTimer", Seconds = 2},
			--MapFlagIsTrue{Name = "mf_P702_TiaraResetOutcry"},
			--MapFlagIsTrue{Name = "mf_P702_TiaraReset"},
			--MapFlagIsFalse{Name = "mf_P702_TiaraResetFirst"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			SetUpdateInterval	{Steps = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "TiaraResetOutcryTimer"},
			FigureOutcry	{TextTag = "TiaraCry13", Tag = "Trialmaster"},
			--MapFlagSetFalse{Name = "mf_P702_TiaraResetOutcry"},
			EventReEnable	{Name = "Tiara_Reset_Outcry"},
		},
		GotoState = self,
	};




	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Cauldron_Wrong",
		Name = "Tiara_Cauldron_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCauldronActivated"},
			OR
			{
				MapFlagIsFalse{Name = "mf_P702_TiaraSwordActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraShieldActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraCupActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraCrystalActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraChestActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraStatueActivated"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraCauldronWrong"},
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
			
		},
		GotoState = self,
	};


	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Cup_Wrong",
		Name = "Tiara_Cup_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCupActivated"},
			OR
			{
				MapFlagIsFalse{Name = "mf_P702_TiaraSwordActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraShieldActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraCrystalActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraChestActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraStatueActivated"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Crystal_Wrong",
		Name = "Tiara_Crystal_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCrystalActivated"},
			OR
			{
				MapFlagIsFalse{Name = "mf_P702_TiaraSwordActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraChestActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraStatueActivated"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Shield_Wrong",
		Name = "Tiara_Shield_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated"},
			OR
			{
				MapFlagIsFalse{Name = "mf_P702_TiaraSwordActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraCrystalActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraChestActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraStatueActivated"},
				--MapFlagIsFalse{Name = "mf_P702_TiaraShieldFacCup"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Shield_WrongDirection",
		Name = "Tiara_Shield_WrongDirection",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated"},
			MapFlagIsFalse{Name = "mf_P702_TiaraShieldFacCup"},
		},
		Actions = 
		{
			EntityValueIncrease	{Name = "ev_TiaraWrongDirection"},
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Chest_Wrong",
		Name = "Tiara_Chest_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraChestActivated"},
			OR
			{
				MapFlagIsFalse{Name = "mf_P702_TiaraSwordActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraStatueActivated"},
				--MapFlagIsFalse{Name = "mf_P702_TiaraChestFacCrystal"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Chest_WrongDirection",
		Name = "Tiara_Chest_WrongDirection",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraChestActivated"},
			MapFlagIsFalse{Name = "mf_P702_TiaraChestFacCrystal"},
		},
		Actions = 
		{
			EntityValueIncrease	{Name = "ev_TiaraWrongDirection"},
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};		
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Sword_Wrong",
		Name = "Tiara_Sword_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordActivated"},
			OR
			{
				MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
				MapFlagIsFalse{Name = "mf_P702_TiaraStatueActivated"},
				--MapFlagIsFalse{Name = "mf_P702_TiaraSwordFacChest"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Sword_WrongDirection",
		Name = "Tiara_Sword_WrongDirection",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordActivated"},
			MapFlagIsFalse{Name = "mf_P702_TiaraSwordFacChest"},
		},
		Actions = 
		{
			EntityValueIncrease	{Name = "ev_TiaraWrongDirection"},
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Statue_Wrong",
		Name = "Tiara_Statue_Wrong",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraStatueActivated"},
			MapFlagIsFalse{Name = "mf_P702_TiaraTorchActivated"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Statue_WrongDirection",
		Name = "Tiara_Statue_WrongDirection",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsTrue{Name = "mf_P702_TiaraStatueActivated"},
			MapFlagIsFalse{Name = "mf_P702_TiaraStatFacSword"},
		},
		Actions = 
		{
			EntityValueIncrease	{Name = "ev_TiaraWrongDirection"},
			MapFlagSetTrue{Name = "mf_P702_TiaraReset"},
		},
		GotoState = self,
	};

	---------------------------------------------	
	-- Tiara Outcry-ok szamlaloval!
	---------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - NoFirst",
		Name = "Tiara_Outcry_NoFirst",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			EntityValueIsEqual	{Name = "ev_TiaraNoFirst", Value = 3},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry06", Tag = "pl_HumanAvatar"},
			EntityValueSet	{Name = "ev_TiaraNoFirst", Value = 0},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - WrongDirection",
		Name = "Tiara_Outcry_WrongDirection",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			EntityValueIsEqual	{Name = "ev_TiaraWrongDirection", Value = 3},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry07", Tag = "pl_HumanAvatar"},
			EntityValueSet	{Name = "ev_TiaraWrongDirection", Value = 0},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Tiara_Outcry_Reset-5x",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			EntityValueIsEqual	{Name = "ev_TiaraReset", Value = 5},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry08", Tag = "pl_HumanAvatar"},
			EntityValueSet	{Name = "ev_TiaraReset", Value = 0},
			MapFlagSetTrue	{Name = "mf_P702_TiaraReset5x"},
			
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - Reset-3x",
		Name = "Tiara_Outcry_Reset-3x",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			EntityValueIsEqual	{Name = "ev_TiaraReset", Value = 3},
			MapFlagIsTrue	{Name = "mf_P702_TiaraReset5x"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry08", Tag = "pl_HumanAvatar"},
			EntityValueSet	{Name = "ev_TiaraReset", Value = 0},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - SwordActivated",
		Name = "Tiara_Outcry_SwordActivated",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordActivated_Outcry"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordActivated"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry04", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse{Name = "mf_P702_TiaraSwordActivated_Outcry"},
		},
		GotoState = self,
	};	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - TorchActivated",
		Name = "Tiara_Outcry_TorchActivated",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated_Outcry"},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry01", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "TiaraCry03", Tag = "pl_HumanAvatar"},
			MapFlagSetFalse{Name = "mf_P702_TiaraTorchActivated_Outcry"},
		},
		GotoState = self,
	};		
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - ShieldActivated",
		Name = "Tiara_Outcry_ShieldActivated",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated_Outcry"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry02", Tag = "pl_HumanHeroCaine"},
			MapFlagSetFalse{Name = "mf_P702_TiaraShieldActivated_Outcry"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - ChestHelp",
		Name = "Tiara_Outcry_ChestHelp",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			GameDifficulty {Value = 1},
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			EntityValueIsEqual	{Name = "ev_TiaraReset", Value = 2},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			--MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated_Outcry"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry09", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "TiaraCry10", Tag = "pl_HumanAvatar"},
			--MapFlagSetFalse{Name = "mf_P702_TiaraShieldActivated_Outcry"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara - Outcry - CauldronHelp",
		Name = "Tiara_Outcry_CauldronHelp",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_TIARA"},
			GameDifficulty {Value = 1},
			--MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			EntityValueIsEqual	{Name = "ev_TiaraReset", Value = 3},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCauldronWrong"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			--MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated_Outcry"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "TiaraCry11", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "TiaraCry12", Tag = "pl_HumanAvatar"},
			--MapFlagSetFalse{Name = "mf_P702_TiaraShieldActivated_Outcry"},
		},
		GotoState = self,
	};
	
	---------------------------------------------	
	-- Tiara Outcry section end
	---------------------------------------------
	-- Tiara effect section
	---------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Cauldron_Effect",
		Name = "Tiara_Cauldron_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCauldronActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCauldronEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			EffectStart	{Tag = "Tiara_fire_P1", File = "Effect_Firestorm_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Chest_Effect",
		Name = "Tiara_Chest_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraChestActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraChestEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3114, TargetTag = "mrk_Tiara_centrum", Direction = 120, Tag = "Tiara_fire_P1"},
			EffectStart	{Tag = "Tiara_fire_P1", File = "Effect_Extinct_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Crystal_Effect",
		Name = "Tiara_Crystal_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCrystalActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCrystalEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3117, TargetTag = "mrk_Tiara_centrum", Direction = 120, Tag = "Tiara_fire_P2"},
			EffectStart	{Tag = "Tiara_fire_P2", File = "Effect_AreaPain_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Cup_Effect",
		Name = "Tiara_Cup_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCupActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraCupEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3114, TargetTag = "mrk_Tiara_centrum", Direction = 240, Tag = "Tiara_fire_K2"},
			EffectStart	{Tag = "Tiara_fire_K2", File = "Effect_AreaShock_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Shield_Effect",
		Name = "Tiara_Shield_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraShieldEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3112, TargetTag = "mrk_Tiara_centrum", Direction = 240, Tag = "Tiara_fire_Z1"},
			EffectStart	{Tag = "Tiara_fire_Z1", File = "Effect_AreaPain_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Statue_Effect",
		Name = "Tiara_Statue_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraStatueActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraStatueEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3115, TargetTag = "mrk_Tiara_centrum", Direction = 0, Tag = "Tiara_fire_Z2"},
			EffectStart	{Tag = "Tiara_fire_Z2", File = "Effect_AreaHeal_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Sword_Effect",
		Name = "Tiara_Sword_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraSwordEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3120, TargetTag = "mrk_Tiara_centrum", Direction = 0, Tag = "Tiara_fire_P3"},
			EffectStart	{Tag = "Tiara_fire_P3", File = "Effect_AreaHypnotize_Impact"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Tiara_Torch_Effect",
		Name = "Tiara_Torch_Effect",
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_P702_TiaraReset"},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchActivated"},
			MapFlagIsTrue{Name = "mf_P702_TiaraTorchEffect"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 3113, TargetTag = "mrk_Tiara_centrum", Direction = 0, Tag = "Tiara_fire_K1"},
			EffectStart	{Tag = "Tiara_fire_K1", File = "Effect_AreaDecay_Impact"},
			
		},
		GotoState = self,
	};
	

	---------------------------------------------
	-- Tiara effect section end
	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_Caine",
		Name = "Teleport_Tiara_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_HeroFirst",
		Name = "Teleport_Tiara_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_HeroSecond",
		Name = "Teleport_Tiara_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_HeroThird",
		Name = "Teleport_Tiara_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_HeroOrc",
		Name = "Teleport_Tiara_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_CompanionCraigHuman",
		Name = "Teleport_Tiara_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Tiara_CompanionSariel",
		Name = "Teleport_Tiara_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Tiara_centrum", Range = 35},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_Tiara_centrum", Range = 35},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Tiara_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
}
