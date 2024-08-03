-- *********************************************************************************
-- ** Endboss healing																															**
-- ** This is a supplement for EndBoss.lua																				**
-- *********************************************************************************

local iHealthPercentToStartHealing = 25;
local iHealthPercentToHeal = 100;

local iOutcryAfterHealings = 2;

local ftBossWithBreathFire = "BossWithBreathFire";
local ftBossWithoutBreathFire = "BossWithoutBreathFire";




--************************************************************************************** Healing the boss with Breath Fire skill
State
{
	StateName = "WITH_BREATH_FIRE",

	-------------------------------------------------------------------------------------- Heal
	OnEvent
	{
		EventName = ">>> health < 25% -> healing to 100% <<<",
		Conditions = 
		{
			FigureHasNotHealth	{Tag = ftBossWithBreathFire, Percent = iHealthPercentToStartHealing},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = otSpawnPoint, File = "Effect_Meditate_Cast"},
			-- Effects that could also be used:			
			-- Effect_Leech_Cast / addon1
			-- Effect_Heal_Cast.xml
			-- Effect_Meditate_Cast.xml (base) 

			-- Effects that cause CRASH:	
			-- misc dwarven lantern 04 off
			-- effect misc giantbreakout.xml 
			-- effect cutscene boundingbox (addon1)
			-- misc dwarven lantern 04 off
			-- effect misc giantbreakout.xml 
			-- effect cutscene boundingbox (addon1)

			FigureHealthSet	{Tag = ftBossWithBreathFire, Percent = iHealthPercentToHeal},
		},
	},
		
	-------------------------------------------------------------------------------------- Transmutation started
	OnEvent
	{
		EventName = ">>> mv_P706_EndBossState == EndBossState.AttackMove OR AttackStand -> Change state <<<",
		Conditions = 
		{
			MapValueIsGreater	{Name = "mv_P706_EndBossState", Value = EndBossState.BaseDefence},
		},
		Actions =
		{
		},
		GotoState = "TRANSMUTING",		
	},
};




--************************************************************************************** No healing during transmutation
State
{
	StateName = "TRANSMUTING",

	------------------------------------------------------------------------ Transmutation ended, start healing the new boss
	OnEvent
	{
		Conditions = 
		{
			MapValueIsGreater	{Name = "mv_P706_EndBossState", Value = EndBossState.Transmute},
		},
		Actions =
		{
		},
		GotoState = "WITHOUT_BREATH_FIRE",		
	},
};





--************************************************************************************** Healing the boss without Breath Fire skill
State
{
	StateName = "WITHOUT_BREATH_FIRE",

	-------------------------------------------------------------------------------------- Heal
	OnEvent
	{
		EventName = ">>> health < 25% -> healing to 100% <<<",
		Conditions = 
		{
			FigureHasNotHealth	{Tag = ftBossWithoutBreathFire, Percent = iHealthPercentToStartHealing},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = ftBossWithoutBreathFire, File = "Effect_Meditate_Cast"},
			FigureHealthSet	{Tag = ftBossWithoutBreathFire, Percent = iHealthPercentToHeal}, 
			MapValueAdd	{Name = "mv_P706_BossHealingCounter", Value = 1},
		},
	},

	-------------------------------------------------------------------------------------- Outcry: he heals himself!
	OnOneTimeEvent
	{
		EventName = ">>> mv_P706_BossHealingCounter = 1 <<<",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_P706_BossHealingCounter", Value = 1},
--			MapValueIsGreater	{Name = "mv_P706_BossHealingCounter", Value = iOutcryAfterHealings},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryBossHealsHimself1", Tag = ftHeroCaine},
			FigureOutcry	{TextTag = "cryBossHealsHimself2", Tag = ftHeroCaine},
		},
	},

	------------------------------------------------------------------------ Bossfight ended, stop healing, to not disturb the outro cutscene
	OnEvent
	{
		EventName = ">>> Stop the healing, the outro starts: mf_P706_StartTheCSOutro <<<",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P706_StartTheCSOutro"},			
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
};
