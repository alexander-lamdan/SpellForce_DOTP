--*****************************************************
--*                                                   *
--*   Icewastes of Shalibar :: Creep respawn script   *
--*                                                   *
--*****************************************************

local vWolfRespawnTimer = 600;

local vUndeadRespawnTimer = 600;

local vBearRespawnTimer = 600;

State
{

	StateName = "INIT",

--*************************
--*                       *
--*   RESPAWN WOLFPACKS   *
--*                       *
--*************************

-- Respawn Wolfpack 01

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 01 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_01", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_0101", X = 43.5235, Y = 167.977},
			FigureRespawn	{Tag = "wpack_0102", X = 47.2928, Y = 165.95},
			FigureRespawn	{Tag = "wpack_0103", X = 47.2674, Y = 170.448},
			FigureRespawn	{Tag = "wpack_0104", X = 51.4021, Y = 168.048},

			FigureLookAtDirection {Tag = "wpack_0101", Direction = 260},
			FigureLookAtDirection {Tag = "wpack_0102", Direction = 258},
			FigureLookAtDirection {Tag = "wpack_0103", Direction = 222},
			FigureLookAtDirection {Tag = "wpack_0104", Direction = 120},

			MapFlagSetFalse {Name = "mf_P709_wpack_01"},
			MapTimerStop {Name = "mt_P709_wpack_01"},

		},
	},
	
-- Respawn Wolfpack 03

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 03 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_03", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_0301", X = 149.737, Y = 89.9164},
			FigureRespawn	{Tag = "wpack_0302", X = 149.203, Y = 86.2489},
			FigureRespawn	{Tag = "wpack_0303", X = 153.765, Y = 87.0361},
			FigureRespawn	{Tag = "wpack_0304", X = 157.466, Y = 83.6416},
			FigureRespawn	{Tag = "wpack_0305", X = 149.283, Y = 81.638},
			FigureRespawn	{Tag = "wpack_0306", X = 151.816, Y = 77.4623},

			FigureLookAtDirection {Tag = "wpack_0301", Direction = 0},
			FigureLookAtDirection {Tag = "wpack_0302", Direction = 210},
			FigureLookAtDirection {Tag = "wpack_0303", Direction = 230},
			FigureLookAtDirection {Tag = "wpack_0304", Direction = 120},
			FigureLookAtDirection {Tag = "wpack_0305", Direction = 126},
			FigureLookAtDirection {Tag = "wpack_0306", Direction = 138},

			MapFlagSetFalse {Name = "mf_P709_wpack_03"},
			MapTimerStop {Name = "mt_P709_wpack_03"},

		},
	},
	
-- Respawn Wolfpack 05

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 05 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_05", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_0501", X = 241.598, Y = 13.3549},
			FigureRespawn	{Tag = "wpack_0502", X = 246.374, Y = 19.8962},
			FigureRespawn	{Tag = "wpack_0503", X = 249.329, Y = 14.0313},
			FigureRespawn	{Tag = "wpack_0504", X = 254.987, Y = 20.5641},
			FigureRespawn	{Tag = "wpack_0505", X = 254.477, Y = 46.197},
			FigureRespawn	{Tag = "wpack_0506", X = 251.732, Y = 30.8762},
			FigureRespawn	{Tag = "wpack_0507", X = 257.517, Y = 17.3565},
			FigureRespawn	{Tag = "wpack_0508", X = 266.095, Y = 36.0719},

			FigureLookAtDirection {Tag = "wpack_0501", Direction = 206},
			FigureLookAtDirection {Tag = "wpack_0502", Direction = 222},
			FigureLookAtDirection {Tag = "wpack_0503", Direction = 252},
			FigureLookAtDirection {Tag = "wpack_0504", Direction = 160},
			FigureLookAtDirection {Tag = "wpack_0505", Direction = 349},
			FigureLookAtDirection {Tag = "wpack_0506", Direction = 252},
			FigureLookAtDirection {Tag = "wpack_0507", Direction = 252},
			FigureLookAtDirection {Tag = "wpack_0508", Direction = 286},

			MapFlagSetFalse {Name = "mf_P709_wpack_05"},
			MapTimerStop {Name = "mt_P709_wpack_05"},

		},
	},
	
