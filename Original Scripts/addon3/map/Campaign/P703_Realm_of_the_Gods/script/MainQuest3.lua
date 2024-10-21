
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Craig comes <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ2_Completed" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_03_Gate"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0301_Guide"},
			GateSetClosed	{Tag = "gate_01"},
			FigurePatrolWalk	{Tag = "craig_01",X = 619.683, Y = 156.888},
			--DialogSetEnabled	{Tag = "craig_01"}, --timer to wait autosave
			MapTimerStart {Name = "mt_P703_Craig_dialog_enabled_21s"},
			--FigureOutcry	{TextTag = "guide_01", Tag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Craigs dialog enabled after autosave<<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_Craig_dialog_enabled_21s", Seconds = 21},
		},
		
		Actions =
		{
			DialogSetEnabled	{Tag = "craig_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Craig shows us the way to the gate <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_craig_01_completed" },
		},
		
		Actions =
		{
			DialogSetDisabled	{Tag = "craig_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0301_Guide"},
			FigureFollowEntity	{Tag = "craig_01", TargetTag = "pl_HumanAvatar"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0302_Gate"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 618.683, Y = 155.888 },
			FigureVanish	{Tag = "ghost_07"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Overseer dialog starts<<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "overseer_01", Range = 5 },
		},
		
		Actions =
		{
			DialogBegin	{Player = "default", Tag = "overseer_01"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Overseer first dialog ended<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_overseer_01_is_working" },
		},
		
		Actions =
		{
			FigureOutcry	{TextTag = "craig_01", Tag = "craig_01"},
			DialogSetEnabled	{Tag = "spirit_distraction_01"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0302_Gate"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0303_Distract"},
		},
	},
	
	OnEvent
	{
		EventName = ">>> Overseer doesnt let the avatar close to the gate <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_overseer_01_blocked" },
		},
		
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P703_overseer_01_blocked"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 578.821, Y = 321.728 },
			--FigureOutcry	{TextTag = "overseer_01", Tag = "overseer_01"},
		},
	},
	
	OnEvent
	{
		EventName = ">>> Overseer doesnt let the avatar close to the gate after the dialog <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_overseer_01_is_working" },
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "overseer_01", Range = 5 },
		},
		
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_overseer_01_blocked"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Spirit hero starts the distraction<<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_distraction_started" },
			
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0303_Distract"},
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_03_Gate"},
			DialogSetDisabled	{Tag = "spirit_distraction_01"},
			FigurePatrolWalk	{Tag = "spirit_distraction_01",X = 623, Y = 352.4},
			MapFlagSetFalse {Name = "mf_P703_overseer_01_blocked"},
			MapFlagSetFalse {Name = "mf_P703_overseer_01_is_working"},
			FigurePatrolWalk	{Tag = "overseer_01",X = 623, Y = 348.4},
			FigureOutcry	{TextTag = "overseer_distraction_01", Tag = "overseer_01"},
			MapTimerStart {Name = "mt_P703_spirit_distration_walk"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_20s"},
			
			MapFlagSetTrue {Name = "mf_P703_MQ3_Completed"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Spirit hero walks back from distration<<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_spirit_distration_walk", Seconds = 5},
		},
		
		Actions =
		{
			FigurePatrolWalk	{Tag = "spirit_distraction_01",X = 620.191, Y = 331.975, },
		},
	},
	
	
}