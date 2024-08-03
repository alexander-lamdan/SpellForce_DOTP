local Lava_Golem = 	"LavaGolem18";
local ResPoint =						"R18";
local NUp =			6;
local NDown =		21;
local NLeft =		18;
local NRight =	19;
local PUp = 		11;
local PDown = 	21;
local PLeft = 	17;
local PRight =	19;

State
{
	StateName = "INIT",
	
	OnEvent 
	{
		EventName = ">>> LavaGolem dead <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			EntityFlagIsFalse {Name = "ef_LavaGolemRespawning"},
			FigureIsDead {Tag = Lava_Golem},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_LavaGolemRespawning"},
			EntityFlagSetTrue {Name = "ef_LavaGolemJustDead"},
			EntityTimerStart	{Name = "et_LavaGolemRespawnTimer"},
		},
	},

	OnEvent 
	{
		EventName = ">>> LavaGolem long dead <<<",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_LavaGolemRespawning"},
			EntityTimerIsElapsed {Name = "et_LavaGolemRespawnTimer", Seconds = 1},
			EntityFlagIsTrue {Name = "ef_LavaGolemJustDead"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_LavaGolemJustDead"},
		},
	},

	OnEvent 
	{
		EventName = ">>> LavaGolem respawn <<<",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_LavaGolemRespawning"},
			FigureIsDead {Tag = Lava_Golem},
			EntityTimerIsElapsed {Name = "et_LavaGolemRespawnTimer", Seconds = 10},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LavaGolemRespawnTimer"},
			FigureNpcSpawnToEntity	{Tag = Lava_Golem, Player = "pl_Enemy", Level = 3, UnitId = 2041, TargetTag = ResPoint, Team = "tm_Team2"},
			EffectStartAtEntityPosition {Tag = Lava_Golem, File = "Effect_Spawn_Unit"},
			EntityFlagSetFalse {Name = "ef_LavaGolemRespawning"},
			EventReEnable	{Name = "Push Up"},
			EventReEnable	{Name = "Push Down"},
			EventReEnable	{Name = "Push Left"},
			EventReEnable	{Name = "Push Right"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> LavaGolem push first <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			EntityFlagIsTrue {Name = "ef_LavaGolemJustDead"},
			OR
			{
				MapValueIsEqual {Name = "mv_SealPos", Value = NUp},
				MapValueIsEqual {Name = "mv_SealPos", Value = NDown},
				MapValueIsEqual {Name = "mv_SealPos", Value = NLeft},
				MapValueIsEqual {Name = "mv_SealPos", Value = NRight},
			},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_P707_PassDone"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> LavaGolem push up <<<",
		Name = "Push Up",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			EntityFlagIsTrue {Name = "ef_LavaGolemJustDead"},
			MapValueIsEqual {Name = "mv_SealPos", Value = NUp},
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = Lava_Golem, File = "Effect_Misc_Lavaflow_01"},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "FirstSeal"},
			ObjectSpawnToEntity	{ObjectId = 2700, TargetTag = SealPosTag[PUp], Direction = 0, Tag = "FirstSeal"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FirstSeal", Range = 20, Height = 2},
			MapValueSet {Name = "mv_SealPos", Value = PUp},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> LavaGolem push down<<<",
		Name = "Push Down",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			EntityFlagIsTrue {Name = "ef_LavaGolemJustDead"},
			MapValueIsEqual {Name = "mv_SealPos", Value = NDown},
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = Lava_Golem, File = "Effect_Misc_Lavaflow_01"},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "FirstSeal"},
			ObjectSpawnToEntity	{ObjectId = 2700, TargetTag = SealPosTag[PDown], Direction = 0, Tag = "FirstSeal"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FirstSeal", Range = 20, Height = 2},
			MapValueSet {Name = "mv_SealPos", Value = PDown},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
		},
	},

	OnOneTimeRepeatEvent 
	{
		EventName = ">>> LavaGolem push Left <<<",
		Name = "Push Left",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			EntityFlagIsTrue {Name = "ef_LavaGolemJustDead"},
			MapValueIsEqual {Name = "mv_SealPos", Value = NLeft},
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = Lava_Golem, File = "Effect_Misc_Lavaflow_01"},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "FirstSeal"},
			ObjectSpawnToEntity	{ObjectId = 2700, TargetTag = SealPosTag[PLeft], Direction = 0, Tag = "FirstSeal"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FirstSeal", Range = 20, Height = 2},
			MapValueSet {Name = "mv_SealPos", Value = PLeft},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
		},
	},
	
	OnOneTimeRepeatEvent 
	{
		EventName = ">>> LavaGolem push Right<<<",
		Name = "Push Right",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_1"},
			EntityFlagIsTrue {Name = "ef_LavaGolemJustDead"},
			MapValueIsEqual {Name = "mv_SealPos", Value = NRight},
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = Lava_Golem, File = "Effect_Misc_Lavaflow_01"},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "FirstSeal"},
			ObjectSpawnToEntity	{ObjectId = 2700, TargetTag = SealPosTag[PRight], Direction = 0, Tag = "FirstSeal"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FirstSeal", Range = 20, Height = 2},
			MapValueSet {Name = "mv_SealPos", Value = PRight},
			EffectStartAtEntityPosition {Tag = "FirstSeal", File = "Effect_Spawn_Unit"},
		},
	},

	OnOneTimeEvent 
	{
		EventName = ">>> LavaFoci End <<<",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SSSR_MQ_01_2"},
		},
		Actions =
		{
		},
		GotoState = "LavaFociEnd",
	},
};


State --**************************************************** LavaFoci End State
{
	StateName = "LavaFociEnd",
	
	OnOneTimeEvent ------------------------------------------- End
	{
		EventName = ">>> End <<<",
		Conditions = 
		{
		},
		Actions =
		{
		},
	},
};