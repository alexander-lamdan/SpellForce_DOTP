State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
	EventName = "Unblock",
	Conditions = 
		{
			GameIsUnBlocked{},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartIntroCS"},
		},
	},
	
	OnOneTimeEvent
	{
	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P710_Creep_Spawn"},
			ObjectVanish	{Tag = "Undead_Tower01"},
			ObjectVanish	{Tag = "Undead_Tower02"},
			ObjectVanish	{Tag = "Undead_Tower03"},
			ObjectVanish	{Tag = "Undead_Tower04"},
			ObjectVanish	{Tag = "Undead_Tower05"},
			ObjectVanish	{Tag = "Undead_Wall01"},
			ObjectVanish	{Tag = "Undead_Wall02"},
			ObjectVanish	{Tag = "Undead_Wall03"},
			ObjectVanish	{Tag = "Undead_Pillar01"},
			ObjectVanish	{Tag = "Undead_Pillar02"},
			ObjectVanish	{Tag = "Undead_Pillar03"},
			ObjectVanish	{Tag = "Undead_Pillar04"},
			ObjectVanish	{Tag = "Undead_Pillar05"},
			ObjectVanish	{Tag = "Undead_Pillar06"},
			ObjectVanish	{Tag = "Undead_Statue01"},
			ObjectVanish	{Tag = "Undead_Statue02"},
			ObjectVanish	{Tag = "Undead_Statue03"},
			ObjectVanish	{Tag = "Undead_Statue04"},
			ObjectVanish	{Tag = "Undead_Building01"},
			ObjectVanish	{Tag = "Undead_Building02"},
			ObjectVanish	{Tag = "Undead_Building03"},
			ObjectVanish	{Tag = "Undead_Building04"},
			ObjectVanish	{Tag = "Undead_Building05"},
			ObjectVanish	{Tag = "Undead_Building06"},
			ObjectVanish	{Tag = "Undead_Building07"},
			ObjectVanish	{Tag = "Undead_Building08"},
			ObjectVanish	{Tag = "Undead_Building09"},
			ObjectVanish	{Tag = "Undead_Building10"},
			ObjectVanish	{Tag = "Undead_Building11"},
			ObjectVanish	{Tag = "Undead_Building12"},
			ObjectVanish	{Tag = "Undead_Building13"},
			ObjectVanish	{Tag = "Undead_Building14"},
			ObjectVanish	{Tag = "Undead_Building15"},
			ObjectVanish	{Tag = "Undead_Building16"},
			ObjectVanish	{Tag = "Undead_Building17"},			
			MapFlagSetTrue	{Name = "mf_P710_MainQuest"},
			FogOfWarRevealAtEntity	{FogOfWarId = 3, Tag = "Pact_HQ", Range = 40, Height = 64},
			FogOfWarRevealAtEntity	{FogOfWarId = 4, Tag = "Realm_HQ", Range = 40, Height = 64},
			FogOfWarRevealAtEntity	{FogOfWarId = 5, Tag = "Shaikan_HQ", Range = 40, Height = 64},
			LeverSetDisabled	{Tag = "Lever0"},
			LeverSetDisabled	{Tag = "Lever1"},
			LeverSetDisabled	{Tag = "Lever2"},
			LeverSetDisabled	{Tag = "Lever3"},
			LeverSetDisabled	{Tag = "Lever4"},
			LeverSetDisabled	{Tag = "Lever5"},
			LeverSetDisabled	{Tag = "Lever6"},
			LeverSetDisabled	{Tag = "Lever7"},
			LeverSetDisabled	{Tag = "Lever8"},
			DialogSetEnabled	{Tag = "Realm_Leader"},
			DialogSetEnabled	{Tag = "Shaikan_Leader"},
			PlayerBuildingAdd	{BuildingId = 133},
			PlayerBuildingAdd	{BuildingId = 134},
			PlayerBuildingAdd	{BuildingId = 136},
			PlayerBuildingAdd	{BuildingId = 137},
			PlayerBuildingAdd	{BuildingId = 138},
			PlayerBuildingAdd	{BuildingId = 139},
			PlayerBuildingAdd	{BuildingId = 140},
			PlayerBuildingAdd	{BuildingId = 141},
			PlayerBuildingAdd	{BuildingId = 142},
			PlayerBuildingAdd	{BuildingId = 143},
			PlayerBuildingAdd	{BuildingId = 144},
			PlayerBuildingAdd	{BuildingId = 145},
			PlayerBuildingAdd	{BuildingId = 146},
			PlayerBuildingAdd	{BuildingId = 147},
			PlayerBuildingUpgradeAdd	{UpgradeId = 26},
			PlayerBuildingUpgradeAdd	{UpgradeId = 24},
			PlayerBuildingUpgradeAdd	{UpgradeId = 28},
			PlayerBuildingUpgradeAdd	{UpgradeId = 20},
			PlayerBuildingUpgradeAdd	{UpgradeId = 30},
			PlayerBuildingUpgradeAdd	{UpgradeId = 22},
			PlayerBuildingUpgradeAdd	{UpgradeId = 36},
			PlayerBuildingUpgradeAdd	{UpgradeId = 38},
			PlayerBuildingUpgradeAdd	{UpgradeId = 32},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18},
			PlayerBuildingUpgradeAdd	{UpgradeId = 34},
		},
	},
	
	OnOneTimeEvent
	{
	  Conditions = 
	  {
	    GameDifficulty {Value = 1},
	  },
	  Actions = 
	  {
	  	PlayerResourceStoneGive	{Player = "default", Amount = 1000},
	  	PlayerResourceSilverGive	{Player = "default", Amount = 1000},
	  	PlayerResourceLenyaGive	{Player = "default", Amount = 1000},
	  },
	},

	OnOneTimeEvent
	{
	  Conditions = 
	  {
	    GameDifficulty {Value = 2},
	  },
	  Actions = 
	  {
	    PlayerResourceStoneGive	{Player = "default", Amount = 750},
	  	PlayerResourceSilverGive	{Player = "default", Amount = 750},
	  	PlayerResourceLenyaGive	{Player = "default", Amount = 750},
	  },
	},
	
	OnOneTimeEvent
	{
	  Conditions = 
	  {
	    GameDifficulty {Value = 3},
	  },
	  Actions = 
	  {
	    PlayerResourceStoneGive	{Player = "default", Amount = 500},
	  	PlayerResourceSilverGive	{Player = "default", Amount = 500},
	  	PlayerResourceLenyaGive	{Player = "default", Amount = 500},
	  },
	},
	
	OnOneTimeEvent
	{
	  Conditions = 
	  {
	    GameDifficulty {Value = 4},
	  },
	  Actions = 
	  {
	    PlayerResourceStoneGive	{Player = "default", Amount = 250},
	  	PlayerResourceSilverGive	{Player = "default", Amount = 250},
	  	PlayerResourceLenyaGive	{Player = "default", Amount = 250},
	  },
	},
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue{Name = "mf_P710_Destroy_Nameless01_Quest"},
				MapFlagIsTrue{Name = "mf_P710_Destroy_Nameless02_Quest"},
				MapFlagIsTrue{Name = "mf_P710_Destroy_Nameless03_Quest"},
			},
			Actions = 
			{
				DialogSetDisabled	{Tag = "Realm_Leader"},
			},
		},
			
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P710_StartOutroCS_End"},
		},
		Actions = 
		{
			PlayerGameEnds	{},
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
