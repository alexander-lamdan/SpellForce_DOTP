-- *********************************************************************************
-- ** Handling the endboss and its minions                                        **
-- *********************************************************************************

-- Use MapFlagSetTrue	{Name = "mf_P706_StartTheCSOutro"}, to switch it to the BOSSFIGHT_ENDED state


-- Locals
local ftBossWithBreathFire = "BossWithBreathFire";
local ftBossWithoutBreathFire = "BossWithoutBreathFire";

local btToProtectA = "BuildingEaglesNest01";
local btToProtectB = "BuildingEaglesNest02";
local btToProtectC = "BuildingEaglesNest03";

local otPatrolPointA = "EndBoss_PatrolPoint1";
local otPatrolPointB = "EndBoss_PatrolPoint2";
local otPatrolPointC = "EndBoss_PatrolPoint3";

local rangeBoss2Avatar = 20; -- the boss spawns his minions when approached the avatar this much
local secAttackStandDuration = 30;







--************************************************************************************** Initializing the boss
State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		EventName = ">>> Init the boss when the game is unblocked <<<",
		Conditions = 
		{
			GameIsUnBlocked{},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointA}, -- to initialize the patrol below

			MapValueSet {Name = "mv_P706_EndBossState", Value = EndBossState.BaseDefence},
		},
		GotoState = "DEFAULT",		
	},
};









