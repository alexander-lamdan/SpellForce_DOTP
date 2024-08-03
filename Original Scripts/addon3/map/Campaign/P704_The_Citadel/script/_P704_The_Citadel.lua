dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

-----------------------------
-- TODO:
-- teszt ertekek visszaallitasa: iBonesDropChance, iBonesToCollect

-- OK -- uj utvonalak pontositasa, jarhatatlan reszek

-- OK -- map valtoztatasok veglegesitese (uj utak, uj falak)

-- OK -- megoldatlan subquestek tunjenek el a listabol main quest solve-nal
-- OK -- open gates szovegek csereje ("open western gate")

-- nal drommar: vegleges NPC unitot a helyere (ha van masik, ami szoba johet)

-- regi leverek leszedese (vagy csak kikapcs?)

-- lever-ek vegso elhelyezese (jobb helyekre)
-- merchant vegso elhelyezese

-- OK -- merchant-ot betenni
-- loot, xp veglegesites
-- demon es pact clan unit balance
-- kapunyitos subquest csere 1-1 helyen (ha lesz ido)

-- FINAL TODO-k majd:
-- OK -- cheatek kiszedese: bonesdropchance, elejen avatarxp es avatarequipment, nyitott kapuk cheat, CS-ek bekotese, semleges enemyk

-- nagyjabol OK -- pact klanoknak:
-- minden HQ-nak egy allando vedelem (3-4 unit, idonkent respawn)
-- Dracon Surtalin, leader 1 - Shadowblade and Deathknight: 96, 98; 103
-- headquartes, black fortress, tower of faces (gar)
-- Archon Liriel, leader 2 - Deathknight and Sorceress: 98, 97; 102
-- headquartes, training grounds, bloodfire (gar)
-- Sinistra Lashut, leader 3 -  Necromancers and Arachnis: 99, 100; 102
-- headquartes, onyx temple, bloodfire (gar)
-- Archon Dormat, leader 4 - Deathknight and Necromancers: (98), 99; 103 -> deathknight 98 helyett shadowblade 96
-- headquartes, black fortress, tower of faces (gar)

-- level 2: gargoyle-ok 101*, 102, 103
-- level 2: shadow-k 104*, 105*, 106*
-- * nem igazan jok
-- level 3: titan 107
-----------------------------


--local MinimapMarker = 1
local buttonsize = 43


