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
			FigureIsIdle	{Tag = "pack0304"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0301", TargetTag = "pack03patrol08"},
				Tags = {"pack03patrol01", "pack03patrol02", "pack03patrol03", "pack03patrol04", "pack03patrol05", "pack03patrol06", "pack03patrol07", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0302", TargetTag = "pack03patrol08"},
				Tags = {"pack03patrol01", "pack03patrol02", "pack03patrol03", "pack03patrol04", "pack03patrol05", "pack03patrol06", "pack03patrol07", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0303", TargetTag = "pack03patrol08"},
				Tags = {"pack03patrol01", "pack03patrol02", "pack03patrol03", "pack03patrol04", "pack03patrol05", "pack03patrol06", "pack03patrol07", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0304", TargetTag = "pack03patrol08"},
				Tags = {"pack03patrol01", "pack03patrol02", "pack03patrol03", "pack03patrol04", "pack03patrol05", "pack03patrol06", "pack03patrol07", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack0401"},
			FigureIsIdle	{Tag = "pack0402"},
			FigureIsIdle	{Tag = "pack0403"},
			FigureIsIdle	{Tag = "pack0404"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0401", TargetTag = "pack03patrol04"},
				Tags = {"pack03patrol05", "pack03patrol06", "pack03patrol07", "pack03patrol08", "pack03patrol01", "pack03patrol02", "pack03patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0402", TargetTag = "pack03patrol04"},
				Tags = {"pack03patrol05", "pack03patrol06", "pack03patrol07", "pack03patrol08", "pack03patrol01", "pack03patrol02", "pack03patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0403", TargetTag = "pack03patrol04"},
				Tags = {"pack03patrol05", "pack03patrol06", "pack03patrol07", "pack03patrol08", "pack03patrol01", "pack03patrol02", "pack03patrol03", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0404", TargetTag = "pack03patrol04"},
				Tags = {"pack03patrol05", "pack03patrol06", "pack03patrol07", "pack03patrol08", "pack03patrol01", "pack03patrol02", "pack03patrol03", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack0701"},
			FigureIsIdle	{Tag = "pack0702"},
			FigureIsIdle	{Tag = "pack0703"},
			FigureIsIdle	{Tag = "pack0704"},
			FigureIsIdle	{Tag = "pack0705"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0701", TargetTag = "pack07patrol01"},
				Tags = {"pack07patrol02", "pack07patrol03", "pack07patrol04", "pack07patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0702", TargetTag = "pack07patrol01"},
				Tags = {"pack07patrol02", "pack07patrol03", "pack07patrol04", "pack07patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0703", TargetTag = "pack07patrol01"},
				Tags = {"pack07patrol02", "pack07patrol03", "pack07patrol04", "pack07patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0704", TargetTag = "pack07patrol01"},
				Tags = {"pack07patrol02", "pack07patrol03", "pack07patrol04", "pack07patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0705", TargetTag = "pack07patrol01"},
				Tags = {"pack07patrol02", "pack07patrol03", "pack07patrol04", "pack07patrol05", }
			},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "pack0801"},
			FigureIsIdle	{Tag = "pack0802"},
			FigureIsIdle	{Tag = "pack0803"},
			FigureIsIdle	{Tag = "pack0804"},
			FigureIsIdle	{Tag = "pack0805"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0801", TargetTag = "pack08patrol01"},
				Tags = {"pack08patrol02", "pack08patrol03", "pack08patrol04", "pack08patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0802", TargetTag = "pack08patrol01"},
				Tags = {"pack08patrol02", "pack08patrol03", "pack08patrol04", "pack08patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0803", TargetTag = "pack08patrol01"},
				Tags = {"pack08patrol02", "pack08patrol03", "pack08patrol04", "pack08patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0804", TargetTag = "pack08patrol01"},
				Tags = {"pack08patrol02", "pack08patrol03", "pack08patrol04", "pack08patrol05", }
			},
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "pack0805", TargetTag = "pack08patrol01"},
				Tags = {"pack08patrol02", "pack08patrol03", "pack08patrol04", "pack08patrol05", }
			},
		},
	},
};