
--local MinimapMarker = 1
local buttonsize = 43

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		EventName = ">>> Start P703 <<<",
		Conditions = 
		{
			AvatarFlagIsFalse	{Player = "default", Name = "af_P704_MapCompleted"},
			GameIsUnBlocked{},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P703_CS01_Start"}, 											--Start MQ1
			--MapFlagSetTrue {Name = "mf_P703_MQ1_Completed"}, 										--Start MQ2
			--MapFlagSetTrue {Name = "mf_P703_MQ2_Completed"}, 										--Start MQ3
			--FigureTeleport	{Tag = "pl_HumanAvatar", X = 617.4, Y = 150.6 }, 		--Start MQ3
			--MapFlagSetTrue {Name = "mf_P703_MQ4_Cheat"}, 												--Start MQ4
			--MapFlagSetTrue {Name = "mf_P703_MQ5_Cheat"}, 												--Start MQ5
			--MapFlagSetTrue {Name = "mf_P703_zerbo_fourth"}, 										--Start Hero Select
			--MapFlagSetTrue {Name = "mf_P703_CS4_Gods_Start"}, 										--Start cs4
			
			BuildingAbilityAdd	{Tag = "portal_02", AbilityId = 95},
			GateSetClosed	{Tag = "gate_04"},
			
			FigureAbilityAdd	{Tag = "fighter_01", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_02", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_03", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_04", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_05", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_06", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_07", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_08", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_09", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_10", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_11", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_12", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_13", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_14", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_15", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_16", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_17", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_18", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_19", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_20", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_21", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_22", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_23", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_24", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_25", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_26", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_27", AbilityId = 94},
			FigureAbilityAdd	{Tag = "fighter_28", AbilityId = 94},
			
			
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Start P705 <<<",
		Conditions = 
		{
			AvatarFlagIsTrue	{Player = "default", Name = "af_P704_MapCompleted"},
			GameIsUnBlocked{},
		},
		Actions =
		{
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 628.508, Y = 600.225}, 		
			MapFlagSetTrue {Name = "mf_P705_CS05_Start"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> Finished P705 <<<",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P705_CS5_Ended", Seconds = 3},
		},
		Actions =
		{
			
			PlayerMapTravelAddon3 {Map = "Campaign/P706_Zarachs_People", TargetTag = "Map_Start_Point"},
		},
	},
	
	OnEvent
	{
		EventName = ">>> Autosave event 10 sec<<<",
		Conditions = 
		{
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			MapTimerIsElapsed {Name = "mt_P703_Autosave_10s", Seconds = 10},
		},
		
		Actions =
		{
			DoAutoSave(),
			MapTimerStop {Name = "mt_P703_Autosave_10s"},
		},
	},
	OnEvent
	{
		EventName = ">>> Autosave event 15 sec<<<",
		Conditions = 
		{
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			MapTimerIsElapsed {Name = "mt_P703_Autosave_15s", Seconds = 15},
		},
		
		Actions =
		{
			DoAutoSave(),
			MapTimerStop {Name = "mt_P703_Autosave_15s"},
		},
	},
	OnEvent
	{
		EventName = ">>> Autosave event 20 sec<<<",
		Conditions = 
		{
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			MapTimerIsElapsed {Name = "mt_P703_Autosave_20s", Seconds = 20},
		},
		
		Actions =
		{
			DoAutoSave(),
			MapTimerStop {Name = "mt_P703_Autosave_20s"},
		},
	},
	OnEvent
	{
		EventName = ">>> Autosave event 25 sec<<<",
		Conditions = 
		{
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			MapTimerIsElapsed {Name = "mt_P703_Autosave_25s", Seconds = 25},
		},
		
		Actions =
		{
			DoAutoSave(),
			MapTimerStop {Name = "mt_P703_Autosave_25s"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = ">>> every adventurer died (the death of the dragon is handled in dragon.lua) <<<",
		Conditions = 
		{
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
			FigureIsDead	{Tag = "pl_HumanHeroOrc"},
			FigureIsDead	{Tag = "pl_HumanHeroFirst"},
			FigureIsDead	{Tag = "pl_HumanHeroSecond"},
			FigureIsDead	{Tag = "pl_HumanHeroThird"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "pl_HumanAvatar", LocaTag = "IGMenuGameOver_Title"},
		},
	},
};