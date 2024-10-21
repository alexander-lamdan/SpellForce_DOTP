--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{

StateName = "INIT",
	
OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ6_Accepted"},

		},
		Actions =
		{
			MapFlagSetFalse{Name = "mf_SQ6_Available"},
			MapFlagSetTrue {Name = "mf_SQ6_QuestStart"},
			QuestSetActive	{Player = "default", Quest = "WGA3_SIDEQ_6"},
			
		},
		GotoState = "INQUEST",
	},
	
};
State
{

StateName = "INQUEST",

--Save the first survival

OnOneTimeEvent
		{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SQ6_QuestStart"},
			
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "SQ5_Sack_01", DropChance = 100, ItemId = 605},
			ObjectLootItemMiscAdd	{Tag = "SQ5_Sack_02", DropChance = 100, ItemId = 606},
			
		},
	},
---------------------
--   Sack1
---------------------
	
		OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 605, Amount = 1},
				
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_W1E", Level = 1, UnitId = 811, TargetTag = "SQ5_Sack1_Spawn", Team = "tm_Natural"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_W2E", Level = 1, UnitId = 811, TargetTag = "SQ5_Sack1_Spawn", Team = "tm_Natural"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_Horse1E", Level = 1, UnitId = 684, TargetTag = "SQ5_Sack1_Spawn", Team = "tm_Natural"},
			FigureRunToEntity	{Tag = "SQ5_Sack1_W1E", TargetTag = "SQ5_Sack1_W1Target"},
			FigureRunToEntity	{Tag = "SQ5_Sack1_W2E", TargetTag = "SQ5_Sack1_W2Target"},
			FigureRunToEntity	{Tag = "SQ5_Sack1_Horse1E", TargetTag = "SQ5_Sack1_Horse1Target"},
			FigureOutcry {TextTag = "OC_SQ6_SACK1", Tag = "SQ5_Sack1_W1E"},
			
		},
	},


	--Worker1
				OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 605, Amount = 1},
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack1_W1E", TargetTag = "SQ5_Sack1_W1Target", Range = 2},
				
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack1_W1E", Direction = 0, Tag = "SQ5_Sack1_W1EMarker"},		
			FigureVanish	{Tag = "SQ5_Sack1_W1E"},		
			ObjectVanish	{Tag = "SQ5_Sack1_W1Target"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_W1", Level = 1, UnitId = 696, TargetTag = "SQ5_Sack1_W1EMarker", Team = "tm_Natural"},		
			FigureFollowEntity	{Tag = "SQ5_Sack1_W1", TargetTag = "pl_HumanAvatar"},		
			FigureOutcry {TextTag = "OC_SQ6_SACK1UP", Tag = "SQ5_Sack1_W1"},
			FigureFollowEntity	{Tag = "SQ5_Sack1_Pig", TargetTag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "OC_SQ6_SACK1UP", Tag = "SQ5_Sack1_W1"},
		},
	},
	--Worker2
				OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 605, Amount = 1},	
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack1_W2E", TargetTag = "SQ5_Sack1_W2Target", Range = 2},
				
		},
		Actions =
		{
			
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack1_W2E", Direction = 0, Tag = "SQ5_Sack1_W2EMarker"},
			FigureVanish	{Tag = "SQ5_Sack1_W2E"},
			ObjectVanish	{Tag = "SQ5_Sack1_W2Target"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_W2", Level = 1, UnitId = 696, TargetTag = "SQ5_Sack1_W2EMarker", Team = "tm_Natural"},
			FigureFollowEntity	{Tag = "SQ5_Sack1_W2", TargetTag = "pl_HumanAvatar"},
		},
	},
	--Horse1
				OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 605, Amount = 1},
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack1_Horse1E", TargetTag = "SQ5_Sack1_Horse1Target", Range = 2},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack1_Horse1E", Direction = 0, Tag = "SQ5_Sack1_Horse1EMarker"},
			
			FigureVanish	{Tag = "SQ5_Sack1_Horse1E"},
			
			ObjectVanish	{Tag = "SQ5_Sack1_Horse1Target"},	
									
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack1_Horse1", Level = 1, UnitId = 262, TargetTag = "SQ5_Sack1_Horse1EMarker", Team = "tm_Natural"},
			
			FigureFollowEntity	{Tag = "SQ5_Sack1_Horse1", TargetTag = "pl_HumanAvatar"},
		},
	},
-----------
-- Sack 2
-----------

	OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 606, Amount = 1},
				
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack2_W1E", Level = 1, UnitId = 811, TargetTag = "SQ5_Sack2_Spawn", Team = "tm_Natural"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack2_W2E", Level = 1, UnitId = 811, TargetTag = "SQ5_Sack2_Spawn", Team = "tm_Natural"},
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack2_Horse1E", Level = 1, UnitId = 684, TargetTag = "SQ5_Sack2_Spawn", Team = "tm_Natural"},
			FigureRunToEntity	{Tag = "SQ5_Sack2_W1E", TargetTag = "SQ5_Sack2_W1Target"},
			FigureRunToEntity	{Tag = "SQ5_Sack2_W2E", TargetTag = "SQ5_Sack2_W2Target"},
			FigureRunToEntity	{Tag = "SQ5_Sack2_Horse1E", TargetTag = "SQ5_Sack2_Horse1Target"},
			FigureOutcry {TextTag = "OC_SQ6_SACK2", Tag = "SQ5_Sack2_W1E"},
			
		},
	},

