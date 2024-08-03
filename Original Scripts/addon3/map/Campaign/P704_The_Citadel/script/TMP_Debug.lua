--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")
dofile("addon3/map/Campaign/P704_The_Citadel/script/Globals.lua");

State
{
	StateName = "DEBUG",

	OnOneTimeEvent
	{
	EventName = ">>> TMP Init event <<<",
	Conditions = 
		{
			GameIsUnBlocked{},
		},
		Actions = 
		{

		},
	},
	

}
