local _uSM = GdsCreateStateMachine ("lieutenant_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState20 = GdsCreateState (_uSM, "State_20")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState26 = GdsCreateState (_uSM, "State_26")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState32 = GdsCreateState (_uSM, "State_32")
_uState33 = GdsCreateState (_uSM, "State_33")
_uState38 = GdsCreateState (_uSM, "State_38")
_uState39 = GdsCreateState (_uSM, "State_39")
_uState44 = GdsCreateState (_uSM, "State_44")
_uState45 = GdsCreateState (_uSM, "State_45")
_uState50 = GdsCreateState (_uSM, "State_50")
_uState51 = GdsCreateState (_uSM, "State_51")
_uState57 = GdsCreateState (_uSM, "State_57")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('lieutenant'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(LIEUTENANT)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(LIEUTENANT)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('lieutenant', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "lieutenant"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(LIEUTENANT)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('lieutenant', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("lieutenant")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(LIEUTENANT)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_028PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_029PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2))
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_012PC", "All enemies around are taken care of, Lieutenant.", 111, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_013", "Excellent! This place is going to be a strongpoint again. I've already made arrangements to reorganize the defences.", 112, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_014", "Several guards have survived the attacks in the city. These men saw you fighting and all of them think very high of you. Actually they all want to be part of your operations. ", 113, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_015", "However this is far from over. The undead harrass the peace of our fallen ones. They raid the cemetery.", 114, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_016PC", "Outrage! I'm heading there right away.", 115, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_017", "With all due respect, elder. Not even your might is enough to protect the souls.", 116, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_018PC", "I see. We need to contact the Watcher.", 117, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_019", "Indeed, venerable elder. The Watcher of Souls. But we haven't heard of him for a long time.", 118, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_020PC", "Maybe old Timon knows...", 119, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_021", "That lousy bastard? All he is good at is drinking. Or was that a joke?", 120, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_022PC", "He might be a barfly, Khai Quintar, but believe me, he's got a keen eye and nothing eludes him.", 121, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_023", "I've always wondered why he is still the Keeper of the Lighthouse.", 122, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_024PC", "Nothing is without a reason, Lieutenant.", 123, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_025", "I hope you are right, elder and that the Lighthouse is intact. Timon should be there. I saw him fleeing when the undead cracked the first tavern's door open.", 124, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_026PC", "Tell me, lieutenant, is there anything worth paying attention to?", 125, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_027", "A group of enemy scouts has been sighted at the village to the north. We'd better cut their intelligence activites short.", 126, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState4Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState5Trans1 = GdsCreateTransition (_uState4, _uState5, "State_4", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState5Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_028PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_Lighthouse_CS03_End', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_1_Completed', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'mf_SQ2_Available', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState5Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState9Trans1 = GdsCreateTransition (_uState1, _uState9, "State_1", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2))
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_030PC", "What's our status, Khai Quintar?", 129, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_031", "Shaikan, there are people still outside the walls. Most of them got stuck in the southern village.", 130, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_032PC", "I have quite some skills at my disposal, Lieutenant, but I doubt I'll manage without reinforcements.", 131, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_033", "I could give you full control over our outpost beyond the river.", 132, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_034", "That's a start, Lieutenant.", 133, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState9Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState14Trans1 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState14Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_037PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState14Trans1 = nil

-- TO STATE: choice
_uState14Trans2 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T2", "Dialog")
	_uState14Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState14Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_038PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState14Trans2 = nil

-- TO STATE: choice
_uState14Trans3 = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14_T3", "Dialog")
	_uState14Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState14Trans3:AddAction (CScriptActionShowChoices())
	_uState14Trans3 = nil

-- TO STATE: choice
_uState14Trans4 = GdsCreateTransition (_uState1, _uState14, "State_1", "State_14_T4", "Dialog")
	_uState14Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ2_Available', 1, 2))
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState14Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_035PC", "Tell me, lieutenant, is there anything worth paying attention to?", 134, 16777215))
	_uState14Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_036", "A group of enemy scouts has been sighted at the village to the north. We'd better cut their intelligence activites short.", 135, 16777215))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState14Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState15Trans1 = GdsCreateTransition (_uState14, _uState15, "State_14", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState15Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_037PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState15Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState20Trans1 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T1", "Dialog")
	_uState20Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState20Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_042PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState20Trans1 = nil

-- TO STATE: choice
_uState20Trans2 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T2", "Dialog")
	_uState20Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState20Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_043PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState20Trans2 = nil

-- TO STATE: choice
_uState20Trans3 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T3", "Dialog")
	_uState20Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState20Trans3:AddAction (CScriptActionShowChoices())
	_uState20Trans3 = nil

-- TO STATE: choice
_uState20Trans4 = GdsCreateTransition (_uState1, _uState20, "State_1", "State_20_T4", "Dialog")
	_uState20Trans4:AddCondition (CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState20Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState20Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_039PC", "Lieutenant, I've dealt with the nothern scouts.", 138, 16777215))
	_uState20Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_040", "Great work!", 139, 16777215))
	_uState20Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_041", "Another scout group showed up. This time around the southern village. Can you take care of them?", 140, 16777215))
	_uState20Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState20Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState20, _uBeginState, "State_20", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState21Trans1 = GdsCreateTransition (_uState20, _uState21, "State_20", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_042PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_2_Finished', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_2_Completed', 1, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 1, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState21Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState26Trans1 = GdsCreateTransition (_uState26, _uState26, "State_26", "State_26_T1", "Dialog")
	_uState26Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState26Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_046PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState26Trans1 = nil

-- TO STATE: choice
_uState26Trans2 = GdsCreateTransition (_uState26, _uState26, "State_26", "State_26_T2", "Dialog")
	_uState26Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState26Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_047PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState26Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState26Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState26Trans2 = nil

-- TO STATE: choice
_uState26Trans3 = GdsCreateTransition (_uState26, _uState26, "State_26", "State_26_T3", "Dialog")
	_uState26Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState26Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState26Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState26Trans3:AddAction (CScriptActionShowChoices())
	_uState26Trans3 = nil

-- TO STATE: choice
_uState26Trans4 = GdsCreateTransition (_uState1, _uState26, "State_1", "State_26_T4", "Dialog")
	_uState26Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ3_Available', 1, 2))
	_uState26Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState26Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState26Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState26Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState26Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState26Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_044PC", "Tell me, lieutenant, is there anything worth paying attention to?", 143, 16777215))
	_uState26Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_045", "Another scout group showed up. This time around the southern village. Can you take care of them?.", 144, 16777215))
	_uState26Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState26Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState26, _uState26, "State_26", "State_26", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState26, _uBeginState, "State_26", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState27Trans1 = GdsCreateTransition (_uState26, _uState27, "State_26", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState27Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_046PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState27Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState32Trans1 = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32_T1", "Dialog")
	_uState32Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState32Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_051PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState32Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState32Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState32Trans1 = nil

-- TO STATE: choice
_uState32Trans2 = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32_T2", "Dialog")
	_uState32Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState32Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_052PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState32Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState32Trans2 = nil

-- TO STATE: choice
_uState32Trans3 = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32_T3", "Dialog")
	_uState32Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState32Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState32Trans3:AddAction (CScriptActionShowChoices())
	_uState32Trans3 = nil

-- TO STATE: choice
_uState32Trans4 = GdsCreateTransition (_uState1, _uState32, "State_1", "State_32_T4", "Dialog")
	_uState32Trans4:AddCondition (CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2))
	_uState32Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState32Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState32Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState32Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState32Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState32Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ3_Available', 1, 2) ))
	_uState32Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_048PC", "Lieutenant, I've dealt with the southern scouts.", 147, 16777215))
	_uState32Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_049", "Great work!", 148, 16777215))
	_uState32Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_050", "Despite our best efforts there are still people outside the city walls. Some of the farmers are reluctant to leave their lands. They should be warned to hide themselves.?", 149, 16777215))
	_uState32Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState32Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState32, _uState32, "State_32", "State_32", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState32, _uBeginState, "State_32", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState33Trans1 = GdsCreateTransition (_uState32, _uState33, "State_32", "State_33_T1", "Dialog")
	_uState33Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState33Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_051PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_3_Finished', 0, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_3_Completed', 1, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'mf_SQ4_Available', 1, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState33Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState33, _uBeginState, "State_33", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState38Trans1 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T1", "Dialog")
	_uState38Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState38Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_055PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState38Trans1 = nil

-- TO STATE: choice
_uState38Trans2 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T2", "Dialog")
	_uState38Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState38Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_056PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState38Trans2 = nil

-- TO STATE: choice
_uState38Trans3 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T3", "Dialog")
	_uState38Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState38Trans3:AddAction (CScriptActionShowChoices())
	_uState38Trans3 = nil

-- TO STATE: choice
_uState38Trans4 = GdsCreateTransition (_uState1, _uState38, "State_1", "State_38_T4", "Dialog")
	_uState38Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ4_Available', 1, 2))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ3_Available', 1, 2) ))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2) ))
	_uState38Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_053PC", "Tell me, lieutenant, is there anything worth paying attention to?", 152, 16777215))
	_uState38Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_054", "Despite our best efforts there are still people outside the city walls. Some of the farmers are reluctant to leave their lands. They should be warned to hide themselves.", 153, 16777215))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState38Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState38, _uBeginState, "State_38", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState39Trans1 = GdsCreateTransition (_uState38, _uState39, "State_38", "State_39_T1", "Dialog")
	_uState39Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState39Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_055PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState39Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState39, _uState39, "State_39", "State_39", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState39, _uBeginState, "State_39", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState44Trans1 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T1", "Dialog")
	_uState44Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState44Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_060PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState44Trans1 = nil

