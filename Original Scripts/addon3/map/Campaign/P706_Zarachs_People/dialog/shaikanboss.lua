local _uSM = GdsCreateStateMachine ("shaikanboss_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState16 = GdsCreateState (_uSM, "State_16")
_uState21 = GdsCreateState (_uSM, "State_21")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('shaikanboss'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SHAIKANBOSS)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SHAIKANBOSS)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('shaikanboss', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "shaikanboss"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SHAIKANBOSS)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("shaikanboss")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SHAIKANBOSS)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_007PC", "OK", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHAIKANBOSS)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 0, 2))
	_uState3Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_001", "I see, you mixed with the Clans. How strange... and now... what did bring you here?", 100, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_002PC", "Join our forces. The Nameless are gathering. This is our only chance to survive!", 101, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_003", "We are strong. We don稚 need you. You値l see that yourself soon... However... here痴 my suggestion... lets have a duel... If you can defeat me, then maybe I値l consider your offer. Maybe.", 102, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_004PC", "...", 103, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_005", "You and me only! Spells and weapons are allowed. Your fellows must NOT interfere!", 104, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_006", "You cannot leave the duel pit during the duel!", 105, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState3Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_009PC", "Sure, lets start!", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 2))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 0, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHAIKANBOSS)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionShowChoices())
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState3, _uState5, "State_3", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 1))
	_uState5Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_007PC", "OK", 99, 16777215))
	_uState5Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_008", "Are you sure, that you are ready... to face me?", 107, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState5Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState10Trans1 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 2))
	_uState10Trans1:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_016PC", "Yes, lets try again!", 1, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: choice
_uState10Trans2 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 2))
	_uState10Trans2:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_017PC", "Will come back later...", 2, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: choice
_uState10Trans3 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 2))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHAIKANBOSS)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionShowChoices())
	_uState10Trans3 = nil

-- TO STATE: choice
_uState10Trans4 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 1, 2))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 0, 2) ))
	_uState10Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_015", "Want some more?", 114, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState10Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState14Trans1 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 2))
	_uState14Trans1:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_007PC", "OK", 1, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 1, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState14Trans1 = nil

-- TO STATE: choice
_uState14Trans2 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T2", "Dialog")
	_uState14Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 2))
	_uState14Trans2:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 2, 16777215))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 1, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState14Trans2 = nil

-- TO STATE: choice
_uState14Trans3 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T3", "Dialog")
	_uState14Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 2))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 0, 4))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHAIKANBOSS)', 1, 4))
	_uState14Trans3:AddAction (CScriptActionShowChoices())
	_uState14Trans3 = nil

-- TO STATE: choice
_uState14Trans4 = GdsCreateTransition (_uState1, _uState14, "State_1", "State_14_T4", "Dialog")
	_uState14Trans4:AddCondition (CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 2, 2))
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 0, 2) ))
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 1, 2) ))
	_uState14Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_019", "You cheated! I knew that you cannot defeat me without such a shameful deed!", 118, 16777215))
	_uState14Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_020", "Now... lets get straight... do you want a proper duel or not?", 119, 16777215))
	_uState14Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_021", "You and me only! Spells and weapons are allowed, but this time your fellows must really NOT interfere!", 120, 16777215))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState14Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState16Trans1 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 2))
	_uState16Trans1:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_009PC", "Sure, lets start!", 1, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: choice
_uState16Trans2 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 2))
	_uState16Trans2:AddAction (CScriptActionChoice("P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 2, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: choice
_uState16Trans3 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 2))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHAIKANBOSS)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionShowChoices())
	_uState16Trans3 = nil

-- TO STATE: choice
_uState16Trans4 = GdsCreateTransition (_uState14, _uState16, "State_14", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 1))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_007PC", "OK", 99, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_008", "Are you sure, that you are ready... to face me?", 122, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState16Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState21Trans1 = GdsCreateTransition (_uState5, _uState21, "State_5", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 1))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_009PC", "Sure, lets start!", 99, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_010", "Fight!", 109, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'mv_P706_Progress_ShaikanDuel', 1, 4))
	_uState21Trans1:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHAIKANBOSS)', 1, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans1 = nil

-- TO STATE: endconversation
_uState21Trans2 = GdsCreateTransition (_uState5, _uState21, "State_5", "State_21_T2", "Dialog")
	_uState21Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 2))
	_uState21Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 99, 16777215))
	_uState21Trans2:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_012", "I knew you値l flee... haha", 111, 16777215))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'mf_P706_ShaikanDuel_TeleportOut', 1, 4))
	_uState21Trans2:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SHAIKANBOSS)', 1, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans2 = nil

-- TO STATE: endconversation
_uState21Trans3 = GdsCreateTransition (_uState3, _uState21, "State_3", "State_21_T3", "Dialog")
	_uState21Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 2))
	_uState21Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 99, 16777215))
	_uState21Trans3:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_012", "I knew you値l flee... haha", 113, 16777215))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'mf_P706_ShaikanDuel_TeleportOut', 1, 4))
	_uState21Trans3:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SHAIKANBOSS)', 1, 4))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans3 = nil

