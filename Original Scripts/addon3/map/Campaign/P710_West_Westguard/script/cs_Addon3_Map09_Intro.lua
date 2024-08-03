-- CS_Intro

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroFirst'",
		"'pl_HumanHeroSecond'",
		"'pl_HumanHeroThird'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanCompanionCraigHuman'",
		"'Surian'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		EventName = "Vanish",
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {Tag = "CS_Intro_Avatar"},
			FigureVanish {Tag = "CS_Intro_HeroCaine"},
			FigureVanish {Tag = "CS_Intro_HeroOrc"},
			FigureVanish {Tag = "CS_Intro_HeroFirst"},
			FigureVanish {Tag = "CS_Intro_HeroThird"},
			FigureVanish {Tag = "CS_Intro_HeroSecond"},
			FigureVanish {Tag = "CS_Intro_CompanionCraigHuman"},
			--Demonic
			FigureVanish {Tag = "CS_Intro_Spike01"},
			FigureVanish {Tag = "CS_Intro_Spike02"},
			FigureVanish {Tag = "CS_Intro_Spike03"},
			FigureVanish {Tag = "CS_Intro_Mage01"},
			FigureVanish {Tag = "CS_Intro_Mage02"},
			FigureVanish {Tag = "CS_Intro_Mage03"},
			FigureVanish {Tag = "CS_Intro_Chosen01"},
			FigureVanish {Tag = "CS_Intro_Chosen02"},
			FigureVanish {Tag = "CS_Intro_Chosen03"},
			FigureVanish {Tag = "CS_Intro_Warrior01"},
			FigureVanish {Tag = "CS_Intro_Warrior02"},
			FigureVanish {Tag = "CS_Intro_Warrior03"},
			FigureVanish {Tag = "CS_Intro_Titan"},
			--Realm
			FigureVanish {Tag = "CS_Intro_Soldier"},
			FigureVanish {Tag = "CS_Intro_Paladin"},
			FigureVanish {Tag = "CS_Intro_Elite"},
			FigureVanish {Tag = "CS_Intro_MCrossbowman"},
			FigureVanish {Tag = "CS_Intro_Druid"},
			FigureVanish {Tag = "CS_Intro_RealmMage"},
			--Shaikan
			FigureVanish {Tag = "CS_Intro_Minion"},
			FigureVanish {Tag = "CS_Intro_Vangard"},
			FigureVanish {Tag = "CS_Intro_Drake"},
			FigureVanish {Tag = "CS_Intro_Marksman"},
			FigureVanish {Tag = "CS_Intro_Bloodmage"},
			--Pact
			FigureVanish {Tag = "CS_Intro_Gargoyle01"},
			FigureVanish {Tag = "CS_Intro_Gargoyle02"},
			FigureVanish {Tag = "CS_Intro_Ravage"},
			FigureVanish {Tag = "CS_Intro_Reaper01"},
			FigureVanish {Tag = "CS_Intro_Reaper02"},
			FigureVanish {Tag = "CS_Intro_Reaper03"},
			FigureVanish {Tag = "CS_Intro_Assassin01"},
			FigureVanish {Tag = "CS_Intro_Assassin02"},
			FigureVanish {Tag = "CS_Intro_Assassin03"},
			FigureVanish {Tag = "CS_Intro_Sorceress01"},
			FigureVanish {Tag = "CS_Intro_Sorceress02"},
			FigureVanish {Tag = "CS_Intro_Sorceress03"},
		},
	},

	OnCutsceneFigureRespawnEvent
	{
		EventName = "Spawn",
		--AllowCombat = true,
		Conditions =
		{	
			MapFlagIsTrue {Name = "mf_P710_StartIntroCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
	
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			--PlayerHeroAdd	{Player = "pl_Human", HeroId = 251},
			--NoSpawnEffect {Spawn = FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroFirst", TargetTag = "pl_HumanAvatar", Direction = 0},},
   		--PlayerHeroAdd	{Player = "pl_Human", HeroId = 252},
   		--NoSpawnEffect {Spawn = FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroSecond", TargetTag = "pl_HumanAvatar", Direction = 0},},
   		--PlayerHeroAdd	{Player = "pl_Human", HeroId = 260},
   		--NoSpawnEffect {Spawn = FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroThird", TargetTag = "pl_HumanAvatar", Direction = 0},},
			--PlayerHeroAdd	{Player = "pl_Human", HeroId = 255},
   		--NoSpawnEffect {Spawn = FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},},
   		--PlayerHeroAdd	{Player = "pl_Human", HeroId = 250},
   		--NoSpawnEffect {Spawn = FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "HeroOrc", TargetTag = "pl_HumanAvatar", Direction = 0},},
   		--PlayerHeroAdd	{Player = "pl_Human", HeroId = 259},
   		--NoSpawnEffect {Spawn = FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "CompanionCraigHuman", TargetTag = "pl_HumanAvatar", Direction = 0},},
			
			FigureAbilityAdd	{Tag = "Surian", AbilityId = 94},
			
			--Nameless spawn			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Warrior01", Level = 30, UnitId = 1655, X = 290, Y = 165, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Warrior01", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Warrior02", Level = 30, UnitId = 1655, X = 293, Y = 167, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Warrior02", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Warrior03", Level = 30, UnitId = 1655, X = 296, Y = 169, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Warrior03", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Chosen01", Level = 30, UnitId = 1658, X = 288, Y = 169, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Chosen01", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Chosen02", Level = 30, UnitId = 1658, X = 291, Y = 171, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Chosen02", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Chosen03", Level = 30, UnitId = 1658, X = 294, Y = 173, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Chosen03", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Spike01", Level = 30, UnitId = 1681, X = 286, Y = 173, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Spike01", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Spike02", Level = 30, UnitId = 1681, X = 289, Y = 175, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Spike02", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Spike03", Level = 30, UnitId = 1681, X = 292, Y = 177, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Spike03", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Mage01", Level = 30, UnitId = 1656, X = 284, Y = 177, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Mage01", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Mage02", Level = 30, UnitId = 1656, X = 287, Y = 179, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Mage02", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Mage03", Level = 30, UnitId = 1656, X = 290, Y = 181,  Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Mage03", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Titan", Level = 30, UnitId = 1660, X = 280, Y = 187, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Titan", Direction = 30},
			
			--Realm spawn
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Soldier", Level = 30, UnitId = 311, X = 308, Y = 135, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Soldier", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Paladin", Level = 30, UnitId = 305, X = 306, Y = 131, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Paladin", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Elite", Level = 30, UnitId = 313, X = 305, Y = 135, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Elite", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_MCrossbowman", Level = 30, UnitId = 306, X = 309, Y = 131, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_MCrossbowman", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Druid", Level = 30, UnitId = 1759, X = 310, Y = 127, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Druid", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_RealmMage", Level = 30, UnitId = 307, X = 309, Y = 120, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_RealmMage", Direction = 180},
			
			--Shaikan spawn
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Minion", Level = 30, UnitId = 1119, X = 311, Y = 135, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Minion", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Vangard", Level = 30, UnitId = 1143, X = 312, Y = 131, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Vangard", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Drake", Level = 30, UnitId = 1123, X = 313, Y = 120, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Drake", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Marksman", Level = 30, UnitId = 1128, X = 313, Y = 127, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Marksman", Direction = 180},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Bloodmage", Level = 30, UnitId = 1146, X = 307, Y = 127, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Bloodmage", Direction = 180},
			
			--Pact spawn
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Gargoyle01", Level = 30, UnitId = 88, X = 320, Y = 113, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Gargoyle01", Direction = 200},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Gargoyle02", Level = 30, UnitId = 88, X = 325, Y = 113, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Gargoyle02", Direction = 200},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Ravage", Level = 30, UnitId = 89, X = 298, Y = 125, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Ravage", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Reaper01", Level = 30, UnitId = 166, X = 294, Y = 127, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Reaper01", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Reaper02", Level = 30, UnitId = 166, X = 296, Y = 124, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Reaper02", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Reaper03", Level = 30, UnitId = 166, X = 298, Y = 121, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Reaper03", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Assassin01", Level = 30, UnitId = 79, X = 292, Y = 125, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Assassin01", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Assassin02", Level = 30, UnitId = 79, X = 294, Y = 122, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Assassin02", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Assassin03", Level = 30, UnitId = 79, X = 296, Y = 119, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Assassin03", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Sorceress01", Level = 30, UnitId = 173, X = 290, Y = 123,  Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Sorceress01", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Sorceress02", Level = 30, UnitId = 173, X = 292, Y = 120, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Sorceress02", Direction = 150},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_Intro_Sorceress03", Level = 30, UnitId = 173, X = 294, Y = 117, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "CS_Intro_Sorceress03", Direction = 150},			
						
			FigureTeamTransfer {Tag = "CS_Intro_Avatar" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Spike01" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Spike02" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Spike03" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Mage01" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Mage02" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Mage02" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Chosen01" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Chosen02" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Chosen03" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Warrior01" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Warrior02" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Warrior03" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Titan" , Team = "tm_Nameless"},
			FigureTeamTransfer {Tag = "CS_Intro_Soldier" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Paladin" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Elite" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_MCrossbowman" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Druid" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_RealmMage" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Minion" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Vangard" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Drake" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Marksman" , Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Bloodmage" , Team = "tm_Allies"},		
			
			FigureAttackEntity {Tag = "CS_Intro_Warrior01", TargetTag = "CS_Intro_Elite"},
			FigureAttackEntity {Tag = "CS_Intro_Warrior02", TargetTag = "CS_Intro_Soldier"},
			FigureAttackEntity {Tag = "CS_Intro_Warrior03", TargetTag = "CS_Intro_Minion"},
			FigureAttackEntity {Tag = "CS_Intro_Chosen01", TargetTag = "CS_Intro_Elite"},
			FigureAttackEntity {Tag = "CS_Intro_Chosen02", TargetTag = "CS_Intro_Soldier"},
			FigureAttackEntity {Tag = "CS_Intro_Chosen03", TargetTag = "CS_Intro_Minion"},
			FigureAttackEntity {Tag = "CS_Intro_Spike01", TargetTag = "CS_Intro_Elite"},
			FigureAttackEntity {Tag = "CS_Intro_Spike02", TargetTag = "CS_Intro_Soldier"},
			FigureAttackEntity {Tag = "CS_Intro_Spike03", TargetTag = "CS_Intro_Minion"},
			FigureAttackEntity {Tag = "CS_Intro_Mage01", TargetTag = "CS_Intro_Elite"},
			FigureAttackEntity {Tag = "CS_Intro_Mage02", TargetTag = "CS_Intro_Soldier"},
			FigureAttackEntity {Tag = "CS_Intro_Mage03", TargetTag = "CS_Intro_Minion"},
			FigureAttackEntity {Tag = "CS_Intro_Titan" , TargetTag = "CS_Intro_Soldier"},
			
			FigureAttackEntity {Tag = "CS_Intro_Elite", TargetTag = "CS_Intro_Warrior01"},
			FigureAttackEntity {Tag = "CS_Intro_Soldier", TargetTag = "CS_Intro_Warrior02"},
			FigureAttackEntity {Tag = "CS_Intro_Minion", TargetTag = "CS_Intro_Warrior03"},
			FigureAttackEntity {Tag = "CS_Intro_Paladin", TargetTag = "CS_Intro_Warrior01"},
			FigureAttackEntity {Tag = "CS_Intro_MCrossbowman", TargetTag = "CS_Intro_Warrior02"},
			FigureAttackEntity {Tag = "CS_Intro_Vangard", TargetTag = "CS_Intro_Warrior03"},
			--FigureAttackEntity {Tag = "CS_Intro_Bloodmage", TargetTag = "CS_Intro_Warrior01"},
			--FigureAttackEntity {Tag = "CS_Intro_Druid", TargetTag = "CS_Intro_Warrior02"},
			FigureAttackEntity {Tag = "CS_Intro_Marksman", TargetTag = "CS_Intro_Warrior03"},
			FigureAttackEntity {Tag = "CS_Intro_RealmMage", TargetTag = "CS_Intro_Warrior01"},			
			FigureAttackEntity {Tag = "CS_Intro_Drake", TargetTag = "CS_Intro_Warrior02"},
			
			FigureRun	{Tag = "CS_Intro_Druid", X = 305, Y = 140},
			FigureRun	{Tag = "CS_Intro_Bloodmage", X = 302, Y = 140},

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01_01",
	},
};

