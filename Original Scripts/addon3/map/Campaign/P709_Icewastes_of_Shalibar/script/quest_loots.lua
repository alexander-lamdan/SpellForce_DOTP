--***************************************************
--*                                                 *
--*   Icewastes of Shalibar :: quest loots script   *
--*                                                 *
--***************************************************

State
{

	StateName = "INIT",

--*******************************
--*                             *
--*   INITIAL LOOTS | GENERIC   *
--*                             *
--*******************************

	OnOneTimeEvent
	{
		EventName = ">>> INITIAL LOOTS | GENERIC <<<",
		Conditions = 
		{

			GameIsUnBlocked{},

		},
		Actions =
		{
			
--	Generic loots for Avatar
					
			FigureLootItemGenericAdd {Tag = "wpack_0201", DropChance = 50, Level = 23, Skill = 9},
			FigureLootItemGenericAdd {Tag = "wpack_0601", DropChance = 50, Level = 26, Skill = 30},
			FigureLootItemGenericAdd {Tag = "wpack_1201", DropChance = 50, Level = 24, Skill = 42},
			FigureLootItemGenericAdd {Tag = "wpack_1801", DropChance = 50, Level = 27, Skill = 60},
			
			FigureLootItemGenericAdd {Tag = "upack_0101", DropChance = 50, Level = 24, Skill = 164},
			FigureLootItemGenericAdd {Tag = "upack_0601", DropChance = 50, Level = 27, Skill = 167},

--	Generic loot for Orc

			FigureLootItemGenericAdd {Tag = "bpack_0201", DropChance = 50, Level = 21, Skill = 34},
			
--	Generic loot for Shae

			FigureLootItemGenericAdd {Tag = "bpack_0601", DropChance = 50, Level = 21, Skill = 150},

--	Generic loot for Ayro

			FigureLootItemGenericAdd {Tag = "wpack_0501", DropChance = 50, Level = 21, Skill = 161},
			
--	Generic loot for Nuri

			FigureLootItemGenericAdd {Tag = "wpack_0701", DropChance = 50, Level = 21, Skill = 75},

--	Generic loot for Zweihander

			FigureLootItemGenericAdd {Tag = "wpack_1001", DropChance = 50, Level = 21, Skill = 27},

--	Generic loot for Necros

			FigureLootItemGenericAdd {Tag = "wpack_1301", DropChance = 50, Level = 21, Skill = 42},

--	Generic loot for Alana

			FigureLootItemGenericAdd {Tag = "wpack_1601", DropChance = 50, Level = 21, Skill = 6},

--	Generic loot for Craig

			FigureLootItemGenericAdd {Tag = "upack_0401", DropChance = 50, Level = 21, Skill = 9},

--	Generic loot for Kun'la

			FigureLootItemGenericAdd {Tag = "upack_1001", DropChance = 50, Level = 21, Skill = 167},

--	Generic loot for Ious

			FigureLootItemGenericAdd {Tag = "bpack_1201", DropChance = 50, Level = 21, Skill = 42},

--	Generic loot for Sariel

			FigureLootItemGenericAdd {Tag = "bpack_1401", DropChance = 50, Level = 21, Skill = 67},

		},
	},

--**********************************
--*                                *
--*   INITIAL LOOTS | EQUIPMENTS   *
--*                                *
--**********************************

	OnOneTimeEvent
	{
		EventName = ">>> INITIAL LOOTS | WEAPONS <<<",
		Conditions = 
		{

			GameIsUnBlocked{},

		},
		Actions =
		{

			FigureLootItemEquipmentAdd {Tag = "wpack_0101", DropChance = 50, ItemId = 526}, -- LVL 21: Iron Fist
			FigureLootItemEquipmentAdd {Tag = "wpack_0301", DropChance = 50, ItemId = 706}, -- LVL 24: Great Crystal Bow
			FigureLootItemEquipmentAdd {Tag = "wpack_0801", DropChance = 50, ItemId = 571}, -- LVL 27: Worldbreaker
			FigureLootItemEquipmentAdd {Tag = "wpack_1501", DropChance = 50, ItemId = 527}, -- LVL 23: Flamebringer
			FigureLootItemEquipmentAdd {Tag = "wpack_1701", DropChance = 50, ItemId = 580}, -- LVL 26: Time and World
			
			FigureLootItemEquipmentAdd {Tag = "upack_0301", DropChance = 50, ItemId = 353}, -- LVL 22: Robe of the Seven
			FigureLootItemEquipmentAdd {Tag = "upack_0501", DropChance = 50, ItemId = 534}, -- LVL 25: Silverstrike
			FigureLootItemEquipmentAdd {Tag = "upack_0701", DropChance = 50, ItemId = 593}, -- LVL 21: Winterdeath
			FigureLootItemEquipmentAdd {Tag = "upack_0901", DropChance = 50, ItemId = 876}, -- LVL 24: Great Helmet of the Iron Falcons

			FigureLootItemEquipmentAdd {Tag = "bpack_0101", DropChance = 50, ItemId = 710}, -- LVL 23: Crystal Scorpion
			FigureLootItemEquipmentAdd {Tag = "bpack_0301", DropChance = 50, ItemId = 566}, -- LVL 26: Despair
			FigureLootItemEquipmentAdd {Tag = "bpack_0501", DropChance = 50, ItemId = 359}, -- LVL 22: Stormsinger
			FigureLootItemEquipmentAdd {Tag = "bpack_0801", DropChance = 50, ItemId = 559}, -- LVL 25: Starfall
			FigureLootItemEquipmentAdd {Tag = "bpack_1001", DropChance = 50, ItemId = 576}, -- LVL 27: Light

		},
	},

--**************************
--*                        *
--*   GOLD FOR WOLFPACKS   *
--*                        *
--**************************

-- Gold for Wolfpack 01

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 01 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_01"},

			FigureIsDead {Tag = "wpack_0101"},
			FigureIsDead {Tag = "wpack_0102"},
			FigureIsDead {Tag = "wpack_0103"},
			FigureIsDead {Tag = "wpack_0104"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
			
			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_wpack_01"},
			MapTimerStart	{Name = "mt_P709_wpack_01"},

		},
	},
	
