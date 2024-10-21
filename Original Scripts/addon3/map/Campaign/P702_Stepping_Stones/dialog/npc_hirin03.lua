local _uSM = GdsCreateStateMachine ("npc_hirin03_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState9 = GdsCreateState (_uSM, "State_9")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('npc_hirin03'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NPC_HIRIN03)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NPC_HIRIN03)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('npc_hirin03', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "npc_hirin03"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_HIRIN03)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NPC_HIRIN03)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('npc_hirin03', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("npc_hirin03")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NPC_HIRIN03)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_hirin03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_hirin03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_HIRIN03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 0, 2))
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'mf_P702_Hirin03Delivered', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P702_DLG_HIRIN03_003PC", "It is time.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 0, 2))
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'mf_P702_Hirin01Delivered', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P702_DLG_HIRIN03_005PC", "I'm the messenger.", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 0, 2))
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'mf_P702_Hirin02Delivered', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P702_DLG_HIRIN03_007PC", "Makkebitay quperiajot!", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P702_DLG_HIRIN03_009PC", "I'll speak to you later.", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionShowChoices())
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_Hirin03Known', 0, 2) ))
	_uState4Trans6:AddAction (CScriptActionSay("npc_hirin03", "P702_DLG_HIRIN03_002", "You again? Do you have something for me? If not, don't take my time, please. I need it.", 101, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionValue('', 'mf_P702_Hirin03Known', 0, 2))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'mf_P702_Hirin03Known', 1, 4))
	_uState4Trans7:AddAction (CScriptActionSay("npc_hirin03", "P702_DLG_HIRIN03_001", "Is it noon already? Nah, it doesn't matter, it can arrive anytime. I've to be ready.  One-two... maybe now? Maybe not.", 100, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState4Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_hirin03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_hirin03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_hirin03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_HIRIN03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState9Trans1 = GdsCreateTransition (_uState4, _uState9, "State_4", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 1))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_HIRIN03_003PC", "It is time.", 99, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("npc_hirin03", "P702_DLG_HIRIN03_004", " (deep sigh) This is goodbye.", 103, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_hirin03"))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_HIRIN03)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: endconversation
_uState9Trans2 = GdsCreateTransition (_uState4, _uState9, "State_4", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 2))
	_uState9Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_HIRIN03_005PC", "I'm the messenger.", 99, 16777215))
	_uState9Trans2:AddAction (CScriptActionSay("npc_hirin03", "P702_DLG_HIRIN03_006", "Oh, interesting. I'm waiting for an important message. Do you happen to have it? No, I guess not..", 105, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_hirin03"))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_HIRIN03)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: endconversation
_uState9Trans3 = GdsCreateTransition (_uState4, _uState9, "State_4", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 3))
	_uState9Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_HIRIN03_007PC", "Makkebitay quperiajot!", 99, 16777215))
	_uState9Trans3:AddAction (CScriptActionSay("npc_hirin03", "P702_DLG_HIRIN03_008", "Spare me with your religious ravings , I have my own beliefs. Soon I'll receive the sign!", 107, 16777215))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_hirin03"))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_HIRIN03)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState9Trans3 = nil

-- TO STATE: endconversation
_uState9Trans4 = GdsCreateTransition (_uState4, _uState9, "State_4", "State_9_T4", "Dialog")
	_uState9Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 4))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_HIRIN03_009PC", "I'll speak to you later.", 99, 16777215))
	_uState9Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_hirin03"))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_HIRIN03)', 1, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_HIRIN03)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_HIRIN03)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_HIRIN03)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_HIRIN03)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_HIRIN03)', 1, 4))
	_uState9Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NPC_HIRIN03)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_hirin03"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_Hirin03Delivered', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_HIRIN03)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_HIRIN03)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NPC_HIRIN03)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_hirin03"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P702_HirinWrongA', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_HIRIN03)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_HIRIN03)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NPC_HIRIN03)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_hirin03"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_HirinWrongA', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_HIRIN03)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_HIRIN03)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NPC_HIRIN03)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_hirin03"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_HIRIN03)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_HIRIN03)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NPC_HIRIN03)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_HIRIN03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_hirin03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_HIRIN03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState9 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("npc_hirin03_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_HIRIN03)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'npc_hirin03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_HIRIN03)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_hirin03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_hirin03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_hirin03', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_hirin03', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_hirin03', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_hirin03', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_hirin03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_hirin03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_hirin03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_hirin03", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_hirin03', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
