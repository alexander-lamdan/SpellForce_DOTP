local _uSM = GdsCreateStateMachine ("undead_lich_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState13 = GdsCreateState (_uSM, "State_13")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('undead_lich'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(UNDEAD_LICH)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(UNDEAD_LICH)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('undead_lich', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "undead_lich"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(UNDEAD_LICH)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('undead_lich', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("undead_lich")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(UNDEAD_LICH)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_lich"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_lich', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState3Trans1 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Undead_Lich_FirstMeet', 0, 2) ))
	_uState3Trans1:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_003", "Kiddo. Got anything to wet me pipe?", 102, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: else
_uState3Trans2 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'mf_P710_Undead_Lich_FirstMeet', 0, 2))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'mf_P710_Undead_Lich_FirstMeet', 1, 4))
	_uState3Trans2:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_001", "Ahoy, me smart lad. Arrr! You landlubbers need a hand in yer struggles?", 100, 16777215))
	_uState3Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_002PC", "How did you end up here, Halbeard?", 101, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState3Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_lich"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_lich"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_lich', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 2))
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Undeads_Quest', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P710_DLG_UNDEADLICH_005PC", "Seems like someone keeps fulfilling wishes. I accept, Captain.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P710_DLG_UNDEADLICH_007PC", "I can't do this, captain.", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 2))
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'mf_P710_Undeads_West', 0, 2))
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'mf_P710_StartUndeadsCS_End', 1, 2))
	_uState5Trans3:AddAction (CScriptActionChoice("P710_DLG_UNDEADLICH_009PC", "I want you to attack the Nameless from the west.", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 2))
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_Undeads_South', 0, 2))
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_StartUndeadsCS_End', 1, 2))
	_uState5Trans4:AddAction (CScriptActionChoice("P710_DLG_UNDEADLICH_010PC", "I want you to attack the Nameless from the south.", 4, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 2))
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_Undeads_East', 0, 2))
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_StartUndeadsCS_End', 1, 2))
	_uState5Trans5:AddAction (CScriptActionChoice("P710_DLG_UNDEADLICH_011PC", "I want you to attack the Nameless from the southeast.", 5, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 1, 4))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T6", "Dialog")
	_uState5Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 2))
	_uState5Trans6:AddAction (CScriptActionChoice("P710_DLG_UNDEADLICH_013PC", "I'll be going now.", 6, 16777215))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 1, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans6 = nil

-- TO STATE: choice
_uState5Trans7 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T7", "Dialog")
	_uState5Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 2))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans7:AddAction (CScriptActionShowChoices())
	_uState5Trans7 = nil

-- TO STATE: choice
_uState5Trans8 = GdsCreateTransition (_uState3, _uState5, "State_3", "State_5_T8", "Dialog")
	_uState5Trans8:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_004", "Dunno, Kiddo. After you disappeared to the island I thought to meself - go after 'im. And here I am. I can 'elp you, Kiddo. We're good fighters, like soldiers, just dead. Ha! But we're too few. Have us some more bones and I'll make them fight for ya!", 103, 16777215))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans8 = nil

-- TO STATE: choice
_uState5Trans9 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T9", "Dialog")
	_uState5Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 1))
	_uState5Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_005PC", "Seems like someone keeps fulfilling wishes. I accept, Captain.", 99, 16777215))
	_uState5Trans9:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_006", "Yarr! Bury the fallen in the cemetery. I'll take care of the rest. The rest. HA-HA-HA!", 105, 16777215))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P710_Undeads_Quest', 1, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans9 = nil

-- TO STATE: choice
_uState5Trans10 = GdsCreateTransition (_uState10, _uState5, "State_10", "State_5_T10", "Dialog")
	_uState5Trans10:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_012", "Time to show our colours to those demons!", 111, 16777215))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'mf_P710_Undeads_West', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'mf_P710_Undeads_South', 1, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'mf_P710_Undeads_East', 0, 4))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState5Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_lich"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_lich"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_lich', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState10Trans1 = GdsCreateTransition (_uState5, _uState10, "State_5", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 5))
	_uState10Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_011PC", "I want you to attack the Nameless from the southeast.", 99, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: showchoice
_uState10Trans2 = GdsCreateTransition (_uState5, _uState10, "State_5", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 3))
	_uState10Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_009PC", "I want you to attack the Nameless from the west.", 99, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: showchoice
_uState10Trans3 = GdsCreateTransition (_uState5, _uState10, "State_5", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 4))
	_uState10Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_010PC", "I want you to attack the Nameless from the south.", 99, 16777215))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState10Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_lich"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_lich"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_lich', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState13Trans1 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 2))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_007PC", "I can't do this, captain.", 99, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_008", "It's your funeral. Return after that, ye would make a good a swabber. Harr!", 107, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_lich"))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(UNDEAD_LICH)', 1, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: endconversation
_uState13Trans2 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 6))
	_uState13Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_UNDEADLICH_013PC", "I'll be going now.", 99, 16777215))
	_uState13Trans2:AddAction (CScriptActionSay("undead_lich", "P710_DLG_UNDEADLICH_014", "Don't forget the grog next time.", 113, 16777215))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(UNDEAD_LICH)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(UNDEAD_LICH)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(UNDEAD_LICH)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(UNDEAD_LICH)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(UNDEAD_LICH)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(UNDEAD_LICH)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "undead_lich"))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(UNDEAD_LICH)', 1, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(UNDEAD_LICH)', 1, 4))
	_uState13Trans2 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(UNDEAD_LICH)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_lich"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(UNDEAD_LICH)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_LICH)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(UNDEAD_LICH)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "undead_lich"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(UNDEAD_LICH)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_LICH)', 1, 4))
	_uEndActions2 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(UNDEAD_LICH)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(UNDEAD_LICH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('undead_lich', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 0, 4))
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
_uState10 = nil
_uState13 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("undead_lich_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(UNDEAD_LICH)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'undead_lich'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "undead_lich", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'undead_lich', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
