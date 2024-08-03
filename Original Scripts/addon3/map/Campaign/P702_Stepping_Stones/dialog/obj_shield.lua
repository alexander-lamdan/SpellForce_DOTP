local _uSM = GdsCreateStateMachine ("obj_shield_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState22 = GdsCreateState (_uSM, "State_22")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('obj_shield'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(OBJ_SHIELD)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(OBJ_SHIELD)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('obj_shield', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "obj_shield"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(OBJ_SHIELD)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('obj_shield', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("obj_shield")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(OBJ_SHIELD)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('obj_shield', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState3Trans1 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldActivated', 0, 2))
	_uState3Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldKnown', 0, 2) ))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: elseif
_uState3Trans2 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldKnown', 0, 2))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldKnown', 1, 4))
	_uState3Trans2:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_001", " (The inscription on the pedestal reads...) ", 100, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState3Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('obj_shield', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_003PC", " (Activate) ", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_004PC", " (Rotate) ", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 2))
	_uState5Trans3:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_015PC", " (Leave) ", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 2))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionShowChoices())
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState3, _uState5, "State_3", "State_5_T5", "Dialog")
	_uState5Trans5:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_002", " (His foe, the crystal witch, who stole his treasured cup.) ", 101, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState14, _uState5, "State_14", "State_5_T6", "Dialog")
	_uState5Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 1))
	_uState5Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_010PC", " (Rotate it to face the torch) ", 99, 16777215))
	_uState5Trans6:AddAction (CScriptActionChangeObject('pzl_TiaraShield', 860, 334.7, 297.5, 5.532693728822))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacNowhere', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacTorch', 1, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacChest', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCauldron', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCup', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans6 = nil

-- TO STATE: choice
_uState5Trans7 = GdsCreateTransition (_uState14, _uState5, "State_14", "State_5_T7", "Dialog")
	_uState5Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 2))
	_uState5Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_011PC", " (Rotate it to face the chest) ", 99, 16777215))
	_uState5Trans7:AddAction (CScriptActionChangeObject('pzl_TiaraShield', 860, 334.7, 297.5, 5.9166661642608))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacNowhere', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacTorch', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacChest', 1, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCauldron', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCup', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans7 = nil

-- TO STATE: choice
_uState5Trans8 = GdsCreateTransition (_uState14, _uState5, "State_14", "State_5_T8", "Dialog")
	_uState5Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 3))
	_uState5Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_012PC", " (Rotate it to face the cauldron) ", 99, 16777215))
	_uState5Trans8:AddAction (CScriptActionChangeObject('pzl_TiaraShield', 860, 334.7, 297.5, 5.1138147083434))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacNowhere', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacTorch', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacChest', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCauldron', 1, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCup', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans8 = nil

-- TO STATE: choice
_uState5Trans9 = GdsCreateTransition (_uState14, _uState5, "State_14", "State_5_T9", "Dialog")
	_uState5Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 4))
	_uState5Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_013PC", " (Rotate it to face the cup) ", 99, 16777215))
	_uState5Trans9:AddAction (CScriptActionChangeObject('pzl_TiaraShield', 860, 334.7, 297.5, 0.69813170079773))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacNowhere', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacTorch', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacChest', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCauldron', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldFacCup', 1, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans9 = nil

-- TO STATE: choice
_uState5Trans10 = GdsCreateTransition (_uState14, _uState5, "State_14", "State_5_T10", "Dialog")
	_uState5Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 5))
	_uState5Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_014PC", " (Leave it as it is now.) ", 99, 16777215))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState5Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('obj_shield', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState7Trans1 = GdsCreateTransition (_uState5, _uState7, "State_5", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 2))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_004PC", " (Rotate) ", 99, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState7Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('obj_shield', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState14Trans1 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 2))
	_uState14Trans1:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacTorch', 0, 2))
	_uState14Trans1:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_010PC", " (Rotate it to face the torch) ", 1, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 1, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans1 = nil

-- TO STATE: choice
_uState14Trans2 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T2", "Dialog")
	_uState14Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 2))
	_uState14Trans2:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacChest', 0, 2))
	_uState14Trans2:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_011PC", " (Rotate it to face the chest) ", 2, 16777215))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 1, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans2 = nil

-- TO STATE: choice
_uState14Trans3 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T3", "Dialog")
	_uState14Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 2))
	_uState14Trans3:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacCauldron', 0, 2))
	_uState14Trans3:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_012PC", " (Rotate it to face the cauldron) ", 3, 16777215))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 1, 4))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans3 = nil

-- TO STATE: choice
_uState14Trans4 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T4", "Dialog")
	_uState14Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 0, 2))
	_uState14Trans4:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacCup', 0, 2))
	_uState14Trans4:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_013PC", " (Rotate it to face the cup) ", 4, 16777215))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(OBJ_SHIELD)', 1, 4))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans4 = nil

-- TO STATE: choice
_uState14Trans5 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T5", "Dialog")
	_uState14Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 0, 2))
	_uState14Trans5:AddAction (CScriptActionChoice("P702_DLG_TIARASHIELD_014PC", " (Leave it as it is now.) ", 5, 16777215))
	_uState14Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(OBJ_SHIELD)', 1, 4))
	_uState14Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans5 = nil

-- TO STATE: choice
_uState14Trans6 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T6", "Dialog")
	_uState14Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 2))
	_uState14Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 0, 4))
	_uState14Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans6:AddAction (CScriptActionShowChoices())
	_uState14Trans6 = nil