-- Respawn Wolfpack 07

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 07 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_07", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_0701", X = 180.861, Y = 207.77},
			FigureRespawn	{Tag = "wpack_0702", X = 171.339, Y = 201.939},
			FigureRespawn	{Tag = "wpack_0703", X = 173.155, Y = 225.617},

			FigureLookAtDirection {Tag = "wpack_0701", Direction = 246},
			FigureLookAtDirection {Tag = "wpack_0702", Direction = 292},
			FigureLookAtDirection {Tag = "wpack_0703", Direction = 63},

			MapFlagSetFalse {Name = "mf_P709_wpack_07"},
			MapTimerStop {Name = "mt_P709_wpack_07"},

		},
	},
	
-- Respawn Wolfpack 09

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 09 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_09", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_0901", X = 17.0736, Y = 274},
			FigureRespawn	{Tag = "wpack_0902", X = 22.3833, Y = 278},
			FigureRespawn	{Tag = "wpack_0903", X = 31.3057, Y = 272},
			FigureRespawn	{Tag = "wpack_0904", X = 33.2221, Y = 290},

			FigureLookAtDirection {Tag = "wpack_0901", Direction = 80},
			FigureLookAtDirection {Tag = "wpack_0902", Direction = 52},
			FigureLookAtDirection {Tag = "wpack_0903", Direction = 6},
			FigureLookAtDirection {Tag = "wpack_0904", Direction = 0},

			MapFlagSetFalse {Name = "mf_P709_wpack_09"},
			MapTimerStop {Name = "mt_P709_wpack_09"},

		},
	},
	
-- Respawn Wolfpack 11

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 11 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_11", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_1101", X = 72.154, Y = 338.378},
			FigureRespawn	{Tag = "wpack_1102", X = 81.7523, Y = 340.28},
			FigureRespawn	{Tag = "wpack_1103", X = 79.5212, Y = 329.589},

			FigureLookAtDirection {Tag = "wpack_1101", Direction = 34},
			FigureLookAtDirection {Tag = "wpack_1102", Direction = 292},
			FigureLookAtDirection {Tag = "wpack_1103", Direction = 296},

			MapFlagSetFalse {Name = "mf_P709_wpack_11"},
			MapTimerStop {Name = "mt_P709_wpack_11"},

		},
	},

-- Respawn Wolfpack 13

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 13 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_13", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_1301", X = 154.673, Y = 506.936},
			FigureRespawn	{Tag = "wpack_1302", X = 159.819, Y = 496.871},
			FigureRespawn	{Tag = "wpack_1303", X = 165.863, Y = 499.236},
			FigureRespawn	{Tag = "wpack_1304", X = 164.456, Y = 488.783},
			FigureRespawn	{Tag = "wpack_1305", X = 171.5, Y = 497.901},
			FigureRespawn	{Tag = "wpack_1306", X = 172.476, Y = 491.638},
			FigureRespawn	{Tag = "wpack_1307", X = 173.951, Y = 479.885},
			FigureRespawn	{Tag = "wpack_1308", X = 180.356, Y = 490.282},

			FigureLookAtDirection {Tag = "wpack_1301", Direction = 80},
			FigureLookAtDirection {Tag = "wpack_1302", Direction = 97},
			FigureLookAtDirection {Tag = "wpack_1303", Direction = 0},
			FigureLookAtDirection {Tag = "wpack_1304", Direction = 120},
			FigureLookAtDirection {Tag = "wpack_1305", Direction = 319},
			FigureLookAtDirection {Tag = "wpack_1306", Direction = 0},
			FigureLookAtDirection {Tag = "wpack_1307", Direction = 0},
			FigureLookAtDirection {Tag = "wpack_1308", Direction = 338},

			MapFlagSetFalse {Name = "mf_P709_wpack_13"},
			MapTimerStop {Name = "mt_P709_wpack_13"},

		},
	},
	
-- Respawn Wolfpack 15

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 15 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_15", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_1501", X = 75.5716, Y = 597.68},
			FigureRespawn	{Tag = "wpack_1502", X = 85.83, Y = 590.597},
			FigureRespawn	{Tag = "wpack_1503", X = 97.56, Y = 592.692},

			FigureLookAtDirection {Tag = "wpack_1501", Direction = 319},
			FigureLookAtDirection {Tag = "wpack_1502", Direction = 97},
			FigureLookAtDirection {Tag = "wpack_1503", Direction = 308},

			MapFlagSetFalse {Name = "mf_P709_wpack_15"},
			MapTimerStop {Name = "mt_P709_wpack_15"},

		},
	},
	
