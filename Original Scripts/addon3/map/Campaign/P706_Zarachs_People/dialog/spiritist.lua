local _uSM = GdsCreateStateMachine ("spiritist_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState11 = GdsCreateState (_uSM, "State_11")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState16 = GdsCreateState (_uSM, "State_16")
_uState20 = GdsCreateState (_uSM, "State_20")
_uState23 = GdsCreateState (_uSM, "State_23")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState30 = GdsCreateState (_uSM, "State_30")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('spiritist'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SPIRITIST)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SPIRITIST)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('spiritist', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("spiritist", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "spiritist"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SPIRITIST)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('spiritist', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("spiritist")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SPIRITIST)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mv_P706_State_Spiritist', 0, 2))
	_uState2Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_001", "No need to explain yourself, I already know why you`ve come here, Shaikan. That scroll holds great power, but it shouldn`t be used in the way as it is now.", 100, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState5Trans1 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'mv_P706_State_Spiritist', 2, 2))
	_uState5Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 0, 2) ))
	_uState5Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_007", "Shaikan, your intentions are clear to me. You want to see the land from above, like a bird. I can help you with these Totems.", 106, 16777215))
	_uState5Trans1:AddAction (CScriptActionSpawnRTSToPlayer(88, 'pl_Human', 'Spiritist', 4))
	_uState5Trans1:AddAction (CScriptActionPlayerIncrementWarriorUnitCap('pl_Human', 20))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 3, 4))
	_uState5Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_008", "I`ll also share with you the secret technique of creating more Totems. You can now upgrade your Arena to Zarach`s Temple.", 107, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_009", "...and by the way...", 108, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState5Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState7Trans1 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 2))
	_uState7Trans1:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_011PC", "You got a deal.", 1, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: choice
_uState7Trans2 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 2))
	_uState7Trans2:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_013PC", "I`ll rather keep it.", 2, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: choice
_uState7Trans3 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 2))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 0, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRITIST)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionShowChoices())
	_uState7Trans3 = nil

-- TO STATE: choice
_uState7Trans4 = GdsCreateTransition (_uState5, _uState7, "State_5", "State_7_T4", "Dialog")
	_uState7Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 704, 1, 1, 1))
	_uState7Trans4:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_010", "Nice necklace of yours. If you`d decide to part with it, I can offer you in exchange the services of even stronger aerial units, Spiritists.", 109, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState7Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState11Trans1 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 2))
	_uState11Trans1:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_016PC", "I`ll get it for you.", 1, 16777215))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: choice
_uState11Trans2 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 2))
	_uState11Trans2:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_018PC", "Not now.", 2, 16777215))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState11Trans2 = nil

-- TO STATE: choice
_uState11Trans3 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T3", "Dialog")
	_uState11Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 2))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRITIST)', 1, 4))
	_uState11Trans3:AddAction (CScriptActionShowChoices())
	_uState11Trans3 = nil

-- TO STATE: choice
_uState11Trans4 = GdsCreateTransition (_uState5, _uState11, "State_5", "State_11_T4", "Dialog")
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 704, 1, 1, 1) ))
	_uState11Trans4:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_015", "I have some blueprints you might be interested in. The blueprints for the Shrine of Wrath. There you can train spiritists. But in exchange I want something from you. Bring me the necklace from the troll hunter. What do you say?", 114, 16777215))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState11Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState14Trans1 = GdsCreateTransition (_uState1, _uState14, "State_1", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionValue('', 'mv_P706_State_Spiritist', 3, 2))
	_uState14Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 0, 2) ))
	_uState14Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 2, 2) ))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState14Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState16Trans1 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 2))
	_uState16Trans1:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_021PC", "Here you go.", 1, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: choice
_uState16Trans2 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 2))
	_uState16Trans2:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_023PC", "Maybe later.", 2, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: choice
_uState16Trans3 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 2))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRITIST)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionShowChoices())
	_uState16Trans3 = nil

-- TO STATE: choice
_uState16Trans4 = GdsCreateTransition (_uState14, _uState16, "State_14", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 704, 1, 1, 1))
	_uState16Trans4:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_020", "Shaikan, I see you've the necklace.", 119, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState16Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState20Trans1 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T1", "Dialog")
	_uState20Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 2))
	_uState20Trans1:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_026PC", "I`ll get it for you.", 1, 16777215))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 1, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState20Trans1 = nil

