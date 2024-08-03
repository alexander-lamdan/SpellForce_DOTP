
local SpawnNumber = 10;
local SpawnPlayer = "pk_UndeadLich";
local SpawnUnit = 127;

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MQ5_SUBQ_52_AttackTimer_Started"},

		},
		Actions =
		{

			MapFlagSetTrue {Name = "mf_spawnit"},
			MapValueSet	{Name = "mv_SpawnCount", Value = SpawnNumber},
			--MapValueSetVariable	{Name = "SpawnCount", Variable = "SpawnNumber"},
			
		},
		GotoState = "SPAWN",
	},
	
};

State
{

StateName = "SPAWN",

OnEvent
		{
		Conditions = 
		{
				
				MapValueIsGreater	{Name = "mv_SpawnCount", Value = 1},

		},
		Actions =
		{		
			
		FigureRtsSpawnToEntity	{UnitId = 127, Level = 1, Player = "tm_Undead", TargetTag = "ShaikanTowerAttackMarker"},
		MapValueDecrease	{Name = "mv_SpawnCount"},

			
		},
	},
	
	
	
}


	
	