-- Respawn Wolfpack 17

	OnEvent
	{
		EventName = ">>> Respawn Wolfpack 17 <<<",
		Conditions = 
		{
			
			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_wpack_17", Seconds = vWolfRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "wpack_1701", X = 26.8276, Y = 354.88},
			FigureRespawn	{Tag = "wpack_1702", X = 29.5222, Y = 365.624},
			FigureRespawn	{Tag = "wpack_1703", X = 39.7657, Y = 356.775},

			FigureLookAtDirection {Tag = "wpack_1701", Direction = 331},
			FigureLookAtDirection {Tag = "wpack_1702", Direction = 74},
			FigureLookAtDirection {Tag = "wpack_1703", Direction = 132},

			MapFlagSetFalse {Name = "mf_P709_wpack_17"},
			MapTimerStop {Name = "mt_P709_wpack_17"},

		},
	},
	
--******************************
--*                            *
--*   RESPAWN UNDEAD HORDESS   *
--*                            *
--******************************

-- Respawn Undead horde 01

	OnEvent
	{
		EventName = ">>> Respawn Undead horde 01 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_upack_01", Seconds = vUndeadRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "upack_0101", X = 311.105, Y = 60.998},
			FigureRespawn	{Tag = "upack_0102", X = 310.158, Y = 54.2288},
			FigureRespawn	{Tag = "upack_0103", X = 307.703, Y = 56.6881},
			FigureRespawn	{Tag = "upack_0104", X = 304.572, Y = 55.5763},
			FigureRespawn	{Tag = "upack_0105", X = 307.795, Y = 53.3268},
			FigureRespawn	{Tag = "upack_0106", X = 305.32, Y = 51.9263},
			FigureRespawn	{Tag = "upack_0107", X = 307.012, Y = 49.4028},

			FigureLookAtDirection {Tag = "upack_0101", Direction = 166},
			FigureLookAtDirection {Tag = "upack_0102", Direction = 154},
			FigureLookAtDirection {Tag = "upack_0103", Direction = 177},
			FigureLookAtDirection {Tag = "upack_0104", Direction = 154},
			FigureLookAtDirection {Tag = "upack_0105", Direction = 172},
			FigureLookAtDirection {Tag = "upack_0106", Direction = 160},
			FigureLookAtDirection {Tag = "upack_0107", Direction = 182},

			MapFlagSetFalse {Name = "mf_P709_upack_01"},
			MapTimerStop {Name = "mt_P709_upack_01"},

		},
	},
	
-- Respawn Undead horde 03

	OnEvent
	{
		EventName = ">>> Respawn Undead horde 03 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_upack_03", Seconds = vUndeadRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "upack_0301", X = 291.763, Y = 121.359},
			FigureRespawn	{Tag = "upack_0302", X = 288.177, Y = 117.651},
			FigureRespawn	{Tag = "upack_0303", X = 284.99, Y = 122.977},
			FigureRespawn	{Tag = "upack_0304", X = 290.159, Y = 126.54},
			FigureRespawn	{Tag = "upack_0305", X = 286.701, Y = 129.02},
			FigureRespawn	{Tag = "upack_0306", X = 284.399, Y = 133.995},

			FigureLookAtDirection {Tag = "upack_0301", Direction = 126},
			FigureLookAtDirection {Tag = "upack_0302", Direction = 154},
			FigureLookAtDirection {Tag = "upack_0303", Direction = 103},
			FigureLookAtDirection {Tag = "upack_0304", Direction = 131},
			FigureLookAtDirection {Tag = "upack_0305", Direction = 97},
			FigureLookAtDirection {Tag = "upack_0306", Direction = 97},

			MapFlagSetFalse {Name = "mf_P709_upack_03"},
			MapTimerStop {Name = "mt_P709_upack_03"},

		},
	},
	