-- Gold for Wolfpack 02

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 02 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_0201"},
			FigureIsDead {Tag = "wpack_0202"},
			FigureIsDead {Tag = "wpack_0203"},
			FigureIsDead {Tag = "wpack_0204"},
			FigureIsDead {Tag = "wpack_0205"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			
			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},
			
			MapTimerStart	{Name = "mt_P709_wpack_02"},

		},
	},
	
-- Gold for Wolfpack 03

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 03 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_03"},

			FigureIsDead {Tag = "wpack_0301"},
			FigureIsDead {Tag = "wpack_0302"},
			FigureIsDead {Tag = "wpack_0303"},
			FigureIsDead {Tag = "wpack_0304"},
			FigureIsDead {Tag = "wpack_0305"},
			FigureIsDead {Tag = "wpack_0306"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_wpack_03"},
			MapTimerStart	{Name = "mt_P709_wpack_03"},

		},
	},
	
-- Gold for Wolfpack 04

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 04 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_0401"},
			FigureIsDead {Tag = "wpack_0402"},
			FigureIsDead {Tag = "wpack_0403"},
			FigureIsDead {Tag = "wpack_0404"},
			FigureIsDead {Tag = "wpack_0405"},
			FigureIsDead {Tag = "wpack_0406"},
			FigureIsDead {Tag = "wpack_0407"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			
			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

		},
	},
	
-- Gold for Wolfpack 05

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 05 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_05"},

			FigureIsDead {Tag = "wpack_0501"},
			FigureIsDead {Tag = "wpack_0502"},
			FigureIsDead {Tag = "wpack_0503"},
			FigureIsDead {Tag = "wpack_0504"},
			FigureIsDead {Tag = "wpack_0505"},
			FigureIsDead {Tag = "wpack_0506"},
			FigureIsDead {Tag = "wpack_0507"},
			FigureIsDead {Tag = "wpack_0508"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},

			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_wpack_05"},
			MapTimerStart	{Name = "mt_P709_wpack_05"},

		},
	},