-- TO STATE: choice
_uState20Trans2 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T2", "Dialog")
	_uState20Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 2))
	_uState20Trans2:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_028PC", "Not now.", 2, 16777215))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 1, 4))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState20Trans2 = nil

-- TO STATE: choice
_uState20Trans3 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T3", "Dialog")
	_uState20Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 2))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 0, 4))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRITIST)', 1, 4))
	_uState20Trans3:AddAction (CScriptActionShowChoices())
	_uState20Trans3 = nil

-- TO STATE: choice
_uState20Trans4 = GdsCreateTransition (_uState14, _uState20, "State_14", "State_20_T4", "Dialog")
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 704, 1, 1, 1) ))
	_uState20Trans4:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_025", "I have some blueprints you might be interested in. The blueprints for the Shrine of Wrath. There you can train spiritists. But in exchange I want something from you. Bring me the necklace from the troll hunter. What do you say?", 124, 16777215))
	_uState20Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState20Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState20, _uBeginState, "State_20", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState23Trans1 = GdsCreateTransition (_uState1, _uState23, "State_1", "State_23_T1", "Dialog")
	_uState23Trans1:AddCondition (CScriptConditionValue('', 'mv_P706_State_Spiritist', 4, 2))
	_uState23Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 0, 2) ))
	_uState23Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 2, 2) ))
	_uState23Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 3, 2) ))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState23Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState23, _uBeginState, "State_23", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState25Trans1 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 2))
	_uState25Trans1:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_031PC", "Take it.", 1, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: choice
_uState25Trans2 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 2))
	_uState25Trans2:AddAction (CScriptActionChoice("P706_DLG_SPIRITIST_023PC", "Maybe later.", 2, 16777215))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState25Trans2 = nil

-- TO STATE: choice
_uState25Trans3 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T3", "Dialog")
	_uState25Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 2))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRITIST)', 1, 4))
	_uState25Trans3:AddAction (CScriptActionShowChoices())
	_uState25Trans3 = nil

-- TO STATE: choice
_uState25Trans4 = GdsCreateTransition (_uState23, _uState25, "State_23", "State_25_T4", "Dialog")
	_uState25Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 704, 1, 1, 1))
	_uState25Trans4:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_030", "Ah, the neckace! You have it. Please, give it to me... fast, give it to me!", 129, 16777215))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState25Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState30Trans1 = GdsCreateTransition (_uState2, _uState30, "State_2", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'MQ07_NLELIMINATE', 2))
	_uState30Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_002", "Most Nameless are destroyed, but still their energy remains. But I can rearrange the spell so that it will give the Dragon his might back and remove the stone.", 101, 16777215))
	_uState30Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_003PC", "Great! If all things were just this easy.", 102, 16777215))
	_uState30Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_004", "Ma santu selimash likrano el alaméu! Ma santu selimash likrano el alaméu!", 103, 16777215))
	_uState30Trans1:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_005", "It is done.", 104, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 1, 4))
	_uState30Trans1:AddAction (CScriptActionDialogEnable("spiritist", 0))
	_uState30Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SPIRITIST)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: endconversation