State
{
	StateName = "INIT",
	
-- ha a palya betoltott es elindult akkor
-- az avatar melle teleportaljuk a herot és odaadjuk a playernek
-- a beallitjuk a cutscene indito flaget (indul is a cutscene emiatt)
-- cheat modeban ha kiveszitek a commenteket a 3 sor elol akkor cheates itemeket ad a playernek (fel kell oltozni manualisan gameben)

OnOneTimeEvent
	{
	EventName = ">>> Game is unblocked <<<",
	Conditions = 
		{
				GameIsUnBlocked{},
		},
		Actions =
		{

-- TIMERS
-- general used timer
			MapTimerStart	{Name = "mt_P704_General_Timer"},
-- demon route update timers
			MapTimerStart	{Name = "mt_P704_Demons_Update"},


-- Start cutscene	
			MapFlagSetTrue {Name = "mf_P704_CS01_Intro_Start"},
--			MapFlagSetTrue {Name = "mf_P704_CS01_Intro_End"},	-- CS kikapcsolva, helyette vege flag, FOR TEST ONLY

--			MapTimerStart {Name = "mt_P704_CS02_Mainquest_Start"},	-- for test!
--			MapTimerStart {Name = "mt_P704_CS03_Outro_Start"},		-- for test!

-- respawn timers
			MapTimerStart	{Name = "mt_P704_P1_Respawn"},
			MapTimerStart	{Name = "mt_P704_P2_Respawn"},
			MapTimerStart	{Name = "mt_P704_P3_Respawn"},
			MapTimerStart	{Name = "mt_P704_P4_Respawn"},

			MapTimerStart	{Name = "mt_P704_P1_Respawn_Defend"},
			MapTimerStart	{Name = "mt_P704_P2_Respawn_Defend"},
			MapTimerStart	{Name = "mt_P704_P3_Respawn_Defend"},
			MapTimerStart	{Name = "mt_P704_P4_Respawn_Defend"},

-- creep no central AI
			AIPlayerDeactivate	{Player = "pl_Creep"},

-- pact leader levels
--			FigureLevelSet	{Tag = "Pact_1_Leader", Level = 8 },
--			FigureLevelSet	{Tag = "Pact_2_Leader", Level = 8 },
--			FigureLevelSet	{Tag = "Pact_3_Leader", Level = 8 },
--			FigureLevelSet	{Tag = "Pact_4_Leader", Level = 8 },

-- klanok tamadasahoz valtozo nevek definialasa a konnyebb olvashatosagert (value format: attackerclan-attackedclan-way, way: 1 nameless, 2 gates)
			MapValueSet	{Name = "mv_704_P1_Defend", Value = 100 },
			MapValueSet	{Name = "mv_704_P1_Attack_P2_Through_Nameless", Value = 121 },
			MapValueSet	{Name = "mv_704_P1_Attack_P2_Through_Gates", Value = 122 },
			MapValueSet	{Name = "mv_704_P1_Attack_P3_Through_Nameless", Value = 131 },
			MapValueSet	{Name = "mv_704_P1_Attack_P3_Through_Gates", Value = 132 },
			MapValueSet	{Name = "mv_704_P1_Attack_P4_Through_Nameless", Value = 141 },
			MapValueSet	{Name = "mv_704_P1_Attack_P4_Through_Gates", Value = 142 },

			MapValueSet	{Name = "mv_704_P2_Defend", Value = 200 },
			MapValueSet	{Name = "mv_704_P2_Attack_P1_Through_Nameless", Value = 211 },
			MapValueSet	{Name = "mv_704_P2_Attack_P1_Through_Gates", Value = 212 },
			MapValueSet	{Name = "mv_704_P2_Attack_P3_Through_Nameless", Value = 231 },
			MapValueSet	{Name = "mv_704_P2_Attack_P3_Through_Gates", Value = 232 },
			MapValueSet	{Name = "mv_704_P2_Attack_P4_Through_Nameless", Value = 241 },
			MapValueSet	{Name = "mv_704_P2_Attack_P4_Through_Gates", Value = 242 },

			MapValueSet	{Name = "mv_704_P3_Defend", Value = 300 },
			MapValueSet	{Name = "mv_704_P3_Attack_P2_Through_Nameless", Value = 321 },
			MapValueSet	{Name = "mv_704_P3_Attack_P2_Through_Gates", Value = 322 },
			MapValueSet	{Name = "mv_704_P3_Attack_P1_Through_Nameless", Value = 311 },
			MapValueSet	{Name = "mv_704_P3_Attack_P1_Through_Gates", Value = 312 },
			MapValueSet	{Name = "mv_704_P3_Attack_P4_Through_Nameless", Value = 341 },
			MapValueSet	{Name = "mv_704_P3_Attack_P4_Through_Gates", Value = 342 },

			MapValueSet	{Name = "mv_704_P4_Defend", Value = 400 },
			MapValueSet	{Name = "mv_704_P4_Attack_P2_Through_Nameless", Value = 421 },
			MapValueSet	{Name = "mv_704_P4_Attack_P2_Through_Gates", Value = 422 },
			MapValueSet	{Name = "mv_704_P4_Attack_P3_Through_Nameless", Value = 431 },
			MapValueSet	{Name = "mv_704_P4_Attack_P3_Through_Gates", Value = 432 },
			MapValueSet	{Name = "mv_704_P4_Attack_P1_Through_Nameless", Value = 411 },
			MapValueSet	{Name = "mv_704_P4_Attack_P1_Through_Gates", Value = 412 },

-- clan unit upgrade levels
			MapValueSet	{Name = "mv_704_P1_Unit_Upgrade_Level", Value = 1 },
			MapValueSet	{Name = "mv_704_P2_Unit_Upgrade_Level", Value = 1 },
			MapValueSet	{Name = "mv_704_P3_Unit_Upgrade_Level", Value = 1 },
			MapValueSet	{Name = "mv_704_P4_Unit_Upgrade_Level", Value = 1 },

-- living clans counter
			MapValueSet	{Name = "mv_P704_Num_Living_Clans", Value = 4 },

-- demons init settings
			FigureLevelSet	{Tag = "Nameless_creep_1a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1c", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_1f", Level = Value_Demon_UnitLevel },

			FigureLevelSet	{Tag = "Nameless_creep_2a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2c", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_2f", Level = Value_Demon_UnitLevel },

			FigureLevelSet	{Tag = "Nameless_creep_3a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3c", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_3f", Level = Value_Demon_UnitLevel },

			FigureLevelSet	{Tag = "Nameless_creep_4a", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4b", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4c", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4d", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4e", Level = Value_Demon_UnitLevel },
			FigureLevelSet	{Tag = "Nameless_creep_4f", Level = Value_Demon_UnitLevel },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1a", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1b", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1c", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1d", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1e", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_1f", TargetTag = "Point_Nameless_1"}, Tags = aPath_Demon_Central_1 },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2a", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2b", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2c", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2d", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2e", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_2f", TargetTag = "Point_Nameless_2"}, Tags = aPath_Demon_Central_2 },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3a", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3b", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3c", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3d", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3e", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_3f", TargetTag = "Point_Nameless_3"}, Tags = aPath_Demon_Central_3 },

			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4a", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4b", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4c", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4d", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4e", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },
			FigurePathGoto	{ Goto = FigureRunToEntity {Tag = "Nameless_creep_4f", TargetTag = "Point_Nameless_4"}, Tags = aPath_Demon_Central_4 },

			FigureLevelSet	{Tag = "Nameless_creep_gate2_01", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate2_02", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate4_01", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate4_02", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate5_01", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate5_02", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate6_01", Level = Value_Demon_UnitLevel + 3},
			FigureLevelSet	{Tag = "Nameless_creep_gate6_02", Level = Value_Demon_UnitLevel + 3},

			FigureRunToEntity	{Tag = "Nameless_creep_gate2_01", TargetTag = "Gate_2_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate2_02", TargetTag = "Gate_2_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate4_01", TargetTag = "Gate_4_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate4_02", TargetTag = "Gate_4_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate5_01", TargetTag = "Gate_5_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate5_02", TargetTag = "Gate_5_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate6_01", TargetTag = "Gate_6_Lever"},
			FigureRunToEntity	{Tag = "Nameless_creep_gate6_02", TargetTag = "Gate_6_Lever"},

