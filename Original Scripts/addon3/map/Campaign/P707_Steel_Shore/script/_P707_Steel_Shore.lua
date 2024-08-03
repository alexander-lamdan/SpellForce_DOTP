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
			
			AvatarFlagSetTrue {Name = "af_DeadDragonIsGameOver"},
			
			LeverSetDisabled	{Tag = "MindProbeGateInLever"},
			
			MapFlagSetTrue {Name = "mf_P707_Historian_SQ_01"},
			
			FigureAbilityAdd	{Tag = "Researcher1", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res1_Bodyguatd1", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res1_Bodyguatd2", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res1_Bodyguatd3", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res1_Bodyguatd4", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA11", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA12", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA13", AbilityId = 94},

			FigureAbilityAdd	{Tag = "Researcher2", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res2_Bodyguatd1", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res2_Bodyguatd2", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res2_Bodyguatd3", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res2_Bodyguatd4", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA21", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA22", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA23", AbilityId = 94},

			FigureAbilityAdd	{Tag = "Researcher3", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res3_Bodyguatd1", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res3_Bodyguatd2", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res3_Bodyguatd3", AbilityId = 94},
			FigureAbilityAdd	{Tag = "Res3_Bodyguatd4", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA31", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA32", AbilityId = 94},
			FigureAbilityAdd	{Tag = "MA33", AbilityId = 94},

			MapValueSet {Name = "mv_P707_MemoryBankFound", Value = 0},
			
			DialogSetDisabled	{Tag = "Shae"},
			DialogSetDisabled	{Tag = "Ayro"},
			ObjectLootItemMiscAdd	{Tag = "Energy1", DropChance = 100, ItemId = 731},
			ObjectLootItemMiscAdd	{Tag = "Energy2", DropChance = 100, ItemId = 731},
			ObjectLootItemMiscAdd	{Tag = "Energy3", DropChance = 100, ItemId = 731},
			ObjectLootItemMiscAdd	{Tag = "Energy4", DropChance = 100, ItemId = 731},
			ObjectLootItemMiscAdd	{Tag = "Energy5", DropChance = 100, ItemId = 731},
			ObjectLootItemMiscAdd	{Tag = "Energy6", DropChance = 100, ItemId = 731},

			MapFlagSetTrue{ Name = "mf_P707_MainInit_Ended" },	
			
			--QuestSetActive	{Player = "default", Quest = "SSSR_MQ_03"},
			--QuestSetActive {Player = "default", Quest = "SSSR_MQ_03_1"},
		},
	},

	OnOneTimeEvent
	{
		EventName = "PostMapTravelLootPlace",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
			QuestIsActive	{Player = "default", Quest = "SSSR_SQ_05_5"},
		},
		Actions = 
		{
			ColorGradingChange {LUTFile = "", BlendDuration = 1.0 },
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			ObjectLootItemMiscAdd	{Tag = "SArmor1", DropChance = 100, ItemId = 741},
			ObjectLootItemMiscAdd	{Tag = "SArmor2", DropChance = 100, ItemId = 741},
		},
	};

	OnOneTimeEvent
	{
		EventName = "PostMapTravelTwiddleAppear",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "TwiddleIV", X = 176.127, Y = 162.408},
			DialogSetEnabled	{Tag = "TwiddleIV"},
		},
	};
------------------------
-- Dragon handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> In case of Single map <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_01_Ended"},
			AvatarFlagIsFalse	{Player = "default", Name = "af_ArrivedFromPreviousMap"},
		},
		Actions =
		{			
			AvatarFlagSetTrue	{Name = "af_DragonMountEnabled"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "Sárkánylovaglás bekapcs",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_01_Ended"},
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
			AvatarFlagSetTrue {Name = "af_DragonMountEnabled"},	
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
		},
	};

------------------------
-- Travel Stone handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> Avatar approached a travel stone <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TravelStone1", Range = 15 },
		},	
		Actions =
		{	
			PlayerTravelEnable	{},
		},
	},

	OnEvent
	{
		EventName = "PostMapTravelEnableTravel",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			ColorGradingChange {LUTFile = "", BlendDuration = 1.0 },
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			PlayerTravelEnable	{},
		},
	};

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

------------------------
-- Malar Handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> Avatar approached a malar <<<",
		Conditions = 
		{
			OR
			{
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 10, TargetTag = "FirstMalar1"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 10, TargetTag = "FirstMalar2"},
			}
		},	
		Actions =
		{	
			FigureOutcry	{TextTag = "cryMalar01", Tag = "pl_HumanCompanionCraigHuman"},
			FigureOutcry	{TextTag = "cryMalar02", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryMalar03", Tag = "pl_HumanHeroCaine"},
		},
	},

------------------------
-- Tower Handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> Avatar approached a tower <<<",
		Conditions = 
		{
			OR
			{
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 10, TargetTag = "FirstTower1"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 10, TargetTag = "FirstTower2"},
			}
		},	
		Actions =
		{	
			FigureOutcry	{TextTag = "cryDefTower01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "cryDefTower02", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "cryDefTower03", Tag = "pl_HumanCompanionCraigHuman"},
		},
	},

