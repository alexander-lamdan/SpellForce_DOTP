local _uSM = GdsCreateStateMachine ("npc_elventree_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState8 = GdsCreateState (_uSM, "State_8")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('npc_elventree'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NPC_ELVENTREE)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NPC_ELVENTREE)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('npc_elventree', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "npc_elventree"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_ELVENTREE)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NPC_ELVENTREE)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('npc_elventree', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("npc_elventree")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_ELVENTREE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_ELVENTREE)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NPC_ELVENTREE)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_elventree"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_elventree', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_ELVENTREE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_ELVENTREE)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P702_DLG_ELVENTREE_004PC", "Here, I have some elixir for you.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_ELVENTREE)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_ELVENTREE)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P702_DLG_ELVENTREE_005PC", "Not this time, but I'll return soon.", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_ELVENTREE)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_ELVENTREE)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'SS_SHANNA', 1))
	_uState4Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 638, 1, 1, 1))
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'SS_SHANNA', 1), GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 638, 1, 1, 1) )) ))
	_uState4Trans4:AddAction (CScriptActionSay("npc_elventree", "P702_DLG_ELVENTREE_003", " (The Great Old Tree seems to bend her branches towards your direction as you approach.) ", 102, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState4Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_elventree", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_elventree"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_elventree"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_elventree', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_ELVENTREE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState8Trans1 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'SS_SHANNA', 1))
	_uState8Trans1:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 638, 1, 1, 1) ))
	_uState8Trans1:AddAction (CScriptActionSay("npc_elventree", "P702_DLG_ELVENTREE_001", " (The Great Old Tree is in a bad shape.) ", 100, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_ELVENTREE_002PC", "I need to get some elixir!", 101, 16777215))
	_uState8Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_elventree"))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_ELVENTREE)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: endconversation
_uState8Trans2 = GdsCreateTransition (_uState4, _uState8, "State_4", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_elventree", 1))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_ELVENTREE_004PC", "Here, I have some elixir for you.", 99, 16777215))
	_uState8Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_elventree"))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_ELVENTREE)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_ELVENTREE)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_ELVENTREE)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: endconversation
_uState8Trans3 = GdsCreateTransition (_uState4, _uState8, "State_4", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_elventree", 2))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_ELVENTREE_005PC", "Not this time, but I'll return soon.", 99, 16777215))
	_uState8Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_elventree"))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_ELVENTREE)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_ELVENTREE)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_ELVENTREE)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState8Trans3 = nil

-- TO STATE: endconversation
_uState8Trans4 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'SS_SHANNA', 1), GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 638, 1, 1, 1) )) ))
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'SS_SHANNA', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 638, 1, 1, 1)) ))
	_uState8Trans4:AddAction (CScriptActionSay("npc_elventree", "P702_DLG_ELVENTREE_006", " (The Great Old Tree shines as she was smiling on you.) ", 105, 16777215))
	_uState8Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_elventree"))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_ELVENTREE)', 1, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_ELVENTREE)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NPC_ELVENTREE)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_elventree"))
	_uEndActions1:AddAction (CScriptActionFigureLookAt('npc_ElvenTree', 4.7123889803847))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_ELVENTREE)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_ELVENTREE)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NPC_ELVENTREE)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_elventree"))
	_uEndActions2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 638, 1))
	_uEndActions2:AddAction (CScriptActionHealthModify('npc_ElvenTree', 1, 10, 0))
	_uEndActions2:AddAction (CScriptActionFigureLookAt('npc_ElvenTree', 4.7123889803847))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_ELVENTREE)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_ELVENTREE)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NPC_ELVENTREE)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_elventree"))
	_uEndActions3:AddAction (CScriptActionFigureLookAt('npc_ElvenTree', 4.7123889803847))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_ELVENTREE)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_ELVENTREE)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NPC_ELVENTREE)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_elventree"))
	_uEndActions4:AddAction (CScriptActionFigureLookAt('npc_ElvenTree', 4.7123889803847))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_ELVENTREE)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_ELVENTREE)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NPC_ELVENTREE)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_ELVENTREE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_elventree', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_ELVENTREE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState8 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("npc_elventree_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_ELVENTREE)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/urwounded2_BeginDialog.tak', 'pl_HumanAvatar', 'npc_elventree'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_ELVENTREE)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

