local distAvatar2ClansBoss = 50; -- start the cs when the avatara approaches the clans boss 
local ftClansBoss = "ClansBoss";

local otAvatarEntryPoint = "Pos_ClansBossScene_Avatar"; -- teleport the party here when the cs starts

local ftOrcSoldierToDie01 = "ClansDefenderMercenary1";
local ftOrcSoldierToDie02 = "ClansDefenderMercenary2";
local ftOrcSoldierToDie03 = "ClansDefenderMercenary3";
--local ftOrcSoldierToDie04 = "ClansDefenderMercenary4";
local ftOrcSoldierToDie05 = "ClansDefenderMercenary5";
--local ftOrcSoldierToDie06 = "ClansDefenderMercenary6";

--local ftOrcSoldierToDie07 = "ClansDefenderArcher1";
local ftOrcSoldierToDie08 = "ClansDefenderArcher2";
--local ftOrcSoldierToDie09 = "ClansDefenderArcher3";
local ftOrcSoldierToDie10 = "ClansDefenderArcher4";



local otPosHeroDie = "Pos_CS2a_OrcHeroDie";
--local ftHeroOrc_NPC_version = "OrcHero"; 
local otHeroOrc_Corpse_version= "OrcHeroCorpse";
local HeroOrc_Inventory_version = 702;



local _tRenderList = CutsceneFigureRenderList{Tag = ftAvatar}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'"..ftClansBoss.."'",
		"'"..ftHeroCaine.."'",
		"'"..ftHero1.."'",
		"'"..ftHero2.."'",
		"'"..ftCompCraig.."'",
		"'ClansDefenderMercenary1'",
		"'ClansDefenderMercenary2'",
		"'ClansDefenderMercenary3'",
		"'ClansDefenderMercenary4'",
		"'ClansDefenderMercenary5'",
		"'ClansDefenderMercenary6'",
		"'ClansDefenderArcher1'",
		"'ClansDefenderArcher2'",
		"'ClansDefenderArcher3'",
		"'ClansDefenderArcher4'",
		"'ShaikanFightScene1'",
		"'ShaikanFightScene2'",
		"'ShaikanFightScene3'",
		"'ShaikanFightScene4'",
		"'ShaikanFightScene5'",
		"'ShaikanFightScene6'",
		"'ShaikanFightScene7'",
		"'ShaikanFightScene8'",
		"'ShaikanFightScene9'",
		"'ShaikanFightScene10'",
		"'ShaikanFightScene11'",
		"'ShaikanFightScene12'",
		"'ShaikanFightScene13'",
		"'ShaikanFightScene14'",
		"'ShaikanFightScene15'",
		"'ShaikanFightScene16'",
		"'ShaikanFightScene17'",
	}
}

State
{
	StateName = "BEFORE_CS_01",

	OnOneTimeEvent
	{
		EventName = ">>> Starting the fights in advance... <<<",
		Conditions =
		{	
			GameIsUnBlocked{},
		},
		Actions =
		{
			FigureAbilityAdd	{Tag = "ShaikanFightScene1", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene2", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene3", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene4", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene5", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene6", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene7", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene8", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene9", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene10", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene11", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene12", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene13", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene14", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene15", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene16", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ShaikanFightScene17", AbilityId = Ability.Immortal},

			FigureAbilityAdd	{Tag = ftClansBoss, AbilityId = Ability.Immortal}, 		

			FigureAbilityAdd	{Tag = "ClansDefenderMercenary1", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderMercenary2", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderMercenary3", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderMercenary4", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderMercenary5", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderMercenary6", AbilityId = Ability.Immortal},

			FigureAbilityAdd	{Tag = "ClansDefenderArcher1", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderArcher2", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderArcher3", AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = "ClansDefenderArcher4", AbilityId = Ability.Immortal},
			
			PlayerKitTransfer	{Player = "pl_ShaikanFightScene", PlayerKit = "pk_ShaikanFightScene"},
		},
		GotoState = "REVEAL_FOW",
	},
};


State
{
	StateName = "REVEAL_FOW",

	OnOneTimeEvent 
	{
		EventName = ">>> Give some time to reveal the fow <<<",
		Conditions =
		{	
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = distAvatar2ClansBoss, TargetTag = ftClansBoss},

			-- to avoid concurrency issues:
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
		Actions =
		{	
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = ftClansBoss, Range = 20, Height = 30},			

			EntityTimerStart {Name = "et_CSTimer"},
		},
		GotoState = "INIT",
	},
};


