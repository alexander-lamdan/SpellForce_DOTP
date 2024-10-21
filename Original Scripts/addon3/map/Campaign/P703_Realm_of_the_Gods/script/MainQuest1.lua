--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",
	

	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_CS1_IntroEnded" },
		},
		
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "ROTG_ACT_01"},
			
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_01_Free"},
			
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0101_Gathering"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0102_Portal"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0103_Siege"},
			QuestSetActive	{Player = "default", Quest = "ROTG_MQ_0104_Hunt"},
			DialogSetEnabled	{Tag = "spirit_MQ11a"},
			DialogSetEnabled	{Tag = "spirit_MQ11b"},
			DialogSetEnabled	{Tag = "spirit_MQ11c"},
			FigureHoldPosition	{Tag = "treb_01"},
			FigureHoldPosition	{Tag = "treb_02"},
			FigureHoldPosition	{Tag = "treb_03"},
			FigureAbilityAdd	{Tag = "evil_spirit_07", AbilityId = 94},

			MapTimerStart {Name = "mt_P703_Intro_Outcry"},
			--MapTimerStart {Name = "mt_P703_Start_Debug"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Outcry after the intro <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P703_Intro_Outcry", Seconds = 5},
		},
		
		Actions =
		{
			MapTimerStop {Name = "mt_P703_Intro_Outcry"},
			FigureOutcry	{TextTag = "need_help_01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "need_help_02", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "need_help_03", Tag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Avatar see to the portal <<<",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "demon_portal", Range = 28 },
		},
		
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_MQ1_2_PortalStarted"},
			FigureOutcry	{TextTag = "demon_portal_01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "demon_portal_02", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "demon_portal_03", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "demon_portal_04", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "demon_portal_05", Tag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Portal spawns some enemy <<<",
		Conditions = 
		{
			BuildingHasNotHealth	{Tag = "demon_portal", Percent = 60},
		},
		
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Portal spawns some enemy <<<",
		Conditions = 
		{
			BuildingHasNotHealth	{Tag = "demon_portal", Percent = 30},
		},
		
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "default", Level = 8, UnitId = 1983, TargetTag = "demon_portal", Team = "tm_Team 2"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Avatar destroys the portal <<<",
		Conditions = 
		{
			BuildingIsDead	{Tag = "demon_portal"},
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0102_Portal"},
			MapFlagSetTrue {Name = "mf_P703_MQ1_2_Destroyed"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_10s"},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Spirit group1 join the Avatar <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ1_1_Joined" },
		},
		
		Actions =
		{
			PlayerKitTransfer	{Player = "default", PlayerKit = "pk_kit6"},
			ObjectVanish	{Tag = "spirit_MQ11a_marker"},
			DialogSetDisabled	{Tag = "spirit_MQ11a"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Spirit group2 join the Avatar <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ1_2_Joined" },
		},
		
		Actions =
		{
			PlayerKitTransfer	{Player = "default", PlayerKit = "pk_kit7"},
			ObjectVanish	{Tag = "spirit_MQ11b_marker"},
			DialogSetDisabled	{Tag = "spirit_MQ11b"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Spirit group3 join the Avatar <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ1_3_Joined" },
		},
		
		Actions =
		{
			PlayerKitTransfer	{Player = "default", PlayerKit = "pk_kit5"},
			ObjectVanish	{Tag = "spirit_MQ11c_marker"},
			DialogSetDisabled	{Tag = "spirit_MQ11c"},
		},
	},
	
		OnOneTimeEvent
	{
		EventName = ">>> All spirits joined the Avatar <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ1_1_Joined" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_2_Joined" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_3_Joined" },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0101_Gathering"},
			MapFlagSetTrue {Name = "mf_P703_MQ1_1_spirits_joined"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
		},
	},
	

	OnOneTimeEvent
	{
		EventName = ">>> First trebuchet is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "treb_01"},
		},
		
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "treb_01_DEAD", File = "Effect_Catapult_Destruction"},
			FigureVanish	{Tag = "treb_01_DEAD"},
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1048},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Second trebuchet is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "treb_02"},
		},
		
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "treb_02_DEAD", File = "Effect_Catapult_Destruction"},
			FigureVanish	{Tag = "treb_02_DEAD"},
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1048},
		},
	},
	
	
	OnOneTimeEvent
	{
		EventName = ">>> Third trebuchet is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "treb_03"},
		},
		
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "treb_03_DEAD", File = "Effect_Catapult_Destruction"},
			FigureVanish	{Tag = "treb_03_DEAD"},
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1048},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> trebuchet quest is completed <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "treb_01"},
			FigureIsDead	{Tag = "treb_02"},
			FigureIsDead	{Tag = "treb_03"},
		},
		
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_P703_MQ1_3_Destroyed" },
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0103_Siege"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
		},
	},
	
	
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_01 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_01"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_02 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_02"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_03 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_03"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_04 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_04"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_05 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_05"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_06 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_06"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> evil spirit_07 is killed by the Avatar <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "evil_spirit_07"},
		},
		
		Actions =
		{
			PlayerNPCKillCountIncrease {Player = "default", UnitId = 1716},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> all of the evil spirits are dead",
		Conditions = 
		{
				FigureIsDead	{Tag = "evil_spirit_07"},
				FigureIsDead	{Tag = "evil_spirit_06"},
				FigureIsDead	{Tag = "evil_spirit_05"},
				FigureIsDead	{Tag = "evil_spirit_04"},
				FigureIsDead	{Tag = "evil_spirit_03"},
				FigureIsDead	{Tag = "evil_spirit_02"},
				FigureIsDead	{Tag = "evil_spirit_01"},				
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_0104_Hunt"},
			AvatarXPGive	{Player = "pl_Human", Amount = 750},
			MapFlagSetTrue{ Name = "mf_P703_MQ1_4_Destroyed" },
			MapTimerStart {Name = "mt_P703_Autosave_15s"},
		},
	},
	
	--main quest
	OnOneTimeEvent
	{
		EventName = ">>> All 4 subquest is completed <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_MQ1_1_spirits_joined" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_2_Destroyed" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_3_Destroyed" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_4_Destroyed" },
		},
		
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "ROTG_MQ_01_Free"},
			ObjectVanish	{Tag = "first_wall"},
			MapFlagSetTrue{ Name = "mf_P703_MQ1_Completed" },
		},
	},
};
