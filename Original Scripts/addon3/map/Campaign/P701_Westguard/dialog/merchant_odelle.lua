local _uSM = GdsCreateStateMachine ("merchant_odelle_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState8 = GdsCreateState (_uSM, "State_8")
_uState12 = GdsCreateState (_uSM, "State_12")
_uState16 = GdsCreateState (_uSM, "State_16")
_uState20 = GdsCreateState (_uSM, "State_20")
_uState26 = GdsCreateState (_uSM, "State_26")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('merchant_odelle'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(MERCHANT_ODELLE)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(MERCHANT_ODELLE)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('merchant_odelle', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "merchant_odelle"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(MERCHANT_ODELLE)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("merchant_odelle")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(MERCHANT_ODELLE)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_004PC", "Don't worry. I'm going to help you.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_006PC", "Not now, merchant. I've more important things to do.", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MERCHANT_ODELLE)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ6_Available', 1, 2))
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState4Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_002", "Welcome back, Shaikan.", 101, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_003", "Have you heard? We've some trouble with the food inside the walls. It won't hold out for long.", 102, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState4Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState8Trans1 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 2))
	_uState8Trans1:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_010PC", "Don't worry. I'm going to help you.", 1, 16777215))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: choice
_uState8Trans2 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 2))
	_uState8Trans2:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_012PC", "Not now, merchant. I've more important things to do.", 2, 16777215))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: choice
_uState8Trans3 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 2))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MERCHANT_ODELLE)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionShowChoices())
	_uState8Trans3 = nil

-- TO STATE: choice
_uState8Trans4 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2))
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState8Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_007PC", "Here are the supplies we found.", 106, 16777215))
	_uState8Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_008", "With these we have enough food for everyone. Thank you so much, Shaikan!", 107, 16777215))
	_uState8Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_009", "Now that the people have their belly filled, it is time for business. However I can't sell them any goods. Those were left outside too. Can you get them for me?", 108, 16777215))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState12Trans1 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 2))
	_uState12Trans1:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_015PC", "Don't worry. I'm going to help you.", 1, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: choice
_uState12Trans2 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 2))
	_uState12Trans2:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_017PC", "Not now, merchant. I've more important things to do.", 2, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: choice
_uState12Trans3 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 2))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MERCHANT_ODELLE)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionShowChoices())
	_uState12Trans3 = nil

-- TO STATE: choice
_uState12Trans4 = GdsCreateTransition (_uState1, _uState12, "State_1", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2))
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState12Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_013", "Welcome back, Shaikan.", 112, 16777215))
	_uState12Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_014", "Now that the people have their belly filled, it is time for business. However I can't sell them any goods. Those were left outside too. Can you get them for me?", 113, 16777215))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState16Trans1 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 2))
	_uState16Trans1:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_021PC", "You're really fond of this dog I can see. I'll send my men to find him.", 1, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: choice
_uState16Trans2 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 2))
	_uState16Trans2:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_023PC", "Not now, merchant. I've more important things to do.", 2, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: choice
_uState16Trans3 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 2))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MERCHANT_ODELLE)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionShowChoices())
	_uState16Trans3 = nil

-- TO STATE: choice
_uState16Trans4 = GdsCreateTransition (_uState1, _uState16, "State_1", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2))
	_uState16Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState16Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState16Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState16Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_018PC", "These are all the goods we found.", 117, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_019", "Allright! The work should be started right now. Thank you for making that possible, Shaikan.", 118, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_020", "My poor Darc is still not back yet, they've seen him at your base. Please catch him for me, just tell him he is a good boy, and he will follow you. ", 119, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState16Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState20Trans1 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T1", "Dialog")
	_uState20Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 2))
	_uState20Trans1:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_026PC", "You're really fond of this dog I can see. I'll send my men to find him.", 1, 16777215))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 1, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState20Trans1 = nil

-- TO STATE: choice
_uState20Trans2 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T2", "Dialog")
	_uState20Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 2))
	_uState20Trans2:AddAction (CScriptActionChoice("P701_DLG_MERCHANTODELLE_028PC", "Not now, merchant. I've more important things to do.", 2, 16777215))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 1, 4))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState20Trans2 = nil

-- TO STATE: choice
_uState20Trans3 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T3", "Dialog")
	_uState20Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 2))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 0, 4))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MERCHANT_ODELLE)', 1, 4))
	_uState20Trans3:AddAction (CScriptActionShowChoices())
	_uState20Trans3 = nil

