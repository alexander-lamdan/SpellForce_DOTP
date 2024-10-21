local _uSM = GdsCreateStateMachine ("pact_4_leader_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState12 = GdsCreateState (_uSM, "State_12")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState35 = GdsCreateState (_uSM, "State_35")
_uState40 = GdsCreateState (_uSM, "State_40")
_uState45 = GdsCreateState (_uSM, "State_45")
_uState47 = GdsCreateState (_uSM, "State_47")
_uState50 = GdsCreateState (_uSM, "State_50")
_uState52 = GdsCreateState (_uSM, "State_52")
_uState56 = GdsCreateState (_uSM, "State_56")
_uState60 = GdsCreateState (_uSM, "State_60")
_uState65 = GdsCreateState (_uSM, "State_65")
_uState70 = GdsCreateState (_uSM, "State_70")
_uState75 = GdsCreateState (_uSM, "State_75")
_uState81 = GdsCreateState (_uSM, "State_81")
_uState84 = GdsCreateState (_uSM, "State_84")
_uState88 = GdsCreateState (_uSM, "State_88")
_uState90 = GdsCreateState (_uSM, "State_90")
_uState92 = GdsCreateState (_uSM, "State_92")
_uState94 = GdsCreateState (_uSM, "State_94")
_uState98 = GdsCreateState (_uSM, "State_98")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('pact_4_leader'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(PACT_4_LEADER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(PACT_4_LEADER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('pact_4_leader', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: label
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "pact_4_leader"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(PACT_4_LEADER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("pact_4_leader")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(PACT_4_LEADER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: label
_uState2Trans2 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_005PC", "Do you know about the Demons, lurking in the Center of the City?", 99, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_006", "Demons? What demons?", 105, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_007PC", "The ones I just fought back, before reaching your camp?", 106, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_008", "I doubt they will pose a great threat if you were able to defeat them.", 107, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P4_Demons_Done', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: label
_uState2Trans3 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_009PC", "Then we've got a common interest, Archon. Why not form an alliance?", 99, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_010", "I don't see a common interest here. Except for the fact, that you are well paid for your transportation services.", 109, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_011PC", "If there's no more Eo, how could you rise to your old glory, Archon?", 110, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_012", "The Archon know about the Nameless and have calculated the threat-potential. It's far less than you claim.", 111, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_013PC", "Pride goes before a fall…", 112, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_014", "And ignorance is the weapon of the imbecile.", 113, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_015PC", "I see, Archon. An alliance between us is out of the question.", 114, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P4_Alliance_Done', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: label
_uState2Trans4 = GdsCreateTransition (_uState10, _uState2, "State_10", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_031PC", "What levers are you talking about?", 99, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_032", "Within this city we found several levers. They seemed to operate several gates, which are otherwise hidden within the walls of this city.", 131, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_033PC", "This could come in handy for sneak attacks.", 132, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_034", "You're starting to get the picture.", 133, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P4_Local_Done', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: label
_uState2Trans5 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_035PC", "During your time here, did you learn anything about a being called Zazhut?", 99, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_036", "Hm. I'm not sure, Shaikan. Zazhut is a shortening of a Shaper term called Zalutik Zhutan aim, which translates to Being of great power.", 135, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_037PC", "Being of great power - interesting.", 136, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_038", "There was a fascinating book, made of crystal, which - if you touched it - started to tell the story written within. It told of two such beings of great power, who were friendly with the Shapers and showed them many things in terms of magic and crafting.", 137, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_039PC", "I need to see that book. It might be of greater importance than you think.", 138, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_040", "Alas, Shaikan. A clumsy Sinistrim broke it. We could restore part of it, but we never learned, what became of these two beings. We were sure, they had some connection with Ani'Hu.", 139, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_041PC", "Thank you, Archon. This was very helpful.", 140, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P4_Zazhut_Done', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState2Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P4_Demons_Done', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_005PC", "Do you know about the Demons, lurking in the Center of the City?", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P4_Alliance_Done', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_009PC", "Then we've got a common interest, Archon. Why not form an alliance?", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P4_Local_Done', 0, 2))
	_uState6Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_016PC", "Is there any information you are willing to share with me?", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P4_Zazhut_Done', 0, 2))
	_uState6Trans4:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_035PC", "During your time here, did you learn anything about a being called Zazhut?", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 2))
	_uState6Trans5:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_042PC", "How do you intend to get there?", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 2))
	_uState6Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1A_WIPEP3_TALKP4', 1))
	_uState6Trans6:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 6, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 2))
	_uState6Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_TALKP4', 1))
	_uState6Trans7:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 7, 16777215))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 2))
	_uState6Trans8:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2A_WIPEP1_TALKP4', 1))
	_uState6Trans8:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 8, 16777215))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 2))
	_uState6Trans9:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2B_WIPEP3_TALKP4', 1))
	_uState6Trans9:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 9, 16777215))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionShowChoices())
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2))
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2))
	_uState6Trans11:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))
	_uState6Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState6Trans11:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 103, 16777215))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2))
	_uState6Trans12:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_001", "Greetings, Shaikan. We didn't expect transport so soon. How come you're here?", 100, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_002PC", "I'm here to find information about a threat, that endangers the whole of Eo, not for transportation. What is your purpose here?", 101, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_003", "I'm here on order of my Emperess, to find information that will help the Norcaine rise again to their old glory, Shaikan.", 102, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'mf_P704_Pact4LeaderKnown', 1, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState6Trans12 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState10Trans1 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState10Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_018PC", "Information about the enemies is always useful.", 1, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: choice
_uState10Trans2 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState10Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_031PC", "What levers are you talking about?", 2, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: choice
_uState10Trans3 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionShowChoices())
	_uState10Trans3 = nil

-- TO STATE: choice
_uState10Trans4 = GdsCreateTransition (_uState6, _uState10, "State_6", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_016PC", "Is there any information you are willing to share with me?", 99, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_017", "I'm not willing to share much but I could tell you something about our enemies, about some strange levers we found or about a way how you could help us, become stronger.", 116, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState10Trans4 = nil

-- TO STATE: choice
_uState10Trans5 = GdsCreateTransition (_uState12, _uState10, "State_12", "State_10_T5", "Dialog")
	_uState10Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState10Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_028PC", "Tell me about the Dracon. What should I know?", 99, 16777215))
	_uState10Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_029", "The Dracon were once our spearhead in any battle we would fight. But since they have been rebuilt as a caste, they're just the weaklings collected from the other castes. ", 128, 16777215))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState10Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_030", "It's sad to see what has become of our proud race. And nowhere it is more visible than in this new Dracon caste.", 129, 16777215))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState10Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState12Trans1 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState12Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_020PC", "I'd like to know something about the Sinistrim.", 1, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: choice
_uState12Trans2 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState12Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_024PC", "Some information about the other Archons would be welcome.", 2, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: choice
_uState12Trans3 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState12Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_028PC", "Tell me about the Dracon. What should I know?", 3, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: choice
_uState12Trans4 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionShowChoices())
	_uState12Trans4 = nil

