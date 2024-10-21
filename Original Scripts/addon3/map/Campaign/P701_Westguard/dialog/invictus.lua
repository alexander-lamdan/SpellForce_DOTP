local _uSM = GdsCreateStateMachine ("invictus_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState12 = GdsCreateState (_uSM, "State_12")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('invictus'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(INVICTUS)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(INVICTUS)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('invictus', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "invictus"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(INVICTUS)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(INVICTUS)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('invictus', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("invictus")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(INVICTUS)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(INVICTUS)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('invictus', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(INVICTUS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P701_DLG_INVICTUS_003PC", "Invictus, hm? Strong name.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P701_DLG_INVICTUS_010PC", "Then do so, Invictus.", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(INVICTUS)', 0, 2))
	_uState5Trans3:AddAction (CScriptActionChoice("P701_DLG_INVICTUS_012PC", "Thank you, Invictus. Let me talk to the others first.", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(INVICTUS)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 2))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(INVICTUS)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionShowChoices())
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_ZweihanderFirstMet', 0, 2) ))
	_uState5Trans5:AddAction (CScriptActionSay("invictus", "P701_DLG_INVICTUS_002", "Greetings.", 101, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T6", "Dialog")
	_uState5Trans6:AddCondition (CScriptConditionValue('', 'mf_ZweihanderFirstMet', 0, 2))
	_uState5Trans6:AddAction (CScriptActionSay("invictus", "P701_DLG_INVICTUS_001", "Greetings, elder. My name is Invictus. The lieutenant said you could use a strong hand?", 100, 16777215))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState5Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "invictus"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('invictus', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(INVICTUS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState7Trans1 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 2))
	_uState7Trans1:AddAction (CScriptActionChoice("P701_DLG_INVICTUS_007PC", "Then do so, Invictus.", 1, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: choice
_uState7Trans2 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 2))
	_uState7Trans2:AddAction (CScriptActionChoice("P701_DLG_INVICTUS_009PC", "Thank you, Invictus. Let me talk to the others first.", 2, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: choice
_uState7Trans3 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 2))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 0, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(INVICTUS)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionShowChoices())
	_uState7Trans3 = nil

-- TO STATE: choice
_uState7Trans4 = GdsCreateTransition (_uState5, _uState7, "State_5", "State_7_T4", "Dialog")
	_uState7Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 1))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_INVICTUS_003PC", "Invictus, hm? Strong name.", 99, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("invictus", "P701_DLG_INVICTUS_004", "It's true! Until I met with this guy called Bor - noone could beat me in fair fight. Melee that is of course. He made me one of your blood and told me to get my ass here to have some fun.", 103, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(INVICTUS)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_INVICTUS_005PC", "And do you have?", 104, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("invictus", "P701_DLG_INVICTUS_006", "With all the fighting? You bet! It's so great. I wish I could be out there, smashing some skulls! My sword and myself would gladly follow you whereever you go.", 105, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState7Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "invictus"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('invictus', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(INVICTUS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState12Trans1 = GdsCreateTransition (_uState7, _uState12, "State_7", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 1))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_INVICTUS_007PC", "Then do so, Invictus.", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("invictus", "P701_DLG_INVICTUS_008", "Glory and riches! More riches than glory, preferably.", 107, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "invictus"))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(INVICTUS)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: endconversation
_uState12Trans2 = GdsCreateTransition (_uState7, _uState12, "State_7", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 2))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_INVICTUS_009PC", "Thank you, Invictus. Let me talk to the others first.", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "invictus"))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(INVICTUS)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: endconversation
_uState12Trans3 = GdsCreateTransition (_uState5, _uState12, "State_5", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 2))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_INVICTUS_010PC", "Then do so, Invictus.", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("invictus", "P701_DLG_INVICTUS_011", "Glory and riches! More riches than glory, preferably.", 110, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(INVICTUS)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "invictus"))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(INVICTUS)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: endconversation
_uState12Trans4 = GdsCreateTransition (_uState5, _uState12, "State_5", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 3))
	_uState12Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_INVICTUS_012PC", "Thank you, Invictus. Let me talk to the others first.", 99, 16777215))
	_uState12Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "invictus"))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(INVICTUS)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(INVICTUS)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(INVICTUS)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(INVICTUS)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(INVICTUS)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(INVICTUS)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_1_ZweihanderFollow', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('Zweihander', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(INVICTUS)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(INVICTUS)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(INVICTUS)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_ZweihanderFirstMet', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(INVICTUS)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(INVICTUS)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(INVICTUS)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_1_ZweihanderFollow', 1, 4))
	_uEndActions3:AddAction (CScriptActionDialogEnable('Zweihander', 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(INVICTUS)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(INVICTUS)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(INVICTUS)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "invictus"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_ZweihanderFirstMet', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(INVICTUS)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(INVICTUS)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(INVICTUS)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(INVICTUS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('invictus', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(INVICTUS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState5 = nil
_uState7 = nil
_uState12 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("invictus_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(INVICTUS)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(INVICTUS)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'invictus'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "invictus", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'invictus', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
