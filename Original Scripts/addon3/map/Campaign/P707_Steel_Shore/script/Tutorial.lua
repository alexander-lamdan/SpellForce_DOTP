---------------------------------
-------------P707----------------
---------------------------------

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
			MapFlagSetTrue {Name = "mf_P707_TutOut"},
		},
	},
};
