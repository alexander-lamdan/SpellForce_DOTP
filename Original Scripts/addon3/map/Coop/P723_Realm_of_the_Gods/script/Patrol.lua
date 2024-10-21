State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack0301"},
			FigureIsIdle	{Tag = "pack0302"},
			FigureIsIdle	{Tag = "pack0303"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0301", TargetTag = "pack03patrol01"},
				Tags = {"pack03patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0302", TargetTag = "pack03patrol01"},
				Tags = {"pack03patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0303", TargetTag = "pack03patrol01"},
				Tags = {"pack03patrol02", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack0601"},
			FigureIsIdle	{Tag = "pack0602"},
			FigureIsIdle	{Tag = "pack0603"},
			FigureIsIdle	{Tag = "pack0604"},
			FigureIsIdle	{Tag = "pack0605"},
			FigureIsIdle	{Tag = "pack0606"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0601", TargetTag = "pack06patrol01"},
				Tags = {"pack06patrol02", "pack06patrol03", "pack06patrol04", "pack06patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0602", TargetTag = "pack06patrol01"},
				Tags = {"pack06patrol02", "pack06patrol03", "pack06patrol04", "pack06patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0603", TargetTag = "pack06patrol01"},
				Tags = {"pack06patrol02", "pack06patrol03", "pack06patrol04", "pack06patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0604", TargetTag = "pack06patrol01"},
				Tags = {"pack06patrol02", "pack06patrol03", "pack06patrol04", "pack06patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0605", TargetTag = "pack06patrol01"},
				Tags = {"pack06patrol02", "pack06patrol03", "pack06patrol04", "pack06patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0606", TargetTag = "pack06patrol01"},
				Tags = {"pack06patrol02", "pack06patrol03", "pack06patrol04", "pack06patrol05", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack0901"},
			FigureIsIdle	{Tag = "pack0902"},
			FigureIsIdle	{Tag = "pack0903"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0901", TargetTag = "pack09patrol01"},
				Tags = {"pack09patrol02", "pack09patrol03", "pack09patrol04", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0902", TargetTag = "pack09patrol01"},
				Tags = {"pack09patrol02", "pack09patrol03", "pack09patrol04", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack0903", TargetTag = "pack09patrol01"},
				Tags = {"pack09patrol02", "pack09patrol03", "pack09patrol04", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack1001"},
			FigureIsIdle	{Tag = "pack1002"},
			FigureIsIdle	{Tag = "pack1003"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1001", TargetTag = "pack10patrol01"},
				Tags = {"pack10patrol02", "pack10patrol03", "pack10patrol04", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1002", TargetTag = "pack10patrol01"},
				Tags = {"pack10patrol02", "pack10patrol03", "pack10patrol04", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1003", TargetTag = "pack10patrol01"},
				Tags = {"pack10patrol02", "pack10patrol03", "pack10patrol04", }
			},
		},
	},
		
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack1301"},
			FigureIsIdle	{Tag = "pack1302"},
			FigureIsIdle	{Tag = "pack1303"},
			FigureIsIdle	{Tag = "pack1304"},
			FigureIsIdle	{Tag = "pack1305"},
			FigureIsIdle	{Tag = "pack1306"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1301", TargetTag = "pack13patrol01"},
				Tags = {"pack13patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1302", TargetTag = "pack13patrol01"},
				Tags = {"pack13patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1303", TargetTag = "pack13patrol01"},
				Tags = {"pack13patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1304", TargetTag = "pack13patrol01"},
				Tags = {"pack13patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1305", TargetTag = "pack13patrol01"},
				Tags = {"pack13patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1306", TargetTag = "pack13patrol01"},
				Tags = {"pack13patrol02", }
			},
		},
	},	
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack1401"},
			FigureIsIdle	{Tag = "pack1402"},
			FigureIsIdle	{Tag = "pack1403"},
			FigureIsIdle	{Tag = "pack1404"},
			FigureIsIdle	{Tag = "pack1405"},
			FigureIsIdle	{Tag = "pack1406"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1401", TargetTag = "pack06patrol04"},
				Tags = {"pack06patrol05", "pack06patrol01", "pack06patrol02", "pack06patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1402", TargetTag = "pack06patrol04"},
				Tags = {"pack06patrol05", "pack06patrol01", "pack06patrol02", "pack06patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1403", TargetTag = "pack06patrol04"},
				Tags = {"pack06patrol05", "pack06patrol01", "pack06patrol02", "pack06patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1404", TargetTag = "pack06patrol04"},
				Tags = {"pack06patrol05", "pack06patrol01", "pack06patrol02", "pack06patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1405", TargetTag = "pack06patrol04"},
				Tags = {"pack06patrol05", "pack06patrol01", "pack06patrol02", "pack06patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1406", TargetTag = "pack06patrol04"},
				Tags = {"pack06patrol05", "pack06patrol01", "pack06patrol02", "pack06patrol03", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack1501"},
			FigureIsIdle	{Tag = "pack1502"},
			FigureIsIdle	{Tag = "pack1503"},
			FigureIsIdle	{Tag = "pack1504"},
			FigureIsIdle	{Tag = "pack1505"},
			FigureIsIdle	{Tag = "pack1506"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1501", TargetTag = "pack15patrol01"},
				Tags = {"pack15patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1502", TargetTag = "pack15patrol01"},
				Tags = {"pack15patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1503", TargetTag = "pack15patrol01"},
				Tags = {"pack15patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1504", TargetTag = "pack15patrol01"},
				Tags = {"pack15patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1505", TargetTag = "pack15patrol01"},
				Tags = {"pack15patrol02", }
			},
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "pack1506", TargetTag = "pack15patrol01"},
				Tags = {"pack15patrol02", }
			},
		},
	},	
};