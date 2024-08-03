State
{
	StateName = "INIT",
	
	--Entry save
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P710_StartIntroCS_End"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_StartIntroCS_End_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_StartIntroCS_End_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_StartIntroCS_End_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
				{
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless01_Quest"},
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless02_Quest"},
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless03_Quest"},
				},
			MapFlagIsTrue{Name = "mf_P710_PowertheTowers_Quest"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking {}
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TalktoRealmorShaikanLeader_SaveTimer1"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TalktoRealmorShaikanLeader_SaveTimer1", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TalktoRealmorShaikanLeader_SaveTimer1"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
				{
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless01_Quest"},
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless02_Quest"},
					MapFlagIsTrue {Name = "mf_P710_Destroy_Nameless03_Quest"},
				},
			MapFlagIsFalse	{Name = "mf_P710_PowertheTowers_Quest"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking {}
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TalktoRealmorShaikanLeader_SaveTimer2"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TalktoRealmorShaikanLeader_SaveTimer2", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TalktoRealmorShaikanLeader_SaveTimer2"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS01"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Nameless1_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Nameless1_SaveTimer", Seconds = 8},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Nameless1_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS02"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Nameless2_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Nameless2_SaveTimer", Seconds = 8},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_Nameless2_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYNAMELESS03"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_Nameless3_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_Nameless3_SaveTimer", Seconds = 8},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TALKTOREALMLIEUTENANT"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TalktoRealmLieutenant_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TalktoRealmLieutenant_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TalktoRealmLieutenant_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TALKTOSHAIKANLEADER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TalktoShaikanLeader_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TalktoShaikanLeader_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TalktoShaikanLeader_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REDEDICATETHESHRINE"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_RededicatetheShrine_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_RededicatetheShrine_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_RededicatetheShrine_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P710_Destroy_Nameless01_Quest"},
			MapFlagIsFalse {Name = "mf_P710_Destroy_Nameless02_Quest"},
			MapFlagIsFalse {Name = "mf_P710_Destroy_Nameless03_Quest"},
			MapFlagIsTrue{Name = "mf_P710_PowertheTowers_Quest"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_PowertheTowersShaikan_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_PowertheTowersShaikan_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_PowertheTowersShaikan_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_REPAIR"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_PowertheTowersRepair_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_PowertheTowersRepair_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_PowertheTowersRepair_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_GATHER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_PowertheTowersGather_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_PowertheTowersGather_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_PowertheTowersGather_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_POWERTHETOWERS_POWER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_PowertheTowersPower_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_PowertheTowersPower_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_PowertheTowersPower_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DEFEATSARIELANDZAZHUT"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_DefeatSarielandZazhut_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_DefeatSarielandZazhut_SaveTimer", Seconds = 8},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_DefeatSarielandZazhut_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_LUREZAZHUT_WEAKEN"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_LureZazhutWeaken_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_LureZazhutWeaken_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_LureZazhutWeaken_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REPAIRTHEGATES_FINDCOG"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_RepairtheGatesFindCog_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_RepairtheGatesFindCog_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_RepairtheGatesFindCog_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REPAIRTHEGATES_PUTCOG"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_RepairtheGatesPutCog_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_RepairtheGatesPutCog_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_RepairtheGatesPutCog_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_REPAIRTHEGATES_USELEVER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_RepairtheGatesUseLever_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_RepairtheGatesUseLever_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_RepairtheGatesUseLever_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_UNDEADS_GATHER"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_UNDEADS_BRING"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_UndeadsBring_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_UndeadsBring_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_UndeadsBring_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_DESTROYTOWERS"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_DestroyTowers_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_DestroyTowers_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_DestroyTowers_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TWIDDLE_FOURTWIDDLES"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TwiddleFourTwiddles_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TwiddleFourTwiddles_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TwiddleFourTwiddles_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TWIDDLE_OPENSESAME"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TwiddleOpenSesame_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TwiddleOpenSesame_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TwiddleOpenSesame_SaveTimer"},
			DoAutoSave(),
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P710_TwiddleISaidOpenSesame_SaveTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P710_TwiddleISaidOpenSesame_SaveTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},			
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P710_TwiddleISaidOpenSesame_SaveTimer"},
			DoAutoSave(),
		},
	},
};