-- Gold for Wolfpack 06

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 06 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_0601"},
			FigureIsDead {Tag = "wpack_0602"},
			FigureIsDead {Tag = "wpack_0603"},
			FigureIsDead {Tag = "wpack_0604"},
			FigureIsDead {Tag = "wpack_0605"},
			FigureIsDead {Tag = "wpack_0606"},
			FigureIsDead {Tag = "wpack_0607"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			
			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

		},
	},

-- Gold for Wolfpack 07

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 07 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_wpack_07"},
			
			FigureIsDead {Tag = "wpack_0701"},
			FigureIsDead {Tag = "wpack_0702"},
			FigureIsDead {Tag = "wpack_0703"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 50},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 50},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 50},
			
			FigureOutcry {TextTag = "ExtraGold50", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_wpack_07"},
			MapTimerStart	{Name = "mt_P709_wpack_07"},

		},
	},
	
-- Gold for Wolfpack 08

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 08 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_0801"},
			FigureIsDead {Tag = "wpack_0802"},
			FigureIsDead {Tag = "wpack_0803"},
			FigureIsDead {Tag = "wpack_0804"},
			FigureIsDead {Tag = "wpack_0805"},
			FigureIsDead {Tag = "wpack_0806"},
			FigureIsDead {Tag = "wpack_0807"},
			FigureIsDead {Tag = "wpack_0808"},
			FigureIsDead {Tag = "wpack_0809"},
			FigureIsDead {Tag = "wpack_0810"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 1000},
			
			FigureOutcry {TextTag = "ExtraGold1000", Tag = "noFigure"},

		},
	},
	
-- Gold for Wolfpack 09

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 09 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_09"},

			FigureIsDead {Tag = "wpack_0901"},
			FigureIsDead {Tag = "wpack_0902"},
			FigureIsDead {Tag = "wpack_0903"},
			FigureIsDead {Tag = "wpack_0904"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},

			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_wpack_09"},
			MapTimerStart	{Name = "mt_P709_wpack_09"},

		},
	},
	
-- Gold for Wolfpack 10

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 10 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_1001"},
			FigureIsDead {Tag = "wpack_1002"},
			FigureIsDead {Tag = "wpack_1003"},
			FigureIsDead {Tag = "wpack_1004"},
			FigureIsDead {Tag = "wpack_1005"},
			FigureIsDead {Tag = "wpack_1006"},
			FigureIsDead {Tag = "wpack_1007"},
			FigureIsDead {Tag = "wpack_1008"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},

			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},

		},
	},
	
-- Gold for Wolfpack 11

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 11 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_11"},

			FigureIsDead {Tag = "wpack_1101"},
			FigureIsDead {Tag = "wpack_1102"},
			FigureIsDead {Tag = "wpack_1103"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},

			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_wpack_11"},
			MapTimerStart	{Name = "mt_P709_wpack_11"},

		},
	},

-- Gold for Wolfpack 12

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 12 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_1201"},
			FigureIsDead {Tag = "wpack_1202"},
			FigureIsDead {Tag = "wpack_1203"},
			FigureIsDead {Tag = "wpack_1204"},
			FigureIsDead {Tag = "wpack_1205"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},

			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

		},
	},
	
-- Gold for Wolfpack 13

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 13 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_13"},

			FigureIsDead {Tag = "wpack_1301"},
			FigureIsDead {Tag = "wpack_1302"},
			FigureIsDead {Tag = "wpack_1303"},
			FigureIsDead {Tag = "wpack_1304"},
			FigureIsDead {Tag = "wpack_1305"},
			FigureIsDead {Tag = "wpack_1306"},
			FigureIsDead {Tag = "wpack_1307"},
			FigureIsDead {Tag = "wpack_1308"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_wpack_13"},
			MapTimerStart	{Name = "mt_P709_wpack_13"},

		},
	},
	
-- Gold for Wolfpack 14

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 14 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_1401"},
			FigureIsDead {Tag = "wpack_1402"},
			FigureIsDead {Tag = "wpack_1403"},
			FigureIsDead {Tag = "wpack_1404"},
			FigureIsDead {Tag = "wpack_1405"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},

			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

		},
	},