--************************************************************************************** Default state: the boss is doing his routine
State
{
	StateName = "DEFAULT",
 
	--*********************************************************************************************** BASE DEFENSE boss-state
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Move from building A to B if not destroyed <<<",
		Name = "PATROL_A2B",
		Conditions = 
		{
			BuildingIsAlive	{Tag = btToProtectB},
			FigureIsIdle {Tag = ftBossWithBreathFire}, -- not working
			FigureIsNotInCombat {Tag = ftBossWithBreathFire},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointB},
			EventReEnable	{Name = "PATROL_B2A"},
			EventReEnable	{Name = "PATROL_B2C"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Move from building A to C if not destroyed (because B is) <<<",
		Name = "PATROL_A2C",
		Conditions = 
		{
			BuildingIsDead	{Tag = btToProtectB},
			BuildingIsAlive	{Tag = btToProtectC},
			FigureIsIdle {Tag = ftBossWithBreathFire}, -- not working
			FigureIsNotInCombat {Tag = ftBossWithBreathFire},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointC},
			EventReEnable	{Name = "PATROL_C2A"},
			EventReEnable	{Name = "PATROL_C2B"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Move from building B to C if not destroyed <<<",
		Name = "PATROL_B2C",
		Conditions = 
		{
			BuildingIsAlive	{Tag = btToProtectC},
			FigureIsIdle {Tag = ftBossWithBreathFire}, -- not working
			FigureIsNotInCombat {Tag = ftBossWithBreathFire},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointC},
			EventReEnable	{Name = "PATROL_C2A"},
			EventReEnable	{Name = "PATROL_C2B"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Move from building B to A if not destroyed (because C is) <<<",
		Name = "PATROL_B2A",
		Conditions = 
		{
			BuildingIsDead	{Tag = btToProtectC},
			BuildingIsAlive	{Tag = btToProtectA},
			FigureIsIdle {Tag = ftBossWithBreathFire}, -- not working
			FigureIsNotInCombat {Tag = ftBossWithBreathFire},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointA},
			EventReEnable	{Name = "PATROL_A2B"},
			EventReEnable	{Name = "PATROL_A2C"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Move from building C to A if not destroyed <<<",
		Name = "PATROL_C2A",
		Conditions = 
		{
			BuildingIsAlive	{Tag = btToProtectA},
			FigureIsIdle {Tag = ftBossWithBreathFire}, -- not working
			FigureIsNotInCombat {Tag = ftBossWithBreathFire},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointA},
			EventReEnable	{Name = "PATROL_A2B"},
			EventReEnable	{Name = "PATROL_A2C"},
		},
	},
	OnOneTimeRepeatEvent
	{
		EventName = ">>> Move from building C to B if not destroyed (because A is) <<<",
		Name = "PATROL_C2B",
		Conditions = 
		{
			BuildingIsDead	{Tag = btToProtectA},
			BuildingIsAlive	{Tag = btToProtectB},
			FigureIsIdle {Tag = ftBossWithBreathFire}, -- not working
			FigureIsNotInCombat {Tag = ftBossWithBreathFire},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = ftBossWithBreathFire, TargetTag = otPatrolPointB},
			EventReEnable	{Name = "PATROL_B2A"},
			EventReEnable	{Name = "PATROL_B2C"},
		},
	},	
	
	
	
	
	
	
	
	
	--******************************************************************************************** TRANSMUTE boss-state

	--------------------------------------------------------------- No more buildings exist, switch to attack move, start the timer early
	OnOneTimeEvent
	{
		EventName = ">>> No more buildings exist, switch to attack move - start a weather change <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_StartBossTransmute"}, -- set in Branch05_Endgame.lua when the buildings are destroyed, and the outcries are over
		},
		Actions =
		{
			MapValueSet {Name = "mv_P706_EndBossState", Value = EndBossState.Transmute},

			MapTimerStart	{Name = "mt_P706_Spawner_Endboss_StartAWave"}, -- note: this does NOT start a wave, just allows starting waves LATER
			MapTimerStart	{Name = "mt_P706_BossTransmuting"},
		},
	},	
	
	OnOneTimeEvent 	------------------------------------------------------- Effects and outcry: he is transmuting
	{
		EventName = ">>> mt_P706_BossTransmuting >  5 - adding a VFX<<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_BossTransmuting", Seconds = 5},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = ftBossWithBreathFire, File = "Effect_Misc_God_Vanishing"},

			FigureOutcryAlert	{TextTag = "cryBossTransmuting1", Tag = ftHeroOrc, TargetTag = ftBossWithBreathFire},
		},
	},		
	
	OnOneTimeEvent 	------------------------------------------------------- Swap the old and the new boss
	{
		EventName = ">>> mt_P706_BossTransmuting >  7 - Swap the old and the new boss <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_BossTransmuting", Seconds = 8},
		},
		Actions =
		{
			FigureRespawnToEntity	{Tag = ftBossWithoutBreathFire, TargetTag = ftBossWithBreathFire},
			FigureAbilityAdd	{Tag = ftBossWithoutBreathFire, AbilityId = Ability.Immortal},
			FigureLookAtEntity	{Tag = ftBossWithoutBreathFire, TargetTag = ftAvatar},
			
			FigureDirectionSetToEntity	{Tag = ftBossWithoutBreathFire, TargetTag = ftBossWithBreathFire},
	
			UIBossfightPanelShow { UnitTag1 = ftBossWithoutBreathFire, UnitTag2 = "", PortraitImage = "boss_P706_nameless", DisplayName = Boss_P706_NLBoss},
			
			FigureVanish	{Tag = ftBossWithBreathFire},
		},
	},
	
	OnOneTimeEvent 	------------------------------------------------------- cryBossTransmuting2: “Lets prepare for the worst!” + Switch behavior
	{
		EventName = ">>> mt_P706_BossTransmuting > 10 - Outcry: Lets prepare for the worst! <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_BossTransmuting", Seconds = 10},
		},
		Actions =
		{
			MapValueSet {Name = "mv_P706_EndBossState", Value = EndBossState.AttackMove},		
			FigureOutcry	{TextTag = "cryBossTransmuting2", Tag = ftHeroOrc},
		},
	},

	OnOneTimeEvent ------------------------------------------- Activate Quest: kill the boss
	{
		EventName = ">>> Next Quest: mt_P706_MQ121_DESTROYBUILDINGS_completed > 15 <<<",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P706_BossTransmuting", Seconds = 15 },
		},
		Actions =
		{
			QuestSetActive	{Player = "default", Quest = "MQ122_KILLTHEBOSS"},
		},
	},	






	--******************************************************************************************** ATTACK MOVE boss-state

	---------------------------------------------------------------------------------------------- Move to the avatar
	OnFollowEvent
	{
		Tag = ftBossWithoutBreathFire,
		TargetTag = ftAvatar,
		OnConditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_EndBossState", Value = EndBossState.AttackMove},
			FigureIsNotInEntityRange	{Tag = ftBossWithoutBreathFire, TargetTag = ftAvatar, Range = rangeBoss2Avatar},
		},
		Actions = 
		{
		},
	};

