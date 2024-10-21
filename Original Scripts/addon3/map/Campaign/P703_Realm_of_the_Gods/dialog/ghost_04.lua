local _uSM = GdsCreateStateMachine ("ghost_04_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState12 = GdsCreateState (_uSM, "State_12")
_uState13 = GdsCreateState (_uSM, "State_13")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState25 = GdsCreateState (_uSM, "State_25")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('ghost_04'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(GHOST_04)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(GHOST_04)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('ghost_04', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("ghost_04", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "ghost_04"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(GHOST_04)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('ghost_04', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("ghost_04")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(GHOST_04)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_04_dialog_started', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_ghost_04_dialog_fix_HasTriggered', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST04_004PC", "`Flattering` You seem like a wise man to me. Maybe you can teach me something, that I can understand things better?", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST04_006PC", "`Intimidating` Cut the lamentations, old man. You give me your number and I won't hurt you!", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 2))
	_uState3Trans3:AddAction (CScriptActionChoice("P703_DLG_GHOST04_008PC", "`Pleading` Pray tell me what you know. For I need your help in a very urgent matter.", 3, 16777215))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 2))
	_uState3Trans4:AddAction (CScriptActionChoice("P703_DLG_GHOST04_051PC", "`Comforting` I'm sorry for you. Pray tell me what happened - it's better to let things out.", 4, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 1, 4))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 2))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 0, 4))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_04)', 1, 4))
	_uState3Trans5:AddAction (CScriptActionShowChoices())
	_uState3Trans5 = nil

-- TO STATE: choice
_uState3Trans6 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T6", "Dialog")
	_uState3Trans6:AddCondition (CScriptConditionValue('', 'ev_TimesSpoken(GHOST_04)', 0, 2))
	_uState3Trans6:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_001", "Curse! Curse the Hazim!", 100, 16777215))
	_uState3Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_002PC", "You seem pretty upset, old man.", 101, 16777215))
	_uState3Trans6:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_003", "Upset? Upset is not half describing what I'm feeling right now!", 102, 16777215))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans6 = nil

-- TO STATE: choice
_uState3Trans7 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T7", "Dialog")
	_uState3Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 1))
	_uState3Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_004PC", "`Flattering` You seem like a wise man to me. Maybe you can teach me something, that I can understand things better?", 99, 16777215))
	_uState3Trans7:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_005", "Let me teach you as much - Flattery is the worst thing you can do, along with intimidation, pleading and false comfort.", 104, 16777215))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans7 = nil

-- TO STATE: choice
_uState3Trans8 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T8", "Dialog")
	_uState3Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 2))
	_uState3Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_006PC", "`Intimidating` Cut the lamentations, old man. You give me your number and I won't hurt you!", 99, 16777215))
	_uState3Trans8:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_007", "Pff, you think you can hurt me? Not after what I've gone through. There's nothing you can threaten me with.", 106, 16777215))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans8 = nil

-- TO STATE: choice
_uState3Trans9 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T9", "Dialog")
	_uState3Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4))
	_uState3Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_051PC", "`Comforting` I'm sorry for you. Pray tell me what happened - it's better to let things out.", 99, 16777215))
	_uState3Trans9:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_052", "Come now, this is pathetic", 151, 16777215))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState3Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState7Trans1 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 2))
	_uState7Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST04_014PC", "Can you tell me more?", 1, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: choice
_uState7Trans2 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 2))
	_uState7Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST04_030PC", "Unfortunately my concern really is urgent and not only my life hangs in the balance but that of all Eo!", 2, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: choice
_uState7Trans3 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 2))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 0, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_04)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionShowChoices())
	_uState7Trans3 = nil

-- TO STATE: choice
_uState7Trans4 = GdsCreateTransition (_uState3, _uState7, "State_3", "State_7_T4", "Dialog")
	_uState7Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 3))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_008PC", "`Pleading` Pray tell me what you know. For I need your help in a very urgent matter.", 99, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_009", "Why does it always have to be urgent or lifethreatening - a matter of life and death. Can't you just say: `Please, Tario, help me!`?", 108, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_010PC", "Please, Tario, help me!", 109, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_011", "Well that's better. You see, I'm a simple man. It just happened, that I was Eldest of a small village in Onyx Shores.", 110, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_012PC", "And that explains all?", 111, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_013", "You see, I've never asked for much in life but peace and quiet. And after all those events several years ago we've seen nothing but hectic, war and people asking my advice in urgent, life-or-death-matters.", 112, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState7Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState9Trans1 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 2))
	_uState9Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST04_022PC", "How come you're dead?", 1, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: choice
