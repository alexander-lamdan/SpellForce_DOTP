local _uSM = GdsCreateStateMachine ("parrot_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState7 = GdsCreateState (_uSM, "State_7")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('parrot'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(PARROT)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(PARROT)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('parrot', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("parrot", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "parrot"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PARROT)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(PARROT)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('parrot', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("parrot")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PARROT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PARROT)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(PARROT)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "parrot"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('parrot', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PARROT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PARROT)', 0, 2))
	_uState3Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 753, 1, 1, 1))
	_uState3Trans1:AddAction (CScriptActionChoice("P709_DLG_PARROT_003PC", "Give fish to the penguin.", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PARROT)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PARROT)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P709_DLG_PARROT_004PC", "Kill the penguin. Captain Helbeard won't notice the difference.", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PARROT)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PARROT)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState3Trans4:AddAction (CScriptActionSay("parrot", "P709_DLG_PARROT_001", "A big fat penguin. It still looks hungry.", 100, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_PARROT_002PC", "Looks a bit like a fat parrot to me.", 101, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uState3Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "parrot"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "parrot"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('parrot', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PARROT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState7Trans1 = GdsCreateTransition (_uState3, _uState7, "State_3", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 1))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_PARROT_003PC", "Give fish to the penguin.", 99, 16777215))
	_uState7Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "parrot"))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PARROT)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PARROT)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PARROT)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: endconversation
_uState7Trans2 = GdsCreateTransition (_uState3, _uState7, "State_3", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 2))
	_uState7Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_PARROT_004PC", "Kill the penguin. Captain Helbeard won't notice the difference.", 99, 16777215))
	_uState7Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "parrot"))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PARROT)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PARROT)', 0, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PARROT)', 0, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: endconversation
_uState7Trans3 = GdsCreateTransition (_uState1, _uState7, "State_1", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition ( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )
	_uState7Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "parrot"))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PARROT)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PARROT)', 1, 4))
	_uState7Trans3 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState7, _uState7, "State_7", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(PARROT)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "parrot"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_7_ReportBackFish', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('parrot', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PARROT)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PARROT)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState7, _uState7, "State_7", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(PARROT)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "parrot"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_7_ReportBack', 1, 4))
	_uEndActions2:AddAction (CScriptActionDialogEnable('parrot', 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PARROT)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PARROT)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState7, _uState7, "State_7", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(PARROT)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "parrot"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PARROT)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PARROT)', 1, 4))
	_uEndActions3 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(PARROT)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PARROT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('parrot', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PARROT)', 0, 4))
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


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("parrot_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PARROT)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'parrot'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PARROT)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'parrot'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'parrot', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'parrot', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'parrot', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "parrot", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'parrot', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