State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Initializes things before the cutscene starts: shaikan figuretransfer <<<",
		Conditions =
		{	
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 2},

--			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = distAvatar2ClansBoss, TargetTag = ftClansBoss},
--
--			-- to avoid concurrency issues:
--			AvatarIsNotTalking	{},
--			GameInterfaceIsVisible {},
--			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
		Actions =
		{	
			CutsceneCombatOn	{}, -- TODO: test this
						
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			FigureAbilityAdd	{Tag = ftAvatar, AbilityId = Ability.Immortal}, 
			FigureAbilityAdd	{Tag = ftHeroCaine, AbilityId = Ability.Immortal}, 
			FigureAbilityAdd	{Tag = ftHero1, AbilityId = Ability.Immortal}, 
			FigureAbilityAdd	{Tag = ftHero2, AbilityId = Ability.Immortal},
			FigureAbilityAdd	{Tag = ftCompCraig, AbilityId = Ability.Immortal},

			FigureAbilityRemove {Tag = "ShaikanFightScene1", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene2", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene3", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene4", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene5", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene6", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene7", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene8", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene9", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene10", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene11", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene12", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene13", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene14", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene15", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene16", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "ShaikanFightScene17", AbilityId = Ability.Immortal},

			FigureHealthSet	{Tag = "ShaikanFightScene1", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene2", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene3", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene4", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene5", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene6", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene7", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene8", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene9", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene10", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene11", Percent = 10 }, -- blade
			FigureHealthSet	{Tag = "ShaikanFightScene12", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene13", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene14", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene15", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene16", Percent = 15 },
			FigureHealthSet	{Tag = "ShaikanFightScene17", Percent = 15 },
		
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = otAvatarEntryPoint},
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = otAvatarEntryPoint},
			FigureLookAtDirection {Tag = ftAvatar, Direction = 250},
			FigureLookAtDirection {Tag = ftAvatar, Direction = 250},

			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = otAvatarEntryPoint},
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = otAvatarEntryPoint},
			FigureLookAtDirection {Tag = ftHeroCaine, Direction = 250},
			FigureLookAtDirection {Tag = ftHeroCaine, Direction = 250},

			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = otAvatarEntryPoint},
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = otAvatarEntryPoint},
			FigureLookAtDirection {Tag = ftHero1, Direction = 250},
			FigureLookAtDirection {Tag = ftHero1, Direction = 250},

			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = otAvatarEntryPoint},
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = otAvatarEntryPoint},
			FigureLookAtDirection {Tag = ftHero2, Direction = 250},
			FigureLookAtDirection {Tag = ftHero2, Direction = 250},

			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = otAvatarEntryPoint},
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = otAvatarEntryPoint},
			FigureLookAtDirection {Tag = ftCompCraig, Direction = 250},
			FigureLookAtDirection {Tag = ftCompCraig, Direction = 250},
		},
		GotoState = "TAKE01",
	},
};

State
{
	StateName = "TAKE01",

	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> Start the cutscene <<<",
		Conditions =
		{	
		},
		Actions =
		{	
			_tRenderList,
		  CutsceneBegin{},

			CutsceneCombatOn	{},

			EntityTimerStart {Name = "et_CSTimer"},

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2a_OrcHeroDie_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "TAKE03",
	},
};

--State
--{
--	StateName = "TAKE01",
--
--	OnCutsceneFigureRespawnEvent 
--	{
--		EventName = ">>> Start the cutscene <<<",
--		Conditions =
--		{	
--		},
--		Actions =
--		{	
--			_tRenderList,
--		  CutsceneBegin{},
--
--			CutsceneCombatOn	{},
--
--			EntityTimerStart {Name = "et_CSTimer"},
--		},
--		Coop = false,
--		Tags = _tRenderList,
--		GotoState = "TAKE02",
--	},
--};
--
--
--
--
--State
--{
--	StateName = "TAKE02",
--	
--	OnOneTimeEvent
--	{
--		EventName = ">>> Show the fight <<<",
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
--		},
--		Actions =
--		{
--			CutsceneCombatOn	{},
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS2a_OrcHeroDie_Take01", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
----			CutsceneSay {TextTag = "CS2a_OrcHeroDie01", Tag = ftAvatar},
--			EntityTimerStart {Name = "et_CSTimer"},
--		},	
--		GotoState = "TAKE03",
--	},
--};






