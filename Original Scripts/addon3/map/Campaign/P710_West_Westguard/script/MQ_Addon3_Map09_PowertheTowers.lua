State
	{	
	StateName = "INIT",
			
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower01", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower02", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower03", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower04", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower05", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower06", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower07", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower08", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower09", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower10", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower11", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower12", Range = 10},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower13", Range = 10},
				},
				QuestIsNotActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
				QuestIsNotSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_Tower_Found"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_SHAIKAN"},
				DialogSetEnabled	{Tag = "Shaikan_Leader"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsNotActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
				MapFlagIsTrue {Name = "mf_P710_StartClanCS_End"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_Tower_Found"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_SHAIKAN"},
				DialogSetEnabled	{Tag = "Shaikan_Leader"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				QuestIsNotActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
				QuestIsNotSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_Crystal_Found"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_SHAIKAN"},
				DialogSetEnabled	{Tag = "Shaikan_Leader"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue{Name = "mf_P710_PowertheTowers_Quest"},
				MapFlagIsTrue{Name = "mf_P710_Destroy_Nameless01_Quest"},
				MapFlagIsTrue{Name = "mf_P710_Destroy_Nameless02_Quest"},
				MapFlagIsTrue{Name = "mf_P710_Destroy_Nameless03_Quest"},
			},
			Actions = 
			{
				--DialogSetDisabled	{Tag = "Shaikan_Leader"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarIsNotTalking	{},
				MapFlagIsTrue{Name = "mf_P710_PowertheTowers_Quest"},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_SHAIKAN"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_REPAIR"},
				DialogSetEnabled	{Tag = "Tower_Lever"},
				DialogSetEnabled	{Tag = "Tower_Lever_Dummy"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarIsNotTalking	{},
				MapFlagIsTrue{Name = "mf_P710_Towers_Repaired"},
			},
			Actions = 
			{
				DialogSetDisabled	{Tag = "Tower_Lever"},
				DialogSetDisabled	{Tag = "Tower_Lever_Dummy"},
				LeverSetEnabled	{Tag = "Tower_Lever"},
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_REPAIR"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_GATHER"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
			},
			Actions = 
			{
				LeverSetDisabled	{Tag = "Tower_Lever"},
				QuestSetActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_POWER"},
				BuildingTeamTransfer	{Tag = "Tower01", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower02", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower03", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower04", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower05", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower06", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower07", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower08", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower09", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower10", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower11", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower12", Team = "tm_Towers"},
				BuildingTeamTransfer	{Tag = "Tower13", Team = "tm_Towers"},
				FogOfWarRevealAtEntity	{FogOfWarId = 101, Tag = "Tower01", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 102, Tag = "Tower02", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 103, Tag = "Tower03", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 104, Tag = "Tower04", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 105, Tag = "Tower05", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 106, Tag = "Tower06", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 107, Tag = "Tower07", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 108, Tag = "Tower08", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 109, Tag = "Tower09", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 110, Tag = "Tower10", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 111, Tag = "Tower11", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 112, Tag = "Tower12", Range = 32, Height = 30},
				FogOfWarRevealAtEntity	{FogOfWarId = 113, Tag = "Tower13", Range = 32, Height = 30},
				EffectStartAddon3	{Tag = "Tower01", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower02", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower03", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower04", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower05", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower06", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower07", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower08", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower09", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower10", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower11", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower12", File = "Effect_Misc_MagicFireBigBlue"},
				EffectStartAddon3	{Tag = "Tower13", File = "Effect_Misc_MagicFireBigBlue"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = Crystal_Dummy_Detect,
			Name = "Crystal_Dummy_Detect",
			Conditions = 
			{
				AvatarHasItemMisc	{Player = "pl_Human", ItemId = 769, Amount = 1},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 769, Amount = 1},
				MapValueIncrease	{Name = "mv_P710_Crystals_Gathered"},
				MapFlagSetTrue	{Name = "mf_P710_Dummy_Crystal"},
				EventReEnable	{Name = "Crystal_AddCrystal"},
			},
		};
		
		OnOneTimeRepeatEvent
		{
			EventName = Crystal_AddCrystal,
			Name = "Crystal_AddCrystal",
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Dummy_Crystal"},
			},
			Actions = 
			{
				MapFlagSetFalse	{Name = "mf_P710_Dummy_Crystal"},
				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EventReEnable	{Name = "Crystal_Dummy_Detect"},
			},
		};
				
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Creep_Spawn"},
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_GATHER"},
				OR
				{
					MapValueIsGreater	{Name = "mv_P710_Crystals_Gathered", Value = 9},
					MapValueIsEqual	{Name = "mv_P710_Crystals_Gathered", Value = 9},
				},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_GATHER"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower01", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower01", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower01", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower01_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower02", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower02", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower02", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower02_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower03", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower03", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower03", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower03_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower04", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower04", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower04", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower04_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower05", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower05", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower05", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower05_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower06", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower06", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower06", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower06_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower07", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower07", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower07", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower07_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower08", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower08", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower08", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower08_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower09", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower09", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower09", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower09_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower10", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower10", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower10", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower10_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower11", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower11", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower11", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower11_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower12", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower12", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower12", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower12_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				LeverIsOn	{Tag = "Tower_Lever"},
				AvatarHasItemMisc	{Player = "default", ItemId = 765, Amount = 1},
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Tower13", Range = 10},
			},
			Actions = 
			{
				AvatarItemMiscTake	{Player = "pl_Human", ItemId = 765, Amount = 1},
				EffectStart	{Tag = "Tower13", File = "Effect_Prop_Demon_Godstone"},
				BuildingAbilityAdd	{Tag = "Tower13", AbilityId = 234},
				MapFlagSetTrue	{Name = "mf_P710_Tower13_Powered"},
				MapValueIncrease	{Name = "mv_P710_Tower_Powered"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsActive	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_POWER"},
				MapValueIsEqual	{Name = "mv_P710_Tower_Powered", Value = 9},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS_POWER"},
				QuestSetSolved	{Player = "default", Quest = "ADDON3_MAP09_POWERTHETOWERS"},
			},
		},
	};