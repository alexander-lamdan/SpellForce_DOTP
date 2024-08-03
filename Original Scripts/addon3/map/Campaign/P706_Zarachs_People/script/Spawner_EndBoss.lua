-- To start a wave: MapFlagSetTrue	{Name = "mf_P706_Spawner_EndBoss_StartAWave"},
-- Note: the script sets the flag to False after the wave is started


local otSpawnPoint = "BossWithoutBreathFire";
local fidSpawn = 2033; -- Dragon Boss Fighter
local lvl = 11;
local lvlFighters = {
	["Easy"]		= 13,
	["Normal"]	= 14,
	["Hard"]		= 15,
	["Extreme"]	= 16,
};

local pl = "pl_Nameless";
local tm = "tm_Nameless";
local secMinTimeBetweenSpawns = 30;


--*************************************************************************************************** no spawn exist, lets spawn them
State
{
	StateName = "SPAWN_TYPE_1",

	OnEvent 
	{
		EventName = ">>> EASY: Start a wave - mf_P706_Spawner_EndBoss_StartAWave  AND  there are no living spawns  AND  secMinTimeBetweenSpawns > 1 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 5},
						
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = secMinTimeBetweenSpawns},
			MapFlagIsTrue	{Name = "mf_P706_Spawner_EndBoss_StartAWave"},
			GameDifficulty {Value = Diff.Easy},

			FigureIsDead	{Tag = "Spawned_NL_BossFighter_01"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_02"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_03"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_04"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_05"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_06"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_07"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_08"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_09"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_10"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_EndBoss_StartAWave"}, -- to allow for starting another wave

			EffectStartAtEntityPosition	{Tag = otSpawnPoint, File = "Effect_ShadowDestroyer_ML_Initial"},
			-- Other effects: Effect_ThunderFlash_Cast / base -- Effect_Leech_Cast / addon1 -- Effect_Heal_Cast.xml
			-- Effect_ShadowDestroyer_ML_Initial / base -- Effect_RaiseDead_Resolve / base -- Effect_AreaLifetap_Impact.xml (base) -- Effect_Misc_God_Vanishing (base) -- Effect_Spawn_Unit / base
			
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_01", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_02", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_03", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_04", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_05", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_06", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_07", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_08", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_09", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_10", Player = pl, Level = lvlFighters.Easy, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_01"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_02"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_03"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_04"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_05"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_06"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_07"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_08"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_09"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_10"},

			MapTimerStart	{Name = "mt_P706_Spawner_Endboss_StartAWave"},
		},
	},

	OnEvent 
	{
		EventName = ">>> NORMAL: Start a wave - mf_P706_Spawner_EndBoss_StartAWave  AND  there are no living spawns  AND  secMinTimeBetweenSpawns > 1 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 5},
						
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = secMinTimeBetweenSpawns},
			MapFlagIsTrue	{Name = "mf_P706_Spawner_EndBoss_StartAWave"},
			GameDifficulty {Value = Diff.Normal},

			FigureIsDead	{Tag = "Spawned_NL_BossFighter_01"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_02"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_03"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_04"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_05"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_06"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_07"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_08"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_09"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_10"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_EndBoss_StartAWave"}, -- to allow for starting another wave

			EffectStartAtEntityPosition	{Tag = otSpawnPoint, File = "Effect_ShadowDestroyer_ML_Initial"},
			-- Other effects: Effect_ThunderFlash_Cast / base -- Effect_Leech_Cast / addon1 -- Effect_Heal_Cast.xml
			-- Effect_ShadowDestroyer_ML_Initial / base -- Effect_RaiseDead_Resolve / base -- Effect_AreaLifetap_Impact.xml (base) -- Effect_Misc_God_Vanishing (base) -- Effect_Spawn_Unit / base
			
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_01", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_02", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_03", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_04", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_05", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_06", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_07", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_08", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_09", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_10", Player = pl, Level = lvlFighters.Normal, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_01"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_02"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_03"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_04"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_05"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_06"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_07"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_08"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_09"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_10"},

			MapTimerStart	{Name = "mt_P706_Spawner_Endboss_StartAWave"},
		},
	},

	OnEvent 
	{
		EventName = ">>> HARD: Start a wave - mf_P706_Spawner_EndBoss_StartAWave  AND  there are no living spawns  AND  secMinTimeBetweenSpawns > 1 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 5},
						
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = secMinTimeBetweenSpawns},
			MapFlagIsTrue	{Name = "mf_P706_Spawner_EndBoss_StartAWave"},
			GameDifficulty {Value = Diff.Hard},

			FigureIsDead	{Tag = "Spawned_NL_BossFighter_01"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_02"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_03"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_04"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_05"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_06"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_07"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_08"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_09"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_10"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_EndBoss_StartAWave"}, -- to allow for starting another wave

			EffectStartAtEntityPosition	{Tag = otSpawnPoint, File = "Effect_ShadowDestroyer_ML_Initial"},
			-- Other effects: Effect_ThunderFlash_Cast / base -- Effect_Leech_Cast / addon1 -- Effect_Heal_Cast.xml
			-- Effect_ShadowDestroyer_ML_Initial / base -- Effect_RaiseDead_Resolve / base -- Effect_AreaLifetap_Impact.xml (base) -- Effect_Misc_God_Vanishing (base) -- Effect_Spawn_Unit / base
			
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_01", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_02", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_03", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_04", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_05", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_06", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_07", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_08", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_09", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_10", Player = pl, Level = lvlFighters.Hard, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_01"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_02"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_03"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_04"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_05"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_06"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_07"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_08"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_09"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_10"},

			MapTimerStart	{Name = "mt_P706_Spawner_Endboss_StartAWave"},
		},
	},

	OnEvent 
	{
		EventName = ">>> EXTREME: Start a wave - mf_P706_Spawner_EndBoss_StartAWave  AND  there are no living spawns  AND  secMinTimeBetweenSpawns > 1 <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 5},
						
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = secMinTimeBetweenSpawns},
			MapFlagIsTrue	{Name = "mf_P706_Spawner_EndBoss_StartAWave"},
			GameDifficulty {Value = Diff.Extreme},

			FigureIsDead	{Tag = "Spawned_NL_BossFighter_01"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_02"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_03"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_04"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_05"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_06"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_07"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_08"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_09"},
			FigureIsDead	{Tag = "Spawned_NL_BossFighter_10"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_EndBoss_StartAWave"}, -- to allow for starting another wave

			EffectStartAtEntityPosition	{Tag = otSpawnPoint, File = "Effect_ShadowDestroyer_ML_Initial"},
			-- Other effects: Effect_ThunderFlash_Cast / base -- Effect_Leech_Cast / addon1 -- Effect_Heal_Cast.xml
			-- Effect_ShadowDestroyer_ML_Initial / base -- Effect_RaiseDead_Resolve / base -- Effect_AreaLifetap_Impact.xml (base) -- Effect_Misc_God_Vanishing (base) -- Effect_Spawn_Unit / base
			
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_01", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_02", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_03", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_04", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_05", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_06", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_07", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_08", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_09", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL_BossFighter_10", Player = pl, Level = lvlFighters.Extreme, UnitId = fidSpawn,	TargetTag = otSpawnPoint, Team = tm}, 
			
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_01"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_02"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_03"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_04"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_05"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_06"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_07"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_08"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_09"},
			FigureHoldPosition	{Tag = "Spawned_NL_BossFighter_10"},

			MapTimerStart	{Name = "mt_P706_Spawner_Endboss_StartAWave"},
		},
	},
	
	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_01",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 10},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_02",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 10},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_03",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 16},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_04",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 16},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_05",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 22},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_06",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 22},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_07",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 26},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_08",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 26},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_09",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 30},
		},
		Actions = 
		{
		},
	},

	OnFollowEvent
	{
		Tag = "Spawned_NL_BossFighter_10",
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Spawner_Endboss_StartAWave", Seconds = 30},
		},
		Actions = 
		{
		},
	},	
};