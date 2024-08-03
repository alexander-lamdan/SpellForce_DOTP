local _uSM = GdsCreateStateMachine ("cauldron_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState11 = GdsCreateState (_uSM, "State_11")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState23 = GdsCreateState (_uSM, "State_23")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState32 = GdsCreateState (_uSM, "State_32")
_uState36 = GdsCreateState (_uSM, "State_36")
_uState42 = GdsCreateState (_uSM, "State_42")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('cauldron'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(CAULDRON)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(CAULDRON)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('cauldron', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("cauldron", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "cauldron"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(CAULDRON)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('cauldron', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("cauldron")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(CAULDRON)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_002PC", "*Fill in the Sapphires one by one.*", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_004PC", "*Crush the Sapphires and fill them into the water.*", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME', 1) ))
	_uState3Trans4:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_001", "*A cauldron with warm water awaits the ingredients.*", 100, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_002PC", "*Fill in the Sapphires one by one.*", 99, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_003", "*The water turns green, then vanishes, leaving the Sapphires on the ground. You have to start over again.*", 102, 16777215))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans5 = nil

-- TO STATE: choice
_uState3Trans6 = GdsCreateTransition (_uState6, _uState3, "State_6", "State_3_T6", "Dialog")
	_uState3Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState3Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_008PC", "Wait two minutes.", 99, 16777215))
	_uState3Trans6:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_009", "The water turns green, then vanishes, leaving the Sapphires on the ground. You have to start over again.", 108, 16777215))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans6 = nil

-- TO STATE: choice
_uState3Trans7 = GdsCreateTransition (_uState15, _uState3, "State_15", "State_3_T7", "Dialog")
	_uState3Trans7:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_015", "With a BANG! the cauldron explodes leaving you to start over again.", 114, 16777215))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans7 = nil

-- TO STATE: choice
_uState3Trans8 = GdsCreateTransition (_uState30, _uState3, "State_30", "State_3_T8", "Dialog")
	_uState3Trans8:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_029", "All of a sudden, the cauldron itself melts, leaving you to start over again.", 128, 16777215))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans8 = nil

-- TO STATE: choice
_uState3Trans9 = GdsCreateTransition (_uState32, _uState3, "State_32", "State_3_T9", "Dialog")
	_uState3Trans9:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_030", "A crunching noise tells you, that the mixture has turned solid and that you have to start over again.", 129, 16777215))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState3Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_006PC", "Wait twenty seconds.", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_008PC", "Wait two minutes.", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 2))
	_uState6Trans3:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_010PC", "Wait 38 minutes.", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionShowChoices())
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState3, _uState6, "State_3", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState6Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_004PC", "*Crush the Sapphires and fill them into the water.*", 99, 16777215))
	_uState6Trans5:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_005", "*The water sizzles a bit but remains colourless.*", 104, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Twenty', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Two', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Thirtyeight', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Crush', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState6Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState11Trans1 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState11Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_012PC", "Put in the Fools Gold one by one.", 1, 16777215))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: choice
_uState11Trans2 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState11Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_013PC", "Crush the Fools Gold and fill it into the liquid.", 2, 16777215))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState11Trans2 = nil

-- TO STATE: choice
_uState11Trans3 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T3", "Dialog")
	_uState11Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 2))
	_uState11Trans3:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_014PC", "Cut the Fools Gold to small pieces and put it in the cauldron.", 3, 16777215))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 1, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState11Trans3 = nil

-- TO STATE: choice
_uState11Trans4 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T4", "Dialog")
	_uState11Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState11Trans4:AddAction (CScriptActionShowChoices())
	_uState11Trans4 = nil

-- TO STATE: choice
_uState11Trans5 = GdsCreateTransition (_uState6, _uState11, "State_6", "State_11_T5", "Dialog")
	_uState11Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 3))
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_010PC", "Wait 38 minutes.", 99, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_011", "The water turns into a clear blue colour, resembling that of a Sapphire.", 110, 16777215))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Thirtyeight', 1, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState11Trans5 = nil