-- TO STATE: choice
_uState12Trans5 = GdsCreateTransition (_uState10, _uState12, "State_10", "State_12_T5", "Dialog")
	_uState12Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState12Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_018PC", "Information about the enemies is always useful.", 99, 16777215))
	_uState12Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_019", "Would you rather know something about the Sinistrim, the other Archons or the Dracon?", 118, 16777215))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans5 = nil

-- TO STATE: choice
_uState12Trans6 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T6", "Dialog")
	_uState12Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState12Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_020PC", "I'd like to know something about the Sinistrim.", 99, 16777215))
	_uState12Trans6:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_021", "The Sinistrim aren't big fighters, they are sorcerors, mages, necromancers. Their strength is deceit and treachery.", 120, 16777215))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState12Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_022PC", "Interesting, I think I heard something like that before.", 121, 16777215))
	_uState12Trans6:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_023", "Any Norcaine, that is not Sinistrim will tell you so.", 122, 16777215))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans6 = nil

-- TO STATE: choice
_uState12Trans7 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T7", "Dialog")
	_uState12Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState12Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_024PC", "Some information about the other Archons would be welcome.", 99, 16777215))
	_uState12Trans7:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_025", "Archon Liriel is an ambitious traitor with no sense of culture and tradition. She tried to get the information from the scroll of Ani'Hu all for her personal gain.", 124, 16777215))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState12Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_026PC", "That's why Archons are now also fighting Archons?", 125, 16777215))
	_uState12Trans7:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_027", "She was my lieutenant, my second in command. She will pay for her treachery!", 126, 16777215))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState12Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState18Trans1 = GdsCreateTransition (_uState6, _uState18, "State_6", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 5))
	_uState18Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_042PC", "How do you intend to get there?", 99, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState18Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState21Trans1 = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState21Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_051PC", "A diplomatic mission then? Very well, Archon.", 1, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState21Trans1 = nil

-- TO STATE: choice
_uState21Trans2 = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21_T2", "Dialog")
	_uState21Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState21Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_052PC", "I have to consider my options, Archon. I'll be back.", 2, 16777215))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState21Trans2 = nil

-- TO STATE: choice
_uState21Trans3 = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21_T3", "Dialog")
	_uState21Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState21Trans3:AddAction (CScriptActionShowChoices())
	_uState21Trans3 = nil

-- TO STATE: choice
_uState21Trans4 = GdsCreateTransition (_uState18, _uState21, "State_18", "State_21_T4", "Dialog")
	_uState21Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ))) ))
	_uState21Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_044", "I intend to take my battle-staff and beat the life out of that treacherous Liriel.", 143, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_045PC", "You're pretty mad at her.", 144, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_046", "What would you do, if your lieutenant stabbed you in the back? This must be dealt with and without mercy!", 145, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_047PC", "So by killing the Archon Liriel you would just fulfill Nors wishes.", 146, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_048", "No, I'm just fulfilling my thirst for vengeance. She doesn't deserve to be called Archon anymore. But I see, that you have some insight into our culture, so I'll let you do something for me.", 147, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_049PC", "Yes? What would that be?", 148, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_050", "There are two other Norcaine bases here in the Citadel. One led by the Sinistra La'Shut and the other by some fool, calling himself a Dracon. Go to them and convince them, to help me have my vengeance.", 149, 16777215))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState21Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState25Trans1 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState25Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState25Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 1, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: choice
_uState25Trans2 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState25Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState25Trans2 = nil

-- TO STATE: choice
_uState25Trans3 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T3", "Dialog")
	_uState25Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState25Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState25Trans3 = nil

-- TO STATE: choice
_uState25Trans4 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T4", "Dialog")
	_uState25Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState25Trans4:AddAction (CScriptActionShowChoices())
	_uState25Trans4 = nil

-- TO STATE: choice
_uState25Trans5 = GdsCreateTransition (_uState6, _uState25, "State_6", "State_25_T5", "Dialog")
	_uState25Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 6))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 153, 16777215))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 154, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 155, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 156, 16777215))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState25Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState30Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_068PC", "I guess that Archon Liriel will be remembered next.", 1, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState30Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState30Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState30Trans3 = nil

-- TO STATE: choice
_uState30Trans4 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T4", "Dialog")
	_uState30Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState30Trans4:AddAction (CScriptActionShowChoices())
	_uState30Trans4 = nil

-- TO STATE: choice
_uState30Trans5 = GdsCreateTransition (_uState6, _uState30, "State_6", "State_30_T5", "Dialog")
	_uState30Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 7))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 163, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 164, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 165, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 166, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState30Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState35Trans1 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T1", "Dialog")
	_uState35Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState35Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState35Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_078PC", "You might be interested in joining forces in killing the Dracon. Even weak they are still the soldier-caste of the Norcaine.", 1, 16777215))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState35Trans1 = nil

-- TO STATE: choice
_uState35Trans2 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T2", "Dialog")
	_uState35Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState35Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState35Trans2 = nil

-- TO STATE: choice
_uState35Trans3 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T3", "Dialog")
	_uState35Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState35Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState35Trans3 = nil

-- TO STATE: choice
_uState35Trans4 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T4", "Dialog")
	_uState35Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState35Trans4:AddAction (CScriptActionShowChoices())
	_uState35Trans4 = nil

-- TO STATE: choice
_uState35Trans5 = GdsCreateTransition (_uState6, _uState35, "State_6", "State_35_T5", "Dialog")
	_uState35Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 8))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 173, 16777215))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 174, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 175, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 176, 16777215))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState35Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState35, _uBeginState, "State_35", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState40Trans1 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T1", "Dialog")
	_uState40Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState40Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState40Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 1, 16777215))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState40Trans1 = nil

-- TO STATE: choice
_uState40Trans2 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T2", "Dialog")
	_uState40Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState40Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState40Trans2 = nil

-- TO STATE: choice
_uState40Trans3 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T3", "Dialog")
	_uState40Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState40Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState40Trans3 = nil

-- TO STATE: choice
_uState40Trans4 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T4", "Dialog")
	_uState40Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState40Trans4:AddAction (CScriptActionShowChoices())
	_uState40Trans4 = nil

-- TO STATE: choice
_uState40Trans5 = GdsCreateTransition (_uState6, _uState40, "State_6", "State_40_T5", "Dialog")
	_uState40Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 9))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 183, 16777215))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_4_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 184, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 185, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 186, 16777215))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState40Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState40, _uBeginState, "State_40", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState45Trans1 = GdsCreateTransition (_uState2, _uState45, "State_2", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ))
	_uState45Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState45Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2))
	_uState45Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState45Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 194, 16777215))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState45Trans1 = nil

