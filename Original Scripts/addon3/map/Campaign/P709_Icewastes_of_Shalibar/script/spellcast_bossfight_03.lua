--*******************************************************************
--*                                                                 *
--*   Icewastes of Shalibar :: Rainbow Crystal Golem spell script   *
--*                                                                 *
--*******************************************************************

-- local constans for heroes

local vHero1ID = 182;
local vHero1sTag = "HeroCaine";
local vHero1fTag = "pl_HumanHeroCaine";

local vHero2ID = 250;
local vHero2sTag = "HeroOrc";
local vHero2fTag = "pl_HumanHeroOrc";

local vHero3ID = 251;
local vHero3sTag = "HeroFirst";
local vHero3fTag = "pl_HumanHeroFirst";

local vHero4ID = 257;
local vHero4sTag = "HeroSecond";
local vHero4fTag = "pl_HumanHeroSecond";

local vHero5ID = 260;
local vHero5sTag = "HeroThird";
local vHero5fTag = "pl_HumanHeroThird";

local vHero6ID = 259;
local vHero6sTag = "CompanionCraigHuman";
local vHero6fTag = "pl_HumanCompanionCraigHuman";

local vHero7ID = 262;
local vHero7sTag = "CompanionSariel";
local vHero7fTag = "pl_HumanCompanionSariel";

-- local constants for spellcasting

local vSpellCasterTag = "rainbow_crystal_golem";

local vSpellCastTimer = 25;

local vSpellRange = 25;

local vSpell1 = 310;			-- Ice Comet (Master): causes %36% frost damage to the target over %37% seconds and an additional %8% frost damage in the target area. All affected enemies (maximum level %22%) will be interrupted and frozen for %16% seconds
local vSpell1Power = 60;

local vSpell2 = 429;			-- Icy Mist: It causes %9% ice damage on each enemy in the effective range, and an additional %36% ice damage for %37% seconds
local vSpell2Power = 60;

local vSpell3 = 326;			-- Raise Dead (Master): Resurrects up to %17% killed units in the target area as skeleton slaves for %30% seconds, does not effect undead
local vSpell3Power = 60;

State
{

	StateName = "INIT",

-- Start initial timer
	
	OnOneTimeEvent
	{
		EventName = ">>> Start initial timer <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_bossfight_03"},

		},
		Actions =
		{
			
			FigureManaSet	{Tag = vSpellCasterTag, Percent = 0},
			
			MapTimerStart {Name = "mt_P709_RainbowCrystalGolemSpell"},
			
			MapValueSet {Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},
			
			MapValueRandomize	{Name = "mv_P709_RainbowCrystalGolemSpell", MinValue = 1, MaxValue = 3},

		},

		GotoState ="BOSSFIGHT_03_SPELLCASTER",

	},
	
};

