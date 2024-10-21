local _uSM = GdsCreateStateMachine ("historian_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState8 = GdsCreateState (_uSM, "State_8")
_uState11 = GdsCreateState (_uSM, "State_11")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState17 = GdsCreateState (_uSM, "State_17")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState23 = GdsCreateState (_uSM, "State_23")
_uState26 = GdsCreateState (_uSM, "State_26")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState32 = GdsCreateState (_uSM, "State_32")
_uState37 = GdsCreateState (_uSM, "State_37")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('historian'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(HISTORIAN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(HISTORIAN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('historian', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "historian"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(HISTORIAN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('historian', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("historian")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(HISTORIAN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_HistorianDialog', 0, 2))
	_uState2Trans1:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_001", "Elen's blessing, Shaikan", 100, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState3Trans1 = GdsCreateTransition (_uState2, _uState3, "State_2", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_Historian_SQ_01', 1, 2))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState3Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState4Trans1 = GdsCreateTransition (_uState3, _uState4, "State_3", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_01', 1))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState4Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState5Trans1 = GdsCreateTransition (_uState4, _uState5, "State_4", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_SQ_01_Done', 1, 2))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: if
_uState5Trans2 = GdsCreateTransition (_uState11, _uState5, "State_11", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_SQ_01_Done', 1, 2))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState5Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState8Trans1 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_SQ_01', 1) ))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState8Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState11Trans1 = GdsCreateTransition (_uState8, _uState11, "State_8", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_HistorianMet', 0, 2) ))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: label
_uState11Trans2 = GdsCreateTransition (_uState8, _uState11, "State_8", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_HistorianMet', 0, 2))
	_uState11Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_006", "Elen has mercy on us. How very fortunate you've come, Shaikan.", 105, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_007PC", "What is the matter? You seem agitated.", 106, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_008", "Me and several other Elven scholars have come to this place to study the work of Malacay. After all he was the greatest Alchemist Eo has ever known.", 107, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_009PC", "I know - you came to the council of Elders to ask our help.", 108, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_010", "Yes, I remember you now. Arula, one of my assistants claimed to have found traces of an imprisoned Elf, that we lost hundreds of years ago on her way to Tirganach.", 109, 16777215))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'mf_P707_HistorianMet', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState11Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState14Trans1 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 2))
	_uState14Trans1:AddAction (CScriptActionChoice("P707_DLG_HISTORIAN_014PC", "I will do so immediately.", 1, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 1, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState14Trans1 = nil

-- TO STATE: choice
_uState14Trans2 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T2", "Dialog")
	_uState14Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 2))
	_uState14Trans2:AddAction (CScriptActionChoice("P707_DLG_HISTORIAN_016PC", "Sorry, I've much more important things to do.", 2, 16777215))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 1, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState14Trans2 = nil

-- TO STATE: choice
_uState14Trans3 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T3", "Dialog")
	_uState14Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 2))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 0, 4))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HISTORIAN)', 1, 4))
	_uState14Trans3:AddAction (CScriptActionShowChoices())
	_uState14Trans3 = nil