-- TO STATE: elseif
_uState45Trans2 = GdsCreateTransition (_uState2, _uState45, "State_2", "State_45_T2", "Dialog")
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 1, 2))
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2))
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2)) ))
	_uState45Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 289, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_191PC", "Dracon Shur Tal'in is at the Mor Duine.", 290, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_192", "He died a soldiers death. Nor with him.", 291, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_193PC", "He fought until the end. I'm glad you honour his memory.", 292, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_194", "I do, although my thoughts are otherwise occupied.", 293, 16777215))
	_uState45Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState45Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState47Trans1 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T1", "Dialog")
	_uState47Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState47Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_098PC", "*** Allright, let's do it!", 1, 16777215))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState47Trans1 = nil

-- TO STATE: choice
_uState47Trans2 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T2", "Dialog")
	_uState47Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState47Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_109PC", "*** Let me think about that.", 2, 16777215))
	_uState47Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState47Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState47Trans2 = nil

-- TO STATE: choice
_uState47Trans3 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T3", "Dialog")
	_uState47Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState47Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState47Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState47Trans3:AddAction (CScriptActionShowChoices())
	_uState47Trans3 = nil

-- TO STATE: choice
_uState47Trans4 = GdsCreateTransition (_uState45, _uState47, "State_45", "State_47_T4", "Dialog")
	_uState47Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_096", "I had my doubts about those Dracon. But it seems they can fight.", 195, 16777215))
	_uState47Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_097", "But they won't hold out against my power!", 196, 16777215))
	_uState47Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState47Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState47, _uBeginState, "State_47", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState50Trans1 = GdsCreateTransition (_uState2, _uState50, "State_2", "State_50_T1", "Dialog")
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState50Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState50Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2))
	_uState50Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState50Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 209, 16777215))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState50Trans1 = nil

-- TO STATE: elseif
_uState50Trans2 = GdsCreateTransition (_uState2, _uState50, "State_2", "State_50_T2", "Dialog")
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 1, 2))
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2))
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState50Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 294, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_196PC", "Sinistra La'Shut is no more.", 295, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_197", "Did she have the notes?", 296, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_198PC", "No, she didn't have them. But I heard someone mention, that her assistant is missing. Maybe she has them?", 297, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_199", "Maybe. I pray for the Sinistras soul. May Nor guide her soul safely across.", 298, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_200PC", "Such friendly words about the one who took the notes from you?", 299, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_201", "Treachery or not. She's still a High ranking Sinistrim. And I will honour tradition.", 300, 16777215))
	_uState50Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState50Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState50, _uBeginState, "State_50", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState52Trans1 = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52_T1", "Dialog")
	_uState52Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState52Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_112PC", "*** Allright, let's do it!", 1, 16777215))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState52Trans1 = nil

-- TO STATE: choice
_uState52Trans2 = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52_T2", "Dialog")
	_uState52Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState52Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_123PC", "*** Let me think about that.", 2, 16777215))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState52Trans2 = nil

-- TO STATE: choice
_uState52Trans3 = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52_T3", "Dialog")
	_uState52Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState52Trans3:AddAction (CScriptActionShowChoices())
	_uState52Trans3 = nil

-- TO STATE: choice
_uState52Trans4 = GdsCreateTransition (_uState50, _uState52, "State_50", "State_52_T4", "Dialog")
	_uState52Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_111", "I will get this scroll! Go, Archon! Send those Sinistrim across the River of Souls.", 210, 16777215))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState52Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState52, _uBeginState, "State_52", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState56Trans1 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T1", "Dialog")
	_uState56Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState56Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState56Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_129PC", "The Dracon as soldiers pose a threat to your authority.", 1, 16777215))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans1 = nil

-- TO STATE: choice
_uState56Trans2 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T2", "Dialog")
	_uState56Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState56Trans2:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState56Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_134PC", "Sinistra La'Shuts neck seems so fragile. So easy to break.", 2, 16777215))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans2 = nil

-- TO STATE: choice
_uState56Trans3 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T3", "Dialog")
	_uState56Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState56Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1A_WIPEP3_TALKP4', 1))
	_uState56Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 3, 16777215))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans3 = nil

-- TO STATE: choice
_uState56Trans4 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T4", "Dialog")
	_uState56Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 2))
	_uState56Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_TALKP4', 1))
	_uState56Trans4:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 4, 16777215))
	_uState56Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 1, 4))
	_uState56Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans4 = nil

-- TO STATE: choice
_uState56Trans5 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T5", "Dialog")
	_uState56Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 2))
	_uState56Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2A_WIPEP1_TALKP4', 1))
	_uState56Trans5:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 5, 16777215))
	_uState56Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 1, 4))
	_uState56Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans5 = nil

-- TO STATE: choice
_uState56Trans6 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T6", "Dialog")
	_uState56Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 2))
	_uState56Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2B_WIPEP3_TALKP4', 1))
	_uState56Trans6:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 6, 16777215))
	_uState56Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 1, 4))
	_uState56Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans6 = nil

-- TO STATE: choice
_uState56Trans7 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T7", "Dialog")
	_uState56Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 2))
	_uState56Trans7:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_179PC", "I doubt, that I am wise enough to counsel you on this matter.", 7, 16777215))
	_uState56Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 1, 4))
	_uState56Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans7 = nil

-- TO STATE: choice
_uState56Trans8 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T8", "Dialog")
	_uState56Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState56Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState56Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans8:AddAction (CScriptActionShowChoices())
	_uState56Trans8 = nil

-- TO STATE: choice
_uState56Trans9 = GdsCreateTransition (_uState2, _uState56, "State_2", "State_56_T9", "Dialog")
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState56Trans9:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState56Trans9:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState56Trans9:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2))
	_uState56Trans9:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState56Trans9:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 223, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_125PC", "Archon Liriel is at the Mor Duine.", 224, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_126", "My vengeance - at last!", 225, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_127PC", "She fought valiantly. Throwing spells here and there. But death got her and broke her neck.", 226, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_128", "Such sweet word, Shaikan. Whose neck shall we break next?", 227, 16777215))
	_uState56Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState56Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState56, _uBeginState, "State_56", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState60Trans1 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T1", "Dialog")
	_uState60Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState60Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState60Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 1, 16777215))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState60Trans1 = nil

-- TO STATE: choice
_uState60Trans2 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T2", "Dialog")
	_uState60Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState60Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState60Trans2 = nil

-- TO STATE: choice
_uState60Trans3 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T3", "Dialog")
	_uState60Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState60Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState60Trans3 = nil

-- TO STATE: choice
_uState60Trans4 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T4", "Dialog")
	_uState60Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState60Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState60Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState60Trans4:AddAction (CScriptActionShowChoices())
	_uState60Trans4 = nil

-- TO STATE: choice
_uState60Trans5 = GdsCreateTransition (_uState56, _uState60, "State_56", "State_60_T5", "Dialog")
	_uState60Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 239, 16777215))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 240, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 241, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 242, 16777215))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState60Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState60, _uBeginState, "State_60", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState65Trans1 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T1", "Dialog")
	_uState65Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState65Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_068PC", "I guess that Archon Liriel will be remembered next.", 1, 16777215))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState65Trans1 = nil

-- TO STATE: choice
_uState65Trans2 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T2", "Dialog")
	_uState65Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState65Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState65Trans2 = nil