-- TO STATE: choice
_uState20Trans4 = GdsCreateTransition (_uState1, _uState20, "State_1", "State_20_T4", "Dialog")
	_uState20Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState20Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_024", "Welcome back, Shaikan.", 123, 16777215))
	_uState20Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_025", "My poor Darc is still not back yet, they've seen him at your base. Please catch him for me, just tell him he is a good boy, and he will follow you. ", 124, 16777215))
	_uState20Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState20Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState20, _uBeginState, "State_20", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState26Trans1 = GdsCreateTransition (_uState1, _uState26, "State_1", "State_26_T1", "Dialog")
	_uState26Trans1:AddCondition (CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2))
	_uState26Trans1:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_001", "Oh, what a privilege to meet you, Shaikan! Don't worry about Darc, he is really kind. Mostly... To anyone alive at least, I guess...", 100, 16777215))
	_uState26Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans1 = nil

-- TO STATE: endconversation
_uState26Trans2 = GdsCreateTransition (_uState4, _uState26, "State_4", "State_26_T2", "Dialog")
	_uState26Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 1))
	_uState26Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_004PC", "Don't worry. I'm going to help you.", 99, 16777215))
	_uState26Trans2:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_005", "I knew I could count on you, Shaikan!", 104, 16777215))
	_uState26Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans2 = nil

-- TO STATE: endconversation
_uState26Trans3 = GdsCreateTransition (_uState4, _uState26, "State_4", "State_26_T3", "Dialog")
	_uState26Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 2))
	_uState26Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_006PC", "Not now, merchant. I've more important things to do.", 99, 16777215))
	_uState26Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans3 = nil

-- TO STATE: endconversation
_uState26Trans4 = GdsCreateTransition (_uState8, _uState26, "State_8", "State_26_T4", "Dialog")
	_uState26Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 1))
	_uState26Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_010PC", "Don't worry. I'm going to help you.", 99, 16777215))
	_uState26Trans4:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_011", "I knew I could count on you, Shaikan!", 110, 16777215))
	_uState26Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans4 = nil

-- TO STATE: endconversation
_uState26Trans5 = GdsCreateTransition (_uState8, _uState26, "State_8", "State_26_T5", "Dialog")
	_uState26Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 2))
	_uState26Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_012PC", "Not now, merchant. I've more important things to do.", 99, 16777215))
	_uState26Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans5 = nil

-- TO STATE: endconversation
_uState26Trans6 = GdsCreateTransition (_uState12, _uState26, "State_12", "State_26_T6", "Dialog")
	_uState26Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 1))
	_uState26Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_015PC", "Don't worry. I'm going to help you.", 99, 16777215))
	_uState26Trans6:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_016", "I knew I could count on you, Shaikan!", 115, 16777215))
	_uState26Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans6 = nil

-- TO STATE: endconversation
_uState26Trans7 = GdsCreateTransition (_uState12, _uState26, "State_12", "State_26_T7", "Dialog")
	_uState26Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 2))
	_uState26Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_017PC", "Not now, merchant. I've more important things to do.", 99, 16777215))
	_uState26Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans7 = nil

-- TO STATE: endconversation
_uState26Trans8 = GdsCreateTransition (_uState16, _uState26, "State_16", "State_26_T8", "Dialog")
	_uState26Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 1))
	_uState26Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_021PC", "You're really fond of this dog I can see. I'll send my men to find him.", 99, 16777215))
	_uState26Trans8:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_022", "I knew I could count on you, Shaikan!", 121, 16777215))
	_uState26Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans8 = nil

-- TO STATE: endconversation
_uState26Trans9 = GdsCreateTransition (_uState16, _uState26, "State_16", "State_26_T9", "Dialog")
	_uState26Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 2))
	_uState26Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_023PC", "Not now, merchant. I've more important things to do.", 99, 16777215))
	_uState26Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans9 = nil

-- TO STATE: endconversation
_uState26Trans10 = GdsCreateTransition (_uState20, _uState26, "State_20", "State_26_T10", "Dialog")
	_uState26Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 1))
	_uState26Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_026PC", "You're really fond of this dog I can see. I'll send my men to find him.", 99, 16777215))
	_uState26Trans10:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_027", "I knew I could count on you, Shaikan!", 126, 16777215))
	_uState26Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans10 = nil

