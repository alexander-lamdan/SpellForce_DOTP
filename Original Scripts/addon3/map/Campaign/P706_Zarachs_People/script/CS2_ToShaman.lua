local ObjectToApproach = "Cave3A_In";
local ApproachDistance = 22;

local FigureShaman = "Shaman";
local FigureGuard = "OrcEntryCaveGuardBoss";

local TeleportPos1 = "CS2_ToShaman_Pos1";
local TeleportPos2 = "CS2_ToShaman_Pos2";

local _tRenderList = CutsceneFigureRenderList{ Tag = ftAvatar }
_tRenderList.tModFuncs =
{
	Add =
	{
		"'"..ftHeroCaine.."'",
	--	"'"..ftHero1.."'",
	--	"'"..ftHero2.."'",
		"'"..ftCompCraig.."'",
		"'Shaman'",
		"'OrcEntryCaveGuardBoss'",
	}
}


State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent 
	{
		EventName = ">>> Avatar or any hero approached the Cave3A_In by 12m <<<",
		Conditions = -- if approached and if the quest has not yet started
		{
			QuestIsNotKnown	{Player = "default", Quest = "MQ02_MASKPARTS"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = ApproachDistance, TargetTag = ObjectToApproach},

			-- to avoid concurrency issues:
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible {},
			MapFlagIsFalse	{Name = "mf_P706_AvatarIsInCutscene"},
		},
		Actions =
		{			
			ObjectVanish {Tag = "InvisibleWall_CS2_ToShaman"},
			
			MapFlagSetTrue	{Name = "mf_P706_AvatarIsInCutscene"},

			FigureStop	{Tag = ftAvatar},
			FigureStop	{Tag = ftHeroCaine},
			FigureStop	{Tag = ftHero1},
			FigureStop	{Tag = ftHero2},

			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 444.108, Y = 136.184},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 444.108, Y = 136.184},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 176.654},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 446.821, Y = 136.374},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 446.821, Y = 136.374},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 200.486},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 440.808, Y = 135.845},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 440.808, Y = 135.845},
			FigureDirectionSet {Tag = "pl_HumanCompanionCraigHuman", Direction = 159.416},

			
		--[[	FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = TeleportPos1},
			FigureLookAtDirection {Tag = ftAvatar, Direction = 180},
			
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = TeleportPos1},
			FigureLookAtDirection {Tag = ftHeroCaine, Direction = 180},	]]--

			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = TeleportPos1},
			FigureLookAtDirection {Tag = ftHero1, Direction = 180},	

			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = TeleportPos1},
			FigureLookAtDirection {Tag = ftHero2, Direction = 180},	
		
		--[[FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = TeleportPos1},
			FigureLookAtDirection {Tag = ftCompCraig, Direction = 180},	]]--

			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = ftHeroCaine},
			CutsceneFigureWeaponsHide {Tag = ftCompCraig},
			CutsceneFigureWeaponsHide {Tag = "Shaman"},
			--CutsceneFigureWeaponsHide {Tag = "OrcEntryCaveGuardBoss"},
		  },
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_Take01",
	},
};

