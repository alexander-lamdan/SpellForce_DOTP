------------------------------------------------------------------------
--
--	weitere Platformscripte für diese Karte
--	für jedes script wird eine eigene Statemachine angelegt
--
----------------------------------------------------------------------------

return
{
	-- Quests:
	"MainQuest.lua",
	"MainQuest2.lua",
	"MainQuest3.lua",
	"MainQuest4.lua",

	"SideQuest.lua",

	"RespawnUnits0.lua",
	"RespawnUnits1.lua",
	"RespawnUnits2.lua",
	"RespawnUnits3.lua",
	"RespawnUnits4.lua",
	"RespawnUnits5.lua",

	"LeverHandling.lua",
	"OutcryEvents.lua",

--	"Kill_Reward.lua",

--------------------------

	-- Cutscenes:
	"CS01_Intro.lua",
	"CS02_Mainquest.lua",
	"CS03_Outro.lua",

--------------------------

	-- Mandatory on every level:
	"_Dragon.lua",
	"_DetectMapChange.lua",
	"_HeroAbilities.lua",

}