------------------------
-- Researcher handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> Somebody reached the first Researcher area <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 40, TargetTag = "Researcher1"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Researcher1", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res1_Bodyguard1", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res1_Bodyguard2", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res1_Bodyguard3", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res1_Bodyguard4", Team = "tm_Elf"},
			MapTimerStart {Name = "Res1_Protection_Done"},
			
			FigureAttackEntity	{Tag = "MA11", TargetTag = "Res1_Bodyguard1"},
			FigureAttackEntity	{Tag = "MA12", TargetTag = "Res1_Bodyguard2"},
			FigureAttackEntity	{Tag = "MA13", TargetTag = "Res1_Bodyguard3"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Somebody reached the second Researcher area <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 40, TargetTag = "Researcher2"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Researcher2", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res2_Bodyguard1", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res2_Bodyguard2", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res2_Bodyguard3", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res2_Bodyguard4", Team = "tm_Elf"},
			MapTimerStart {Name = "Res2_Protection_Done"},
			
			FigureAttackEntity	{Tag = "MA21", TargetTag = "Res2_Bodyguard1"},
			FigureAttackEntity	{Tag = "MA22", TargetTag = "Res2_Bodyguard2"},
			FigureAttackEntity	{Tag = "MA23", TargetTag = "Res2_Bodyguard3"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Somebody reached the third Researcher area <<<",
		Conditions = 
		{
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 40, TargetTag = "Researcher3"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Researcher3", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res3_Bodyguard1", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res3_Bodyguard2", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res3_Bodyguard3", Team = "tm_Elf"},
			FigureTeamTransfer	{Tag = "Res3_Bodyguard4", Team = "tm_Elf"},
			MapTimerStart {Name = "Res3_Protection_Done"},
			
			FigureAttackEntity	{Tag = "MA31", TargetTag = "Res3_Bodyguard1"},
			FigureAttackEntity	{Tag = "MA32", TargetTag = "Res3_Bodyguard2"},
			FigureAttackEntity	{Tag = "MA33", TargetTag = "Res3_Bodyguard3"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Res1 Team is not protected anymore <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "Res1_Protection_Done", Seconds = 10},
		},
		Actions =
		{
			MapTimerStop {Name = "Res1_Protection_Done"},
			--FigureAbilityRemove	{Tag = "Researcher1", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Researcher3", AbilityId = 95},
			FigureAbilityRemove	{Tag = "Res1_Bodyguatd1", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res1_Bodyguatd2", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res1_Bodyguatd3", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res1_Bodyguatd4", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA11", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA12", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA13", AbilityId = 94},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Res2 Team is not protected anymore <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "Res2_Protection_Done", Seconds = 10},
		},
		Actions =
		{
			MapTimerStop {Name = "Res2_Protection_Done"},
			FigureAbilityRemove	{Tag = "Researcher2", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Researcher3", AbilityId = 95},
			FigureAbilityRemove	{Tag = "Res2_Bodyguatd1", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res2_Bodyguatd2", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res2_Bodyguatd3", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res2_Bodyguatd4", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA21", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA22", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA23", AbilityId = 94},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Res3 Team is not protected anymore <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "Res3_Protection_Done", Seconds = 10},
		},
		Actions =
		{
			MapTimerStop {Name = "Res3_Protection_Done"},
			FigureAbilityRemove	{Tag = "Researcher3", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Researcher3", AbilityId = 95},
			FigureAbilityRemove	{Tag = "Res3_Bodyguatd1", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res3_Bodyguatd2", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res3_Bodyguatd3", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Res3_Bodyguatd4", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA31", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA32", AbilityId = 94},
			FigureAbilityRemove	{Tag = "MA33", AbilityId = 94},
		},
	},


------------------------
-- Hero Selection
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> Ayro Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P707_Ayro_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 260},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroThird", TargetTag = "P2Ayro", Direction = 90},},
			FigureVanish	{Tag = "Ayro"},
			DialogSetDisabled	{Tag = "Shae"},
			DialogSetDisabled	{Tag = "Ayro"},
			FigureForcedRunToEntity	{Tag = "Shae", TargetTag = "Map_Start_Point"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Shae Chosen <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P707_Shae_Chosen" },
		},
		
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 261},
   		NoSpawnEffect {Spawn = FigureHeroSpawnToEntity {Tag = "HeroThird", TargetTag = "P2Shae", Direction = 90},},
			FigureVanish	{Tag = "Shae"},
			MapFlagSetTrue {Name = "mf_P707_hero_chosen"},
			DialogSetDisabled	{Tag = "Shae"},
			DialogSetDisabled	{Tag = "Ayro"},
			DialogSetDisabled	{Tag = "pl_HumanHeroShae"},
			DialogSetDisabled	{Tag = "pl_HumanHeroAyro"},
			FigureForcedRunToEntity	{Tag = "Ayro", TargetTag = "Map_Start_Point"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Escort reach exit <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Shae" , TargetTag = "Map_Start_Point", Range = 5},		
			MapFlagIsTrue{ Name = "mf_P707_Ayro_Chosen" },
		},
		Actions =
		{
			FigureVanish	{Tag = "Shae"},
		},
	},

	OnOneTimeEvent
	{
		EventName = ">>> Escort reach exit <<<",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Ayro" , TargetTag = "Map_Start_Point", Range = 5},		
			MapFlagIsTrue{ Name = "mf_P707_Shae_Chosen" },
		},
		Actions =
		{
			FigureVanish	{Tag = "Ayro"},
		},
	},

------------------------
-- Death handling
------------------------
	OnOneTimeEvent
	{
		EventName = ">>> every adventurer died (the death of the dragon is handled in dragon.lua) <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P707_CS_01_Ended"},
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







