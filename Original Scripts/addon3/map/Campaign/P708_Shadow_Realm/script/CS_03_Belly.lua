local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
--		"'pl_HumanHeroCaine'",
--		"'pl_HumanHeroFirst'",		
--		"'pl_HumanHeroSecond'",
--		"'pl_HumanHeroThird'",
		"'pl_HumanHeroOrc'",
		"'Surian'",
--		"'pl_HumanCompanionCraigHuman'",
		"'pl_HumanCompanionSariel'",
		"'ShadowWarrior'",
	}
}
--TODO MS5: add all heroes

State
{
	StateName = "INIT",
	
	-- palyainitkor nem csinalunk most semmit
	OnOneTimeEvent
	{
		EventName = ">>> CS_03_INIT <<<" ,
		Conditions =
		{
		},
		Actions =
		{
		},	
	},

	-- ha itt vizsgaljuk a cutscene start flaget, azaz innen indul a cutscene inditaskor
	-- itt megadjuk a renderlistet, hideoljuk a fegyvereket, teleportalunk stb
	-- innen minden allapot, azaz snitt kulon stateben van
	OnCutsceneFigureRespawnEvent
	{
		EventName = ">>> CS_Respawn <<<" ,
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P708_CS_03_Start"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P708_CS_03_Started"},

			_tRenderList,
		 	CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanCompanionSariel"},
			CutsceneFigureWeaponsHide {Tag = "ShadowWarrior"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 172.835, Y = 250.026},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 172.835, Y = 250.026},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 110},			
			
			CutsceneFigureTeleport {Tag = "Surian", X = 185.579, Y = 252.938},
			CutsceneFigureTeleport {Tag = "Surian", X = 185.579, Y = 252.938},
			FigureLookAtDirection {Tag = "Surian", Direction = 287.392},

			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 174.317, Y = 247.696},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroOrc", X = 174.317, Y = 247.696},
			FigureLookAtDirection {Tag = "pl_HumanHeroOrc", Direction = 135},			
			
			CutsceneFigureTeleport {Tag = "ShadowWarrior", X = 185.484, Y = 248.229},
			CutsceneFigureTeleport {Tag = "ShadowWarrior", X = 185.484, Y = 248.229},
			FigureLookAtDirection {Tag = "ShadowWarrior", Direction = 241.555},			
			
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 172.357, Y = 253.419},
			CutsceneFigureTeleport {Tag = "pl_HumanCompanionSariel", X = 172.357, Y = 253.419},
			FigureLookAtDirection {Tag = "pl_HumanCompanionSariel", Direction = 90},
			
			--FigureNpcSpawn {Tag = "Corrupted1", Level = 20, UnitId = 1311, X = 149.871, Y = 528.999, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted2", Level = 20, UnitId = 80, X = 177.901, Y = 495.825, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted3", Level = 20, UnitId = 79, X = 200.48, Y = 510.477, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted4", Level = 20, UnitId = 1072, X = 177.919, Y = 478.561, Team = "tm_Team2"},
			--FigureNpcSpawn {Tag = "Corrupted5", Level = 20, UnitId = 1073, X = 178.193, Y = 458.828, Team = "tm_Team2"},					
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_Take01",	
	},
};

--- elso kamera snitt
State
{
	StateName = "CS_Take01",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_01 <<<" ,
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BellyCS01", Tag = "ShadowWarrior"},
			EntityTimerStart	{Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent
	{
		EventName = ">>> Seal invoced Easy <<<",
		Conditions = 
		{
			GameDifficulty {Value = 1},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SealBeast", Level = 10, UnitId = 2052, TargetTag = "SealBeastBorn", Team = "tm_Neutral"},
			EffectStartAtEntityPosition {Tag = "Seal3Hide", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "Seal3Hide"},
		},
		GotoState = "CS_Take02",	
	},	
	OnOneTimeEvent
	{
		EventName = ">>> Seal invoced Norm <<<",
		Conditions = 
		{
			GameDifficulty {Value = 2},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SealBeast", Level = 12, UnitId = 2052, TargetTag = "SealBeastBorn", Team = "tm_Neutral"},
			EffectStartAtEntityPosition {Tag = "Seal3Hide", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "Seal3Hide"},
		},
		GotoState = "CS_Take02",	
	},	
	OnOneTimeEvent
	{
		EventName = ">>> Seal invoced  Diff <<<",
		Conditions = 
		{
			GameDifficulty {Value = 3},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SealBeast", Level = 13, UnitId = 2052, TargetTag = "SealBeastBorn", Team = "tm_Neutral"},
			EffectStartAtEntityPosition {Tag = "Seal3Hide", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "Seal3Hide"},
		},
		GotoState = "CS_Take02",	
	},	
	OnOneTimeEvent
	{
		EventName = ">>> Seal invoced <<<",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SealBeast", Level = 14, UnitId = 2052, TargetTag = "SealBeastBorn", Team = "tm_Neutral"},
			EffectStartAtEntityPosition {Tag = "Seal3Hide", File = "Effect_Spawn_Unit"},
			ObjectVanish {Tag = "Seal3Hide"},
		},
		GotoState = "CS_Take02",	
	},	

};
	

--- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Sariel", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BellyCS02", Tag = "pl_HumanCompanionSariel"},
			EntityTimerStart {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanCompanionSariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_emote_yes.ska"},
		},
		GotoState = "CS_SealRun",	
	},
};

State
{
	StateName = "CS_SealRun",
	
	OnOneTimeEvent
	{
		EventName = ">>> Seal running <<<",
		Conditions = 
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureForcedRunToEntity	{Tag = "SealBeast", TargetTag = "WPSecondBlock9"},
			MapFlagSetTrue {Name = "mf_P708_BeastGoDown"},
			QuestSetActive {Player = "default", Quest = "SSSR_MQ_05_5"},
			FigureLootItemMiscAdd	{Tag = "SealBeast", DropChance = 100, ItemId = 722},
			EntityTimerStart {Name = "et_CStimer"},			
		},
		GotoState = "CS_Take03",	
	},	
};

--- kamera snitt
State
{
	StateName = "CS_Take03",
	
	OnOneTimeEvent 
	{
		EventName = ">>> CS_Take_03 <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanHeroOrc", File = "Efects_Unit_Darkness"},
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			CutsceneSay {TextTag = "BellyCS03", Tag = "pl_HumanHeroOrc"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
		GotoState = "CS_Take04",
	},	
};

--- kamera snitt
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
			CutsceneSay {TextTag = "BellyCS04", Tag = "pl_HumanAvatar"},
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_female_emote_point.ska"},
		},	
		GotoState = "CS_Take05",
	},	
};

--- kamera snitt
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
			CameraTakeAddToTrack {File = "CS03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BellyCS05", Tag = "Surian"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureTeamTransfer {Tag = "SealBeast", Team = "tm_Belly"},
			FigureFollowEntity	{Tag = "Surian", TargetTag = "SealBeast"},
		},			
		GotoState = "CS_Take06",
	},	
};

--- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_Ragul02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BellyCS06", Tag = "pl_HumanHeroOrc"},
			EntityTimerStop {Name = "et_CStimer"},		
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroOrc", File = "base/gfx/figures/npc/figure_npc_orc_champion_emote_taunt.ska"},	
		},	
		GotoState = "CS_Take07",
	},	
};

--- kamera snitt
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
			CameraTakeAddToTrack {File = "CS_Take_SW", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BellyCS07", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},			
		},	
	},	
	OnOneTimeEvent 
	{
		EventName = ">>> Anim <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},			
			FigureAnimPlayOnce	{Tag = "ShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_emote_point.ska"},	
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
		GotoState = "CS_Finish",
	},	
};

-- cutscene lezarasa, vege flag beallitasa
-- oriasi szopo: ha esc-et nyomsz, cutscene endkor idougras tortenik, szinte lehetetlen emiatt oda idoziteni, outcry is atugrodik, quest adas is.... ezerszer sirtam erte

State
{
	StateName = "CS_Finish",
	
	OnCutsceneFigureDespawnEvent	
	{
		EventName = ">>> CS_Finish <<<" ,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStop {Tag = "pl_HumanHeroOrc"},
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroOrc"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanCompanionSariel"},
			CutsceneFigureWeaponsShow {Tag = "ShadowWarrior"},
			
			FigureTeleportToEntity	{Tag = "Shadowwarrior", TargetTag = "SWPlace"},
			FigureDirectionSet	{Tag = "Shadowwarrior", Direction = 270},
			DialogSetEnabled	{Tag = "Shadowwarrior"},

			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P708_CS_03_Ended"},

			--DialogSetEnabled {Tag = "ShadowBelly"},
		},	
		GotoState = "CutsceneEnd",
	},	
};


State
{
	StateName = "CutsceneEnd",
};




