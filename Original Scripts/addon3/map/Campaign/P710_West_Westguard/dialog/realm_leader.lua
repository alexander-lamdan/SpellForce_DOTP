local _uSM = GdsCreateStateMachine ("realm_leader_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState10 = GdsCreateState (_uSM, "State_10")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('realm_leader'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(REALM_LEADER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(REALM_LEADER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('realm_leader', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("realm_leader", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "realm_leader"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(REALM_LEADER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(REALM_LEADER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('realm_leader', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("realm_leader")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(REALM_LEADER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "realm_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('realm_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(REALM_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState3Trans1 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Realm_Leader_FirstMeet', 0, 2) ))
	_uState3Trans1:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_004", "Shaikan.", 103, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: else
_uState3Trans2 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'mf_P710_Realm_Leader_FirstMeet', 0, 2))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'mf_P710_Realm_Leader_FirstMeet', 1, 4))
	_uState3Trans2:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_001", "Well met, Shaikan.", 100, 16777215))
	_uState3Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_002PC", "What's the status?", 101, 16777215))
	_uState3Trans2:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_003", "We've come from Sevenkeeps with as much as we could spare after we won our decisiv battle against those blue demons. Our position is strong but the position of the enemy too.", 102, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState3Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "realm_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "realm_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "realm_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('realm_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(REALM_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 0, 2))
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Destroy_Nameless01_Quest', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P710_DLG_REALMLEADER_006PC", "Tell me about the first base.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 0, 2))
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'mf_P710_Destroy_Nameless02_Quest', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P710_DLG_REALMLEADER_009PC", "How are chances against the second?", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 0, 2))
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'mf_P710_Destroy_Nameless03_Quest', 0, 2))
	_uState5Trans3:AddAction (CScriptActionChoice("P710_DLG_REALMLEADER_012PC", "What about the third?", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 0, 2))
	_uState5Trans4:AddAction (CScriptActionChoice("P710_DLG_REALMLEADER_015PC", "That's all for now, commander.", 4, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 2))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 0, 4))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(REALM_LEADER)', 1, 4))
	_uState5Trans5:AddAction (CScriptActionShowChoices())
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState3, _uState5, "State_3", "State_5_T6", "Dialog")
	_uState5Trans6:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_005", "The Nameless have established three bases here and are getting stronger and increasing in number by the minute. If this continues I don't know how to hold them off much longer.", 104, 16777215))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans6 = nil

-- TO STATE: choice
_uState5Trans7 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T7", "Dialog")
	_uState5Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "realm_leader", 1))
	_uState5Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_006PC", "Tell me about the first base.", 99, 16777215))
	_uState5Trans7:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_007", "Our first target is a base set up by the Nameless deep in the forest. It seems to be more of an outpost than a stronghold but it holds a lot of enemies.", 106, 16777215))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_008PC", "I understand General. We'll focus on destryoing that base.", 107, 16777215))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'mf_P710_Destroy_Nameless01_Quest', 1, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans7 = nil

-- TO STATE: choice
_uState5Trans8 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T8", "Dialog")
	_uState5Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "realm_leader", 2))
	_uState5Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_009PC", "How are chances against the second?", 99, 16777215))
	_uState5Trans8:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_010", "The second one is the trickiest part. We have to push deep into Nameless territory while they've strong reinforcements.", 109, 16777215))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_011PC", "I'll take the necessary caution, General.", 110, 16777215))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'mf_P710_Destroy_Nameless02_Quest', 1, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans8 = nil

-- TO STATE: choice
_uState5Trans9 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T9", "Dialog")
	_uState5Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "realm_leader", 3))
	_uState5Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_012PC", "What about the third?", 99, 16777215))
	_uState5Trans9:AddAction (CScriptActionSay("realm_leader", "P710_DLG_REALMLEADER_013", "It's been reported that it has stronger defences than the other ones. The scouts saw three large towers around it, but we have no clue about their capabilities. I'm sure bringing that base down would prove decisive.", 112, 16777215))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 0, 4))
	_uState5Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_014PC", "We need to crush the Nameless army before we want to face Zazhut. I'll do it.", 113, 16777215))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'mf_P710_Destroy_Nameless03_Quest', 1, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState5Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "realm_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "realm_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "realm_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('realm_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(REALM_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState10Trans1 = GdsCreateTransition (_uState5, _uState10, "State_5", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "realm_leader", 4))
	_uState10Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_REALMLEADER_015PC", "That's all for now, commander.", 99, 16777215))
	_uState10Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "realm_leader"))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(REALM_LEADER)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(REALM_LEADER)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(REALM_LEADER)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(REALM_LEADER)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(REALM_LEADER)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(REALM_LEADER)', 1, 4))
	_uState10Trans1 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(REALM_LEADER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "realm_leader"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(REALM_LEADER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(REALM_LEADER)', 1, 4))
	_uEndActions1 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(REALM_LEADER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(REALM_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('realm_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(REALM_LEADER)', 0, 4))
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


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("realm_leader_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(REALM_LEADER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/horseman_BeginDialog.tak', 'pl_HumanAvatar', 'realm_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(REALM_LEADER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