-- TO STATE: choice
_uState65Trans3 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T3", "Dialog")
	_uState65Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState65Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState65Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState65Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState65Trans3 = nil

-- TO STATE: choice
_uState65Trans4 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T4", "Dialog")
	_uState65Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState65Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState65Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState65Trans4:AddAction (CScriptActionShowChoices())
	_uState65Trans4 = nil

-- TO STATE: choice
_uState65Trans5 = GdsCreateTransition (_uState56, _uState65, "State_56", "State_65_T5", "Dialog")
	_uState65Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 249, 16777215))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 250, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 251, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 252, 16777215))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState65Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState65, _uBeginState, "State_65", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState70Trans1 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T1", "Dialog")
	_uState70Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState70Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState70Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_078PC", "You might be interested in joining forces in killing the Dracon. Even weak they are still the soldier-caste of the Norcaine.", 1, 16777215))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState70Trans1 = nil

-- TO STATE: choice
_uState70Trans2 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T2", "Dialog")
	_uState70Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState70Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState70Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState70Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState70Trans2 = nil

-- TO STATE: choice
_uState70Trans3 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T3", "Dialog")
	_uState70Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState70Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState70Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState70Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState70Trans3 = nil

-- TO STATE: choice
_uState70Trans4 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T4", "Dialog")
	_uState70Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState70Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState70Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState70Trans4:AddAction (CScriptActionShowChoices())
	_uState70Trans4 = nil

-- TO STATE: choice
_uState70Trans5 = GdsCreateTransition (_uState56, _uState70, "State_56", "State_70_T5", "Dialog")
	_uState70Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 5))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 259, 16777215))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 260, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 261, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 262, 16777215))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState70Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState70, _uBeginState, "State_70", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState75Trans1 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T1", "Dialog")
	_uState75Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 2))
	_uState75Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState75Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 1, 16777215))
	_uState75Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 1, 4))
	_uState75Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState75Trans1 = nil

-- TO STATE: choice
_uState75Trans2 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T2", "Dialog")
	_uState75Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 2))
	_uState75Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 2, 16777215))
	_uState75Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 1, 4))
	_uState75Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState75Trans2 = nil

-- TO STATE: choice
_uState75Trans3 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T3", "Dialog")
	_uState75Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 2))
	_uState75Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 3, 16777215))
	_uState75Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 1, 4))
	_uState75Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState75Trans3 = nil

-- TO STATE: choice
_uState75Trans4 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T4", "Dialog")
	_uState75Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 2))
	_uState75Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 0, 4))
	_uState75Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_4_LEADER)', 1, 4))
	_uState75Trans4:AddAction (CScriptActionShowChoices())
	_uState75Trans4 = nil

-- TO STATE: choice
_uState75Trans5 = GdsCreateTransition (_uState56, _uState75, "State_56", "State_75_T5", "Dialog")
	_uState75Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 6))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_053PC", "It seems, that some Norcaine don't want follow your orders or those of your Emperess.", 99, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_054", "Those Sinistrim traitors want to have the information all to themselves.", 269, 16777215))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_055PC", "So they don't want to share Ani'Hus notes with you Archons?", 270, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_056", "I see, you are well informed, Shaikan. But of course you must be, given your involvement with the Emperess.", 271, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_057PC", "First the traitor Liriel will die, then those idiots, calling themselves Dracon and finally I will deal with Sinistra La'Shut herself.", 272, 16777215))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState75Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState75, _uBeginState, "State_75", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState81Trans1 = GdsCreateTransition (_uState2, _uState81, "State_2", "State_81_T1", "Dialog")
	_uState81Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2))
	_uState81Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState81Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 282, 16777215))
	_uState81Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState81Trans1 = nil

-- TO STATE: elseif
_uState81Trans2 = GdsCreateTransition (_uState2, _uState81, "State_2", "State_81_T2", "Dialog")
	_uState81Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1))
	_uState81Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState81Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 279, 16777215))
	_uState81Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_181PC", "I'm intrigued what the armour and weapons will look like when forged from these remains. Here are your 20 bones.", 280, 16777215))
	_uState81Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_182", "Thank you, Shaikan. Now we'll be even stronger.", 281, 16777215))
	_uState81Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveArtifactP4', 1, 4))
	_uState81Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState81Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState81, _uState81, "State_81", "State_81", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState81, _uBeginState, "State_81", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState84Trans1 = GdsCreateTransition (_uState2, _uState84, "State_2", "State_84_T1", "Dialog")
	_uState84Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2))
	_uState84Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState84Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 287, 16777215))
	_uState84Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState84Trans1 = nil

-- TO STATE: elseif
_uState84Trans2 = GdsCreateTransition (_uState2, _uState84, "State_2", "State_84_T2", "Dialog")
	_uState84Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1))
	_uState84Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState84Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 284, 16777215))
	_uState84Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_181PC", "I'm intrigued what the armour and weapons will look like when forged from these remains. Here are your 20 bones.", 285, 16777215))
	_uState84Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_182", "Thank you, Shaikan. Now we'll be even stronger.", 286, 16777215))
	_uState84Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveArtifactP4', 1, 4))
	_uState84Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState84Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState84, _uState84, "State_84", "State_84", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState84, _uBeginState, "State_84", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState88Trans1 = GdsCreateTransition (_uState2, _uState88, "State_2", "State_88_T1", "Dialog")
	_uState88Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 1, 2))
	_uState88Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4D_Completed', 0, 2))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState88Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 301, 16777215))
	_uState88Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState88Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState88, _uBeginState, "State_88", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState90Trans1 = GdsCreateTransition (_uState88, _uState90, "State_88", "State_90_T1", "Dialog")
	_uState90Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4D_WIPEP3_RETRIEVEBONESP4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 677, 1, 1, 1)) ))
	_uState90Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState90Trans1 = nil

-- TO STATE: else
_uState90Trans2 = GdsCreateTransition (_uState88, _uState90, "State_88", "State_90_T2", "Dialog")
	_uState90Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4D_WIPEP3_RETRIEVEBONESP4', 1))
	_uState90Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 677, 1, 1, 1))
	_uState90Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_203PC", "Here's the summoning chalk, Archon.", 302, 16777215))
	_uState90Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_204", "Thank you, Shaikan. Now we'll be even stronger.", 303, 16777215))
	_uState90Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveBonesP4', 1, 4))
	_uState90Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState90Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState90, _uState90, "State_90", "State_90", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState90, _uBeginState, "State_90", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState92Trans1 = GdsCreateTransition (_uState2, _uState92, "State_2", "State_92_T1", "Dialog")
	_uState92Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 1, 2))
	_uState92Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4E_Completed', 0, 2))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4D_Completed', 0, 2)) ))
	_uState92Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 305, 16777215))
	_uState92Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState92Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState92, _uState92, "State_92", "State_92", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState92, _uBeginState, "State_92", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState94Trans1 = GdsCreateTransition (_uState92, _uState94, "State_92", "State_94_T1", "Dialog")
	_uState94Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4E_WIPEP1_RETRIEVEBONESP4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 677, 1, 1, 1)) ))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState94Trans1 = nil

