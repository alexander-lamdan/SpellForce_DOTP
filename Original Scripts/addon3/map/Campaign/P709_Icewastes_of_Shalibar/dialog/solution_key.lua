local _uSM = GdsCreateStateMachine ("solution_key_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState11 = GdsCreateState (_uSM, "State_11")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('solution_key'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SOLUTION_KEY)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SOLUTION_KEY)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('solution_key', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("solution_key", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "solution_key"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SOLUTION_KEY)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SOLUTION_KEY)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('solution_key', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("solution_key")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SOLUTION_KEY)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "solution_key"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('solution_key', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SOLUTION_KEY)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P709_DLG_SOLUTIONKEY_003PC", "Shoot the stone with an Arrow", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P709_DLG_SOLUTIONKEY_005PC", "Hack on the stone with your Sword", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P709_DLG_SOLUTIONKEY_007PC", "Work the Pain-spell on the stone", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P709_DLG_SOLUTIONKEY_010PC", "Work the Greater-Healing-spell on the stone", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 2))
	_uState4Trans5:AddAction (CScriptActionChoice("P709_DLG_SOLUTIONKEY_013PC", "Turn away, stating that you don't know the solution to the puzzle", 5, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 2))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans6:AddAction (CScriptActionShowChoices())
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState4Trans7:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_001", "A dark rock with some sort of runes inscribed to it. You can decipher 'sltn'.", 100, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_002", "You sense some magic around it. Will you:", 101, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans7 = nil

-- TO STATE: choice
_uState4Trans8 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T8", "Dialog")
	_uState4Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "solution_key", 1))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_SOLUTIONKEY_003PC", "Shoot the stone with an Arrow", 99, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_004", "The grinning face of a Trickster appears on the surface of the stone, along with the inscription: 'Brute force will not crack me'", 103, 16777215))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans8 = nil

-- TO STATE: choice
_uState4Trans9 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T9", "Dialog")
	_uState4Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "solution_key", 2))
	_uState4Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_SOLUTIONKEY_005PC", "Hack on the stone with your Sword", 99, 16777215))
	_uState4Trans9:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_006", "The grinning face of a Trickster appears on the surface of the stone, along with the inscription: 'Brute force will not crack me'", 105, 16777215))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans9 = nil

-- TO STATE: choice
_uState4Trans10 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T10", "Dialog")
	_uState4Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "solution_key", 3))
	_uState4Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_SOLUTIONKEY_007PC", "Work the Pain-spell on the stone", 99, 16777215))
	_uState4Trans10:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_008", "The face of a Trickster appears on the surface and he's sticking his tongue out at you.", 107, 16777215))
	_uState4Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 4))
	_uState4Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 4))
	_uState4Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 4))
	_uState4Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 4))
	_uState4Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 4))
	_uState4Trans10:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_009", "Then an inscription appears: 'Subtle magic will not soften me'.", 108, 16777215))
	_uState4Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans10 = nil

-- TO STATE: choice
_uState4Trans11 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T11", "Dialog")
	_uState4Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "solution_key", 4))
	_uState4Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_SOLUTIONKEY_010PC", "Work the Greater-Healing-spell on the stone", 99, 16777215))
	_uState4Trans11:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_011", "The face of a Trickster appears on the surface and he's sticking his tongue out at you.", 110, 16777215))
	_uState4Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 4))
	_uState4Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 4))
	_uState4Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 4))
	_uState4Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 4))
	_uState4Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 4))
	_uState4Trans11:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_012", "Then an inscription appears: 'Subtle magic will not soften me'.", 111, 16777215))
	_uState4Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState4Trans11 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "solution_key", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "solution_key"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "solution_key"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('solution_key', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SOLUTION_KEY)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState11Trans1 = GdsCreateTransition (_uState4, _uState11, "State_4", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "solution_key", 5))
	_uState11Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_SOLUTIONKEY_013PC", "Turn away, stating that you don't know the solution to the puzzle", 99, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_014", "The figure of a dancing Trickster appears on the surface when all of a sudden everything vanishes and a new inscription appears:", 113, 16777215))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SOLUTION_KEY)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SOLUTION_KEY)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SOLUTION_KEY)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SOLUTION_KEY)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SOLUTION_KEY)', 0, 4))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_015", "A frozen Compass will not always face north, will it?", 114, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_016", "Let me tell you a story... The story of High Noon in Eo!", 115, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_017", "General Icicle from the Western Sea and Lord Firefly from the Southern Desert were having a meeting.", 116, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_018", "They were hating each other severely, like the North hates the East.", 117, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_019", "Lord Firefly was planning on killing the General with all the heat of his heart.", 118, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_020", "But the General was coming prepared with the icy coldness of his opposing realm.", 119, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_021", "From the desert streamed the searing heat towards the sea.", 120, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_022", "And the General wielded the icy gales towards the Desert.", 121, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("solution_key", "P709_DLG_SOLUTIONKEY_023", "Nothing remained of the two, but the calm, smooth surface of the Sea.", 122, 16777215))
	_uState11Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "solution_key"))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SOLUTION_KEY)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: endconversation
_uState11Trans2 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition ( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )
	_uState11Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "solution_key"))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SOLUTION_KEY)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SOLUTION_KEY)', 1, 4))
	_uState11Trans2 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SOLUTION_KEY)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "solution_key"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_SolutionKey', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SOLUTION_KEY)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SOLUTION_KEY)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SOLUTION_KEY)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "solution_key"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SOLUTION_KEY)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SOLUTION_KEY)', 1, 4))
	_uEndActions2 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SOLUTION_KEY)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SOLUTION_KEY)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('solution_key', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SOLUTION_KEY)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState11 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("solution_key_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SOLUTION_KEY)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/urwounded2_BeginDialog.tak', 'pl_HumanAvatar', 'solution_key'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SOLUTION_KEY)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

