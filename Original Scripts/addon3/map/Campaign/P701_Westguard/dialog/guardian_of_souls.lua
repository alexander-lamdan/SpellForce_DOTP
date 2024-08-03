local _uSM = GdsCreateStateMachine ("guardian_of_souls_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState8 = GdsCreateState (_uSM, "State_8")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('guardian_of_souls'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(GUARDIAN_OF_SOULS)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(GUARDIAN_OF_SOULS)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('guardian_of_souls', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "guardian_of_souls"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GUARDIAN_OF_SOULS)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(GUARDIAN_OF_SOULS)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('guardian_of_souls', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("guardian_of_souls")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GUARDIAN_OF_SOULS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GUARDIAN_OF_SOULS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GUARDIAN_OF_SOULS)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(GUARDIAN_OF_SOULS)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "guardian_of_souls"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('guardian_of_souls', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GUARDIAN_OF_SOULS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GUARDIAN_OF_SOULS)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P701_DLG_GUARDIANOFSOULS_008PC", "Death.", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GUARDIAN_OF_SOULS)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P701_DLG_GUARDIANOFSOULS_010PC", "Peace", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GUARDIAN_OF_SOULS)', 0, 2))
	_uState3Trans3:AddAction (CScriptActionChoice("P701_DLG_GUARDIANOFSOULS_012PC", "Veneration", 3, 16777215))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 2))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 0, 4))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans4:AddAction (CScriptActionShowChoices())
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'WGA3_SUBQ_32', 1))
	_uState3Trans5:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_001", "Eternal peace, stranger. I am the Watcher of Souls and my duty is to watch over the safe rest of the fallen. Why is that you seek this place?", 100, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_GUARDIANOFSOULS_002PC", "Getting rusty my dear ghost? I can see clearly there are wandering dead in the cemetery.", 101, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_003", "Eternal peace, stranger. I am the Watcher of Souls and my duty is to watch over the safe rest of the fallen. Why is that you seek this place?", 102, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_GUARDIANOFSOULS_004PC", "Ok-ok... I got you. I came to help, I am a Shaikan, protector of Westguard.", 103, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_005", "Eternal peace, stranger. I am the Watcher of Souls and my duty is to watch over the safe rest of the fallen. Why is that you seek this place?", 104, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_GUARDIANOFSOULS_006PC", "This conversation is getting a bit one sided, isn't it? I give up, what did you say again?", 105, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_007", "Eternal peace, stranger. I am the Watcher of Souls and my duty is to watch over the safe rest of the fallen. Why is that you seek this place?", 106, 16777215))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState3Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "guardian_of_souls", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "guardian_of_souls"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "guardian_of_souls"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('guardian_of_souls', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GUARDIAN_OF_SOULS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState8Trans1 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "guardian_of_souls", 1))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_GUARDIANOFSOULS_008PC", "Death.", 99, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_009", "Death shall it be then. Yours.", 108, 16777215))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "guardian_of_souls"))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: endconversation
_uState8Trans2 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "guardian_of_souls", 2))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_GUARDIANOFSOULS_010PC", "Peace", 99, 16777215))
	_uState8Trans2:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_011", "Leave in peace then. You hear me no more.", 110, 16777215))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "guardian_of_souls"))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: endconversation
_uState8Trans3 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "guardian_of_souls", 3))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_GUARDIANOFSOULS_012PC", "Veneration", 99, 16777215))
	_uState8Trans3:AddAction (CScriptActionSay("guardian_of_souls", "P701_DLG_GUARDIANOFSOULS_013", "Wise of you. Eternity is what awaits you and your fate should be respected.", 112, 16777215))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GUARDIAN_OF_SOULS)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "guardian_of_souls"))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans3 = nil

-- TO STATE: endconversation
_uState8Trans4 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'WGA3_SUBQ_32', 1) ))
	_uState8Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "guardian_of_souls"))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GUARDIAN_OF_SOULS)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(GUARDIAN_OF_SOULS)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "guardian_of_souls"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_3_DEATH', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('Guardian_Of_Souls', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GUARDIAN_OF_SOULS)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GUARDIAN_OF_SOULS)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(GUARDIAN_OF_SOULS)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "guardian_of_souls"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_3_PEACE', 1, 4))
	_uEndActions2:AddAction (CScriptActionDialogEnable('Guardian_Of_Souls', 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GUARDIAN_OF_SOULS)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GUARDIAN_OF_SOULS)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(GUARDIAN_OF_SOULS)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "guardian_of_souls"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_3_VENERATION', 1, 4))
	_uEndActions3:AddAction (CScriptActionDialogEnable('Guardian_Of_Souls', 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GUARDIAN_OF_SOULS)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GUARDIAN_OF_SOULS)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(GUARDIAN_OF_SOULS)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "guardian_of_souls"))
	_uEndActions4:AddAction (CScriptActionDialogEnable('Guardian_Of_Souls', 0))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(GUARDIAN_OF_SOULS)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GUARDIAN_OF_SOULS)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(GUARDIAN_OF_SOULS)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GUARDIAN_OF_SOULS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('guardian_of_souls', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GUARDIAN_OF_SOULS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState8 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("guardian_of_souls_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GUARDIAN_OF_SOULS)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/DLG_Take_GuardianOfSouls.tak', 'pl_HumanAvatar', 'guardian_of_souls'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GUARDIAN_OF_SOULS)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

