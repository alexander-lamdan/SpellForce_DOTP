local _uSM = GdsCreateStateMachine ("undead_captain_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState20 = GdsCreateState (_uSM, "State_20")
_uState25 = GdsCreateState (_uSM, "State_25")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('undead_captain'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(UNDEAD_CAPTAIN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(UNDEAD_CAPTAIN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('undead_captain', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("undead_captain", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "undead_captain"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(UNDEAD_CAPTAIN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('undead_captain', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("undead_captain")
		_uRenderOnly:Add("Uland")
		_uRenderOnly:Add("Ur_Dragon")
		_uRenderOnly:Add("RenderInDialog01")
		_uRenderOnly:Add("RenderInDialog02")
		_uRenderOnly:Add("RenderInDialog03")
		_uRenderOnly:Add("RenderInDialog04")
		_uRenderOnly:Add("RenderInDialog05")
		_uRenderOnly:Add("RenderInDialog06")
		_uRenderOnly:Add("RenderInDialog07")
		_uRenderOnly:Add("RenderInDialog08")
		_uRenderOnly:Add("RenderInDialog09")
		_uRenderOnly:Add("RenderInDialog10")
	_uStateBeginDelayTrans:AddAction (_uRenderOnly)
	-- reset all choice onetime flags upon dialog begin
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(UNDEAD_CAPTAIN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_captain', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_023PC", "Sure Captain, whatever you say.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_024PC", "Not now, Captain.", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 2))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 0, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionShowChoices())
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2))
	_uState5Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ))
	_uState5Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ))
	_uState5Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState5Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState5Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState5Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_019", "Hey, Smart guy!", 118, 16777215))
	_uState5Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_020", "I gotta ask you a favour, Kiddo!", 119, 16777215))
	_uState5Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_021PC", "What's up Captain?", 120, 16777215))
	_uState5Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_022", "Me and my men were making merry. But now the rum's gone. None of us can walk straight anymore. So you're the best luck to happen to us. Go to our ship and fetch a barrel of rum and bring it to me! *Hick*", 121, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState5Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_captain', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState10Trans1 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 2))
	_uState10Trans1:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_036PC", "Sure Captain, whatever you say.", 1, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: choice
_uState10Trans2 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 2))
	_uState10Trans2:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_037PC", "Not now, Captain.", 2, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: choice
_uState10Trans3 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 2))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionShowChoices())
	_uState10Trans3 = nil

-- TO STATE: choice
_uState10Trans4 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState10Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_029", "Well I've got another thingy for ya!", 128, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_030PC", "What is it this time?", 129, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_031", "Can't find my toliscap!", 130, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_032PC", "Your what?", 131, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_033", "My tiliscap!", 132, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_034PC", "Ah, your telescope.", 133, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_035", "That's what I say. Can you find me one?", 134, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState10Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_captain', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState15Trans1 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 2))
	_uState15Trans1:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_047PC", "Sure Captain, whatever you say.", 1, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: choice
_uState15Trans2 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 2))
	_uState15Trans2:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_048PC", "Not now, Captain.", 2, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: choice
_uState15Trans3 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 2))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionShowChoices())
	_uState15Trans3 = nil

-- TO STATE: choice
_uState15Trans4 = GdsCreateTransition (_uState1, _uState15, "State_1", "State_15_T4", "Dialog")
	_uState15Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 751, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState15Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_042", "Did your Dragon eat my Parrot?", 141, 16777215))
	_uState15Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_043PC", "What?!", 142, 16777215))
	_uState15Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_044", "I'm sure your bloody Dragon ate my damn' ol' fat parrot!", 143, 16777215))
	_uState15Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_045PC", "No way!", 144, 16777215))
	_uState15Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_046", "Well I need a new Parrot! Bring me one!", 145, 16777215))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState15Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_captain', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState20Trans1 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T1", "Dialog")
	_uState20Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 2))
	_uState20Trans1:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_056PC", "Sure Captain, whatever you say.", 1, 16777215))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 1, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState20Trans1 = nil

-- TO STATE: choice
_uState20Trans2 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T2", "Dialog")
	_uState20Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 2))
	_uState20Trans2:AddAction (CScriptActionChoice("P709_DLG_UNDEADSHIPCAPTAIN_057PC", "Not now, Captain.", 2, 16777215))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 1, 4))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState20Trans2 = nil

-- TO STATE: choice
_uState20Trans3 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T3", "Dialog")
	_uState20Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 2))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 0, 4))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState20Trans3:AddAction (CScriptActionShowChoices())
	_uState20Trans3 = nil