_uState9Trans2 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 2))
	_uState9Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST04_029PC", "So I don't want to keep you much longer from your peace and quiet. Can you please help me?", 2, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: choice
_uState9Trans3 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 2))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_04)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionShowChoices())
	_uState9Trans3 = nil

-- TO STATE: choice
_uState9Trans4 = GdsCreateTransition (_uState7, _uState9, "State_7", "State_9_T4", "Dialog")
	_uState9Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 1))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_014PC", "Can you tell me more?", 99, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_015", "You see, before this old man visited my village, everything was fine. But then the Hazim came.", 114, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_016", "He had called himself Darius but I'm not sure that this was his real name.", 115, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_017PC", "Darius! Then you were involved with the destruction of the Circle?", 116, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_018", "If you mean, that a Runewarrior with his army came by my village, needed my help and then told everyone what a kind and wise man I am, then yes! I was involved with the destruction of the Circle….", 117, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_019", "I've never asked for popularity.", 118, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_020PC", "I know - peace and quiet.", 119, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_021", "Exactly! ", 120, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState9Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState12Trans1 = GdsCreateTransition (_uState7, _uState12, "State_7", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 2))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_030PC", "Unfortunately my concern really is urgent and not only my life hangs in the balance but that of all Eo!", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: showchoice
_uState12Trans2 = GdsCreateTransition (_uState9, _uState12, "State_9", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 1))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_022PC", "How come you're dead?", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_023", "How come you want to know?", 122, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_024PC", "I'm not sure. I guess I was just trying to be polite.", 123, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_025", "Hehe, at least you're honest, I give you that. You see, Empress Alyah, visited my village when a bunch of Hazim assassins ambushed us. They thought they had easy prey but they hadn't reckoned with the Empress. She fought like a lion. What do I say? She fought like a dragon!", 124, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_026PC", "But you're dead nonetheless.", 125, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_027", "Alas, yes. She had struck down all melee-fighters when an arrow pierced her thigh and she went down. I ran to her but was struck down from behind by an arrow. I don't know what happened to her but I do hope she got the better of them. ", 126, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_028PC", "A moving story. I now understand why you cursed the Hazim. I too knew Alyah Arias. I as well hope she's still alive. Her reign has stabilized Xu so much. Can I now ask you for your help?", 127, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: showchoice
_uState12Trans3 = GdsCreateTransition (_uState9, _uState12, "State_9", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 2))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_029PC", "So I don't want to keep you much longer from your peace and quiet. Can you please help me?", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState12Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState13Trans1 = GdsCreateTransition (_uState12, _uState13, "State_12", "State_13_T1", "Dialog")
	_uState13Trans1:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_031", "Ah well, let's get down to business. How can I be of help to you? But should it be my number that you want - be warned, that I have two conditions before I swap mine with yours.", 130, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_032PC", "You are very wise, Tario. It is about the numbers. So what are these conditions?", 131, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'ev_TimesSpoken(GHOST_04)', 1, 0))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: label
_uState13Trans2 = GdsCreateTransition (_uState1, _uState13, "State_1", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'ev_TimesSpoken(GHOST_04)', 0, 2) ))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState13Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState15Trans1 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 2))
	_uState15Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST04_034PC", "I'm sorry. That's not the case", 1, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: choice
_uState15Trans2 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 2))
	_uState15Trans2:AddCondition (CScriptConditionValue('', 'mv_Avatar_Number', 111, 2))
	_uState15Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST04_036PC", "Here - my number is 111. I guess that matches your condition?", 2, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: choice
_uState15Trans3 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 2))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_04)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionShowChoices())
	_uState15Trans3 = nil

