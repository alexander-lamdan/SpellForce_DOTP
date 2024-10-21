-- to enable and disable use:
--			MapFlagSetTrue	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},
--			MapFlagSetFalse	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},

-- to get info weather the player has teleported to one of the joueney stones (only while active)
--			MapFlagIsTrue	{Name = "mf_P706_Duel_EscapedFromPit"},
--			MapFlagIsFalse	{Name = "mf_P706_Duel_EscapedFromPit"},


-- NOTE: these are also defined in Branch03_Battles.lua:
local ftEnemyShaikanBoss = "EnemyShaikanBoss";
local PosShaikanBoss = { X = 149.943, Y = 261.886 };
local otPos_ArrivalPoint = "Pos_DuelPitArrivalPoint";


State
{
	StateName = "OFF",

	OnEvent 
	{
		EventName = ">>> switching on... <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},
		},
		Actions =
		{				
		},
		GotoState = "ON",				
	},
};


State
{
	StateName = "ON",

	OnEvent
	{
		EventName = ">>> Just used a Journey Stone to leave the highland. Teleporting back... <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Duel_EscapedFromPit"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_TrollHunter", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_Shaman", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_Spiritist", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_ClanBase", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_Steppe", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_ShaikanBase", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_ShaikanBaseWest", Range = 10},
				FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = "TravelStone_NorthernCrossroads", Range = 10},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_Duel_EscapedFromPit"},
			MapTimerStart	{Name = "mt_P706_Duel_EscapedFromPit"},
			
			EventReEnable	{Name = "TimeToTeleportBack"},
		},
	},

	OnOneTimeRepeatEvent ------------------------------------------- Time to teleport back
	{
		EventName = ">>> Time to teleport back... <<<",
		Name = "TimeToTeleportBack",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_EscapedFromPit", Seconds = 1},
		},
		Actions =
		{
			FigureTeleport	{Tag = ftEnemyShaikanBoss, X = PosShaikanBoss.X, Y = PosShaikanBoss.Y },
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = otPos_ArrivalPoint},		
			FigureLookAtEntity	{Tag = ftAvatar, TargetTag = ftEnemyShaikanBoss},
			
			EventReEnable	{Name = "TeleportedBack"},
		},
	},

	OnOneTimeRepeatEvent ------------------------------------------- Outcry and finish
	{
		EventName = ">>> Outcry and finish teleport back sequence... <<<",
		Name = "TeleportedBack",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Duel_EscapedFromPit", Seconds = 2},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryShaikanBossNoTeleport", Tag = ftEnemyShaikanBoss},
			MapFlagSetFalse	{Name = "mf_P706_Duel_EscapedFromPit"},
			MapTimerStop	{Name = "mt_P706_Duel_EscapedFromPit"},
		},
	},




	-------------------------------------------------------------------------------------------------------------
	OnEvent 
	{
		EventName = ">>> switching off... <<<",
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P706_Duel_TeleportOutPreventer_ON"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_Duel_EscapedFromPit"},				
			MapTimerStop	{Name = "mt_P706_Duel_EscapedFromPit"},
		},
		GotoState = "OFF",				
	},
};