State
{
	StateName = "Cutscene01_01",
	OnOneTimeEvent
	{
		EventName = "OnTrack",
		AllowCombat = true,
		Conditions =
		{

		},
		Actions =
		{
			--FigureHealthSet	{Tag = "CS_Intro_Soldier", Percent = 0},
			--FigureKill	{Tag = "CS_Intro_Soldier"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Intro_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_02",
	},	
};

State
{
	StateName = "Cutscene01_02",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Soldier", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Soldier"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_03",
	},	
};

State
{
	StateName = "Cutscene01_03",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Minion", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Minion"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_04",
	},	
};

State
{
	StateName = "Cutscene01_04",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Warrior02", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Warrior02"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_05",
	},	
};

State
{
	StateName = "Cutscene01_05",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Elite", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Elite"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_06",
	},	
};

State
{
	StateName = "Cutscene01_06",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Paladin", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Paladin"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_07",
	},	
};

State
{
	StateName = "Cutscene01_07",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Vangard", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Vangard"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_08",
	},	
};

State
{
	StateName = "Cutscene01_08",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Mage", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Mage"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_09",
	},	
};

State
{
	StateName = "Cutscene01_09",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_MCrossbowman", Percent = 0},
			FigureKill	{Tag = "CS_Intro_MCrossbowman"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_10",
	},	
};

