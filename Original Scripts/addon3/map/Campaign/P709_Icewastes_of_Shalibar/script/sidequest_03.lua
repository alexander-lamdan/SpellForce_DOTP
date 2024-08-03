--****************************************************
--*                                                  *
--*   Icewastes of Shalibar :: Side Quest 03 script  *
--*                                                  *
--*                 A Wolves Honour                  *
--*                                                  *
--****************************************************

State
{

	StateName = "INIT",

-- Ghost of the Great Wolf timer for arriving

	OnOneTimeEvent
	{
		EventName = ">>> Ghost of the Great Wolf timer for arriving <<<",
		Conditions = 
		{

			QuestIsSolved {Player = "default", Quest = "IOS_SUBQ_22"},

		},
		Actions =
		{
			
			FigureTeleport {Tag = "wolf_spirit_ghost", X = 24, Y = 424},
			
			FigureLookAtDirection {Tag = "wolf_spirit_ghost", Direction = 206},
			
			EffectStart {Tag = "wolf_spirit_ghost", File = "Effect_AreaDecay_Cast"},

		},

	},

-- Ghost of the Great Wolf arrives

	OnOneTimeEvent
	{
		EventName = ">>> Ghost of the Great Wolf arrives <<<",
		Conditions = 
		{

			QuestIsSolved {Player = "default", Quest = "IOS_SUBQ_22"},

			MapTimerIsElapsed	{Name = "mt_P709_FinishQuest", Seconds = 5},

		},
		Actions =
		{
			
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "great_wolf_spirit_dialog_marker_1"},
			
			DialogSetEnabled {Tag = "wolf_spirit_ghost"},
			
			DialogBegin	{Player = "default", Tag = "wolf_spirit_ghost"},
			
			MapTimerStop {Name = "mt_P709_FinishQuest"},

		},

	},

-- Initializing Side Quest #3

	OnOneTimeEvent
	{
		EventName = ">>> Initializing Side Quest #3 <<<",
		Conditions = 
		{

			MapFlagIsTrue	{Name = "mf_P709_SIDEQ_3_Accepted"},

		},
		Actions =
		{

			MapFlagSetTrue{ Name = "mf_Autosave" },

			QuestSetActive	{Player = "default", Quest = "IOS_SIDEQ_3"},
			QuestSetActive	{Player = "default", Quest = "IOS_SIDEQ_3_ELEN_SQ1"},

-- The avatar gets the Emblem of the Great Wolf's Ghost

			AvatarItemMiscGive {Player = "default", ItemId = 761, Amount = 1},

-- The avatar gets the Remains of the Great Wolf

			AvatarItemMiscGive {Player = "default", ItemId = 762, Amount = 1},

-- Vanish FX for the Wolf Spirit Ghost

			EffectStart {Tag = "wolf_spirit_ghost", File = "Effect_AreaDecay_Cast"},

			MapTimerStart	{Name = "mt_P709_WolfSpiritGhost"},

		},

	},
	
-- Wolf Spirit Ghost vanishes

	OnOneTimeEvent
	{
		EventName = ">>> Wolf Spirit Ghost vanishes <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_WolfSpiritGhost", Seconds = 1},

		},
		Actions =
		{

			FigureVanish {Tag = "wolf_spirit_ghost"},

		},

	},
	
--	Side Quest #3 - SAVING

	OnOneTimeEvent
	{
		EventName = ">>> Side Quest #3 - SAVING <<<",
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_P709_WolfSpiritGhost", Seconds = 20},

		},
		Actions =
		{

			MapTimerStop {Name = "mt_P709_WolfSpiritGhost"},

--			MapFlagSetTrue{ Name = "mf_Autosave" },

		},

		GotoState ="IOS_SIDEQ_3_FINISHED",

	},

};

-- Side Quest #3 finished
-- Side quest continues on level Stepping Stones

State
{

	StateName = "IOS_SIDEQ_3_FINISHED",

};