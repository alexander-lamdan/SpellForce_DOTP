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
			FigureIsDead	{Tag = "pack0104"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1300},
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
			FigureIsDead	{Tag = "pack0204"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1300},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1000},
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
			FigureIsDead	{Tag = "pack0505"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1600},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1600},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1600},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2000},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1300},
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
			FigureIsDead	{Tag = "pack0704"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1300},
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
			FigureIsDead	{Tag = "pack0804"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1300},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1000},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1000},
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
			FigureIsDead	{Tag = "pack1104"},
			FigureIsDead	{Tag = "pack1105"},
			FigureIsDead	{Tag = "pack1106"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2000},
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
			FigureIsDead	{Tag = "pack1204"},
			FigureIsDead	{Tag = "pack1205"},
			FigureIsDead	{Tag = "pack1206"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2000},
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
			FigureIsDead	{Tag = "pack1306"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2000},
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
			FigureIsDead	{Tag = "pack1405"},
			FigureIsDead	{Tag = "pack1406"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2000},
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
			FigureIsDead	{Tag = "pack1506"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2000},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1300},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1000},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1000},
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
			FigureIsDead	{Tag = "pack1906"},
			FigureIsDead	{Tag = "pack1907"},
			FigureIsDead	{Tag = "pack1908"},
			FigureIsDead	{Tag = "pack1909"},
			FigureIsDead	{Tag = "pack1910"},
			FigureIsDead	{Tag = "pack1911"},
			FigureIsDead	{Tag = "pack1912"},
			FigureIsDead	{Tag = "pack1913"},
			FigureIsDead	{Tag = "pack1914"},
			FigureIsDead	{Tag = "pack1915"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 5000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 5000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 5000},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 1000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 1000},
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
			FigureIsDead	{Tag = "pack2107"},
			FigureIsDead	{Tag = "pack2108"},
			FigureIsDead	{Tag = "pack2109"},
			FigureIsDead	{Tag = "pack2110"},
			FigureIsDead	{Tag = "pack2111"},
			FigureIsDead	{Tag = "pack2112"},
			FigureIsDead	{Tag = "pack2113"},
			FigureIsDead	{Tag = "pack2114"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 4500},
			AvatarXPGive	{Player = "pl_Human02", Amount = 4500},
			AvatarXPGive	{Player = "pl_Human03", Amount = 4500},
		},
	},
};