-- To start a wave:
-- MapValueSet	{Name = "mv_P706_Spawner_NL1_Wave", Value = 1}, -- to start wave 1, N to start wave N
-- MapFlagSetTrue	{Name = "mf_P706_Spawner_NL1_StartAWave"},
-- Note: the script sets the flag to False after the wave is started


local ThisWave = 4;
local pl = "pl_NL1_SpawnOrcBase4";
local plMerge = "pl_NL1_SpawnOrcBaseAI";

local PointSpawnA = "path_NL1_00a";
local PointSpawnB = "path_NL1_00b";
local PointSpawnC = "path_NL1_00c";
local PointTeleportIn  = "path_NL1_01"; -- teleport entrance
local PointTeleportOut = "path_NL1_02"; -- teleport exit
local Point03  = "path_NL1_03";
local Point04  = "path_NL1_04";
local Point05  = "path_NL1_05";
local Point06  = "path_NL1_06";
local Point07  = "path_NL1_07";
local Point08  = "path_NL1_08";
local Point09  = "path_NL1_09";

local uWarrior 				= 1655;
local uSpike					= 1681;
local uWarriorGiant		= 1724;
local uRenegadeSword	= 1717;
local uMage						= 1656;
local uChosen					= 1658;
local uChosenGiant		=	1723;
local uArtillery			= 1657;

local uRTSWarrior				=  189;
local uRTSMage					=  190;
local uRTSArtillery			=  191;
local uRTSChosen				=  192;
local uRTSTitan					=  194;
local uRTSSpike					=  195;

local lvl = 0;
local tm = "tm_Nameless";
local rg = 8; -- distance treshold to consider the unit to be ready to teleported
local rgToMerge = 15;




State
{
	StateName = "SPAWNER_READY",

	OnEvent
	{
		EventName = ">>> spawning... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			MapFlagIsTrue	{Name = "mf_P706_Spawner_NL1_StartAWave"},
			MapValueIsEqual	{Name = "mv_P706_Spawner_NL1_Wave", Value = ThisWave},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Spawner_NL1_StartAWave"}, -- to allow for starting another wave

			FigureNpcSpawnToEntity	{Tag = "Spawned_NL1_04_01", Player = pl, Level = lvl, UnitId = uWarrior,			TargetTag = PointSpawnA, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL1_04_02", Player = pl, Level = lvl, UnitId = uSpike,				TargetTag = PointSpawnB, Team = tm}, 
			FigureNpcSpawnToEntity	{Tag = "Spawned_NL1_04_03", Player = pl, Level = lvl, UnitId = uWarrior,			TargetTag = PointSpawnC, Team = tm},

			FigureRunToEntity {Tag = "Spawned_NL1_04_01", TargetTag = PointTeleportIn},
			FigureRunToEntity {Tag = "Spawned_NL1_04_02", TargetTag = PointTeleportIn},
			FigureRunToEntity {Tag = "Spawned_NL1_04_03", TargetTag = PointTeleportIn},
		},
		GotoState = "WAITING_TO_BE_TELEPORTED",		
	},
};




State
{
	StateName = "WAITING_TO_BE_TELEPORTED",

	OnEvent
	{
		EventName = ">>> at least one unit has arrived --> teleporting and FigurePathGoto... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 10},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "Spawned_NL1_04_01", TargetTag = PointTeleportIn, Range = rg},
				FigureIsInRangeToEntity	{Tag = "Spawned_NL1_04_02", TargetTag = PointTeleportIn, Range = rg},
				FigureIsInRangeToEntity	{Tag = "Spawned_NL1_04_03", TargetTag = PointTeleportIn, Range = rg},
			},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "Spawned_NL1_04_01", TargetTag = PointTeleportOut},
			FigureTeleportToEntity	{Tag = "Spawned_NL1_04_02", TargetTag = PointTeleportOut},
			FigureTeleportToEntity	{Tag = "Spawned_NL1_04_03", TargetTag = PointTeleportOut},
			
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_NL1_04_01", TargetTag = Point09}, Tags = {Point03, Point04, Point05, Point06, Point07, Point08}},
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_NL1_04_02", TargetTag = Point09}, Tags = {Point03, Point04, Point05, Point06, Point07, Point08}},
			FigurePathGoto { Goto = FigureRunToEntity {Tag = "Spawned_NL1_04_03", TargetTag = Point09}, Tags = {Point03, Point04, Point05, Point06, Point07, Point08}},
		},
		GotoState = "WAITING_TO_MERGE",
	},
	
	OnEvent
	{
		EventName = ">>> all units before killed teleportation --> switch to SPAWNER_READY state <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},
			FigureIsDead	{Tag = "Spawned_NL1_04_01"},
			FigureIsDead	{Tag = "Spawned_NL1_04_02"},
			FigureIsDead	{Tag = "Spawned_NL1_04_03"},
		},
		Actions =
		{
		},
		GotoState = "SPAWNER_READY",
	},	
};





State
{
	StateName = "WAITING_TO_MERGE",

	OnEvent
	{
		EventName = ">>> at least one unit has arrived --> figure transfer to pl_NL1_SpawnOrcBaseAI... <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 20},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "Spawned_NL1_04_01", TargetTag = Point06, Range = rgToMerge},
				FigureIsInRangeToEntity	{Tag = "Spawned_NL1_04_02", TargetTag = Point06, Range = rgToMerge},
				FigureIsInRangeToEntity	{Tag = "Spawned_NL1_04_03", TargetTag = Point06, Range = rgToMerge},
			},
		},
		Actions =
		{
			FigurePlayerTransfer	{Tag = "Spawned_NL1_04_01", Player = plMerge},
			FigurePlayerTransfer	{Tag = "Spawned_NL1_04_02", Player = plMerge},
			FigurePlayerTransfer	{Tag = "Spawned_NL1_04_03", Player = plMerge},
		},
		GotoState = "SPAWNER_READY",
	},
	
	OnEvent
	{
		EventName = ">>> all units killed before merge -> switch to SPAWNER_READY state <<<",
		Conditions = 
		{
			SetUpdateInterval {Steps = 50},
			FigureIsDead	{Tag = "Spawned_NL1_04_01"},
			FigureIsDead	{Tag = "Spawned_NL1_04_02"},
			FigureIsDead	{Tag = "Spawned_NL1_04_03"},
		},
		Actions =
		{
		},
		GotoState = "SPAWNER_READY",
	},
};