-- TO STATE: choice
_uState11Trans6 = GdsCreateTransition (_uState6, _uState11, "State_6", "State_11_T6", "Dialog")
	_uState11Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState11Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_006PC", "Wait twenty seconds.", 99, 16777215))
	_uState11Trans6:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_007", "Nothing happens.", 106, 16777215))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Twenty', 1, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState11Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState14Trans1 = GdsCreateTransition (_uState11, _uState14, "State_11", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 3))
	_uState14Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_014PC", "Cut the Fools Gold to small pieces and put it in the cauldron.", 99, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState14Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState15Trans1 = GdsCreateTransition (_uState14, _uState15, "State_14", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron_Twenty', 1, 2))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: if
_uState15Trans2 = GdsCreateTransition (_uState11, _uState15, "State_11", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState15Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_012PC", "Put in the Fools Gold one by one.", 99, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: if
_uState15Trans3 = GdsCreateTransition (_uState18, _uState15, "State_18", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState15Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_017PC", "Wait for six minutes, while you melt the Copper.", 99, 16777215))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState15Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState18Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_017PC", "Wait for six minutes, while you melt the Copper.", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState18Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_018PC", "Wait for two hours, while you melt the Copper.", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 2))
	_uState18Trans3:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_019PC", "Wait for four minutes, while you melt the Copper.", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionShowChoices())
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState14, _uState18, "State_14", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron_Thirtyeight', 1, 2))
	_uState18Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Cauldron_Twenty', 1, 2) ))
	_uState18Trans5:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_016", "The brew has changed colour again. It's now an ugly brown.", 115, 16777215))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState18Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState21Trans1 = GdsCreateTransition (_uState18, _uState21, "State_18", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 3))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_019PC", "Wait for four minutes, while you melt the Copper.", 99, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState21Trans1 = nil

-- TO STATE: showchoice
_uState21Trans2 = GdsCreateTransition (_uState18, _uState21, "State_18", "State_21_T2", "Dialog")
	_uState21Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState21Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_018PC", "Wait for two hours, while you melt the Copper.", 99, 16777215))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState21Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState23Trans1 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T1", "Dialog")
	_uState23Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState23Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_021PC", "Slowly fill in the Copper, while stirring the cocktail counterclockwise.", 1, 16777215))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState23Trans1 = nil

-- TO STATE: choice
_uState23Trans2 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T2", "Dialog")
	_uState23Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState23Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_022PC", "Slowly fill in the Copper, while stirring the cocktail clockwise.", 2, 16777215))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState23Trans2 = nil

-- TO STATE: choice
_uState23Trans3 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T3", "Dialog")
	_uState23Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 2))
	_uState23Trans3:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_023PC", "Quickly fill in the Copper and stir the cocktail counterclockwise.", 3, 16777215))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 1, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState23Trans3 = nil

-- TO STATE: choice
_uState23Trans4 = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23_T4", "Dialog")
	_uState23Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState23Trans4:AddAction (CScriptActionShowChoices())
	_uState23Trans4 = nil

-- TO STATE: choice
_uState23Trans5 = GdsCreateTransition (_uState21, _uState23, "State_21", "State_23_T5", "Dialog")
	_uState23Trans5:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_020", "Nothing happens.", 119, 16777215))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState23Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState23, _uBeginState, "State_23", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState27Trans1 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState27Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_025PC", "When the colour is red, throw in the Hornsilver-parts all at once.", 1, 16777215))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState27Trans1 = nil

-- TO STATE: choice
_uState27Trans2 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T2", "Dialog")
	_uState27Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState27Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_026PC", "When the colour is green, throw in the cut Hornsilver-pieces.", 2, 16777215))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState27Trans2 = nil

-- TO STATE: choice
_uState27Trans3 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T3", "Dialog")
	_uState27Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 2))
	_uState27Trans3:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_028PC", "When the colour is yellow, throw in the crushed Hornsilver-pieces.", 3, 16777215))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 1, 4))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState27Trans3 = nil

-- TO STATE: choice
_uState27Trans4 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T4", "Dialog")
	_uState27Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState27Trans4:AddAction (CScriptActionShowChoices())
	_uState27Trans4 = nil

-- TO STATE: choice
_uState27Trans5 = GdsCreateTransition (_uState23, _uState27, "State_23", "State_27_T5", "Dialog")
	_uState27Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 3))
	_uState27Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_023PC", "Quickly fill in the Copper and stir the cocktail counterclockwise.", 99, 16777215))
	_uState27Trans5:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_024", "The colour of the brew keeps changing from yellow to red to green.", 123, 16777215))
	_uState27Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState27Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState27Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState27Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState27Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState30Trans1 = GdsCreateTransition (_uState27, _uState30, "State_27", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 3))
	_uState30Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_028PC", "When the colour is yellow, throw in the crushed Hornsilver-pieces.", 99, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: showchoice