-- first encounter demons
			FigureLevelSet	{Tag = "Nameless_creep_start_01", Level = Value_Demon_UnitLevel - 2},
			FigureLevelSet	{Tag = "Nameless_creep_start_02", Level = Value_Demon_UnitLevel - 2},
			FigureLevelSet	{Tag = "Nameless_creep_start_03", Level = Value_Demon_UnitLevel - 2},
		},
	},	

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

--------------------
-- QUEST RELATED ETC
--------------------

--
-- enable library portal
--

	OnOneTimeEvent
	{
		EventName = "enable library portal",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P704_LibraryPortal_Enabled"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "TC_ACT1"},
			DialogSetEnabled	{Tag = "LibraryPortal1"},
			MinimapAlertSetToEntity	{Tag = "LibraryPortal1", Type = 5},
			FogOfWarRevealAtEntity	{FogOfWarId = 5, Tag = "LibraryPortal1", Range = 50, Height = 5},
		},
	},

--
-- elo klanok szamanak figyelese
--

	OnOneTimeEvent
	{
		EventName = "pact 1 clan dead",
		Conditions = 
		{
			FigureIsDead	{Tag = "Pact_1_Leader"},
		},
		Actions = 
		{
			MapValueDecrease	{Name = "mv_P704_Num_Living_Clans"},
			MapTimerStart	{Name = "mt_P704_General_Timer"},	-- kesleltetett grave miatt
		},
	},

	OnOneTimeEvent
	{
		EventName = "pact 2 clan dead",
		Conditions = 
		{
			FigureIsDead	{Tag = "Pact_2_Leader"},
		},
		Actions = 
		{
			MapValueDecrease	{Name = "mv_P704_Num_Living_Clans"},
			MapTimerStart	{Name = "mt_P704_General_Timer"},	-- kesleltetett grave miatt
		},
	},

	OnOneTimeEvent
	{
		EventName = "pact 3 clan dead",
		Conditions = 
		{
			FigureIsDead	{Tag = "Pact_3_Leader"},
		},
		Actions = 
		{
			MapValueDecrease	{Name = "mv_P704_Num_Living_Clans"},
			MapTimerStart	{Name = "mt_P704_General_Timer"},	-- kesleltetett grave miatt
		},
	},

	OnOneTimeEvent
	{
		EventName = "pact 4 clan dead",
		Conditions = 
		{
			FigureIsDead	{Tag = "Pact_4_Leader"},
		},
		Actions = 
		{
			MapValueDecrease	{Name = "mv_P704_Num_Living_Clans"},
			MapTimerStart	{Name = "mt_P704_General_Timer"},	-- kesleltetett grave miatt
		},
	},

