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
					FigureTeamExludingAvatarIsInRangeToEntity	{Team = "tm_Allies", Range = 100, TargetTag = "Nameless_HQ_02"},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Nameless_HQ_02", Range = 100},
				},
			},
			Actions = 
			{
				DialogSetDisabled	{Tag = "Realm_Leader"},
				FigureTeamTransfer	{Tag = "Realm_Leader", Team = "tm_Allies"},
				FigureNpcSpawn	{Tag = "Realm_Leader_Paladin01", Level = 2, UnitId = 305, X = 430, Y = 50, Team = "tm_Allies"},
				FigureNpcSpawn	{Tag = "Realm_Leader_Paladin02", Level = 2, UnitId = 305, X = 430, Y = 50, Team = "tm_Allies"},
				FigureNpcSpawn	{Tag = "Realm_Leader_Paladin03", Level = 2, UnitId = 305, X = 430, Y = 50, Team = "tm_Allies"},
				FigureNpcSpawn	{Tag = "Realm_Leader_Mounted_Crossbowman01", Level = 2, UnitId = 306, X = 430, Y = 50, Team = "tm_Allies"},
				FigureNpcSpawn	{Tag = "Realm_Leader_Mounted_Crossbowman02", Level = 2, UnitId = 306, X = 430, Y = 50, Team = "tm_Allies"},
				FigureNpcSpawn	{Tag = "Realm_Leader_Mounted_Crossbowman03", Level = 2, UnitId = 306, X = 430, Y = 50, Team = "tm_Allies"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Paladin01", Player = "pl_Realm"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Paladin02", Player = "pl_Realm"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Paladin03", Player = "pl_Realm"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Mounted_Crossbowman01", Player = "pl_Realm"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Mounted_Crossbowman02", Player = "pl_Realm"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Mounted_Crossbowman03", Player = "pl_Realm"},
				MapFlagSetTrue	{Name = "mf_P710_Realm_Leader_Attack"},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader", X = 130, Y = 380},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				FigureIsAlive	{Tag = "Realm_Leader"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader_Paladin01"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader_Paladin01", X = 130, Y = 380},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				FigureIsAlive	{Tag = "Realm_Leader"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader_Paladin02"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader_Paladin02", X = 130, Y = 380},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				FigureIsAlive	{Tag = "Realm_Leader"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader_Paladin03"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader_Paladin03", X = 130, Y = 380},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				FigureIsAlive	{Tag = "Realm_Leader"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader_Mounted_Crossbowman01"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader_Mounted_Crossbowman01", X = 130, Y = 380},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				FigureIsAlive	{Tag = "Realm_Leader"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader_Mounted_Crossbowman02"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader_Mounted_Crossbowman02", X = 130, Y = 380},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				FigureIsAlive	{Tag = "Realm_Leader"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Leader_Attack"},
				FigureIsIdle	{Tag = "Realm_Leader_Mounted_Crossbowman03"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Realm_Leader_Mounted_Crossbowman03", X = 130, Y = 380},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
				FigureIsDead	{Tag = "Realm_Leader_Paladin01"},
				FigureIsDead	{Tag = "Realm_Leader_Paladin02"},
				FigureIsDead	{Tag = "Realm_Leader_Paladin03"},
				FigureIsDead	{Tag = "Realm_Leader_Mounted_Crossbowman01"},
				FigureIsDead	{Tag = "Realm_Leader_Mounted_Crossbowman02"},
				FigureIsDead	{Tag = "Realm_Leader_Mounted_Crossbowman03"},
			},
			Actions = 
			{
				MapFlagSetFalse	{Name = "mf_P710_Realm_Leader_Attack"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsInRange	{Tag = "Realm_Leader", Range = 50, X = 535, Y = 320},
			},
			Actions = 
			{
				FigureNpcSpawn	{Tag = "Nameless01_Realm_Leader_Warrior01", Level = 30, UnitId = 1655, X = 130, Y = 380, Team = "tm_Nameless"},
				FigureNpcSpawn	{Tag = "Nameless01_Realm_Leader_Warrior02", Level = 30, UnitId = 1655, X = 130, Y = 380, Team = "tm_Nameless"},
				FigureNpcSpawn	{Tag = "Nameless01_Realm_Leader_Warrior03", Level = 30, UnitId = 1655, X = 130, Y = 380, Team = "tm_Nameless"},
				FigureNpcSpawn	{Tag = "Nameless01_Realm_Leader_Warrior04", Level = 30, UnitId = 1655, X = 130, Y = 380, Team = "tm_Nameless"},
				FigureAttackEntity	{Tag = "Nameless01_Realm_Leader_Warrior01", TargetTag = "Realm_Leader"},
				FigureAttackEntity	{Tag = "Nameless01_Realm_Leader_Warrior02", TargetTag = "Realm_Leader"},
				FigureAttackEntity	{Tag = "Nameless01_Realm_Leader_Warrior03", TargetTag = "Realm_Leader"},
				FigureAttackEntity	{Tag = "Nameless01_Realm_Leader_Warrior04", TargetTag = "Realm_Leader"},
				MapFlagSetTrue	{Name = "mf_P710_Nameless01_Realm_Leader_Warriors"},
				MapTimerStart	{Name = "mt_P710_Realm_Leader_Death"},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Nameless01_Realm_Leader_Warriors"},
				FigureIsIdle	{Tag = "Nameless01_Realm_Leader_Warrior01"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Nameless01_Realm_Leader_Warrior01", X = 430, Y = 50},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Nameless01_Realm_Leader_Warriors"},
				FigureIsIdle	{Tag = "Nameless01_Realm_Leader_Warrior02"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Nameless01_Realm_Leader_Warrior02", X = 430, Y = 50},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Nameless01_Realm_Leader_Warriors"},
				FigureIsIdle	{Tag = "Nameless01_Realm_Leader_Warrior03"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Nameless01_Realm_Leader_Warrior03", X = 430, Y = 50},
			},
		},
		
	OnEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_Nameless01_Realm_Leader_Warriors"},
				FigureIsIdle	{Tag = "Nameless01_Realm_Leader_Warrior04"},
			},
			Actions = 
			{
				FigureRun	{Tag = "Nameless01_Realm_Leader_Warrior04", X = 430, Y = 50},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
				FigureIsDead	{Tag = "Nameless01_Realm_Leader_Warrior01"},
				FigureIsDead	{Tag = "Nameless01_Realm_Leader_Warrior02"},
				FigureIsDead	{Tag = "Nameless01_Realm_Leader_Warrior03"},
				FigureIsDead	{Tag = "Nameless01_Realm_Leader_Warrior04"},
			},
			Actions = 
			{
				MapFlagSetFalse	{Name = "mf_P710_Nameless01_Realm_Leader_Warriors"},
			},
		},
		
	OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_Realm_Leader_Death", Seconds = 60},
			},
			Actions = 
			{
				FigureKill	{Tag = "Realm_Leader"},
			},
		},
	
	OnOneTimeEvent
		{
			Conditions = 
			{
				FigureIsDead	{Tag = "Realm_Leader"},
			},
			Actions = 
			{
				FigureKill	{Tag = "Realm_Leader"},
				FigureRun	{Tag = "Realm_Leader_Paladin01", X = 420, Y = 55},
				FigureRun	{Tag = "Realm_Leader_Paladin02", X = 420, Y = 55},
				FigureRun	{Tag = "Realm_Leader_Paladin03", X = 420, Y = 55},
				FigureRun	{Tag = "Realm_Leader_Mounted_Crossbowman01", X = 420, Y = 55},
				FigureRun	{Tag = "Realm_Leader_Mounted_Crossbowman02", X = 420, Y = 55},
				FigureRun	{Tag = "Realm_Leader_Mounted_Crossbowman03", X = 420, Y = 55},
				MapTimerStart	{Name = "mt_P710_Realm_Lieutenant_Timer"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_Realm_Lieutenant_Timer", Seconds = 60},
			},
			Actions = 
			{
				DialogSetEnabled	{Tag = "Realm_Lieutenant"},
				MapFlagSetTrue	{Name = "mf_P710_TalktoRealmLieutenant"},
				QuestSetActive	{Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Paladin01", Player = "pl_Human"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Paladin02", Player = "pl_Human"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Paladin03", Player = "pl_Human"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Mounted_Crossbowman01", Player = "pl_Human"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Mounted_Crossbowman02", Player = "pl_Human"},
				FigurePlayerTransfer	{Tag = "Realm_Leader_Mounted_Crossbowman03", Player = "pl_Human"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarIsNotTalking	{},
				MapFlagIsTrue{Name = "mf_P710_Realm_Lieutenant_FactiontoPlayer"},
			},
			Actions = 
			{
				QuestSetSolved	{Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},
				BuildingDestroy	{Tag = "Realm_Farm01"},
				BuildingDestroy	{Tag = "Realm_Farm02"},
				BuildingDestroy	{Tag = "Realm_Farm03"},
				BuildingDestroy	{Tag = "Realm_Farm04"},
				
				TransferComputerToHuman {AIPlayer = "pl_Realm", Player = "pl_Human"},
				
				PlayerBuildingAdd	{BuildingId = 115},
				PlayerBuildingAdd	{BuildingId = 116},
				PlayerBuildingAdd	{BuildingId = 118},
				PlayerBuildingAdd	{BuildingId = 119},
				PlayerBuildingAdd	{BuildingId = 120},
				PlayerBuildingAdd	{BuildingId = 121},
				PlayerBuildingAdd	{BuildingId = 123},
				PlayerBuildingAdd	{BuildingId = 124},
				PlayerBuildingAdd	{BuildingId = 125},
				PlayerBuildingAdd	{BuildingId = 126},
				PlayerBuildingAdd	{BuildingId = 128},
				PlayerBuildingAdd	{BuildingId = 131},
				PlayerBuildingUpgradeAdd	{UpgradeId = 6},
				PlayerBuildingUpgradeAdd	{UpgradeId = 7},
				PlayerBuildingUpgradeAdd	{UpgradeId = 8},
				PlayerBuildingUpgradeAdd	{UpgradeId = 10},
				PlayerBuildingUpgradeAdd	{UpgradeId = 11},
				PlayerBuildingUpgradeAdd	{UpgradeId = 12},
				PlayerBuildingUpgradeAdd	{UpgradeId = 13},
				PlayerBuildingUpgradeAdd	{UpgradeId = 14},
				PlayerBuildingUpgradeAdd	{UpgradeId = 15},
				PlayerBuildingUpgradeAdd	{UpgradeId = 16},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				QuestIsSolved	{Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},
				MapFlagIsTrue	{Name = "mf_P710_Realm_Lieutenant_RepairtheGates"},
			},
			Actions = 
			{
				DialogSetDisabled	{Tag = "Realm_Lieutenant"},
			},
		},
	};