_uState30Trans2 = GdsCreateTransition (_uState27, _uState30, "State_27", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState30Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_025PC", "When the colour is red, throw in the Hornsilver-parts all at once.", 99, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState30Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState32Trans1 = GdsCreateTransition (_uState14, _uState32, "State_14", "State_32_T1", "Dialog")
	_uState32Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron_Crush', 1, 2))
	_uState32Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Cauldron_Twenty', 1, 2) ))
	_uState32Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Cauldron_Thirtyeight', 1, 2) ))
	_uState32Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState32Trans1 = nil

-- TO STATE: elseif
_uState32Trans2 = GdsCreateTransition (_uState11, _uState32, "State_11", "State_32_T2", "Dialog")
	_uState32Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState32Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_013PC", "Crush the Fools Gold and fill it into the liquid.", 99, 16777215))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron_Crush', 1, 4))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState32Trans2 = nil

-- TO STATE: elseif
_uState32Trans3 = GdsCreateTransition (_uState23, _uState32, "State_23", "State_32_T3", "Dialog")
	_uState32Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState32Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_021PC", "Slowly fill in the Copper, while stirring the cocktail counterclockwise.", 99, 16777215))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState32Trans3 = nil

-- TO STATE: elseif
_uState32Trans4 = GdsCreateTransition (_uState23, _uState32, "State_23", "State_32_T4", "Dialog")
	_uState32Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState32Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_022PC", "Slowly fill in the Copper, while stirring the cocktail clockwise.", 99, 16777215))
	_uState32Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState32Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState32Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState32Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState32Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState32, _uBeginState, "State_32", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState36Trans1 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T1", "Dialog")
	_uState36Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 2))
	_uState36Trans1:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_032PC", "*Add blue ice.*", 1, 16777215))
	_uState36Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 1, 4))
	_uState36Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans1 = nil

-- TO STATE: choice
_uState36Trans2 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T2", "Dialog")
	_uState36Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 2))
	_uState36Trans2:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_034PC", "*Add fireberry.*", 2, 16777215))
	_uState36Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 1, 4))
	_uState36Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans2 = nil

-- TO STATE: choice
_uState36Trans3 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T3", "Dialog")
	_uState36Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 2))
	_uState36Trans3:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_036PC", "*Use a flash-spell on the brew.*", 3, 16777215))
	_uState36Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 1, 4))
	_uState36Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans3 = nil

-- TO STATE: choice
_uState36Trans4 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T4", "Dialog")
	_uState36Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 0, 2))
	_uState36Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron2_Answer1', 1, 2))
	_uState36Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron2_Answer2', 1, 2))
	_uState36Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron2_Answer3', 1, 2))
	_uState36Trans4:AddAction (CScriptActionChoice("P710_DLG_CAULDRON_038PC", "*Add some of your own blood.*", 4, 16777215))
	_uState36Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 1, 4))
	_uState36Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans4 = nil

-- TO STATE: choice
_uState36Trans5 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T5", "Dialog")
	_uState36Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 2))
	_uState36Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 0, 4))
	_uState36Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CAULDRON)', 1, 4))
	_uState36Trans5:AddAction (CScriptActionShowChoices())
	_uState36Trans5 = nil

-- TO STATE: choice
_uState36Trans6 = GdsCreateTransition (_uState1, _uState36, "State_1", "State_36_T6", "Dialog")
	_uState36Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME', 1))
	_uState36Trans6:AddCondition ( CScriptConditionQuestState('pl_Human', 'ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME', 1) )
	_uState36Trans6:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_031", "*You've distributed the purple mixture to several kettles, so that you can start over again if necessary.*", 130, 16777215))
	_uState36Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans6 = nil

-- TO STATE: choice
_uState36Trans7 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T7", "Dialog")
	_uState36Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 1))
	_uState36Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_032PC", "*Add blue ice.*", 99, 16777215))
	_uState36Trans7:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_033", "*The mixture stirs and suddenly freezes to ice, spreading onto the fire and through the laboratory. With a quick fire-spell you stop it, but the mixture is gone.*", 132, 16777215))
	_uState36Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState36Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState36Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState36Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 0, 4))
	_uState36Trans7:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron2_Answer1', 1, 4))
	_uState36Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans7 = nil

