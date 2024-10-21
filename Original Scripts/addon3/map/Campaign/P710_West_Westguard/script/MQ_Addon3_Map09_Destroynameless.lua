State
	{
	StateName = "INIT",
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarIsNotTalking	{},
				OR
				{
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless01_Quest"},
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless01_Quest_Contact"},
				},
			},
			Actions = 
			{
				QuestSetActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarIsNotTalking	{},
				OR
				{
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless02_Quest"},
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless02_Quest_Contact"},
				},
			},
			Actions = 
			{
				QuestSetActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarIsNotTalking	{},
				OR
				{
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless03_Quest"},
					MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless03_Quest_Contact"},
				},
			},
			Actions = 
			{
				QuestSetActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_01", Range = 40},
				QuestIsNotActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
				QuestIsNotSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_Destroy_Nameless01_Quest_Contact"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_01", Range = 40},
			},
			Actions = 
			{
				FogOfWarRevealAtEntity	{FogOfWarId = 7, Tag = "Nameless_HQ_01", Range = 24, Height = 40},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_02", Range = 60},
				QuestIsNotActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
				QuestIsNotSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_Destroy_Nameless02_Quest_Contact"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_02", Range = 70},
			},
			Actions = 
			{
				FogOfWarRevealAtEntity	{FogOfWarId = 8, Tag = "Nameless_HQ_02", Range = 48, Height = 40},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_03", Range = 60},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_04", Range = 60},
				},
				QuestIsNotActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
				QuestIsNotSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mf_P710_Destroy_Nameless03_Quest_Contact"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_03", Range = 60},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_04", Range = 60},
				},
			},
			Actions = 
			{
				FogOfWarRevealAtEntity	{FogOfWarId = 9, Tag = "Nameless_HQ_03", Range = 40, Height = 40},
				FogOfWarRevealAtEntity	{FogOfWarId = 10, Tag = "Nameless_HQ_04", Range = 40, Height = 40},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				--QuestIsActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
				FigureTeamIsNotInRange	{Team = "tm_Nameless", Range = 65, X = 535, Y = 340},
				BuildingTeamIsNotInRange {Team = "tm_Nameless", Range = 65, X = 535, Y = 340},
				--PlayerHasNotBuildingAmount	{Player = "pl_Nameless1", Amount = 1, OnlyCompleted = default},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_P710_ClanCSTimer"},
				PlayerBuildingTeamTransfer {Player = "pl_Nameless1", Team = "tm_NamelessTowers"},
				QuestSetSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_ClanCSTimer", Seconds = 10},
				AvatarIsNotTalking	{},
				AvatarFlagIsTrue {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				AvatarMountUnmountDragon {Player = "pl_Human"},
				MapTimerStop	{Name = "mt_P710_ClanCSTimer"},
				MapFlagSetTrue	{Name = "mf_P710_StartClanCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_ClanCSTimer", Seconds = 10},
				AvatarIsNotTalking	{},
				AvatarFlagIsFalse {Name = "af_DragonMounted"},
			},
			Actions = 
			{
				MapTimerStop	{Name = "mt_P710_ClanCSTimer"},
				MapFlagSetTrue	{Name = "mf_P710_StartClanCS"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				--QuestIsActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
				FigureTeamIsNotInRange	{Team = "tm_Nameless", Range = 65, X = 130, Y = 380},
				BuildingTeamIsNotInRange {Team = "tm_Nameless", Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 205, Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 206, Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 207, Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 208, Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 209, Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 210, Range = 65, X = 130, Y = 380},
				--PlayerBuildingIsNotInRange	{Player = "pl_Nameless2", BuildingId = 211, Range = 65, X = 130, Y = 380},
				--PlayerHasNotBuildingAmount	{Player = "pl_Nameless2", Amount = 1, OnlyCompleted = default},
			},
			Actions = 
			{
				QuestSetSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
				PlayerBuildingTeamTransfer {Player = "pl_Nameless2", Team = "tm_NamelessTowers"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				--QuestIsActive	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
				FigureTeamIsNotInRange	{Team = "tm_Nameless", Range = 70, X = 315, Y = 650},
				FigureTeamIsNotInRange	{Team = "tm_Nameless", Range = 70, X = 345, Y = 655},
				FigureTeamIsNotInRange	{Team = "tm_Nameless", Range = 70, X = 445, Y = 650},
				FigureTeamIsNotInRange	{Team = "tm_Nameless", Range = 70, X = 475, Y = 650},
				BuildingTeamIsNotInRange {Team = "tm_Nameless", Range = 70, X = 315, Y = 650},
				BuildingTeamIsNotInRange {Team = "tm_Nameless", Range = 70, X = 345, Y = 655},
				BuildingTeamIsNotInRange {Team = "tm_Nameless", Range = 70, X = 445, Y = 650},
				BuildingTeamIsNotInRange {Team = "tm_Nameless", Range = 70, X = 475, Y = 650},
				--PlayerHasNotBuildingAmount	{Player = "pl_Nameless3", Amount = 1, OnlyCompleted = default},
				--PlayerHasNotBuildingAmount	{Player = "pl_Nameless4", Amount = 1, OnlyCompleted = default},
			},
			Actions = 
			{
				QuestSetSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
				PlayerBuildingTeamTransfer {Player = "pl_Nameless3", Team = "tm_NamelessTowers"},
				PlayerBuildingTeamTransfer {Player = "pl_Nameless4", Team = "tm_NamelessTowers"},
			},
		},
	};