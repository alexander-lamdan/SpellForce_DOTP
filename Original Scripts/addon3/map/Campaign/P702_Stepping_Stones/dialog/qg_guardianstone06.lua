local _uSM = GdsCreateStateMachine ("qg_guardianstone06_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState15 = GdsCreateState (_uSM, "State_15")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('qg_guardianstone06'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(QG_GUARDIANSTONE06)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(QG_GUARDIANSTONE06)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('qg_guardianstone06', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "qg_guardianstone06"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(QG_GUARDIANSTONE06)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone06', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("qg_guardianstone06")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(QG_GUARDIANSTONE06)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P702_GuardianStone06Known', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone06', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_004PC", " (Accept) ", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_006PC", " (Leave) ", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'mf_P702_EreonAccepted', 0, 2))
	_uState3Trans4:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_001", " (There is a name written on the top of the stone: EREON. Below the name you read... ) ", 100, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_002", " (I challenge you to a trial of wits! There are 5 people on this island, but only one of them speaks the truth. Others are lying but may occassionally tell the truth. My question is: who is the only true person here?) ", 101, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_003", " (Your trial is completed when you return here and say the name aloud of the one who tells only the truth.) ", 102, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState3Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone06', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState7Trans1 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'mf_P702_EreonFalkmarTalked', 1, 2))
	_uState7Trans1:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_008PC", "Falkmar tells the truth.", 1, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: choice
_uState7Trans2 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'mf_P702_EreonDrMauserTalked', 1, 2))
	_uState7Trans2:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_010PC", "Dr. Mauser tells the truth.", 2, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: choice
_uState7Trans3 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'mf_P702_EreonEinarTalked', 1, 2))
	_uState7Trans3:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_012PC", "Sergeant Einar tells the truth.", 3, 16777215))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans3 = nil

-- TO STATE: choice
_uState7Trans4 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T4", "Dialog")
	_uState7Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans4:AddCondition (CScriptConditionValue('', 'mf_P702_EreonAgathosTalked', 1, 2))
	_uState7Trans4:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_014PC", "Agathos tells the truth.", 4, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans4 = nil

-- TO STATE: choice
_uState7Trans5 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T5", "Dialog")
	_uState7Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans5:AddCondition (CScriptConditionValue('', 'mf_P702_EreonUrgiTalked', 1, 2))
	_uState7Trans5:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_016PC", "Urgi tells the truth.", 5, 16777215))
	_uState7Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans5 = nil

-- TO STATE: choice
_uState7Trans6 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T6", "Dialog")
	_uState7Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans6:AddCondition (CScriptConditionValue('', 'mf_P702_EreonNotTalked', 0, 2))
	_uState7Trans6:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_018PC", "I need to think about this some more.", 6, 16777215))
	_uState7Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans6 = nil

-- TO STATE: choice
_uState7Trans7 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T7", "Dialog")
	_uState7Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 2))
	_uState7Trans7:AddCondition (CScriptConditionValue('', 'mf_P702_EreonNotTalked', 1, 2))
	_uState7Trans7:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE06_020PC", "I'm unsure, I have to speak with these people first.", 7, 16777215))
	_uState7Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans7 = nil

-- TO STATE: choice
_uState7Trans8 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T8", "Dialog")
	_uState7Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 2))
	_uState7Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 0, 4))
	_uState7Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans8:AddAction (CScriptActionShowChoices())
	_uState7Trans8 = nil

-- TO STATE: choice
_uState7Trans9 = GdsCreateTransition (_uState1, _uState7, "State_1", "State_7_T9", "Dialog")
	_uState7Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_EreonAccepted', 0, 2) ))
	_uState7Trans9:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_007", " (The Guardian Stone stands there silently. Are you ready to speak the name? Who is the true person?) ", 106, 16777215))
	_uState7Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState7Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone06', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState15Trans1 = GdsCreateTransition (_uState3, _uState15, "State_3", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 1))
	_uState15Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_004PC", " (Accept) ", 99, 16777215))
	_uState15Trans1:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_005", " (When you finish reading the carved letters dissolve into the stone. The text is gone.) ", 104, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: endconversation
