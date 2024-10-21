local _uSM = GdsCreateStateMachine ("wargame_spirit_01_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState6 = GdsCreateState (_uSM, "State_6")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(WARGAME_SPIRIT_01)', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P703_DLG_WARGAMESPIRIT01_009PC", "I'll consider it. But please, tell me more.", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(WARGAME_SPIRIT_01)', 0, 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P703_DLG_WARGAMESPIRIT01_014PC", "I'd like to join the group of the Prophet.", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(WARGAME_SPIRIT_01)', 0, 2))
	_uState2Trans3:AddAction (CScriptActionChoice("P703_DLG_WARGAMESPIRIT01_018PC", "I'd like to join the group of the General.", 3, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: choice
_uState2Trans4 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 2))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans4:AddAction (CScriptActionShowChoices())
	_uState2Trans4 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('wargame_spirit_01'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(WARGAME_SPIRIT_01)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(WARGAME_SPIRIT_01)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('wargame_spirit_01', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("wargame_spirit_01", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "wargame_spirit_01"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(WARGAME_SPIRIT_01)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(WARGAME_SPIRIT_01)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('wargame_spirit_01', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("wargame_spirit_01")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(WARGAME_SPIRIT_01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(WARGAME_SPIRIT_01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(WARGAME_SPIRIT_01)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T5", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(WARGAME_SPIRIT_01)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_001", "Identify yourselves!", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_002PC", "Why should I? You attacked us!", 101, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_003", "Aren't you part of the game?", 102, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_004PC", "I'm not sure which game you're referring to.", 103, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_005", "We're playing a game we call Warcraft of the World! It's really fun. Nobody dies, it's just playacting.", 104, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_006", "The Prophet and the General have opened a new round. You can join in, if you want to.", 105, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_007PC", "How do I join?", 106, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_008", "You just tell me, whether you want to be on the Prophets team, which colours themselves blue or on the red team of the General.", 107, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans6 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 1))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_009PC", "I'll consider it. But please, tell me more.", 99, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_010", "The Prophet is an old Spirit. Word has it, that he had some dealings with the Guardians themselves. For sure is, that he had dealings with some Shaikan.", 109, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(WARGAME_SPIRIT_01)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(WARGAME_SPIRIT_01)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(WARGAME_SPIRIT_01)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_011", "The General is even older. I've heard legends about him fighting against Dragons during the time of the Hyborian Empire.", 110, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_012PC", "And one is free to join any of their groups?", 111, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_013", "If you take fun in fighting and teaming up - yes.", 112, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState2Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "wargame_spirit_01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "wargame_spirit_01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('wargame_spirit_01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(WARGAME_SPIRIT_01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState6Trans1 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 2))
	_uState6Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_014PC", "I'd like to join the group of the Prophet.", 99, 16777215))
	_uState6Trans1:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_015", "Here you have a blue ribbon, so that you'd be recognized as one of the Prophets team. ", 114, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(WARGAME_SPIRIT_01)', 0, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(WARGAME_SPIRIT_01)', 0, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(WARGAME_SPIRIT_01)', 0, 4))
	_uState6Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_016PC", "Where do I find the Prophet?", 115, 16777215))
	_uState6Trans1:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_017", "You'll find him to the northeast in the blue headquarter.", 116, 16777215))
	_uState6Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "wargame_spirit_01"))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(WARGAME_SPIRIT_01)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: endconversation
_uState6Trans2 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 3))
	_uState6Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_018PC", "I'd like to join the group of the General.", 99, 16777215))
	_uState6Trans2:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_019", "Here you have a red ribbon, so that you'd be recognized as one of the Generals team. ", 118, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(WARGAME_SPIRIT_01)', 0, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(WARGAME_SPIRIT_01)', 0, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(WARGAME_SPIRIT_01)', 0, 4))
	_uState6Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_WARGAMESPIRIT01_020PC", "Where do I find the General?", 119, 16777215))
	_uState6Trans2:AddAction (CScriptActionSay("wargame_spirit_01", "P703_DLG_WARGAMESPIRIT01_021", "You'll find him to the northwest in the red headquarter", 120, 16777215))
	_uState6Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "wargame_spirit_01"))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(WARGAME_SPIRIT_01)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(WARGAME_SPIRIT_01)', 1, 4))
	_uState6Trans2 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState6, _uState6, "State_6", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(WARGAME_SPIRIT_01)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "wargame_spirit_01"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P703_wargame_spirit_01_completed', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(WARGAME_SPIRIT_01)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(WARGAME_SPIRIT_01)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState6, _uState6, "State_6", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(WARGAME_SPIRIT_01)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "wargame_spirit_01"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P703_wargame_spirit_01_completed', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(WARGAME_SPIRIT_01)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(WARGAME_SPIRIT_01)', 1, 4))
	_uEndActions2 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(WARGAME_SPIRIT_01)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(WARGAME_SPIRIT_01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('wargame_spirit_01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(WARGAME_SPIRIT_01)', 0, 4))
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

local _uSM = GdsCreateStateMachine ("wargame_spirit_01_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(WARGAME_SPIRIT_01)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(WARGAME_SPIRIT_01)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'wargame_spirit_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "wargame_spirit_01", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'wargame_spirit_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