-- TO STATE: else
_uState94Trans2 = GdsCreateTransition (_uState92, _uState94, "State_92", "State_94_T2", "Dialog")
	_uState94Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4E_WIPEP1_RETRIEVEBONESP4', 1))
	_uState94Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 677, 1, 1, 1))
	_uState94Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_203PC", "Here's the summoning chalk, Archon.", 306, 16777215))
	_uState94Trans2:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_204", "Thank you, Shaikan. Now we'll be even stronger.", 307, 16777215))
	_uState94Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveBonesP4', 1, 4))
	_uState94Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState94Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState94, _uState94, "State_94", "State_94", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState94, _uBeginState, "State_94", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState98Trans1 = GdsCreateTransition (_uState18, _uState98, "State_18", "State_98_T1", "Dialog")
	_uState98Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState98Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ))
	_uState98Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ))
	_uState98Trans1:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_043", "In the end I get what I wanted from the start.", 142, 16777215))
	_uState98Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PACT_4_LEADER)', 1, 4))
	_uState98Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans1 = nil

-- TO STATE: endconversation
_uState98Trans2 = GdsCreateTransition (_uState21, _uState98, "State_21", "State_98_T2", "Dialog")
	_uState98Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_051PC", "A diplomatic mission then? Very well, Archon.", 99, 16777215))
	_uState98Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PACT_4_LEADER)', 1, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans2 = nil

-- TO STATE: endconversation
_uState98Trans3 = GdsCreateTransition (_uState21, _uState98, "State_21", "State_98_T3", "Dialog")
	_uState98Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_052PC", "I have to consider my options, Archon. I'll be back.", 99, 16777215))
	_uState98Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PACT_4_LEADER)', 1, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans3 = nil

-- TO STATE: endconversation
_uState98Trans4 = GdsCreateTransition (_uState25, _uState98, "State_25", "State_98_T4", "Dialog")
	_uState98Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 99, 16777215))
	_uState98Trans4:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_059", "What you say bears some truth. I think I will do that. Let's kill some Sinistrim, Archon!", 158, 16777215))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(PACT_4_LEADER)', 1, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans4 = nil

-- TO STATE: endconversation
_uState98Trans5 = GdsCreateTransition (_uState25, _uState98, "State_25", "State_98_T5", "Dialog")
	_uState98Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans5:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 160, 16777215))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(PACT_4_LEADER)', 1, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans5 = nil

-- TO STATE: endconversation
_uState98Trans6 = GdsCreateTransition (_uState25, _uState98, "State_25", "State_98_T6", "Dialog")
	_uState98Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(PACT_4_LEADER)', 1, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans6 = nil

-- TO STATE: endconversation
_uState98Trans7 = GdsCreateTransition (_uState30, _uState98, "State_30", "State_98_T7", "Dialog")
	_uState98Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_068PC", "I guess that Archon Liriel will be remembered next.", 99, 16777215))
	_uState98Trans7:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_069", "My vengeance is near - Finally.", 168, 16777215))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(PACT_4_LEADER)', 1, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans7 = nil

-- TO STATE: endconversation
_uState98Trans8 = GdsCreateTransition (_uState30, _uState98, "State_30", "State_98_T8", "Dialog")
	_uState98Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans8:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 170, 16777215))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(PACT_4_LEADER)', 1, 4))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans8 = nil

-- TO STATE: endconversation
_uState98Trans9 = GdsCreateTransition (_uState30, _uState98, "State_30", "State_98_T9", "Dialog")
	_uState98Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(PACT_4_LEADER)', 1, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans9 = nil

-- TO STATE: endconversation
_uState98Trans10 = GdsCreateTransition (_uState35, _uState98, "State_35", "State_98_T10", "Dialog")
	_uState98Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_078PC", "You might be interested in joining forces in killing the Dracon. Even weak they are still the soldier-caste of the Norcaine.", 99, 16777215))
	_uState98Trans10:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_079", "I will postpone my vengeance for a little while, Shaikan. Let's show those weaklings what a real Norcaine can do!", 178, 16777215))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(PACT_4_LEADER)', 1, 4))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans10 = nil

-- TO STATE: endconversation
_uState98Trans11 = GdsCreateTransition (_uState35, _uState98, "State_35", "State_98_T11", "Dialog")
	_uState98Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans11:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 180, 16777215))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(PACT_4_LEADER)', 1, 4))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans11 = nil

-- TO STATE: endconversation
_uState98Trans12 = GdsCreateTransition (_uState35, _uState98, "State_35", "State_98_T12", "Dialog")
	_uState98Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(PACT_4_LEADER)', 1, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans12 = nil

-- TO STATE: endconversation
_uState98Trans13 = GdsCreateTransition (_uState40, _uState98, "State_40", "State_98_T13", "Dialog")
	_uState98Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 99, 16777215))
	_uState98Trans13:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_059", "What you say bears some truth. I think I will do that. Let's kill some Sinistrim, Archon!", 188, 16777215))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(PACT_4_LEADER)', 1, 4))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans13 = nil

-- TO STATE: endconversation
_uState98Trans14 = GdsCreateTransition (_uState40, _uState98, "State_40", "State_98_T14", "Dialog")
	_uState98Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans14:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 190, 16777215))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(PACT_4_LEADER)', 1, 4))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans14 = nil

-- TO STATE: endconversation
_uState98Trans15 = GdsCreateTransition (_uState40, _uState98, "State_40", "State_98_T15", "Dialog")
	_uState98Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(PACT_4_LEADER)', 1, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans15 = nil

-- TO STATE: endconversation
_uState98Trans16 = GdsCreateTransition (_uState2, _uState98, "State_2", "State_98_T16", "Dialog")
	_uState98Trans16:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2))
	_uState98Trans16:AddCondition (CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2))
	_uState98Trans16:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState98Trans16:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState98Trans16:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 192, 16777215))
	_uState98Trans16:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_094", "I hope our alliance is doing well against Archon Liriel.", 193, 16777215))
	_uState98Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(PACT_4_LEADER)', 1, 4))
	_uState98Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans16 = nil

-- TO STATE: endconversation
_uState98Trans17 = GdsCreateTransition (_uState47, _uState98, "State_47", "State_98_T17", "Dialog")
	_uState98Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_098PC", "*** Allright, let's do it!", 99, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_099", "Shaikan, we haven't been able to summon a titan to our aid.", 198, 16777215))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_100PC", "What can I do?", 199, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_101", "When Liriel left, they took all summoning chalk with them. I couldn't find even the tiniest piece.", 200, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_102PC", "So I should get some chalk for you?", 201, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_103", "Not just any chalk, Shaikan. Summoning chalk! Preferrably the one, Liriel always carries with her.", 202, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_104PC", "Need anything else?", 203, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_105", "We need crystals to preserve the energy of the summoning circle, fresh blood as a gift to the summoned titan and the book of Lor'nik for the Titan incantation.", 204, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_106PC", "Oh great. I'll see, what I can do.", 205, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_107", "Don't be silly Shaikan, we're Archon. We have everything here that we need. Just the chalk has been stolen.", 206, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_108PC", "Summoning chalk it is then, right.", 207, 16777215))
	_uState98Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(PACT_4_LEADER)', 1, 4))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans17 = nil

