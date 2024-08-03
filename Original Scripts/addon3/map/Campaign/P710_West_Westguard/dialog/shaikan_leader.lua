local _uSM = GdsCreateStateMachine ("shaikan_leader_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState13 = GdsCreateState (_uSM, "State_13")
_uState16 = GdsCreateState (_uSM, "State_16")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('shaikan_leader'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SHAIKAN_LEADER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SHAIKAN_LEADER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('shaikan_leader', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("shaikan_leader", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "shaikan_leader"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SHAIKAN_LEADER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('shaikan_leader', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("shaikan_leader")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SHAIKAN_LEADER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikan_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikan_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState3Trans1 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Shaikan_Leader_FirstMeet', 0, 2) ))
	_uState3Trans1:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_004", "Blood of my blood.", 103, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState3Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikan_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikan_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikan_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Destroy_Nameless01_Quest', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_006PC", "Tell me about the first base.", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'mf_P710_Destroy_Nameless02_Quest', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_009PC", "How are chances against the second?", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'mf_P710_Destroy_Nameless03_Quest', 0, 2))
	_uState6Trans3:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_012PC", "What about the third?", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_TalktoShaikan_Leader_Quest', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_TalktoShaikan_Leader_GiveQuest', 1, 2))
	_uState6Trans4:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_015PC", "The situation calls for reinforcements.", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_Tower_Found', 1, 2))
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_Crystal_Found', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_PowertheTowers_Quest', 0, 2))
	_uState6Trans5:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_018PC", "I've seen towers along the defence line, do you know anything about them?", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'mf_P710_Tower_Found', 0, 2))
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'mf_P710_Crystal_Found', 1, 2))
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'mf_P710_PowertheTowers_Quest', 0, 2))
	_uState6Trans6:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_020PC", "I've found this crystal. Any idea what it is good for?", 6, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'mf_P710_Tower_Found', 1, 2))
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'mf_P710_Crystal_Found', 1, 2))
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'mf_P710_PowertheTowers_Quest', 0, 2))
	_uState6Trans7:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_022PC", "I've seen towers along the defence line, and found some strange crystals. Do you know anything about these?", 7, 16777215))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 2))
	_uState6Trans8:AddAction (CScriptActionChoice("P710_DLG_SHAIKANLEADER_026PC", "That's all for now, Lieutenant.", 8, 16777215))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 2))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionShowChoices())
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState3, _uState6, "State_3", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P710_Destroy_Nameless01_Quest', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P710_Destroy_Nameless02_Quest', 0, 2), CScriptConditionValue('', 'mf_P710_Destroy_Nameless03_Quest', 0, 2))) ))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'mf_P710_Shaikan_Leader_FirstMeet', 0, 2))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'mf_P710_Shaikan_Leader_FirstMeet', 1, 4))
	_uState6Trans11:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_001", "Good to have you back, Blood of my blood.", 100, 16777215))
	_uState6Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_002PC", "What's the status?", 101, 16777215))
	_uState6Trans11:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_003", "You have been briefed by Captain Ayro, I guess. We have gathered a large force of Shaikan here to stop any advance the Nameless are making on Westguard. General Redmund and a large army of remaining Realm-troops have arrived to assit us. Kelar sends his greetings and his regrets, that the Dragons had to stand back at Westguard to be our final reserve.", 102, 16777215))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState3, _uState6, "State_3", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P710_Destroy_Nameless01_Quest', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P710_Destroy_Nameless02_Quest', 0, 2), CScriptConditionValue('', 'mf_P710_Destroy_Nameless03_Quest', 0, 2))))
	_uState6Trans12:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_005", "The Nameless have established three bases here and are getting stronger and increasing in number by the minute. If this continues I don't know how to hold them off much longer.", 104, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 1))
	_uState6Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_006PC", "Tell me about the first base.", 99, 16777215))
	_uState6Trans13:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_007", "Our first target is a base set up by the Nameless deep in the forest. It seems to be more of an outpost than a stronghold but it holds a lot of enemies.", 106, 16777215))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_008PC", "I understand, commander. We'll focus on destroying that base.", 107, 16777215))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'mf_P710_Destroy_Nameless01_Quest', 1, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 2))
	_uState6Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_009PC", "How are chances against the second?", 99, 16777215))
	_uState6Trans14:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_010", "The second one is the trickiest part. We have to push deep into Nameless territory while they've strong reinforcements.", 109, 16777215))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_011PC", "I'll take the necessary caution, Lieutenant.", 110, 16777215))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'mf_P710_Destroy_Nameless02_Quest', 1, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 3))
	_uState6Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_012PC", "What about the third?", 99, 16777215))
	_uState6Trans15:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_013", "It's been reported that it has stronger defences than the other ones. The scouts saw three large towers around it, but we have no clue about their capabilities. I'm sure bringing that base down would prove decisive.", 112, 16777215))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_014PC", "We need to crush the Nameless army before we want to face Zazhut. I'll do it.", 113, 16777215))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'mf_P710_Destroy_Nameless03_Quest', 1, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 4))
	_uState6Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_015PC", "The situation calls for reinforcements.", 99, 16777215))
	_uState6Trans16:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_016", "I agree, elder. You won us some time by destroying the enemy base in the forest. We can now summon stronger units to our aid.", 115, 16777215))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_017PC", "Do so, Lieutenant. We can use every unit we can muster.", 116, 16777215))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'mf_P710_TalktoShaikan_Leader_Quest', 1, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState13, _uState6, "State_13", "State_6_T17", "Dialog")
	_uState6Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_024PC", "I'll find a way to reactivate all the towers.", 123, 16777215))
	_uState6Trans17:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_025", "That would be great, elder. I doubt that anything can stand against them.", 124, 16777215))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'mf_P710_PowertheTowers_Quest', 1, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState6Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikan_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikan_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikan_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState13Trans1 = GdsCreateTransition (_uState6, _uState13, "State_6", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 7))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_022PC", "I've seen towers along the defence line, and found some strange crystals. Do you know anything about these?", 99, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_023", "The Plains of Argan were once part of Westguard, which got its name for a reason. Legend has it, that whole armies were crushed because of those defense-towers you found, that were activated by special energy crystals. You hold such a crystal in your hands now.", 122, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: showchoice