State
{
	StateName = "Cutscene01_10",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			
			FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = 95},			
			FigureTeleport {Tag = "pl_HumanAvatar", X = 325, Y = 110},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 120},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 325, Y = 110},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 120},
			
			FigureAbilityAdd	{Tag = "pl_HumanHeroCaine", AbilityId = 95},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 289, Y = 120},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 120},
			FigureTeleport {Tag = "pl_HumanHeroCaine", X = 289, Y = 120},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 120},
			
			FigureAbilityAdd	{Tag = "pl_HumanHeroOrc", AbilityId = 95},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 291, Y = 116},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 120},
			FigureTeleport {Tag = "pl_HumanHeroOrc", X = 291, Y = 116},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 120},
			
			FigureAbilityAdd	{Tag = "pl_HumanHeroFirst", AbilityId = 95},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 287, Y = 119},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 120},
			FigureTeleport {Tag = "pl_HumanHeroFirst", X = 287, Y = 119},
			FigureLookAtDirection {Tag = "pl_HumanHeroFirst", Direction = 120},
			
			FigureAbilityAdd	{Tag = "pl_HumanHeroThird", AbilityId = 95},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 288, Y = 117},
			FigureLookAtDirection {Tag = "pl_HumanHeroThird", Direction = 120},
			FigureTeleport {Tag = "pl_HumanHeroThird", X = 288, Y = 117},
			FigureLookAtDirection {Tag = "pl_HumanHeroThird", Direction = 120},
			
			FigureAbilityAdd	{Tag = "pl_HumanHeroSecond", AbilityId = 95},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 289, Y = 115},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 120},
			FigureTeleport {Tag = "pl_HumanHeroSecond", X = 289, Y = 115},
			FigureLookAtDirection {Tag = "pl_HumanHeroSecond", Direction = 120},
			
			FigureAbilityAdd	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = 95},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 286, Y = 116},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 120},
			FigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 286, Y = 116},
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 120},
						
			FigureTeamTransfer {Tag = "CS_Intro_Ravage", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Reaper01", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Reaper02", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Reaper03", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Assassin01", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Assassin02", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Assassin03", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Sorceress01", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Sorceress02", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Sorceress03", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Gargoyle01", Team = "tm_Allies"},
			FigureTeamTransfer {Tag = "CS_Intro_Gargoyle02", Team = "tm_Allies"},
			
			FigureAttackEntity	{Tag = "CS_Intro_Ravage", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "CS_Intro_Reaper01", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "CS_Intro_Reaper02", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "CS_Intro_Reaper03", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "CS_Intro_Assassin01", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "CS_Intro_Assassin02", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "CS_Intro_Assassin03", TargetTag = "CS_Intro_Titan"},
			--FigureAttackEntity	{Tag = "CS_Intro_Sorceress01", TargetTag = "CS_Intro_Titan"},
			--FigureAttackEntity	{Tag = "CS_Intro_Sorceress02", TargetTag = "CS_Intro_Titan"},
			--FigureAttackEntity	{Tag = "CS_Intro_Sorceress03", TargetTag = "CS_Intro_Titan"},
			--FigureAttackEntity	{Tag = "CS_Intro_Gargoyle01", TargetTag = "CS_Intro_Tian"},
			--FigureAttackEntity	{Tag = "CS_Intro_Gargoyle02", TargetTag = "CS_Intro_Titan"},
			
			FigureRun	{Tag = "CS_Intro_Ravage", X = 305, Y = 140},
			FigureRun	{Tag = "CS_Intro_Sorceress01", X = 305, Y = 140},
			FigureRun	{Tag = "CS_Intro_Sorceress02", X = 305, Y = 140},
			FigureRun	{Tag = "CS_Intro_Sorceress03", X = 305, Y = 140},
			FigureRun	{Tag = "CS_Intro_Gargoyle01", X = 305, Y = 140},
			FigureRun	{Tag = "CS_Intro_Gargoyle02", X = 305, Y = 140},
			
			FigureAttackEntity	{Tag = "pl_HumanAvatar", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "pl_HumanHeroThird", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "CS_Intro_Titan"},
			FigureAttackEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "CS_Intro_Titan"},
			FigureRun	{Tag = "pl_HumanHeroCaine", X = 305, Y = 140},
			FigureRun	{Tag = "pl_HumanHeroOrc", X = 305, Y = 140},
			FigureRun	{Tag = "pl_HumanHeroFirst", X = 305, Y = 140},
			FigureRun	{Tag = "pl_HumanHeroThird", X = 305, Y = 140},
			FigureRun	{Tag = "pl_HumanHeroSecond", X = 305, Y = 140},
			FigureRun	{Tag = "pl_HumanCompanionCraigHuman", X = 305, Y = 140},
			
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_11",
	},	
};

