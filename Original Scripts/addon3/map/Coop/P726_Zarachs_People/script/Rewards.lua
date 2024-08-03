State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans01", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans02", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 4000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 4000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 4000},
		},
	},
};