_uState15Trans2 = GdsCreateTransition (_uState3, _uState15, "State_3", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 2))
	_uState15Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_006PC", " (Leave) ", 99, 16777215))
	_uState15Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: endconversation
_uState15Trans3 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 1))
	_uState15Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_008PC", "Falkmar tells the truth.", 99, 16777215))
	_uState15Trans3:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_009", " (Nothing happens.) ", 108, 16777215))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans3 = nil

-- TO STATE: endconversation
_uState15Trans4 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T4", "Dialog")
	_uState15Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 2))
	_uState15Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_010PC", "Dr. Mauser tells the truth.", 99, 16777215))
	_uState15Trans4:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_011", " (Nothing happens.) ", 110, 16777215))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans4 = nil

-- TO STATE: endconversation
_uState15Trans5 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T5", "Dialog")
	_uState15Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 3))
	_uState15Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_012PC", "Sergeant Einar tells the truth.", 99, 16777215))
	_uState15Trans5:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_013", " (Nothing happens.) ", 112, 16777215))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans5 = nil

-- TO STATE: endconversation
_uState15Trans6 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T6", "Dialog")
	_uState15Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 4))
	_uState15Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_014PC", "Agathos tells the truth.", 99, 16777215))
	_uState15Trans6:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_015", " (Nothing happens.) ", 114, 16777215))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans6 = nil

-- TO STATE: endconversation
_uState15Trans7 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T7", "Dialog")
	_uState15Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 5))
	_uState15Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_016PC", "Urgi tells the truth.", 99, 16777215))
	_uState15Trans7:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_017", " (You hear a familiar voice...) ", 116, 16777215))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans7 = nil

-- TO STATE: endconversation
_uState15Trans8 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T8", "Dialog")
	_uState15Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 6))
	_uState15Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_018PC", "I need to think about this some more.", 99, 16777215))
	_uState15Trans8:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_019", " (You leave the stone behind.) ", 118, 16777215))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans8 = nil

-- TO STATE: endconversation
_uState15Trans9 = GdsCreateTransition (_uState7, _uState15, "State_7", "State_15_T9", "Dialog")
	_uState15Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone06", 7))
	_uState15Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE06_020PC", "I'm unsure, I have to speak with these people first.", 99, 16777215))
	_uState15Trans9:AddAction (CScriptActionSay("qg_guardianstone06", "P702_DLG_GUARDIANSTONE06_021", " (You leave the stone behind.) ", 120, 16777215))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uState15Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone06"))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE06)', 1, 4))
	_uState15Trans9 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_EreonAccepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonAgathosTalked', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonDrMauserTalked', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonEinarTalked', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonFalkmarTalked', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonUrgiTalked', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_EreonResetOutcry', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_Ereon_Reset_Outcry_HasTriggered', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonAgathosTalked', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonDrMauserTalked', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonEinarTalked', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonFalkmarTalked', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonUrgiTalked', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P702_EreonResetOutcry', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_Ereon_Reset_Outcry_HasTriggered', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonAgathosTalked', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonDrMauserTalked', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonEinarTalked', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonFalkmarTalked', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonUrgiTalked', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P702_EreonResetOutcry', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_Ereon_Reset_Outcry_HasTriggered', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonAgathosTalked', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonDrMauserTalked', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonEinarTalked', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonFalkmarTalked', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonUrgiTalked', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P702_EreonResetOutcry', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_Ereon_Reset_Outcry_HasTriggered', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P702_EreonDone', 1, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(QG_GUARDIANSTONE06)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone06"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(QG_GUARDIANSTONE06)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 4))
	_uEndActions9 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE06)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone06', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState7 = nil
_uState15 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("qg_guardianstone06_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/idol_BeginDialog.tak', 'pl_HumanAvatar', 'qg_guardianstone06'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE06)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

