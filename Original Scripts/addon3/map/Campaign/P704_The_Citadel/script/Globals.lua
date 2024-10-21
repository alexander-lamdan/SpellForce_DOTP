--
-- MISSION CONSTANTS
--

-- for nameless units
iBonesDropChance = 50 -- final: 30-50
iBonesToCollect = 20 -- final: 20

iMissionXPSub = 1000
iMissionXPMain = 1000


-- Heroes
Hero1 = "pl_HumanHeroCaine";
Hero2 = "pl_HumanHeroFirst"; 
Hero3 = "pl_HumanHeroSecond";
Hero4 = "pl_HumanCompanionCraigHuman";


--
-- UNIT SPAWN
--

ID_Pact1_Level1a = 96;
ID_Pact1_Level1b = 98;
ID_Pact1_Level2 = 103;
ID_Pact1_Level3 = 107;

ID_Pact2_Level1a = 97;
ID_Pact2_Level1b = 98;
ID_Pact2_Level2 = 102;
ID_Pact2_Level3 = 107;

ID_Pact3_Level1a = 99;
ID_Pact3_Level1b = 100;
ID_Pact3_Level2 = 102;
ID_Pact3_Level3 = 107;

ID_Pact4_Level1a = 96;
ID_Pact4_Level1b = 99;
ID_Pact4_Level2 = 103;
ID_Pact4_Level3 = 107;

Value_Pact_UnitLevel = 3;
Time_Respawn_Pact_Squads = 120;
Time_Respawn_Pact_Defend = 30;

Value_Demon_UnitLevel = 6;
Time_Respawn_Demons = 10;

--
-- WAYPOINTS
--

-- pact 1 attack route waypoints
aPath_Pact1_Pact2_Nameless = {"Waypoint_P1_P2_Nameless_1", "Waypoint_P1_P2_Nameless_2", "Waypoint_P1_P2_Nameless_3"}
aPath_Pact1_Pact3_Nameless = {"Waypoint_P1_P3_Nameless_1", "Waypoint_P1_P3_Nameless_2", "Waypoint_P1_P3_Nameless_3"}
aPath_Pact1_Pact4_Nameless = {"Waypoint_P1_P4_Nameless_1", "Waypoint_P1_P4_Nameless_2", "Waypoint_P1_P4_Nameless_3"}
aPath_Pact1_Pact2_Gates = {"Waypoint_P1_P2_Gates_1", "Waypoint_P1_P2_Gates_2", "Waypoint_P1_P2_Gates_3", "Waypoint_P1_P2_Gates_4"}
aPath_Pact1_Pact3_Gates = {"Waypoint_P1_P3_Gates_1", "Waypoint_P1_P3_Gates_2", "Waypoint_P1_P3_Gates_3", "Waypoint_P1_P3_Gates_4"}
aPath_Pact1_Pact4_Gates = {"Waypoint_P1_P4_Gates_1", "Waypoint_P1_P4_Gates_2", "Waypoint_P1_P4_Gates_3", "Waypoint_P1_P4_Gates_4"}

-- pact 2 attack route waypoints
aPath_Pact2_Pact1_Nameless = {"Waypoint_P2_P1_Nameless_1", "Waypoint_P2_P1_Nameless_2", "Waypoint_P2_P1_Nameless_3"}
aPath_Pact2_Pact3_Nameless = {"Waypoint_P2_P3_Nameless_1", "Waypoint_P2_P3_Nameless_2", "Waypoint_P2_P3_Nameless_3"}
aPath_Pact2_Pact4_Nameless = {"Waypoint_P2_P4_Nameless_1", "Waypoint_P2_P4_Nameless_2", "Waypoint_P2_P4_Nameless_3"}
aPath_Pact2_Pact1_Gates = {"Waypoint_P2_P1_Gates_1", "Waypoint_P2_P1_Gates_2", "Waypoint_P2_P1_Gates_3", "Waypoint_P2_P1_Gates_4"}
aPath_Pact2_Pact3_Gates = {"Waypoint_P2_P3_Gates_1", "Waypoint_P2_P3_Gates_2", "Waypoint_P2_P3_Gates_3", "Waypoint_P2_P3_Gates_4"}
aPath_Pact2_Pact4_Gates = {"Waypoint_P2_P4_Gates_1", "Waypoint_P2_P4_Gates_2", "Waypoint_P2_P4_Gates_3", "Waypoint_P2_P4_Gates_4"}