-- Gold for Wolfpack 15

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 15 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_15"},

			FigureIsDead {Tag = "wpack_1501"},
			FigureIsDead {Tag = "wpack_1502"},
			FigureIsDead {Tag = "wpack_1503"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},

			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_wpack_15"},
			MapTimerStart	{Name = "mt_P709_wpack_15"},

		},
	},
	
-- Gold for Wolfpack 16

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 16 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_1601"},
			FigureIsDead {Tag = "wpack_1602"},
			FigureIsDead {Tag = "wpack_1603"},
			FigureIsDead {Tag = "wpack_1604"},
			FigureIsDead {Tag = "wpack_1605"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

		},
	},

-- Gold for Wolfpack 17

	OnEvent
	{
		EventName = ">>> Gold for Wolfpack 17 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_wpack_17"},

			FigureIsDead {Tag = "wpack_1701"},
			FigureIsDead {Tag = "wpack_1702"},
			FigureIsDead {Tag = "wpack_1703"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_wpack_17"},
			MapTimerStart	{Name = "mt_P709_wpack_17"},

		},
	},
	
-- Gold for Wolfpack 18

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Wolfpack 18 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "wpack_1801"},
			FigureIsDead {Tag = "wpack_1802"},
			FigureIsDead {Tag = "wpack_1803"},
			FigureIsDead {Tag = "wpack_1804"},
			FigureIsDead {Tag = "wpack_1805"},
			FigureIsDead {Tag = "wpack_1806"},
			FigureIsDead {Tag = "wpack_1807"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 1000},

			FigureOutcry {TextTag = "ExtraGold1000", Tag = "noFigure"},

		},
	},
	
--******************************
--*                            *
--*   GOLD FOR UNDEAD HORDES   *
--*                            *
--******************************

-- Gold for Undead horde 01

	OnEvent
	{
		EventName = ">>> Gold for Undead horde 01 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_upack_01"},

			FigureIsDead {Tag = "upack_0101"},
			FigureIsDead {Tag = "upack_0102"},
			FigureIsDead {Tag = "upack_0103"},
			FigureIsDead {Tag = "upack_0104"},
			FigureIsDead {Tag = "upack_0105"},
			FigureIsDead {Tag = "upack_0106"},
			FigureIsDead {Tag = "upack_0107"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			
			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_upack_01"},
			MapTimerStart	{Name = "mt_P709_upack_01"},

		},
	},
	
-- Gold for Undead horde 02

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Undead horde 02 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "upack_0201"},
			FigureIsDead {Tag = "upack_0202"},
			FigureIsDead {Tag = "upack_0203"},
			FigureIsDead {Tag = "upack_0204"},
			FigureIsDead {Tag = "upack_0205"},
			FigureIsDead {Tag = "upack_0206"},
			FigureIsDead {Tag = "upack_0207"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
			
			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

		},
	},
	
-- Gold for Undead horde 03

	OnEvent
	{
		EventName = ">>> Gold for Undead horde 03 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_upack_03"},

			FigureIsDead {Tag = "upack_0301"},
			FigureIsDead {Tag = "upack_0302"},
			FigureIsDead {Tag = "upack_0303"},
			FigureIsDead {Tag = "upack_0304"},
			FigureIsDead {Tag = "upack_0305"},
			FigureIsDead {Tag = "upack_0306"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
			
			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_upack_03"},
			MapTimerStart	{Name = "mt_P709_upack_03"},

		},
	},
	
-- Gold for Undead horde 04

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Undead horde 04 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "upack_0401"},
			FigureIsDead {Tag = "upack_0402"},
			FigureIsDead {Tag = "upack_0403"},
			FigureIsDead {Tag = "upack_0404"},
			FigureIsDead {Tag = "upack_0405"},
			FigureIsDead {Tag = "upack_0406"},
			FigureIsDead {Tag = "upack_0407"},
			FigureIsDead {Tag = "upack_0408"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 1000},
			
			FigureOutcry {TextTag = "ExtraGold1000", Tag = "noFigure"},

		},
	},
	