State
{

	StateName = "BOSSFIGHT_03_SPELLCASTER",
	
-- ******************************
-- *                            *
-- *   SPELL TARGET IS AVATAR   *
-- *                            *
-- ******************************
	
--	Cast spell 1 to Avatar
	
	OnEvent
	{
		EventName = ">>> Cast spell 1 to Avatar <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = "pl_HumanAvatar"},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Avatar
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Avatar <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = "pl_HumanAvatar"},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3  to Avatar
	
	OnEvent
	{
		EventName = ">>> Cast spell 3  to Avatar <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = "pl_HumanAvatar"},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},

-- ******************************
-- *                            *
-- *   SPELL TARGET IS HERO 1   *
-- *                            *
-- ******************************
	
--	Cast spell 1 to Hero 1
	
	OnEvent
	{
		EventName = ">>> Cast spell 1 to Hero 1 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero1fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero1fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Hero 1
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 1 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero1fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero1fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 1
	
	OnEvent
	{
		EventName = ">>> Cast spell 3  to Hero 1 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero1fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero1fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
-- ******************************
-- *                            *
-- *   SPELL TARGET IS HERO 2   *
-- *                            *
-- ******************************
	
--	Cast spell 1 to Hero 2
	
	OnEvent
	{
		EventName = ">>> Cast spell 1 to Hero 2 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero2fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero2fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Hero 2
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 2 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero2fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero2fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 2
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 2 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero2fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero2fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
-- ******************************
-- *                            *
-- *   SPELL TARGET IS HERO 3   *
-- *                            *
-- ******************************
	
--	Cast spell 1 to Hero 3
	
	OnEvent
	{
		EventName = ">>> Cast spell 1 to Hero 3 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero3fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero3fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Hero 3
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 3 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero3fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero3fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 3
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 3 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero3fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero3fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
-- ******************************
-- *                            *
-- *   SPELL TARGET IS HERO 4   *
-- *                            *
-- ******************************
	
--	Cast spell 1 to Hero 4
	
	OnEvent
	{
		EventName = ">>> Cast spell 1 to Hero 4 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero4fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero4fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Hero 4
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 4 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero4fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero4fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 4
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 4 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero4fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero4fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
-- ******************************
-- *                            *
-- *   SPELL TARGET IS HERO 5   *
-- *                            *
-- ******************************
	
--	Cast spell 1 to Hero 5
	
	OnEvent
	{
		EventName = ">>> Cast spell 1 to Hero 5 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero5fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero5fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Hero 5
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 5 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero5fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero5fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 5
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 5 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero5fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero5fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
-- ********************************************
-- *                                          *
-- *   SPELL TARGET IS HERO 6 (COMPANION 1)   *
-- *                                          *
-- ********************************************
	
--	Cast spell 1 to Hero 6
	
	OnEvent
	{
		EventName = ">>> Cast spell 1  to Hero 6 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero6fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero6fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2 to Hero 6
	
	OnEvent
	{
		EventName = ">>> Cast spell 2  to Hero 6 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero6fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero6fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 6
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 6 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero6fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero6fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
-- ********************************************
-- *                                          *
-- *   SPELL TARGET IS HERO 7 (COMPANION 2)   *
-- *                                          *
-- ********************************************
	
--	Cast spell 1  to Hero 7
	
	OnEvent
	{
		EventName = ">>> Cast spell 1  to Hero 7 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero7fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero7fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 2  to Hero 7
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 7 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero7fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero7fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},
	
--	Cast spell 3 to Hero 7
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 7 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_RainbowCrystalGolemSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero7fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapFlagIsFalse {Name = "mf_P709_GolemParalized"},

			MapValueIsEqual	{Name = "mv_P709_RainbowCrystalGolemSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero7fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_RainbowCrystalGolemSpell"},

			MapFlagSetTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},

	},

-- ************************************************
-- *                                              *
-- *   REStart initial timer, select next spell   *
-- *                                              *
-- ************************************************

	OnEvent
	{
		EventName = ">>> REStart initial timer, select next spell <<<",
		Conditions = 
		{

			MapFlagIsTrue {Name = "mf_P709_RainbowCrystalGolemSpell"},

		},
		Actions =
		{

			MapFlagSetFalse {Name = "mf_P709_RainbowCrystalGolemSpell"},

			MapTimerStart {Name = "mt_P709_RainbowCrystalGolemSpell"},
			
			MapValueRandomize	{Name = "mv_P709_RainbowCrystalGolemSpell", MinValue = 1, MaxValue = 3},

		},

	},

-- ************************************************************
-- *                                                          *
-- *   Rainbow Crystal Golem is dead, spellcasting finished   *
-- *                                                          *
-- ************************************************************

	OnOneTimeEvent
	{
		EventName = ">>> Rainbow Crystal Golem is dead, spellcasting finished <<<",
		Conditions = 
		{

			FigureIsDead {Tag = "rainbow_crystal_golem"},

		},
		Actions =
		{

		},

		GotoState = "BOSSFIGHT_03_SPELLCASTER_END",

	},
	
};

State
{

	StateName = "BOSSFIGHT_03_SPELLCASTER_END",
	
};