-- TO STATE: endconversation
_uState26Trans11 = GdsCreateTransition (_uState20, _uState26, "State_20", "State_26_T11", "Dialog")
	_uState26Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 2))
	_uState26Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_MERCHANTODELLE_028PC", "Not now, merchant. I've more important things to do.", 99, 16777215))
	_uState26Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MERCHANT_ODELLE)', 0, 4))
	_uState26Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans11 = nil

-- TO STATE: endconversation
_uState26Trans12 = GdsCreateTransition (_uState1, _uState26, "State_1", "State_26_T12", "Dialog")
	_uState26Trans12:AddCondition (CScriptConditionValue('', 'mf_SQ8_Accepted', 1, 2))
	_uState26Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState26Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState26Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState26Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState26Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState26Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState26Trans12:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_029", "I'm worried about him, he usually doesn't stay out for this long. He must have gone for a walk on the cliffs, or got into trouble...", 128, 16777215))
	_uState26Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans12 = nil

-- TO STATE: endconversation
_uState26Trans13 = GdsCreateTransition (_uState1, _uState26, "State_1", "State_26_T13", "Dialog")
	_uState26Trans13:AddCondition (CScriptConditionValue('', 'mf_SQ8_Finished', 1, 2))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState26Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ8_Accepted', 1, 2) ))
	_uState26Trans13:AddAction (CScriptActionSay("merchant_odelle", "P701_DLG_MERCHANTODELLE_030", "Here you are, I missed you so much. Thank you Shaikan for getting him back. I just love this big smelly dog. I'll be forever in your debt, Shaikan. Please, take this... I insist!", 129, 16777215))
	_uState26Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans13 = nil

-- TO STATE: endconversation
_uState26Trans14 = GdsCreateTransition (_uState1, _uState26, "State_1", "State_26_T14", "Dialog")
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_OdelleFirstMet', 0, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Available', 1, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ6_Finished', 1, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ7_Finished', 1, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ8_Accepted', 1, 2) ))
	_uState26Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ8_Finished', 1, 2) ))
	_uState26Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "merchant_odelle"))
	_uState26Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MERCHANT_ODELLE)', 1, 4))
	_uState26Trans14 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(MERCHANT_ODELLE)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_OdelleFirstMet', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MERCHANT_ODELLE)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(MERCHANT_ODELLE)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_SQ6_Available', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_SQ6_Accepted', 1, 4))
	_uEndActions2:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MERCHANT_ODELLE)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(MERCHANT_ODELLE)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MERCHANT_ODELLE)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(MERCHANT_ODELLE)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_SQ6_Finished', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_6_Completed', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_SQ7_Accepted', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MERCHANT_ODELLE)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(MERCHANT_ODELLE)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MERCHANT_ODELLE)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(MERCHANT_ODELLE)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_SQ6_Finished', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_6_Completed', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_SQ7_Accepted', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(MERCHANT_ODELLE)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(MERCHANT_ODELLE)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(MERCHANT_ODELLE)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(MERCHANT_ODELLE)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'mf_SQ7_Finished', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'mf_SQ8_Accepted', 1, 4))
	_uEndActions8:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 0))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(MERCHANT_ODELLE)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(MERCHANT_ODELLE)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(MERCHANT_ODELLE)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(MERCHANT_ODELLE)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'mf_SQ7_Finished', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'mf_SQ8_Accepted', 1, 4))
	_uEndActions10:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 0))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(MERCHANT_ODELLE)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(MERCHANT_ODELLE)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(MERCHANT_ODELLE)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(MERCHANT_ODELLE)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(MERCHANT_ODELLE)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(MERCHANT_ODELLE)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_SQ8_Finished', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_8_Completed', 1, 4))
	_uEndActions13:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 0))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(MERCHANT_ODELLE)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState26, _uState26, "State_26", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(MERCHANT_ODELLE)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "merchant_odelle"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_OdelleFirstMet', 1, 4))
	_uEndActions14:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 0))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(MERCHANT_ODELLE)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 4))
	_uEndActions14 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState26, _uBeginState, "State_26", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('merchant_odelle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState8 = nil
_uState12 = nil
_uState16 = nil
_uState20 = nil
_uState26 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("merchant_odelle_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MERCHANT_ODELLE)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'merchant_odelle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "merchant_odelle", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'merchant_odelle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