State
{
	StateName = "TAKE03",
	
	OnOneTimeEvent
	{
		EventName = ">>> Kill some Clans Soldiers, turn 1 <<<",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CutsceneCombatOn	{},

			FigureAbilityRemove {Tag = ftOrcSoldierToDie01, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie01},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie02, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie02},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie03, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie03},

--			FigureKill	{Tag = "ShaikanFightScene17"},
--			FigureKill	{Tag = "ShaikanFightScene16"},
--			FigureKill	{Tag = "ShaikanFightScene15"},
--			FigureKill	{Tag = "ShaikanFightScene14"},
--			FigureKill	{Tag = "ShaikanFightScene13"},
--			FigureKill	{Tag = "ShaikanFightScene12"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2a_OrcHeroDie_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE04",
	},
};







State
{
	StateName = "TAKE04",
	
	OnOneTimeEvent
	{
		EventName = ">>> Kill some Clans Soldiers, turn 2 <<<",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CutsceneCombatOn	{},
			
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie04, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie04},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie05, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie05},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie06, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie06},

--			FigureKill	{Tag = "ShaikanFightScene11"},
--			FigureKill	{Tag = "ShaikanFightScene10"},
--			FigureKill	{Tag = "ShaikanFightScene9"},
--			FigureKill	{Tag = "ShaikanFightScene8"},
--			FigureKill	{Tag = "ShaikanFightScene7"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2a_OrcHeroDie_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE05",
	},
};





State
{
	StateName = "TAKE05",
	
	OnOneTimeEvent
	{
		EventName = ">>> Kill some Clans Soldiers, turn 3 <<<",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 3},
		},
		Actions =
		{
			CutsceneCombatOn	{},
			
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie07, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie07},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie08, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie08},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie09, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie09},
			FigureAbilityRemove	{Tag = ftOrcSoldierToDie10, AbilityId = Ability.Immortal},
			FigureKill	{Tag = ftOrcSoldierToDie10},

--			FigureKill	{Tag = "ShaikanFightScene6"},
--			FigureKill	{Tag = "ShaikanFightScene5"},
--			FigureKill	{Tag = "ShaikanFightScene4"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2a_OrcHeroDie_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE06",
	},
};






State
{
	StateName = "TAKE06",
	
	OnOneTimeEvent
	{
		EventName = ">>> The fight is over <<<",
		Conditions =
		{
			FigureIsNotInCombat	{Tag = ftAvatar},
			FigureIsIdle	{Tag = ftAvatar},
--			FigureIsDead	{Tag = "ShaikanFightScene1"},
--			FigureIsDead	{Tag = "ShaikanFightScene2"},
--			FigureIsDead	{Tag = "ShaikanFightScene3"},
--			FigureIsDead	{Tag = "ShaikanFightScene4"},
--			FigureIsDead	{Tag = "ShaikanFightScene5"},
--			FigureIsDead	{Tag = "ShaikanFightScene6"},
--			FigureIsDead	{Tag = "ShaikanFightScene7"},
--			FigureIsDead	{Tag = "ShaikanFightScene8"},
--			FigureIsDead	{Tag = "ShaikanFightScene9"},
--			FigureIsDead	{Tag = "ShaikanFightScene10"},
--			FigureIsDead	{Tag = "ShaikanFightScene11"},
--			FigureIsDead	{Tag = "ShaikanFightScene12"},
--			FigureIsDead	{Tag = "ShaikanFightScene13"},
--			FigureIsDead	{Tag = "ShaikanFightScene14"},
--			FigureIsDead	{Tag = "ShaikanFightScene15"},
--			FigureIsDead	{Tag = "ShaikanFightScene16"},
--			FigureIsDead	{Tag = "ShaikanFightScene17"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2a_OrcHeroDie_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "TAKE07",
	},
};





State
{
	StateName = "TAKE07",
	
	OnOneTimeEvent
	{
		EventName = ">>> Clans Boss speaking... <<<",
		Conditions =
		{
			-- CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 2},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_OrcHero"},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 363.817, Y = 262.807},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 363.817, Y = 262.807},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 186.186},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 366.159, Y = 263.878},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 366.159, Y = 263.878},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 208.141},

			CutsceneFigureTeleport {Tag = "ClansBoss", X = 364.044, Y = 266.104}, --364.171, 266.424
			CutsceneFigureTeleport {Tag = "ClansBoss", X = 364.044, Y = 266.104}, --364.171, 266.424
		--	CutsceneFigureTeleport {Tag = "ClansBoss", X = 388.044, Y = 264.104},
			FigureDirectionSet {Tag = "ClansBoss", Direction = 16.2255},
		
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = ftCompCraig},
			CutsceneFigureWeaponsHide {Tag = ftClansBoss},
		
--			FigureTeleportToEntity	{Tag = ftHeroOrc_NPC_version, TargetTag = otPosHeroDie},
--			FigureTeleportToEntity	{Tag = ftHeroOrc_NPC_version, TargetTag = otPosHeroDie},
--			FigureLookAtDirection {Tag = ftHeroOrc_NPC_version, Direction = 270},
--			FigureLookAtDirection {Tag = ftHeroOrc_NPC_version, Direction = 270},
--			
--			FigureKill	{Tag = ftHeroOrc_NPC_version},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},

			CutsceneSay {TextTag = "CS2a_OrcHeroDie01", Tag = ftClansBoss},

			ObjectLootItemMiscAdd	{Tag = otHeroOrc_Corpse_version, DropChance = 100, ItemId = HeroOrc_Inventory_version},

			EntityTimerStart {Name = "et_CSTimer"},
		},	
		GotoState = "CS_Take02",
	},
};

