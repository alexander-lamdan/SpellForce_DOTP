State
	{	
	StateName = "INIT",
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Player = "default", Quest = "SQ05_TWIDDLE_TWO_TWIDDLE_FREE"},
				QuestIsActive	{Player = "default", Quest = "SSSR_SQ_06_TWIDDLE"},
				QuestIsActive	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},
			},
			Actions = 
			{
				QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_06_TWIDDLE"},
				FigureTeleport	{Tag = "Twiddle4", X = 485, Y = 45},
				FigureDirectionSet	{Tag = "Twiddle4", Direction = 180},
				FogOfWarReveal	{FogOfWarId = 2, X = 483, Y = 50, Range = 12, Height = 64},
				EffectStart	{Tag = "Cauldron", File = "Effect_Misc_FireMedium"},
				EffectStart	{Tag = "Cauldron", File = "Effect_Misc_SmokeChimney03_Uni"},
			},
		},
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle4", Range = 20},
				AvatarIsNotTalking	{},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				AvatarMountUnmountDragon {Player = "pl_Human"},
				MapFlagSetTrue	{Name = "mf_P710_StartTwiddleCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle4", Range = 20},
				AvatarIsNotTalking	{},
				AvatarFlagIsFalse {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_StartTwiddleCS"},
			},
		},
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartTwiddleCS_End"},
			},
			Actions = 
			{
				AvatarItemEquipmentGive	{Player = "default", ItemId = 3049, Amount = 1},
				QuestSetActive	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
				DialogSetEnabled	{Tag = "Twiddle1"},
				DialogSetEnabled	{Tag = "Twiddle2"},
				DialogSetEnabled	{Tag = "Twiddle3"},
				DialogSetEnabled	{Tag = "Twiddle4"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_FourTwiddles_Twiddle1_Talked"},
				MapFlagIsTrue	{Name = "mf_P710_FourTwiddles_Twiddle2_Talked"},
				MapFlagIsTrue	{Name = "mf_P710_FourTwiddles_Twiddle3_Talked"},
				MapFlagIsTrue	{Name = "mf_P710_FourTwiddles_Twiddle4_Talked"},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_P710_FourTwiddlesCS"},
				DialogSetDisabled	{Tag = "Twiddle1"},
				DialogSetDisabled	{Tag = "Twiddle2"},
				DialogSetDisabled	{Tag = "Twiddle3"},
				DialogSetDisabled	{Tag = "Twiddle4"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_FourTwiddlesCS", Seconds = 2},
				AvatarIsNotTalking	{},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				AvatarMountUnmountDragon {Player = "pl_Human"},
				MapTimerStop	{Name = "mt_P710_FourTwiddlesCS"},
				MapFlagSetTrue	{Name = "mf_P710_StartFourTwiddlesCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_FourTwiddlesCS", Seconds = 2},
				AvatarIsNotTalking	{},
				AvatarFlagIsFalse {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				MapTimerStop	{Name = "mt_P710_FourTwiddlesCS"},
				MapFlagSetTrue	{Name = "mf_P710_StartFourTwiddlesCS"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
			},
			Actions = 
			{
				VisualTimerStart	{Seconds = 120},
				MapTimerStart	{Name = "mt_P710_FourTwiddles"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
				MapTimerIsElapsed	{Name = "mt_P710_FourTwiddle", Seconds = 120},
				OR
				{
					MapFlagIsFalse	{Name = "mf_P710_Twiddle2_Sesame"},
					MapFlagIsFalse	{Name = "mf_P710_Twiddle3_Sesame"},
					MapFlagIsFalse	{Name = "mf_P710_Twiddle4_Sesame"},
				},
			},
			Actions = 
			{
				QuestSetInactive	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
				FigureIsDead	{Tag = "Twiddle_Titan"},
			},
			Actions = 
			{
				DialogSetEnabled	{Tag = "Twiddle2_DEAD"},
				DialogSetEnabled	{Tag = "Twiddle3_DEAD"},
				DialogSetEnabled	{Tag = "Twiddle4_DEAD"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
				FigureIsDead	{Tag = "Twiddle_Titan"},
				QuestIsActive	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle2_DEAD", Range = 1},
			},
			Actions = 
			{
				FigureVanish	{Tag = "Twiddle2_DEAD"},
				EffectStart	{Tag = "Twiddle2_Sesame", File = "Effect_Spawn_Unit"},
				FigureTeleport	{Tag = "Twiddle2_Sesame", X = 490, Y = 50},
				FigureTeleport	{Tag = "Twiddle2_Sesame", X = 490, Y = 50},
				FigureLookAtEntity	{Tag = "Twiddle2_Sesame", TargetTag = "pl_HumanAvatar"},
				FigureLookAtEntity	{Tag = "Twiddle2_Sesame", TargetTag = "pl_HumanAvatar"},
				MapFlagSetTrue	{Name = "mf_P710_Twiddle2_Sesame"},
				
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
				FigureIsDead	{Tag = "Twiddle_Titan"},
				QuestIsActive	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle3_DEAD", Range = 1},
			},
			Actions = 
			{
				FigureVanish	{Tag = "Twiddle3_DEAD"},
				EffectStart	{Tag = "Twiddle3_Sesame", File = "Effect_Spawn_Unit"},
				FigureTeleport	{Tag = "Twiddle3_Sesame", X = 489, Y = 47},
				FigureTeleport	{Tag = "Twiddle3_Sesame", X = 489, Y = 47},
				FigureLookAtEntity	{Tag = "Twiddle3_Sesame", TargetTag = "pl_HumanAvatar"},
				FigureLookAtEntity	{Tag = "Twiddle3_Sesame", TargetTag = "pl_HumanAvatar"},
				MapFlagSetTrue	{Name = "mf_P710_Twiddle3_Sesame"},
				
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartFourTwiddlesCS_End"},
				FigureIsDead	{Tag = "Twiddle_Titan"},
				QuestIsActive	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Twiddle4_DEAD", Range = 1},
			},
			Actions = 
			{
				FigureVanish	{Tag = "Twiddle4_DEAD"},
				EffectStart	{Tag = "Twiddle4_Sesame", File = "Effect_Spawn_Unit"},
				FigureTeleport	{Tag = "Twiddle4_Sesame", X = 485, Y = 45},
				FigureTeleport	{Tag = "Twiddle4_Sesame", X = 485, Y = 45},
				FigureLookAtEntity	{Tag = "Twiddle4_Sesame", TargetTag = "pl_HumanAvatar"},
				FigureLookAtEntity	{Tag = "Twiddle4_Sesame", TargetTag = "pl_HumanAvatar"},
				MapFlagSetTrue	{Name = "mf_P710_Twiddle4_Sesame"},
				
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle2_Sesame"},
				MapFlagIsTrue	{Name = "mf_P710_Twiddle3_Sesame"},
				MapFlagIsTrue	{Name = "mf_P710_Twiddle4_Sesame"},
			},
			Actions = 
			{
				VisualTimerStop	{},
				QuestSetSolved	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
				AvatarItemEquipmentGive	{Player = "default", ItemId = 3050, Amount = 1},
				MapTimerStart	{Name = "mf_P710_Twiddle_OpenSesame_Start"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mf_P710_Twiddle_OpenSesame_Start", Seconds = 10},
			},
			Actions = 
			{
				MapTimerStop	{Name = "mf_P710_Twiddle_OpenSesame_Start"},
				QuestSetActive	{Quest = "ADDON3_MAP09_TWIDDLE_OPENSESAME"},
				DialogSetEnabled	{Tag = "Twiddle4_Sesame"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle4_Sesame_Talked"},
			},
			Actions = 
			{
				DialogSetEnabled	{Tag = "Cauldron"},
				DialogSetEnabled	{Tag = "Twiddle2_Sesame"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle2_Sesame_Talked"},
			},
			Actions = 
			{
				DialogSetEnabled	{Tag = "Twiddle3_Sesame"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Cauldron1_End"},
			},
			Actions = 
			{
				DialogSetDisabled	{Tag = "Cauldron"},
				QuestSetSolved	{Quest = "ADDON3_MAP09_TWIDDLE_OPENSESAME"},
				QuestSetActive	{Quest = "ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Twiddle2_Sesame_Cauldron1_Talked"},
				MapFlagIsTrue	{Name = "mf_P710_Twiddle3_Sesame_Cauldron1_Talked"},
				MapFlagIsTrue	{Name = "mf_P710_Twiddle4_Sesame_Cauldron1_Talked"},
			},
			Actions = 
			{
				DialogSetEnabled	{Tag = "Cauldron"},
			},
		},

	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Cauldron2_Finished"},
				AvatarIsNotTalking	{},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_P710_StartPortalCS_Timer"},
				DialogSetDisabled	{Tag = "Twiddle2_Sesame"},
				DialogSetDisabled	{Tag = "Twiddle3_Sesame"},
				DialogSetDisabled	{Tag = "Twiddle4_Sesame"},
				DialogSetDisabled	{Tag = "Cauldron"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_StartPortalCS_Timer", Seconds = 4},
				AvatarIsNotTalking	{},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				AvatarMountUnmountDragon {Player = "pl_Human"},
				MapTimerStop	{Name = "mt_P710_StartPortalCS_Timer"},
				MapFlagSetTrue	{Name = "mf_P710_StartPortalCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_StartPortalCS_Timer", Seconds = 4},
				AvatarIsNotTalking	{},
				AvatarFlagIsFalse {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				MapTimerStop	{Name = "mt_P710_StartPortalCS_Timer"},
				MapFlagSetTrue	{Name = "mf_P710_StartPortalCS"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartPortalCS_End"},
			},
			Actions = 
			{
				QuestSetSolved	{Quest = "ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME"},
				QuestSetSolved	{Quest = "ROTG_SQ_07_Twiddle"},
				AvatarItemEquipmentGive	{Player = "default", ItemId = 3051, Amount = 1},
			},
		},
	};