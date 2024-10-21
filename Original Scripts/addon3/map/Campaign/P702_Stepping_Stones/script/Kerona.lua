------------------------------------------------------
---- 08: Kerona, goddess of the time ----
------------------------------------------------------	

State
{
	StateName = "INIT",


	-- Kerona bridge FOW disabled
	
	OnOneTimeEvent
	{
		EventName = "Kerona bridge 01 visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona10_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona10_Out", Range = 40, Height = 30},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Kerona bridge 02 visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona21_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona21_Out", Range = 25, Height = 30},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Kerona bridge 03 visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona32_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona32_Out", Range = 25, Height = 30},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona bridge 04 visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona23_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona23_Out", Range = 25, Height = 30},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona bridge 05 visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona54_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona54_Out", Range = 25, Height = 30},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona bridge 06a visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona65_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona65_Out", Range = 25, Height = 30},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona bridge 06b visible",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "Kerona56_Out"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Kerona56_Out", Range = 25, Height = 30},
		},
		GotoState = self,
	};
	
	-- First bridge outcry!
	
	OnOneTimeEvent
	{
		EventName = "Kerona bridge outcry",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona01_Out", Range = 2},
		},
		Actions = 
		{
			FigureCorpseRotForbid {Tag = "shap1"},
			FigureCorpseRotForbid {Tag = "shap2"},
			FigureCorpseRotForbid {Tag = "shap3"},
			FigureKill	{Tag = "shap1"},
			FigureKill	{Tag = "shap2"},
			FigureKill	{Tag = "shap3"},
			

			FigureOutcry	{TextTag = "KeronaCry01", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};


	
	-- Kerona mapflagset - quest mapflags
	
	OnOneTimeEvent
	{
		EventName = "Kerona 1 done",
		Conditions = 
		{

				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "mrk_Kerona_1cs", Range = 5},
				MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},

		},
		Actions = 
		{
			--MapFlagSetTrue {Name = "mf_P702_Kerona_CS01_Start"},  --cutscene starter
			MapFlagSetTrue {Name = "mf_P702_Kerona1_Done"},
			FigureOutcry	{TextTag = "KeronaCry02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "KeronaCry03", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "KeronaCry04", Tag = "pl_HumanAvatar"},
			FigureHealthSet	{Tag = "KeronaDragon", Percent = 2},
			FigureAbilityAdd	{Tag = "KeronaDragon", AbilityId = 94},
			FigureDirectionSet	{Tag = "KeronaDragon", Direction = 343},
			FigureHoldPosition	{Tag = "KeronaDragon"},
			--FigureHoldPosition	{Tag = "KeronaSoldier1"},
			--FigureHoldPosition	{Tag = "KeronaSoldier2"},
			--FigureHoldPosition	{Tag = "KeronaSoldier3"},
			--FigureHoldPosition	{Tag = "KeronaSoldier4"},
			FigureTeamTransfer	{Tag = "KeronaDragon", Team = "tm_Kerona2"},
			FigureTeamTransfer	{Tag = "KeronaSoldier1", Team = "tm_Kerona1"},
			FigureTeamTransfer	{Tag = "KeronaSoldier2", Team = "tm_Kerona1"},
			FigureTeamTransfer	{Tag = "KeronaSoldier3", Team = "tm_Kerona1"},
			FigureTeamTransfer	{Tag = "KeronaSoldier4", Team = "tm_Kerona1"},
			FigureTeamTransfer	{Tag = "KeronaSoldier5", Team = "tm_Kerona1"},
			FigureTeamTransfer	{Tag = "KeronaSoldier6", Team = "tm_Kerona1"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Kerona 2 done",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona12_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona12_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona12_Out", Range = 0.5},
			}
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Kerona2_Done"},
			FigureOutcry	{TextTag = "KeronaCry05", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "KeronaCry06", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "KeronaCry07", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona 3 done",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona23_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona23_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona23_Out", Range = 0.5},
			}
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Kerona3_Done"},
			FigureOutcry	{TextTag = "KeronaCry08", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "KeronaCry09", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "KeronaCry10", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona 4 done",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona34_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona34_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona34_Out", Range = 0.5},
			}
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Kerona4_Done"},
			FigureOutcry	{TextTag = "KeronaCry11", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "KeronaCry12", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "KeronaCry13", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Kerona 5 done",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona45_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona45_Out", Range = 0.5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona45_Out", Range = 0.5},
			}
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P702_Kerona5_Done"},
			FigureOutcry	{TextTag = "KeronaCry14", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "KeronaCry15", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "KeronaCry16", Tag = "pl_HumanHeroCaine"},
		},
		GotoState = self,
	};
	
	-- Kerona travels (teleport_to_the other side of a bridge!)
	
	--------------------------------------------------------------------
	-- Avatar travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_0_to_1",
		Name = "Avatar_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona01_In", Range = DetectRange},
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_1_to_0",
		Name = "Avatar_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_1_to_2",
		Name = "Avatar_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_2_to_1",
		Name = "Avatar_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_2_to_3",
		Name = "Avatar_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_3_to_2",
		Name = "Avatar_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_3_to_4",
		Name = "Avatar_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_4_to_3",
		Name = "Avatar_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_4_to_5",
		Name = "Avatar_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_5_to_4",
		Name = "Avatar_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_5_to_6",
		Name = "Avatar_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Avatar_travel_Kerona_6_to_5",
		Name = "Avatar_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanAvatar"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "Avatar_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- Caine travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_0_to_1",
		Name = "Caine_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona01_In", Range = DetectRange},
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_1_to_0",
		Name = "Caine_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_1_to_2",
		Name = "Caine_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_2_to_1",
		Name = "Caine_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_2_to_3",
		Name = "Caine_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_3_to_2",
		Name = "Caine_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_3_to_4",
		Name = "Caine_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_4_to_3",
		Name = "Caine_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_4_to_5",
		Name = "Caine_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_5_to_4",
		Name = "Caine_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_5_to_6",
		Name = "Caine_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "Caine_travel_Kerona_6_to_5",
		Name = "Caine_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroCaine"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "Caine_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- HeroFirst travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_0_to_1",
		Name = "HeroFirst_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona01_In", Range = DetectRange},
			MapFlagIsTrue{Name = "mf_P702_KeronaAccepted"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_1_to_0",
		Name = "HeroFirst_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_1_to_2",
		Name = "HeroFirst_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_2_to_1",
		Name = "HeroFirst_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_2_to_3",
		Name = "HeroFirst_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_3_to_2",
		Name = "HeroFirst_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_3_to_4",
		Name = "HeroFirst_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_4_to_3",
		Name = "HeroFirst_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_4_to_5",
		Name = "HeroFirst_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_5_to_4",
		Name = "HeroFirst_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_5_to_6",
		Name = "HeroFirst_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroFirst_travel_Kerona_6_to_5",
		Name = "HeroFirst_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroFirst"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "HeroFirst_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- HeroSecond travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_0_to_1",
		Name = "HeroSecond_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona01_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_1_to_0",
		Name = "HeroSecond_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_1_to_2",
		Name = "HeroSecond_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_2_to_1",
		Name = "HeroSecond_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_2_to_3",
		Name = "HeroSecond_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_3_to_2",
		Name = "HeroSecond_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_3_to_4",
		Name = "HeroSecond_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_4_to_3",
		Name = "HeroSecond_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_4_to_5",
		Name = "HeroSecond_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_5_to_4",
		Name = "HeroSecond_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_5_to_6",
		Name = "HeroSecond_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroSecond_travel_Kerona_6_to_5",
		Name = "HeroSecond_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroSecond"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "HeroSecond_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- HeroThird travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_0_to_1",
		Name = "HeroThird_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona01_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_1_to_0",
		Name = "HeroThird_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_1_to_2",
		Name = "HeroThird_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_2_to_1",
		Name = "HeroThird_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_2_to_3",
		Name = "HeroThird_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_3_to_2",
		Name = "HeroThird_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_3_to_4",
		Name = "HeroThird_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_4_to_3",
		Name = "HeroThird_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_4_to_5",
		Name = "HeroThird_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_5_to_4",
		Name = "HeroThird_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_5_to_6",
		Name = "HeroThird_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroThird_travel_Kerona_6_to_5",
		Name = "HeroThird_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroThird"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "HeroThird_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- HeroOrc travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_0_to_1",
		Name = "HeroOrc_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona01_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_1_to_0",
		Name = "HeroOrc_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_1_to_2",
		Name = "HeroOrc_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_2_to_1",
		Name = "HeroOrc_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_2_to_3",
		Name = "HeroOrc_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_3_to_2",
		Name = "HeroOrc_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_3_to_4",
		Name = "HeroOrc_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_4_to_3",
		Name = "HeroOrc_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_4_to_5",
		Name = "HeroOrc_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_5_to_4",
		Name = "HeroOrc_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_5_to_6",
		Name = "HeroOrc_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "HeroOrc_travel_Kerona_6_to_5",
		Name = "HeroOrc_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanHeroOrc"},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "HeroOrc_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- CompanionCraigHuman travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_0_to_1",
		Name = "CompanionCraigHuman_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona01_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_1_to_0",
		Name = "CompanionCraigHuman_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_1_to_2",
		Name = "CompanionCraigHuman_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_2_to_1",
		Name = "CompanionCraigHuman_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_2_to_3",
		Name = "CompanionCraigHuman_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_3_to_2",
		Name = "CompanionCraigHuman_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_3_to_4",
		Name = "CompanionCraigHuman_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_4_to_3",
		Name = "CompanionCraigHuman_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_4_to_5",
		Name = "CompanionCraigHuman_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_5_to_4",
		Name = "CompanionCraigHuman_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_5_to_6",
		Name = "CompanionCraigHuman_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionCraigHuman_travel_Kerona_6_to_5",
		Name = "CompanionCraigHuman_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionCraigHuman"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "CompanionCraigHuman_travel_Kerona_6_to_5"},
		},
	},
	
	--------------------------------------------------------------------
	-- CompanionSariel travel
	--------------------------------------------------------------------
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_0_to_1",
		Name = "CompanionSariel_travel_Kerona_0_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona01_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona01_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_0_to_1"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_1_to_0",
		Name = "CompanionSariel_travel_Kerona_1_to_0",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona10_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona10_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_1_to_0"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_1_to_2",
		Name = "CompanionSariel_travel_Kerona_1_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona12_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona12_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_1_to_2"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_2_to_1",
		Name = "CompanionSariel_travel_Kerona_2_to_1",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona21_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona21_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_2_to_1"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_2_to_3",
		Name = "CompanionSariel_travel_Kerona_2_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona23_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona23_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_2_to_3"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_3_to_2",
		Name = "CompanionSariel_travel_Kerona_3_to_2",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona32_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona32_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_3_to_2"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_3_to_4",
		Name = "CompanionSariel_travel_Kerona_3_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona34_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona34_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_3_to_4"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_4_to_3",
		Name = "CompanionSariel_travel_Kerona_4_to_3",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona43_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona43_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_4_to_3"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_4_to_5",
		Name = "CompanionSariel_travel_Kerona_4_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona45_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona45_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_4_to_5"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_5_to_4",
		Name = "CompanionSariel_travel_Kerona_5_to_4",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona54_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona54_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_5_to_4"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_5_to_6",
		Name = "CompanionSariel_travel_Kerona_5_to_6",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona56_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona56_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_5_to_6"},
		},
	},	

	OnOneTimeRepeatEvent
	{
		EventName = "CompanionSariel_travel_Kerona_6_to_5",
		Name = "CompanionSariel_travel_Kerona_6_to_5",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = "pl_HumanCompanionSariel"},
			FigureIsInEntityRange	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona65_In", Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona65_Out"},
			EventReEnable	{Name = "CompanionSariel_travel_Kerona_6_to_5"},
		},
	},
	
	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_Caine",
		Name = "Teleport_Kerona_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_HeroFirst",
		Name = "Teleport_Kerona_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_HeroSecond",
		Name = "Teleport_Kerona_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_HeroThird",
		Name = "Teleport_Kerona_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_HeroOrc",
		Name = "Teleport_Kerona_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_CompanionCraigHuman",
		Name = "Teleport_Kerona_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Kerona_CompanionSariel",
		Name = "Teleport_Kerona_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona01_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona10_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona32_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona43_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona54_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona56_Out", Range = 30},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "Kerona65_Out", Range = 30},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Kerona_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
}