--
-- bones (loot) adasa vagy elvetele a demon unitoknak/tol
--

	OnToggleEvent
	{
		EventName = "bones given/taken to demons",
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_P704_Bones_For_Nameless"},
		},
		OnActions = 
		{
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1c", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_1f", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2c", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_2f", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3c", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_3f", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4a", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4b", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4c", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4d", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4e", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_4f", DropChance = iBonesDropChance, ItemId = 675},

			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate2_01", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate2_02", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate4_01", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate4_02", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate5_01", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate5_02", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate6_01", DropChance = iBonesDropChance, ItemId = 675},
			FigureLootItemMiscAdd {Tag = "Nameless_creep_gate6_02", DropChance = iBonesDropChance, ItemId = 675},
		},
		OffConditions = 
		{
			MapFlagIsFalse{Name = "mf_P704_Bones_For_Nameless"},
		},
		OffActions = 
		{
			FigureLootItemMiscRemove {Tag = "Nameless_creep_1a", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_1b", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_1c", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_1d", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_1e", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_1f", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_2a", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_2b", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_2c", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_2d", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_2e", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_2f", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_3a", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_3b", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_3c", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_3d", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_3e", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_3f", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_4a", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_4b", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_4c", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_4d", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_4e", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_4f", ItemId = 675},

			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate2_01", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate2_02", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate4_01", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate4_02", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate5_01", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate5_02", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate6_01", ItemId = 675},
			FigureLootItemMiscRemove {Tag = "Nameless_creep_gate6_02", ItemId = 675},
		},
	};