-- TO STATE: endconversation
_uState98Trans18 = GdsCreateTransition (_uState47, _uState98, "State_47", "State_98_T18", "Dialog")
	_uState98Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_109PC", "*** Let me think about that.", 99, 16777215))
	_uState98Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(PACT_4_LEADER)', 1, 4))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans18 = nil

-- TO STATE: endconversation
_uState98Trans19 = GdsCreateTransition (_uState52, _uState98, "State_52", "State_98_T19", "Dialog")
	_uState98Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_112PC", "*** Allright, let's do it!", 99, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_099", "Shaikan, we haven't been able to summon a titan to our aid.", 212, 16777215))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_100PC", "What can I do?", 213, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_101", "When Liriel left, they took all summoning chalk with them. I couldn't find even the tiniest piece.", 214, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_102PC", "So I should get some chalk for you?", 215, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_103", "Not just any chalk, Shaikan. Summoning chalk! Preferrably the one, Liriel always carries with her.", 216, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_104PC", "Need anything else?", 217, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_105", "We need crystals to preserve the energy of the summoning circle, fresh blood as a gift to the summoned titan and the book of Lor'nik for the Titan incantation.", 218, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_106PC", "Oh great. I'll see, what I can do.", 219, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_107", "Don't be silly Shaikan, we're Archon. We have everything here that we need. Just the chalk has been stolen.", 220, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_108PC", "Summoning chalk it is then, right.", 221, 16777215))
	_uState98Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(PACT_4_LEADER)', 1, 4))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans19 = nil

-- TO STATE: endconversation
_uState98Trans20 = GdsCreateTransition (_uState52, _uState98, "State_52", "State_98_T20", "Dialog")
	_uState98Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_123PC", "*** Let me think about that.", 99, 16777215))
	_uState98Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(PACT_4_LEADER)', 1, 4))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans20 = nil

-- TO STATE: endconversation
_uState98Trans21 = GdsCreateTransition (_uState56, _uState98, "State_56", "State_98_T21", "Dialog")
	_uState98Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_129PC", "The Dracon as soldiers pose a threat to your authority.", 99, 16777215))
	_uState98Trans21:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_130", "No, those aren't Dracon, those are pigs. We'll crush them.", 229, 16777215))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_131", "I need your help again, Shaikan, to strengthen our abilities in battle.", 230, 16777215))
	_uState98Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_132PC", "What can I do?", 231, 16777215))
	_uState98Trans21:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_133", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 232, 16777215))
	_uState98Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(PACT_4_LEADER)', 1, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans21 = nil

-- TO STATE: endconversation
_uState98Trans22 = GdsCreateTransition (_uState56, _uState98, "State_56", "State_98_T22", "Dialog")
	_uState98Trans22:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_134PC", "Sinistra La'Shuts neck seems so fragile. So easy to break.", 99, 16777215))
	_uState98Trans22:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_135", "With her neck broken, she can't hold the notes of Ani'Hu anymore. Well thought, Shaikan.", 234, 16777215))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_131", "I need your help again, Shaikan, to strengthen our abilities in battle.", 235, 16777215))
	_uState98Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_132PC", "What can I do?", 236, 16777215))
	_uState98Trans22:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_133", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 237, 16777215))
	_uState98Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(PACT_4_LEADER)', 1, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans22 = nil

-- TO STATE: endconversation
_uState98Trans23 = GdsCreateTransition (_uState60, _uState98, "State_60", "State_98_T23", "Dialog")
	_uState98Trans23:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans23:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 99, 16777215))
	_uState98Trans23:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_059", "What you say bears some truth. I think I will do that. Let's kill some Sinistrim, Archon!", 244, 16777215))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(PACT_4_LEADER)', 1, 4))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans23 = nil

-- TO STATE: endconversation
_uState98Trans24 = GdsCreateTransition (_uState60, _uState98, "State_60", "State_98_T24", "Dialog")
	_uState98Trans24:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans24:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans24:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 246, 16777215))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans24:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(PACT_4_LEADER)', 1, 4))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans24 = nil

-- TO STATE: endconversation
_uState98Trans25 = GdsCreateTransition (_uState60, _uState98, "State_60", "State_98_T25", "Dialog")
	_uState98Trans25:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans25:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans25:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(PACT_4_LEADER)', 1, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans25 = nil

-- TO STATE: endconversation
_uState98Trans26 = GdsCreateTransition (_uState65, _uState98, "State_65", "State_98_T26", "Dialog")
	_uState98Trans26:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_068PC", "I guess that Archon Liriel will be remembered next.", 99, 16777215))
	_uState98Trans26:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_069", "My vengeance is near - Finally.", 254, 16777215))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans26:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(PACT_4_LEADER)', 1, 4))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans26 = nil

-- TO STATE: endconversation
_uState98Trans27 = GdsCreateTransition (_uState65, _uState98, "State_65", "State_98_T27", "Dialog")
	_uState98Trans27:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans27:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans27:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 256, 16777215))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans27:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(PACT_4_LEADER)', 1, 4))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans27 = nil

-- TO STATE: endconversation
_uState98Trans28 = GdsCreateTransition (_uState65, _uState98, "State_65", "State_98_T28", "Dialog")
	_uState98Trans28:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans28:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans28:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(PACT_4_LEADER)', 1, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans28 = nil

-- TO STATE: endconversation
_uState98Trans29 = GdsCreateTransition (_uState70, _uState98, "State_70", "State_98_T29", "Dialog")
	_uState98Trans29:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans29:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_078PC", "You might be interested in joining forces in killing the Dracon. Even weak they are still the soldier-caste of the Norcaine.", 99, 16777215))
	_uState98Trans29:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_079", "I will postpone my vengeance for a little while, Shaikan. Let's show those weaklings what a real Norcaine can do!", 264, 16777215))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans29:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(PACT_4_LEADER)', 1, 4))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans29 = nil

-- TO STATE: endconversation
_uState98Trans30 = GdsCreateTransition (_uState70, _uState98, "State_70", "State_98_T30", "Dialog")
	_uState98Trans30:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans30:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans30:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 266, 16777215))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans30:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(PACT_4_LEADER)', 1, 4))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans30 = nil

-- TO STATE: endconversation
_uState98Trans31 = GdsCreateTransition (_uState70, _uState98, "State_70", "State_98_T31", "Dialog")
	_uState98Trans31:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans31:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans31:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(PACT_4_LEADER)', 1, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans31 = nil