-- TO STATE: choice
_uState44Trans2 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T2", "Dialog")
	_uState44Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState44Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_061PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState44Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState44Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState44Trans2 = nil

-- TO STATE: choice
_uState44Trans3 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T3", "Dialog")
	_uState44Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState44Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState44Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState44Trans3:AddAction (CScriptActionShowChoices())
	_uState44Trans3 = nil

-- TO STATE: choice
_uState44Trans4 = GdsCreateTransition (_uState1, _uState44, "State_1", "State_44_T4", "Dialog")
	_uState44Trans4:AddCondition (CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ3_Available', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2) ))
	_uState44Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ4_Available', 1, 2) ))
	_uState44Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_057PC", "The farmers are now safe, Lieutenant.", 156, 16777215))
	_uState44Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_058", "Great work!", 157, 16777215))
	_uState44Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_059", "Some guards have been reported hiding in the vicinity of the harbour. They seem to be afraid of the undead and won't leave their hiding place, but we'd need them inside the city.", 158, 16777215))
	_uState44Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState44Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState44, _uBeginState, "State_44", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState45Trans1 = GdsCreateTransition (_uState44, _uState45, "State_44", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState45Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_060PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_4_Finished', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_4_Completed', 1, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'mf_SQ5_Available', 1, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState45Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState50Trans1 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T1", "Dialog")
	_uState50Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 2))
	_uState50Trans1:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_064PC", "Ok, Khai Quintar. I'm on it.", 1, 16777215))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 1, 4))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState50Trans1 = nil