-- pact 3 attack route waypoints
aPath_Pact3_Pact2_Nameless = {"Waypoint_P3_P2_Nameless_1", "Waypoint_P3_P2_Nameless_2", "Waypoint_P3_P2_Nameless_3"}
aPath_Pact3_Pact1_Nameless = {"Waypoint_P3_P1_Nameless_1", "Waypoint_P3_P1_Nameless_2", "Waypoint_P3_P1_Nameless_3"}
aPath_Pact3_Pact4_Nameless = {"Waypoint_P3_P4_Nameless_1", "Waypoint_P3_P4_Nameless_2", "Waypoint_P3_P4_Nameless_3"}
aPath_Pact3_Pact2_Gates = {"Waypoint_P3_P2_Gates_1", "Waypoint_P3_P2_Gates_2", "Waypoint_P3_P2_Gates_3", "Waypoint_P3_P2_Gates_4"}
aPath_Pact3_Pact1_Gates = {"Waypoint_P3_P1_Gates_1", "Waypoint_P3_P1_Gates_2", "Waypoint_P3_P1_Gates_3", "Waypoint_P3_P1_Gates_4"}
aPath_Pact3_Pact4_Gates = {"Waypoint_P3_P4_Gates_1", "Waypoint_P3_P4_Gates_2", "Waypoint_P3_P4_Gates_3", "Waypoint_P3_P4_Gates_4"}

-- pact 4 attack route waypoints
aPath_Pact4_Pact2_Nameless = {"Waypoint_P4_P2_Nameless_1", "Waypoint_P4_P2_Nameless_2", "Waypoint_P4_P2_Nameless_3"}
aPath_Pact4_Pact3_Nameless = {"Waypoint_P4_P3_Nameless_1", "Waypoint_P4_P3_Nameless_2", "Waypoint_P4_P3_Nameless_3"}
aPath_Pact4_Pact1_Nameless = {"Waypoint_P4_P1_Nameless_1", "Waypoint_P4_P1_Nameless_2", "Waypoint_P4_P1_Nameless_3"}
aPath_Pact4_Pact2_Gates = {"Waypoint_P4_P2_Gates_1", "Waypoint_P4_P2_Gates_2", "Waypoint_P4_P2_Gates_3", "Waypoint_P4_P2_Gates_4"}
aPath_Pact4_Pact3_Gates = {"Waypoint_P4_P3_Gates_1", "Waypoint_P4_P3_Gates_2", "Waypoint_P4_P3_Gates_3", "Waypoint_P4_P3_Gates_4"}
aPath_Pact4_Pact1_Gates = {"Waypoint_P4_P1_Gates_1", "Waypoint_P4_P1_Gates_2", "Waypoint_P4_P1_Gates_3", "Waypoint_P4_P1_Gates_4"}

-- demon patrol route waypoints
aPath_Demon_Central_1 = {"Waypoint_Central1_1", "Waypoint_Central1_2", "Waypoint_Central1_3", "Waypoint_Central1_4"}
aPath_Demon_Central_2 = {"Waypoint_Central2_1", "Waypoint_Central2_2", "Waypoint_Central2_3", "Waypoint_Central2_4"}
aPath_Demon_Central_3 = {"Waypoint_Central3_1", "Waypoint_Central3_2", "Waypoint_Central3_3", "Waypoint_Central3_4"}
aPath_Demon_Central_4 = {"Waypoint_Central4_1", "Waypoint_Central4_2", "Waypoint_Central4_3", "Waypoint_Central4_4"}



--
-- REWARD TABLE
--

Reward =
{
	MQ1A			= { XP =  1000,	Gold =    0 },
	MQ1B			= { XP =  1000,	Gold =    0 },
	MQ1C			= { XP =  1000,	Gold =    0 },
	MQ1D			= { XP =  1000,	Gold =    0 },
	MQ1E			= { XP =  1000,	Gold =    0 },

	GateDemons		= { XP =  0,	Gold =    50 },
	CentralDemons	= { XP =  0,	Gold =    20 },
	NalDrommar		= { XP =  500,	Gold =    200 },
}
-- total reward XP: 28000
-- total reward Gold: 200



--
-- GOLD OUTCRY TABLE
--

GoldOutcry =
{
	[10]	= "ExtraGold10",
	[20]	= "ExtraGold20",
	[50]	= "ExtraGold50",
	[100]	= "ExtraGold100",
	[200]	= "ExtraGold200",
	[500]	= "ExtraGold500",
	[1000]	= "ExtraGold1000",
}