--
-- gold for demons
--

	OnOneTimeRepeatEvent
	{
		Name = "goldfound_gate2_demons",
		EventName = "gold found: gate 2 demons",
		Conditions = 
		{
			FigureIsDead	{Tag = "Nameless_creep_gate2_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate2_02"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.GateDemons.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.GateDemons.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.GateDemons.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.GateDemons.Gold},
		},
	},

	OnOneTimeRepeatEvent
	{
		Name = "goldfound_gate4_demons",
		EventName = "gold found: gate 4 demons",
		Conditions = 
		{
			FigureIsDead	{Tag = "Nameless_creep_gate4_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate4_02"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.GateDemons.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.GateDemons.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.GateDemons.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.GateDemons.Gold},
		},
	},

	OnOneTimeRepeatEvent
	{
		Name = "goldfound_gate5_demons",
		EventName = "gold found: gate 5 demons",
		Conditions = 
		{
			FigureIsDead	{Tag = "Nameless_creep_gate5_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate5_02"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.GateDemons.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.GateDemons.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.GateDemons.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.GateDemons.Gold},
		},
	},

	OnOneTimeRepeatEvent
	{
		Name = "goldfound_gate6_demons",
		EventName = "gold found: gate 6 demons",
		Conditions = 
		{
			FigureIsDead	{Tag = "Nameless_creep_gate6_01"},
			FigureIsDead	{Tag = "Nameless_creep_gate6_02"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = GoldOutcry[Reward.GateDemons.Gold], Tag = noFigure},
			AvatarGoldGive	{Player = "default", Amount = Reward.GateDemons.Gold },
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = Reward.GateDemons.Gold},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = Reward.GateDemons.Gold},
		},
	},

--
-- elso talalkozasnal belso kapuk nyitasa es elso tamadasok inditasa
--

	OnOneTimeEvent
	{
		EventName = "first meeting, open main gates",
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_P704_Pact1LeaderKnown"},
		},
		Actions =
		{
			-- bejaratok kinyitasa
			GateSetOpen	{Tag = "Gate_Main1"},
			GateSetOpen	{Tag = "Gate_Main2"},

			LeverSetOff	{Tag = "Gate_3_Lever"},

			MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Attack_P3_Through_Nameless"},
			MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Attack_P1_Through_Nameless"},
			MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Attack_P4_Through_Nameless"},
			MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Attack_P2_Through_Nameless"},
		},
	};

--
-- CS02 auto start
--

	OnOneTimeEvent
	{
		EventName = "CS02 auto start",
		Conditions =
		{
--			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_1_Leader", Range = 20 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate1", Range = 5 },
			GateIsOpen	{Tag = "Gate1"},
		},
		Actions =
		{
-- 			TESZT ALATT CS02 KIKAPCSOLVA
--			MapTimerStart	{Name = "mt_P704_CS02_Mainquest_End"},

--			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_1_Leader"},

			-- alabbi ket sort visszatenni (final), ha ki vannak kommentezve
			MapTimerStart	{Name = "mt_P704_CS02_Mainquest_Start"},
			DialogSetDisabled	{Tag = "Pact_1_Leader"},
		},
	};

--
-- CS02 back to dialog
--

	OnOneTimeEvent
	{
		EventName = "CS02 return to dialog",
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P704_CS02_Mainquest_End", Seconds = 4 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_1_Leader", Range = 10 },
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P704_CS02_Mainquest_End"},
			AvatarSpellGive {Player = "pl_Human", Spell = 482},
			FigureOutcry {TextTag = "crySpell2", Tag = "noFigure"},
--			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Pact_1_Leader"},
			DialogSetEnabled	{Tag = "Pact_1_Leader"},
			DialogBegin	{Player = "default", Tag = "Pact_1_Leader"},
		},
	};

--
-- Timed save
--

	OnEvent
	{
		EventName = "timed saving",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P704_Saving", Seconds = 3 },
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P704_Saving"},
			DoAutoSave(),
		},
	},

--
-- Level completed
--
		
	OnOneTimeEvent
	{
		EventName = "Level completed!",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P704_CS03_Outro_End"},
		},
		Actions = 
		{
			AvatarFlagSetTrue {Name = "af_P704_MapCompleted"},	-- special case: map3 and map5 is the same, this is to help to determine if map 4 is completed
			AvatarFlagSetTrue	{Name = "af_ArrivedFromPreviousMap"},
			PlayerMapTravelAddon3	{Map = "Campaign/P703_Realm_of_the_Gods", TargetTag = "Map_Start_Point"},
		},
	};

