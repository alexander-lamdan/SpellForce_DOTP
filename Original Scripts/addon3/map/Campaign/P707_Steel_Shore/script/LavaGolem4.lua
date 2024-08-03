local Lava_Golem = "LavaGolem1";
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P707_LavaGolemPuzzleSpawn"},			
		},
		Actions =
		{
			FogOfWarRevealAtEntity {FogOfWarId = 1, Tag = Lava_Golem, Range = 20, Height = 2},
		},
		NoSpawnEffect = false,
	};	

};