-- TO STATE: choice
_uState14Trans4 = GdsCreateTransition (_uState11, _uState14, "State_11", "State_14_T4", "Dialog")
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_SQ_01_Done', 1, 2) ))
	_uState14Trans4:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_011", "Somehow Arula must have triggered a failsafe mechanism, because all of a sudden, Malar were patrolling the hallways.", 110, 16777215))
	_uState14Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_012PC", "How did you escape?", 111, 16777215))
	_uState14Trans4:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_013", "We didn't - my people are still in there, somewhere. Please help them!", 112, 16777215))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState14Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState17Trans1 = GdsCreateTransition (_uState2, _uState17, "State_2", "State_17_T1", "Dialog")
	_uState17Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_Historian_SQ_02', 1, 2))
	_uState17Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Historian_SQ_01', 1, 2) ))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState17Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState17, _uState17, "State_17", "State_17", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState17, _uBeginState, "State_17", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState18Trans1 = GdsCreateTransition (_uState17, _uState18, "State_17", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_02', 1))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState18Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState21Trans1 = GdsCreateTransition (_uState17, _uState21, "State_17", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_SQ_02', 1) ))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState21Trans1 = nil

-- TO STATE: else
_uState21Trans2 = GdsCreateTransition (_uState5, _uState21, "State_5", "State_21_T2", "Dialog")
	_uState21Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_002PC", "I think your people are safe now.", 101, 16777215))
	_uState21Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_003", "Yes, thank you. There is one other thing, though.", 102, 16777215))
	_uState21Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_004PC", "Yes?", 103, 16777215))
	_uState21Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_005", "The research we're conducting concentrates on Memory Banks, used to visualize or rather to make audible memories of creatures, that Malacay studied here.", 104, 16777215))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'mf_P707_Historian_SQ_01', 0, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'mf_P707_Historian_SQ_02', 1, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState21Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState23Trans1 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T1", "Dialog")
	_uState23Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 2))
	_uState23Trans1:AddAction (CScriptActionChoice("P707_DLG_HISTORIAN_024PC", "I'll see what I can do. What do these... Memory Banks... look like?", 1, 16777215))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 1, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState23Trans1 = nil

-- TO STATE: choice
_uState23Trans2 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T2", "Dialog")
	_uState23Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 2))
	_uState23Trans2:AddAction (CScriptActionChoice("P707_DLG_HISTORIAN_027PC", "I'm sorry. But I have very important things to do.", 2, 16777215))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 1, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState23Trans2 = nil

-- TO STATE: choice
_uState23Trans3 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T3", "Dialog")
	_uState23Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 2))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HISTORIAN)', 1, 4))
	_uState23Trans3:AddAction (CScriptActionShowChoices())
	_uState23Trans3 = nil

-- TO STATE: choice
_uState23Trans4 = GdsCreateTransition (_uState21, _uState23, "State_21", "State_23_T4", "Dialog")
	_uState23Trans4:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_021", "We've done extensive cataloguing already but after this failsafe the Memory Banks are crowded by hostile creatures.", 120, 16777215))
	_uState23Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_022PC", "And you want me to free them for you.", 121, 16777215))
	_uState23Trans4:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_023", "Yes, that would be... just great!", 122, 16777215))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState23Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState23, _uBeginState, "State_23", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState26Trans1 = GdsCreateTransition (_uState2, _uState26, "State_2", "State_26_T1", "Dialog")
	_uState26Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_Historian_SQ_03', 1, 2))
	_uState26Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Historian_SQ_01', 1, 2) ))
	_uState26Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Historian_SQ_02', 1, 2) ))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState26Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState26, _uState26, "State_26", "State_26", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState26, _uBeginState, "State_26", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState27Trans1 = GdsCreateTransition (_uState26, _uState27, "State_26", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_03', 1))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState27Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState30Trans1 = GdsCreateTransition (_uState26, _uState30, "State_26", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_SQ_03', 1) ))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: else
_uState30Trans2 = GdsCreateTransition (_uState18, _uState30, "State_18", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_SQ_02_Done', 1, 2))
	_uState30Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_018PC", "Were you able to collect some more information?", 117, 16777215))
	_uState30Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_019", "Yes, thank you. We've found out that there were a lot of creatures held in this complex.", 118, 16777215))
	_uState30Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_020PC", "These creatures must have died by now. Without food and drink?", 119, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'mf_P707_Historian_SQ_02', 0, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'mf_P707_Historian_SQ_03', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState30Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState32Trans1 = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32_T1", "Dialog")
	_uState32Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 2))
	_uState32Trans1:AddAction (CScriptActionChoice("P707_DLG_HISTORIAN_034PC", "Alright, I will search for this room for you.", 1, 16777215))
	_uState32Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 1, 4))
	_uState32Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState32Trans1 = nil

-- TO STATE: choice
_uState32Trans2 = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32_T2", "Dialog")
	_uState32Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 2))
	_uState32Trans2:AddAction (CScriptActionChoice("P707_DLG_HISTORIAN_035PC", "I'm sorry, Le'an. I really have more important things to do.", 2, 16777215))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 1, 4))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState32Trans2 = nil

