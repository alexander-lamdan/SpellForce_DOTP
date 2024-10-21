local _uSM = GdsCreateStateMachine ("mindprobemachine_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState9 = GdsCreateState (_uSM, "State_9")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('mindprobemachine'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(MINDPROBEMACHINE)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(MINDPROBEMACHINE)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('mindprobemachine', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("mindprobemachine", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "mindprobemachine"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(MINDPROBEMACHINE)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('mindprobemachine', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("mindprobemachine")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MINDPROBEMACHINE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MINDPROBEMACHINE)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(MINDPROBEMACHINE)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("mindprobemachine", "P707_DLG_MINDPROBEMACHINE_001", "This is the Mind Probe Machine with which Malacay created the memory cards.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mindprobemachine"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mindprobemachine', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_MQ_03_3', 1) ))
	_uState2Trans1:AddAction (CScriptActionSay("mindprobemachine", "P707_DLG_MINDPROBEMACHINE_002", "You don't feel any energy pulsing through it. It seems broken. Maybe you should look for missing pieces.", 101, 16777215))
	_uState2Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_MQ_03_3', 1, 0))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mindprobemachine"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mindprobemachine"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mindprobemachine', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MINDPROBEMACHINE)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 731, 6, 1, 1))
	_uState6Trans1:AddAction (CScriptActionChoice("P707_DLG_MINDPROBEMACHINE_003PC", "Repair the machine with the pieces you found", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MINDPROBEMACHINE)', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P707_DLG_MINDPROBEMACHINE_005PC", "Leave the machine alone.", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 2))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 0, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionShowChoices())
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'SSSR_MQ_03_3', 1) )
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 731, 6, 1, 1))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState6Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mindprobemachine"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mindprobemachine"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mindprobemachine', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState9Trans1 = GdsCreateTransition (_uState2, _uState9, "State_2", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 731, 6, 1, 1) ))
	_uState9Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mindprobemachine"))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MINDPROBEMACHINE)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: endconversation
_uState9Trans2 = GdsCreateTransition (_uState6, _uState9, "State_6", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 1))
	_uState9Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MINDPROBEMACHINE_003PC", "Repair the machine with the pieces you found", 99, 16777215))
	_uState9Trans2:AddAction (CScriptActionSay("mindprobemachine", "P707_DLG_MINDPROBEMACHINE_004", "With a sudden shift in energy the machine springs to life. You now feel the flow of magic run through it.", 103, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MINDPROBEMACHINE)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MINDPROBEMACHINE)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mindprobemachine"))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MINDPROBEMACHINE)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: endconversation
_uState9Trans3 = GdsCreateTransition (_uState6, _uState9, "State_6", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 2))
	_uState9Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MINDPROBEMACHINE_005PC", "Leave the machine alone.", 99, 16777215))
	_uState9Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mindprobemachine"))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MINDPROBEMACHINE)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MINDPROBEMACHINE)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MINDPROBEMACHINE)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MINDPROBEMACHINE)', 1, 4))
	_uState9Trans3 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(MINDPROBEMACHINE)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "mindprobemachine"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MINDPROBEMACHINE)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MINDPROBEMACHINE)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(MINDPROBEMACHINE)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "mindprobemachine"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P707_Sariel_MQ_03_4', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P707_MQ_03_3_Done', 1, 4))
	_uEndActions2:AddAction (CScriptActionDialogEnable('MindProbeMachine', 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MINDPROBEMACHINE)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MINDPROBEMACHINE)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(MINDPROBEMACHINE)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "mindprobemachine"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MINDPROBEMACHINE)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MINDPROBEMACHINE)', 1, 4))
	_uEndActions3 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(MINDPROBEMACHINE)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MINDPROBEMACHINE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mindprobemachine', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState2 = nil
_uState6 = nil
_uState9 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("mindprobemachine_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'mindprobemachine'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MINDPROBEMACHINE)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mindprobemachine'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mindprobemachine'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mindprobemachine', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mindprobemachine', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mindprobemachine'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mindprobemachine", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mindprobemachine', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