-- Gold for Undead horde 05

	OnEvent
	{
		EventName = ">>> Gold for Undead horde 05 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_upack_05"},

			FigureIsDead {Tag = "upack_0501"},
			FigureIsDead {Tag = "upack_0502"},
			FigureIsDead {Tag = "upack_0503"},
			FigureIsDead {Tag = "upack_0504"},
			FigureIsDead {Tag = "upack_0505"},
			FigureIsDead {Tag = "upack_0506"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			
			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_upack_05"},
			MapTimerStart	{Name = "mt_P709_upack_05"},

		},
	},
	
-- Gold for Undead horde 06

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Undead horde 06 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "upack_0601"},
			FigureIsDead {Tag = "upack_0602"},
			FigureIsDead {Tag = "upack_0603"},
			FigureIsDead {Tag = "upack_0604"},
			FigureIsDead {Tag = "upack_0605"},
			FigureIsDead {Tag = "upack_0606"},
			FigureIsDead {Tag = "upack_0607"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},
			
			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

		},
	},
	
-- Gold for Undead horde 07

	OnEvent
	{
		EventName = ">>> Gold for Undead horde 07 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_upack_07"},

			FigureIsDead {Tag = "upack_0701"},
			FigureIsDead {Tag = "upack_0702"},
			FigureIsDead {Tag = "upack_0703"},
			FigureIsDead {Tag = "upack_0704"},
			FigureIsDead {Tag = "upack_0705"},
			FigureIsDead {Tag = "upack_0706"},
			FigureIsDead {Tag = "upack_0707"},
			FigureIsDead {Tag = "upack_0708"},
			FigureIsDead {Tag = "upack_0709"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 1000},
			
			FigureOutcry {TextTag = "ExtraGold1000", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_upack_07"},
			MapTimerStart	{Name = "mt_P709_upack_07"},

		},
	},
	
-- Gold for Undead horde 08

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Undead horde 08 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "upack_0801"},
			FigureIsDead {Tag = "upack_0802"},
			FigureIsDead {Tag = "upack_0803"},
			FigureIsDead {Tag = "upack_0804"},
			FigureIsDead {Tag = "upack_0805"},
			FigureIsDead {Tag = "upack_0806"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
			
			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

		},
	},
	
-- Gold for Undead horde 09

	OnEvent
	{
		EventName = ">>> Gold for Undead horde 09 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_upack_09"},

			FigureIsDead {Tag = "upack_0901"},
			FigureIsDead {Tag = "upack_0902"},
			FigureIsDead {Tag = "upack_0903"},
			FigureIsDead {Tag = "upack_0904"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},

			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_upack_09"},
			MapTimerStart	{Name = "mt_P709_upack_09"},

		},
	},

-- Gold for Undead horde 10

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Undead horde 10 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "upack_1001"},
			FigureIsDead {Tag = "upack_1002"},
			FigureIsDead {Tag = "upack_1003"},
			FigureIsDead {Tag = "upack_1004"},
			FigureIsDead {Tag = "upack_1005"},
			FigureIsDead {Tag = "upack_1006"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},

			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

		},
	},
	
--**************************
--*                        *
--*   GOLD FOR BEARPACKS   *
--*                        *
--**************************

-- Gold for Bearpack 01

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 01 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_bpack_01"},

			FigureIsDead {Tag = "bpack_0101"},
			FigureIsDead {Tag = "bpack_0102"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

			MapFlagSetTrue {Name = "mf_P709_bpack_01"},
			MapTimerStart	{Name = "mt_P709_bpack_01"},

		},
	},
	
-- Gold for Bearpack 02

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 02 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_0201"},
			FigureIsDead {Tag = "bpack_0202"},
			FigureIsDead {Tag = "bpack_0203"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			
			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},

		},
	},
	
