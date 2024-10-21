local _uSM = GdsCreateStateMachine ("nature_tower_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState13 = GdsCreateState (_uSM, "State_13")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('nature_tower'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NATURE_TOWER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NATURE_TOWER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('nature_tower', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("nature_tower", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "nature_tower"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NATURE_TOWER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('nature_tower', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("nature_tower")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NATURE_TOWER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nature_tower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 2))
	_uState3Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 745, 1, 1, 1))
	_uState3Trans1:AddAction (CScriptActionChoice("P709_DLG_NATURETOWER_002PC", "Insert the Nature-Crystal", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 2))
	_uState3Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 746, 1, 1, 1))
	_uState3Trans2:AddAction (CScriptActionChoice("P709_DLG_NATURETOWER_004PC", "Insert the Death-Crystal", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 0, 2))
	_uState3Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 747, 1, 1, 1))
	_uState3Trans3:AddAction (CScriptActionChoice("P709_DLG_NATURETOWER_006PC", "Insert the Maze-Crystal", 3, 16777215))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 0, 2))
	_uState3Trans4:AddAction (CScriptActionChoice("P709_DLG_NATURETOWER_008PC", "Leave it alone", 4, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 1, 4))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 2))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 0, 4))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NATURE_TOWER)', 1, 4))
	_uState3Trans5:AddAction (CScriptActionShowChoices())
	_uState3Trans5 = nil

-- TO STATE: choice
_uState3Trans6 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T6", "Dialog")
	_uState3Trans6:AddCondition (CScriptConditionValue('', 'mf_P709_NatureTower', 0, 2))
	_uState3Trans6:AddCondition (CScriptConditionOR(CScriptConditionPlayerHasItem('pl_Human', 3, 745, 1, 1, 1), CScriptConditionOR(CScriptConditionPlayerHasItem('pl_Human', 3, 746, 1, 1, 1), CScriptConditionPlayerHasItem('pl_Human', 3, 747, 1, 1, 1))))
	_uState3Trans6:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_001", "A huge construction towers over you. As you near it, you observe a cylindrical hole in the surface.", 100, 16777215))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState3Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nature_tower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState9Trans1 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 2))
	_uState9Trans1:AddAction (CScriptActionChoice("P709_DLG_NATURETOWER_010PC", "Reactivate Tower of Nature", 1, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: choice
_uState9Trans2 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 2))
	_uState9Trans2:AddAction (CScriptActionChoice("P709_DLG_NATURETOWER_012PC", "Leave it alone", 2, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: choice
_uState9Trans3 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 2))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NATURE_TOWER)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionShowChoices())
	_uState9Trans3 = nil

-- TO STATE: choice
_uState9Trans4 = GdsCreateTransition (_uState1, _uState9, "State_1", "State_9_T4", "Dialog")
	_uState9Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState9Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NatureTower', 0, 2), CScriptConditionOR(CScriptConditionPlayerHasItem('pl_Human', 3, 745, 1, 1, 1), CScriptConditionOR(CScriptConditionPlayerHasItem('pl_Human', 3, 746, 1, 1, 1), CScriptConditionPlayerHasItem('pl_Human', 3, 747, 1, 1, 1)))) ))
	_uState9Trans4:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_009", "A huge construction towers over you. As you near it, you observe a cylindrical hole in the surface.", 108, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState9Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nature_tower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState13Trans1 = GdsCreateTransition (_uState3, _uState13, "State_3", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 1))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NATURETOWER_002PC", "Insert the Nature-Crystal", 99, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_003", "Something changes in the magic of this place", 102, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NATURE_TOWER)', 1, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: endconversation
_uState13Trans2 = GdsCreateTransition (_uState3, _uState13, "State_3", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 2))
	_uState13Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NATURETOWER_004PC", "Insert the Death-Crystal", 99, 16777215))
	_uState13Trans2:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_005", "Nothing happens", 104, 16777215))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NATURE_TOWER)', 1, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans2 = nil

-- TO STATE: endconversation
_uState13Trans3 = GdsCreateTransition (_uState3, _uState13, "State_3", "State_13_T3", "Dialog")
	_uState13Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 3))
	_uState13Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NATURETOWER_006PC", "Insert the Maze-Crystal", 99, 16777215))
	_uState13Trans3:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_007", "Nothing happens", 106, 16777215))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NATURE_TOWER)', 1, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans3 = nil

-- TO STATE: endconversation
_uState13Trans4 = GdsCreateTransition (_uState3, _uState13, "State_3", "State_13_T4", "Dialog")
	_uState13Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 4))
	_uState13Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NATURETOWER_008PC", "Leave it alone", 99, 16777215))
	_uState13Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NATURE_TOWER)', 1, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NATURE_TOWER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NATURE_TOWER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans4 = nil

-- TO STATE: endconversation
_uState13Trans5 = GdsCreateTransition (_uState9, _uState13, "State_9", "State_13_T5", "Dialog")
	_uState13Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 1))
	_uState13Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NATURETOWER_010PC", "Reactivate Tower of Nature", 99, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_011", "Something changes in the magic of this place", 110, 16777215))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NATURE_TOWER)', 1, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans5 = nil

-- TO STATE: endconversation
_uState13Trans6 = GdsCreateTransition (_uState9, _uState13, "State_9", "State_13_T6", "Dialog")
	_uState13Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "nature_tower", 2))
	_uState13Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NATURETOWER_012PC", "Leave it alone", 99, 16777215))
	_uState13Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NATURE_TOWER)', 1, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NATURE_TOWER)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NATURE_TOWER)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans6 = nil

-- TO STATE: endconversation
_uState13Trans7 = GdsCreateTransition (_uState1, _uState13, "State_1", "State_13_T7", "Dialog")
	_uState13Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NatureTower', 0, 2), CScriptConditionOR(CScriptConditionPlayerHasItem('pl_Human', 3, 745, 1, 1, 1), CScriptConditionOR(CScriptConditionPlayerHasItem('pl_Human', 3, 746, 1, 1, 1), CScriptConditionPlayerHasItem('pl_Human', 3, 747, 1, 1, 1)))) ))
	_uState13Trans7:AddCondition ( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )
	_uState13Trans7:AddAction (CScriptActionSay("nature_tower", "P709_DLG_NATURETOWER_013", "A huge construction towers over you. As you near it, you observe a cylindrical hole in the surface.", 112, 16777215))
	_uState13Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nature_tower"))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(NATURE_TOWER)', 1, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NATURE_TOWER)', 1, 4))
	_uState13Trans7 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NATURE_TOWER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTower', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NATURE_TOWER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NATURE_TOWER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTowerPositioning', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NATURE_TOWER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NATURE_TOWER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTowerPositioning', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NATURE_TOWER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NATURE_TOWER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTowerPositioning', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NATURE_TOWER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(NATURE_TOWER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTowerRestart', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NATURE_TOWER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(NATURE_TOWER)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTowerPositioning', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NATURE_TOWER)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(NATURE_TOWER)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "nature_tower"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P709_NatureTowerPositioning', 1, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(NATURE_TOWER)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 4))
	_uEndActions7 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NATURE_TOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nature_tower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState9 = nil
_uState13 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("nature_tower_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/urwounded2_BeginDialog.tak', 'pl_HumanAvatar', 'nature_tower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NATURE_TOWER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