-- Worker1

			OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 606, Amount = 1},
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack2_W1E", TargetTag = "SQ5_Sack2_W1Target", Range = 2},

		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack2_W1E", Direction = 0, Tag = "SQ5_Sack2_W1EMarker"},
			FigureVanish	{Tag = "SQ5_Sack2_W1E"},

			ObjectVanish	{Tag = "SQ5_Sack2_W1Target"},
				
			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack2_W1", Level = 1, UnitId = 696, TargetTag = "SQ5_Sack2_W1EMarker", Team = "tm_Natural"},

			FigureFollowEntity	{Tag = "SQ5_Sack2_W1", TargetTag = "pl_HumanAvatar"},

			FigureOutcry {TextTag = "OC_SQ6_SACK2UP", Tag = "SQ5_Sack2_W1"},
			
		},
	},
-- Worker2
	OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 606, Amount = 1},
				FigureIsInRangeToEntity	{Tag = "SQ5_Sack2_W2E", TargetTag = "SQ5_Sack2_W2Target", Range = 2},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack2_W2E", Direction = 0, Tag = "SQ5_Sack2_W2EMarker"},	
		
			FigureVanish	{Tag = "SQ5_Sack2_W2E"},

			ObjectVanish	{Tag = "SQ5_Sack2_W2Target"},

			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack2_W2", Level = 1, UnitId = 696, TargetTag = "SQ5_Sack2_W2EMarker", Team = "tm_Natural"},

			FigureFollowEntity	{Tag = "SQ5_Sack2_W2", TargetTag = "pl_HumanAvatar"},
	
		},
	},

-- Horse Sack2

	OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 606, Amount = 1},

				FigureIsInRangeToEntity	{Tag = "SQ5_Sack2_Horse1E", TargetTag = "SQ5_Sack2_Horse1Target", Range = 2},
		},
		Actions =
		{

			ObjectSpawnToEntity	{ObjectId = 1591, TargetTag = "SQ5_Sack2_Horse1E", Direction = 0, Tag = "SQ5_Sack2_Horse1EMarker"},

			FigureVanish	{Tag = "SQ5_Sack2_Horse1E"},

			ObjectVanish	{Tag = "SQ5_Sack2_Horse1Target"},						

			FigureNpcSpawnToEntity	{Tag = "SQ5_Sack2_Horse1", Level = 1, UnitId = 262, TargetTag = "SQ5_Sack2_Horse1EMarker", Team = "tm_Natural"},
		
			FigureFollowEntity	{Tag = "SQ5_Sack2_Horse1", TargetTag = "pl_HumanAvatar"},

		},
	},
	-- Avatar has everything
	OnOneTimeEvent
		{
		Conditions = 
		{
				AvatarHasItemMisc	{Player = "default", ItemId = 605, Amount = 1},
				AvatarHasItemMisc	{Player = "default", ItemId = 606, Amount = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SQ6_Finished"},
			FigureOutcry {TextTag = "OC_SQ6_ALLFOOD", Tag = "pl_HumanAvatar"},
			DialogSetEnabled {Tag = "Merchant_Odelle"},
		},
	},
	

--SQ1_AllEventsCompleted

	OnOneTimeEvent
		{
		Conditions = 
		{

				MapFlagIsTrue {Name = "mf_P701_SQ_6_Completed"},

		},
		Actions =
		{
				AvatarItemMiscTake	{Player = "default", ItemId = 605, Amount = 1},
				AvatarItemMiscTake	{Player = "default", ItemId = 606, Amount = 1},
				ObjectChange	{Tag = "MarketstallMeat", ObjectId = 328, X = 396.194, Y = 397.359, Direction = 90},
				ObjectChange	{Tag = "MarkettablePotatoes", ObjectId = 342, X = 400.367, Y = 386.465, Direction = 47.5555},
				ObjectChange	{Tag = "MarkettableTomatoes", ObjectId = 342, X = 403.833, Y = 387.565, Direction = 0},
				ObjectChange	{Tag = "MarketstallCheese", ObjectId = 335, X = 411.491, Y = 386.582, Direction = 0},
				ObjectChange	{Tag = "MarketstallJars", ObjectId = 334, X = 403.958, Y = 397.401, Direction = 90},
				QuestSetSolved	{Player = "default", Quest = "WGA3_SIDEQ_6"},
				FigureVanish	{Tag = "SQ5_Sack1_W1"},
				FigureVanish	{Tag = "SQ5_Sack1_W2"},
				FigureVanish	{Tag = "SQ5_Sack1_Horse1"},
				FigureVanish	{Tag = "SQ5_Sack2_W1"},
				FigureVanish	{Tag = "SQ5_Sack2_W2"},
				FigureVanish	{Tag = "SQ5_Sack2_Horse1"},
				FigureRunToEntity	{Tag = "SQ5_Sack1_Pig", TargetTag = "SQ5_Sack1_PigPlace"},
				AvatarXPGive	{Player = "default", Amount = 200},
		},
		GotoState = "ENDQUEST",
	},	
	
	
};
State
{
StateName = "ENDQUEST",
};
	
	