State
{
	StateName = "Cutscene01_11",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Warrior03", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Warrior03"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_12",
	},	
};

State
{
	StateName = "Cutscene01_12",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Chosen01", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Chosen01"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_13",
	},	
};

State
{
	StateName = "Cutscene01_13",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Chosen03", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Chosen03"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_14",
	},	
};

State
{
	StateName = "Cutscene01_14",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Spike02", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Spike02"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_15",
	},	
};

State
{
	StateName = "Cutscene01_15",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Spike03", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Spike03"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_16",
	},	
};

State
{
	StateName = "Cutscene01_16",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Chosen02", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Chosen02"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_17",
	},	
};

State
{
	StateName = "Cutscene01_17",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Warrior01", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Warrior01"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_18",
	},	
};

State
{
	StateName = "Cutscene01_18",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Spike01", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Spike01"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_19",
	},	
};

State
{
	StateName = "Cutscene01_19",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Mage01", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Mage01"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_20",
	},	
};

State
{
	StateName = "Cutscene01_20",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Mage02", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Mage02"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01_21",
	},	
};

State
{
	StateName = "Cutscene01_21",
	OnOneTimeEvent
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureHealthSet	{Tag = "CS_Intro_Titan", Percent = 0},
			FigureKill	{Tag = "CS_Intro_Titan"},
			CutsceneCombatOn	{},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "DUMA_RENDEZES",
	},	
};

