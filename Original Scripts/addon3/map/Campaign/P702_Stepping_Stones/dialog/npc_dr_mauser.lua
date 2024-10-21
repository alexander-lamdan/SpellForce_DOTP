local _uSM = GdsCreateStateMachine ("npc_dr_mauser_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState9 = GdsCreateState (_uSM, "State_9")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P702_DLG_DRMAUSER_002PC", "Tell me about Falkmar.", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P702_DLG_DRMAUSER_004PC", "Tell me about Einar.", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 2))
	_uState2Trans3:AddAction (CScriptActionChoice("P702_DLG_DRMAUSER_006PC", "Tell me about Agathos.", 3, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: choice
_uState2Trans4 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 2))
	_uState2Trans4:AddAction (CScriptActionChoice("P702_DLG_DRMAUSER_008PC", "Tell me about Urgi.", 4, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: choice
_uState2Trans5 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 2))
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'mf_P702_HirinSQActive', 1, 2))
	_uState2Trans5:AddAction (CScriptActionChoice("P702_DLG_DRMAUSER_010PC", "I have this message for you. (Hand over the scroll you received in the first trial.) ", 5, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans5 = nil

-- TO STATE: choice
_uState2Trans6 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 2))
	_uState2Trans6:AddAction (CScriptActionChoice("P702_DLG_DRMAUSER_012PC", "That is all I wanted know.", 6, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: choice
_uState2Trans7 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 2))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans7:AddAction (CScriptActionShowChoices())
	_uState2Trans7 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('npc_dr_mauser'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NPC_DR_MAUSER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NPC_DR_MAUSER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('npc_dr_mauser', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "npc_dr_mauser"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_DR_MAUSER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NPC_DR_MAUSER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('npc_dr_mauser', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("npc_dr_mauser")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T8", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NPC_DR_MAUSER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_001", "Who are you? What are you? You’re bound to be spies by that maniac crackbrain Twiddle! I won’t tell you a thing! And if you don’t go I’ll call up the beasts and they will tear you apart. For all I know you could be the Shaikan who killed me at the portal to Sevenkeeps! No no no! I won’t tell you a thing.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P702_EreonDrMauserTalked', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans9 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T9", "Dialog")
	_uState2Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 1))
	_uState2Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_DRMAUSER_002PC", "Tell me about Falkmar.", 99, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_003", "I don’t trust any of them!", 102, 16777215))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans9 = nil

-- TO STATE: choice
_uState2Trans10 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T10", "Dialog")
	_uState2Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 2))
	_uState2Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_DRMAUSER_004PC", "Tell me about Einar.", 99, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_005", "I don’t trust any of them!", 104, 16777215))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans10 = nil

-- TO STATE: choice
_uState2Trans11 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T11", "Dialog")
	_uState2Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 3))
	_uState2Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_DRMAUSER_006PC", "Tell me about Agathos.", 99, 16777215))
	_uState2Trans11:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_007", "I don’t trust any of them!", 106, 16777215))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans11 = nil

-- TO STATE: choice
_uState2Trans12 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T12", "Dialog")
	_uState2Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 4))
	_uState2Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_DRMAUSER_008PC", "Tell me about Urgi.", 99, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_009", "I don’t trust any of them!", 108, 16777215))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans12 = nil

-- TO STATE: choice
_uState2Trans13 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T13", "Dialog")
	_uState2Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 5))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_DRMAUSER_010PC", "I have this message for you. (Hand over the scroll you received in the first trial.) ", 99, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_011", "A message for me? From who? This letter doesn't make sense at all, it's not for me.", 110, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mf_P702_HirinSQActive', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mf_P702_HirinSQFailed', 1, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState2Trans13 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_dr_mauser"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_dr_mauser"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_dr_mauser', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_DR_MAUSER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState9Trans1 = GdsCreateTransition (_uState2, _uState9, "State_2", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 6))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_DRMAUSER_012PC", "That is all I wanted know.", 99, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("npc_dr_mauser", "P702_DLG_DRMAUSER_013", "Good riddance!", 112, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_DR_MAUSER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_DR_MAUSER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_DR_MAUSER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_DR_MAUSER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_DR_MAUSER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_DR_MAUSER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_dr_mauser"))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_DR_MAUSER)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_DR_MAUSER)', 1, 4))
	_uState9Trans1 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NPC_DR_MAUSER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_dr_mauser"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_DR_MAUSER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_DR_MAUSER)', 1, 4))
	_uEndActions1 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NPC_DR_MAUSER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_DR_MAUSER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_dr_mauser', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_DR_MAUSER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState9 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("npc_dr_mauser_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_DR_MAUSER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_DR_MAUSER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_dr_mauser'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_dr_mauser", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_dr_mauser', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