-- TO STATE: endconversation
_uState98Trans32 = GdsCreateTransition (_uState75, _uState98, "State_75", "State_98_T32", "Dialog")
	_uState98Trans32:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 1))
	_uState98Trans32:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_058PC", "How about using those Dracon idiots before killing them. They might come in handy in killing off the others.", 99, 16777215))
	_uState98Trans32:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_059", "What you say bears some truth. I think I will do that. Let's kill some Sinistrim, Archon!", 274, 16777215))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans32:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag32(PACT_4_LEADER)', 1, 4))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans32 = nil

-- TO STATE: endconversation
_uState98Trans33 = GdsCreateTransition (_uState75, _uState98, "State_75", "State_98_T33", "Dialog")
	_uState98Trans33:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 2))
	_uState98Trans33:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_060PC", "When talking to Archon Liriel it seemed …", 99, 16777215))
	_uState98Trans33:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_061", "You're in allegiance with that treacherous beast? Begone!", 276, 16777215))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans33:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag33(PACT_4_LEADER)', 1, 4))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans33 = nil

-- TO STATE: endconversation
_uState98Trans34 = GdsCreateTransition (_uState75, _uState98, "State_75", "State_98_T34", "Dialog")
	_uState98Trans34:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 3))
	_uState98Trans34:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_062PC", "That sounds resonable, Archon.", 99, 16777215))
	_uState98Trans34:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag34(PACT_4_LEADER)', 1, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans34 = nil

-- TO STATE: endconversation
_uState98Trans35 = GdsCreateTransition (_uState56, _uState98, "State_56", "State_98_T35", "Dialog")
	_uState98Trans35:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_4_leader", 7))
	_uState98Trans35:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_179PC", "I doubt, that I am wise enough to counsel you on this matter.", 99, 16777215))
	_uState98Trans35:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag35(PACT_4_LEADER)', 1, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_4_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans35 = nil

-- TO STATE: endconversation
_uState98Trans36 = GdsCreateTransition (_uState81, _uState98, "State_81", "State_98_T36", "Dialog")
	_uState98Trans36:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_184", "*** I hope our alliance is doing well against the Dracons.", 283, 16777215))
	_uState98Trans36:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans36:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag36(PACT_4_LEADER)', 1, 4))
	_uState98Trans36:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans36 = nil

-- TO STATE: endconversation
_uState98Trans37 = GdsCreateTransition (_uState84, _uState98, "State_84", "State_98_T37", "Dialog")
	_uState98Trans37:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_189", "*** I hope our alliance is doing well against the Sinistrim.", 288, 16777215))
	_uState98Trans37:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans37:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag37(PACT_4_LEADER)', 1, 4))
	_uState98Trans37:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans37 = nil

-- TO STATE: endconversation
_uState98Trans38 = GdsCreateTransition (_uState90, _uState98, "State_90", "State_98_T38", "Dialog")
	_uState98Trans38:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_205", "*** I hope our alliance is doing well against the Sinistrim.", 304, 16777215))
	_uState98Trans38:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans38:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag38(PACT_4_LEADER)', 1, 4))
	_uState98Trans38:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans38 = nil

-- TO STATE: endconversation
_uState98Trans39 = GdsCreateTransition (_uState94, _uState98, "State_94", "State_98_T39", "Dialog")
	_uState98Trans39:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_209", "*** I hope our alliance is doing well against the Dracons.", 308, 16777215))
	_uState98Trans39:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans39:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag39(PACT_4_LEADER)', 1, 4))
	_uState98Trans39:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans39 = nil

-- TO STATE: endconversation
_uState98Trans40 = GdsCreateTransition (_uState2, _uState98, "State_2", "State_98_T40", "Dialog")
	_uState98Trans40:AddCondition (CScriptConditionValue('', 'mf_P704_MQ8_Accepted', 1, 2))
	_uState98Trans40:AddCondition (CScriptConditionValue('', 'mf_P704_MQ8_Completed', 0, 2))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4D_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Completed', 0, 2)) ))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_004", "Greetings, shaikan.", 309, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_211", "The Emperess will be pleased. Now give me the notes.", 310, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_212PC", "We couldn't find the notes of Ani'Hu. They mysteriously disappeared along with the Assistant of Sinistra La'Shut.", 311, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_213", "They disappeared, you say? Mysteriously and without a trace? *Pause*", 312, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT4LEADER_214PC", "And I hope they will stay disappeared. They started a small civil war already here. What do you think would happen in Shal?", 313, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_215", "The Emperess would have … [sighs] You're wise, Shaikan, wiser than anyone would have expected a Shaikan to be. So I will tell you a secret, that might aid you in your quest to save this world.", 314, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_216", "You have seen a lot of the Citadel during this small war. But you haven't seen half of its books. In the north of the city you find a bridge, leading to a small island. ", 315, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_217", "There you find an old portal, which can be activated by this journey-crystal. It took us weeks to figure this out.", 316, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_218", "Take it, Shaikan. Find the information you need but remember, death is only the beginning.", 317, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_219", "Thank you, Dracon. I will try to remember.", 318, 16777215))
	_uState98Trans40:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans40:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag40(PACT_4_LEADER)', 1, 4))
	_uState98Trans40:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans40 = nil

