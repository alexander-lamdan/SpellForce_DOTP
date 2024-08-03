State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		
		},
		Actions = 
		{	
			
		},
		GotoState = "MAIN",
	};
};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	

	-- ********************************************************************
	-- First Script
	-- ********************************************************************

	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = sPlayerName, Amount = 10000},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = sPlayerName, Amount = 10000},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = sPlayerName, Amount = 10000},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Realm", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Realm", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = sPlayerName, Amount = 10000},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Shaikan", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Shaikan", Amount = 1},
		},
		Actions = 
		{
			AvatarXPGive	{Player = sPlayerName, Amount = 10000},
		},
	};
end

State
{
	StateName = "MAIN",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		
		},
		Actions =
		{

		},
	},

};