-- TO STATE: choice
_uState32Trans3 = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32_T3", "Dialog")
	_uState32Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 2))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 0, 4))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HISTORIAN)', 1, 4))
	_uState32Trans3:AddAction (CScriptActionShowChoices())
	_uState32Trans3 = nil

-- TO STATE: choice
_uState32Trans4 = GdsCreateTransition (_uState30, _uState32, "State_30", "State_32_T4", "Dialog")
	_uState32Trans4:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_031", "Malacay held them in some kind of stasis, that prolonged their life. If you could find out, where they were held, this would help us a lot.", 130, 16777215))
	_uState32Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_032PC", "Didn't you come about such a room already? I mean you're here for almost a year now.", 131, 16777215))
	_uState32Trans4:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_033", "We've only scratched the surface of this complex, Shaikan. Mostly we were reading through Malacays extensive library.", 132, 16777215))
	_uState32Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState32Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState32, _uBeginState, "State_32", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState37Trans1 = GdsCreateTransition (_uState4, _uState37, "State_4", "State_37_T1", "Dialog")
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_SQ_01_Done', 1, 2) ))
	_uState37Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HISTORIAN)', 1, 4))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans1 = nil

-- TO STATE: endconversation
_uState37Trans2 = GdsCreateTransition (_uState14, _uState37, "State_14", "State_37_T2", "Dialog")
	_uState37Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 1))
	_uState37Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_014PC", "I will do so immediately.", 99, 16777215))
	_uState37Trans2:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_015", "Elen's blessing on you, Shaikan.", 114, 16777215))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
	_uState37Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HISTORIAN)', 1, 4))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans2 = nil

-- TO STATE: endconversation
_uState37Trans3 = GdsCreateTransition (_uState14, _uState37, "State_14", "State_37_T3", "Dialog")
	_uState37Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 2))
	_uState37Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_016PC", "Sorry, I've much more important things to do.", 99, 16777215))
	_uState37Trans3:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_017", "Please reconsider, Shaikan. My people are lost without your help!", 116, 16777215))
	_uState37Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uState37Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
	_uState37Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HISTORIAN)', 1, 4))
	_uState37Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans3 = nil

-- TO STATE: endconversation
_uState37Trans4 = GdsCreateTransition (_uState18, _uState37, "State_18", "State_37_T4", "Dialog")
	_uState37Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_SQ_02_Done', 1, 2) ))
	_uState37Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(HISTORIAN)', 1, 4))
	_uState37Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans4 = nil

-- TO STATE: endconversation
_uState37Trans5 = GdsCreateTransition (_uState23, _uState37, "State_23", "State_37_T5", "Dialog")
	_uState37Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 1))
	_uState37Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_024PC", "I'll see what I can do. What do these... Memory Banks... look like?", 99, 16777215))
	_uState37Trans5:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_025", "They look like a small hut with a silvery spiked roof.", 124, 16777215))
	_uState37Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uState37Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
	_uState37Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_026PC", "Alright, Le'an. I will inform you, once I've freed one of those Banks.", 125, 16777215))
	_uState37Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(HISTORIAN)', 1, 4))
	_uState37Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans5 = nil

-- TO STATE: endconversation
_uState37Trans6 = GdsCreateTransition (_uState23, _uState37, "State_23", "State_37_T6", "Dialog")
	_uState37Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 2))
	_uState37Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_027PC", "I'm sorry. But I have very important things to do.", 99, 16777215))
	_uState37Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(HISTORIAN)', 1, 4))
	_uState37Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uState37Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
	_uState37Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans6 = nil

-- TO STATE: endconversation
_uState37Trans7 = GdsCreateTransition (_uState27, _uState37, "State_27", "State_37_T7", "Dialog")
	_uState37Trans7:AddCondition (CScriptConditionValue('', 'mf_P707_SQ_03_Done', 1, 2))
	_uState37Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_028PC", "Le'an, I think I found the room with the creatures", 127, 16777215))
	_uState37Trans7:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_029", "Great! I'm coming to you.", 128, 16777215))
	_uState37Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_030PC", "You'd better wait. All the chambers are empty.", 129, 16777215))
	_uState37Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(HISTORIAN)', 1, 4))
	_uState37Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans7 = nil

