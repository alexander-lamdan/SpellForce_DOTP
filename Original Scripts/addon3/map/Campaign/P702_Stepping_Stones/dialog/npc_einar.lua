local _uSM = GdsCreateStateMachine ("npc_einar_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState9 = GdsCreateState (_uSM, "State_9")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P702_DLG_EINAR_002PC", "Tell me about Falkmar.", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P702_DLG_EINAR_004PC", "Tell me about Dr. Mauser.", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 2))
	_uState2Trans3:AddAction (CScriptActionChoice("P702_DLG_EINAR_006PC", "Tell me about Agathos.", 3, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: choice
_uState2Trans4 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 2))
	_uState2Trans4:AddAction (CScriptActionChoice("P702_DLG_EINAR_008PC", "Tell me about Urgi.", 4, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: choice
_uState2Trans5 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 2))
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'mf_P702_HirinSQActive', 1, 2))
	_uState2Trans5:AddAction (CScriptActionChoice("P702_DLG_EINAR_010PC", "I have this message for you. (Hand over the scroll you received in the first trial.) ", 5, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans5 = nil

-- TO STATE: choice
_uState2Trans6 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 2))
	_uState2Trans6:AddAction (CScriptActionChoice("P702_DLG_EINAR_014PC", "That is all I wanted know.", 6, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 1, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: choice
_uState2Trans7 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 2))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_EINAR)', 1, 4))
	_uState2Trans7:AddAction (CScriptActionShowChoices())
	_uState2Trans7 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('npc_einar'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NPC_EINAR)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NPC_EINAR)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('npc_einar', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "npc_einar"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_EINAR)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NPC_EINAR)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('npc_einar', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("npc_einar")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T8", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NPC_EINAR)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_001", "Oh no, I’m back to Sergeant again? You would think that after I worked myself up to General in the service of the house of Wulfgar I’d remain General in the afterlife too? But no, Sergeant Einar remains Sergeant Einar, who freed the Leafshade with the help of the Runewarrior. That’s just so frustrating.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P702_EreonEinarTalked', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P702_EreonNotTalked', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans9 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T9", "Dialog")
	_uState2Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 1))
	_uState2Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_002PC", "Tell me about Falkmar.", 99, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_003", " Falkmar? He’s the son of the Lord of Norimar. But I don’t like him. Had never much to do with him in the first place.", 102, 16777215))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans9 = nil

-- TO STATE: choice
_uState2Trans10 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T10", "Dialog")
	_uState2Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 2))
	_uState2Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_004PC", "Tell me about Dr. Mauser.", 99, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_005", "Dr. Mauser? Dr. Mauser? I think I heard Prof. Twiddle mention his name once or twice. Or even more often – you know Twiddle. I figure Twiddle mentioned killing his Nemesis with a special Crossbow?", 104, 16777215))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans10 = nil

-- TO STATE: choice
_uState2Trans11 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T11", "Dialog")
	_uState2Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 3))
	_uState2Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_006PC", "Tell me about Agathos.", 99, 16777215))
	_uState2Trans11:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_007", "Never heard of this Agathos-Character before.", 106, 16777215))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans11 = nil

-- TO STATE: choice
_uState2Trans12 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T12", "Dialog")
	_uState2Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 4))
	_uState2Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_008PC", "Tell me about Urgi.", 99, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_009", "Urgi, the former keeper of the City Ship? What about him?", 108, 16777215))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans12 = nil

-- TO STATE: choice
_uState2Trans13 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T13", "Dialog")
	_uState2Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 5))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_010PC", "I have this message for you. (Hand over the scroll you received in the first trial.) ", 99, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_011", "What is this? A joke? At least Hirin has a sense of honour.", 110, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_012PC", "So it is Utran, not Wulfgar then.", 111, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_013", "You got me.", 112, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mf_P702_HirinSQActive', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mf_P702_HirinSQDone', 1, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState2Trans13 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_einar"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_einar"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_einar', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_EINAR)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState9Trans1 = GdsCreateTransition (_uState2, _uState9, "State_2", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 6))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_EINAR_014PC", "That is all I wanted know.", 99, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("npc_einar", "P702_DLG_EINAR_015", "General Einar bids you farewell.", 114, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_EINAR)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_EINAR)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_EINAR)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_EINAR)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NPC_EINAR)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NPC_EINAR)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_einar"))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_EINAR)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_EINAR)', 1, 4))
	_uState9Trans1 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NPC_EINAR)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_einar"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_EINAR)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_EINAR)', 1, 4))
	_uEndActions1 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NPC_EINAR)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_EINAR)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_einar', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_EINAR)', 0, 4))
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

local _uSM = GdsCreateStateMachine ("npc_einar_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_EINAR)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_EINAR)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_einar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_einar", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_einar', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
