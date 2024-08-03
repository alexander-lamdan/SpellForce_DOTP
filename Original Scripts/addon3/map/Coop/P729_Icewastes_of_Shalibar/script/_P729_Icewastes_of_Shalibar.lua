State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human01", Amount = 20000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 20000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 20000},
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
			AvatarXPGive	{Player = "pl_Human01", Amount = 20000},
			AvatarXPGive	{Player = "pl_Human02", Amount = 20000},
			AvatarXPGive	{Player = "pl_Human03", Amount = 20000},
		},
	},
};