-- kamera snitt
State
{
	StateName = "DUMA_RENDEZES",
	
	OnOneTimeEvent 
	{
		EventName = ">>> DUMA_RENDEZES <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			--Nameless
			FigureVanish {Tag = "CS_Intro_Spike01"},
			FigureVanish {Tag = "CS_Intro_Spike02"},
			FigureVanish {Tag = "CS_Intro_Spike03"},
			FigureVanish {Tag = "CS_Intro_Mage01"},
			FigureVanish {Tag = "CS_Intro_Mage02"},
			FigureVanish {Tag = "CS_Intro_Mage03"},
			FigureVanish {Tag = "CS_Intro_Chosen01"},
			FigureVanish {Tag = "CS_Intro_Chosen02"},
			FigureVanish {Tag = "CS_Intro_Chosen03"},
			FigureVanish {Tag = "CS_Intro_Warrior01"},
			FigureVanish {Tag = "CS_Intro_Warrior02"},
			FigureVanish {Tag = "CS_Intro_Warrior03"},
			FigureVanish {Tag = "CS_Intro_Titan"},
			--Realm
			FigureVanish {Tag = "CS_Intro_Soldier"},
			FigureVanish {Tag = "CS_Intro_Paladin"},
			FigureVanish {Tag = "CS_Intro_Elite"},
			FigureVanish {Tag = "CS_Intro_MCrossbowman"},
			FigureVanish {Tag = "CS_Intro_Druid"},
			FigureVanish {Tag = "CS_Intro_RealmMage"},
			--Shaikan
			FigureVanish {Tag = "CS_Intro_Minion"},
			FigureVanish {Tag = "CS_Intro_Vangard"},
			FigureVanish {Tag = "CS_Intro_Drake"},
			FigureVanish {Tag = "CS_Intro_Marksman"},
			FigureVanish {Tag = "CS_Intro_Bloodmage"},
			--Pact
			FigureVanish {Tag = "CS_Intro_Gargoyle01"},
			FigureVanish {Tag = "CS_Intro_Gargoyle02"},
			FigureVanish {Tag = "CS_Intro_Ravage"},
			FigureVanish {Tag = "CS_Intro_Reaper01"},
			FigureVanish {Tag = "CS_Intro_Reaper02"},
			FigureVanish {Tag = "CS_Intro_Reaper03"},
			FigureVanish {Tag = "CS_Intro_Assassin01"},
			FigureVanish {Tag = "CS_Intro_Assassin02"},
			FigureVanish {Tag = "CS_Intro_Assassin03"},
			FigureVanish {Tag = "CS_Intro_Sorceress01"},
			FigureVanish {Tag = "CS_Intro_Sorceress02"},
			FigureVanish {Tag = "CS_Intro_Sorceress03"},

			-- AVATAR/HERO TELEPORTOK
			-- DRACON SPAWN (DraconTeleSir)
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "DraconTeleSir", Level = 1, UnitId = 2060, X = 564, Y = 134, Team = "tm_Neutral"},},
			FigureLookAtDirection {Tag = "DraconTeleSir", Direction = 270},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 557.645, Y = 132.409 },
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 557.645, Y = 132.409 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 562.349, Y = 131.424 },
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 562.349, Y = 131.424 },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 139.386},
			
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 559.223, Y = 136.001 },
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 559.223, Y = 136.001 },
			FigureLookAtDirection {Tag = "pl_HumanCompanionCraigHuman", Direction = 86.001},

			CutsceneFigureTeleport {Tag = "Surian", X = 558.736, Y = 132.656 },
			CutsceneFigureTeleport {Tag = "Surian", X = 558.736, Y = 132.656 },
			FigureLookAtDirection {Tag = "Surian", Direction = 90},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Dracav", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			

		},	
		GotoState = "CS_Take06",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take02",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_02 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS02", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take03",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take03",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_03 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS03", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take04",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take04",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_04 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS04", Tag = "DraconTeleSir"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take05",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take05",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_05 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take06",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take06",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_06 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Dracon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS06", Tag = "DraconTeleSir"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take07",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take07",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_07 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take08",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take08",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_08 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS08", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take09",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take09",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_09 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS09", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take10",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take10",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_10 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take11",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take11",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_11 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Jorbal", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS11", Tag = "Surian"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take12",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take12",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_12 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS12", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take13",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take13",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_13 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS13", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take14",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take14",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_14 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take15",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take15",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_15 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Dracon", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS15", Tag = "DraconTeleSir"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take16",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take16",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_16 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IntroCS16", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "SHUTDOWN",
	},	
};