-- TO STATE: choice
_uState20Trans4 = GdsCreateTransition (_uState1, _uState20, "State_1", "State_20_T4", "Dialog")
	_uState20Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2))
	_uState20Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_51', 2))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 1) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 751, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 748, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState20Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_053", "Ya know what, smart guy! My parrot said it wants some treasure!", 152, 16777215))
	_uState20Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_054PC", "And who are you to argue with your parrot?", 153, 16777215))
	_uState20Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_055", "See! I said you're a smart guy! Those crystals on that Centre Island would be great.", 154, 16777215))
	_uState20Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState20Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState20, _uBeginState, "State_20", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_captain', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState25Trans1 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_001", "Ah, the smart guy again.", 100, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_002PC", "That crystal you stole - it wouldn't look... like that one?", 101, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_003", "Stars and Stones, mortal! Where did you get that?", 102, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_004PC", "A Wolf Spirit guarded it.", 103, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_005", "So there IS a connection! I knew it. Several weeks ago, I witnessed the Lich and the Wolf in what you could describe as earnest conversation, if that is even possible.", 104, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_006PC", "Considering our own quest, this relation seems more than probable. I need that crystal, Halbeard.", 105, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_007", "No way, Kiddo! After all we've been through because of that crystal?", 106, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_008PC", "Then tell me, what I have to do, that you can give it to me.", 107, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_009", "Not so smart now, are we? Kill that Lich, Kiddo!", 108, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_010PC", "You think we can manage something you failed to do with hundreds of years experience?", 109, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_011", "If you killed that Wolf, then you might get a shot at the Lich too.", 110, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_012PC", "I need an army for that.", 111, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_013", "Can't help you with that, Kiddo. But you're a smart guy. You'll come up with something.", 112, 16777215))
	_uState25Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: endconversation
_uState25Trans2 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ))
	_uState25Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2))
	_uState25Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2))
	_uState25Trans2:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState25Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans2:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_014", "Ah, the smart guy again.", 113, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_015PC", "The Lich is finally gone for good. This is his skull.", 114, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_016", "After all those years! Free! Aonir with you, Kiddo! Blessed shall be your children and your children's children.", 115, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_017PC", "Yes, yes. Thank you. Now, could you give me that crystal?", 116, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_018", "Sure, sure, Kiddo! Here you go! You know what? Go use my ship anytime you want to go anywhere you want.", 117, 16777215))
	_uState25Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans2 = nil

-- TO STATE: endconversation
_uState25Trans3 = GdsCreateTransition (_uState5, _uState25, "State_5", "State_25_T3", "Dialog")
	_uState25Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 1))
	_uState25Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_023PC", "Sure Captain, whatever you say.", 99, 16777215))
	_uState25Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans3 = nil

-- TO STATE: endconversation
_uState25Trans4 = GdsCreateTransition (_uState5, _uState25, "State_5", "State_25_T4", "Dialog")
	_uState25Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 2))
	_uState25Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_024PC", "Not now, Captain.", 99, 16777215))
	_uState25Trans4:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_025", "Ah, crap! Maybe later then.", 124, 16777215))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans4 = nil

-- TO STATE: endconversation
_uState25Trans5 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T5", "Dialog")
	_uState25Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1))
	_uState25Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1))
	_uState25Trans5:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState25Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans5:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_026", "Hey, Smart guy!", 125, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_027PC", "Here's your rum, drunkard!", 126, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_028", "There's no thing like a good barrel of rum!", 127, 16777215))
	_uState25Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans5 = nil

-- TO STATE: endconversation
_uState25Trans6 = GdsCreateTransition (_uState10, _uState25, "State_10", "State_25_T6", "Dialog")
	_uState25Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 1))
	_uState25Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_036PC", "Sure Captain, whatever you say.", 99, 16777215))
	_uState25Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans6 = nil

-- TO STATE: endconversation
_uState25Trans7 = GdsCreateTransition (_uState10, _uState25, "State_10", "State_25_T7", "Dialog")
	_uState25Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 2))
	_uState25Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_037PC", "Not now, Captain.", 99, 16777215))
	_uState25Trans7:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_038", "Ah, crap! Maybe later then.", 137, 16777215))
	_uState25Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans7 = nil

-- TO STATE: endconversation
_uState25Trans8 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T8", "Dialog")
	_uState25Trans8:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1))
	_uState25Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 751, 1, 1, 1))
	_uState25Trans8:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState25Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans8:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_039", "Hey, Smart guy!", 138, 16777215))
	_uState25Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_040PC", "Here's a telescope. Are you sure, you know which way to use it?", 139, 16777215))
	_uState25Trans8:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_041", "Bah! What does a landlubber like you know about toliscaps!", 140, 16777215))
	_uState25Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans8 = nil