_uState30Trans2 = GdsCreateTransition (_uState2, _uState30, "State_2", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'MQ07_NLELIMINATE', 2) ))
	_uState30Trans2:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_006", "You haven`t destroyed enough of the Nameless. Their energy distorts the magic I wield. Return to me, when you destroyed their base.", 105, 16777215))
	_uState30Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SPIRITIST)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: endconversation
_uState30Trans3 = GdsCreateTransition (_uState7, _uState30, "State_7", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 1))
	_uState30Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_011PC", "You got a deal.", 99, 16777215))
	_uState30Trans3:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_012", "The spiritists will follow your command. Take these blueprints as well, they`ll help you build the Shrine of Wrath. With that you can field your own spiritists.", 111, 16777215))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans3:AddAction (CScriptActionSpawnRTSToPlayer(93, 'pl_Human', 'pl_HumanAvatar', 6))
	_uState30Trans3:AddAction (CScriptActionPlayerIncrementWarriorUnitCap('pl_Human', 20))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 5, 4))
	_uState30Trans3:AddAction (CScriptActionDialogEnable("spiritist", 0))
	_uState30Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SPIRITIST)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans3 = nil

-- TO STATE: endconversation
_uState30Trans4 = GdsCreateTransition (_uState7, _uState30, "State_7", "State_30_T4", "Dialog")
	_uState30Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 2))
	_uState30Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_013PC", "I`ll rather keep it.", 99, 16777215))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 3, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans4:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_014", "Come back if you change your mind.", 113, 16777215))
	_uState30Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SPIRITIST)', 1, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans4 = nil

-- TO STATE: endconversation
_uState30Trans5 = GdsCreateTransition (_uState11, _uState30, "State_11", "State_30_T5", "Dialog")
	_uState30Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 1))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_016PC", "I`ll get it for you.", 99, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_017", "Marvellous! I can mark it on your map... here, you will find it here.", 116, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 4, 4))
	_uState30Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SPIRITIST)', 1, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans5 = nil

-- TO STATE: endconversation
_uState30Trans6 = GdsCreateTransition (_uState11, _uState30, "State_11", "State_30_T6", "Dialog")
	_uState30Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 2))
	_uState30Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_018PC", "Not now.", 99, 16777215))
	_uState30Trans6:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_014", "Come back if you change your mind.", 118, 16777215))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 3, 4))
	_uState30Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SPIRITIST)', 1, 4))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans6 = nil

-- TO STATE: endconversation
_uState30Trans7 = GdsCreateTransition (_uState16, _uState30, "State_16", "State_30_T7", "Dialog")
	_uState30Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 1))
	_uState30Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_021PC", "Here you go.", 99, 16777215))
	_uState30Trans7:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_022", "The spiritists will follow your command. Take these blueprints as well, they`ll help you build the Shrine of Wrath. With that you can field your own spiritists.", 121, 16777215))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans7:AddAction (CScriptActionSpawnRTSToPlayer(93, 'pl_Human', 'pl_HumanAvatar', 6))
	_uState30Trans7:AddAction (CScriptActionPlayerIncrementWarriorUnitCap('pl_Human', 20))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 5, 4))
	_uState30Trans7:AddAction (CScriptActionDialogEnable("spiritist", 0))
	_uState30Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(SPIRITIST)', 1, 4))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans7 = nil

-- TO STATE: endconversation
_uState30Trans8 = GdsCreateTransition (_uState16, _uState30, "State_16", "State_30_T8", "Dialog")
	_uState30Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 2))
	_uState30Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_023PC", "Maybe later.", 99, 16777215))
	_uState30Trans8:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_024", "Come back if you change your mind.", 123, 16777215))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(SPIRITIST)', 1, 4))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans8 = nil

-- TO STATE: endconversation
_uState30Trans9 = GdsCreateTransition (_uState20, _uState30, "State_20", "State_30_T9", "Dialog")
	_uState30Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 1))
	_uState30Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_026PC", "I`ll get it for you.", 99, 16777215))
	_uState30Trans9:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_027", "Marvellous! I can mark it on your map... here, you will find it here.", 126, 16777215))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 4, 4))
	_uState30Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(SPIRITIST)', 1, 4))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans9 = nil