-- Gold for Bearpack 03

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 03 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_bpack_03"},

			FigureIsDead {Tag = "bpack_0301"},
			FigureIsDead {Tag = "bpack_0302"},
			FigureIsDead {Tag = "bpack_0303"},
			FigureIsDead {Tag = "bpack_0304"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 1000},
			
			FigureOutcry {TextTag = "ExtraGold1000", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_bpack_03"},
			MapTimerStart	{Name = "mt_P709_bpack_03"},

		},
	},
	
-- Gold for Bearpack 04

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 04 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_0401"},
			FigureIsDead {Tag = "bpack_0402"},
			FigureIsDead {Tag = "bpack_0403"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			
			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},

		},
	},
	
-- Gold for Bearpack 05

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 05 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_bpack_05"},

			FigureIsDead {Tag = "bpack_0501"},
			FigureIsDead {Tag = "bpack_0502"},
			FigureIsDead {Tag = "bpack_0503"},
			FigureIsDead {Tag = "bpack_0504"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
			
			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_bpack_05"},
			MapTimerStart	{Name = "mt_P709_bpack_05"},

		},
	},

-- Gold for Bearpack 06

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 06 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_0601"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 100},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 100},
			
			FigureOutcry {TextTag = "ExtraGold100", Tag = "noFigure"},

		},
	},
	
-- Gold for Bearpack 07

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 07 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_bpack_07"},

			FigureIsDead {Tag = "bpack_0701"},
			FigureIsDead {Tag = "bpack_0702"},
			FigureIsDead {Tag = "bpack_0703"},
			FigureIsDead {Tag = "bpack_0704"},
			FigureIsDead {Tag = "bpack_0705"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			
			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_bpack_07"},
			MapTimerStart	{Name = "mt_P709_bpack_07"},

		},
	},
	
-- Gold for Bearpack 08

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 08 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_0801"},
			FigureIsDead {Tag = "bpack_0802"},
			FigureIsDead {Tag = "bpack_0803"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},
			
			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},

		},
	},
	
-- Gold for Bearpack 09

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 09 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},
			
			MapFlagIsFalse {Name = "mf_P709_bpack_09"},

			FigureIsDead {Tag = "bpack_0901"},
			FigureIsDead {Tag = "bpack_0902"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_bpack_09"},
			MapTimerStart	{Name = "mt_P709_bpack_09"},

		},
	},
	
-- Gold for Bearpack 10

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 10 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_1001"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 1000},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 1000},

			FigureOutcry {TextTag = "ExtraGold1000", Tag = "noFigure"},

		},
	},
	
-- Gold for Bearpack 11

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 11 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_bpack_11"},

			FigureIsDead {Tag = "bpack_1101"},
			FigureIsDead {Tag = "bpack_1102"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_bpack_11"},
			MapTimerStart	{Name = "mt_P709_bpack_11"},

		},
	},
	
-- Gold for Bearpack 12

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 12 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_1201"},
			FigureIsDead {Tag = "bpack_1202"},
			FigureIsDead {Tag = "bpack_1203"},
			FigureIsDead {Tag = "bpack_1204"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

		},
	},
	
-- Gold for Bearpack 13

	OnEvent
	{
		EventName = ">>> Gold for Bearpack 13 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapFlagIsFalse {Name = "mf_P709_bpack_13"},

			FigureIsDead {Tag = "bpack_1301"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 500},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 500},

			FigureOutcry {TextTag = "ExtraGold500", Tag = "noFigure"},
			
			MapFlagSetTrue {Name = "mf_P709_bpack_13"},
			MapTimerStart	{Name = "mt_P709_bpack_13"},

		},
	},
	
-- Gold for Bearpack 14

	OnOneTimeEvent
	{
		EventName = ">>> Gold for Bearpack 14 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			FigureIsDead {Tag = "bpack_1401"},
			FigureIsDead {Tag = "bpack_1402"},
			FigureIsDead {Tag = "bpack_1403"},

		},
		Actions =
		{

			AvatarGoldGive {Player = "default", Amount = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold", Value = 200},
			AvatarValueAdd	{Player = "default", Name = "ach_dotp_gold_dd", Value = 200},

			FigureOutcry {TextTag = "ExtraGold200", Tag = "noFigure"},

		},
	},

};