-- kamera snitt
State
{
	StateName = "CS_Take01",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
			--CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Orc", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "OrcEntryCaveGuardBoss", File = "base/gfx/figures/fraction_2/figure_orc_veteran_idlewar.ska"},
			CutsceneSay {TextTag = "CS2_ToShaman01", Tag = "OrcEntryCaveGuardBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman02", Tag = ftCompCraig},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman03", Tag = ftHeroCaine},
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
			CutsceneSay {TextTag = "CS2_ToShaman04", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Orc", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "OrcEntryCaveGuardBoss", File = "base/gfx/figures/fraction_2/figure_orc_veteran_idlespecial.ska"},
			CutsceneSay {TextTag = "CS2_ToShaman05", Tag = "OrcEntryCaveGuardBoss"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman06", Tag = ftHeroCaine},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman07", Tag = "pl_HumanAvatar"},
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
		--  CameraTrackClear {},
		--	CameraTakeAddToTrack {File = "CS_Take_XXXX", Tag = "default", TargetTag = "default"},
		--	CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman08", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Orc", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman09", Tag = "OrcEntryCaveGuardBoss"},
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
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman10", Tag = ftCompCraig},
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
			CameraTakeAddToTrack {File = "CS_Take_Orc", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "OrcEntryCaveGuardBoss", File = "base/gfx/figures/fraction_2/figure_orc_veteran_resolve.ska"},
			CutsceneSay {TextTag = "CS2_ToShaman11", Tag = "OrcEntryCaveGuardBoss"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take12",
	},	
};


State
{
	StateName = "CS_Take12",
	
	OnOneTimeEvent
	{
		EventName = ">>> CutsceneSayIsDone or Timer <<<",
		Conditions =
		{
			CutsceneSayIsDone {},	
		  --EntityTimerIsElapsed {Name = "et_CSTimer", Seconds = 4},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 637.399, Y = 257.897},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 637.399, Y = 257.897},
			FigureDirectionSet {Tag = "pl_HumanAvatar", Direction = 140.3},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 639.821, Y = 257.264},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 639.821, Y = 257.264},
			FigureDirectionSet {Tag = "pl_HumanHeroCaine", Direction = 117.382},

			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 635.649, Y = 260.875},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 635.649, Y = 260.875},
			FigureDirectionSet {Tag = "pl_HumanCompanionCraigHuman", Direction = 119.815},

			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 641.399, Y = 261.897}, -- angle: 281.663
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 643.821, Y = 260.264}, -- angle: 335.155
			FigureSimpleWalk {Tag = "pl_HumanCompanionCraigHuman", X = 639.649, Y = 263.875}, -- angle: 335.155

		--[[FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = TeleportPos2},	
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = TeleportPos2},
			FigureLookAtDirection {Tag = ftAvatar, Direction = 135},
			
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = TeleportPos2},
			FigureLookAtDirection {Tag = ftHeroCaine, Direction = 135},	]]--

			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = TeleportPos2},
			FigureLookAtDirection {Tag = ftHero1, Direction = 135},	

			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = TeleportPos2},
			FigureLookAtDirection {Tag = ftHero2, Direction = 135},

		--[[FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = TeleportPos2},
			FigureLookAtDirection {Tag = ftCompCraig, Direction = 135},	]]--

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS2_ToShaman_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman12", Tag = "Shaman"},
			EntityTimerStart {Name = "et_CSTimer"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman13", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman14", Tag = "Shaman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman15", Tag = ftHeroCaine},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman16", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman17", Tag = "Shaman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman18", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman19", Tag = "Shaman"},
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
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman20", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take21",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take21",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_21 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman21", Tag = "Shaman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take22",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take22",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_22 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman22", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take23",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take23",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_23 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman23", Tag = "Shaman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take24",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take24",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_24 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman24", Tag = ftCompCraig},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take25",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take25",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_25 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Shaman", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman25", Tag = "Shaman"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take26",
	},	
};

-- kamera snitt
State
{
	StateName = "CS_Take26",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_26 <<<" ,
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CS2_ToShaman26", Tag = "pl_HumanAvatar"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},

		Actions =
		{	
			EntityTimerStop	{Name = "et_CSTimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = ftHeroCaine},
			CutsceneFigureWeaponsShow {Tag = ftCompCraig},
			CutsceneFigureWeaponsShow {Tag = "Shaman"},
			--CutsceneFigureWeaponsShow {Tag = "OrcEntryCaveGuardBoss"},
			FadeInEffectStart{},
		
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = TeleportPos2},
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = TeleportPos2},
			FigureLookAtDirection	{Tag = ftAvatar, Direction = 135},
			FigureLookAtDirection	{Tag = ftAvatar, Direction = 135},
			FigureLookAtDirection	{Tag = ftHeroCaine, Direction = 135},
			FigureLookAtDirection	{Tag = ftHeroCaine, Direction = 135},
			FigureLookAtDirection	{Tag = ftHero1, Direction = 135},
			FigureLookAtDirection	{Tag = ftHero1, Direction = 135},
			FigureLookAtDirection	{Tag = ftHero2, Direction = 135},
			FigureLookAtDirection	{Tag = ftHero2, Direction = 135},
			FigureLookAtDirection	{Tag = ftCompCraig, Direction = 135},
			FigureLookAtDirection	{Tag = ftCompCraig, Direction = 135},		},	
		GotoState = "ENDED",
	},	
};

State
{
	StateName = "ENDED",
	
	OnOneTimeEvent
	{
		EventName = ">>> No event, switched to by a GotoState <<<",
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_P706_AvatarIsInCutscene"},
			MapFlagSetTrue {Name = "mf_P706_CS2_ToShaman_Ended"},
		},
	},
};