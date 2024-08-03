-------------------------------------------------------------
--Constants
-------------------------------------------------------------

--Zerbo
vFVMeet = "mrk_or_17_2";	-- Fruitvendor event meeting point

--Elen
El =
{
	E10 =		{ ID = 316, L1 = 17, L2 = 17, L3 = 17, L4 = 15},
	E11 =		{ ID = 316, L1 = 7, L2 = 6, L3 = 6, L4 = 6},
	E12 =		{ ID = 316, L1 = 7, L2 = 6, L3 = 6, L4 = 6},
	E13 =		{ ID = 316, L1 = 7, L2 = 6, L3 = 5, L4 = 6},
	E14 =		{ ID = 316, L1 = 7, L2 = 6, L3 = 5, L4 = 6},
	E15 =		{ ID = 316, L1 = 7, L2 = 6, L3 = 5, L4 = 6},
	E20 =		{ ID = 409, L1 = 16, L2 = 17, L3 = 17, L4 = 15},
	E21 =		{ ID = 286, L1 = 8, L2 = 8, L3 = 8, L4 = 10},
	E22 =		{ ID = 286, L1 = 8, L2 = 9, L3 = 9, L4 = 9},
	E23 =		{ ID = 286, L1 = 8, L2 = 8, L3 = 8, L4 = 8},
	E24 =		{ ID = 286, L1 = 7, L2 = 7, L3 = 7, L4 = 7},
	E25 =		{ ID = 286, L1 = 6, L2 = 6, L3 = 6, L4 = 6},
	E30 =		{ ID = 76, 	L1 = 14, L2 = 15, L3 = 14, L4 = 14},
	E40 =		{ ID = 793, L1 = 14, L2 = 14, L3 = 14, L4 = 14},
	E50 =		{ ID = 698, L1 = 13, L2 = 15, L3 = 14, L4 = 14},
	E60 =		{ ID = 528, L1 = 12, L2 = 13, L3 = 13, L4 = 13},
}

--Nor
vVisualNorTimer = 720; -- How many seconds need survive in the island
vVNTimer2 = 360;	-- Extra seconds of survive on difficulty 4 (half of the basic time!)
--vVNTimer3 = 660;	-- Time for Colin

