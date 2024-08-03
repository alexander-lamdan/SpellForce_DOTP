State
{
	StateName = "QuestBook",

-- Tesztelehez, torolheto!


-- Tesztresz vege!




------------------------------------------------------
---- 01: Hirin, god of the messengers and death ----
------------------------------------------------------

	-- npc_Hirin01 altal adott scroll (625-os misc) leadasa Ereon szigeten a megfelelo szemelynek
	OnOneTimeEvent
	{
		EventName = "Hirin_SQ1_Active",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_HirinSQActive"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			QuestSetActive	{Player = "default", Quest = "SS_HIRIN_SQ1"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Hirin_SQ1_Done",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "HirinSQEndTimer", Seconds = 8},
			MapFlagIsTrue	{Name = "mf_P702_HirinSQDone"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "HirinSQEndTimer"},
			QuestSetSolved	{Player = "default", Quest = "SS_HIRIN_SQ1"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Hirin_SQ1_Failed",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "HirinSQEndTimer", Seconds = 8},
			MapFlagIsTrue	{Name = "mf_P702_HirinSQFailed"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "HirinSQEndTimer"},
			QuestSetUnsolvable	{Player = "default", Quest = "SS_HIRIN_SQ1"},
		},
		GotoState = self,
	};



------------------------------------------------------
---- 02: Elen, god of the hunt ----
------------------------------------------------------

	-- WolfSpirit megbocsátása
	
	-- WolfSpirit megnyugtatasa szellemmacskavadaszattal
	
	OnOneTimeEvent
	{
		EventName = "Elen SQ dialog set",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "qg_GuardianStone02"},
		},
		GotoState = self,
	};
	

	OnOneTimeEvent
	{
		EventName = "Elen SQ2 start",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_Elen_SQ02_BurialActive"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "qg_GuardianStone02", Range = 5},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ1"},
			--AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ2"},
		},
		GotoState = self,
	};

	
	
	
	OnOneTimeEvent
	{
		EventName = "Elen SQ1: WolfSpirit_-_CatHunt",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_Elen_SQ21_Accepted"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "mns_ghostcat_01", Level = 16, UnitId = 135, X = 247, Y = 69, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_02", Level = 16, UnitId = 135, X = 245, Y = 68, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_03", Level = 17, UnitId = 135, X = 167, Y = 71, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_04", Level = 18, UnitId = 135, X = 74, Y = 74, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_05", Level = 18, UnitId = 135, X = 230, Y = 122, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_06", Level = 18, UnitId = 135, X = 231, Y = 144, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_07", Level = 19, UnitId = 1163, X = 136, Y = 183, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "mns_ghostcat_08", Level = 19, UnitId = 1163, X = 136, Y = 165, Team = "tm_Creep"},
			FigureDirectionSet	{Tag = "mns_ghostcat_01", Direction = 25 },
			FigureDirectionSet	{Tag = "mns_ghostcat_02", Direction = 80},
			FigureDirectionSet	{Tag = "mns_ghostcat_03", Direction = 0},
			FigureDirectionSet	{Tag = "mns_ghostcat_04", Direction = 74},
			FigureDirectionSet	{Tag = "mns_ghostcat_05", Direction = 250},
			FigureDirectionSet	{Tag = "mns_ghostcat_06", Direction = 0},
			FigureDirectionSet	{Tag = "mns_ghostcat_07", Direction = 18},
			FigureDirectionSet	{Tag = "mns_ghostcat_08", Direction = 132},
			QuestSetActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Elen_SQ21_Done",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
			FigureIsDead	{Tag = "mns_ghostcat_01"},
			FigureIsDead	{Tag = "mns_ghostcat_02"},
			FigureIsDead	{Tag = "mns_ghostcat_03"},
			FigureIsDead	{Tag = "mns_ghostcat_04"},
			FigureIsDead	{Tag = "mns_ghostcat_05"},
			FigureIsDead	{Tag = "mns_ghostcat_06"},
			FigureIsDead	{Tag = "mns_ghostcat_07"},
			FigureIsDead	{Tag = "mns_ghostcat_08"},			
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ21"},
		},
		GotoState = self,
	};
	
	
	
	OnOneTimeEvent
	{
		EventName = "Elen_SQ2_Done",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ2"},
			MapFlagIsTrue {Name = "mf_P702_Elen_SQ02_BurialDone"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ2"},
			QuestSetSolved	{Player = "default", Quest = "IOS_SIDEQ_3"},			
		},
		GotoState = self,
	};





------------------------------------------------------
---- 03: Zerbo, god of the thieves and games ----
------------------------------------------------------

-- Side Quest: Menekulni a "flicked boss" elol. Kell egy item, amit felvesz a player menekules elott.


------------------------------------------------------
---- 04: Nor, god of the Moon ----
------------------------------------------------------

-- Side-quest: Osszegyujteni a halott jegyzetlapjait, es odaadni a felesegenek, Westguardon.

	OnOneTimeEvent
	{
		EventName = "Nor SideQuest1 Activated",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P702_NorGhostAccepted"},
		},
		Actions = 
		{
			QuestSetActive	{Player = "default", Quest = "SS_NOR_10"},
			ObjectLootItemMiscAdd	{Tag = "Dh_1", DropChance = 100, ItemId = 630 },
			ObjectLootItemMiscAdd	{Tag = "Dh_2", DropChance = 100, ItemId = 631 },
			ObjectLootItemMiscAdd	{Tag = "Dh_3", DropChance = 100, ItemId = 632 },
			ObjectLootItemMiscAdd	{Tag = "Dh_4", DropChance = 100, ItemId = 633 },
			ObjectLootItemMiscAdd	{Tag = "Dh_5", DropChance = 100, ItemId = 634 },
			DialogSetDisabled	{Tag = "npc_TravelerGhost"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Nor SideQuest1 Solved; SideQuest2 Activated",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_NOR_10"},
			AvatarHasItemMisc	{Player = "default", ItemId = 630, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 631, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 632, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 633, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 634, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 635, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "SS_NOR_10"},
			QuestSetActive	{Player = "default", Quest = "SS_NOR_11"},
		},
		GotoState = self,
	};


----------------------------------------------------------
---- 05: Niethalf, god of the forging and the dwarves ----
----------------------------------------------------------

-- Anyulo quest: Wolfbane alkatresz - mother loadban itemkent!

	OnOneTimeEvent
	{
		EventName = "Niethalf_Wolfbane_active",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "IOS_SIDEQ_2"},		
		},
		Actions = 
		{
			ObjectLootItemMiscAdd	{Tag = "Adamantinum_carrier", DropChance = 100, ItemId = 636},			
		},
		GotoState = self,
	};






------------------------------------------------------
---- 06: Ereon, god of the knowledge ----
------------------------------------------------------

-- Lekezelve Hirin szigetenel!

-- Ha a Hirines tekercs megfelelo kezbe kerult:
-- MapFlagIsTrue	{Name = "mf_P702_HirinSQDone"},

-- Ha a Hirines tekercs rossz kezbe kerult:
-- MapFlagIsTrue	{Name = "mf_P702_HirinSQFailed"},


------------------------------------------------------
---- 07: Shanna, god of healing ----
------------------------------------------------------




------------------------------------------------------
---- 08: Kerona, goddess of the time ----
------------------------------------------------------	



------------------------------------------------------------------
---- 09: Zarach, god of creation, renewal, growth and conquer ----
------------------------------------------------------------------



------------------------------------------------------
---- 10: Tiara, god of the Sun ----
------------------------------------------------------




------------------------------------------------------
----  ----
------------------------------------------------------





}