--
-- Level failed
--

	OnOneTimeEvent
	{
		EventName = ">>> every adventurer died <<<",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P704_CS01_Intro_End"},
			FigureIsDead {Tag = "pl_HumanAvatar"},
			FigureIsDead {Tag = "pl_HumanHeroCaine"},
			FigureIsDead {Tag = "pl_HumanHeroFirst"},
			FigureIsDead {Tag = "pl_HumanHeroSecond"},
			FigureIsDead {Tag = "pl_HumanCompanionCraigHuman"},
		},
		Actions = 
		{
			PlayerGameOver	{Player = "default", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title"},
		},
	};

------------
-- P1 clan becomes player enemy
------------

	OnOneTimeEvent
	{
	EventName = ">>> p1 is public enemy <<<",
	Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ2A_P3LeaderTalked"},
					MapFlagIsTrue {Name = "mf_P704_MQ2A_P4LeaderTalked"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ2A_P3LeaderTalked"},
					FigureIsDead	{Tag = "Pact_4_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ2A_P4LeaderTalked"},
					FigureIsDead	{Tag = "Pact_3_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					FigureIsDead	{Tag = "Pact_3_Leader"},
					FigureIsDead	{Tag = "Pact_4_Leader"},
					MapFlagIsTrue{Name = "mf_P704_MQ2A_Accepted"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 2 },
				},
				MapFlagIsTrue {Name = "mf_P704_MQ3B_P2LeaderTalked"},
				MapFlagIsTrue {Name = "mf_P704_MQ4B_P3LeaderTalked"},
			},
		},
	Actions =
		{
			-- p1 ellenseges lesz playerrel
			PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P1"},
			DialogSetDisabled	{Tag = "Pact_1_Leader"},
			FigureTeamTransfer	{Tag = "Pact_1_Leader", Team = "tm_Team1"},
			MapValueSetVariable	{Name = "mv_P704_P1_Attack", Variable = "mv_704_P1_Defend"},
			FigureRunToEntity	{Tag = "Pact_1_Level_1_Unit_1", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_1_Unit_2", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_1_Unit_3", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_2_Unit_1", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_2_Unit_2", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_2_Unit_3", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_3_Unit_1", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_3_Unit_2", TargetTag = "Pact_1_Leader"},
			FigureRunToEntity	{Tag = "Pact_1_Level_3_Unit_3", TargetTag = "Pact_1_Leader"},
		},
	},	

------------
-- P2 clan becomes player enemy
------------

	OnOneTimeEvent
	{
	EventName = ">>> p2 is public enemy <<<",
	Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ4A_P1LeaderTalked"},
					MapFlagIsTrue {Name = "mf_P704_MQ4A_P3LeaderTalked"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ4A_P1LeaderTalked"},
					FigureIsDead	{Tag = "Pact_3_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ4A_P3LeaderTalked"},
					FigureIsDead	{Tag = "Pact_1_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					FigureIsDead	{Tag = "Pact_3_Leader"},
					FigureIsDead	{Tag = "Pact_1_Leader"},
					MapFlagIsTrue{Name = "mf_P704_MQ4A_Accepted"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 2 },
				},
				MapFlagIsTrue {Name = "mf_P704_MQ1B_P4LeaderTalked"},
				MapFlagIsTrue {Name = "mf_P704_MQ3C_P1LeaderTalked"},
			},
		},
	Actions =
		{
			-- p2 ellenseges lesz playerrel
			PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P2"},
			DialogSetDisabled	{Tag = "Pact_2_Leader"},
			FigureTeamTransfer	{Tag = "Pact_2_Leader", Team = "tm_Team2"},
			MapValueSetVariable	{Name = "mv_P704_P2_Attack", Variable = "mv_704_P2_Defend"},
			FigureRunToEntity	{Tag = "Pact_2_Level_1_Unit_1", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_1_Unit_2", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_1_Unit_3", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_2_Unit_1", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_2_Unit_2", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_2_Unit_3", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_3_Unit_1", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_3_Unit_2", TargetTag = "Pact_2_Leader"},
			FigureRunToEntity	{Tag = "Pact_2_Level_3_Unit_3", TargetTag = "Pact_2_Leader"},
		},
	},	