_uState13Trans2 = GdsCreateTransition (_uState6, _uState13, "State_6", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 5))
	_uState13Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_018PC", "I've seen towers along the defence line, do you know anything about them?", 99, 16777215))
	_uState13Trans2:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_019", "The Plains of Argan were once part of Westguard, which got its name for a reason. Legend has it, that whole armies were crushed because of these towers. They could really be of great use now. To reactivate them, we'd need energy crystals to refuel their magic.", 118, 16777215))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState13Trans2 = nil

-- TO STATE: showchoice
_uState13Trans3 = GdsCreateTransition (_uState6, _uState13, "State_6", "State_13_T3", "Dialog")
	_uState13Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 6))
	_uState13Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_020PC", "I've found this crystal. Any idea what it is good for?", 99, 16777215))
	_uState13Trans3:AddAction (CScriptActionSay("shaikan_leader", "P710_DLG_SHAIKANLEADER_021", "The Plains of Argan were once part of Westguard, which got its name for a reason. Legend has it, that whole armies were crushed because of special defense-towers, that were activated by special energy crystals. This is such a crystal.", 120, 16777215))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState13Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikan_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikan_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikan_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState16Trans1 = GdsCreateTransition (_uState6, _uState16, "State_6", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "shaikan_leader", 8))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_SHAIKANLEADER_026PC", "That's all for now, Lieutenant.", 99, 16777215))
	_uState16Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shaikan_leader"))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHAIKAN_LEADER)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHAIKAN_LEADER)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHAIKAN_LEADER)', 1, 4))
	_uState16Trans1 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SHAIKAN_LEADER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "shaikan_leader"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHAIKAN_LEADER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKAN_LEADER)', 1, 4))
	_uEndActions1 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SHAIKAN_LEADER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHAIKAN_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shaikan_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState6 = nil
_uState13 = nil
_uState16 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("shaikan_leader_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/horseman_BeginDialog.tak', 'pl_HumanAvatar', 'shaikan_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHAIKAN_LEADER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