-- TO STATE: choice
_uState50Trans2 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T2", "Dialog")
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 2))
	_uState50Trans2:AddAction (CScriptActionChoice("P701_DLG_LIEUTENANT_065PC", "I don't have any time on my hands now.", 2, 16777215))
	_uState50Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 1, 4))
	_uState50Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState50Trans2 = nil

-- TO STATE: choice
_uState50Trans3 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T3", "Dialog")
	_uState50Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 2))
	_uState50Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 0, 4))
	_uState50Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(LIEUTENANT)', 1, 4))
	_uState50Trans3:AddAction (CScriptActionShowChoices())
	_uState50Trans3 = nil

-- TO STATE: choice
_uState50Trans4 = GdsCreateTransition (_uState1, _uState50, "State_1", "State_50_T4", "Dialog")
	_uState50Trans4:AddCondition (CScriptConditionValue('', 'mf_SQ5_Available', 1, 2))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ3_Available', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ4_Available', 1, 2) ))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2) ))
	_uState50Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_062PC", "Tell me, lieutenant, is there anything worth paying attention to?", 161, 16777215))
	_uState50Trans4:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_063", "Some guards have been reported hiding in the vicinity of the harbour. They seem to be afraid of the undead and won't leave their hiding place, but we'd need them inside the city.", 162, 16777215))
	_uState50Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState50Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState50, _uBeginState, "State_50", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState51Trans1 = GdsCreateTransition (_uState50, _uState51, "State_50", "State_51_T1", "Dialog")
	_uState51Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 1))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_064PC", "Ok, Khai Quintar. I'm on it.", 99, 16777215))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState51Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState51, _uState51, "State_51", "State_51", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState51, _uBeginState, "State_51", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState57Trans1 = GdsCreateTransition (_uState1, _uState57, "State_1", "State_57_T1", "Dialog")
	_uState57Trans1:AddCondition (CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2))
	_uState57Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_001", "Where is Halicos, elder? Why hasn't he returned?", 100, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_002PC", "You are Lieutenant Khai Quintar? Please brief me on the situation.", 101, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_003", "The Undead are within our walls. Several invading groups have been reported. Our troops engaged them, but we are few and scattered. Your support is crucial.", 102, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_004PC", "What about the civilians?", 103, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_005", "Most of them hid in safety, but morale drops by the minute. ", 104, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_006PC", "I will act immediately. But I can't do it alone. Can you spare someone from your team?", 105, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_007", "You can take one of my best men with you. They are all lined up and ready.", 106, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_008PC", "Right. I just need to learn their specialties.", 107, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_009", "I think the following four might be of interest to you: A skilled marksman, Nuri, a tough mercenary called Invictus, Alana, one of our best healers and a creepy mage who says his name is Necros. Feel free to talk to any of them.", 108, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_010PC", "Thank you, lieutenant.", 109, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_011", "Aonirs light, elder.", 110, 16777215))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'mf_SQ1_Accepted', 1, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'mf_HeroesAvailable', 1, 4))
	_uState57Trans1:AddAction (CScriptActionDialogEnable('Alana', 1))
	_uState57Trans1:AddAction (CScriptActionDialogEnable('Nuri', 1))
	_uState57Trans1:AddAction (CScriptActionDialogEnable('Necros', 1))
	_uState57Trans1:AddAction (CScriptActionDialogEnable('Invictus', 1))
	_uState57Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(LIEUTENANT)', 1, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans1 = nil

