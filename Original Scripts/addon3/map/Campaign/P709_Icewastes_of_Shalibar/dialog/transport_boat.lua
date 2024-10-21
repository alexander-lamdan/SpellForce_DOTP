local _uSM = GdsCreateStateMachine ("transport_boat_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState11 = GdsCreateState (_uSM, "State_11")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('transport_boat'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(TRANSPORT_BOAT)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(TRANSPORT_BOAT)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('transport_boat', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("transport_boat", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "transport_boat"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TRANSPORT_BOAT)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(TRANSPORT_BOAT)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('transport_boat', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("transport_boat")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(TRANSPORT_BOAT)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('transport_boat', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TRANSPORT_BOAT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 2))
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'mf_P709_SailingFromMainIsland', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P709_DLG_UNDEADSAILOR_002PC", "Sail back to the Mainland", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 2))
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'mf_P709_SailingFromWolfSpiritIsland', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P709_DLG_UNDEADSAILOR_003PC", "Sail to the Southern Island", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 2))
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'mf_P709_SailingFromLichIsland', 0, 2))
	_uState3Trans3:AddAction (CScriptActionChoice("P709_DLG_UNDEADSAILOR_004PC", "Sail to the Northwestern Island", 3, 16777215))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 2))
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'mf_P709_SailingFromPuzzleIsland', 0, 2))
	_uState3Trans4:AddAction (CScriptActionChoice("P709_DLG_UNDEADSAILOR_005PC", "Sail to the Northeastern Island", 4, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 2))
	_uState3Trans5:AddCondition (CScriptConditionValue('', 'mf_P709_SailingFromPrisonIsland', 0, 2))
	_uState3Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_51', 2))
	_uState3Trans5:AddAction (CScriptActionChoice("P709_DLG_UNDEADSAILOR_006PC", "Sail to the Center Island", 5, 16777215))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans5 = nil

-- TO STATE: choice
_uState3Trans6 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T6", "Dialog")
	_uState3Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 2))
	_uState3Trans6:AddAction (CScriptActionChoice("P709_DLG_UNDEADSAILOR_007PC", "Leave the ship alone for now", 6, 16777215))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans6 = nil

-- TO STATE: choice
_uState3Trans7 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T7", "Dialog")
	_uState3Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 2))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 0, 4))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans7:AddAction (CScriptActionShowChoices())
	_uState3Trans7 = nil

-- TO STATE: choice
_uState3Trans8 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T8", "Dialog")
	_uState3Trans8:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState3Trans8:AddAction (CScriptActionSay("transport_boat", "P709_DLG_UNDEADSAILOR_001", "A grey ghostly ship but still able to sail the local waters", 100, 16777215))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState3Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('transport_boat', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TRANSPORT_BOAT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState11Trans1 = GdsCreateTransition (_uState3, _uState11, "State_3", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 1))
	_uState11Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSAILOR_002PC", "Sail back to the Mainland", 99, 16777215))
	_uState11Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: endconversation
_uState11Trans2 = GdsCreateTransition (_uState3, _uState11, "State_3", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 2))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSAILOR_003PC", "Sail to the Southern Island", 99, 16777215))
	_uState11Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans2 = nil

-- TO STATE: endconversation
_uState11Trans3 = GdsCreateTransition (_uState3, _uState11, "State_3", "State_11_T3", "Dialog")
	_uState11Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 3))
	_uState11Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSAILOR_004PC", "Sail to the Northwestern Island", 99, 16777215))
	_uState11Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans3 = nil

-- TO STATE: endconversation
_uState11Trans4 = GdsCreateTransition (_uState3, _uState11, "State_3", "State_11_T4", "Dialog")
	_uState11Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 4))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSAILOR_005PC", "Sail to the Northeastern Island", 99, 16777215))
	_uState11Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans4 = nil

-- TO STATE: endconversation
_uState11Trans5 = GdsCreateTransition (_uState3, _uState11, "State_3", "State_11_T5", "Dialog")
	_uState11Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 5))
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSAILOR_006PC", "Sail to the Center Island", 99, 16777215))
	_uState11Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans5 = nil

-- TO STATE: endconversation
_uState11Trans6 = GdsCreateTransition (_uState3, _uState11, "State_3", "State_11_T6", "Dialog")
	_uState11Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 6))
	_uState11Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_UNDEADSAILOR_007PC", "Leave the ship alone for now", 99, 16777215))
	_uState11Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(TRANSPORT_BOAT)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans6 = nil

-- TO STATE: endconversation
_uState11Trans7 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T7", "Dialog")
	_uState11Trans7:AddCondition ( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )
	_uState11Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "transport_boat"))
	_uState11Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TRANSPORT_BOAT)', 1, 4))
	_uState11Trans7 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(TRANSPORT_BOAT)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_SailingToMainIsland', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(TRANSPORT_BOAT)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(TRANSPORT_BOAT)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P709_SailingToWolfSpiritIsland', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(TRANSPORT_BOAT)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(TRANSPORT_BOAT)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P709_SailingToLichIsland', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(TRANSPORT_BOAT)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(TRANSPORT_BOAT)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P709_SailingToPuzzleIsland', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(TRANSPORT_BOAT)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(TRANSPORT_BOAT)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P709_SailingToPrisonIsland', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(TRANSPORT_BOAT)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(TRANSPORT_BOAT)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(TRANSPORT_BOAT)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(TRANSPORT_BOAT)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "transport_boat"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(TRANSPORT_BOAT)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 4))
	_uEndActions7 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TRANSPORT_BOAT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('transport_boat', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TRANSPORT_BOAT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState11 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("transport_boat_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(TRANSPORT_BOAT)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'transport_boat'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(TRANSPORT_BOAT)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'transport_boat'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "transport_boat", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'transport_boat', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