-- TO STATE: choice
_uState15Trans4 = GdsCreateTransition (_uState13, _uState15, "State_13", "State_15_T4", "Dialog")
	_uState15Trans4:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_033", "My first condition is, that your number must consist of the same two, three or four digits - just like mine does, 99.", 132, 16777215))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState15Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 2))
	_uState18Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST04_039PC", "How in the name of all Dragons should I know what a Gora is?", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 2))
	_uState18Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST04_042PC", "A Gora - wasn't that the name of an Orcish leader, trying to rule all of Xu?", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 2))
	_uState18Trans3:AddAction (CScriptActionChoice("P703_DLG_GHOST04_045PC", "It's an ancient form of marketplace where speeches were held and where the eldest sat in judgement.", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 2))
	_uState18Trans4:AddAction (CScriptActionChoice("P703_DLG_GHOST04_048PC", "It's a powerful creature, resembling a bear. It's very fond of honey.", 4, 16777215))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 2))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 0, 4))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_04)', 1, 4))
	_uState18Trans5:AddAction (CScriptActionShowChoices())
	_uState18Trans5 = nil

-- TO STATE: choice
_uState18Trans6 = GdsCreateTransition (_uState15, _uState18, "State_15", "State_18_T6", "Dialog")
	_uState18Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 2))
	_uState18Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_036PC", "Here - my number is 111. I guess that matches your condition?", 99, 16777215))
	_uState18Trans6:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_037", "Good. Now for my second condition you have to answer the following question:", 136, 16777215))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState18Trans6:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_038", "What is a Gora?", 137, 16777215))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans6 = nil

-- TO STATE: choice
_uState18Trans7 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T7", "Dialog")
	_uState18Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 1))
	_uState18Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_039PC", "How in the name of all Dragons should I know what a Gora is?", 99, 16777215))
	_uState18Trans7:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_040", "This is not the correct answer, my friend. Want to try again?", 139, 16777215))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_041", "What is a Gora?", 140, 16777215))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans7 = nil

-- TO STATE: choice
_uState18Trans8 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T8", "Dialog")
	_uState18Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 2))
	_uState18Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_042PC", "A Gora - wasn't that the name of an Orcish leader, trying to rule all of Xu?", 99, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_043", "This is not the correct answer, my friend. Want to try again?", 142, 16777215))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_044", "What is a Gora?", 143, 16777215))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans8 = nil

-- TO STATE: choice
_uState18Trans9 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T9", "Dialog")
	_uState18Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 3))
	_uState18Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_045PC", "It's an ancient form of marketplace where speeches were held and where the eldest sat in judgement.", 99, 16777215))
	_uState18Trans9:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_046", "This is not the correct answer, my friend. Want to try again?", 145, 16777215))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState18Trans9:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_047", "What is a Gora?", 146, 16777215))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState18Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState25Trans1 = GdsCreateTransition (_uState15, _uState25, "State_15", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 1))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_034PC", "I'm sorry. That's not the case", 99, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_035", "Then I can't help you. Come back when you have such a number", 134, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GHOST_04)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: endconversation
_uState25Trans2 = GdsCreateTransition (_uState18, _uState25, "State_18", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 4))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST04_048PC", "It's a powerful creature, resembling a bear. It's very fond of honey.", 99, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_049", "Yes, that is a Gora. Unfortunately those beasts have become very rare. When I first came to meet one I'd almost been killed by it, had it not been for my grandfather, who lured the Gora away with a honeystick.", 148, 16777215))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_04)', 0, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_04)', 0, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_04)', 0, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GHOST_04)', 0, 4))
	_uState25Trans2:AddAction (CScriptActionSay("ghost_04", "P703_DLG_GHOST04_050", "You have matched my conditions, so let's swap numbers and good luck for you and your mission.", 149, 16777215))
	_uState25Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_04"))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GHOST_04)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_04)', 1, 4))
	_uState25Trans2 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(GHOST_04)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GHOST_04)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_04)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState25, _uState25, "State_25", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(GHOST_04)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_04"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_04_trade', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GHOST_04)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_04)', 1, 4))
	_uEndActions2 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(GHOST_04)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 4))
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
_uState9 = nil
_uState12 = nil
_uState13 = nil
_uState15 = nil
_uState18 = nil
_uState25 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("ghost_04_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GHOST_04)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GHOST_04)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_04", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_04', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