-- TO STATE: endconversation
_uState57Trans2 = GdsCreateTransition (_uState5, _uState57, "State_5", "State_57_T2", "Dialog")
	_uState57Trans2:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(LIEUTENANT)', 1, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans2 = nil

-- TO STATE: endconversation
_uState57Trans3 = GdsCreateTransition (_uState5, _uState57, "State_5", "State_57_T3", "Dialog")
	_uState57Trans3:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'mf_SQ2_Available', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'mf_SQ2_Accepted', 1, 4))
	_uState57Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(LIEUTENANT)', 1, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans3 = nil

-- TO STATE: endconversation
_uState57Trans4 = GdsCreateTransition (_uState4, _uState57, "State_4", "State_57_T4", "Dialog")
	_uState57Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_029PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(LIEUTENANT)', 1, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans4 = nil

-- TO STATE: endconversation
_uState57Trans5 = GdsCreateTransition (_uState9, _uState57, "State_9", "State_57_T5", "Dialog")
	_uState57Trans5:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(LIEUTENANT)', 1, 4))
	_uState57Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans5 = nil

-- TO STATE: endconversation
_uState57Trans6 = GdsCreateTransition (_uState9, _uState57, "State_9", "State_57_T6", "Dialog")
	_uState57Trans6:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_SQ2_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_SQ3_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_SQ4_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_SQ5_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_MQ3_Available', 1, 2), CScriptConditionValue('', 'mf_MQ4_Available', 1, 2)))))))
	_uState57Trans6:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(LIEUTENANT)', 1, 4))
	_uState57Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans6 = nil

