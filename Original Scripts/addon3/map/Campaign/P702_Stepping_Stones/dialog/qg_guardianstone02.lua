local _uSM = GdsCreateStateMachine ("qg_guardianstone02_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState8 = GdsCreateState (_uSM, "State_8")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('qg_guardianstone02'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(QG_GUARDIANSTONE02)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(QG_GUARDIANSTONE02)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('qg_guardianstone02', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "qg_guardianstone02"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE02)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(QG_GUARDIANSTONE02)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone02', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("qg_guardianstone02")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE02)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(QG_GUARDIANSTONE02)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_001", " (There is a name written on the top of the stone: ELEN. Below the name you read... ) ", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P702_GuardianStone02Known', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE02)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE02_004PC", " (Accept) ", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE02)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE02)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P702_DLG_GUARDIANSTONE02_006PC", " (Leave) ", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE02)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'mf_P702_ElenAccepted', 0, 2))
	_uState3Trans4:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_002", " (The hunt begins here, stranger! Hunt or be hunted. But beware - A predator on ice is easy prey in the desert. Adapt or fail!) ", 101, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_003", " (Your trial is completed when you've killed all game. Kill or be killed, that's the law of nature.) ", 102, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState3Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState8Trans1 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone02", 1))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE02_004PC", " (Accept) ", 99, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_005", " (When you finish reading the carved letters dissolve into the stone. The text is gone.) ", 104, 16777215))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE02)', 0, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE02)', 0, 4))
	_uState8Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone02"))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: endconversation
_uState8Trans2 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "qg_guardianstone02", 2))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE02_006PC", " (Leave) ", 99, 16777215))
	_uState8Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone02"))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(QG_GUARDIANSTONE02)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(QG_GUARDIANSTONE02)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: endconversation
_uState8Trans3 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_3', 1))
	_uState8Trans3:AddCondition (CScriptConditionValue('', 'mf_P702_Elen_SQ02_BurialActive', 0, 2))
	_uState8Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_ElenAccepted', 0, 2) ))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE02_007PC", " (Present the emblem of Elen.) ", 106, 16777215))
	_uState8Trans3:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_008", " (A vision of the Goddess appears in your mind. Grave piercing eyes seem to look right through you. The Goddess speaks no word.) ", 107, 16777215))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE02_009PC", " (You show her the Emblem of the Wolf Spirit.) ", 108, 16777215))
	_uState8Trans3:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_010", " (A tear appears in those deep, green eyes. And suddenly an image appears in your head. You see yourself burying the remains of the Great Wolf.) ", 109, 16777215))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_GUARDIANSTONE02_011PC", " (You bow before the Goddess and take your leave without speaking a word.) ", 110, 16777215))
	_uState8Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone02"))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans3 = nil

-- TO STATE: endconversation
_uState8Trans4 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_ElenAccepted', 0, 2) ))
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_3', 1), CScriptConditionValue('', 'mf_P702_Elen_SQ02_BurialActive', 0, 2)) ))
	_uState8Trans4:AddAction (CScriptActionSay("qg_guardianstone02", "P702_DLG_GUARDIANSTONE02_012", " (The stone looks completely smooth. There are no letters carved in its surface anymore.) ", 111, 16777215))
	_uState8Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "qg_guardianstone02"))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(QG_GUARDIANSTONE02)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(QG_GUARDIANSTONE02)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone02"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_ElenAccepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(QG_GUARDIANSTONE02)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE02)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(QG_GUARDIANSTONE02)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone02"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(QG_GUARDIANSTONE02)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE02)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(QG_GUARDIANSTONE02)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone02"))
	_uEndActions3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 761, 1))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_Elen_SQ02_BurialActive', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(QG_GUARDIANSTONE02)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE02)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(QG_GUARDIANSTONE02)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "qg_guardianstone02"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(QG_GUARDIANSTONE02)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE02)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE02)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(QG_GUARDIANSTONE02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('qg_guardianstone02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE02)', 0, 4))
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

local _uSM = GdsCreateStateMachine ("qg_guardianstone02_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE02)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/idol_BeginDialog.tak', 'pl_HumanAvatar', 'qg_guardianstone02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(QG_GUARDIANSTONE02)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

