-- ***************************************************************************
-- ** Avatar and heroes closing a cave entrance will be teleported          **
-- ** to the other end of the cave (and vice versa)                         **
-- ** Optimization possibilty: track zones (don't forget the flying mounts) **
-- ***************************************************************************


-- local DetectRange = 10; -- the range the In points must be approached to be teleported --> causes ping-pong -> crash
local DetectRange = 7; -- the range the In points must be approached to be teleported
local cryCaveInRange = 50; 

local Cave1A_In  = "Cave1A_In";  
local Cave1A_Out = "Cave1A_Out"; 
local Cave1B_In  = "Cave1B_In";  
local Cave1B_Out = "Cave1B_Out"; 

local Cave2A_In  = "Cave2A_In";  
local Cave2A_Out = "Cave2A_Out"; 
local Cave2B_In  = "Cave2B_In";  
local Cave2B_Out = "Cave2B_Out"; 

local Cave3A_In  = "Cave3A_In";  
local Cave3A_Out = "Cave3A_Out"; 
local Cave3B_In  = "Cave3B_In";  
local Cave3B_Out = "Cave3B_Out"; 

local Cave4A_In  = "Cave4A_In";  
local Cave4A_Out = "Cave4A_Out"; 
local Cave4B_In  = "Cave4B_In";  
local Cave4B_Out = "Cave4B_Out"; 

local Cave5A_In  = "Cave5A_In";  
local Cave5A_Out = "Cave5A_Out"; 
local Cave5B_In  = "Cave5B_In";  
local Cave5B_Out = "Cave5B_Out"; 


State
{
	StateName = "INIT",

	OnOneTimeEvent -------------------------------------------------- cryCaveIn
	{
		EventName = ">>> first approach of the first cave <<<",
		Conditions = 
		{	
			OR
			{			
				FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave1A_In, Range = cryCaveInRange},
				FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave1A_In, Range = cryCaveInRange},
				FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave1A_In, Range = cryCaveInRange},
				FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave1A_In, Range = cryCaveInRange},
				FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave1A_In, Range = cryCaveInRange},
			},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "cryCaveIn1", Tag = ftHeroCaine, TargetTag = Cave1A_In},
			FigureOutcryAlert	{TextTag = "cryCaveIn2", Tag = ftAvatar,    TargetTag = Cave1A_In},
			FigureOutcryAlert	{TextTag = "cryCaveIn3", Tag = ftHeroCaine, TargetTag = Cave1A_In},
		},
	},


	
	-- ***************************************************************************
	-- ** ftAvatar = "pl_HumanAvatar"                                            **
	-- ***************************************************************************
	

	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave1A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave2A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave3A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave3B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave4A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave4B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanAvatar gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsNotFlying	{Tag = ftAvatar},
			FigureIsInEntityRange	{Tag = ftAvatar, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftAvatar, TargetTag = Cave5B_Out},
		},
	},
	
	
	
	
	-- ***************************************************************************
	-- ** ftHeroCaine = "pl_HumanHeroCaine"                                         **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave1A_Out},
		},
	},	
	
	OnOneTimeEvent -------------------------------------------------- cryCaveOut
	{
		EventName = ">>> pl_HumanHeroCaine gets out of Cave1 the first time <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave1A_Out, Range = 10},		
		},
		Actions =
		{
			FigureOutcry	{TextTag = "cryCaveOut", Tag = ftHeroCaine},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanHeroCaine gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroCaine, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroCaine, TargetTag = Cave5B_Out},
		},
	},
	
	
	
	-- ***************************************************************************
	-- ** ftHeroOrc = "pl_HumanHeroOrc"                                       **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave1A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5B entered
	{
		EventName = ">>> pl_HumanHeroOrc gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHeroOrc, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHeroOrc, TargetTag = Cave5B_Out},
		},
	},
	
	-- ***************************************************************************
	-- ** ftHero1 = "pl_HumanHeroFirst"                                         **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave1A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5B entered
	{
		EventName = ">>> pl_HumanHeroFirst gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero1, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero1, TargetTag = Cave5B_Out},
		},
	},
	
	-- ***************************************************************************
	-- ** ftHero2 = "pl_HumanHeroSecond"                                        **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave1A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5B entered
	{
		EventName = ">>> pl_HumanHeroSecond gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero2, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero2, TargetTag = Cave5B_Out},
		},
	},
	
	-- ***************************************************************************
	-- ** ftHero3 = "pl_HumanHeroThird"                                         **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave1A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5B entered
	{
		EventName = ">>> pl_HumanHeroThird gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftHero3, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftHero3, TargetTag = Cave5B_Out},
		},
	},

	-- ***************************************************************************
	-- ** ftCompCraig = "pl_HumanCompanionCraig"                                         **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave1A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5B entered
	{
		EventName = ">>> pl_HumanCompFirst gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompCraig, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompCraig, TargetTag = Cave5B_Out},
		},
	},

	-- ***************************************************************************
	-- ** ftCompSariel = "pl_HumanCompanionSariel"                                         **
	-- ***************************************************************************
	
	OnEvent -------------------------------------------------- Area 1A entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave1A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave1A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave1A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 1B entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave1B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave1B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave1B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2A entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave2A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave2A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave2A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 2B entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave2B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave2B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave2B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 3A entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave3A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave3A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave3A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 3B entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave3B_In, non-flying <<<",
		Conditions = 
		{				
			MapFlagIsFalse	{Name = "mf_P706_ShamanExitClosed"},
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave3B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave3B_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 4A entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave4A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave4A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave4A_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 4B entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave4B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave4B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave4B_Out},
		},
	},
	
	OnEvent -------------------------------------------------- Area 5A entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave5A_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave5A_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave5A_Out},
		},
	},	
	
	OnEvent -------------------------------------------------- Area 5B entered
	{
		EventName = ">>> pl_HumanCompSecond gets close to Cave5B_In, non-flying <<<",
		Conditions = 
		{				
			FigureIsInEntityRange	{Tag = ftCompSariel, TargetTag = Cave5B_In, Range = DetectRange},		
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = ftCompSariel, TargetTag = Cave5B_Out},
		},
	},


};