-- TO STATE: endconversation
_uState57Trans7 = GdsCreateTransition (_uState9, _uState57, "State_9", "State_57_T7", "Dialog")
	_uState57Trans7:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans7:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_SQ2_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_SQ3_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_SQ4_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_SQ5_Available', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_MQ3_Available', 1, 2), CScriptConditionValue('', 'mf_MQ4_Available', 1, 2)))))) ))
	_uState57Trans7:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_3_Completed', 0, 4))
	_uState57Trans7:AddAction (CScriptActionValueModify('', 'mf_MQ4_Available', 0, 4))
	_uState57Trans7:AddAction (CScriptActionValueModify('', 'mf_P701_MQ4_QuestAccepted', 1, 4))
	_uState57Trans7:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 1))
	_uState57Trans7:AddAction (CScriptActionValueModify('', 'mf_SQ6_Available', 1, 4))
	_uState57Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(LIEUTENANT)', 1, 4))
	_uState57Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans7 = nil

-- TO STATE: endconversation
_uState57Trans8 = GdsCreateTransition (_uState15, _uState57, "State_15", "State_57_T8", "Dialog")
	_uState57Trans8:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(LIEUTENANT)', 1, 4))
	_uState57Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans8 = nil

-- TO STATE: endconversation
_uState57Trans9 = GdsCreateTransition (_uState15, _uState57, "State_15", "State_57_T9", "Dialog")
	_uState57Trans9:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans9:AddAction (CScriptActionValueModify('', 'mf_SQ2_Available', 0, 4))
	_uState57Trans9:AddAction (CScriptActionValueModify('', 'mf_SQ2_Accepted', 1, 4))
	_uState57Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(LIEUTENANT)', 1, 4))
	_uState57Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans9 = nil

-- TO STATE: endconversation
_uState57Trans10 = GdsCreateTransition (_uState14, _uState57, "State_14", "State_57_T10", "Dialog")
	_uState57Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_038PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(LIEUTENANT)', 1, 4))
	_uState57Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans10 = nil

-- TO STATE: endconversation
_uState57Trans11 = GdsCreateTransition (_uState21, _uState57, "State_21", "State_57_T11", "Dialog")
	_uState57Trans11:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(LIEUTENANT)', 1, 4))
	_uState57Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans11 = nil

-- TO STATE: endconversation
_uState57Trans12 = GdsCreateTransition (_uState21, _uState57, "State_21", "State_57_T12", "Dialog")
	_uState57Trans12:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans12:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 0, 4))
	_uState57Trans12:AddAction (CScriptActionValueModify('', 'mf_SQ3_Accepted', 1, 4))
	_uState57Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(LIEUTENANT)', 1, 4))
	_uState57Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans12 = nil

-- TO STATE: endconversation
_uState57Trans13 = GdsCreateTransition (_uState20, _uState57, "State_20", "State_57_T13", "Dialog")
	_uState57Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_043PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(LIEUTENANT)', 1, 4))
	_uState57Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans13 = nil

-- TO STATE: endconversation
_uState57Trans14 = GdsCreateTransition (_uState27, _uState57, "State_27", "State_57_T14", "Dialog")
	_uState57Trans14:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(LIEUTENANT)', 1, 4))
	_uState57Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans14 = nil

-- TO STATE: endconversation
_uState57Trans15 = GdsCreateTransition (_uState27, _uState57, "State_27", "State_57_T15", "Dialog")
	_uState57Trans15:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans15:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 0, 4))
	_uState57Trans15:AddAction (CScriptActionValueModify('', 'mf_SQ3_Accepted', 1, 4))
	_uState57Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(LIEUTENANT)', 1, 4))
	_uState57Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans15 = nil

