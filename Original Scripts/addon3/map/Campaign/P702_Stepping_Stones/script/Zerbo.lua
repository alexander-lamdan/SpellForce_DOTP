------------------------------------------------------
---- 03: Zerbo, god of the thieves and games ----
------------------------------------------------------


-- Nehezsegi valtozatok:
-- or01: 1-3: semmi, 4: fut, nem setal!
-- or02: 1-4: semmi
-- or03: 1-4: semmi
-- or04: 1-4: semmi
-- or05: 1-4: semmi
-- or06: 1: van, 2: orjarat 6-8 kozott, 3-4: orjarat 6-7-8 kozott
-- or07: 1: nincs, 2: orjarat 7-8 kozott, 3-4: orjarat 6-7-8 kozott
-- or08: 1: van, 2: orjarat 6-8 kozott, 3-4: orjarat 6-7-8 kozott
-- or09: 1-4: semmi (VAGY: 1-2: orjarat p1-p2-p3 kozott, 3-4: ugyanaz, csak p4 is orjaratba veve)
-- or10: 1-3: semmi, 4: fut
-- or11: 1-3: semmi, 4: fut
-- or12: 1-2: nem letezik, 3-4: van
-- or13: 1: nem letezik, 2-4: van
-- or14: 1: van, 2-3: Sétál 1-2-3-1 úton (3. pontnál 3 másodpercet vár,) 4: Sétál 1-2-3-1 útvonalon, nem vár
-- or15: 1: nem letezik, 2-4: van
-- or16: 1-4: semmi
-- or17: 1-4: semmi, csak Fruitvendor eventnél
-----------------------------------------------------
-- idezes 1: 01-06; 08-11
-- idezes 2: 07
-- idezes 3: 12-13
-- idezes 4: 14-15
-----------------------------------------------------

State
{
	StateName = "INIT",
	
	-- Zerbo fail
	
	OnOneTimeEvent
	{
		EventName = "Zerbo fail - step1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			OR
			{
				-- FigureIsInCombat	{Tag = "pl_HumanAvatar"},
				-- FigureIsInCombat	{Tag = "pl_HumanHeroCaine"},
				FigureIsInCombat	{Tag = "rts_ZerboOr01"},
				FigureIsInCombat	{Tag = "rts_ZerboOr02"},
				FigureIsInCombat	{Tag = "rts_ZerboOr03"},
				FigureIsInCombat	{Tag = "rts_ZerboOr04"},
				FigureIsInCombat	{Tag = "rts_ZerboOr05"},
				FigureIsInCombat	{Tag = "rts_ZerboOr06"},
				FigureIsInCombat	{Tag = "rts_ZerboOr07"},
				FigureIsInCombat	{Tag = "rts_ZerboOr08"},
				FigureIsInCombat	{Tag = "rts_ZerboOr09"},
				FigureIsInCombat	{Tag = "rts_ZerboOr10"},
				FigureIsInCombat	{Tag = "rts_ZerboOr11"},
				FigureIsInCombat	{Tag = "rts_ZerboOr12"},
				FigureIsInCombat	{Tag = "rts_ZerboOr13"},
				FigureIsInCombat	{Tag = "rts_ZerboOr14"},
				FigureIsInCombat	{Tag = "rts_ZerboOr15"},
				FigureIsInCombat	{Tag = "rts_ZerboOr16"},
				FigureIsInCombat	{Tag = "rts_ZerboOr17"},
				--MapFlagIsFalse	{Name = "mf_P702_Zerbo_MarriedMan_GuardsFight"},
				
				
				--FigureIsInCombat	{Tag = "npc_FlickedBoss"},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "DemonicStone", Range = 57 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "H-2", Range = 55 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_fb_06", Range = 20 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "DemonicStone", Range = 57 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "H-2", Range = 55 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_fb_06", Range = 20 },
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_GuardsInCombat"},
			DialogSetDisabled	{Tag = "npc_FruitVendor"},
			DialogSetDisabled	{Tag = "npc_BarrelBlower"},
			DialogSetDisabled	{Tag = "npc_MarriedMan"},
			FigureStop	{Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

OnOneTimeEvent
	{
		EventName = "Zerbo fail - step2",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_GuardsInCombat"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "ZerboFailTimer"},
		},
		GotoState = self,
	};


	
	
	
	
	
	
	-- Zerbo outcry
	
	OnOneTimeEvent
	{
		EventName = "Zerbo Outcry timer",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 7},
		},
		Actions = 
		{
			MapTimerStart	{Name = "ZerboOutcryTimer"},
		},
		GotoState = self,
	};