-- TO STATE: choice
_uState14Trans7 = GdsCreateTransition (_uState7, _uState14, "State_7", "State_14_T7", "Dialog")
	_uState14Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacNowhere', 1, 2) ))
	_uState14Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacTorch', 1, 2) ))
	_uState14Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacChest', 1, 2) ))
	_uState14Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacCauldron', 1, 2) ))
	_uState14Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacCup', 1, 2) ))
	_uState14Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans7 = nil

-- TO STATE: choice
_uState14Trans8 = GdsCreateTransition (_uState7, _uState14, "State_7", "State_14_T8", "Dialog")
	_uState14Trans8:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacNowhere', 1, 2))
	_uState14Trans8:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_005", " (The shield is not facing any other pedestal at the moment. In which direction do you rotate the shield?) ", 104, 16777215))
	_uState14Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans8 = nil

-- TO STATE: choice
_uState14Trans9 = GdsCreateTransition (_uState7, _uState14, "State_7", "State_14_T9", "Dialog")
	_uState14Trans9:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacTorch', 1, 2))
	_uState14Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacNowhere', 1, 2) ))
	_uState14Trans9:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_006", " (The shield is facing the torch. In which direction do you rotate the shield?) ", 105, 16777215))
	_uState14Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans9 = nil

-- TO STATE: choice
_uState14Trans10 = GdsCreateTransition (_uState7, _uState14, "State_7", "State_14_T10", "Dialog")
	_uState14Trans10:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacChest', 1, 2))
	_uState14Trans10:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacNowhere', 1, 2) ))
	_uState14Trans10:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacTorch', 1, 2) ))
	_uState14Trans10:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_007", " (The shield is facing the chest. In which direction do you rotate the shield?) ", 106, 16777215))
	_uState14Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans10 = nil

-- TO STATE: choice
_uState14Trans11 = GdsCreateTransition (_uState7, _uState14, "State_7", "State_14_T11", "Dialog")
	_uState14Trans11:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacCauldron', 1, 2))
	_uState14Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacNowhere', 1, 2) ))
	_uState14Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacTorch', 1, 2) ))
	_uState14Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacChest', 1, 2) ))
	_uState14Trans11:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_008", " (The shield is facing the cauldron. In which direction do you rotate the shield?) ", 107, 16777215))
	_uState14Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans11 = nil

-- TO STATE: choice
_uState14Trans12 = GdsCreateTransition (_uState7, _uState14, "State_7", "State_14_T12", "Dialog")
	_uState14Trans12:AddCondition (CScriptConditionValue('', 'mf_P702_TiaraShieldFacCup', 1, 2))
	_uState14Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacNowhere', 1, 2) ))
	_uState14Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacTorch', 1, 2) ))
	_uState14Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacChest', 1, 2) ))
	_uState14Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldFacCauldron', 1, 2) ))
	_uState14Trans12:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_009", " (The shield is facing the cup. In which direction do you rotate the shield?) ", 108, 16777215))
	_uState14Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState14Trans12 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('obj_shield', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState22Trans1 = GdsCreateTransition (_uState5, _uState22, "State_5", "State_22_T1", "Dialog")
	_uState22Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 1))
	_uState22Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_003PC", " (Activate) ", 99, 16777215))
	_uState22Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(OBJ_SHIELD)', 1, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState22Trans1 = nil

-- TO STATE: endconversation
_uState22Trans2 = GdsCreateTransition (_uState5, _uState22, "State_5", "State_22_T2", "Dialog")
	_uState22Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "obj_shield", 3))
	_uState22Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_TIARASHIELD_015PC", " (Leave) ", 99, 16777215))
	_uState22Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(OBJ_SHIELD)', 1, 4))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(OBJ_SHIELD)', 0, 4))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(OBJ_SHIELD)', 0, 4))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(OBJ_SHIELD)', 0, 4))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState22Trans2 = nil

-- TO STATE: endconversation
_uState22Trans3 = GdsCreateTransition (_uState1, _uState22, "State_1", "State_22_T3", "Dialog")
	_uState22Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldKnown', 0, 2) ))
	_uState22Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_TiaraShieldActivated', 0, 2) ))
	_uState22Trans3:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_016", " (This pedestal is already successfully activated.) ", 115, 16777215))
	_uState22Trans3:AddAction (CScriptActionSay("obj_shield", "P702_DLG_TIARASHIELD_017", " (His foe, the crystal witch, who stole his treasured cup.) ", 116, 16777215))
	_uState22Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "obj_shield"))
	_uState22Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(OBJ_SHIELD)', 1, 4))
	_uState22Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(OBJ_SHIELD)', 1, 4))
	_uState22Trans3 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState22, _uState22, "State_22", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(OBJ_SHIELD)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldActivated', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldActivated_Outcry', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_TiaraShieldEffect', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(OBJ_SHIELD)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(OBJ_SHIELD)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState22, _uState22, "State_22", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(OBJ_SHIELD)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(OBJ_SHIELD)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(OBJ_SHIELD)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState22, _uState22, "State_22", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(OBJ_SHIELD)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "obj_shield"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(OBJ_SHIELD)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(OBJ_SHIELD)', 1, 4))
	_uEndActions3 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState22, _uBeginState, "State_22", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(OBJ_SHIELD)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('obj_shield', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState5 = nil
_uState7 = nil
_uState14 = nil
_uState22 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("obj_shield_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/idol_BeginDialog.tak', 'pl_HumanAvatar', 'obj_shield'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(OBJ_SHIELD)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