-- TO STATE: endconversation
_uState57Trans16 = GdsCreateTransition (_uState26, _uState57, "State_26", "State_57_T16", "Dialog")
	_uState57Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_047PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(LIEUTENANT)', 1, 4))
	_uState57Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans16 = nil

-- TO STATE: endconversation
_uState57Trans17 = GdsCreateTransition (_uState33, _uState57, "State_33", "State_57_T17", "Dialog")
	_uState57Trans17:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(LIEUTENANT)', 1, 4))
	_uState57Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans17 = nil

-- TO STATE: endconversation
_uState57Trans18 = GdsCreateTransition (_uState33, _uState57, "State_33", "State_57_T18", "Dialog")
	_uState57Trans18:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans18:AddAction (CScriptActionValueModify('', 'mf_SQ4_Available', 0, 4))
	_uState57Trans18:AddAction (CScriptActionValueModify('', 'mf_SQ4_Accepted', 1, 4))
	_uState57Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(LIEUTENANT)', 1, 4))
	_uState57Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans18 = nil

-- TO STATE: endconversation
_uState57Trans19 = GdsCreateTransition (_uState32, _uState57, "State_32", "State_57_T19", "Dialog")
	_uState57Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_052PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(LIEUTENANT)', 1, 4))
	_uState57Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans19 = nil

-- TO STATE: endconversation
_uState57Trans20 = GdsCreateTransition (_uState39, _uState57, "State_39", "State_57_T20", "Dialog")
	_uState57Trans20:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(LIEUTENANT)', 1, 4))
	_uState57Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans20 = nil

-- TO STATE: endconversation
_uState57Trans21 = GdsCreateTransition (_uState39, _uState57, "State_39", "State_57_T21", "Dialog")
	_uState57Trans21:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans21:AddAction (CScriptActionValueModify('', 'mf_SQ4_Available', 0, 4))
	_uState57Trans21:AddAction (CScriptActionValueModify('', 'mf_SQ4_Accepted', 1, 4))
	_uState57Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(LIEUTENANT)', 1, 4))
	_uState57Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans21 = nil

-- TO STATE: endconversation
_uState57Trans22 = GdsCreateTransition (_uState38, _uState57, "State_38", "State_57_T22", "Dialog")
	_uState57Trans22:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_056PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(LIEUTENANT)', 1, 4))
	_uState57Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans22 = nil

-- TO STATE: endconversation
_uState57Trans23 = GdsCreateTransition (_uState45, _uState57, "State_45", "State_57_T23", "Dialog")
	_uState57Trans23:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(LIEUTENANT)', 1, 4))
	_uState57Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans23 = nil

-- TO STATE: endconversation
_uState57Trans24 = GdsCreateTransition (_uState45, _uState57, "State_45", "State_57_T24", "Dialog")
	_uState57Trans24:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans24:AddAction (CScriptActionValueModify('', 'mf_SQ5_Available', 0, 4))
	_uState57Trans24:AddAction (CScriptActionValueModify('', 'mf_SQ5_Accepted', 1, 4))
	_uState57Trans24:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(LIEUTENANT)', 1, 4))
	_uState57Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans24 = nil

-- TO STATE: endconversation
_uState57Trans25 = GdsCreateTransition (_uState44, _uState57, "State_44", "State_57_T25", "Dialog")
	_uState57Trans25:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans25:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_061PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans25:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(LIEUTENANT)', 1, 4))
	_uState57Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans25 = nil

-- TO STATE: endconversation
_uState57Trans26 = GdsCreateTransition (_uState51, _uState57, "State_51", "State_57_T26", "Dialog")
	_uState57Trans26:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))))
	_uState57Trans26:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(LIEUTENANT)', 1, 4))
	_uState57Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans26 = nil