OnOneTimeEvent
	{
		EventName = "Zerbo Oucry 1",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZerboOutcryTimer", Seconds = 5},
			MapFlagIsFalse	{Name = "mf_P702_ZerboAccepted"},
		},
		Actions = 
		{
			MapTimerStop	{Name = "ZerboOutcryTimer"},
			FigureOutcry	{TextTag = "ZerboCry01", Tag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Fog of War Reveal diff 1-3",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FogOfWarReveal	{FogOfWarId = default, X = 575, Y = 358, Range = 150, Height = 50},
		},
		GotoState = self,
	};
	
	
	-- Beallitani: orok mozgasa (+riasztas eseten)!	
	
	
	-- Idezesek nehezsegtol fugoen
	
	OnOneTimeEvent
	{
		EventName = "Idezes_1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
		},
		Actions = 
		{
		
			-- kb. 15 or megidezese, beallitasa (rts units?).
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr01" , Level = 8, UnitId = 81, TargetTag = "mrk_or_01_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr02" , Level = 8, UnitId = 81, TargetTag = "mrk_or_02_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr05" , Level = 8, UnitId = 81, TargetTag = "mrk_or_05_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr06" , Level = 8, UnitId = 81, TargetTag = "mrk_or_06_1", PlayerKit = "pk_kit2"},
			
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr09" , Level = 8, UnitId = 81, TargetTag = "mrk_or_09_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr10" , Level = 8, UnitId = 81, TargetTag = "mrk_or_10_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr11" , Level = 8, UnitId = 81, TargetTag = "mrk_or_11_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr17" , Level = 8, UnitId = 81, TargetTag = "mrk_or_17_1", PlayerKit = "pk_kit2"},
			
			FigureTeamTransfer {Tag = "rts_ZerboOr01", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr02", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr05", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr06", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr08", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr09", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr10", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr11", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr17", Team = "tm_Team 2"},
						
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or01_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or01_4"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or02_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or05_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or06_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or09_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or10_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or11_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or17_1"},
			
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr15" , Level = 8, UnitId = 81, TargetTag = "mrk_or_15_1", PlayerKit = "pk_kit2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr15", Team = "tm_Team 2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or15_1"},
			
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr14" , Level = 8, UnitId = 81, TargetTag = "mrk_or_14_1", PlayerKit = "pk_kit2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr14", Team = "tm_Team 2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or14_1"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "Idezes_2",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			OR
			{
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions = 
		{
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr07" , Level = 8, UnitId = 81, TargetTag = "mrk_or_07_1", PlayerKit = "pk_kit2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr07", Team = "tm_Team 2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or07_1"},
			
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr13" , Level = 8, UnitId = 81, TargetTag = "mrk_or_13_1", PlayerKit = "pk_kit2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr13", Team = "tm_Team 2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or13_1"},
			
			
				
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Idezes_3",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions = 
		{
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr08" , Level = 8, UnitId = 81, TargetTag = "mrk_or_08_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr12" , Level = 8, UnitId = 81, TargetTag = "mrk_or_12_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr16" , Level = 8, UnitId = 81, TargetTag = "mrk_or_05_2", PlayerKit = "pk_kit2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr08", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr12", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr16", Team = "tm_Team 2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or12_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or16_1"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		EventName = "Idezes_4",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr03" , Level = 8, UnitId = 81, TargetTag = "mrk_or_03_1", PlayerKit = "pk_kit2"},
			FigureRtsSpawnToEntityWithTag {Tag = "rts_ZerboOr04" , Level = 8, UnitId = 81, TargetTag = "mrk_or_04_1", PlayerKit = "pk_kit2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr03", Team = "tm_Team 2"},
			FigureTeamTransfer {Tag = "rts_ZerboOr04", Team = "tm_Team 2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or03_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or04_1"},
			
			
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- Orok mozgatasa normal allapotban
	------------------------------------------------------



	-- or01: 1-3: semmi, 4: fut, nem setal!

	OnOneTimeRepeatEvent
	{
		EventName = "Patrol_1a_-_Diff123",
		Name = "Patrol_1a_-_Diff123",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr01", TargetTag = "mrk_or_01_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or01_1"},
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr01", TargetTag = "mrk_or_01_1"},
				--Points = default,	--{"200, 200","250, 250",}, 
				Tags = {	"mrk_or_01_2", "mrk_or_01_3", "mrk_or_01_4", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or01_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or01_2"},
			--EventReEnable	{Name = "Patrol_1b_-_Diff123"},
			EventReEnable	{Name = "Patrol_1b"},
		},
		GotoState = self,
	};	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Patrol 1a - Diff4",
		Name = "Patrol_1a_-_Diff4",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr01", TargetTag = "mrk_or_01_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or01_1"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_ZerboOr01", TargetTag = "mrk_or_01_1"},
				--Points = default,	--{"200, 200","250, 250",}, 
				Tags = {	"mrk_or_01_2",	"mrk_or_01_3", "mrk_or_01_4", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or01_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or01_2"},
			EventReEnable	{Name = "Patrol_1b"},
			--EventReEnable	{Name = "Patrol_1b_-_Diff4"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Patrol_1b",
		Name = "Patrol_1b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 40},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr01", TargetTag = "mrk_or_01_1", Range = 10 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or01_2"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or01_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or01_1"},
			EventReEnable	{Name = "Patrol_1a_-_Diff123"},
			EventReEnable	{Name = "Patrol_1a_-_Diff4"},
		},
		GotoState = self,
	};
	