-- TO STATE: choice
_uState36Trans8 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T8", "Dialog")
	_uState36Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState36Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_034PC", "*Add fireberry.*", 99, 16777215))
	_uState36Trans8:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_035", "*As the berries melt into the kettle it starts glowing red. With a loud BANG! The whole thing explodes.*", 134, 16777215))
	_uState36Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState36Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState36Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState36Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 0, 4))
	_uState36Trans8:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron2_Answer2', 1, 4))
	_uState36Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans8 = nil

-- TO STATE: choice
_uState36Trans9 = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36_T9", "Dialog")
	_uState36Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 3))
	_uState36Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_036PC", "*Use a flash-spell on the brew.*", 99, 16777215))
	_uState36Trans9:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_037", "*The spell is reflected back onto you and with a loud yelp you wish you hadn't listened to this Professor Twiddle.*", 136, 16777215))
	_uState36Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState36Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState36Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState36Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 0, 4))
	_uState36Trans9:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron2_Answer3', 1, 4))
	_uState36Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState36Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState36, _uState36, "State_36", "State_36", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState36, _uBeginState, "State_36", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState42Trans1 = GdsCreateTransition (_uState27, _uState42, "State_27", "State_42_T1", "Dialog")
	_uState42Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 2))
	_uState42Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_026PC", "When the colour is green, throw in the cut Hornsilver-pieces.", 99, 16777215))
	_uState42Trans1:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_027", "The cauldron shudders and the fluid turns purple. But nothing else happens.", 126, 16777215))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron1_End', 1, 4))
	_uState42Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CAULDRON)', 1, 4))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState42Trans1 = nil

-- TO STATE: endconversation
_uState42Trans2 = GdsCreateTransition (_uState14, _uState42, "State_14", "State_42_T2", "Dialog")
	_uState42Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Cauldron_Twenty', 1, 2) ))
	_uState42Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Cauldron_Thirtyeight', 1, 2) ))
	_uState42Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Cauldron_Crush', 1, 2) ))
	_uState42Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uState42Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CAULDRON)', 1, 4))
	_uState42Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState42Trans2 = nil

-- TO STATE: endconversation
_uState42Trans3 = GdsCreateTransition (_uState36, _uState42, "State_36", "State_42_T3", "Dialog")
	_uState42Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "cauldron", 4))
	_uState42Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_CAULDRON_038PC", "*Add some of your own blood.*", 99, 16777215))
	_uState42Trans3:AddAction (CScriptActionSay("cauldron", "P710_DLG_CAULDRON_039", "*The fluid starts to stir violently within the kettle. It almost seems alive.*", 138, 16777215))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CAULDRON)', 0, 4))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CAULDRON)', 0, 4))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CAULDRON)', 0, 4))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CAULDRON)', 0, 4))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'mf_P710_Cauldron2_Finished', 1, 4))
	_uState42Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CAULDRON)', 1, 4))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState42Trans3 = nil

-- TO STATE: endconversation
_uState42Trans4 = GdsCreateTransition (_uState1, _uState42, "State_1", "State_42_T4", "Dialog")
	_uState42Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME', 1) )
	_uState42Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'ADDON3_MAP09_TWIDDLE_ISAIDOPENSESAME', 1) ))
	_uState42Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "cauldron"))
	_uState42Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CAULDRON)', 1, 4))
	_uState42Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CAULDRON)', 1, 4))
	_uState42Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState42, _uState42, "State_42", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(CAULDRON)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CAULDRON)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CAULDRON)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState42, _uState42, "State_42", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(CAULDRON)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CAULDRON)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CAULDRON)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState42, _uState42, "State_42", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(CAULDRON)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CAULDRON)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CAULDRON)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState42, _uState42, "State_42", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(CAULDRON)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "cauldron"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CAULDRON)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CAULDRON)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState42, _uBeginState, "State_42", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(CAULDRON)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('cauldron', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState6 = nil
_uState11 = nil
_uState14 = nil
_uState15 = nil
_uState18 = nil
_uState21 = nil
_uState23 = nil
_uState27 = nil
_uState30 = nil
_uState32 = nil
_uState36 = nil
_uState42 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("cauldron_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CAULDRON)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/treasure_BeginDialog.tak', 'pl_HumanAvatar', 'cauldron'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CAULDRON)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