-- TO STATE: endconversation
_uState57Trans27 = GdsCreateTransition (_uState51, _uState57, "State_51", "State_57_T27", "Dialog")
	_uState57Trans27:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2), CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2)))) ))
	_uState57Trans27:AddAction (CScriptActionValueModify('', 'mf_SQ5_Available', 0, 4))
	_uState57Trans27:AddAction (CScriptActionValueModify('', 'mf_SQ5_Accepted', 1, 4))
	_uState57Trans27:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(LIEUTENANT)', 1, 4))
	_uState57Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans27 = nil

-- TO STATE: endconversation
_uState57Trans28 = GdsCreateTransition (_uState50, _uState57, "State_50", "State_57_T28", "Dialog")
	_uState57Trans28:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 2))
	_uState57Trans28:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_065PC", "I don't have any time on my hands now.", 99, 16777215))
	_uState57Trans28:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(LIEUTENANT)', 1, 4))
	_uState57Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(LIEUTENANT)', 0, 4))
	_uState57Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(LIEUTENANT)', 0, 4))
	_uState57Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans28 = nil

-- TO STATE: endconversation
_uState57Trans29 = GdsCreateTransition (_uState1, _uState57, "State_1", "State_57_T29", "Dialog")
	_uState57Trans29:AddCondition (CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ3_Available', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ4_Available', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2) ))
	_uState57Trans29:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ5_Available', 1, 2) ))
	_uState57Trans29:AddAction (CScriptActionSay("pl_HumanAvatar", "P701_DLG_LIEUTENANT_066PC", "All guards have returned to the city, lieutenant.", 165, 16777215))
	_uState57Trans29:AddAction (CScriptActionSay("lieutenant", "P701_DLG_LIEUTENANT_067", "Great work!", 166, 16777215))
	_uState57Trans29:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(LIEUTENANT)', 1, 4))
	_uState57Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans29 = nil

-- TO STATE: endconversation
_uState57Trans30 = GdsCreateTransition (_uState1, _uState57, "State_1", "State_57_T30", "Dialog")
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_Start_CS01_End', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_2_Completed', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_MQ_3_Completed', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ2_Available', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_2_Finished', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ3_Available', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_3_Finished', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ4_Available', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_4_Finished', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_SQ5_Available', 1, 2) ))
	_uState57Trans30:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P701_SQ_5_Finished', 1, 2) ))
	_uState57Trans30:AddAction (CScriptActionDialogRequestEnd("pl_Human", "lieutenant"))
	_uState57Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(LIEUTENANT)', 1, 4))
	_uState57Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(LIEUTENANT)', 1, 4))
	_uState57Trans30 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(LIEUTENANT)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions1:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(LIEUTENANT)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(LIEUTENANT)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_SQ2_Available', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_SQ2_Accepted', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(LIEUTENANT)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(LIEUTENANT)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions3:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(LIEUTENANT)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(LIEUTENANT)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P701_Lighthouse_CS03_End', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_1_Completed', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_SQ2_Available', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(LIEUTENANT)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(LIEUTENANT)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_3_Completed', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_MQ4_Available', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P701_MQ4_QuestAccepted', 1, 4))
	_uEndActions5:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 1))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_SQ6_Available', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(LIEUTENANT)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(LIEUTENANT)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P701_MQ_3_Completed', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_MQ4_Available', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P701_MQ4_QuestAccepted', 1, 4))
	_uEndActions6:AddAction (CScriptActionDialogEnable('Merchant_Odelle', 1))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_SQ6_Available', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(LIEUTENANT)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(LIEUTENANT)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions7:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(LIEUTENANT)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(LIEUTENANT)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'mf_SQ2_Available', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'mf_SQ2_Accepted', 1, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(LIEUTENANT)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(LIEUTENANT)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions9:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(LIEUTENANT)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(LIEUTENANT)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(LIEUTENANT)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(LIEUTENANT)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'mf_SQ3_Accepted', 1, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(LIEUTENANT)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(LIEUTENANT)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions12:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(LIEUTENANT)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(LIEUTENANT)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_2_Finished', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_2_Completed', 1, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 1, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(LIEUTENANT)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(LIEUTENANT)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_SQ3_Accepted', 1, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(LIEUTENANT)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(LIEUTENANT)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions15:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(LIEUTENANT)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(LIEUTENANT)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(LIEUTENANT)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(LIEUTENANT)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'mf_SQ4_Available', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'mf_SQ4_Accepted', 1, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(LIEUTENANT)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(LIEUTENANT)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions18:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(LIEUTENANT)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(LIEUTENANT)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_3_Finished', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_3_Completed', 1, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'mf_SQ4_Available', 1, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(LIEUTENANT)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(LIEUTENANT)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'mf_SQ3_Available', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'mf_SQ3_Accepted', 1, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(LIEUTENANT)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(LIEUTENANT)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions21:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(LIEUTENANT)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(LIEUTENANT)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(LIEUTENANT)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(LIEUTENANT)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'mf_SQ5_Available', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'mf_SQ5_Accepted', 1, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(LIEUTENANT)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions23 = nil