-- TO STATE: endconversation
_uState98Trans41 = GdsCreateTransition (_uState2, _uState98, "State_2", "State_98_T41", "Dialog")
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact4LeaderKnown', 0, 2) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_2_Leader')))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4A_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 0, 2))))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_RETRIEVES3P4', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 0, 2))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4D_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ4E_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ4E_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ8_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ8_Completed', 0, 2)) ))
	_uState98Trans41:AddAction (CScriptActionSay("pact_4_leader", "P704_DLG_PACT4LEADER_220", "*** I am busy right now, come back later...", 319, 16777215))
	_uState98Trans41:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_4_leader"))
	_uState98Trans41:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag41(PACT_4_LEADER)', 1, 4))
	_uState98Trans41:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_4_LEADER)', 1, 4))
	_uState98Trans41 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(PACT_4_LEADER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PACT_4_LEADER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(PACT_4_LEADER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PACT_4_LEADER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(PACT_4_LEADER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PACT_4_LEADER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(PACT_4_LEADER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_P4LeaderTalked', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(PACT_4_LEADER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(PACT_4_LEADER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(PACT_4_LEADER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(PACT_4_LEADER)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(PACT_4_LEADER)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(PACT_4_LEADER)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_P4LeaderTalked', 1, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(PACT_4_LEADER)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(PACT_4_LEADER)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(PACT_4_LEADER)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(PACT_4_LEADER)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(PACT_4_LEADER)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(PACT_4_LEADER)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_P4LeaderTalked', 1, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(PACT_4_LEADER)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(PACT_4_LEADER)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(PACT_4_LEADER)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(PACT_4_LEADER)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(PACT_4_LEADER)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(PACT_4_LEADER)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_P4LeaderTalked', 1, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(PACT_4_LEADER)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(PACT_4_LEADER)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(PACT_4_LEADER)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(PACT_4_LEADER)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(PACT_4_LEADER)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(PACT_4_LEADER)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(PACT_4_LEADER)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(PACT_4_LEADER)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4E_Accepted', 1, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(PACT_4_LEADER)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(PACT_4_LEADER)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(PACT_4_LEADER)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(PACT_4_LEADER)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4D_Accepted', 1, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(PACT_4_LEADER)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(PACT_4_LEADER)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(PACT_4_LEADER)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(PACT_4_LEADER)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 1, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(PACT_4_LEADER)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(PACT_4_LEADER)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 1, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(PACT_4_LEADER)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(PACT_4_LEADER)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_P4LeaderTalked', 1, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(PACT_4_LEADER)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions23 = nil

-- TO SELF: EndConversation Actions #24
_uEndActions24 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_24", "Dialog")
	_uEndActions24:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag24(PACT_4_LEADER)', 1, 2))
	_uEndActions24:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(PACT_4_LEADER)', 0, 4))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions24 = nil

-- TO SELF: EndConversation Actions #25
_uEndActions25 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_25", "Dialog")
	_uEndActions25:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag25(PACT_4_LEADER)', 1, 2))
	_uEndActions25:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(PACT_4_LEADER)', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions25 = nil

-- TO SELF: EndConversation Actions #26
_uEndActions26 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_26", "Dialog")
	_uEndActions26:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag26(PACT_4_LEADER)', 1, 2))
	_uEndActions26:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_P4LeaderTalked', 1, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(PACT_4_LEADER)', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions26 = nil

-- TO SELF: EndConversation Actions #27
_uEndActions27 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_27", "Dialog")
	_uEndActions27:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag27(PACT_4_LEADER)', 1, 2))
	_uEndActions27:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(PACT_4_LEADER)', 0, 4))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions27 = nil

-- TO SELF: EndConversation Actions #28
_uEndActions28 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_28", "Dialog")
	_uEndActions28:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag28(PACT_4_LEADER)', 1, 2))
	_uEndActions28:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(PACT_4_LEADER)', 0, 4))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions28 = nil

-- TO SELF: EndConversation Actions #29
_uEndActions29 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_29", "Dialog")
	_uEndActions29:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag29(PACT_4_LEADER)', 1, 2))
	_uEndActions29:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_P4LeaderTalked', 1, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(PACT_4_LEADER)', 0, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions29 = nil

-- TO SELF: EndConversation Actions #30
_uEndActions30 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_30", "Dialog")
	_uEndActions30:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag30(PACT_4_LEADER)', 1, 2))
	_uEndActions30:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(PACT_4_LEADER)', 0, 4))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions30 = nil

-- TO SELF: EndConversation Actions #31
_uEndActions31 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_31", "Dialog")
	_uEndActions31:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag31(PACT_4_LEADER)', 1, 2))
	_uEndActions31:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(PACT_4_LEADER)', 0, 4))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions31 = nil

-- TO SELF: EndConversation Actions #32
_uEndActions32 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_32", "Dialog")
	_uEndActions32:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag32(PACT_4_LEADER)', 1, 2))
	_uEndActions32:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_P4LeaderTalked', 1, 4))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag32(PACT_4_LEADER)', 0, 4))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions32 = nil

-- TO SELF: EndConversation Actions #33
_uEndActions33 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_33", "Dialog")
	_uEndActions33:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag33(PACT_4_LEADER)', 1, 2))
	_uEndActions33:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions33:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag33(PACT_4_LEADER)', 0, 4))
	_uEndActions33:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions33 = nil

-- TO SELF: EndConversation Actions #34
_uEndActions34 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_34", "Dialog")
	_uEndActions34:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag34(PACT_4_LEADER)', 1, 2))
	_uEndActions34:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions34:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag34(PACT_4_LEADER)', 0, 4))
	_uEndActions34:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions34 = nil

-- TO SELF: EndConversation Actions #35
_uEndActions35 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_35", "Dialog")
	_uEndActions35:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag35(PACT_4_LEADER)', 1, 2))
	_uEndActions35:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions35:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag35(PACT_4_LEADER)', 0, 4))
	_uEndActions35:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions35 = nil

-- TO SELF: EndConversation Actions #36
_uEndActions36 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_36", "Dialog")
	_uEndActions36:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag36(PACT_4_LEADER)', 1, 2))
	_uEndActions36:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions36:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag36(PACT_4_LEADER)', 0, 4))
	_uEndActions36:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions36 = nil

-- TO SELF: EndConversation Actions #37
_uEndActions37 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_37", "Dialog")
	_uEndActions37:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag37(PACT_4_LEADER)', 1, 2))
	_uEndActions37:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions37:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag37(PACT_4_LEADER)', 0, 4))
	_uEndActions37:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions37 = nil

-- TO SELF: EndConversation Actions #38
_uEndActions38 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_38", "Dialog")
	_uEndActions38:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag38(PACT_4_LEADER)', 1, 2))
	_uEndActions38:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions38:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag38(PACT_4_LEADER)', 0, 4))
	_uEndActions38:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions38 = nil

-- TO SELF: EndConversation Actions #39
_uEndActions39 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_39", "Dialog")
	_uEndActions39:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag39(PACT_4_LEADER)', 1, 2))
	_uEndActions39:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions39:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag39(PACT_4_LEADER)', 0, 4))
	_uEndActions39:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions39 = nil

-- TO SELF: EndConversation Actions #40
_uEndActions40 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_40", "Dialog")
	_uEndActions40:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag40(PACT_4_LEADER)', 1, 2))
	_uEndActions40:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'mf_P704_P4LeaderTalkedLast', 1, 4))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag40(PACT_4_LEADER)', 0, 4))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions40 = nil

-- TO SELF: EndConversation Actions #41
_uEndActions41 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_41", "Dialog")
	_uEndActions41:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag41(PACT_4_LEADER)', 1, 2))
	_uEndActions41:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_4_leader"))
	_uEndActions41:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag41(PACT_4_LEADER)', 0, 4))
	_uEndActions41:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 4))
	_uEndActions41 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState98, _uBeginState, "State_98", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_4_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState6 = nil
_uState10 = nil
_uState12 = nil
_uState18 = nil
_uState21 = nil
_uState25 = nil
_uState30 = nil
_uState35 = nil
_uState40 = nil
_uState45 = nil
_uState47 = nil
_uState50 = nil
_uState52 = nil
_uState56 = nil
_uState60 = nil
_uState65 = nil
_uState70 = nil
_uState75 = nil
_uState81 = nil
_uState84 = nil
_uState88 = nil
_uState90 = nil
_uState92 = nil
_uState94 = nil
_uState98 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("pact_4_leader_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/horseman_BeginDialog.tak', 'pl_HumanAvatar', 'pact_4_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PACT_4_LEADER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