------------
-- P3 clan becomes player enemy
------------

	OnOneTimeEvent
	{
	EventName = ">>> p3 is public enemy <<<",
	Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ1A_P2LeaderTalked"},
					MapFlagIsTrue {Name = "mf_P704_MQ1A_P4LeaderTalked"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ1A_P4LeaderTalked"},
					FigureIsDead	{Tag = "Pact_2_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ1A_P2LeaderTalked"},
					FigureIsDead	{Tag = "Pact_4_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					FigureIsDead	{Tag = "Pact_2_Leader"},
					FigureIsDead	{Tag = "Pact_4_Leader"},
					MapFlagIsTrue{Name = "mf_P704_MQ1A_Accepted"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 2 },
				},
				MapFlagIsTrue {Name = "mf_P704_MQ2B_P4LeaderTalked"},
				MapFlagIsTrue {Name = "mf_P704_MQ4C_P1LeaderTalked"},
			},
		},
	Actions =
		{
			-- p3 ellenseges lesz playerrel
			PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P3"},
			DialogSetDisabled	{Tag = "Pact_3_Leader"},
			FigureTeamTransfer	{Tag = "Pact_3_Leader", Team = "tm_Team3"},
			MapValueSetVariable	{Name = "mv_P704_P3_Attack", Variable = "mv_704_P3_Defend"},
			FigureRunToEntity	{Tag = "Pact_3_Level_1_Unit_1", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_1_Unit_2", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_1_Unit_3", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_2_Unit_1", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_2_Unit_2", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_2_Unit_3", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_3_Unit_1", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_3_Unit_2", TargetTag = "Pact_3_Leader"},
			FigureRunToEntity	{Tag = "Pact_3_Level_3_Unit_3", TargetTag = "Pact_3_Leader"},
		},
	},	

------------
-- P4 clan becomes player enemy
------------

	OnOneTimeEvent
	{
	EventName = ">>> p4 is public enemy <<<",
	Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ3A_P1LeaderTalked"},
					MapFlagIsTrue {Name = "mf_P704_MQ3A_P2LeaderTalked"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ3A_P1LeaderTalked"},
					FigureIsDead	{Tag = "Pact_2_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P704_MQ3A_P2LeaderTalked"},
					FigureIsDead	{Tag = "Pact_1_Leader"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 3 },
				},
				AND
				{
					FigureIsDead	{Tag = "Pact_2_Leader"},
					FigureIsDead	{Tag = "Pact_1_Leader"},
					MapFlagIsTrue{Name = "mf_P704_MQ3A_Accepted"},
					MapValueIsEqual	{Name = "mv_P704_Num_Living_Clans", Value = 2 },
				},
				MapFlagIsTrue {Name = "mf_P704_MQ1C_P2LeaderTalked"},
				MapFlagIsTrue {Name = "mf_P704_MQ2C_P3LeaderTalked"},
			},
		},
	Actions =
		{
			-- p4 ellenseges lesz playerrel
			PlayerTeamTransfer	{Player = "pl_Human", Team = "tm_TeamPlayer_P4"},
			DialogSetDisabled	{Tag = "Pact_4_Leader"},
			FigureTeamTransfer	{Tag = "Pact_4_Leader", Team = "tm_Team4"},
			MapValueSetVariable	{Name = "mv_P704_P4_Attack", Variable = "mv_704_P4_Defend"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_1", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_2", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_1_Unit_3", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_1", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_2", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_2_Unit_3", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_1", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_2", TargetTag = "Pact_4_Leader"},
			FigureRunToEntity	{Tag = "Pact_4_Level_3_Unit_3", TargetTag = "Pact_4_Leader"},
		},
	},	

};