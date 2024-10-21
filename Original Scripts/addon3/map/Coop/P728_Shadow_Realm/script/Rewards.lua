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
			AvatarXPGive	{Player = "pl_Human01", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2300},
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
			FigureIsDead	{Tag = "pack0205"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			FigureIsDead	{Tag = "pack0304"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2300},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2300},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human02", Amount = 2300},
			AvatarXPGive	{Player = "pl_Human03", Amount = 2300},
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
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			FigureIsDead	{Tag = "pack0705"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			FigureIsDead	{Tag = "pack0805"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			FigureIsDead	{Tag = "pack1107"},
			FigureIsDead	{Tag = "pack1108"},
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
			
			FigureIsDead	{Tag = "pack1201"},
			FigureIsDead	{Tag = "pack1202"},
			FigureIsDead	{Tag = "pack1203"},
			FigureIsDead	{Tag = "pack1204"},
			FigureIsDead	{Tag = "pack1205"},
			FigureIsDead	{Tag = "pack1206"},
			FigureIsDead	{Tag = "pack1207"},
			FigureIsDead	{Tag = "pack1208"},
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
			
			FigureIsDead	{Tag = "pack1301"},
			FigureIsDead	{Tag = "pack1302"},
			FigureIsDead	{Tag = "pack1303"},
			FigureIsDead	{Tag = "pack1304"},
			FigureIsDead	{Tag = "pack1305"},
			FigureIsDead	{Tag = "pack1306"},
			FigureIsDead	{Tag = "pack1307"},
			FigureIsDead	{Tag = "pack1308"},
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
			
			FigureIsDead	{Tag = "pack1401"},
			FigureIsDead	{Tag = "pack1402"},
			FigureIsDead	{Tag = "pack1403"},
			FigureIsDead	{Tag = "pack1404"},
			FigureIsDead	{Tag = "pack1405"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			FigureIsDead	{Tag = "pack1605"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 3000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 3000},
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
			FigureIsDead	{Tag = "pack1706"},
			FigureIsDead	{Tag = "pack1707"},
			FigureIsDead	{Tag = "pack1708"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 5000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 5000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 5000},
		},
	},
};