-- TO STATE: endconversation
_uState37Trans8 = GdsCreateTransition (_uState27, _uState37, "State_27", "State_37_T8", "Dialog")
	_uState37Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_SQ_03_Done', 1, 2) ))
	_uState37Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(HISTORIAN)', 1, 4))
	_uState37Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans8 = nil

-- TO STATE: endconversation
_uState37Trans9 = GdsCreateTransition (_uState32, _uState37, "State_32", "State_37_T9", "Dialog")
	_uState37Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 1))
	_uState37Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_034PC", "Alright, I will search for this room for you.", 99, 16777215))
	_uState37Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(HISTORIAN)', 1, 4))
	_uState37Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uState37Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
	_uState37Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans9 = nil

-- TO STATE: endconversation
_uState37Trans10 = GdsCreateTransition (_uState32, _uState37, "State_32", "State_37_T10", "Dialog")
	_uState37Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 2))
	_uState37Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_HISTORIAN_035PC", "I'm sorry, Le'an. I really have more important things to do.", 99, 16777215))
	_uState37Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(HISTORIAN)', 1, 4))
	_uState37Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HISTORIAN)', 0, 4))
	_uState37Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HISTORIAN)', 0, 4))
	_uState37Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans10 = nil

-- TO STATE: endconversation
_uState37Trans11 = GdsCreateTransition (_uState2, _uState37, "State_2", "State_37_T11", "Dialog")
	_uState37Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Historian_SQ_01', 1, 2) ))
	_uState37Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Historian_SQ_02', 1, 2) ))
	_uState37Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Historian_SQ_03', 1, 2) ))
	_uState37Trans11:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_036", "DEBUG: no root if() nor elseif() evaluated to true", 135, 16777215))
	_uState37Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(HISTORIAN)', 1, 4))
	_uState37Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans11 = nil

-- TO STATE: endconversation
_uState37Trans12 = GdsCreateTransition (_uState1, _uState37, "State_1", "State_37_T12", "Dialog")
	_uState37Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_HistorianDialog', 0, 2) ))
	_uState37Trans12:AddAction (CScriptActionSay("historian", "P707_DLG_HISTORIAN_037", "DEBUG: no root if() nor elseif() evaluated to true", 136, 16777215))
	_uState37Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "historian"))
	_uState37Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(HISTORIAN)', 1, 4))
	_uState37Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HISTORIAN)', 1, 4))
	_uState37Trans12 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(HISTORIAN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HISTORIAN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(HISTORIAN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions2:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_01', 1, 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HISTORIAN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(HISTORIAN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HISTORIAN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(HISTORIAN)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(HISTORIAN)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(HISTORIAN)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions5:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_02', 1, 0))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(HISTORIAN)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(HISTORIAN)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(HISTORIAN)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(HISTORIAN)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P707_Historian_SQ_03', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P707_Historian_SQ_H_End', 1, 4))
	_uEndActions7:AddAction (CScriptActionDialogEnable('Historian', 0))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(HISTORIAN)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(HISTORIAN)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(HISTORIAN)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(HISTORIAN)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions9:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_03', 1, 0))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(HISTORIAN)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(HISTORIAN)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(HISTORIAN)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(HISTORIAN)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(HISTORIAN)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState37, _uState37, "State_37", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(HISTORIAN)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "historian"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(HISTORIAN)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 4))
	_uEndActions12 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState37, _uBeginState, "State_37", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(HISTORIAN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('historian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState2 = nil
_uState3 = nil
_uState4 = nil
_uState5 = nil
_uState8 = nil
_uState11 = nil
_uState14 = nil
_uState17 = nil
_uState18 = nil
_uState21 = nil
_uState23 = nil
_uState26 = nil
_uState27 = nil
_uState30 = nil
_uState32 = nil
_uState37 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("historian_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HISTORIAN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HISTORIAN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'historian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "historian", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'historian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