-- TO STATE: endconversation
_uState21Trans4 = GdsCreateTransition (_uState10, _uState21, "State_10", "State_21_T4", "Dialog")
	_uState21Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 1))
	_uState21Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_016PC", "Yes, lets try again!", 99, 16777215))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'mv_P706_Progress_ShaikanDuel', 1, 4))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans4:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SHAIKANBOSS)', 1, 4))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans4 = nil

-- TO STATE: endconversation
_uState21Trans5 = GdsCreateTransition (_uState10, _uState21, "State_10", "State_21_T5", "Dialog")
	_uState21Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 2))
	_uState21Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_017PC", "Will come back later...", 99, 16777215))
	_uState21Trans5:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_018", "Haha... sure... if you dare... which I doubt.", 117, 16777215))
	_uState21Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans5:AddAction (CScriptActionValueModify('', 'mf_P706_ShaikanDuel_TeleportOut', 1, 4))
	_uState21Trans5:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SHAIKANBOSS)', 1, 4))
	_uState21Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans5 = nil

-- TO STATE: endconversation
_uState21Trans6 = GdsCreateTransition (_uState16, _uState21, "State_16", "State_21_T6", "Dialog")
	_uState21Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 1))
	_uState21Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_009PC", "Sure, lets start!", 99, 16777215))
	_uState21Trans6:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_010", "Fight!", 124, 16777215))
	_uState21Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans6:AddAction (CScriptActionValueModify('', 'mv_P706_Progress_ShaikanDuel', 1, 4))
	_uState21Trans6:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SHAIKANBOSS)', 1, 4))
	_uState21Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans6 = nil

-- TO STATE: endconversation
_uState21Trans7 = GdsCreateTransition (_uState16, _uState21, "State_16", "State_21_T7", "Dialog")
	_uState21Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 2))
	_uState21Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 99, 16777215))
	_uState21Trans7:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_012", "I knew you値l flee... haha", 126, 16777215))
	_uState21Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans7:AddAction (CScriptActionValueModify('', 'mf_P706_ShaikanDuel_TeleportOut', 1, 4))
	_uState21Trans7:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(SHAIKANBOSS)', 1, 4))
	_uState21Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans7 = nil

-- TO STATE: endconversation
_uState21Trans8 = GdsCreateTransition (_uState14, _uState21, "State_14", "State_21_T8", "Dialog")
	_uState21Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 2))
	_uState21Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAIKANBOSS_011PC", "Later, I'd rather leave now...", 99, 16777215))
	_uState21Trans8:AddAction (CScriptActionSay("shaikanboss", "P706_DLG_SHAIKANBOSS_012", "I knew you値l flee... haha", 128, 16777215))
	_uState21Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKANBOSS)', 0, 4))
	_uState21Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKANBOSS)', 0, 4))
	_uState21Trans8:AddAction (CScriptActionValueModify('', 'mf_P706_ShaikanDuel_TeleportOut', 1, 4))
	_uState21Trans8:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(SHAIKANBOSS)', 1, 4))
	_uState21Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans8 = nil

-- TO STATE: endconversation
_uState21Trans9 = GdsCreateTransition (_uState1, _uState21, "State_1", "State_21_T9", "Dialog")
	_uState21Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 0, 2) ))
	_uState21Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 1, 2) ))
	_uState21Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_ShaikanBoss', 2, 2) ))
	_uState21Trans9:AddAction (CScriptActionValueModify('', 'mf_P706_DialogError_ShaikanBoss', 1, 4))
	_uState21Trans9:AddAction (CScriptActionDialogEnable("shaikanboss", 0))
	_uState21Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikanboss"))
	_uState21Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(SHAIKANBOSS)', 1, 4))
	_uState21Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKANBOSS)', 1, 4))
	_uState21Trans9 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SHAIKANBOSS)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHAIKANBOSS)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SHAIKANBOSS)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SHAIKANBOSS)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SHAIKANBOSS)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SHAIKANBOSS)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SHAIKANBOSS)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SHAIKANBOSS)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(SHAIKANBOSS)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SHAIKANBOSS)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(SHAIKANBOSS)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SHAIKANBOSS)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(SHAIKANBOSS)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(SHAIKANBOSS)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(SHAIKANBOSS)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(SHAIKANBOSS)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState21, _uState21, "State_21", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(SHAIKANBOSS)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikanboss"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(SHAIKANBOSS)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 4))
	_uEndActions9 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKANBOSS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikanboss', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 4))
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
_uState14 = nil
_uState16 = nil
_uState21 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("shaikanboss_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHAIKANBOSS)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shaikanboss'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikanboss", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shaikanboss', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
