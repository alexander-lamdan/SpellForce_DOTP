
State
{
	StateName = "Achievements",
	
	OnOneTimeEvent
	{
		EventName = ">>> Arena monsters are dead - spawn the achievement monster  <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "arena_wolf_01"},
			FigureIsDead	{Tag = "arena_hornet_01"},
			FigureIsDead	{Tag = "arena_spider_01"},
			FigureIsDead	{Tag = "arena_beast_01"},
		},
		
		Actions =
		{
			FigureNpcSpawn	{Tag = "killer_cat", Level = 12, UnitId = 2137, X = 517.32, Y = 617.79, Team = "tm_Creep"},
			MapFlagSetTrue{ Name = "mf_P703_killer_cat_spawned" },
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> rabbit achievement completed <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "killer_cat"},
			MapFlagIsTrue{ Name = "mf_P703_killer_cat_spawned" },
		},
		
		Actions =
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P703_Rabbit"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> 3 subquests are done without the 4th <<<",
		Conditions = 
		{
			MapFlagIsFalse{ Name = "mf_P703_MQ1_1_spirits_joined" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_2_Destroyed" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_3_Destroyed" },
			MapFlagIsTrue{ Name = "mf_P703_MQ1_4_Destroyed" },
		},
		
		Actions =
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P703_Alone"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> trolls sq is done <<<",
		Conditions = 
		{
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_01_Disarmed" },
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_02_Disarmed" },
			MapFlagIsTrue{ Name = "mf_P703_SQ5_Trap_03_Disarmed" },
		},
		
		Actions =
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P703_Trolls"},
		},
	},
}