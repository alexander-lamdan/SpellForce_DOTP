local _uSM = GdsCreateStateMachine ("ghost_02_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState12 = GdsCreateState (_uSM, "State_12")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('ghost_02'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(GHOST_02)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(GHOST_02)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('ghost_02', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("ghost_02", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "ghost_02"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_02)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(GHOST_02)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('ghost_02', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("ghost_02")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_02)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(GHOST_02)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_02_dialog_started', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_ghost_02_dialog_fix_HasTriggered', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST02_010PC", "Flattering. You're intriguingly smart. I think there's noone better suited to help me than you are.", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST02_024PC", "Intimidating. I don't like being messed with. You owe me for that!", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_02)', 0, 2))
	_uState3Trans3:AddAction (CScriptActionChoice("P703_DLG_GHOST02_026PC", "Feigning interest. A Drakkar-battle, how interesting. Please, tell me more.", 3, 16777215))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_02)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 2))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 0, 4))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_02)', 1, 4))
	_uState3Trans4:AddAction (CScriptActionShowChoices())
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionValue('', 'ev_TimesSpoken(GHOST_02)', 0, 2))
	_uState3Trans5:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_001", "Uh, oh! A Shaikan.", 100, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_002PC", "A perceptive eye. Who are you.", 101, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_003", "My name is Carla. I first met one of your kind in battle.", 102, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_004PC", "I presume that was not the cause of your death?", 103, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_005", "Correct, my dragonblooded friend.", 104, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_006PC", "Then I'm surprised you survived the first encounter. You must be a great fighter.", 105, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_007", "I am, Shaikan. But you are mistaken. I lost the battle.", 106, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_008PC", "Then he let you live?", 107, 16777215))
	_uState3Trans5:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_009", "*laughs* - I think I have messed around with you long enough, Shaikan. It wasn't a battle of arms. It was a Drakkar-battle.", 108, 16777215))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState3Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState4Trans1 = GdsCreateTransition (_uState3, _uState4, "State_3", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 1))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_010PC", "Flattering. You're intriguingly smart. I think there's noone better suited to help me than you are.", 99, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_011", "And you are intriguingly flattering. But I like it. Please go on.", 110, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_02)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_012PC", "Your eyes sparkle like the crystals on song glass. Not even Tiara could stand along such eyes.", 111, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_013", "*laughs* go on … *laughs*", 112, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_014PC", "Your wit outsmarts even Malacay the great. Not even the Elven queen Raman'sha could …", 113, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_015", "*laughs harder* Please! Stop! *laughs*", 114, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_016PC", "Your knowledge of the world and the ways within can compete with Ereons himself.", 115, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_017", "*laughs even harder* You won! You won! Stop! Please! *laughs*", 116, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_018PC", "I would like to claim my victory by swapping pieces with you.", 117, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'ev_TimesSpoken(GHOST_02)', 1, 0))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: showchoice
_uState4Trans2 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'ev_TimesSpoken(GHOST_02)', 0, 2) ))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState4Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST02_020PC", "I don't have a lower number.", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'mv_Avatar_Number', 35, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST02_022PC", "35, that's lower than your own.", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 2))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 0, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_02)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionShowChoices())
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T4", "Dialog")
	_uState6Trans4:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_019", "I'm a player, Shaikan, not a donor. I want a lower number than my own, which is 42.", 118, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState6Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState12Trans1 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 1))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_020PC", "I don't have a lower number.", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_021", "No deal then. Come back when you have.", 120, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GHOST_02)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: endconversation
_uState12Trans2 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 2))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_022PC", "35, that's lower than your own.", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_023", "Now, well done. That wasn't too hard, was it?", 122, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GHOST_02)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: endconversation
_uState12Trans3 = GdsCreateTransition (_uState3, _uState12, "State_3", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 2))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_024PC", "Intimidating. I don't like being messed with. You owe me for that!", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_025", "No I don't. Don't be a sissy, Shaikan.", 124, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_02)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GHOST_02)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: endconversation
_uState12Trans4 = GdsCreateTransition (_uState3, _uState12, "State_3", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 3))
	_uState12Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST02_026PC", "Feigning interest. A Drakkar-battle, how interesting. Please, tell me more.", 99, 16777215))
	_uState12Trans4:AddAction (CScriptActionSay("ghost_02", "P703_DLG_GHOST02_027", "You're a lousy liar, Shaikan. You probably know about that game already. No chance to win on that front.", 126, 16777215))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_02)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_02)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_02)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_02"))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(GHOST_02)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_02)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(GHOST_02)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GHOST_02)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_02)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(GHOST_02)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_02_trade', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GHOST_02)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_02)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(GHOST_02)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GHOST_02)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_02)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(GHOST_02)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_02"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(GHOST_02)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_02)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(GHOST_02)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState4 = nil
_uState6 = nil
_uState12 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("ghost_02_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GHOST_02)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GHOST_02)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_02", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_02', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