--	OnEvent
--	{
--		EventName = ">>> ATTACK-MOVE: Idle -> Move to the avatar <<<",
--		Conditions = 
--		{
--			MapValueIsEqual	{Name = "mv_P706_EndBossState", Value = EndBossState.AttackMove},
--			FigureIsIdle {Tag = ftBossWithoutBreathFire},		
--		},
--		Actions =
--		{
--			FigureForcedRunToEntity	{Tag = ftBossWithoutBreathFire, TargetTag = ftAvatar},
--		},
--	},

	---------------------------------------------------------------------------------------------- Arrived to the avatar, switch to Attack Stand
	OnEvent
	{
		EventName = ">>> ATTACK-MOVE: Close to the avatar -> Switch to ATTACK-STAND <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_EndBossState", Value = EndBossState.AttackMove},
			FigureIsInRangeToEntity	{Tag = ftBossWithoutBreathFire, TargetTag = ftAvatar, Range = rangeBoss2Avatar },
		},
		Actions =
		{		
			FigureStop	{Tag = ftBossWithoutBreathFire},
			MapValueSet {Name = "mv_P706_EndBossState", Value = EndBossState.AttackStand},	
			FigureLookAtEntity	{Tag = ftBossWithoutBreathFire, TargetTag = ftAvatar},			
			MapFlagSetTrue	{Name = "mf_P706_Spawner_EndBoss_StartAWave"}, -- this issues the Spawner_Boss.lua to spawn a wave of fighters if the previous waves died already
			MapTimerStart	{Name = "mt_P706_BossIsIn_AttackStand"},
		},
	},

	---------------------------------------------------------------------------------------------- Stood in one place for long, lets attack again
	OnEvent
	{
		EventName = ">>> ATTACK-STAND: mt_P706_BossIsIn_AttackStand > 30 -> Switch to ATTACK-MOVE <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_EndBossState", Value = EndBossState.AttackStand},
			MapTimerIsElapsed	{Name = "mt_P706_BossIsIn_AttackStand", Seconds = secAttackStandDuration},
		},
		Actions =
		{		
			MapValueSet {Name = "mv_P706_EndBossState", Value = EndBossState.AttackMove},	
			MapTimerStop	{Name = "mt_P706_BossIsIn_AttackStand"},
		},
	},	
	
	
	
	
	
	
	--******************************************************************************************** End the bossfight when the outro starts
	OnOneTimeEvent
	{
		EventName = ">>> mf_P706_StartTheCSOutro is true -> switching to BOSSFIGHT_ENDED state... <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_NLBossGoingToShaman"},
		},
		Actions =
		{
		},
		GotoState = "BOSSFIGHT_ENDED",
	},
};










--*********************************** The Outro switches the boss to this state preventing him from making strange things in the cutscene
State
{
	StateName = "BOSSFIGHT_ENDED",
	
	OnOneTimeEvent
	{
		EventName = ">>> Switched to this state by a GotoState <<<",
		Conditions = 
		{
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P706_NLBossIsIn_BOSSFIGHT_ENDED_State"}, 
		},
	},
};
