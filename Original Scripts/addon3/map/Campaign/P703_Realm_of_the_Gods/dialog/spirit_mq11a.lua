local _uSM = GdsCreateStateMachine ("spirit_mq11a_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState6 = GdsCreateState (_uSM, "State_6")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_MQ11A)', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P703_DLG_SPIRITMQ11A_006PC", "What happened after you died?", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_MQ11A)', 0, 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P703_DLG_SPIRITMQ11A_010PC", "Tell us what happened here!", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_MQ11A)', 0, 2))
	_uState2Trans3:AddAction (CScriptActionChoice("P703_DLG_SPIRITMQ11A_015PC", "I see you've already rallied some troops here. Can you help us fight back those spirits?", 3, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: choice
_uState2Trans4 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 2))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans4:AddAction (CScriptActionShowChoices())
	_uState2Trans4 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('spirit_mq11a'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SPIRIT_MQ11A)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SPIRIT_MQ11A)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('spirit_mq11a', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("spirit_mq11a", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "spirit_mq11a"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_MQ11A)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SPIRIT_MQ11A)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('spirit_mq11a', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("spirit_mq11a")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_MQ11A)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_MQ11A)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_MQ11A)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T5", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SPIRIT_MQ11A)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_001", "So we meet again. I told you so.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_002PC", "Halicos! It's so good to see you.", 101, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_003", "You seem surprised to see me. After all, this is the Afterlife.", 102, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_004PC", "Yeah, you're a little less solid than when I last saw you.", 103, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_005", "But more alive than then.", 104, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans6 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 1))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_006PC", "What happened after you died?", 99, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_007", "I'd rather not talk about it, Shaikan. It's very personal.", 106, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_008PC", "I understand, my friend. Maybe some other time.", 107, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_009", "Maybe.", 108, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: choice
_uState2Trans7 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 2))
	_uState2Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_010PC", "Tell us what happened here!", 99, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_011", "When I arrived here, the spirits were all in uproar as the gates had been closed and noone was let in. There were some very influential people about but none of them could get access.", 110, 16777215))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_MQ11A)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_012", "That was, when the first projectile hit the outer walls of the City with a gigantic boom. The walls would hold of course, their magic is extremely strong. But I guess it's not just stones, those Spirits are shooting with either.", 111, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_013PC", "What did you do?", 112, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_014", "What I do best, Shaikan. Rally some troops and fight the enemy even against all odds.", 113, 16777215))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uState2Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_mq11a"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_mq11a"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spirit_mq11a', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_MQ11A)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState6Trans1 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 3))
	_uState6Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_015PC", "I see you've already rallied some troops here. Can you help us fight back those spirits?", 99, 16777215))
	_uState6Trans1:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_016", "I was hoping you would say so. I'd be honoured to be led to battle by you.", 115, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_MQ11A)', 0, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_MQ11A)', 0, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_MQ11A)', 0, 4))
	_uState6Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITMQ11A_017PC", "Is there any piece of intelligence that might help us?", 116, 16777215))
	_uState6Trans1:AddAction (CScriptActionSay("spirit_mq11a", "P703_DLG_SPIRITMQ11A_018", "When a Spirit dies, good or evil alike, their Souls simply vanish. So take good care with us, as we've got more to loose than just our lives.", 117, 16777215))
	_uState6Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_mq11a"))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SPIRIT_MQ11A)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_MQ11A)', 1, 4))
	_uState6Trans1 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState6, _uState6, "State_6", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SPIRIT_MQ11A)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_mq11a"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P703_MQ1_1_Joined', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('spirit_MQ11a', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SPIRIT_MQ11A)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_MQ11A)', 1, 4))
	_uEndActions1 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SPIRIT_MQ11A)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_MQ11A)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spirit_mq11a', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_MQ11A)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState6 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("spirit_mq11a_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SPIRIT_MQ11A)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SPIRIT_MQ11A)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_mq11a'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_mq11a", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_mq11a', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
