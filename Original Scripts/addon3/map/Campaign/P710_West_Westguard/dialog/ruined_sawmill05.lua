local _uSM = GdsCreateStateMachine ("ruined_sawmill05_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState8 = GdsCreateState (_uSM, "State_8")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(RUINED_SAWMILL05)', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P710_DLG_RUINEDSAWMILL_002PC", "(Look for a cog.)", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(RUINED_SAWMILL05)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(RUINED_SAWMILL05)', 0, 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P710_DLG_RUINEDSAWMILL_005PC", "(Leave.)", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(RUINED_SAWMILL05)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 2))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(RUINED_SAWMILL05)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionShowChoices())
	_uState2Trans3 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('ruined_sawmill05'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(RUINED_SAWMILL05)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(RUINED_SAWMILL05)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('ruined_sawmill05', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("ruined_sawmill05", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "ruined_sawmill05"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(RUINED_SAWMILL05)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(RUINED_SAWMILL05)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('ruined_sawmill05', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("ruined_sawmill05")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(RUINED_SAWMILL05)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(RUINED_SAWMILL05)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T4", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(RUINED_SAWMILL05)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("ruined_sawmill05", "P710_DLG_RUINEDSAWMILL_001", "(The sawmill is a wreck, it hasn't been used in ages. You think it would need tremendous amount of work to fix it.)", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ruined_sawmill05", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ruined_sawmill05"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ruined_sawmill05"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ruined_sawmill05', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(RUINED_SAWMILL05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState3Trans1 = GdsCreateTransition (_uState2, _uState3, "State_2", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "ruined_sawmill05", 1))
	_uState3Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_RUINEDSAWMILL_002PC", "(Look for a cog.)", 99, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(RUINED_SAWMILL05)', 0, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(RUINED_SAWMILL05)', 0, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState3Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ruined_sawmill05", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ruined_sawmill05"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ruined_sawmill05"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ruined_sawmill05', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(RUINED_SAWMILL05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState8Trans1 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Sawmill05_Searched', 0, 2))
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'mv_P710_Ruined_Sawmill_Cog_Location', 5, 2))
	_uState8Trans1:AddAction (CScriptActionSay("ruined_sawmill05", "P710_DLG_RUINEDSAWMILL_003", "(A cog! You just found a piece that should fit in the construction operating the lever.)", 102, 16777215))
	_uState8Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ruined_sawmill05"))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: endconversation
_uState8Trans2 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionValue('', 'mf_P710_Sawmill05_Searched', 0, 2))
	_uState8Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P710_Ruined_Sawmill_Cog_Location', 5, 2) ))
	_uState8Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P710_Sawmill05_Searched', 0, 2), CScriptConditionValue('', 'mv_P710_Ruined_Sawmill_Cog_Location', 5, 2)) ))
	_uState8Trans2:AddAction (CScriptActionSay("ruined_sawmill05", "P710_DLG_RUINEDSAWMILL_004", "(You don't find anything useful.)", 103, 16777215))
	_uState8Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ruined_sawmill05"))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: endconversation
_uState8Trans3 = GdsCreateTransition (_uState3, _uState8, "State_3", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P710_Sawmill05_Searched', 0, 2), CScriptConditionValue('', 'mv_P710_Ruined_Sawmill_Cog_Location', 5, 2)) ))
	_uState8Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P710_Sawmill05_Searched', 0, 2), GdsNegateCondition( CScriptConditionValue('', 'mv_P710_Ruined_Sawmill_Cog_Location', 5, 2) )) ))
	_uState8Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ruined_sawmill05"))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans3 = nil

-- TO STATE: endconversation
_uState8Trans4 = GdsCreateTransition (_uState2, _uState8, "State_2", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "ruined_sawmill05", 2))
	_uState8Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_RUINEDSAWMILL_005PC", "(Leave.)", 99, 16777215))
	_uState8Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ruined_sawmill05"))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(RUINED_SAWMILL05)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(RUINED_SAWMILL05)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(RUINED_SAWMILL05)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(RUINED_SAWMILL05)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "ruined_sawmill05"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P710_Sawmill05_Searched', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P710_Gate_Cog_Retrieved', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(RUINED_SAWMILL05)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(RUINED_SAWMILL05)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(RUINED_SAWMILL05)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "ruined_sawmill05"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P710_Sawmill05_Searched', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(RUINED_SAWMILL05)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(RUINED_SAWMILL05)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(RUINED_SAWMILL05)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "ruined_sawmill05"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(RUINED_SAWMILL05)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(RUINED_SAWMILL05)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(RUINED_SAWMILL05)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "ruined_sawmill05"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(RUINED_SAWMILL05)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(RUINED_SAWMILL05)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(RUINED_SAWMILL05)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(RUINED_SAWMILL05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ruined_sawmill05', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(RUINED_SAWMILL05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
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

local _uSM = GdsCreateStateMachine ("ruined_sawmill05_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(RUINED_SAWMILL05)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/urwounded2_BeginDialog.tak', 'pl_HumanAvatar', 'ruined_sawmill05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(RUINED_SAWMILL05)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

