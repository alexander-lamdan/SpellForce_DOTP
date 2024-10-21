
-- itt szerepelnie kell minden cutscene szereplonek (csak ezek latszanak) kozben lehet crealni is

local TeleportPos1 = "mrk_cs02_avatar";
local TeleportPos2 = "mrk_cs02_wolfspirit";
local TeleportPos3 = "mrk_cs02_herocaine";
local TeleportPos4 = "mrk_cs02_herofirst";
local TeleportPos5 = "mrk_cs02_herosecond";
local TeleportPos6 = "mrk_cs02_herothird";
local TeleportPos7 = "mrk_cs02_heroorc";
local TeleportPos8 = "mrk_cs02_compcraig";
local TeleportPos9 = "mrk_cs02_compsariel";

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}

_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanAvatar'",
		"'pl_HumanHeroCaine'",
--		"'pl_HumanHeroFirst'",
--		"'pl_HumanHeroSecond'",
--		"'pl_HumanHeroThird'",
		"'pl_HumanHeroOrc'",
		"'pl_HumanCompanionCraigHuman'",
--		"'pl_HumanCompanionSariel'",
	}
}

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = "CS02_ELEN_INIT" ,
		Conditions =
		{
			-- ide mapflag a palyarol
		},
		Actions =
		{
		},
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P702_CS02_Elen_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			FigureStop	{Tag = "pl_HumanAvatar"},
			FigureStop	{Tag = "pl_HumanHeroCaine"},
--			FigureStop	{Tag = "pl_HumanHeroFirst"},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = TeleportPos1},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = TeleportPos3},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = TeleportPos3},
--			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = TeleportPos4},
--			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = TeleportPos4},
--			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = TeleportPos5},
--			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = TeleportPos5},
--			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = TeleportPos6},
--			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird", TargetTag = TeleportPos6},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = TeleportPos7},
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = TeleportPos7},
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = TeleportPos8},
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = TeleportPos8},
--			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = TeleportPos9},
--			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = TeleportPos9},
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = TeleportPos2},
			FigureLookAtEntity	{Tag = "pl_HumanHeroCaine", TargetTag = TeleportPos2},
--			FigureLookAtEntity	{Tag = "pl_HumanHeroFirst", TargetTag = TeleportPos2},
--			FigureLookAtEntity	{Tag = "pl_HumanHeroSecond", TargetTag = TeleportPos2},
--			FigureLookAtEntity	{Tag = "pl_HumanHeroThird", TargetTag = TeleportPos2},
			FigureLookAtEntity	{Tag = "pl_HumanHeroOrc", TargetTag = TeleportPos2},
			FigureLookAtEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = TeleportPos2},
--			FigureLookAtEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = TeleportPos2},
						
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
	--		CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroFirst"},
	--		CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSecond"},
	--		CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionCraigHuman"},
	--		CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionSariel"},
			
			--FigureNpcSpawnToEntity	{Tag = "npc_Ghost", Level = 1 , UnitId = 826, TargetTag = "pl_Humanavatar", Team = "tm_Neutral"},	
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "ElenCutscene01",
	},
};

--- elso kamera snitt
State
{
	StateName = "ElenCutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "npc_WolfSpirit", Level = 1 , UnitId = 1953, TargetTag = TeleportPos2, Team = "tm_Neutral"},
			CutsceneFigureTeleport {Tag = "npc_WolfSpirit", X = 247.229, Y = 47.4813},
			CutsceneFigureTeleport {Tag = "npc_WolfSpirit", X = 247.229, Y = 47.4813},
			FigureDirectionSet	{Tag = "npc_WolfSpirit", Direction = 72.5581},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 253.323, Y = 46.4214},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 253.323, Y = 46.4214},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 248.199},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 252.557, Y = 42.7692},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 252.557, Y = 42.7692},
			FigureDirectionSet	{Tag = "pl_HumanHeroCaine", Direction = 215.798},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 254.092, Y = 44.3029},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 254.092, Y = 44.3029},
			FigureDirectionSet	{Tag = "pl_HumanHeroOrc", Direction = 250.175},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 254.597, Y = 48.2576},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionCraigHuman", X = 254.597, Y = 48.2576},
			FigureDirectionSet	{Tag = "pl_HumanCompanionCraigHuman", Direction = 267.364},

			
			
			
			--FigureLookAtEntity	{Tag = "npc_WolfSpirit", TargetTag = "pl_HumanAvatar"},
			--FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "npc_WolfSpirit"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Elen_Take1", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- CutsceneSay {TextTag = "...", Tag = "pl_HumanAvatar"},
			
			EntityTimerStart {Name = "et_CStimer"},
			
		},	
		GotoState = "ElenCutscene02",
	},	
};

-- masodik kamera snitt
State
{
	StateName = "ElenCutscene02",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
     EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		-- CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Wolf", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS01", Tag = "npc_WolfSpirit"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene03",
	},	
};

State
{
	StateName = "ElenCutscene03",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
     --EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene04",
	},	
};

State
{
	StateName = "ElenCutscene04",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Craig", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS03", Tag = "pl_HumanCompanionCraigHuman"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene05",
	},	
};

State
{
	StateName = "ElenCutscene05",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Wolf", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS04", Tag = "npc_WolfSpirit"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene06",
	},	
};

State
{
	StateName = "ElenCutscene06",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene07",
	},	
};

State
{
	StateName = "ElenCutscene07",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Wolf", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS06", Tag = "npc_WolfSpirit"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene08",
	},	
};

State
{
	StateName = "ElenCutscene08",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS07", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene09",
	},	
};

State
{
	StateName = "ElenCutscene09",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Wolf", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS08", Tag = "npc_WolfSpirit"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene10",
	},	
};

State
{
	StateName = "ElenCutscene10",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Caine", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS09", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene11",
	},	
};

State
{
	StateName = "ElenCutscene11",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Wolf", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS10", Tag = "npc_WolfSpirit"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene12",
	},	
};

State
{
	StateName = "ElenCutscene12",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Avatar", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS11", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutscene13",
	},	
};

State
{
	StateName = "ElenCutscene13",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			-- EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Take_Wolf", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Elen_CS12", Tag = "npc_WolfSpirit"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutsceneVanish",
	},	
};



State
{
	StateName = "ElenCutsceneVanish",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
     	--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			FigureVanish	{Tag = "npc_WolfSpirit"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_Elen_Take1", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- CutsceneSay {TextTag = "StartCS02", Tag = "npc_Ghost"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "ElenCutsceneFINISH",
	},	
};

-- cutscene lezarasa, vege flag beallitasa

State
{
	StateName = "ElenCutsceneFINISH",
	OnCutsceneFigureDespawnEvent	
	{
		OnOneTimeEvent 
		{
			EventName = ">>> CS_Finish <<<" ,
			Conditions =
			{
			
			},
			Actions =
			{
				EntityTimerStart {Name = "et_CStimer"},			
			},	
		},		

		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
--			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroFirst"},
--			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSecond"},
--			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroThird"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionCraigHuman"},
--			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionSariel"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P702_Elen_SQ21_Accepted"},
			MapFlagSetTrue {Name = "mf_P702_CS02_Elen_End"},
			MapFlagSetFalse {Name = "mf_P702_CS02_Elen_Start"},
			CutsceneEnd	{},	
		},	
		GotoState = "ElenCutsceneEnd",
	},	
};

State
{
	StateName = "ElenCutsceneEnd",
	
};