--	OnOneTimeRepeatEvent
--	{
--		EventName = "Patrol 1b",
--		Name = "Patrol_1b",
--		Conditions = 
--		{
--			SetUpdateInterval	{Steps = 10},
--			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
--			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr01", TargetTag = "mrk_or_01_2", Range = 0.5 },
--			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or01_2"},
--		},
--		Actions = 
--		{
--			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or01_2"},
--			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or01_1"},
--			EventReEnable	{Name = "Patrol_1a_-_Diff123"},
--			EventReEnable	{Name = "Patrol_1a_-_Diff4"},
--		},
--		GotoState = self,
--	};



	-- Or 02 - kotott utvonal, csak tamad, ha meglatja a playert. (Esetleg: 1-3: setal, 4: fut)

	OnOneTimeRepeatEvent
	{
		EventName = "Patrol 2a",
		Name = "Patrol_2a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr02", TargetTag = "mrk_or_02_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or02_1"},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr02", TargetTag = "mrk_or_02_1"},
				--Points = default,	--{"200, 200","250, 250",}, 
				Tags = {"mrk_or_02_2",	"mrk_or_02_3", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or02_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or02_2"},
			EventReEnable	{Name = "Patrol_2b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Patrol 2b",
		Name = "Patrol_2b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 50},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr02", TargetTag = "mrk_or_02_1", Range = 10 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or02_2"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or02_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or02_1"},
			EventReEnable	{Name = "Patrol_2a"},
		},
		GotoState = self,
	};



	-- Or 03 - kötött útvonal plusz FruitVendorhoz riasztas eseten!
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_03_W1",
		Name = "or_03_W1",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr03", TargetTag = "mrk_or_03_1", Range = 1 },
			--MapFlagIsFalse	{Name = "mf_P702_Zerbo_FruitAlarm"},
			--MapFlagIsFalse	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr03", TargetTag = "mrk_or_03_2"},
			EventReEnable	{Name = "or_03_W2"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_03_W2",
		Name = "or_03_W2",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr03", TargetTag = "mrk_or_03_2", Range = 1 },
			--MapFlagIsFalse	{Name = "mf_P702_Zerbo_FruitAlarm"},
			--MapFlagIsFalse	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr03", TargetTag = "mrk_or_03_1"},
			EventReEnable	{Name = "or_03_W1"},
		},
		GotoState = self,
	};

	-- Or 04 - nem mozog, csak DemonicGuardianStone-hoz riasztas eseten!

	-- Or 05 - kotott utvonal, plusz DenonGuardianStone-hoz riasztas eseten.

	
	
	OnOneTimeEvent
	{
		EventName = "or_05_PatrolWalk",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsAlive	{Tag = "rts_ZerboOr05"},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "rts_ZerboOr05", TargetTag = "mrk_or_05_1"},
				Tags = {"mrk_or_05_2",},
			},
		},
		GotoState = self,
	};



	-- Or 06 - 06+07+08 (k)orjarat, egymas poziciojaba mozognak!
		-- or06: 1: van, 2: orjarat 6-8 kozott, 3-4: orjarat 6-7-8 kozott

	
	OnOneTimeRepeatEvent
	{
		EventName = "or_06_PW-D2-a",
		Name = "or_06_PW-D2-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or06_1"},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1", Range = 2 },
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_08_1", Range = 2 },
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_08_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or06_2"},
			EventReEnable	{Name = "or_06_PW-D2-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_06_PW-D2-b",
		Name = "or_06_PW-D2-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 40},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or06_2"},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_08_1", Range = 2 },
			--FigureIsInRangeToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1", Range = 2 },
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or06_1"},
			EventReEnable	{Name = "or_06_PW-D2-a"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_06_PatrolWalk-Diff34-a",
		Name = "or_06_PW-D34-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1", Range = 2 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or06_1"},
			OR
			{
				GameDifficulty {Value = 4},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1"},
				Tags = {	"mrk_or_07_1", "mrk_or_08_1", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or06_2"},
			EventReEnable	{Name = "or_06_PW-D34-b"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_06_PatrolWalk-Diff34-b",
		Name = "or_06_PW-D34-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 50},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1", Range = 5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or06_2"},
			OR
			{
				GameDifficulty {Value = 4},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or06_1"},
			EventReEnable	{Name = "or_06_PW-D34-a"},
		},
		GotoState = self,
	};


	-- Or 07 - 06+07+08 (k)orjarat, egymas poziciojaba mozognak!
		-- or07: 1: nincs, 2: orjarat 7-8 kozott, 3-4: orjarat 6-7-8 kozott


	OnOneTimeRepeatEvent
	{
		EventName = "or_07_PW-D2-a",
		Name = "or_07_PW-D2-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1", Range = 1 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or07_1"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_08_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or07_2"},
			EventReEnable	{Name = "or_07_PW-D2-b"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_07_PW-D2-b",
		Name = "or_07_PW-D2-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 50},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_08_1", Range = 1 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or07_2"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or07_1"},
			EventReEnable	{Name = "or_07_PW-D2-a"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_07_PatrolWalk-Diff34-a",
		Name = "or_07_PW-D34-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1", Range = 2 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or07_1"},
			OR
			{
				GameDifficulty {Value = 4},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1"},
				Tags = {	"mrk_or_08_1", "mrk_or_06_1", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or07_2"},
			EventReEnable	{Name = "or_07_PW-D34-b"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_07_PatrolWalk-Diff34-b",
		Name = "or_07_PW-D34-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 50},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1", Range = 5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or07_2"},
			OR
			{
				GameDifficulty {Value = 4},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or07_1"},
			EventReEnable	{Name = "or_07_PW-D34-a"},
		},
		GotoState = self,
	};


	-- Or 08 - 06+07+08 (k)orjarat, egymas poziciojaba mozognak!
		-- or08: 1: van, 2: orjarat 8-6 kozott, 3-4: orjarat 8-6-7 kozott

	
	OnOneTimeRepeatEvent
	{
		EventName = "or_08_PW-D2-a",
		Name = "or_08_PW-D2-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1", Range = 2 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or08_1"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_06_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_2"},
			EventReEnable	{Name = "or_08_PW-D2-b"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_08_PW-D2-b",
		Name = "or_08_PW-D2-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 50},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_06_1", Range = 2 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or08_2"},
			GameDifficulty {Value = 2},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_1"},
			EventReEnable	{Name = "or_08_PW-D2-a"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_08_PatrolWalk-Diff34-a",
		Name = "or_08_PW-D34-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1", Range = 2 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or08_1"},
			OR
			{
				GameDifficulty {Value = 4},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1"},
				Tags = {	"mrk_or_06_1", "mrk_or_07_1", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_2"},
			EventReEnable	{Name = "or_08_PW-D34-b"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_08_PatrolWalk-Diff34-b",
		Name = "or_08_PW-D34-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 50},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1", Range = 5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or08_2"},
			OR
			{
				GameDifficulty {Value = 4},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_1"},
			EventReEnable	{Name = "or_08_PW-D34-a"},
		},
		GotoState = self,
	};


	-- Or 09 - kotott utvonal, csak tamad, ha meglatja a playert.
		-- or09: 1-4: semmi (VAGY: 1-2: orjarat p1-p2-p3 kozott, 3-4: ugyanaz, csak p4 is orjaratba veve)
	

	OnOneTimeRepeatEvent
	{
		EventName = "or_09_PatrolWalk-a",
		Name = "or_09_PW-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr09", TargetTag = "mrk_or_09_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or09_1"},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr09", TargetTag = "mrk_or_09_1"},
				Tags = {	"mrk_or_09_2", "mrk_or_09_3", "mrk_or_09_4", "mrk_or_09_3", "mrk_or_09_2", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or09_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or09_2"},
			EventReEnable	{Name = "or_09_PW-b"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_09_PatrolWalk-b",
		Name = "or_09_PW-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr09", TargetTag = "mrk_or_09_2", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or09_2"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or09_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or09_1"},
			EventReEnable	{Name = "or_09_PW-a"},
		},
		GotoState = self,
	};
	

	-- Or 10 - 10+11 (k)orjarat, kotott utvonal (4 pont), MarriedMan elcsalhatja.
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_10_PatrolWalk-a-Diff123",
		Name = "or_10_PW-a-D123",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or10_1"},
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1"},
				Tags = {	"mrk_or_10_2", "mrk_or_11_1", "mrk_or_11_2", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or10_2"},
			EventReEnable	{Name = "or_10_PW-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_10_PatrolWalk-a-Diff4",
		Name = "or_10_PW-a-D4",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or10_1"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1"},
				Tags = {	"mrk_or_10_2", "mrk_or_11_1", "mrk_or_11_2", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or10_2"},
			EventReEnable	{Name = "or_10_PW-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_10_PatrolWalk-b",
		Name = "or_10_PW-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1", Range = 5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or10_2"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or10_1"},
			EventReEnable	{Name = "or_10_PW-a-D123"},
			EventReEnable	{Name = "or_10_PW-a-D4"},
		},
		GotoState = self,
	};
	
	
	

-- Or 11 - 10+11 (k)orjarat, kotott utvonal (4 pont), MarriedMan elcsalhatja.

	OnOneTimeRepeatEvent
	{
		EventName = "or_11_PatrolWalk-a-Diff123",
		Name = "or_11_PW-a-D123",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or11_1"},
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1"},
				Tags = {	"mrk_or_11_2", "mrk_or_10_1", "mrk_or_10_2", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or11_2"},
			EventReEnable	{Name = "or_11_PW-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_11_PatrolWalk-a-Diff4",
		Name = "or_11_PW-a-D4",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1", Range = 0.5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or11_1"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1"},
				Tags = {	"mrk_or_11_2", "mrk_or_10_1", "mrk_or_10_2", },
			},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or11_2"},
			EventReEnable	{Name = "or_11_PW-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_11_PatrolWalk-b",
		Name = "or_11_PW-b",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsNotInRangeToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1", Range = 5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or11_2"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or11_1"},
			EventReEnable	{Name = "or_11_PW-a-D123"},
			EventReEnable	{Name = "or_11_PW-a-D4"},
		},
		GotoState = self,
	};



	-- or14: 1: nincs, 2: van, 3-4: kotott utvonal: sétál 2-3
		
	OnOneTimeRepeatEvent		--Diff34: guard move to pos.2
	{
		EventName = "or_14_W-D34",
		Name = "or_14_W-D34",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or14_1"},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_1", Range = 1 },
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or14_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or14_2"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_2"},
			EventReEnable	{Name = "or_14_PW-D34-a"},
		},
	};

	OnOneTimeRepeatEvent
	{
		EventName = "or_14_PW-D34-a",
		Name = "or_14_PW-D34-a",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_2", Range = 0.5 },
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or14_2"},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_3"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or14_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or14_3"},
			EventReEnable	{Name = "or_14_PW-D34-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "or_14_PW-D34-b",
		Name = "or_14_PW-D34-b",
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_3", Range = 0.5 },
			OR
			{
				GameDifficulty {Value = 3},
				GameDifficulty {Value = 4},
			},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_or14_3"},
			SetUpdateInterval	{Steps = 40},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or14_3"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or14_2"},
			EventReEnable	{Name = "or_14_PW-D34-a"},
		},
		GotoState = self,
	};
	

	-- Or 16 - kotott utvonal - balance miatt kiveve 1-3 nehezsegnel

	
	
		OnOneTimeEvent
	{
		EventName = "or_16_PatrolWalk",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 110, X = 575, Y = 358},
			FigureIsAlive	{Tag = "rts_ZerboOr16"},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity	{Tag = "rts_ZerboOr16", TargetTag = "mrk_or_05_2"},
				Tags = {"mrk_or_05_1",},
			},
		},
		GotoState = self,
	};



	------------------------------------------------------
	-- Orok mozgatasa normal allapotban VEGE
	------------------------------------------------------


	
	------------------------------------------------------
	-- Egyeb esemenyek (hordoegetes, gyumolcslopas, demonkoaktivalas)
	------------------------------------------------------

	OnOneTimeEvent
	{
		EventName = "Barrel burn",
		Conditions = 
		{
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
			MapFlagIsTrue{Name = "mf_P702_ZerboBarrelBlow"},
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "obj_barrel", Range = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1587, TargetTag = "mrk_barrel", Direction = 0, Tag = "barrel_fire"},
			DialogSetDisabled	{Tag = "npc_BarrelBlower"},
			VisualTimerStart	{Seconds = 10},
			MapTimerStart	{Name = "BarrelFire"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "BarrelBlower running",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "BarrelFire", Seconds = 7 },
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry03", Tag = "npc_BarrelBlower"},
			FigurePathGoto	
			{
				Goto = FigureRunToEntity	{Tag = "npc_BarrelBlower", TargetTag = "H-1"},
				Tags = {"H-2",	"mrk_or_10_1",	"mrk_or_11_2",	"mrk_or_11_1",	"mrk_or_10_2", "mrk_or_09_1", },
			},		
		},
		GotoState = self,
	};


	OnOneTimeEvent
	{
		EventName = "Barrel blowing up",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "BarrelFire", Seconds = 10 },
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 2212, TargetTag = "mrk_barrel", Direction = 0, Tag = "barrel_boom"},
			ObjectVanish	{Tag = "barrel_fire"},
			ObjectVanish	{Tag = "obj_barrel"},
			ObjectVanish	{Tag = "bgroup1"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr06", TargetTag = "npc_BarrelBlower"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr07", TargetTag = "npc_BarrelBlower"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr08", TargetTag = "npc_BarrelBlower"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr12", TargetTag = "npc_BarrelBlower"},
			MapTimerStart	{Name = "BarrelFire2"},
			ObjectVanish	{Tag = "marketstall"},
			ObjectSpawnToEntity	{ObjectId = 833, TargetTag = "mrk_stand", Direction = 97, Tag = "stand_rom"},
			
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Barrel blowing up",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "BarrelFire", Seconds = 11.5 },
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry14", Tag = "rts_ZerboOr06"},
			MapTimerStop	{Name = "BarrelFire"},
			MapFlagSetTrue{Name = "mf_P702_ZerboHuntNow"},

		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Barrel-blowing damage - avatar",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "BarrelFire", Seconds = 10 },
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "mrk_barrel", Range = 7},
		},
		Actions = 
		{
			FigureHealthSubtract	{Tag = "pl_HumanAvatar", Percent = 10},
					
		},
		GotoState = self,
	};
	
	
	OnOneTimeRepeatEvent
	{
		EventName = "Hunt for the BarrelBlower",
		Name = "Hunt_BB",
		Conditions = 
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsTrue{Name = "mf_P702_ZerboHuntNow"},
			--MapTimerIsElapsed	{Name = "BarrelFire2", Seconds = 2 },
			--FigureIsNotInEntityRange	{Tag = "rts_ZerboOr05", TargetTag = "npc_BarrelBlower", Range = 1},
				FigureIsNotInEntityRange	{Tag = "rts_ZerboOr06", TargetTag = "npc_BarrelBlower", Range = 1},
				FigureIsNotInEntityRange	{Tag = "rts_ZerboOr07", TargetTag = "npc_BarrelBlower", Range = 1},
				FigureIsNotInEntityRange	{Tag = "rts_ZerboOr08", TargetTag = "npc_BarrelBlower", Range = 1},
				FigureIsNotInEntityRange	{Tag = "rts_ZerboOr10", TargetTag = "npc_BarrelBlower", Range = 1},
				FigureIsNotInEntityRange	{Tag = "rts_ZerboOr11", TargetTag = "npc_BarrelBlower", Range = 1},
				FigureIsNotInEntityRange	{Tag = "rts_ZerboOr12", TargetTag = "npc_BarrelBlower", Range = 1},
				QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			--FigureIsNotInEntityRange	{Tag = "rts_ZerboOr15", TargetTag = "npc_BarrelBlower", Range = 1},
			
		},
		Actions = 
		{
			--MapTimerStop	{Name = "BarrelFire"},
			--MapTimerStop	{Name = "BarrelFire2"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr06", TargetTag = "npc_BarrelBlower"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr07", TargetTag = "npc_BarrelBlower"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr08", TargetTag = "npc_BarrelBlower"},
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr05", TargetTag = "npc_BarrelBlower"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr12", TargetTag = "npc_BarrelBlower"},
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr15", TargetTag = "npc_BarrelBlower"},
			--MapTimerStart	{Name = "BarrelFire2"},
			EventReEnable	{Name = "Hunt_BB"},
		},
		GotoState = self,
	};
	
	
	
	OnOneTimeEvent
	{
		EventName = "Dead of the BarrelBlower",
		Conditions = 
		{
			-- MapFlagIsTrue{Name = "mf_P702_bar_fire"},
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "obj_barrel", Range = 15},
			OR
			{
				FigureIsInEntityRange	{Tag = "rts_ZerboOr03", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr05", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr06", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr07", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr08", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr09", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr10", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr11", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr12", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr13", TargetTag = "npc_BarrelBlower", Range = 1.2},
				FigureIsInEntityRange	{Tag = "rts_ZerboOr15", TargetTag = "npc_BarrelBlower", Range = 1.2},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "BarrelFire2"},
			FigureKill	{Tag = "npc_BarrelBlower"},
			FigureLootItemGenericAdd	{Tag = "npc_BarrelBlower_dead", DropChance = 100, Level = 7, Skill = 9},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr06", TargetTag = "npc_BarrelBlower_dead"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr07", TargetTag = "npc_BarrelBlower_dead"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr08", TargetTag = "npc_BarrelBlower_dead"},
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr05", TargetTag = "npc_BarrelBlower_dead"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr10", TargetTag = "npc_BarrelBlower_dead"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr11", TargetTag = "npc_BarrelBlower_dead"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr12", TargetTag = "npc_BarrelBlower_dead"},
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr15", TargetTag = "npc_BarrelBlower_dead"},
			MapTimerStart	{Name = "BarrelFire3"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_Barrelblower_dead"},
			MapFlagSetFalse{Name = "mf_P702_ZerboHuntNow"},		
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "Barrelblower dead: afterworks 1",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "BarrelFire3", Seconds = 5},
		},
		Actions = 
		{
			MapTimerStop	{Name = "BarrelFire3"},
			
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_2"},
			
			FigureWalkToEntity	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr12", TargetTag = "mrk_or_12_1"},
			
		},
		GotoState = self,
	};	

	OnOneTimeEvent
	{
		EventName = "Barrelblower dead: afterworks 2: Guard 6, 7, 8 restart",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "rts_ZerboOr06", TargetTag = "mrk_or_06_1", Range = 1},
			FigureIsInEntityRange	{Tag = "rts_ZerboOr07", TargetTag = "mrk_or_07_1", Range = 1},
			FigureIsInEntityRange	{Tag = "rts_ZerboOr08", TargetTag = "mrk_or_08_1", Range = 1},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_Barrelblower_dead"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or06_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or06_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or07_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or07_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or08_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or08_1"},
			EventReEnable	{Name = "or_06_PW-D2-a"},
			EventReEnable	{Name = "or_06_PW-D2-b"},
			EventReEnable	{Name = "or_06_PW-D34-a"},
			EventReEnable	{Name = "or_06_PW-D34-b"},
			EventReEnable	{Name = "or_07_PW-D2-a"},
			EventReEnable	{Name = "or_07_PW-D2-b"},
			EventReEnable	{Name = "or_07_PW-D34-a"},
			EventReEnable	{Name = "or_07_PW-D34-b"},
			EventReEnable	{Name = "or_08_PW-D2-a"},
			EventReEnable	{Name = "or_08_PW-D2-b"},
			EventReEnable	{Name = "or_08_PW-D34-a"},
			EventReEnable	{Name = "or_08_PW-D34-b"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Guard 10 11 restart - BarrelBlower and MarriedMan",
		Name = "Guard_10-11_restart",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1", Range = 0.5},
			FigureIsInEntityRange	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1", Range = 0.5},
			OR
			{
				MapFlagIsTrue	{Name = "mf_P702_Zerbo_Barrelblower_dead"},
				MapFlagIsTrue	{Name = "mf_P702_Zerbo_MarriedMan_End"},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or10_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or11_1"},
			EventReEnable	{Name = "or_10_PW-a-D123"},
			EventReEnable	{Name = "or_10_PW-a-D4"},
			EventReEnable	{Name = "or_10_PW-b"},
			EventReEnable	{Name = "or_11_PW-a-D123"},
			EventReEnable	{Name = "or_11_PW-a-D4"},
			EventReEnable	{Name = "or_11_PW-b"},
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- FruitVendor events
	------------------------------------------------------

	OnOneTimeEvent
	{
		EventName = "Avatarteleport",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ZerboFruitStolen"},
			--AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanAvatar", TargetTag = "mrk_FVAvatar"},
		},
	};


	OnOneTimeEvent
	{
		EventName = "Stolen Fruit",
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P702_ZerboFruitStolen"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			
			MapTimerStart	{Name = "FruitVendor"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_FruitAlarm"},
			DialogSetDisabled	{Tag = "npc_FruitVendor"},
		},
	};
	
	OnOneTimeEvent
	{
		EventName = "FruitVendor Alarm - Diff123",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "FruitVendor", Seconds = 10 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_FruitAlarm"},
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
			},
		},
		Actions = 
		{
			MapTimerStop	{Name = "FruitVendor"},
			FigureOutcry	{TextTag = "ZerboCry02", Tag = "npc_FruitVendor"},
			FigureRunToEntity	{Tag = "npc_FruitVendor", TargetTag = vFVMeet },
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr14", TargetTag = vFVMeet },
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr02", TargetTag = vFVMeet },
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr17", TargetTag = vFVMeet },
			
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_FVGuardsRun"},
		},
		GotoState = self,
	};
			
	OnOneTimeEvent
	{
		EventName = "FruitVendor Alarm - Diff4",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "FruitVendor", Seconds = 7 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_FruitAlarm"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			MapTimerStop	{Name = "FruitVendor"},
			FigureOutcry	{TextTag = "ZerboCry02", Tag = "npc_FruitVendor"},
			FigureRunToEntity	{Tag = "npc_FruitVendor", TargetTag = vFVMeet },
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_FVGuardsRun"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "FruitVendor_Alarm-Guards_run",
		Name = "FruitVendor_Alarm-Guards_run",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_FVGuardsRun"},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_FruitAlarm"},
			--MapFlagIsFalse	{Name = "mf_P702_ZerboDone"},
			SetUpdateInterval	{Steps = 15},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr14", TargetTag = "npc_FruitVendor" },
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr03", TargetTag = "npc_FruitVendor" },
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr02", TargetTag = "npc_FruitVendor" },
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr17", TargetTag = "npc_FruitVendor" },
			EventReEnable	{Name = "FruitVendor_Alarm-Guards_run"},
		},
		GotoState = self,
	};


	
	
	
	OnOneTimeEvent
	{
		EventName = "FruitVendor Alarm: Everybody are on a right position",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr02", TargetTag = vFVMeet , Range = 3 },
			--FigureIsInRangeToEntity	{Tag = "rts_ZerboOr03", TargetTag = vFVMeet , Range = 2 },
			FigureIsInRangeToEntity	{Tag = "npc_FruitVendor", TargetTag = vFVMeet , Range = 3 },
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr17", TargetTag = vFVMeet , Range = 3 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_FruitAlarm"},
			FigureIsInRangeToEntity	{Tag = "rts_ZerboOr14", TargetTag = vFVMeet , Range = 3 },
			OR
			{
				GameDifficulty {Value = 1},
				GameDifficulty {Value = 2},
				GameDifficulty {Value = 3},
				FigureIsInRangeToEntity	{Tag = "rts_ZerboOr03", TargetTag = vFVMeet , Range = 3 },
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_FVGuardsRun"},
			MapTimerStart	{Name = "FruitVendor2"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "FruitVendor Alarm: Everybody walk to the original position",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "FruitVendor2", Seconds = 5 },
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_FruitAlarm"},
			--GameDifficulty {Value = 1},			
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "npc_FruitVendor", TargetTag = "mrk_FruitVendor"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr02", TargetTag = "mrk_or_02_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr03", TargetTag = "mrk_or_03_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr17", TargetTag = "mrk_or_17_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or02_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or02_1"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or14_1"},
			EventReEnable	{Name = "Patrol_2a"},
			EventReEnable	{Name = "Patrol_2b"},
			EventReEnable	{Name = "or_03_W1"},
			EventReEnable	{Name = "or_03_W2"},
			EventReEnable	{Name = "or_14_W-D2"},
			EventReEnable	{Name = "or_14_W-D34"},
			EventReEnable	{Name = "or_14_PW-D34-a"},
			MapTimerStop	{Name = "FruitVendor2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_FruitAlarm"},
			
			
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Demonic GodStone events
	------------------------------------------------------
	
	
	OnOneTimeEvent
	{
		EventName = "Demonic Outry 1",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "DemonicStone", Range = 20},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry04", Tag = "pl_HumanAvatar"},
			MapTimerStart	{Name = "DemonicStone0"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Demonic Outry 2",
		Conditions = 
		{
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "DemonicStone", Range = 40},
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			MapTimerIsElapsed	{Name = "DemonicStone0", Seconds = 5},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry05", Tag = "pl_HumanAvatar"},
			MapTimerStop	{Name = "DemonicStone0"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Demonic_GodStone_SpellIsCasting",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "DemonicStone", Range = 10},
			OR
			{
				AvatarIsCastingSpell	{Player = "default", Spell = 13},
				AvatarIsCastingSpell	{Player = "default", Spell = 2},
				AvatarIsCastingSpell	{Player = "default", Spell = 50},
				AvatarIsCastingSpell	{Player = "default", Spell = 352},
				AvatarIsCastingSpell	{Player = "default", Spell = 48},
				AvatarIsCastingSpell	{Player = "default", Spell = 351},
				AvatarIsCastingSpell	{Player = "default", Spell = 21},
				AvatarIsCastingSpell	{Player = "default", Spell = 68},
				AvatarIsCastingSpell	{Player = "default", Spell = 67},
				AvatarIsCastingSpell	{Player = "default", Spell = 23},
				AvatarIsCastingSpell	{Player = "default", Spell = 64},
				AvatarIsCastingSpell	{Player = "default", Spell = 96},
				AvatarIsCastingSpell	{Player = "default", Spell = 80},
				AvatarIsCastingSpell	{Player = "default", Spell = 97},
				AvatarIsCastingSpell	{Player = "default", Spell = 16},
				AvatarIsCastingSpell	{Player = "default", Spell = 33},
				AvatarIsCastingSpell	{Player = "default", Spell = 349},
				AvatarIsCastingSpell	{Player = "default", Spell = 76},
				
			},
		},
		Actions = 
		{
			--MapFlagSetTrue	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			MapTimerStart	{Name = "DemonicStone"},
			--EffectStart	{Tag = "DemonicStone", File = "Effect_Building_Darkness"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Demonic_Stone_Activate",
		Name = "Demonic_Stone_Activate",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "DemonicStone", Seconds = 1},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			--MapTimerStart	{Name = "DemonicStone"},
			EffectStart	{Tag = "DemonicStone", File = "Effect_Building_Darkness"},
		},
		GotoState = self,
	};



	OnOneTimeEvent
	{
		EventName = "Demonic Activation - Outry 3",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			MapTimerIsElapsed	{Name = "DemonicStone", Seconds = 3},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry06", Tag = "pl_HumanAvatar"},
			--FigureForcedRunToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_3"},
			--MapTimerStop	{Name = "DemonicStone"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Demonic Activation - Guards start",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			MapTimerIsElapsed	{Name = "DemonicStone", Seconds = 4},
			--FigureIsInRangeToEntity	{Tag = "rts_ZerboOr14", TargetTag = "DemonicStone", Range = 10},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_04_2"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr04", TargetTag = "mrk_or_04_2"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr15", TargetTag = "mrk_or_04_2"},
			--MapTimerStop	{Name = "DemonicStone"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Demonic Activation - End",
		Conditions = 
		{
			QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
			MapFlagIsTrue	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			MapTimerIsElapsed	{Name = "DemonicStone", Seconds = 15},
		},
		Actions = 
		{
			EffectStop	{Tag = "DemonicStone"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_or14_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr04", TargetTag = "mrk_or_04_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr15", TargetTag = "mrk_or_15_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr14", TargetTag = "mrk_or_14_1"},
			EventReEnable	{Name = "or_14_W-D34"},
			EventReEnable	{Name = "or_14_W-D2"},
			EventReEnable	{Name = "or_14_PW-D34-a"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_DemonicStoneActive"},
			--MapTimerStop	{Name = "DemonicStone"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- MarriedMan events
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Gullible Married Man is reeeeealy angry",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_MarriedManAngry"},
			--AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "npc_MarriedMan", TargetTag = "npc_Jorgos"},
			MapTimerStart	{Name = "MarriedMan"},
			DialogSetDisabled	{Tag = "npc_MarriedMan"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Gullible Married Man - Fight against Jorgos",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_MarriedManAngry"},
			FigureIsInRangeToEntity	{Tag = "npc_MarriedMan", TargetTag = "npc_Jorgos", Range = 3},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry11", Tag = "npc_MarriedMan"},
			FigureTeamTransfer	{Tag = "npc_MarriedMan", Team = "tm_Zerbo1"},
			FigureTeamTransfer	{Tag = "npc_Jorgos", Team = "tm_Zerbo2"},
			FigureForceAttackEntity	{Tag = "npc_MarriedMan", TargetTag = "npc_Jorgos"},
			FigureAbilityAdd {AbilityId = Ability.Immortal , Tag = "npc_MarriedMan"},
			FigureAbilityAdd {AbilityId = Ability.Immortal , Tag = "npc_Jorgos"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr10", TargetTag = "npc_Jorgos"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr11", TargetTag = "npc_Jorgos"},
			FigureForcedRunToEntity	{Tag = "rts_ZerboOr13", TargetTag = "npc_Jorgos"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Gullible Married Man - Zerbo Guard outcry",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_MarriedManAngry"},
			--OR
			--{
				FigureIsInRangeToEntity	{Tag = "rts_ZerboOr10", TargetTag = "npc_Jorgos", Range = 4},
				FigureIsInRangeToEntity	{Tag = "rts_ZerboOr11", TargetTag = "npc_Jorgos", Range = 4},
				OR
			{
				GameDifficulty {Value = 1},
				FigureIsInRangeToEntity	{Tag = "rts_ZerboOr13", TargetTag = "npc_Jorgos", Range = 4},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_MarriedMan_GuardsFight"},
			FigureOutcry	{TextTag = "ZerboCry12", Tag = "rts_ZerboOr10"},
			--FigureForceAttackEntity	{Tag = "rts_ZerboOr10", TargetTag = "npc_MarriedMan"},
			--FigureForceAttackEntity	{Tag = "rts_ZerboOr11", TargetTag = "npc_MarriedMan"},
			--FigureForceAttackEntity	{Tag = "rts_ZerboOr13", TargetTag = "npc_MarriedMan"},
			MapTimerStart	{Name = "MarriedMan2"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Gullible Married Man - Married Man outcry2 + afterworks",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_MarriedManAngry"},
			MapTimerIsElapsed	{Name = "MarriedMan2", Seconds = 5 },
				FigureIsInRangeToEntity	{Tag = "rts_ZerboOr10", TargetTag = "npc_Jorgos", Range = 4},
				FigureIsInRangeToEntity	{Tag = "rts_ZerboOr11", TargetTag = "npc_Jorgos", Range = 4},
				OR
				{
					FigureIsInRangeToEntity	{Tag = "rts_ZerboOr13", TargetTag = "npc_Jorgos", Range = 4},
					GameDifficulty {Value = 1},
				},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry13", Tag = "npc_MarriedMan"},
			MapTimerStop	{Name = "MarriedMan2"},
			
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or10_2"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_1"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_or11_2"},
			MapFlagSetTrue	{Name = "mf_P702_Zerbo_MarriedMan_End"},
			FigureTeamTransfer	{Tag = "npc_MarriedMan", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "npc_Jorgos", Team = "tm_Neutral"},
			FigureHoldPosition	{Tag = "npc_Jorgos"},
			FigureForcedWalkToEntity	{Tag = "npc_MarriedMan", TargetTag = "mrk_MarriedMan"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr10", TargetTag = "mrk_or_10_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr11", TargetTag = "mrk_or_11_1"},
			FigureWalkToEntity	{Tag = "rts_ZerboOr13", TargetTag = "mrk_or_13_1"},
			EventReEnable	{Name = "Guard_10-11_restart"},
			DialogSetEnabled	{Tag = "npc_MarriedMan"},
			MapFlagSetFalse	{Name = "mf_P702_Zerbo_MarriedMan_GuardsFight"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Gullible Married Man - Avatar outcry",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_MarriedManAngry"},
			MapTimerIsElapsed	{Name = "MarriedMan", Seconds = 10 },
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry07", Tag = "pl_HumanAvatar"},
			MapTimerStop	{Name = "MarriedMan"},
		},
		GotoState = self,
	};

	------------------------------------------------------
	-- After the quest
	------------------------------------------------------
	
	OnOneTimeEvent
	{
		EventName = "Zerbo after quest: FlickedBoss spawn",
		Conditions = 
		{
			QuestIsSolved	{Player = "default", Quest = "SS_ZERBO_10"},
			--QuestIsActive	{Player = "default", Quest = "SS_ZERBO_10"},
		},
		Actions = 
		{
			NoSpawnEffect {Spawn = FigureRespawnToEntity	{Tag = "npc_FlickedBoss", TargetTag = "mrk_FlickedBoss"},},
			FigureTeamTransfer	{Tag = "npc_FlickedBoss", Team = "tm_Neutral"},
			EventReEnable	{Name = "ZerboBossPatrol1"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "ZerboBossPatrol1",
		Name = "ZerboBossPatrol1",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "npc_FlickedBoss", TargetTag = "mrk_FlickedBoss", Range = 2},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "npc_FlickedBoss", TargetTag = "mrk_FlickedBoss"},
				--Points = default,	--{"200, 200","250, 250",}, 
				Tags = {	"mrk_fb_01", "mrk_fb_02",	"mrk_fb_03",	"mrk_fb_04",	"mrk_fb_05",	"mrk_fb_06",	"mrk_fb_07",	"mrk_fb_08",	"mrk_fb_09", }, --"mrk_FlickedBoss",
			},
			EventReEnable	{Name = "ZerboBossPatrol2"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "ZerboBossPatrol2",
		Name = "ZerboBossPatrol2",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "npc_FlickedBoss", TargetTag = "mrk_fb_09", Range = 2},
			SetUpdateInterval	{Steps = 20},
		},
		Actions = 
		{
			
			FigurePathGoto	
			{
				Goto = FigureWalkToEntity	{Tag = "npc_FlickedBoss", TargetTag = "mrk_fb_09"},
				--Points = default,	--{"200, 200","250, 250",}, 
				Tags = {"mrk_fb_10",	"mrk_fb_11",	"mrk_fb_12",	"mrk_fb_13",	"mrk_fb_14", "mrk_fb_15", }, --"mrk_FlickedBoss",
			},
			
			EventReEnable	{Name = "ZerboBossPatrol1"},
		},
		GotoState = self,
	};


	
	------------------------------------------------------
	-- After the quest: Mace events
	------------------------------------------------------

	OnOneTimeEvent
	{
		EventName = "Zerbo - Mace attack outcry - Diff1",
		Conditions = 
		{
			GameDifficulty {Value = 1},
			MapFlagIsTrue	{Name = "mf_P702_ZerboAvatarHasTheMace"},
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
			--AvatarHasItemEquipment	{Player = "default", ItemId = , Amount = , SearchEquipment = default, SearchHeroEquipment = default},
			--AvatarHasItemEquipped	{Player = "default", ItemId = },
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr01"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr02"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr03"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr04"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr05"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr06"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr07"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr08"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr09"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr10"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr11"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr12"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr13"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr14"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr15"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr16"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8, TargetTag = "rts_ZerboOr17"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "npc_FlickedBoss"},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry08", Tag = "rts_ZerboOr01"},
			FigureOutcry	{TextTag = "ZerboCry09", Tag = "rts_ZerboOr02"},
			MapTimerStart	{Name = "ZerboMaceAttackTimer"},

		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zerbo - Mace attack outcry - Diff2",
		Conditions = 
		{
			GameDifficulty {Value = 2},
			MapFlagIsTrue	{Name = "mf_P702_ZerboAvatarHasTheMace"},
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
			--AvatarHasItemEquipment	{Player = "default", ItemId = , Amount = , SearchEquipment = default, SearchHeroEquipment = default},
			--AvatarHasItemEquipped	{Player = "default", ItemId = },
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr01"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr02"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr03"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr04"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr05"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr06"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr07"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr08"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr09"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr10"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr11"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr12"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr13"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr14"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr15"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr16"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 8.5 , TargetTag = "rts_ZerboOr17"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "npc_FlickedBoss"},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry08", Tag = "rts_ZerboOr01"},
			FigureOutcry	{TextTag = "ZerboCry09", Tag = "rts_ZerboOr01"},
			MapTimerStart	{Name = "ZerboMaceAttackTimer"},

		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Zerbo - Mace attack outcry - Diff3",
		Conditions = 
		{
			GameDifficulty {Value = 3},
			MapFlagIsTrue	{Name = "mf_P702_ZerboAvatarHasTheMace"},
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
			--AvatarHasItemEquipment	{Player = "default", ItemId = , Amount = , SearchEquipment = default, SearchHeroEquipment = default},
			--AvatarHasItemEquipped	{Player = "default", ItemId = },
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr01"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr02"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr03"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr04"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr05"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr06"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr07"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr08"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr09"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr10"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr11"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr12"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr13"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr14"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr15"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr16"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9, TargetTag = "rts_ZerboOr17"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "npc_FlickedBoss"},
			}
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry08", Tag = "rts_ZerboOr01"},
			FigureOutcry	{TextTag = "ZerboCry09", Tag = "rts_ZerboOr01"},
			MapTimerStart	{Name = "ZerboMaceAttackTimer"},

		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Zerbo - Mace attack outcry - Diff4",
		Conditions = 
		{
			GameDifficulty {Value = 4},
			MapFlagIsTrue	{Name = "mf_P702_ZerboAvatarHasTheMace"},
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
			--AvatarHasItemEquipment	{Player = "default", ItemId = , Amount = , SearchEquipment = default, SearchHeroEquipment = default},
			--AvatarHasItemEquipped	{Player = "default", ItemId = },
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr01"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr02"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr03"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr04"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr05"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr06"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr07"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr08"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr09"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr10"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr11"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr9.5"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr13"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr14"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr15"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr16"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 9.5, TargetTag = "rts_ZerboOr17"},
				FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 10, TargetTag = "npc_FlickedBoss"},
			}
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ZerboCry08", Tag = "rts_ZerboOr01"},
			FigureOutcry	{TextTag = "ZerboCry09", Tag = "rts_ZerboOr01"},
			MapTimerStart	{Name = "ZerboMaceAttackTimer"},

		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Zerbo - Mace attack",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "ZerboMaceAttackTimer", Seconds = 1},
		},
		Actions = 
		{
			MapTimerStop	{Name = "ZerboMaceAttackTimer"},
			--FigureUnitChange	{Tag = "rts_ZerboOr01", UnitId = 81, Level = 10},
			FigureTeamTransfer {Tag = "rts_ZerboOr01", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr02", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr03", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr04", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr05", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr06", Team = "tm_Creep"},

			FigureTeamTransfer {Tag = "rts_ZerboOr08", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr09", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr10", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr11", Team = "tm_Creep"},

			FigureTeamTransfer {Tag = "rts_ZerboOr16", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "rts_ZerboOr17", Team = "tm_Creep"},
			FigureTeamTransfer {Tag = "npc_FlickedBoss", Team = "tm_Creep"},
			
			FigureAttackEntity	{Tag = "rts_ZerboOr01", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr02", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr03", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr04", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr05", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr06", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr07", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr08", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr09", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr10", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr11", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr12", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr13", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr14", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr15", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr16", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "rts_ZerboOr17", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "npc_FlickedBoss", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Achievement - Zerbo - KillGuards",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
			FigureIsDead	{Tag = "rts_ZerboOr01"},
			FigureIsDead	{Tag = "rts_ZerboOr02"},
			FigureIsDead	{Tag = "rts_ZerboOr03"},
			FigureIsDead	{Tag = "rts_ZerboOr04"},
			FigureIsDead	{Tag = "rts_ZerboOr05"},
			FigureIsDead	{Tag = "rts_ZerboOr06"},
			FigureIsDead	{Tag = "rts_ZerboOr08"},
			FigureIsDead	{Tag = "rts_ZerboOr09"},
			FigureIsDead	{Tag = "rts_ZerboOr10"},
			FigureIsDead	{Tag = "rts_ZerboOr11"},
			FigureIsDead	{Tag = "rts_ZerboOr16"},
			FigureIsDead	{Tag = "rts_ZerboOr17"},
			FigureIsDead	{Tag = "npc_FlickedBoss"},
			
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P702_Zerbo2_Completed"},
		},
		GotoState = self,
	};

	OnOneTimeEvent
	{
		EventName = "Achievement - Zerbo - SnakeAgain-start",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 6},
			MapFlagIsTrue	{Name = "mf_P702_ZerboDone"},
			GameDifficulty {Value = 4},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_ZerboSnakeAgainStarted"},
			--AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P702_Zerbo1_Completed"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		EventName = "Achievement - Zerbo - SnakeAgain-end",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			MapFlagIsTrue	{Name = "mf_P702_ZerboSnakeAgainStarted"},
			FigureIsAlive	{Tag = "rts_ZerboOr01"},
			FigureIsAlive	{Tag = "rts_ZerboOr02"},
			FigureIsAlive	{Tag = "rts_ZerboOr03"},
			FigureIsAlive	{Tag = "rts_ZerboOr04"},
			FigureIsAlive	{Tag = "rts_ZerboOr05"},
			FigureIsAlive	{Tag = "rts_ZerboOr06"},
			FigureIsAlive	{Tag = "rts_ZerboOr08"},
			FigureIsAlive	{Tag = "rts_ZerboOr09"},
			FigureIsAlive	{Tag = "rts_ZerboOr10"},
			FigureIsAlive	{Tag = "rts_ZerboOr11"},
			FigureIsAlive	{Tag = "rts_ZerboOr16"},
			FigureIsAlive	{Tag = "rts_ZerboOr17"},
			FigureIsAlive	{Tag = "npc_FlickedBoss"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr01"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr02"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr03"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr04"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr05"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr06"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr08"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr09"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr10"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr11"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr16"},
			FigureIsNotInCombat	{Tag = "rts_ZerboOr17"},
			FigureIsNotInCombat	{Tag = "npc_FlickedBoss"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P702_ZerboSnakeAgainStart"},
			AvatarFlagSetTrue	{Player = "default", Name = "af_Achievement_P702_Zerbo1_Completed"},
		},
		GotoState = self,
	};
	
	------------------------------------------------------
	-- Teleport section
	------------------------------------------------------


	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_Caine",
		Name = "Teleport_Zerbo_Caine",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_Caine"},
		},
		GotoState = self,
	};

	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_HeroFirst",
		Name = "Teleport_Zerbo_HeroFirst",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroFirst"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroFirst", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroFirst" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_HeroFirst"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_HeroSecond",
		Name = "Teleport_Zerbo_HeroSecond",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroSecond"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSecond", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroSecond" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_HeroSecond"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_HeroThird",
		Name = "Teleport_Zerbo_HeroThird",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroThird"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroThird", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroThird" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_HeroThird"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_HeroOrc",
		Name = "Teleport_Zerbo_HeroOrc",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanHeroOrc"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroOrc", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroOrc" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_HeroOrc"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_CompanionCraigHuman",
		Name = "Teleport_Zerbo_CompanionCraigHuman",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionCraigHuman"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionCraigHuman", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionCraigHuman" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_CompanionCraigHuman"},
		},
		GotoState = self,
	};
	
	OnOneTimeRepeatEvent
	{
		EventName = "Teleport_Zerbo_CompanionSariel",
		Name = "Teleport_Zerbo_CompanionSariel",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanCompanionSariel"},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_in", Range = 15},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "prt_03_out", Range = 15},
			},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_or_04_2", Range = 100},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanCompanionSariel", TargetTag = "mrk_fb_07", Range = 100},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanCompanionSariel" , TargetTag = "pl_HumanAvatar"},
			EventReEnable	{Name = "Teleport_Zerbo_CompanionSariel"},
		},
		GotoState = self,
	};
	
	
	
}
