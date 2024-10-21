local _uSM = GdsCreateStateMachine ("norcaine_smith_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState12 = GdsCreateState (_uSM, "State_12")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('norcaine_smith'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NORCAINE_SMITH)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NORCAINE_SMITH)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('norcaine_smith', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("norcaine_smith", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "norcaine_smith"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NORCAINE_SMITH)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('norcaine_smith', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("norcaine_smith")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NORCAINE_SMITH)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_smith', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P709_DLG_NORCAINESMITH_015PC", "Not yet, I will keep my eyes open.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 2))
	_uState4Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 636, 1, 1, 1))
	_uState4Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 637, 1, 1, 1))
	_uState4Trans2:AddAction (CScriptActionChoice("P709_DLG_NORCAINESMITH_016PC", "Yes, here they are.", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NORCAINE_SMITH)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_2', 1) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState4Trans4:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_013", "Greetings Shaikan.", 112, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_014", "Do you have all the ingredients?", 113, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState4Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_smith', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState7Trans1 = GdsCreateTransition (_uState1, _uState7, "State_1", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_2', 1) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState7Trans1:AddCondition ( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: else
_uState7Trans2 = GdsCreateTransition (_uState4, _uState7, "State_4", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 2))
	_uState7Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_016PC", "Yes, here they are.", 99, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState7Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_smith', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState9Trans1 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 2))
	_uState9Trans1:AddAction (CScriptActionChoice("P709_DLG_NORCAINESMITH_018PC", "A heavy Crossbow.", 1, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: choice
_uState9Trans2 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 2))
	_uState9Trans2:AddAction (CScriptActionChoice("P709_DLG_NORCAINESMITH_020PC", "A set of doublehanded blades.", 2, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: choice
_uState9Trans3 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 2))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NORCAINE_SMITH)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionShowChoices())
	_uState9Trans3 = nil

-- TO STATE: choice
_uState9Trans4 = GdsCreateTransition (_uState7, _uState9, "State_7", "State_9_T4", "Dialog")
	_uState9Trans4:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_017", "What kind of weapon would you like?", 116, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState9Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_smith', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState12Trans1 = GdsCreateTransition (_uState1, _uState12, "State_1", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_2', 1) ))
	_uState12Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState12Trans1:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_001", "Interesting company.", 100, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_002PC", "Are you the smith of this camp?", 101, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_003", "Kel'al, at your services.", 102, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_004PC", "Dracon Tal'Shalir told me something about an idea of yours.", 103, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_005", "He did? And what do you think?", 104, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_006PC", "A weapon to fight those beasts could come handy. Why didn't you already build one?", 105, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_007", "That's the problem, you see. I need very special ingredients for it, which I can't find here.", 106, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_008PC", "What exactly do you need?", 107, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_009", "I need two bones of those wolves we're fighting here, a stone of eternal fire and a bar of Adamantinum. The rest I have here.", 108, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_010PC", "And what kind of weapon would I get from that?", 109, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_011", "I could either forge you a heavy crossbow, like you've never seen before or a set of doublehanded blades.", 110, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_012PC", "I will keep my eyes open.", 111, 16777215))
	_uState12Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NORCAINE_SMITH)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: endconversation
_uState12Trans2 = GdsCreateTransition (_uState4, _uState12, "State_4", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 1))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_015PC", "Not yet, I will keep my eyes open.", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NORCAINE_SMITH)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: endconversation
_uState12Trans3 = GdsCreateTransition (_uState9, _uState12, "State_9", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 1))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_018PC", "A heavy Crossbow.", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_019", "Here you go, Shaikan. Good hunting!", 118, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NORCAINE_SMITH)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: endconversation
_uState12Trans4 = GdsCreateTransition (_uState9, _uState12, "State_9", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 2))
	_uState12Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINESMITH_020PC", "A set of doublehanded blades.", 99, 16777215))
	_uState12Trans4:AddAction (CScriptActionSay("norcaine_smith", "P709_DLG_NORCAINESMITH_021", "Here you go, Shaikan. Good hunting!", 120, 16777215))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NORCAINE_SMITH)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NORCAINE_SMITH)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_smith"))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NORCAINE_SMITH)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_SMITH)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NORCAINE_SMITH)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_2_Accepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NORCAINE_SMITH)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_SMITH)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NORCAINE_SMITH)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NORCAINE_SMITH)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_SMITH)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NORCAINE_SMITH)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_2_Completed', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_2_HeavyCrossbow', 1, 4))
	_uEndActions3:AddAction (CScriptActionDialogEnable('norcaine_smith', 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NORCAINE_SMITH)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_SMITH)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NORCAINE_SMITH)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_smith"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_2_Completed', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_2_DoubleHandedBlade', 1, 4))
	_uEndActions4:AddAction (CScriptActionDialogEnable('norcaine_smith', 0))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NORCAINE_SMITH)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_SMITH)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NORCAINE_SMITH)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_SMITH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_smith', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState7 = nil
_uState9 = nil
_uState12 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("norcaine_smith_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NORCAINE_SMITH)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'norcaine_smith'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_smith", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'norcaine_smith', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
