State
{
	StateName = "INIT",
	
	
	OnOneTimeRepeatEvent
	{
		EventName = ghost_02_dialog_fix,
		Name = "ghost_02_dialog_fix",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_02_dialog_started" },
			MapFlagIsFalse{ Name = "mf_AvatarIsTalking" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 568.293, Y = 144.178},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ghost_03_dialog_fix,
		Name = "ghost_03_dialog_fix",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_03_dialog_started" },
			MapFlagIsFalse{ Name = "mf_AvatarIsTalking" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 577.536, Y = 129.937},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ghost_04_dialog_fix,
		Name = "ghost_04_dialog_fix",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_04_dialog_started" },
			MapFlagIsFalse{ Name = "mf_AvatarIsTalking" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 563.189, Y = 156.982 },
			MapFlagSetFalse	{Name = "mf_P703_ghost_04_dialog_started"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ghost_05_dialog_fix,
		Name = "ghost_05_dialog_fix",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_05_dialog_started" },
			MapFlagIsFalse{ Name = "mf_AvatarIsTalking" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 573.673, Y = 157.055},
			MapFlagSetFalse	{Name = "mf_P703_ghost_05_dialog_started"},
		},
	},
	
	OnOneTimeRepeatEvent
	{
		EventName = ghost_06_dialog_fix,
		Name = "ghost_06_dialog_fix",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_06_dialog_started" },
			MapFlagIsFalse{ Name = "mf_AvatarIsTalking" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 569.899, Y = 166.802 },
			MapFlagSetFalse	{Name = "mf_P703_ghost_06_dialog_started"},
		},
	},
	
	
	OnOneTimeRepeatEvent
	{
		EventName = ghost_08_dialog_fix,
		Name = "ghost_08_dialog_fix",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_ghost_08_dialog_started" },
			MapFlagIsFalse{ Name = "mf_AvatarIsTalking" },
		},
		
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 566.57, Y = 147.387 },
			MapFlagSetFalse	{Name = "mf_P703_ghost_08_dialog_started"},
		},
	},
	
}