-- TO SELF: EndConversation Actions #24
_uEndActions24 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_24", "Dialog")
	_uEndActions24:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag24(LIEUTENANT)', 1, 2))
	_uEndActions24:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions24:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(LIEUTENANT)', 0, 4))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions24 = nil

-- TO SELF: EndConversation Actions #25
_uEndActions25 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_25", "Dialog")
	_uEndActions25:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag25(LIEUTENANT)', 1, 2))
	_uEndActions25:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_4_Finished', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_4_Completed', 1, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'mf_SQ5_Available', 1, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(LIEUTENANT)', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions25 = nil

-- TO SELF: EndConversation Actions #26
_uEndActions26 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_26", "Dialog")
	_uEndActions26:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag26(LIEUTENANT)', 1, 2))
	_uEndActions26:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'mf_SQ5_Available', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'mf_SQ5_Accepted', 1, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(LIEUTENANT)', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions26 = nil

-- TO SELF: EndConversation Actions #27
_uEndActions27 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_27", "Dialog")
	_uEndActions27:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag27(LIEUTENANT)', 1, 2))
	_uEndActions27:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions27:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(LIEUTENANT)', 0, 4))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions27 = nil

-- TO SELF: EndConversation Actions #28
_uEndActions28 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_28", "Dialog")
	_uEndActions28:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag28(LIEUTENANT)', 1, 2))
	_uEndActions28:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(LIEUTENANT)', 0, 4))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions28 = nil

-- TO SELF: EndConversation Actions #29
_uEndActions29 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_29", "Dialog")
	_uEndActions29:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag29(LIEUTENANT)', 1, 2))
	_uEndActions29:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_5_Finished', 0, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'mf_P701_SQ_5_Completed', 1, 4))
	_uEndActions29:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(LIEUTENANT)', 0, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions29 = nil

-- TO SELF: EndConversation Actions #30
_uEndActions30 = GdsCreateTransition (_uState57, _uState57, "State_57", "EndActions_30", "Dialog")
	_uEndActions30:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag30(LIEUTENANT)', 1, 2))
	_uEndActions30:AddCondition (CScriptConditionDialogStopped("pl_Human", "lieutenant"))
	_uEndActions30:AddAction (CScriptActionDialogEnable('Lieutenant', 0))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(LIEUTENANT)', 0, 4))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 4))
	_uEndActions30 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState57, _uBeginState, "State_57", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('lieutenant', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState5 = nil
_uState9 = nil
_uState14 = nil
_uState15 = nil
_uState20 = nil
_uState21 = nil
_uState26 = nil
_uState27 = nil
_uState32 = nil
_uState33 = nil
_uState38 = nil
_uState39 = nil
_uState44 = nil
_uState45 = nil
_uState50 = nil
_uState51 = nil
_uState57 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("lieutenant_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(LIEUTENANT)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(LIEUTENANT)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'lieutenant'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "lieutenant", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'lieutenant', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
