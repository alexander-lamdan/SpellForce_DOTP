--********************************************************
--*                                                      *
--*   Icewastes of Shalibar :: base attack check script  *
--*                                                      *
--********************************************************

State
{

	StateName = "INIT",

-- base is under attack

	OnOneTimeEvent
	{
		EventName = ">>> base is under attack <<<",
		Conditions = 
		{

			QuestIsSolved {Quest = "IOS_MQ_2"},

			FigureTeamIsInRangeToEntity {Team = "tm_Undead", Range = 20, TargetTag = "norcaine_hq"},

		},
		Actions =
		{

			MinimapAlertSetToEntity {Tag = "norcaine_hq", Type = 2},

		},	

		GotoState = "BASE_ATTACK_FINISHED",

	},

};

State
{

	StateName = "BASE_ATTACK_FINISHED",

};