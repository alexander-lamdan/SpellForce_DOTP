-- ***************************************************************************
-- ** Handling the SQ05_TWIDDLE_TWO_TWIDDLE_FREE quest referencing to:      **
-- ** ShaikanWarrantOfficer.dlg                                             **
-- ** CS5a_TWIDDLE_IS_FREE                                                  **
-- ***************************************************************************


Branch08_Progress = {
	BEFORE_DLG		= 1,
	BEFORE_CS			= 2, -- used in lsd file
	CS_RUNNING		= 3, -- used in cs file
	CS_ENDED			= 4, -- used in cs file
};

local ftWarrantOfficer = "ShaikanWarrantOfficer";
local posWarrantOfficer = "Pos_ShaikanWarrantOfficer";

local posStartCS = "Pos_Trigger_CSTwiddle"
local distTwiddleCage = 17;



State --*********************************************************************************************************** BEFORE_DLG
{
	StateName = "BEFORE_DLG",



	OnOneTimeEvent ------------------------------------------- Enabling the dialog...
	{
		EventName = ">>> Takeover quest started -> Enabling the dialog on the ShaikanWarrantOfficer... <<<",
		Conditions = 
		{
			QuestIsKnown	{Player = "default", Quest = "MQ063_TAKEOVER"},
			QuestIsActive	{Player = "default", Quest = "ROTG_SQ_07_Twiddle"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "ShaikanWarrantOfficer"},
		},
	},

	OnOneTimeEvent ------------------------------------------- Starting timer when the dialog ended...
	{
		EventName = ">>> DLG ended, starting timer mt_P706_Twiddle... <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Progress_Twiddle", Value = Branch08_Progress.BEFORE_CS}, -- is set in ShaikanWarrantOfficer.lsd
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_Twiddle"},
		},
		GotoState = "BEFORE_CS", 
	},
};





State --*********************************************************************************************************** BEFORE_CS (and after the DLG)
{
	StateName = "BEFORE_CS",

	OnOneTimeEvent ------------------------------------------- Start the quest
	{
		EventName = ">>> mt_P706_Twiddle > 5: starting SQ05_TWIDDLE_TWO_TWIDDLE_FREE... <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_Twiddle", Seconds = 4},
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "SQ05_TWIDDLE_TWO_TWIDDLE_FREE"},
			FigureNpcSpawn	{Tag = "Twiddle2", Level = 10, UnitId = 2093, X = 30.0627, Y = 632.416, Team = "tm_Neutral"},
			FigureDirectionSet	{Tag = "Twiddle2", Direction = 33.4143},
			ObjectSpawn	{ObjectId	 = 2513, X = 30.0255, Y = 632.362, Direction = 17.1887, Tag = "Twiddle_Cage"},
			
			MapTimerStop	{Name = "mt_P706_Twiddle"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Start the cutscene when the cage is approached
	{
		EventName = ">>> Twiddle cage approached, no fighting, start the cutscene... <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Progress_Twiddle", Value = Branch08_Progress.BEFORE_CS},
			FigureIsNotInCombat	{Tag = ftAvatar},
			FigureIsInRangeToEntity	{Tag = ftAvatar, TargetTag = posStartCS, Range = distTwiddleCage},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P706_Progress_Twiddle", Value = Branch08_Progress.CS_RUNNING}, -- this makes the CS5A_TWIDDLE_IS_FREE to start immediately
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Cutscene ended
	{
		EventName = ">>> Cutscene ended <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_Progress_Twiddle", Value = Branch08_Progress.CS_ENDED}, -- set in CS5A_TWIDDLE_IS_FREE
		},
		Actions =
		{
		},
		GotoState = "CS_ENDED", 
	},	
};





State --*********************************************************************************************************** CS_ENDED
{
	StateName = "CS_ENDED",
	
	OnOneTimeEvent ------------------------------------------- starting the timed rewards...
	{
		EventName = ">>> Starting timer mt_P706_SQ05_TWIDDLE_Completed... <<<",
		Conditions = 
		{
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P706_SQ05_TWIDDLE_Completed"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- Set quest solved
	{
		EventName = ">>> mt_P706_SQ05_TWIDDLE_Completed > 5     Set quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ05_TWIDDLE_Completed", Seconds = 5 },
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SQ05_TWIDDLE_TWO_TWIDDLE_FREE"},
		},
	},
	
	OnOneTimeEvent ------------------------------------------- XP Reward
	{
		EventName = ">>> mt_P706_SQ05_TWIDDLE_Completed > 10    XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ05_TWIDDLE_Completed", Seconds = 10},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SQ05_TWIDDLE_TWO_TWIDDLE_FREE.XP },			
		},
	},	
	
	OnOneTimeEvent ------------------------------------------- Item Reward: Twiddlium Staff
	{
		EventName = ">>> mt_P706_SQ05_TWIDDLE_Completed > 15    Item reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ05_TWIDDLE_Completed", Seconds = 15},
		},
		Actions =
		{
			AvatarItemEquipmentGive	{Player = "default", ItemId = 3002, Amount = 1}, -- Twiddlium Staff
		},
	},		
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> mt_P706_SQ05_TWIDDLE_Completed > 20    Autosave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_SQ05_TWIDDLE_Completed", Seconds = 20 },
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			DoAutoSave {},
		},
	},
};