-- Respawn Undead horde 05

	OnEvent
	{
		EventName = ">>> Respawn Undead horde 05 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_upack_05", Seconds = vUndeadRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "upack_0501", X = 310.215, Y = 179.682},
			FigureRespawn	{Tag = "upack_0502", X = 306.027, Y = 183.949},
			FigureRespawn	{Tag = "upack_0503", X = 308.028, Y = 186.362},
			FigureRespawn	{Tag = "upack_0504", X = 311.481, Y = 186.407},
			FigureRespawn	{Tag = "upack_0505", X = 306.486, Y = 191.305},
			FigureRespawn	{Tag = "upack_0506", X = 309.861, Y = 192.602},

			FigureLookAtDirection {Tag = "upack_0501", Direction = 34},
			FigureLookAtDirection {Tag = "upack_0502", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0503", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0504", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0505", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0506", Direction = 0},

			MapFlagSetFalse {Name = "mf_P709_upack_05"},
			MapTimerStop {Name = "mt_P709_upack_05"},

		},
	},
	
-- Respawn Undead horde 07

	OnEvent
	{
		EventName = ">>> Respawn Undead horde 07 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_upack_07", Seconds = vUndeadRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "upack_0701", X = 334.466, Y = 271.258},
			FigureRespawn	{Tag = "upack_0702", X = 355.711, Y = 272.783},
			FigureRespawn	{Tag = "upack_0703", X = 338.526, Y = 269.469},
			FigureRespawn	{Tag = "upack_0704", X = 343.319, Y = 265.795},
			FigureRespawn	{Tag = "upack_0705", X = 350.519, Y = 271.221},
			FigureRespawn	{Tag = "upack_0706", X = 343.236, Y = 270.604},
			FigureRespawn	{Tag = "upack_0707", X = 340.408, Y = 278.746},
			FigureRespawn	{Tag = "upack_0708", X = 346.247, Y = 281.556},
			FigureRespawn	{Tag = "upack_0709", X = 353.38, Y = 281.519},

			FigureLookAtDirection {Tag = "upack_0701", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0702", Direction = 28},
			FigureLookAtDirection {Tag = "upack_0703", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0704", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0705", Direction = 57},
			FigureLookAtDirection {Tag = "upack_0706", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0707", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0708", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0709", Direction = 0},

			MapFlagSetFalse {Name = "mf_P709_upack_07"},
			MapTimerStop {Name = "mt_P709_upack_07"},

		},
	},

-- Respawn Undead horde 09

	OnEvent
	{
		EventName = ">>> Respawn Undead horde 09 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_upack_09", Seconds = vUndeadRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "upack_0901", X = 527.429, Y = 307.219},
			FigureRespawn	{Tag = "upack_0902", X = 530.025, Y = 299.919},
			FigureRespawn	{Tag = "upack_0903", X = 532.385, Y = 303.607},
			FigureRespawn	{Tag = "upack_0904", X = 535.834, Y = 300.048},

			FigureLookAtDirection {Tag = "upack_0901", Direction = 331},
			FigureLookAtDirection {Tag = "upack_0902", Direction = 302},
			FigureLookAtDirection {Tag = "upack_0903", Direction = 0},
			FigureLookAtDirection {Tag = "upack_0904", Direction = 22},

			MapFlagSetFalse {Name = "mf_P709_upack_09"},
			MapTimerStop {Name = "mt_P709_upack_09"},

		},
	},
	
--*************************
--*                       *
--*   RESPAWN BEARPACKS   *
--*                       *
--*************************

-- Respawn Bearpack 01

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 01 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_01", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_0101", X = 363.319, Y = 167.643},
			FigureRespawn	{Tag = "bpack_0102", X = 368.65, Y = 170.132},

			FigureLookAtDirection {Tag = "bpack_0101", Direction = 58},
			FigureLookAtDirection {Tag = "bpack_0102", Direction = 234},

			MapFlagSetFalse {Name = "mf_P709_bpack_01"},
			MapTimerStop {Name = "mt_P709_bpack_01"},

		},
	},
	
