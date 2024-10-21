local _uSM = GdsCreateStateMachine ("spirit_distraction_01_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState8 = GdsCreateState (_uSM, "State_8")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('spirit_distraction_01'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SPIRIT_DISTRACTION_01)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SPIRIT_DISTRACTION_01)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('spirit_distraction_01', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("spirit_distraction_01", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "spirit_distraction_01"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_DISTRACTION_01)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SPIRIT_DISTRACTION_01)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('spirit_distraction_01', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("spirit_distraction_01")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_DISTRACTION_01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_DISTRACTION_01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_DISTRACTION_01)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SPIRIT_DISTRACTION_01)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_distraction_01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spirit_distraction_01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_DISTRACTION_01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_DISTRACTION_01)', 0, 2))
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'mf_P703_wargame_spirit_01_completed', 1, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P703_DLG_SPIRITDISTRACTION01_015PC", "There's a wargame going on - it's called Warcraft of the World. You might like it.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_DISTRACTION_01)', 0, 2))
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'mf_P703_boat_01_used', 1, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P703_DLG_SPIRITDISTRACTION01_020PC", "There's an Arena in this City with huge monsters lurking around, waiting to be fought. How about that?", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_DISTRACTION_01)', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P703_DLG_SPIRITDISTRACTION01_022PC", "I'll see what I can find to liven things up for you, Vlad.", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 2))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionShowChoices())
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P703_MQ3_Completed', 0, 2) ))
	_uState4Trans5:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_010", "Ah! Shaikan! Good to see you again.", 109, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_011PC", "Vlad! What's up?", 110, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_012", "I think after I helped you out two times - now you owe me.", 111, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_013PC", "I'm honourbound to help you out, whenever you need me to.", 112, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_014", "So now it's time to honour this bond and help me and my men, cause we are bored. If we weren't dead already we'd be bored to death.", 113, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState4Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_distraction_01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_distraction_01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spirit_distraction_01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_DISTRACTION_01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState8Trans1 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'mf_P703_MQ3_Completed', 0, 2))
	_uState8Trans1:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_001", "Shaikan! That was a fight!", 100, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_002PC", "Yes, Vlad. What a fight! How do you like the afterlife?", 101, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_003", "It's boring. Nothing happening around here. Most are just walking around and admiring the City. Bah! I'm longing for some action!", 102, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_004PC", "I just got an idea, Vlad. Would you and your men help me a second time?", 103, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_005", "Then you owe me, Shaikan. ", 104, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_006PC", "Yes I owe you, Vlad. Here's my idea. There's an Overseer at the gate. I want him gone.", 105, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_007", "We fight him?", 106, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_008PC", "No, that would be unwise - he's very powerful. But you could destroy a wall nearby and so lure him away.", 107, 16777215))
	_uState8Trans1:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_009", "Destroying sounds good! Let's go, Barbarians!", 108, 16777215))
	_uState8Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_distraction_01"))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: endconversation
_uState8Trans2 = GdsCreateTransition (_uState4, _uState8, "State_4", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 1))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_015PC", "There's a wargame going on - it's called Warcraft of the World. You might like it.", 99, 16777215))
	_uState8Trans2:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_016", "Wargame, huh? Are they any good?", 115, 16777215))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_017PC", "I fought against them, they were alright. Some were actually quite strong.", 116, 16777215))
	_uState8Trans2:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_018", "Good, good. That sounds just right. Where can I find this place?", 117, 16777215))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_019PC", "Just follow the sound of fighting, you can't overhear them.", 118, 16777215))
	_uState8Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_distraction_01"))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: endconversation
_uState8Trans3 = GdsCreateTransition (_uState4, _uState8, "State_4", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 2))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_020PC", "There's an Arena in this City with huge monsters lurking around, waiting to be fought. How about that?", 99, 16777215))
	_uState8Trans3:AddAction (CScriptActionSay("spirit_distraction_01", "P703_DLG_SPIRITDISTRACTION01_021", "Nah! Not Arena. Those monsters are puny little dogs. I want a real fight!", 120, 16777215))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_distraction_01"))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans3 = nil

-- TO STATE: endconversation
_uState8Trans4 = GdsCreateTransition (_uState4, _uState8, "State_4", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 3))
	_uState8Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_SPIRITDISTRACTION01_022PC", "I'll see what I can find to liven things up for you, Vlad.", 99, 16777215))
	_uState8Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "spirit_distraction_01"))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SPIRIT_DISTRACTION_01)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SPIRIT_DISTRACTION_01)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SPIRIT_DISTRACTION_01)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_distraction_01"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P703_distraction_started', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SPIRIT_DISTRACTION_01)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_DISTRACTION_01)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SPIRIT_DISTRACTION_01)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_distraction_01"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P703_SQ1_Completed', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SPIRIT_DISTRACTION_01)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_DISTRACTION_01)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SPIRIT_DISTRACTION_01)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_distraction_01"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P703_SQ1_Accepted', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SPIRIT_DISTRACTION_01)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_DISTRACTION_01)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState8, _uState8, "State_8", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SPIRIT_DISTRACTION_01)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "spirit_distraction_01"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P703_SQ1_Accepted', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SPIRIT_DISTRACTION_01)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_DISTRACTION_01)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SPIRIT_DISTRACTION_01)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SPIRIT_DISTRACTION_01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('spirit_distraction_01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SPIRIT_DISTRACTION_01)', 0, 4))
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

local _uSM = GdsCreateStateMachine ("spirit_distraction_01_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SPIRIT_DISTRACTION_01)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SPIRIT_DISTRACTION_01)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'spirit_distraction_01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "spirit_distraction_01", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'spirit_distraction_01', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
