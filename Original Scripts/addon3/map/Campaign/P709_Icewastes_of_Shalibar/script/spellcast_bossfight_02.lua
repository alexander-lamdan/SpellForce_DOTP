--**************************************************
--*                                                *
--*   Icewastes of Shalibar :: Lich spell script   *
--*                                                *
--**************************************************

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

local vSpellCasterTag = "lich";

local vSpellCastTimer = 30;

local vSpellRange = 15;

local vSpell1 = 332;			-- Burning Blood (Master): All nearby units deal %37%%% bonus damage on attacks, but after a short time they lose progressively more Health Points until they die
local vSpell1Power = 40;

local vSpell2 = 340;			-- Divine Bolt (Master): Causes up to %8% total damage in the target area. Flying units receive %1% additional damage
local vSpell2Power = 60;

local vSpell3 = 317;			-- Mind Scream (Master)" uDescription="Causes an average of %2% mental damage per enemy, depending on the maximum Mana supply of the target
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

			MapFlagIsTrue {Name = "mf_P709_bossfight_02"},

		},
		Actions =
		{
			
			FigureManaSet	{Tag = vSpellCasterTag, Percent = 0},
			
			MapTimerStart {Name = "mt_P709_LichSpell"},
			
			MapValueSet {Name = "mv_P709_LichSpell", Value = 1},
			
			MapValueRandomize	{Name = "mv_P709_LichSpell", MinValue = 1, MaxValue = 3},

		},

		GotoState ="BOSSFIGHT_02_SPELLCASTER",

	},
	
};

State
{

	StateName = "BOSSFIGHT_02_SPELLCASTER",
	
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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = "pl_HumanAvatar"},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Avatar
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Avatar <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = "pl_HumanAvatar"},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3  to Avatar
	
	OnEvent
	{
		EventName = ">>> Cast spell 3  to Avatar <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = "pl_HumanAvatar"},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero1fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero1fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Hero 1
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 1 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero1fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero1fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 1
	
	OnEvent
	{
		EventName = ">>> Cast spell 3  to Hero 1 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero1fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero1fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero2fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero2fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Hero 2
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 2 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero2fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero2fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 2
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 2 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero2fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero2fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero3fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero3fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Hero 3
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 3 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero3fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero3fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 3
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 3 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero3fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero3fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero4fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero4fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Hero 4
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 4 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero4fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero4fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 4
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 4 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero4fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero4fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero5fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero5fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Hero 5
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 5 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero5fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero5fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 5
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 5 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero5fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero5fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero6fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero6fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2 to Hero 6
	
	OnEvent
	{
		EventName = ">>> Cast spell 2  to Hero 6 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero6fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero6fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 6
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 6 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero6fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero6fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero7fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 1},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell1, Power = vSpell1Power, TargetTag = vHero7fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 2  to Hero 7
	
	OnEvent
	{
		EventName = ">>> Cast spell 2 to Hero 7 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero7fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 2},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell2, Power = vSpell1Power, TargetTag = vHero7fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

		},

	},
	
--	Cast spell 3 to Hero 7
	
	OnEvent
	{
		EventName = ">>> Cast spell 3 to Hero 7 <<<",
		Conditions = 
		{

			MapTimerIsElapsed	{Name = "mt_P709_LichSpell", Seconds = vSpellCastTimer},

			FigureIsInRangeToEntity {Tag = vHero7fTag, TargetTag = vSpellCasterTag, Range = vSpellRange},

			MapValueIsEqual	{Name = "mv_P709_LichSpell", Value = 3},

		},
		Actions =
		{

--	cast spells

			FigureCastSpellToEntity	{Tag = vSpellCasterTag, Spell = vSpell3, Power = vSpell1Power, TargetTag = vHero7fTag},

--	re-initialize timers

			MapTimerStop {Name = "mt_P709_LichSpell"},

			MapFlagSetTrue {Name = "mf_P709_LichSpell"},

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

			MapFlagIsTrue {Name = "mf_P709_LichSpell"},

		},
		Actions =
		{

			MapFlagSetFalse {Name = "mf_P709_LichSpell"},

			MapTimerStart {Name = "mt_P709_LichSpell"},
			
			MapValueRandomize	{Name = "mv_P709_LichSpell", MinValue = 1, MaxValue = 3},

		},

	},

-- *******************************************
-- *                                         *
-- *   Lich is dead, spellcasting finished   *
-- *                                         *
-- *******************************************

	OnOneTimeEvent
	{
		EventName = ">>> Lich is dead, spellcasting finished <<<",
		Conditions = 
		{

			EntityIsNotExisting	{Tag = "undead_tower_1"},
			EntityIsNotExisting	{Tag = "undead_tower_2"},
			EntityIsNotExisting	{Tag = "undead_tower_3"},

			EntityIsNotExisting	{Tag = "lich"},

		},
		Actions =
		{

			UIBossfightPanelHide {},

		},

		GotoState = "BOSSFIGHT_02_SPELLCASTER_END",

	},
	
};

State
{

	StateName = "BOSSFIGHT_02_SPELLCASTER_END",
	
};