-- Respawn Bearpack 03

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 03 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_03", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_0301", X = 411.131, Y = 209.911},
			FigureRespawn	{Tag = "bpack_0302", X = 413.99, Y = 210.919},
			FigureRespawn	{Tag = "bpack_0303", X = 407.285, Y = 215.087},
			FigureRespawn	{Tag = "bpack_0304", X = 421.39, Y = 221.715},

			FigureLookAtDirection {Tag = "bpack_0301", Direction = 159},
			FigureLookAtDirection {Tag = "bpack_0302", Direction = 217},
			FigureLookAtDirection {Tag = "bpack_0303", Direction = 103},
			FigureLookAtDirection {Tag = "bpack_0304", Direction = 6},

			MapFlagSetFalse {Name = "mf_P709_bpack_03"},
			MapTimerStop {Name = "mt_P709_bpack_03"},

		},
	},
	
-- Respawn Bearpack 05

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 05 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_05", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_0501", X = 434.409, Y = 90.1521},
			FigureRespawn	{Tag = "bpack_0502", X = 448.329, Y = 84.3271},
			FigureRespawn	{Tag = "bpack_0503", X = 432.226, Y = 92.5075},
			FigureRespawn	{Tag = "bpack_0504", X = 439.554, Y = 92.4589},

			FigureLookAtDirection {Tag = "bpack_0501", Direction = 228},
			FigureLookAtDirection {Tag = "bpack_0502", Direction = 46},
			FigureLookAtDirection {Tag = "bpack_0503", Direction = 34},
			FigureLookAtDirection {Tag = "bpack_0504", Direction = 274},

			MapFlagSetFalse {Name = "mf_P709_bpack_05"},
			MapTimerStop {Name = "mt_P709_bpack_05"},

		},
	},
	
-- Respawn Bearpack 07

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 07 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_07", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_0701", X = 544.086, Y = 45.9254},
			FigureRespawn	{Tag = "bpack_0702", X = 549.93, Y = 47.708},
			FigureRespawn	{Tag = "bpack_0703", X = 553.943, Y = 38.4401},
			FigureRespawn	{Tag = "bpack_0704", X = 561.726, Y = 45.4257},
			FigureRespawn	{Tag = "bpack_0705", X = 576.471, Y = 54.4027},

			FigureLookAtDirection {Tag = "bpack_0701", Direction = 34},
			FigureLookAtDirection {Tag = "bpack_0702", Direction = 160},
			FigureLookAtDirection {Tag = "bpack_0703", Direction = 148},
			FigureLookAtDirection {Tag = "bpack_0704", Direction = 126},
			FigureLookAtDirection {Tag = "bpack_0705", Direction = 0},

			MapFlagSetFalse {Name = "mf_P709_bpack_07"},
			MapTimerStop {Name = "mt_P709_bpack_07"},

		},
	},

-- Respawn Bearpack 09

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 09 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_09", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_0901", X = 688.665, Y = 135.62},
			FigureRespawn	{Tag = "bpack_0902", X = 686.612, Y = 130.33},

			FigureLookAtDirection {Tag = "bpack_0901", Direction = 0},
			FigureLookAtDirection {Tag = "bpack_0902", Direction = 138},

			MapFlagSetFalse {Name = "mf_P709_bpack_09"},
			MapTimerStop {Name = "mt_P709_bpack_09"},

		},
	},
	
-- Respawn Bearpack 11

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 11 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_11", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_1101", X = 485.996, Y = 263.485},
			FigureRespawn	{Tag = "bpack_1102", X = 487.231, Y = 264.974},

			FigureLookAtDirection {Tag = "bpack_1101", Direction = 74},
			FigureLookAtDirection {Tag = "bpack_1102", Direction = 74},

			MapFlagSetFalse {Name = "mf_P709_bpack_11"},
			MapTimerStop {Name = "mt_P709_bpack_11"},

		},
	},
	
-- Respawn Bearpack 13

	OnEvent
	{
		EventName = ">>> Respawn Bearpack 13 <<<",
		Conditions = 
		{

			SetUpdateInterval {Steps = 20},

			MapTimerIsElapsed {Name = "mt_P709_bpack_13", Seconds = vBearRespawnTimer},

		},
		Actions =
		{

			FigureRespawn	{Tag = "bpack_1301", X = 634.924, Y = 238.997},

			FigureLookAtDirection {Tag = "bpack_1301", Direction = 292},

			MapFlagSetFalse {Name = "mf_P709_bpack_13"},
			MapTimerStop {Name = "mt_P709_bpack_13"},

		},
	},

};