-- TO STATE: endconversation
_uState30Trans10 = GdsCreateTransition (_uState20, _uState30, "State_20", "State_30_T10", "Dialog")
	_uState30Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 2))
	_uState30Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_028PC", "Not now.", 99, 16777215))
	_uState30Trans10:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_029", "Come back if you change your mind.", 128, 16777215))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 3, 4))
	_uState30Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(SPIRITIST)', 1, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans10 = nil

-- TO STATE: endconversation
_uState30Trans11 = GdsCreateTransition (_uState25, _uState30, "State_25", "State_30_T11", "Dialog")
	_uState30Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 1))
	_uState30Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_031PC", "Take it.", 99, 16777215))
	_uState30Trans11:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_022", "The spiritists will follow your command. Take these blueprints as well, they`ll help you build the Shrine of Wrath. With that you can field your own spiritists.", 131, 16777215))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionSpawnRTSToPlayer(93, 'pl_Human', 'pl_HumanAvatar', 6))
	_uState30Trans11:AddAction (CScriptActionPlayerIncrementWarriorUnitCap('pl_Human', 20))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'mv_P706_State_Spiritist', 5, 4))
	_uState30Trans11:AddAction (CScriptActionDialogEnable("spiritist", 0))
	_uState30Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(SPIRITIST)', 1, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans11 = nil

-- TO STATE: endconversation
_uState30Trans12 = GdsCreateTransition (_uState25, _uState30, "State_25", "State_30_T12", "Dialog")
	_uState30Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "spiritist", 2))
	_uState30Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SPIRITIST_023PC", "Maybe later.", 99, 16777215))
	_uState30Trans12:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_024", "Come back if you change your mind.", 133, 16777215))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRITIST)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRITIST)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(SPIRITIST)', 1, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans12 = nil

-- TO STATE: endconversation
_uState30Trans13 = GdsCreateTransition (_uState23, _uState30, "State_23", "State_30_T13", "Dialog")
	_uState30Trans13:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 704, 1, 1, 1) ))
	_uState30Trans13:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_035", "No necklace, no blueprints, no spiritists.", 134, 16777215))
	_uState30Trans13:AddAction (CScriptActionSay("spiritist", "P706_DLG_SPIRITIST_036", "I want that necklace.", 135, 16777215))
	_uState30Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(SPIRITIST)', 1, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans13 = nil

-- TO STATE: endconversation
_uState30Trans14 = GdsCreateTransition (_uState1, _uState30, "State_1", "State_30_T14", "Dialog")
	_uState30Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 0, 2) ))
	_uState30Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 2, 2) ))
	_uState30Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 3, 2) ))
	_uState30Trans14:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Spiritist', 4, 2) ))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'mf_P706_DialogError_Spiritist', 1, 4))
	_uState30Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spiritist"))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(SPIRITIST)', 1, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRITIST)', 1, 4))
	_uState30Trans14 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SPIRITIST)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SPIRITIST)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SPIRITIST)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SPIRITIST)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SPIRITIST)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SPIRITIST)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SPIRITIST)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SPIRITIST)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(SPIRITIST)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SPIRITIST)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(SPIRITIST)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SPIRITIST)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(SPIRITIST)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(SPIRITIST)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(SPIRITIST)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(SPIRITIST)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(SPIRITIST)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(SPIRITIST)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(SPIRITIST)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(SPIRITIST)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(SPIRITIST)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(SPIRITIST)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(SPIRITIST)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(SPIRITIST)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(SPIRITIST)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(SPIRITIST)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState30, _uState30, "State_30", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(SPIRITIST)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "spiritist"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(SPIRITIST)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 4))
	_uEndActions14 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SPIRITIST)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spiritist', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState2 = nil
_uState5 = nil
_uState7 = nil
_uState11 = nil
_uState14 = nil
_uState16 = nil
_uState20 = nil
_uState23 = nil
_uState25 = nil
_uState30 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("spiritist_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SPIRITIST)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/spiritist_BeginDialog.tak', 'pl_HumanAvatar', 'spiritist'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SPIRITIST)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

