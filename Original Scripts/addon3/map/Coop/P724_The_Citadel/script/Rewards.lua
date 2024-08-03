local freq = 50;

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0101"},
			FigureIsDead	{Tag = "pack0102"},
			FigureIsDead	{Tag = "pack0103"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0201"},
			FigureIsDead	{Tag = "pack0202"},
			FigureIsDead	{Tag = "pack0203"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0301"},
			FigureIsDead	{Tag = "pack0302"},
			FigureIsDead	{Tag = "pack0303"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0401"},
			FigureIsDead	{Tag = "pack0402"},
			FigureIsDead	{Tag = "pack0403"},
			FigureIsDead	{Tag = "pack0404"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0501"},
			FigureIsDead	{Tag = "pack0502"},
			FigureIsDead	{Tag = "pack0503"},
			FigureIsDead	{Tag = "pack0504"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0601"},
			FigureIsDead	{Tag = "pack0602"},
			FigureIsDead	{Tag = "pack0603"},
			FigureIsDead	{Tag = "pack0604"},
			FigureIsDead	{Tag = "pack0605"},
			FigureIsDead	{Tag = "pack0606"},
			FigureIsDead	{Tag = "pack0607"},
			FigureIsDead	{Tag = "pack0608"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0701"},
			FigureIsDead	{Tag = "pack0702"},
			FigureIsDead	{Tag = "pack0703"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0801"},
			FigureIsDead	{Tag = "pack0802"},
			FigureIsDead	{Tag = "pack0803"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack0901"},
			FigureIsDead	{Tag = "pack0902"},
			FigureIsDead	{Tag = "pack0903"},
			FigureIsDead	{Tag = "pack0904"},
			FigureIsDead	{Tag = "pack0905"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1001"},
			FigureIsDead	{Tag = "pack1002"},
			FigureIsDead	{Tag = "pack1003"},
			FigureIsDead	{Tag = "pack1004"},
			FigureIsDead	{Tag = "pack1005"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1101"},
			FigureIsDead	{Tag = "pack1102"},
			FigureIsDead	{Tag = "pack1103"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1201"},
			FigureIsDead	{Tag = "pack1202"},
			FigureIsDead	{Tag = "pack1203"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1301"},
			FigureIsDead	{Tag = "pack1302"},
			FigureIsDead	{Tag = "pack1303"},
			FigureIsDead	{Tag = "pack1304"},
			FigureIsDead	{Tag = "pack1305"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 100},
			AvatarXPGive	{Player = "pl_Human02", Amount = 100},
			AvatarXPGive	{Player = "pl_Human03", Amount = 100},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1401"},
			FigureIsDead	{Tag = "pack1402"},
			FigureIsDead	{Tag = "pack1403"},
			FigureIsDead	{Tag = "pack1404"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1501"},
			FigureIsDead	{Tag = "pack1502"},
			FigureIsDead	{Tag = "pack1503"},
			FigureIsDead	{Tag = "pack1504"},
			FigureIsDead	{Tag = "pack1505"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1601"},
			FigureIsDead	{Tag = "pack1602"},
			FigureIsDead	{Tag = "pack1603"},
			FigureIsDead	{Tag = "pack1604"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1701"},
			FigureIsDead	{Tag = "pack1702"},
			FigureIsDead	{Tag = "pack1703"},
			FigureIsDead	{Tag = "pack1704"},
			FigureIsDead	{Tag = "pack1705"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1801"},
			FigureIsDead	{Tag = "pack1802"},
			FigureIsDead	{Tag = "pack1803"},
			FigureIsDead	{Tag = "pack1804"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack1901"},
			FigureIsDead	{Tag = "pack1902"},
			FigureIsDead	{Tag = "pack1903"},
			FigureIsDead	{Tag = "pack1904"},
			FigureIsDead	{Tag = "pack1905"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2001"},
			FigureIsDead	{Tag = "pack2002"},
			FigureIsDead	{Tag = "pack2003"},
			FigureIsDead	{Tag = "pack2004"},
			FigureIsDead	{Tag = "pack2005"},
			FigureIsDead	{Tag = "pack2006"},
			FigureIsDead	{Tag = "pack2007"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2101"},
			FigureIsDead	{Tag = "pack2102"},
			FigureIsDead	{Tag = "pack2103"},
			FigureIsDead	{Tag = "pack2104"},
			FigureIsDead	{Tag = "pack2105"},
			FigureIsDead	{Tag = "pack2106"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2201"},
			FigureIsDead	{Tag = "pack2202"},
			FigureIsDead	{Tag = "pack2203"},
			FigureIsDead	{Tag = "pack2204"},
			FigureIsDead	{Tag = "pack2205"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2301"},
			FigureIsDead	{Tag = "pack2302"},
			FigureIsDead	{Tag = "pack2303"},
			FigureIsDead	{Tag = "pack2304"},
			FigureIsDead	{Tag = "pack2305"},
			FigureIsDead	{Tag = "pack2306"},
			FigureIsDead	{Tag = "pack2307"},
			FigureIsDead	{Tag = "pack2308"},
			FigureIsDead	{Tag = "pack2309"},
			FigureIsDead	{Tag = "pack2310"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2401"},
			FigureIsDead	{Tag = "pack2402"},
			FigureIsDead	{Tag = "pack2403"},
			FigureIsDead	{Tag = "pack2404"},
			FigureIsDead	{Tag = "pack2405"},
			FigureIsDead	{Tag = "pack2406"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2501"},
			FigureIsDead	{Tag = "pack2502"},
			FigureIsDead	{Tag = "pack2503"},
			FigureIsDead	{Tag = "pack2504"},
			FigureIsDead	{Tag = "pack2505"},
			FigureIsDead	{Tag = "pack2506"},
			FigureIsDead	{Tag = "pack2507"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2601"},
			FigureIsDead	{Tag = "pack2602"},
			FigureIsDead	{Tag = "pack2603"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2701"},
			FigureIsDead	{Tag = "pack2702"},
			FigureIsDead	{Tag = "pack2703"},
			FigureIsDead	{Tag = "pack2704"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2801"},
			FigureIsDead	{Tag = "pack2802"},
			FigureIsDead	{Tag = "pack2803"},
			FigureIsDead	{Tag = "pack2804"},
			FigureIsDead	{Tag = "pack2805"},
			FigureIsDead	{Tag = "pack2806"},
			FigureIsDead	{Tag = "pack2807"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack2901"},
			FigureIsDead	{Tag = "pack2902"},
			FigureIsDead	{Tag = "pack2903"},
			FigureIsDead	{Tag = "pack2904"},
			FigureIsDead	{Tag = "pack2905"},
			FigureIsDead	{Tag = "pack2906"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3001"},
			FigureIsDead	{Tag = "pack3002"},
			FigureIsDead	{Tag = "pack3003"},
			FigureIsDead	{Tag = "pack3004"},
			FigureIsDead	{Tag = "pack3005"},
			FigureIsDead	{Tag = "pack3006"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3101"},
			FigureIsDead	{Tag = "pack3102"},
			FigureIsDead	{Tag = "pack3103"},
			FigureIsDead	{Tag = "pack3104"},
			FigureIsDead	{Tag = "pack3105"},
			FigureIsDead	{Tag = "pack3106"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3201"},
			FigureIsDead	{Tag = "pack3202"},
			FigureIsDead	{Tag = "pack3203"},
			FigureIsDead	{Tag = "pack3204"},
			FigureIsDead	{Tag = "pack3205"},
			FigureIsDead	{Tag = "pack3206"},
			FigureIsDead	{Tag = "pack3207"},
			FigureIsDead	{Tag = "pack3208"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3301"},
			FigureIsDead	{Tag = "pack3302"},
			FigureIsDead	{Tag = "pack3303"},
			FigureIsDead	{Tag = "pack3304"},
			FigureIsDead	{Tag = "pack3305"},
			FigureIsDead	{Tag = "pack3306"},
			FigureIsDead	{Tag = "pack3307"},
			FigureIsDead	{Tag = "pack3308"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3401"},
			FigureIsDead	{Tag = "pack3402"},
			FigureIsDead	{Tag = "pack3403"},
			FigureIsDead	{Tag = "pack3404"},
			FigureIsDead	{Tag = "pack3405"},
			FigureIsDead	{Tag = "pack3406"},
			FigureIsDead	{Tag = "pack3407"},
			FigureIsDead	{Tag = "pack3408"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3501"},
			FigureIsDead	{Tag = "pack3502"},
			FigureIsDead	{Tag = "pack3503"},
			FigureIsDead	{Tag = "pack3504"},
			FigureIsDead	{Tag = "pack3505"},
			FigureIsDead	{Tag = "pack3506"},
			FigureIsDead	{Tag = "pack3507"},
			FigureIsDead	{Tag = "pack3508"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3601"},
			FigureIsDead	{Tag = "pack3602"},
			FigureIsDead	{Tag = "pack3603"},
			FigureIsDead	{Tag = "pack3604"},
			FigureIsDead	{Tag = "pack3605"},
			FigureIsDead	{Tag = "pack3606"},
			FigureIsDead	{Tag = "pack3607"},
			FigureIsDead	{Tag = "pack3608"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3701"},
			FigureIsDead	{Tag = "pack3702"},
			FigureIsDead	{Tag = "pack3703"},
			FigureIsDead	{Tag = "pack3704"},
			FigureIsDead	{Tag = "pack3705"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3801"},
			FigureIsDead	{Tag = "pack3802"},
			FigureIsDead	{Tag = "pack3803"},
			FigureIsDead	{Tag = "pack3804"},
			FigureIsDead	{Tag = "pack3805"},
			FigureIsDead	{Tag = "pack3806"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack3901"},
			FigureIsDead	{Tag = "pack3902"},
			FigureIsDead	{Tag = "pack3903"},
			FigureIsDead	{Tag = "pack3904"},
			FigureIsDead	{Tag = "pack3905"},
			FigureIsDead	{Tag = "pack3906"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4001"},
			FigureIsDead	{Tag = "pack4002"},
			FigureIsDead	{Tag = "pack4003"},
			FigureIsDead	{Tag = "pack4004"},
			FigureIsDead	{Tag = "pack4005"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4101"},
			FigureIsDead	{Tag = "pack4102"},
			FigureIsDead	{Tag = "pack4103"},
			FigureIsDead	{Tag = "pack4104"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4201"},
			FigureIsDead	{Tag = "pack4202"},
			FigureIsDead	{Tag = "pack4203"},
			FigureIsDead	{Tag = "pack4204"},
			FigureIsDead	{Tag = "pack4205"},
			FigureIsDead	{Tag = "pack4206"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4301"},
			FigureIsDead	{Tag = "pack4302"},
			FigureIsDead	{Tag = "pack4303"},
			FigureIsDead	{Tag = "pack4304"},
			FigureIsDead	{Tag = "pack4305"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4401"},
			FigureIsDead	{Tag = "pack4402"},
			FigureIsDead	{Tag = "pack4403"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4501"},
			FigureIsDead	{Tag = "pack4502"},
			FigureIsDead	{Tag = "pack4503"},
			FigureIsDead	{Tag = "pack4504"},
			FigureIsDead	{Tag = "pack4505"},
			FigureIsDead	{Tag = "pack4506"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4601"},
			FigureIsDead	{Tag = "pack4602"},
			FigureIsDead	{Tag = "pack4603"},
			FigureIsDead	{Tag = "pack4604"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4701"},
			FigureIsDead	{Tag = "pack4702"},
			FigureIsDead	{Tag = "pack4703"},
			FigureIsDead	{Tag = "pack4704"},
			FigureIsDead	{Tag = "pack4705"},
			FigureIsDead	{Tag = "pack4706"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1200},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1200},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4801"},
			FigureIsDead	{Tag = "pack4802"},
			FigureIsDead	{Tag = "pack4803"},
			FigureIsDead	{Tag = "pack4804"},
			FigureIsDead	{Tag = "pack4805"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack4901"},
			FigureIsDead	{Tag = "pack4902"},
			FigureIsDead	{Tag = "pack4903"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5001"},
			FigureIsDead	{Tag = "pack5002"},
			FigureIsDead	{Tag = "pack5003"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5101"},
			FigureIsDead	{Tag = "pack5102"},
			FigureIsDead	{Tag = "pack5103"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5201"},
			FigureIsDead	{Tag = "pack5202"},
			FigureIsDead	{Tag = "pack5203"},
			FigureIsDead	{Tag = "pack5204"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5301"},
			FigureIsDead	{Tag = "pack5302"},
			FigureIsDead	{Tag = "pack5303"},
			FigureIsDead	{Tag = "pack5304"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5401"},
			FigureIsDead	{Tag = "pack5402"},
			FigureIsDead	{Tag = "pack5403"},
			FigureIsDead	{Tag = "pack5404"},
			FigureIsDead	{Tag = "pack5405"},
			FigureIsDead	{Tag = "pack5406"},
			FigureIsDead	{Tag = "pack5407"},
			FigureIsDead	{Tag = "pack5408"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5501"},
			FigureIsDead	{Tag = "pack5502"},
			FigureIsDead	{Tag = "pack5503"},
			FigureIsDead	{Tag = "pack5504"},
			FigureIsDead	{Tag = "pack5505"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5601"},
			FigureIsDead	{Tag = "pack5602"},
			FigureIsDead	{Tag = "pack5603"},
			FigureIsDead	{Tag = "pack5604"},
			FigureIsDead	{Tag = "pack5605"},
			FigureIsDead	{Tag = "pack5606"},
			FigureIsDead	{Tag = "pack5607"},
			FigureIsDead	{Tag = "pack5608"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5701"},
			FigureIsDead	{Tag = "pack5702"},
			FigureIsDead	{Tag = "pack5703"},
			FigureIsDead	{Tag = "pack5704"},
			FigureIsDead	{Tag = "pack5705"},
			FigureIsDead	{Tag = "pack5706"},
			FigureIsDead	{Tag = "pack5707"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5801"},
			FigureIsDead	{Tag = "pack5802"},
			FigureIsDead	{Tag = "pack5803"},
			FigureIsDead	{Tag = "pack5804"},
			FigureIsDead	{Tag = "pack5805"},
			FigureIsDead	{Tag = "pack5806"},
			FigureIsDead	{Tag = "pack5807"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack5901"},
			FigureIsDead	{Tag = "pack5902"},
			FigureIsDead	{Tag = "pack5903"},
			FigureIsDead	{Tag = "pack5904"},
			FigureIsDead	{Tag = "pack5905"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6001"},
			FigureIsDead	{Tag = "pack6002"},
			FigureIsDead	{Tag = "pack6003"},
			FigureIsDead	{Tag = "pack6004"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6101"},
			FigureIsDead	{Tag = "pack6102"},
			FigureIsDead	{Tag = "pack6103"},
			FigureIsDead	{Tag = "pack6104"},
			FigureIsDead	{Tag = "pack6105"},
			FigureIsDead	{Tag = "pack6106"},
			FigureIsDead	{Tag = "pack6107"},
			FigureIsDead	{Tag = "pack6108"},
			FigureIsDead	{Tag = "pack6109"},
			FigureIsDead	{Tag = "pack6110"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6201"},
			FigureIsDead	{Tag = "pack6202"},
			FigureIsDead	{Tag = "pack6203"},
			FigureIsDead	{Tag = "pack6204"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6301"},
			FigureIsDead	{Tag = "pack6302"},
			FigureIsDead	{Tag = "pack6303"},
			FigureIsDead	{Tag = "pack6304"},
			FigureIsDead	{Tag = "pack6305"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6401"},
			FigureIsDead	{Tag = "pack6402"},
			FigureIsDead	{Tag = "pack6403"},
			FigureIsDead	{Tag = "pack6404"},
			FigureIsDead	{Tag = "pack6405"},
			FigureIsDead	{Tag = "pack6406"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6501"},
			FigureIsDead	{Tag = "pack6502"},
			FigureIsDead	{Tag = "pack6503"},
			FigureIsDead	{Tag = "pack6504"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6601"},
			FigureIsDead	{Tag = "pack6602"},
			FigureIsDead	{Tag = "pack6603"},
			FigureIsDead	{Tag = "pack6604"},
			FigureIsDead	{Tag = "pack6605"},
			FigureIsDead	{Tag = "pack6606"},
			FigureIsDead	{Tag = "pack6607"},
			FigureIsDead	{Tag = "pack6608"},
			FigureIsDead	{Tag = "pack6609"},
			FigureIsDead	{Tag = "pack6610"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6701"},
			FigureIsDead	{Tag = "pack6702"},
			FigureIsDead	{Tag = "pack6703"},
			FigureIsDead	{Tag = "pack6704"},
			FigureIsDead	{Tag = "pack6705"},
			FigureIsDead	{Tag = "pack6706"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 140},
			AvatarXPGive	{Player = "pl_Human02", Amount = 140},
			AvatarXPGive	{Player = "pl_Human03", Amount = 140},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6801"},
			FigureIsDead	{Tag = "pack6802"},
			FigureIsDead	{Tag = "pack6803"},
			FigureIsDead	{Tag = "pack6804"},
			FigureIsDead	{Tag = "pack6805"},
			FigureIsDead	{Tag = "pack6806"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 160},
			AvatarXPGive	{Player = "pl_Human02", Amount = 160},
			AvatarXPGive	{Player = "pl_Human03", Amount = 160},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack6901"},
			FigureIsDead	{Tag = "pack6902"},
			FigureIsDead	{Tag = "pack6903"},
			FigureIsDead	{Tag = "pack6904"},
			FigureIsDead	{Tag = "pack6905"},
			FigureIsDead	{Tag = "pack6906"},
			FigureIsDead	{Tag = "pack6907"},
			FigureIsDead	{Tag = "pack6908"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 160},
			AvatarXPGive	{Player = "pl_Human02", Amount = 160},
			AvatarXPGive	{Player = "pl_Human03", Amount = 160},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack7001"},
			FigureIsDead	{Tag = "pack7002"},
			FigureIsDead	{Tag = "pack7003"},
			FigureIsDead	{Tag = "pack7004"},
			FigureIsDead	{Tag = "pack7005"},
			FigureIsDead	{Tag = "pack7006"},
			FigureIsDead	{Tag = "pack7007"},
			FigureIsDead	{Tag = "pack7008"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 160},
			AvatarXPGive	{Player = "pl_Human02", Amount = 160},
			AvatarXPGive	{Player = "pl_Human03", Amount = 160},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack7101"},
			FigureIsDead	{Tag = "pack7102"},
			FigureIsDead	{Tag = "pack7103"},
			FigureIsDead	{Tag = "pack7104"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 160},
			AvatarXPGive	{Player = "pl_Human02", Amount = 160},
			AvatarXPGive	{Player = "pl_Human03", Amount = 160},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack7201"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 160},
			AvatarXPGive	{Player = "pl_Human02", Amount = 160},
			AvatarXPGive	{Player = "pl_Human03", Amount = 160},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack7301"},
			FigureIsDead	{Tag = "pack7302"},
			FigureIsDead	{Tag = "pack7303"},
			FigureIsDead	{Tag = "pack7304"},
			FigureIsDead	{Tag = "pack7305"},
			FigureIsDead	{Tag = "pack7306"},
			FigureIsDead	{Tag = "pack7307"},
			FigureIsDead	{Tag = "pack7308"},
			FigureIsDead	{Tag = "pack7309"},
			FigureIsDead	{Tag = "pack7310"},
			FigureIsDead	{Tag = "pack7311"},
			FigureIsDead	{Tag = "pack7312"},
			FigureIsDead	{Tag = "pack7313"},
			FigureIsDead	{Tag = "pack7314"},
			FigureIsDead	{Tag = "pack7315"},
			FigureIsDead	{Tag = "pack7316"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 160},
			AvatarXPGive	{Player = "pl_Human02", Amount = 160},
			AvatarXPGive	{Player = "pl_Human03", Amount = 160},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			SetUpdateInterval {Steps = freq},
			
			FigureIsDead	{Tag = "pack7401"},
			FigureIsDead	{Tag = "pack7402"},
			FigureIsDead	{Tag = "pack7403"},
			FigureIsDead	{Tag = "pack7404"},
			FigureIsDead	{Tag = "pack7405"},

		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 120},
			AvatarXPGive	{Player = "pl_Human02", Amount = 120},
			AvatarXPGive	{Player = "pl_Human03", Amount = 120},
		},
	},
};