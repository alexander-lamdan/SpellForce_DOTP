State
	{	
	StateName = "INIT",

		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P710_StartClanCS_End"},
				FigureIsDead	{Tag = "Khoor"},
				QuestIsActive	{Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_P710_KhoorDied"},
				MapFlagSetTrue	{Name = "mt_P710_Khoor_Died"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_P710_StartClanCS_End"},
				FigureIsDead	{Tag = "Khoor"},
				QuestIsSolved	{Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			},
			Actions = 
			{
				MapFlagSetTrue	{Name = "mt_P710_Khoor_Died"},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_KhoorDied", Seconds = 5},
			},
			Actions = 
			{
				PlayerGameOver	{Player = "default", Tag = "Khoor", LocaTag = "IGMenuGameOver_Title"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostSpawn,
			Name = "Ghost_Spawn",
			Conditions = 
			{
				MapFlagIsFalse	{Name = "mt_P710_Ghost_Spawned"},
				FigureRaceIsInRangeToEntity	{Race = 50, Range = 30, TargetTag = "Khoor"},
			},
			Actions = 
			{
				FigureNpcSpawnToEntity	{Tag = "Ghost_Wolf", Level = 30, UnitId = 2195, TargetTag = "Khoor", Team = "tm_Allies"},
				FigureNpcSpawnToEntity	{Tag = "Ghost_Shaman", Level = 30, UnitId = 2196, TargetTag = "Khoor", Team = "tm_Allies"},
				FigureNpcSpawnToEntity	{Tag = "Ghost_Champion", Level = 30, UnitId = 2197, TargetTag = "Khoor", Team = "tm_Allies"},
				MapTimerStart	{Name = "mt_P710_Ghost_Spawn_ReEnable"},
				MapFlagSetTrue	{Name = "mt_P710_Ghost_Spawned"},
				EventReEnable	{Name = "Ghost_Despawn"},
				EventReEnable	{Name = "Ghost_Spawn_Is_Dead"},
				EventReEnable	{Name = "Ghost_Spawn_Timer"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostDespawn,
			Name = "Ghost_Despawn",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_Ghost_Spawn_ReEnable", Seconds = 30},
			},
			Actions = 
			{
				FigureVanish	{Tag = "Ghost_Wolf"},
				FigureVanish	{Tag = "Ghost_Shaman"},
				FigureVanish	{Tag = "Ghost_Champion"},
				MapFlagSetFalse {Name = "mt_P710_Ghost_Wolf_Follow"},
				MapFlagSetFalse {Name = "mt_P710_Ghost_Shaman_Follow"},
				MapFlagSetFalse {Name = "mt_P710_Ghost_Champion_Follow"},
				MapFlagSetFalse	{Name = "mt_P710_Ghost_Spawned"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostSpawnIsDead,
			Name = "Ghost_Spawn_Is_Dead",
			Conditions = 
			{
				FigureIsDead	{Tag = "Ghost_Wolf"},
				FigureIsDead	{Tag = "Ghost_Shaman"},
				FigureIsDead	{Tag = "Ghost_Champion"},
			},
			Actions = 
			{
				MapFlagSetFalse	{Name = "mt_P710_Ghost_Spawned"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostSpawnTimer,
			Name = "Ghost_Spawn_Timer",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_P710_Ghost_Spawn_ReEnable", Seconds = 120},
			},
			Actions = 
			{
				MapTimerStop	{Name = "mt_P710_Ghost_Spawn_ReEnable"},
				EventReEnable	{Name = "Ghost_Spawn"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostWolfFollow1,
			Name = "Ghost_Wolf_Follow1",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mt_P710_Ghost_Wolf_Follow"},
				FigureIsIdle	{Tag = "Ghost_Wolf"},
			},
			Actions = 
			{
				FigureFollowEntity	{Tag = "Ghost_Wolf", TargetTag = "Khoor"},
				EventReEnable	{Name = "Ghost_Wolf_Follow2"},
				MapFlagSetTrue {Name = "mt_P710_Ghost_Wolf_Follow"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostWolfFollow2,
			Name = "Ghost_Wolf_Follow2",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mt_P710_Ghost_Wolf_Follow"},
				FigureIsIdle	{Tag = "Ghost_Wolf"},
			},
			Actions = 
			{
				FigureFollowEntity	{Tag = "Ghost_Wolf", TargetTag = "Khoor"},
				EventReEnable	{Name = "Ghost_Wolf_Follow1"},
				MapFlagSetTrue {Name = "mt_P710_Ghost_Wolf_Follow"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostShamanFollow1,
			Name = "Ghost_Shaman_Follow1",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mt_P710_Ghost_Shaman_Follow"},
				FigureIsIdle	{Tag = "Ghost_Shaman"},
			},
			Actions = 
			{
				FigureFollowEntity	{Tag = "Ghost_Shaman", TargetTag = "Khoor"},
				EventReEnable	{Name = "Ghost_Shaman_Follow2"},
				MapFlagSetTrue {Name = "mt_P710_Ghost_Shaman_Follow"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostShamanFollow2,
			Name = "Ghost_Shaman_Follow2",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mt_P710_Ghost_Shaman_Follow"},
				FigureIsIdle	{Tag = "Ghost_Shaman"},
			},
			Actions = 
			{
				FigureFollowEntity	{Tag = "Ghost_Shaman", TargetTag = "Khoor"},
				EventReEnable	{Name = "Ghost_Shaman_Follow1"},
				MapFlagSetTrue {Name = "mt_P710_Ghost_Shaman_Follow"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostChampionFollow1,
			Name = "Ghost_Champion_Follow1",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mt_P710_Ghost_Champion_Follow"},
				FigureIsIdle	{Tag = "Ghost_Champion"},
			},
			Actions = 
			{
				FigureFollowEntity	{Tag = "Ghost_Champion", TargetTag = "Khoor"},
				EventReEnable	{Name = "Ghost_Champion_Follow2"},
				MapFlagSetTrue {Name = "mt_P710_Ghost_Champion_Follow"},
			},
		},
		
		OnOneTimeRepeatEvent
		{
			EventName = GhostChampionFollow2,
			Name = "Ghost_Champion_Follow2",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mt_P710_Ghost_Champion_Follow"},
				FigureIsIdle	{Tag = "Ghost_Champion"},
			},
			Actions = 
			{
				FigureFollowEntity	{Tag = "Ghost_Champion", TargetTag = "Khoor"},
				EventReEnable	{Name = "Ghost_Champion_Follow1"},
				MapFlagSetTrue {Name = "mt_P710_Ghost_Champion_Follow"},
			},
		},
	};