-- kamera snitt
State
{
	StateName = "CS_Take02",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_02 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take03",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take03",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_03 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie03", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take04",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take04",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_04 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take05",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take05",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_05 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie05", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take06",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take06",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_06 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take07",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take07",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_07 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie07", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take08",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take08",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_08 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take09",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take09",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_09 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie09", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take10",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take10",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_10 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},		
		},	
		GotoState = "CS_Take11",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take11",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_11 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie11", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take12",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take12",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_12 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take13",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take13",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_13 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie13", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take14",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take14",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_14 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie14", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take15",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take15",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_15 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie15", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take16",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take16",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_16 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie16", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take17",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take17",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_17 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie17", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take18",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take18",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_18 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie18", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take19",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take19",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_19 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie19", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take20",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take20",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_20 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orcboss", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2a_OrcHeroDie20", Tag = ftClansBoss},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "SHUTDOWN",
	},	
};

State
{
	StateName = "SHUTDOWN",
	
	OnOneTimeEvent 
	{
		EventName = ">>> SHUTDOWN <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CutsceneFINISH",
	},	
};



State
{
	StateName = "CutsceneFINISH",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = ftHeroCaine},
			CutsceneFigureWeaponsShow {Tag = ftCompCraig},
			CutsceneFigureWeaponsShow {Tag = ftClansBoss},
		},	
		GotoState = "ENDED",
	},	
};







State
{
	StateName = "ENDED",
	
	OnOneTimeEvent
	{
		EventName = ">>> Remove Immortal abilities, Set mf_P706_CS2a_OrcHeroDie_Ended <<<",
		Conditions =
		{
		},
		Actions =
		{
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie01"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie02"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie03"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie04"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie05"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie06"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie07"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie08"},
			ObjectVanish {Tag = "InvisibleWall_CS2a_OrcHeroDie09"},

			FigureAbilityRemove	{Tag = ftAvatar, AbilityId = Ability.Immortal}, 
			FigureAbilityRemove	{Tag = ftHeroCaine, AbilityId = Ability.Immortal}, 
			FigureAbilityRemove	{Tag = ftHero1, AbilityId = Ability.Immortal}, 
			FigureAbilityRemove	{Tag = ftHero2, AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = ftCompCraig, AbilityId = Ability.Immortal},
			
--			FigureAbilityRemove	{Tag = ftClansBoss, AbilityId = Ability.Immortal}, 		
			

			FigureAbilityRemove	{Tag = "ClansDefenderMercenary1", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderMercenary2", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderMercenary3", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderMercenary4", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderMercenary5", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderMercenary6", AbilityId = Ability.Immortal},

			FigureAbilityRemove	{Tag = "ClansDefenderArcher1", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderArcher2", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderArcher3", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "ClansDefenderArcher4", AbilityId = Ability.Immortal},
			
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ClansBoss"},	
			
			MapFlagSetTrue {Name = "mf_P706_CS2a_OrcHeroDie_Ended"},
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},

		},
	},
};




