State
	{	
	StateName = "INIT",
			
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
			QuestIsNotSolved	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
			OR
			{
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
				QuestIsSolved	{Player = "default", Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Shaikan_Leader"},
			MapFlagSetTrue	{Name = "mf_P710_TalktoShaikan_Leader_GiveQuest"},
			QuestSetActive	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_TalktoShaikan_Leader_Quest"},
		},
		Actions = 
		{
			PlayerKitTransfer	{Player = "default", PlayerKit = "pk_Shaikan"},
			QuestSetSolved	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
			BuildingDestroy	{Tag = "Shaikan_Store01"},
			BuildingDestroy	{Tag = "Shaikan_Store02"},
			BuildingDestroy	{Tag = "Shaikan_Store03"},
			BuildingDestroy	{Tag = "Shaikan_Store04"},
			
			TransferComputerToHuman {AIPlayer = "pl_Shaikan", Player = "pl_Human"},
			
			-- HQ (550st): produces Builders, Blademasters, Marksmen and Titans.
			PlayerBuildingAdd	{BuildingId = 191}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 45}, -- Shaikan HQ Upgrd (250st) 
			PlayerBuildingUpgradeAdd	{UpgradeId = 46}, -- Blades HQ Upgrd (250st)
			PlayerBuildingUpgradeAdd	{UpgradeId = 47}, -- Dragons HQ Upgrd (250st)

			-- Food Store (40st)
			--PlayerBuildingAdd	{BuildingId = 192}, 
			--PlayerBuildingUpgradeAdd	{UpgradeId = 48}, -- Depot (From Food Store, 90st)

			-- Resource buildings
			PlayerBuildingAdd	{BuildingId = 193}, -- Stonemason (60st)
			PlayerBuildingAdd	{BuildingId = 194}, -- Smeltery (60st)
			PlayerBuildingAdd	{BuildingId = 195}, -- Alchemist (60st)
			
			-- Altar of Life (HQ, 1000st)
			PlayerBuildingAdd	{BuildingId = 196}, 

			-- Practice Ground (HQ, 100st) enables the prod of Bladesmasters in HQ + upgrades Blademasters 
			PlayerBuildingAdd	{BuildingId = 197}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 52}, -- Weapons Master (From Practice Ground, 180st): enables the prod of Marksmen in HQ + upgrades Marksmen 

			-- Tower (190st, 60si)
			PlayerBuildingAdd	{BuildingId = 198}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 49}, -- Tower Blade Upgrd (30st, 30L)
			PlayerBuildingUpgradeAdd	{UpgradeId = 50}, -- Tower Dragon Upgrd (40si)
			PlayerBuildingUpgradeAdd	{UpgradeId = 51}, -- Tower Shaikan Upgrd (100L) - conjures a flying dragonling to defend

			-- Nexus (Blades HQ Upgrd, 300st), produces: Minion, and if unlocked: Spellbreaker and Destroyer
			PlayerBuildingAdd	{BuildingId = 199}, 

			-- Blades Soulforge (Nexus, 250st), unlocks Spellbreaker in Nexus
			PlayerBuildingAdd	{BuildingId = 200}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 53}, -- Blades Black Anvil (From Blades Soulforge, 350st): unlocks Destroyer in Nexus

			-- Den (Dragons HQ Upgr + 250st)
			PlayerBuildingAdd	{BuildingId = 201}, -- produces Wyrm (non-flying)
--			PlayerBuildingUpgradeAdd	{UpgradeId = 54}, -- Dragon Fire Mountain (From Den, 250st): Produces Fire Drake (flying)
--			PlayerBuildingUpgradeAdd	{UpgradeId = 57}, -- Dragon Stone of Ethernity (From Fire Mountain, 250st): Produces Crystal Drake (flying)

			-- Barracks (Shaikan HQ Upgr + 350st): Produces Vanguards (plus Blademasters and Marksmen)
			PlayerBuildingAdd	{BuildingId = 203}, 
			PlayerBuildingUpgradeAdd	{UpgradeId = 55}, -- Garrison (From Barracks, 250st): Produces Standard Bearer
			PlayerBuildingUpgradeAdd	{UpgradeId = 56}, -- Dragon Keep (From Barracks, Garrison + 250st): Produces Blood Mages

			-- Halls of Teaching (From Barracks, 300st, 100si, 100L): upgrades the units from Barracks
			PlayerBuildingAdd	{BuildingId = 204}, 
			
			PlayerUnitUpgradeAdd { UpgradeId = 9},
			PlayerUnitUpgradeAdd { UpgradeId = 10},
			PlayerUnitUpgradeAdd { UpgradeId = 11},
			PlayerUnitUpgradeAdd { UpgradeId = 12},
			PlayerUnitUpgradeAdd { UpgradeId = 13},
			PlayerUnitUpgradeAdd { UpgradeId = 14},
			PlayerUnitUpgradeAdd { UpgradeId = 15},
			PlayerUnitUpgradeAdd { UpgradeId = 16},
			PlayerUnitUpgradeAdd { UpgradeId = 17},
			PlayerUnitUpgradeAdd { UpgradeId = 18},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless01_Quest"},
			MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless02_Quest"},
			MapFlagIsTrue	{Name = "mf_P710_Destroy_Nameless03_Quest"},
			MapFlagIsTrue	{Name = "mf_P710_TalktoShaikan_Leader_Quest"},
			MapFlagIsTrue	{Name = "mf_P710_PowertheTowers_Quest"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Shaikan_Leader"},
		},
	},
};