-- ***************************************************************************
-- ** Handling Side Quest 04 																								**
-- ***************************************************************************

local Adventurer1 = "pl_HumanAvatar";
local Adventurer2 = "pl_HumanHeroCaine";
local Dragon = "Surian";


State --**************************************************** INIT State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Cell hidden door is found <<<",
		Conditions = 
		{
			FigureIsDead {Tag = "Fugitive1"},
			FigureIsDead {Tag = "Fugitive2"},
			FigureIsDead {Tag = "Fugitive3"},
			FigureIsDead {Tag = "Fugitive4"},
			FigureIsDead {Tag = "Fugitive5"},
			FigureIsDead {Tag = "Fugitive6"},
			FigureIsDead {Tag = "Fugitive7"},
			FigureIsDead {Tag = "Fugitive8"},
			FigureIsDead {Tag = "Fugitive9"},
			FigureIsDead {Tag = "Fugitive10"},
			FigureIsDead {Tag = "Fugitive11"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P707_SQ_04_Done"},
			MapTimerStart	{Name = "mt_SSSR_SQ_04_completed"},
		},
	},
	
	OnOneTimeEvent ----------------------------------------- Quest solved
	{
		EventName = ">>> Quest solved <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_04_completed", Seconds = 1},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "SSSR_SQ_04"},
			AvatarFlagSetTrue	{Player = "pl_Human", Name = "af_Achievement_P707_Disinsection"},
		},
	},	
		
	OnOneTimeEvent ------------------------------------------- XP reward
	{
		EventName = ">>> XP reward <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_04_completed", Seconds = 5},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = Reward.SSSR_SQ_04.XP },
			MapFlagSetTrue{ Name = "mf_Autosave" },
		},
	},
	
	OnOneTimeEvent ------------------------------------------- AutoSave
	{
		EventName = ">>> AutoSave <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SSSR_SQ_04_completed", Seconds = 10},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SSSR_SQ_04_completed"},
		},
		GotoState = "SQ_04 FINISHED",
	},
};


State --**************************************************** Finish state
{
	StateName = "SQ_04 FINISHED",

	OnOneTimeEvent ------------------------------------------- Initializing
	{
		EventName = ">>> Quest SQ_04 finished <<<",
		Conditions = 
		{
		},
		Actions =
		{
		},
	},
};