-- TO STATE: endconversation
_uState25Trans9 = GdsCreateTransition (_uState15, _uState25, "State_15", "State_25_T9", "Dialog")
	_uState25Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 1))
	_uState25Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_047PC", "Sure Captain, whatever you say.", 99, 16777215))
	_uState25Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans9 = nil

-- TO STATE: endconversation
_uState25Trans10 = GdsCreateTransition (_uState15, _uState25, "State_15", "State_25_T10", "Dialog")
	_uState25Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 2))
	_uState25Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_048PC", "Not now, Captain.", 99, 16777215))
	_uState25Trans10:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_049", "But your Dragon... Ah, crap! Maybe later then.", 148, 16777215))
	_uState25Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans10 = nil

-- TO STATE: endconversation
_uState25Trans11 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T11", "Dialog")
	_uState25Trans11:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1))
	_uState25Trans11:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 748, 1, 1, 1))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 751, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans11:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_050", "Hey, Smart guy!", 149, 16777215))
	_uState25Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_051PC", "Here's a big, fat ol' peng... ah parrot!", 150, 16777215))
	_uState25Trans11:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_052", "Come to papa, Dori!", 151, 16777215))
	_uState25Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans11 = nil

-- TO STATE: endconversation
_uState25Trans12 = GdsCreateTransition (_uState20, _uState25, "State_20", "State_25_T12", "Dialog")
	_uState25Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 1))
	_uState25Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_056PC", "Sure Captain, whatever you say.", 99, 16777215))
	_uState25Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans12 = nil

-- TO STATE: endconversation
_uState25Trans13 = GdsCreateTransition (_uState20, _uState25, "State_20", "State_25_T13", "Dialog")
	_uState25Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 2))
	_uState25Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_057PC", "Not now, Captain.", 99, 16777215))
	_uState25Trans13:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_058", "But Dori said... Ah, crap! Maybe later then.", 157, 16777215))
	_uState25Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uState25Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans13 = nil

-- TO STATE: endconversation
_uState25Trans14 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T14", "Dialog")
	_uState25Trans14:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 1))
	_uState25Trans14:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 58, 1, 1, 1))
	_uState25Trans14:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 60, 1, 1, 1))
	_uState25Trans14:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 61, 1, 1, 1))
	_uState25Trans14:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 756, 1, 1, 1))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 751, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 748, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans14:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_51', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))))) ))
	_uState25Trans14:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_059", "Hey, Smart guy!", 158, 16777215))
	_uState25Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSHIPCAPTAIN_060PC", "Some shiny crystals for the parrot!", 159, 16777215))
	_uState25Trans14:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_061", "Look, Dori! Such a nice guy! What? Yes, we should give him a reward.", 160, 16777215))
	_uState25Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans14 = nil

-- TO STATE: endconversation
_uState25Trans15 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T15", "Dialog")
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_31', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_32', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_3', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 754, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_5', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 751, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_6', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 748, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_7', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_51', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))))) ))
	_uState25Trans15:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_8', 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 58, 1, 1, 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 60, 1, 1, 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 61, 1, 1, 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 756, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))))) ))
	_uState25Trans15:AddAction (CScriptActionSay("undead_captain", "P709_DLG_UNDEADSHIPCAPTAIN_062", "Hey, Smart guy! Maybe there will be a final request very soon... do not forget to visit me again!", 161, 16777215))
	_uState25Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_captain"))
	_uState25Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_CAPTAIN)', 1, 4))
	_uState25Trans15 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_MQ_3_Accepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('undead_captain', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P709_MQ_3_Completed', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_5_Accepted', 1, 4))
	_uEndActions3:AddAction (CScriptActionDialogEnable('undead_captain', 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_5_Completed', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_6_Accepted', 1, 4))
	_uEndActions6:AddAction (CScriptActionDialogEnable('undead_captain', 0))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_6_Completed', 1, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_7_Accepted', 1, 4))
	_uEndActions9:AddAction (CScriptActionDialogEnable('undead_captain', 0))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_7_Completed', 1, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_8_Accepted', 1, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_8_Completed', 1, 4))
	_uEndActions14:AddAction (CScriptActionDialogEnable('undead_captain', 0))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(UNDEAD_CAPTAIN)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_captain"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(UNDEAD_CAPTAIN)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 4))
	_uEndActions15 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_captain', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState5 = nil
_uState10 = nil
_uState15 = nil
_uState20 = nil
_uState25 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("undead_captain_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(UNDEAD_CAPTAIN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_captain'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_captain", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_captain', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
