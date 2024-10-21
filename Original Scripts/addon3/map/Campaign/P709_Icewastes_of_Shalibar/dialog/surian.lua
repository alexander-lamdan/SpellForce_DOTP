local _uSM = GdsCreateStateMachine ("surian_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState5 = GdsCreateState (_uSM, "State_5")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('surian'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SURIAN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SURIAN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('surian', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("surian", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "surian"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SURIAN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SURIAN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('surian', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("surian")
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
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SURIAN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SURIAN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "surian"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('surian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SURIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState5Trans1 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_4', 1) ))
	_uState5Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState5Trans1:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_001", "Little one, I have to ask you a favour.", 100, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_002PC", "What can I do for you, Jorbal?", 101, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_003", "The Norcaine have used the bones of a Dragon to protect their ship from the forces of the Elemental sea.", 102, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_004PC", "Terrible, isn't it?", 103, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_005", "Indeed. They have comitted a sacrilege to my kind. If their Necromancers had not fueld those bones with their magic, they would not have protected them.", 104, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_006PC", "Tell me, what I should do!", 105, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_007", "Go to the Dracon, tell him, that you have to take the bones from the ship and make sure he knows why.", 106, 16777215))
	_uState5Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_008PC", "Then bring the bones to me, that I purge them of this deathly magic. Afterwards we take the bones with us to Westguard, where Noradim will decide where to bury them.", 107, 16777215))
	_uState5Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "surian"))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SURIAN)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SURIAN)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: endconversation
_uState5Trans2 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 763, 4, 1, 1))
	_uState5Trans2:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState5Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_4', 1) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_009", "I'm glad you're back.", 108, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_010PC", "And I've got the bones as you asked. How do we purge them?", 109, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_011", "There's only one substance to rid them of this magic. And that is Dragonblood.", 110, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_012PC", "I'll do it immediately.", 111, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_013", "Wait, little one. Your courage is great but you have far too few blood to purge these bones.", 112, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_014", "I have to ask you to take your sword and cut four wounds on my body, so that the bones get soaked in blood.", 113, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_015PC", "But...", 114, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_016", "Yes, it will hurt and yes, I'll beg you to stop. But you must promise me to go through with it.", 115, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_017PC", "I... I promise.", 116, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_018", "Good. Let us begin at once, before I waver in my decision.", 117, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_019PC", "SLASH!", 118, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_020", "Ohhhh!!", 119, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_021PC", "CUT!", 120, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_022", "Ahhhh!", 121, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_023PC", "HACK!", 122, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_024", "STOOOOP!", 123, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_025PC", "[Pauses]", 124, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_026", "Please, little one. You promised.", 125, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_027PC", "Forgive me!", 126, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_028PC", "SLASH!", 127, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_029", "[Moans]", 128, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_JORBAL_030PC", "Jorbal! [Pause] Jorbal! Say something.", 129, 16777215))
	_uState5Trans2:AddAction (CScriptActionSay("surian", "P709_DLG_JORBAL_031", "Thank you, little one. I... will rest now... just a little while. ", 130, 16777215))
	_uState5Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "surian"))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SURIAN)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SURIAN)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: endconversation
_uState5Trans3 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_4', 1) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState5Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 763, 4, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState5Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "surian"))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SURIAN)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SURIAN)', 1, 4))
	_uState5Trans3 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState5, _uState5, "State_5", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SURIAN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "surian"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_4_Accepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('surian', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SURIAN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SURIAN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState5, _uState5, "State_5", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SURIAN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "surian"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_4_Completed', 1, 4))
	_uEndActions2:AddAction (CScriptActionDialogEnable('surian', 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SURIAN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SURIAN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState5, _uState5, "State_5", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SURIAN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "surian"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SURIAN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SURIAN)', 1, 4))
	_uEndActions3 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SURIAN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SURIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('surian', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SURIAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState5 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("surian_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SURIAN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SURIAN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'surian'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "surian", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'surian', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