NorEnemy =
{
	E000 =	{ ID = 127, Lev = 2, T1 = 5, T2 = 5, T3 = 4, T4 = 4},
	E001 =	{ ID = 127, Lev = 2, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E002 =	{ ID = 127, Lev = 2, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E003 =	{ ID = 127, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E004 =	{ ID = 127, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E005 =	{ ID = 127, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E006 =	{ ID = 127, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E007 =	{ ID = 127, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E008 =	{ ID = 127, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	Egrv =	{ ID = 127, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E010 =	{ ID = 127, Lev = 4, T1 = 47, T2 = 46, T3 = 45, T4 = 44},
	E020 =	{ ID = 127, Lev = 4, T1 = 67, T2 = 65, T3 = 63, T4 = 61},
	E021 =	{ ID = 128, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E030 =	{ ID = 127, Lev = 4, T1 = 107, T2 = 103, T3 = 99, T4 = 95},
	E031 =	{ ID = 129, Lev = 5, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E040 =	{ ID = 127, Lev = 5, T1 = 137, T2 = 131, T3 = 125, T4 = 119},
	E041 =	{ ID = 127, Lev = 6, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E050 =	{ ID = 127, Lev = 6, T1 = 157, T2 = 149, T3 = 141, T4 = 133},
	E051 =	{ ID = 128, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E060 =	{ ID = 127, Lev = 6, T1 = 197, T2 = 190, T3 = 183, T4 = 176},
	E061 =	{ ID = 128, Lev = 5, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E062 =	{ ID = 130, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E070 =	{ ID = 127, Lev = 5, T1 = 119, T2 = 119, T3 = 119, T4 = 119},
	
	E660 =	{ ID = 127, Lev = 1, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E661 =	{ ID = 127, Lev = 2, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E662 =	{ ID = 127, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	
	E990 =	{ ID = 127, Lev = 7, T1 = 660, T2 = 660, T3 = 660, T4 = 660}, --Colin
	Boss1 =	{ ID = 131, Lev = 7, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	Boss2 =	{ ID = 131, Lev = 8, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	Boss3 =	{ ID = 131, Lev = 9, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	Boss4 =	{ ID = 1942, Lev = 13, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	
}

--Niethalf
Nh =
{
	E01 =		{ ID = 1969, L1 = 8, L2 = 9, L3 = 10, L4 = 11}, 		-- team 1
	E02 =		{ ID = 1035, L1 = 11, L2 = 12, L3 = 13, L4 = 14},		-- team 2
	E03 =		{ ID = 1969, L1 = 9, L2 = 10, L3 = 11, L4 = 12},		-- team 3
	E04 =		{ ID = 1969, L1 = 10, L2 = 11, L3 = 11, L4 = 11},		-- team 3
	E05 =		{ ID = 1035, L1 = 11, L2 = 12, L3 = 12, L4 = 13},		-- team 4
	E06 =		{ ID = 1035, L1 = 12, L2 = 12, L3 = 13, L4 = 13},		-- team 4
	E07 =		{ ID = 1035, L1 = 11, L2 = 11, L3 = 12, L4 = 14},		-- team 5
	E08 =		{ ID = 1035, L1 = 11, L2 = 12, L3 = 13, L4 = 15},		-- team 5
	E09 =		{ ID = 1969, L1 = 8, L2 = 8, L3 = 9, L4 = 10},			-- team 6
	E10 =		{ ID = 1969, L1 = 8, L2 = 9, L3 = 10, L4 = 11},			-- team 6
	E11 =		{ ID = 1035, L1 = 11, L2 = 12, L3 = 13, L4 = 13},		-- team 6
	E12 =		{ ID = 1035, L1 = 14, L2 = 14, L3 = 14, L4 = 14},		-- team 7
	E13 =		{ ID = 1035, L1 = 14, L2 = 14, L3 = 14, L4 = 14},		-- team 7
	E14 =		{ ID = 1035, L1 = 14, L2 = 14, L3 = 14, L4 = 14},		-- team 8
	E15 =		{ ID = 1035, L1 = 14, L2 = 14, L3 = 14, L4 = 14},		-- team 8
	E16 =		{ ID = 1035, L1 = 12, L2 = 12, L3 = 13, L4 = 13},		-- team 6
	Boss =	{ ID = 2108, L1 = 8, L2 = 9, L3 = 10, L4 = 11},			-- team 6
	
	A01 =		{ ID = 313, L1 = 11, L2 = 10, L3 = 9, L4 = 8},			-- al02-08
	A05 =		{ ID = 312, L1 = 13, L2 = 12, L3 = 11, L4 = 10},		-- al01
}


--Shanna
vShanna_time = 600; --How many seconds needs for the tree to survive on the island.
vShanna_time2 = 300; --Stronger enemy phase start timer


SDT =
{
	D1 =		{ Le = 450, Si = 450, St = 450, Time = 120},
	D2 =		{ Le = 300, Si = 300, St = 300, Time = 100},
	D3 =		{ Le = 250, Si = 250, St = 250, Time = 80},
	D4 =		{ Le = 200, Si = 200, St = 200, Time = 60},
}

Sh =
{
	E00 =		{ ID = 189, Lev = 3, T1 = 5, T2 = 0, T3 = 0, T4 = 0},
	E10 =		{ ID = 189, Lev = 5, T1 = 40, T2 = 38, T3 = 36, T4 = 34}, 		--30
	E20 =		{ ID = 189, Lev = 5, T1 = 53, T2 = 48, T3 = 43, T4 = 40},			--43
	E30 =		{ ID = 189, Lev = 4, T1 = 76, T2 = 73, T3 = 71, T4 = 68},			--71
	E31 =		{ ID = 191, Lev = 2, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E40 =		{ ID = 189, Lev = 5, T1 = 100, T2 = 98, T3 = 94, T4 = 90},		--94
	E41 =		{ ID = 192, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E50 =		{ ID = 189, Lev = 5, T1 = 120, T2 = 115, T3 = 111, T4 = 106},	--111
	E51 =		{ ID = 191, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E60 =		{ ID = 189, Lev = 6, T1 = 140, T2 = 135, T3 = 130, T4 = 125},	--130
	E61 =		{ ID = 190, Lev = 4, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E70 =		{ ID = 189, Lev = 5, T1 = 161, T2 = 158, T3 = 153, T4 = 145},	--153
	E71 =		{ ID = 195, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E80 =		{ ID = 189, Lev = 5, T1 = 185, T2 = 181, T3 = 178, T4 = 173},	--178
	E81 =		{ ID = 190, Lev = 3, T1 = 0, T2 = 0, T3 = 0, T4 = 0},
	E90 =		{ ID = 189, Lev = 5, T1 = 270, T2 = 231, T3 = 190, T4 = 83},	--81 - original: only d4
	Eli =		{ ID = 189, Lev = 6, T1 = 47, T2 = 51, T3 = 73, T4 = 91},			--47 (d123), 92 (d4)
	Ebt =		{ ID = 194, Lev = 5, T1 = 0, T2 = 0, T3 = 0, T4 = 0},					--brutal, no timers
}

--Kerona
DetectRange = 4; -- the range the In points must be approached to be teleported



--Zarach
ZDT =
{
	D1 =		{ Le = 450, Si = 450, St = 450, Time = 120},	--400, 120
	D2 =		{ Le = 350, Si = 350, St = 350, Time = 100},	--300, 100
	D3 =		{ Le = 250, Si = 250, St = 250, Time = 80},		--200, 80
	D4 =		{ Le = 150, Si = 150, St = 150, Time = 60},		--150, 60
}
--Starting Resources + Delay

ZZi =
{
	L1 =		{ Le = 2000, Si = 2000, St = 2000, O1= 500, O2= 1000, O3= 1500},
	L2 =		{ Le = 1800, Si = 1800, St = 1800, O1= 450, O2= 900, O3= 1350},
	L3 =		{ Le = 1600, Si = 1600, St = 1600, O1= 400, O2= 800, O3= 1200},
	L4 =		{ Le = 1400, Si = 1400, St = 1400, O1= 350, O2= 700, O3= 1050},
}
-- Resource + Outcry

ZEn =
{
	E11 =		{ ID = 188, Lev = 7, T1 = 50, T2 = 46, T3 = 43, T4 = 40}, --40, 70, 100
	E12 =		{ ID = 151, Lev = 7, T1 = 85, T2 = 80, T3 = 75, T4 = 70},
	E13 =		{ ID = 132, Lev = 7, T1 = 109, T2 = 106, T3 = 103, T4 = 100},
	E14 =		{ ID = 188, Lev = 7, T1 = 55, T2 = 51, T3 = 48, T4 = 45},
	E15 =		{ ID = 151, Lev = 7, T1 = 90, T2 = 85, T3 = 80, T4 = 75},
	E16 =		{ ID = 132, Lev = 7, T1 = 113, T2 = 110, T3 = 107, T4 = 105},
	E21 =		{ ID = 490, Lev = 8, T1 = 59, T2 = 56, T3 = 53, T4 = 50}, --50, 80, 115
	E22 =		{ ID = 491, Lev = 8, T1 = 95, T2 = 90, T3 = 85, T4 = 80},
	E23 =		{ ID = 194, Lev = 8, T1 = 134, T2 = 127, T3 = 121, T4 = 115},
	E31 =		{ ID = 671, Lev = 10, T1 = 140, T2 = 135, T3 = 130, T4 = 125}, --125, 135, 150
	E32 =		{ ID = 672, Lev = 10, T1 = 153, T2 = 147, T3 = 141, T4 = 135},
	E33 =		{ ID = 151, Lev = 10, T1 = 160, T2 = 156, T3 = 153, T4 = 150},
}

--[[
vTimerP11 = 40;  -- Elemenal P11 spawn timer (All phase: 0-3)
vTimerP12 = 70;  -- Elemenal P12 spawn timer (All phase: 0-3)
vTimerP13 = 100; -- Elemenal P13 spawn timer (All phase: 0-3)

vTimerP21 = 50;  -- Elemenal P21 spawn timer (Phase 2-3)
vTimerP22 = 80;  -- Elemenal P22 spawn timer (Phase 2-3)
vTimerP23 = 115; -- Elemenal P23 spawn timer (Phase 2-3)

vTimerP31 = 125; -- Elemenal P31 spawn timer (Phase 3)
vTimerP32 = 135; -- Elemenal P32 spawn timer (Phase 3)
vTimerP33 = 150; -- Elemenal P33 spawn timer (Phase 3)

vElemLevel1 = 7; -- Elemenal P1 level set
vElemLevel2 = 8; -- Elemenal P2 level set
vElemLevel3 = 10; -- Elemenal P3 level set
]]

-- (75/9/9+73/7/7;6/6/6;7/7/7)

------------------------------------------------------
---- 00: Initialize the map ----
------------------------------------------------------



State
{
	StateName = "INIT",
	
	
	-- Todo list: 
		-- Hosok teleportalasa player melle (Caine megvan, +2 kell meg
		-- szigetek dialogjai - GuardianStones
		-- cutscene-elkeszitese
		-- balanszirozas
		-- outcry-ok beillesztese
		-- meg ami meg eszembe jut :P
		--
		--
		--
	
	------------------------------------------------------
	---- Game over when every adventurer died ----
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "GameOver - everybody died",
		Conditions = 
		{
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
			FigureIsDead	{Tag = "pl_HumanHeroFirst"},
			FigureIsDead	{Tag = "pl_HumanHeroSecond"},
			FigureIsDead	{Tag = "pl_HumanHeroThird"},
			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "GameOverHappened",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_PlayerGameOver"},
			SetUpdateInterval	{Steps = 13},
		},
		Actions =
		{
			--MapFlagSetTrue	{Name = "mf_P702_PlayerGameOver"},
			PlayerGameOver	{Player = "default", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title" },
		},
	},
	
	
	------------------------------------------------------
	---- Map start: cutscene events start ----
	------------------------------------------------------

	

	
	OnOneTimeEvent
	{
		Conditions = 
		{
				
				FigureIsInRangeToEntity	{Tag = "npc_Dragon", TargetTag = "mrk_DragonLeave", Range = 5},
				--MapFlagIsTrue {Name = "mf_P702_CS00_MapStart_End"},
		},
		
		Actions =
		{	
			FigureVanish	{Tag = "npc_Dragon"},
		},
	};
	
	------------------------------------------------------
	---- Map start: cutscene events end ----
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_Start"},
		},
		
		Actions =
		{
			
			-- Start cutscene	
			-- MapFlagSetTrue {Name = "mf_P702_CS01_Start"},
			-- DebugMessage	{Caption = "Cutscene Flag set", Message = "Cutscene Flag set"},

				
			MapFlagSetTrue {Name = "mf_P702_MainQuestStart"},
			QuestSetActive	{Player = "default", Quest = "SS_MAIN"},
			
			DialogSetDisabled	{Tag = "qg_GuardianStone02"},
			DialogSetDisabled	{Tag = "qg_GuardianStone03"},
			DialogSetDisabled	{Tag = "qg_GuardianStone04"},
			DialogSetDisabled	{Tag = "qg_GuardianStone05"},
			DialogSetDisabled	{Tag = "qg_GuardianStone06"},
			DialogSetDisabled	{Tag = "qg_GuardianStone07"},
			DialogSetDisabled	{Tag = "qg_GuardianStone08"},
			DialogSetDisabled	{Tag = "qg_GuardianStone09"},
			DialogSetDisabled	{Tag = "qg_GuardianStone10"},
			

 			-- Hirin initialization
 			
			FigureVanish	{Tag = "npc_Hirin01"},
			FigureVanish	{Tag = "npc_Hirin02"},
			FigureVanish	{Tag = "npc_Hirin03"},
			DialogSetEnabled	{Tag = "qg_GuardianStone01"},
			--MapTimerStart	{Name = "HirinEntrance"},
			--MapTimerStop	{Name = "HirinEntrance"},
			
			-- Elen initialization
			
			FigureVanish	{Tag = "npc_WolfSpirit"},
			
			-- Zerbo initialization
			
			FigureVanish	{Tag = "npc_MarriedMan"},
			FigureVanish	{Tag = "npc_FruitVendor"},
			FigureVanish	{Tag = "npc_BarrelBlower"},
			FigureVanish	{Tag = "npc_FlickedBoss"},
			
			-- Nor  initialization
			
			FigureVanish	{Tag = "npc_TravelerGhost"},
			
			-- Niethalf initialization
			
			-- Ereon initialization
			
			DialogSetDisabled	{Tag = "npc_Agathos"},
			DialogSetDisabled	{Tag = "npc_Dr_Mauser"},
			DialogSetDisabled	{Tag = "npc_Einar"},
			DialogSetDisabled	{Tag = "npc_Falkmar"},
			DialogSetDisabled	{Tag = "npc_Urgi"},

			-- Shanna initialization
			
			--FigureVanish	{Tag = "rts_elixirhordozo"},
			DialogSetDisabled	{Tag = "npc_ElvenTree"},

			-- Kerona initialization
			
			-- Zarach/Ulme initialization
			
			-- Tiara initialization
			
			-- Cutscene start
				MapFlagSetTrue {Name = "mf_P702_CS00_MapStart_Start"},
		},
	};		
			
	OnOneTimeRepeatEvent
	{
		EventName = "Map Travel",
		Name = "Map_Travel",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "MapTravelTimer", Seconds = 2},
		},
		Actions = 
		{
			MapTimerStop	{Name = "MapTravelTimer"},
			AvatarFlagSetTrue {Player = "pl_Human", Name = "af_Achievement_P702_Completed"},
			AvatarFlagSetTrue	{Player = "default", Name = "af_ArrivedFromPreviousMap"},
			PlayerMapTravelAddon3  {Map = "Campaign/P703_Realm_of_the_Gods", TargetTag = "Map_Start_Point"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Autosave",
		Name = "Autosave",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "AutosaveTimer", Seconds = 9},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "AutosaveTimer"},
			DoAutoSave{},
			EventReEnable	{Name = "Autosave"},
		},
		GotoState = self,
	};
		
		
	OnOneTimeRepeatEvent
	{
		EventName = "QuestTimer1",
		Name = "QT1",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_QuestTimer1"},
			MapTimerIsElapsed	{Name = "QuestTimer1", Seconds = 5},
		},
		Actions = 
		{
			MapTimerStop	{Name = "QuestTimer1"},
			MapFlagSetFalse	{Name = "mf_QuestTimer1"},
			MapFlagSetTrue	{Name = "mf_QuestTimer1-end"},
			EventReEnable	{Name = "QT1"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "QuestTimer2",
		Name = "QT2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_QuestTimer2"},
			MapTimerIsElapsed	{Name = "QuestTimer1", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop	{Name = "QuestTimer2"},
			MapFlagSetFalse	{Name = "mf_QuestTimer2"},
			MapFlagSetTrue	{Name = "mf_QuestTimer2-end"},
			EventReEnable	{Name = "QT2"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "QuestTimer3",
		Name = "QT3",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_QuestTimer3"},
			MapTimerIsElapsed	{Name = "QuestTimer1", Seconds = 15},
		},
		Actions = 
		{
			MapTimerStop	{Name = "QuestTimer3"},
			MapFlagSetFalse	{Name = "mf_QuestTimer3"},
			MapFlagSetTrue	{Name = "mf_QuestTimer3-end"},
			EventReEnable	{Name = "QT3"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "QuestTimer4",
		Name = "QT4",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_QuestTimer4"},
			MapTimerIsElapsed	{Name = "QuestTimer1", Seconds = 20},
		},
		Actions = 
		{
			MapTimerStop	{Name = "QuestTimer4"},
			MapFlagSetFalse	{Name = "mf_QuestTimer4"},
			MapFlagSetTrue	{Name = "mf_QuestTimer4-end"},
			EventReEnable	{Name = "QT4"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Hirin",
		Name = "Weather_Hirin",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_01_in", Range = 25},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_1.xml", FadeDuration = 3},
			--EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Elen1",
		Name = "Weather_Elen1",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we1", Range = 40},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_2_Sivatag.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			--EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Elen2",
		Name = "Weather_Elen2",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we2", Range = 20},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_2_Buza.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			--EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Elen3",
		Name = "Weather_Elen3",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we31", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we32", Range = 15},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_2_Erdo.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			--EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Elen4",
		Name = "Weather_Elen4",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we4", Range = 32},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_2_Koves.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			--EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Elen5",
		Name = "Weather_Elen5",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we51", Range = 17},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we52", Range = 5},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_2_Havas.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			--EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Elen6",
		Name = "Weather_Elen6",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "we6", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_02_out", Range = 7},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_2_Crystal.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			--EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Zerbo",
		Name = "Weather_Zerbo",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 10},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_4.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			--EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Nor",
		Name = "Weather_Nor",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_04_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_04_out", Range = 10},
			},
		},
		Actions = 
		{
			DaytimeChange {Minutes = 1080},
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_4.xml", FadeDuration = 0},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			--EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Niethalf",
		Name = "Weather_Niethalf",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_05_out", Range = 10},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_4.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			--EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Ereon",
		Name = "Weather_Ereon",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_06_out", Range = 10},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_6.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			--EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Shanna",
		Name = "Weather_Shanna",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_07_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_07_out", Range = 10},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_7.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			--EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Kerona",
		Name = "Weather_Kerona",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_08_out", Range = 10},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_8.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			--EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Zarach",
		Name = "Weather_Zarach",
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_09_in", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_09_out", Range = 10},
			},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_9.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			--EventReEnable	{Name = "Weather_Zarach"},
			EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Weather set - Tiara",
		Name = "Weather_Tiara",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_10_in", Range = 10},
		},
		Actions = 
		{
			WeatherChange	{File = "addon3/map/Campaign/P702_Stepping_Stones/Weather/Island_10.xml", FadeDuration = 3},
			EventReEnable	{Name = "Weather_Hirin"},
			EventReEnable	{Name = "Weather_Elen1"},
			EventReEnable	{Name = "Weather_Elen2"},
			EventReEnable	{Name = "Weather_Elen3"},
			EventReEnable	{Name = "Weather_Elen4"},
			EventReEnable	{Name = "Weather_Elen5"},
			EventReEnable	{Name = "Weather_Elen6"},
			EventReEnable	{Name = "Weather_Zerbo"},
			EventReEnable	{Name = "Weather_Nor"},
			EventReEnable	{Name = "Weather_Niethalf"},
			EventReEnable	{Name = "Weather_Ereon"},
			EventReEnable	{Name = "Weather_Shanna"},
			EventReEnable	{Name = "Weather_Kerona"},
			EventReEnable	{Name = "Weather_Zarach"},
			--EventReEnable	{Name = "Weather_Tiara"},
		},
		GotoState = self,
	};
	
	
};