State
{
	StateName = "SHUTDOWN",
	
	OnOneTimeEvent 
	{
		EventName = ">>> SHUTDOWN <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CutsceneFINISH",
	},	
};


State
{
	StateName = "CutsceneFINISH",
	OnCutsceneFigureDespawnEvent
	{
		EventName = "Despawn",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			FigureVanish {Tag = "DraconTeleSir"},
			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = 94},
			FigureAbilityRemove	{Tag = "pl_HumanHeroCaine", AbilityId = 94},
			FigureAbilityRemove	{Tag = "pl_HumanHeroOrc", AbilityId = 94},
			FigureAbilityRemove	{Tag = "pl_HumanHeroFirst", AbilityId = 94},
			FigureAbilityRemove	{Tag = "pl_HumanHeroThird", AbilityId = 94},
			FigureAbilityRemove	{Tag = "pl_HumanHeroSecond", AbilityId = 94},
			FigureAbilityRemove	{Tag = "pl_HumanCompanionCraigHuman", AbilityId = 94},
			FigureAbilityRemove	{Tag = "Surian", AbilityId = 94},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 585, Y = 85},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "pl_HumanAvatar"},
			FigureTeleportToEntity	{Tag = "Surian", TargetTag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "Surian", Direction = 0},
			--CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
			--MapFlagSetTrue {Name = "mf_P710_StartIntroCS_End"},
		},
		GotoState = "Cutscene01_23",
	},	
};

State
{
	StateName = "Cutscene01_23",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P710_StartIntroCS_End"},
		},
	},
};
