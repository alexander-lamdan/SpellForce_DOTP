local _uSM = GdsCreateStateMachine ("shaman_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState10 = GdsCreateState (_uSM, "State_10")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('shaman'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SHAMAN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SHAMAN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('shaman', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("shaman", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "shaman"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAMAN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SHAMAN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('shaman', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("shaman")
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
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SHAMAN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mv_P706_State_Shaman', 0, 2))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaman", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState6Trans1 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'mv_P706_State_Shaman', 2, 2))
	_uState6Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Shaman', 0, 2) ))
	_uState6Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Shaman', 1, 2) ))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState6Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaman", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState10Trans1 = GdsCreateTransition (_uState2, _uState10, "State_2", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 705, 1, 1, 1))
	_uState10Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 706, 1, 1, 1))
	_uState10Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 707, 1, 1, 1))
	_uState10Trans1:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_001", "So you found them... now give them to me...", 100, 16777215))
	_uState10Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAMAN_002PC", "Here you are...", 101, 16777215))
	_uState10Trans1:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_003", "I can now make a magical mask that will help you in your fight. It will be ready next time we talk.", 102, 16777215))
	_uState10Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAMAN_004PC", "OK then...", 103, 16777215))
	_uState10Trans1:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_005", "Farewell.", 104, 16777215))
	_uState10Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 705, 1))
	_uState10Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 706, 1))
	_uState10Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 707, 1))
	_uState10Trans1:AddAction (CScriptActionTimeStampSet('mt_P706_MQ02_MASKPARTS_Solved'))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'mv_P706_State_Shaman', 1, 4))
	_uState10Trans1:AddAction (CScriptActionDialogEnable("shaman", 0))
	_uState10Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHAMAN)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: endconversation
_uState10Trans2 = GdsCreateTransition (_uState2, _uState10, "State_2", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 705, 1, 1, 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 706, 1, 1, 1), CScriptConditionPlayerHasItem('pl_Human', 3, 707, 1, 1, 1))) ))
	_uState10Trans2:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_006", "Go... go... go... find those ingredients! The more you delay, more of our men will fall a prey to him!", 105, 16777215))
	_uState10Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAMAN_007PC", "I'm on it...", 106, 16777215))
	_uState10Trans2:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_008", "Farewell.", 107, 16777215))
	_uState10Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SHAMAN)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: endconversation
_uState10Trans3 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'mv_P706_State_Shaman', 1, 2))
	_uState10Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Shaman', 0, 2) ))
	_uState10Trans3:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_009", "Here! Take this mask! Go to the Statue of Grogo and put it on there. This is the only way to summon The Beast there. And this is the only place he can be killed.", 108, 16777215))
	_uState10Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P706_DLG_SHAMAN_010PC", "Thank you", 109, 16777215))
	_uState10Trans3:AddAction (CScriptActionPlayerGiveItem('pl_Human', 1, 3001, 1))
	_uState10Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'MQ03_THEBEAST', 1, 0))
	_uState10Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'MQ031_SUMMON', 1, 0))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'mv_P706_State_Shaman', 2, 4))
	_uState10Trans3:AddAction (CScriptActionDialogEnable("shaman", 0))
	_uState10Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SHAMAN)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState10Trans3 = nil

-- TO STATE: endconversation
_uState10Trans4 = GdsCreateTransition (_uState6, _uState10, "State_6", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'MQ032_KILL', 2))
	_uState10Trans4:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_011", "May Zarach help you!", 110, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_012", "Well done! I see that you are who you claim yourself to be. I am convinced now. Actually... I immediately saw that...", 111, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_013", "Farewell.", 112, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'mf_P706_MQ033_HANDIN_Solved', 1, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'mv_P706_State_Shaman', 3, 4))
	_uState10Trans4:AddAction (CScriptActionDialogEnable("shaman", 0))
	_uState10Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SHAMAN)', 1, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState10Trans4 = nil

-- TO STATE: endconversation
_uState10Trans5 = GdsCreateTransition (_uState6, _uState10, "State_6", "State_10_T5", "Dialog")
	_uState10Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'MQ032_KILL', 2) ))
	_uState10Trans5:AddAction (CScriptActionSay("shaman", "P706_DLG_SHAMAN_014", "May Zarach help you!", 113, 16777215))
	_uState10Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SHAMAN)', 1, 4))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState10Trans5 = nil

-- TO STATE: endconversation
_uState10Trans6 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T6", "Dialog")
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Shaman', 0, 2) ))
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Shaman', 1, 2) ))
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_P706_State_Shaman', 2, 2) ))
	_uState10Trans6:AddAction (CScriptActionValueModify('', 'mf_P706_DialogError_Shaman', 1, 4))
	_uState10Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaman"))
	_uState10Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SHAMAN)', 1, 4))
	_uState10Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAMAN)', 1, 4))
	_uState10Trans6 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SHAMAN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHAMAN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SHAMAN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SHAMAN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SHAMAN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SHAMAN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SHAMAN)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SHAMAN)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(SHAMAN)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SHAMAN)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(SHAMAN)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaman"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SHAMAN)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 4))
	_uEndActions6 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SHAMAN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAMAN)', 0, 4))
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
_uState10 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("shaman_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHAMAN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/horseman_BeginDialog.tak', 'pl_HumanAvatar', 'shaman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHAMAN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

