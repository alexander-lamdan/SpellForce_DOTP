local _uSM = GdsCreateStateMachine ("pact_3_leader_Dialog")

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
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('pact_3_leader'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(PACT_3_LEADER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(PACT_3_LEADER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('pact_3_leader', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: label
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "pact_3_leader"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(PACT_3_LEADER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("pact_3_leader")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(PACT_3_LEADER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: label
_uState2Trans2 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_007PC", "Do you know about the Demons, lurking in the Center of the City?", 99, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_008", "Demons? What demons?", 107, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_009PC", "The ones I just fought back, before reaching your camp?", 108, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_010", "I doubt they will pose a great threat if you were able to defeat them.", 109, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P3_Demons_Done', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: label
_uState2Trans3 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_011PC", "I'd like to form an alliance with the Sinistrim.", 99, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_012", "An alliance? With a bloodtr… With the Shaikan?", 111, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_013PC", "Come, Sinistra. Let's drop the pretensions. You don't like me and I don't like you. But we could be useful to one another, that's why I proposed an alliance.", 112, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_014", "I should have ripped your tongue out when I had the chance, Shaikan. There will be no alliance between us, no matter how much you play the soothsayer.", 113, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_015PC", "It was worth a try.", 114, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P3_Alliance_Done', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: label
_uState2Trans4 = GdsCreateTransition (_uState10, _uState2, "State_10", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_029PC", "What levers are you talking about?", 99, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_030", "Within this city we found several levers. They seemed to operate several gates, which are otherwise hidden within the walls of this city.", 129, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_031PC", "This could come in handy for sneak attacks.", 130, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_032", "You're starting to get the picture.", 131, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P3_Local_Done', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: label
_uState2Trans5 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_033PC", "During your time here, did you learn anything about a being called Zazhut?", 99, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_034", "Ah yes, the Warlord from the Elemental sea.", 133, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_035PC", "The Warlord from the Elemental sea?", 134, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_036", "That's what the Shapers used to call him. His real name in the Shaper tongue is Zalutik Zhutan aim, but they reduced it to Zazhut. He must have been very powerful. They couldn't defeat him and his abominable creatures, so they asked their friend, the Guardian God Ulme, for help.", 135, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_037PC", "I don't recall hearing from a Guardian God Ulme. Who is he?", 136, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_038", "You're just too barbarian to know, Dragonblood! Ulme was the Guardian God of Creation before he rebelled against his father Aonir and his fellow Guardians and became the one who drinks the blood of the world.", 137, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_039PC", "You mean …?", 138, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_040", "Yes, Shaikan. Zarach once was called Ulme and was peacful and friendly with life. Whatever changed him I don't know. But we're greatful for it.", 139, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_041PC", "Thank you Sinistra, this has been surprisingly helpful.", 140, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P3_Zazhut_Done', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState2Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P3_Demons_Done', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_007PC", "Do you know about the Demons, lurking in the Center of the City?", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P3_Alliance_Done', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_011PC", "I'd like to form an alliance with the Sinistrim.", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P3_Local_Done', 0, 2))
	_uState6Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_016PC", "I'm in search for information. Is there anything, you might be able to tell us about this place?", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P3_Zazhut_Done', 0, 2))
	_uState6Trans4:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_033PC", "During your time here, did you learn anything about a being called Zazhut?", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 2))
	_uState6Trans5:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_042PC", "The question is rather, how may I help you?", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 2))
	_uState6Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2A_WIPEP1_TALKP3', 1))
	_uState6Trans6:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 6, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 2))
	_uState6Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2C_WIPEP4_TALKP3', 1))
	_uState6Trans7:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 7, 16777215))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 2))
	_uState6Trans8:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4A_WIPEP2_TALKP3', 1))
	_uState6Trans8:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 8, 16777215))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 2))
	_uState6Trans9:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_TALKP3', 1))
	_uState6Trans9:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 9, 16777215))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionShowChoices())
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2))
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2))
	_uState6Trans11:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))
	_uState6Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState6Trans11:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 105, 16777215))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2))
	_uState6Trans12:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_001", "Nor help us, a dragonblood!", 100, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_002PC", "I'm always happy to find a friendly face in unfriendly circumstances, Sinistra.", 101, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_003", "I will have your tongue ripped out of your mouth and hung from the highest tower at Dragh'Lur!", 102, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_004PC", "For that, you'd first have to return there. Let's see, how you might get there. Oh dear. It's the City Ship that brought you here and will bring you home again. I'm not sure my people will react friendly to such an offense.", 103, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_005", "Well *cough* I think this is all a big misunderstanding. I welcome thee to our camp, Shaikan. What can the Sinistrim do to help you?", 104, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'mf_P704_Pact3LeaderKnown', 1, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState6Trans12 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState10Trans1 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState10Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_018PC", "Information about the enemies is always useful.", 1, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: choice
_uState10Trans2 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState10Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_029PC", "What levers are you talking about?", 2, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: choice
_uState10Trans3 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionShowChoices())
	_uState10Trans3 = nil

-- TO STATE: choice
_uState10Trans4 = GdsCreateTransition (_uState6, _uState10, "State_6", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_016PC", "I'm in search for information. Is there anything, you might be able to tell us about this place?", 99, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_017", "I am a well of information. Would you like to know something about our enemies, about some strange levers we found or about a way, how you could help us become stronger.", 116, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState10Trans4 = nil

-- TO STATE: choice
_uState10Trans5 = GdsCreateTransition (_uState12, _uState10, "State_12", "State_10_T5", "Dialog")
	_uState10Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState10Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_026PC", "Tell me about the Dracon. What should I know?", 99, 16777215))
	_uState10Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_027", "Now he calls himself a Dracon and is proud of his new brotherhood with the Emperess. But when I'll be Emperess he will regret ever having left the Sinistrim!", 126, 16777215))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState10Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_028", "Be careful with him, Shaikan. You can't trust him.", 127, 16777215))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState10Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState12Trans1 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState12Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_020PC", "I'd like to know something about Archon Liriel.", 1, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: choice
_uState12Trans2 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState12Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_024PC", "Some information about Archon Dor'mat would be welcome.", 2, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: choice
_uState12Trans3 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState12Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_026PC", "Tell me about the Dracon. What should I know?", 3, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: choice
_uState12Trans4 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionShowChoices())
	_uState12Trans4 = nil

-- TO STATE: choice
_uState12Trans5 = GdsCreateTransition (_uState10, _uState12, "State_10", "State_12_T5", "Dialog")
	_uState12Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState12Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_018PC", "Information about the enemies is always useful.", 99, 16777215))
	_uState12Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_019", "Would you rather know something about Archon Liriel, Archon Dor'Mat or that traitor Dracon Shur Tal'in?", 118, 16777215))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans5 = nil

-- TO STATE: choice
_uState12Trans6 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T6", "Dialog")
	_uState12Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState12Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_020PC", "I'd like to know something about Archon Liriel.", 99, 16777215))
	_uState12Trans6:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_021", "Archon Liriel is ambitious as a Norcaine can be. She has worked herself up within the ranks of the Archon, quicker than any other in her caste before.", 120, 16777215))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState12Trans6:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_022", "I'm sure she'd do anything to further her ambitions.", 121, 16777215))
	_uState12Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_023PC", "I might know someone just like her…", 122, 16777215))
	_uState12Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans6 = nil

-- TO STATE: choice
_uState12Trans7 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T7", "Dialog")
	_uState12Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState12Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_024PC", "Some information about Archon Dor'mat would be welcome.", 99, 16777215))
	_uState12Trans7:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_025", "Archon Dor'Mat is a treacherous coward. He kidnapped my assistant while everyone was fighting and will surely try to use the notes to his advantage.", 124, 16777215))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState12Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState12Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState18Trans1 = GdsCreateTransition (_uState6, _uState18, "State_6", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 5))
	_uState18Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_042PC", "The question is rather, how may I help you?", 99, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState18Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState21Trans1 = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState21Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_047PC", "A diplomatic mission then? Very well, Sinistra.", 1, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState21Trans1 = nil

-- TO STATE: choice
_uState21Trans2 = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21_T2", "Dialog")
	_uState21Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState21Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_048PC", "I have to consider my options, Sinistra. I'll be back.", 2, 16777215))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState21Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState21Trans2 = nil

-- TO STATE: choice
_uState21Trans3 = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21_T3", "Dialog")
	_uState21Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState21Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState21Trans3:AddAction (CScriptActionShowChoices())
	_uState21Trans3 = nil

-- TO STATE: choice
_uState21Trans4 = GdsCreateTransition (_uState18, _uState21, "State_18", "State_21_T4", "Dialog")
	_uState21Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))) ))
	_uState21Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_044", "I intend to eradicate the Archon camp. Then I will burn the Archon Dor'mat and eat his intestines …", 143, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_045", "Finally I will take what's mine … I mean ours … and return to Shal triumphant.", 144, 16777215))
	_uState21Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_046", "If you want to be of any more use than providing transportation for the new Emperess of the Norcaine, you might ask those two idiots who lead the other camps to join me in my triumph or be swept away by the wrath of the Sinistrim!", 145, 16777215))
	_uState21Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState21Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState25Trans1 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState25Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState25Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 1, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: choice
_uState25Trans2 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState25Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState25Trans2 = nil

-- TO STATE: choice
_uState25Trans3 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T3", "Dialog")
	_uState25Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState25Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState25Trans3 = nil

-- TO STATE: choice
_uState25Trans4 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T4", "Dialog")
	_uState25Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState25Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState25Trans4:AddAction (CScriptActionShowChoices())
	_uState25Trans4 = nil

-- TO STATE: choice
_uState25Trans5 = GdsCreateTransition (_uState6, _uState25, "State_6", "State_25_T5", "Dialog")
	_uState25Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 6))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 149, 16777215))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 150, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 151, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 152, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 153, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 154, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 155, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 156, 16777215))
	_uState25Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 157, 16777215))
	_uState25Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState25Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState30Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_074PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 1, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState30Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState30Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState30Trans3 = nil

-- TO STATE: choice
_uState30Trans4 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T4", "Dialog")
	_uState30Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState30Trans4:AddAction (CScriptActionShowChoices())
	_uState30Trans4 = nil

-- TO STATE: choice
_uState30Trans5 = GdsCreateTransition (_uState6, _uState30, "State_6", "State_30_T5", "Dialog")
	_uState30Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 7))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 164, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 165, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 166, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 167, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 168, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 169, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 170, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 171, 16777215))
	_uState30Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 172, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState30Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState35Trans1 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T1", "Dialog")
	_uState35Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState35Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState35Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_089PC", "But maybe Archon Liriel took them. She seemd quite content when I talked with her.", 1, 16777215))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState35Trans1 = nil

-- TO STATE: choice
_uState35Trans2 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T2", "Dialog")
	_uState35Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState35Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState35Trans2 = nil

-- TO STATE: choice
_uState35Trans3 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T3", "Dialog")
	_uState35Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState35Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState35Trans3 = nil

-- TO STATE: choice
_uState35Trans4 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T4", "Dialog")
	_uState35Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState35Trans4:AddAction (CScriptActionShowChoices())
	_uState35Trans4 = nil

-- TO STATE: choice
_uState35Trans5 = GdsCreateTransition (_uState6, _uState35, "State_6", "State_35_T5", "Dialog")
	_uState35Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 8))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 179, 16777215))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 180, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 181, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 182, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 183, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 184, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 185, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 186, 16777215))
	_uState35Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 187, 16777215))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState35Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState35, _uBeginState, "State_35", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState40Trans1 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T1", "Dialog")
	_uState40Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState40Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState40Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 1, 16777215))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState40Trans1 = nil

-- TO STATE: choice
_uState40Trans2 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T2", "Dialog")
	_uState40Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState40Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState40Trans2 = nil

-- TO STATE: choice
_uState40Trans3 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T3", "Dialog")
	_uState40Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState40Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState40Trans3 = nil

-- TO STATE: choice
_uState40Trans4 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T4", "Dialog")
	_uState40Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState40Trans4:AddAction (CScriptActionShowChoices())
	_uState40Trans4 = nil

-- TO STATE: choice
_uState40Trans5 = GdsCreateTransition (_uState6, _uState40, "State_6", "State_40_T5", "Dialog")
	_uState40Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 9))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 194, 16777215))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_3_LEADER)', 0, 4))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 195, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 196, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 197, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 198, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 199, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 200, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 201, 16777215))
	_uState40Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 202, 16777215))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState40Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState40, _uBeginState, "State_40", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState45Trans1 = GdsCreateTransition (_uState2, _uState45, "State_2", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))
	_uState45Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState45Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2))
	_uState45Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState45Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 210, 16777215))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState45Trans1 = nil

-- TO STATE: elseif
_uState45Trans2 = GdsCreateTransition (_uState2, _uState45, "State_2", "State_45_T2", "Dialog")
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 1, 2))
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2))
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState45Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2)) ))
	_uState45Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 324, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_226PC", "Dracon Shur Tal'in is at the Mor Duine.", 325, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_227", "That is great news, Shaikan! Nor is with us.", 326, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_228PC", "They were brave soldiers, Sinistra. We should mourn their loss.", 327, 16777215))
	_uState45Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_229", "Brave soldiers? Mourn their loss? Are all Shaikan such weaklings?", 328, 16777215))
	_uState45Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState45Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState47Trans1 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T1", "Dialog")
	_uState47Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState47Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_113PC", "*** Allright, let's do it!", 1, 16777215))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState47Trans1 = nil

-- TO STATE: choice
_uState47Trans2 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T2", "Dialog")
	_uState47Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState47Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_124PC", "*** Let me think about that.", 2, 16777215))
	_uState47Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState47Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState47Trans2 = nil

-- TO STATE: choice
_uState47Trans3 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T3", "Dialog")
	_uState47Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState47Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState47Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState47Trans3:AddAction (CScriptActionShowChoices())
	_uState47Trans3 = nil

-- TO STATE: choice
_uState47Trans4 = GdsCreateTransition (_uState45, _uState47, "State_45", "State_47_T4", "Dialog")
	_uState47Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_112", "Only me and Liriel left. Such a pity that soon only me will be left.", 211, 16777215))
	_uState47Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState47Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState47, _uBeginState, "State_47", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState50Trans1 = GdsCreateTransition (_uState2, _uState50, "State_2", "State_50_T1", "Dialog")
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))
	_uState50Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState50Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2))
	_uState50Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState50Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState50Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 224, 16777215))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState50Trans1 = nil

-- TO STATE: elseif
_uState50Trans2 = GdsCreateTransition (_uState2, _uState50, "State_2", "State_50_T2", "Dialog")
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 1, 2))
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2))
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2)) ))
	_uState50Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState50Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 329, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_231PC", "Archon Liriel is at the Mor Duine.", 330, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_232", "Nor guide her soul safely across.", 331, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_233PC", "Such friendly words from your lips?", 332, 16777215))
	_uState50Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_234", "Women in leading positions share a special bond, Shaikan. Not so with the men.", 333, 16777215))
	_uState50Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState50Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState50, _uBeginState, "State_50", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState52Trans1 = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52_T1", "Dialog")
	_uState52Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState52Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_127PC", "*** Allright, let's do it!", 1, 16777215))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState52Trans1 = nil

-- TO STATE: choice
_uState52Trans2 = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52_T2", "Dialog")
	_uState52Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState52Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_138PC", "*** Let me think about that.", 2, 16777215))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState52Trans2 = nil

-- TO STATE: choice
_uState52Trans3 = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52_T3", "Dialog")
	_uState52Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState52Trans3:AddAction (CScriptActionShowChoices())
	_uState52Trans3 = nil

-- TO STATE: choice
_uState52Trans4 = GdsCreateTransition (_uState50, _uState52, "State_50", "State_52_T4", "Dialog")
	_uState52Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_126", "I wouldn't have thought, that those cowards would hold out that long. Probably they hid somewhere not to be hit! *Laughs hysterically*", 225, 16777215))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState52Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState52, _uBeginState, "State_52", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState56Trans1 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T1", "Dialog")
	_uState56Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState56Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState56Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_144PC", "The Dracon as soldiers pose a threat to your authority. Why not make them a gift to Nor?", 1, 16777215))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans1 = nil

-- TO STATE: choice
_uState56Trans2 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T2", "Dialog")
	_uState56Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState56Trans2:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState56Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_149PC", "I guess that Archon Liriel would be an adequate gift.", 2, 16777215))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans2 = nil

-- TO STATE: choice
_uState56Trans3 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T3", "Dialog")
	_uState56Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState56Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2A_WIPEP1_TALKP3', 1))
	_uState56Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 3, 16777215))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans3 = nil

-- TO STATE: choice
_uState56Trans4 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T4", "Dialog")
	_uState56Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 2))
	_uState56Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ2C_WIPEP4_TALKP3', 1))
	_uState56Trans4:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 4, 16777215))
	_uState56Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 1, 4))
	_uState56Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans4 = nil

-- TO STATE: choice
_uState56Trans5 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T5", "Dialog")
	_uState56Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 2))
	_uState56Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4A_WIPEP2_TALKP3', 1))
	_uState56Trans5:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 5, 16777215))
	_uState56Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 1, 4))
	_uState56Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans5 = nil

-- TO STATE: choice
_uState56Trans6 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T6", "Dialog")
	_uState56Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 2))
	_uState56Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4B_WIPEP1_TALKP3', 1))
	_uState56Trans6:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 6, 16777215))
	_uState56Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 1, 4))
	_uState56Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans6 = nil

-- TO STATE: choice
_uState56Trans7 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T7", "Dialog")
	_uState56Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 2))
	_uState56Trans7:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_214PC", "I doubt, that I am wise enough to counsel you on this matter.", 7, 16777215))
	_uState56Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 1, 4))
	_uState56Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans7 = nil

-- TO STATE: choice
_uState56Trans8 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T8", "Dialog")
	_uState56Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState56Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState56Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans8:AddAction (CScriptActionShowChoices())
	_uState56Trans8 = nil

-- TO STATE: choice
_uState56Trans9 = GdsCreateTransition (_uState2, _uState56, "State_2", "State_56_T9", "Dialog")
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))
	_uState56Trans9:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState56Trans9:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState56Trans9:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2))
	_uState56Trans9:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState56Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState56Trans9:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 238, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_140PC", "Archon Dor'Mat is dead.", 239, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_141", "*Laughs hysterically* That is great news, Shaikan! Nor is with us.", 240, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_142PC", "Of course, Sinistra. Especially with you.", 241, 16777215))
	_uState56Trans9:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_143", "Which of the leaders could we send to Nor as a thank you gift?", 242, 16777215))
	_uState56Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState56Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState56, _uBeginState, "State_56", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState60Trans1 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T1", "Dialog")
	_uState60Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState60Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState60Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 1, 16777215))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState60Trans1 = nil

-- TO STATE: choice
_uState60Trans2 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T2", "Dialog")
	_uState60Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState60Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState60Trans2 = nil

-- TO STATE: choice
_uState60Trans3 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T3", "Dialog")
	_uState60Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState60Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState60Trans3 = nil

-- TO STATE: choice
_uState60Trans4 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T4", "Dialog")
	_uState60Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState60Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState60Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState60Trans4:AddAction (CScriptActionShowChoices())
	_uState60Trans4 = nil

-- TO STATE: choice
_uState60Trans5 = GdsCreateTransition (_uState56, _uState60, "State_56", "State_60_T5", "Dialog")
	_uState60Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 254, 16777215))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 255, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 256, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 257, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 258, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 259, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 260, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 261, 16777215))
	_uState60Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 262, 16777215))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState60Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState60, _uBeginState, "State_60", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState65Trans1 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T1", "Dialog")
	_uState65Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState65Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_074PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 1, 16777215))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState65Trans1 = nil

-- TO STATE: choice
_uState65Trans2 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T2", "Dialog")
	_uState65Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState65Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState65Trans2 = nil

-- TO STATE: choice
_uState65Trans3 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T3", "Dialog")
	_uState65Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState65Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState65Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState65Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState65Trans3 = nil

-- TO STATE: choice
_uState65Trans4 = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65_T4", "Dialog")
	_uState65Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState65Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState65Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState65Trans4:AddAction (CScriptActionShowChoices())
	_uState65Trans4 = nil

-- TO STATE: choice
_uState65Trans5 = GdsCreateTransition (_uState56, _uState65, "State_56", "State_65_T5", "Dialog")
	_uState65Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 269, 16777215))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 270, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 271, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 272, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 273, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 274, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 275, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 276, 16777215))
	_uState65Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 277, 16777215))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState65Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState65, _uBeginState, "State_65", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState70Trans1 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T1", "Dialog")
	_uState70Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState70Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState70Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_089PC", "But maybe Archon Liriel took them. She seemd quite content when I talked with her.", 1, 16777215))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState70Trans1 = nil

-- TO STATE: choice
_uState70Trans2 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T2", "Dialog")
	_uState70Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState70Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState70Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState70Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState70Trans2 = nil

-- TO STATE: choice
_uState70Trans3 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T3", "Dialog")
	_uState70Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState70Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState70Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState70Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState70Trans3 = nil

-- TO STATE: choice
_uState70Trans4 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T4", "Dialog")
	_uState70Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState70Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState70Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState70Trans4:AddAction (CScriptActionShowChoices())
	_uState70Trans4 = nil

-- TO STATE: choice
_uState70Trans5 = GdsCreateTransition (_uState56, _uState70, "State_56", "State_70_T5", "Dialog")
	_uState70Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 5))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 284, 16777215))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 285, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 286, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 287, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 288, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 289, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 290, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 291, 16777215))
	_uState70Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 292, 16777215))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState70Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState70, _uBeginState, "State_70", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState75Trans1 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T1", "Dialog")
	_uState75Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 2))
	_uState75Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_1_Leader'))
	_uState75Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 1, 16777215))
	_uState75Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 1, 4))
	_uState75Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState75Trans1 = nil

-- TO STATE: choice
_uState75Trans2 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T2", "Dialog")
	_uState75Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 2))
	_uState75Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 2, 16777215))
	_uState75Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 1, 4))
	_uState75Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState75Trans2 = nil

-- TO STATE: choice
_uState75Trans3 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T3", "Dialog")
	_uState75Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 2))
	_uState75Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 3, 16777215))
	_uState75Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 1, 4))
	_uState75Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState75Trans3 = nil

-- TO STATE: choice
_uState75Trans4 = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75_T4", "Dialog")
	_uState75Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 2))
	_uState75Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 0, 4))
	_uState75Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_3_LEADER)', 1, 4))
	_uState75Trans4:AddAction (CScriptActionShowChoices())
	_uState75Trans4 = nil

-- TO STATE: choice
_uState75Trans5 = GdsCreateTransition (_uState56, _uState75, "State_56", "State_75_T5", "Dialog")
	_uState75Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 6))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_049PC", "It seems, that some Norcaine are not so courteous to our people as you are.", 99, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_050", "The Sinistrim have always been the most diplomatic caste among the Norcaine. Not like those criminal Archons or even worse - those Barbarians, who dare call themselves Dracon!", 299, 16777215))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_051PC", "Is your dislike towards the other castes fueld by your high standards or by your wish to keep Ani'Hus notes to yourself?", 300, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_052", "How …?", 301, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_053PC", "I'm an Elder of the Shaikan, Sinistra and on speaking terms with your Emperess. Of course I know such things.", 302, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_054", "Those Dracon thought they could hold us off by citing that silly legend of the Nal'Drommar. And then those treacherous Archon. ", 303, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_055", "I should have known that Dor'mat was planning something. He always wanted to curry favour with the Emperess.", 304, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_056", "But he will pay dearly for his treachery! It's because of him, that the scroll with the notes has been lost.", 305, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_057PC", "The notes are lost?", 306, 16777215))
	_uState75Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_058", "They were carried by my assistant Minara. But Minara never arrived here, so I assume Dor'mat has them now!", 307, 16777215))
	_uState75Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState75Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState75, _uState75, "State_75", "State_75", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState75, _uBeginState, "State_75", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState81Trans1 = GdsCreateTransition (_uState2, _uState81, "State_2", "State_81_T1", "Dialog")
	_uState81Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2))
	_uState81Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState81Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState81Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 317, 16777215))
	_uState81Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState81Trans1 = nil

-- TO STATE: elseif
_uState81Trans2 = GdsCreateTransition (_uState2, _uState81, "State_2", "State_81_T2", "Dialog")
	_uState81Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1))
	_uState81Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState81Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState81Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 314, 16777215))
	_uState81Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_216PC", "I'm intrigued what the armour and weapons will look like when forged from these remains. Here are your 20 bones.", 315, 16777215))
	_uState81Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_217", "Thank you, Shaikan. Now we'll be even stronger.", 316, 16777215))
	_uState81Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveArtifactP3', 1, 4))
	_uState81Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState81Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState81, _uState81, "State_81", "State_81", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState81, _uBeginState, "State_81", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState84Trans1 = GdsCreateTransition (_uState2, _uState84, "State_2", "State_84_T1", "Dialog")
	_uState84Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2))
	_uState84Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState84Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState84Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 322, 16777215))
	_uState84Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState84Trans1 = nil

-- TO STATE: elseif
_uState84Trans2 = GdsCreateTransition (_uState2, _uState84, "State_2", "State_84_T2", "Dialog")
	_uState84Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1))
	_uState84Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState84Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState84Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 319, 16777215))
	_uState84Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_216PC", "I'm intrigued what the armour and weapons will look like when forged from these remains. Here are your 20 bones.", 320, 16777215))
	_uState84Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_217", "Thank you, Shaikan. Now we'll be even stronger.", 321, 16777215))
	_uState84Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveArtifactP3', 1, 4))
	_uState84Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState84Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState84, _uState84, "State_84", "State_84", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState84, _uBeginState, "State_84", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState88Trans1 = GdsCreateTransition (_uState2, _uState88, "State_2", "State_88_T1", "Dialog")
	_uState88Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 1, 2))
	_uState88Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3D_Completed', 0, 2))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2)) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState88Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 334, 16777215))
	_uState88Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState88Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState88, _uBeginState, "State_88", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState90Trans1 = GdsCreateTransition (_uState88, _uState90, "State_88", "State_90_T1", "Dialog")
	_uState90Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3D_WIPEP1_RETRIEVEBONESP3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 679, 1, 1, 1)) ))
	_uState90Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState90Trans1 = nil

-- TO STATE: else
_uState90Trans2 = GdsCreateTransition (_uState88, _uState90, "State_88", "State_90_T2", "Dialog")
	_uState90Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3D_WIPEP1_RETRIEVEBONESP3', 1))
	_uState90Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 679, 1, 1, 1))
	_uState90Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_236PC", "Here you have your crystals, Sinistra. May the enlighten you.", 335, 16777215))
	_uState90Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_237", "Thank you, Shaikan. Now we'll be even stronger.", 336, 16777215))
	_uState90Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveBonesP3', 1, 4))
	_uState90Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState90Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState90, _uState90, "State_90", "State_90", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState90, _uBeginState, "State_90", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState92Trans1 = GdsCreateTransition (_uState2, _uState92, "State_2", "State_92_T1", "Dialog")
	_uState92Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 1, 2))
	_uState92Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3E_Completed', 0, 2))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2)) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState92Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3D_Completed', 0, 2)) ))
	_uState92Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 338, 16777215))
	_uState92Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState92Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState92, _uState92, "State_92", "State_92", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState92, _uBeginState, "State_92", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState94Trans1 = GdsCreateTransition (_uState92, _uState94, "State_92", "State_94_T1", "Dialog")
	_uState94Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3E_WIPEP2_RETRIEVEBONESP3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 679, 1, 1, 1)) ))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState94Trans1 = nil

-- TO STATE: else
_uState94Trans2 = GdsCreateTransition (_uState92, _uState94, "State_92", "State_94_T2", "Dialog")
	_uState94Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3E_WIPEP2_RETRIEVEBONESP3', 1))
	_uState94Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 679, 1, 1, 1))
	_uState94Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_236PC", "Here you have your crystals, Sinistra. May the enlighten you.", 339, 16777215))
	_uState94Trans2:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_237", "Thank you, Shaikan. Now we'll be even stronger.", 340, 16777215))
	_uState94Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveBonesP3', 1, 4))
	_uState94Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState94Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState94, _uState94, "State_94", "State_94", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState94, _uBeginState, "State_94", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState98Trans1 = GdsCreateTransition (_uState18, _uState98, "State_18", "State_98_T1", "Dialog")
	_uState98Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState98Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ))
	_uState98Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState98Trans1:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_043", "Archon Dor'Mat really held out that long?  Let's help him and the rest of his Archons to join Archon Liriel at the River of Souls.", 142, 16777215))
	_uState98Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PACT_3_LEADER)', 1, 4))
	_uState98Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans1 = nil

-- TO STATE: endconversation
_uState98Trans2 = GdsCreateTransition (_uState21, _uState98, "State_21", "State_98_T2", "Dialog")
	_uState98Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_047PC", "A diplomatic mission then? Very well, Sinistra.", 99, 16777215))
	_uState98Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PACT_3_LEADER)', 1, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans2 = nil

-- TO STATE: endconversation
_uState98Trans3 = GdsCreateTransition (_uState21, _uState98, "State_21", "State_98_T3", "Dialog")
	_uState98Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_048PC", "I have to consider my options, Sinistra. I'll be back.", 99, 16777215))
	_uState98Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PACT_3_LEADER)', 1, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans3 = nil

-- TO STATE: endconversation
_uState98Trans4 = GdsCreateTransition (_uState25, _uState98, "State_25", "State_98_T4", "Dialog")
	_uState98Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 99, 16777215))
	_uState98Trans4:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_060", "Of course! He had all this staged, because he wanted to have the notes to himself! He will pay dearly. Attack, Sinistrim!", 159, 16777215))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(PACT_3_LEADER)', 1, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans4 = nil

-- TO STATE: endconversation
_uState98Trans5 = GdsCreateTransition (_uState25, _uState98, "State_25", "State_98_T5", "Dialog")
	_uState98Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans5:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 161, 16777215))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(PACT_3_LEADER)', 1, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans5 = nil

-- TO STATE: endconversation
_uState98Trans6 = GdsCreateTransition (_uState25, _uState98, "State_25", "State_98_T6", "Dialog")
	_uState98Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(PACT_3_LEADER)', 1, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans6 = nil

-- TO STATE: endconversation
_uState98Trans7 = GdsCreateTransition (_uState30, _uState98, "State_30", "State_98_T7", "Dialog")
	_uState98Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_074PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 99, 16777215))
	_uState98Trans7:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_075", "Don't try to flatter me, Shaikan. I'm a Dracon. I live to master challenges, noone else would conquer.", 174, 16777215))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(PACT_3_LEADER)', 1, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans7 = nil

-- TO STATE: endconversation
_uState98Trans8 = GdsCreateTransition (_uState30, _uState98, "State_30", "State_98_T8", "Dialog")
	_uState98Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans8:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 176, 16777215))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(PACT_3_LEADER)', 1, 4))
	_uState98Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans8 = nil

-- TO STATE: endconversation
_uState98Trans9 = GdsCreateTransition (_uState30, _uState98, "State_30", "State_98_T9", "Dialog")
	_uState98Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(PACT_3_LEADER)', 1, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans9 = nil

-- TO STATE: endconversation
_uState98Trans10 = GdsCreateTransition (_uState35, _uState98, "State_35", "State_98_T10", "Dialog")
	_uState98Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_089PC", "But maybe Archon Liriel took them. She seemd quite content when I talked with her.", 99, 16777215))
	_uState98Trans10:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_090", "That's why she seperated from the other Archons! That treacherous beast. She will pay dearly. Attack, Sinistrim!", 189, 16777215))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(PACT_3_LEADER)', 1, 4))
	_uState98Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans10 = nil

-- TO STATE: endconversation
_uState98Trans11 = GdsCreateTransition (_uState35, _uState98, "State_35", "State_98_T11", "Dialog")
	_uState98Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans11:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 191, 16777215))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(PACT_3_LEADER)', 1, 4))
	_uState98Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans11 = nil

-- TO STATE: endconversation
_uState98Trans12 = GdsCreateTransition (_uState35, _uState98, "State_35", "State_98_T12", "Dialog")
	_uState98Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(PACT_3_LEADER)', 1, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans12 = nil

-- TO STATE: endconversation
_uState98Trans13 = GdsCreateTransition (_uState40, _uState98, "State_40", "State_98_T13", "Dialog")
	_uState98Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 99, 16777215))
	_uState98Trans13:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_060", "Of course! He had all this staged, because he wanted to have the notes to himself! He will pay dearly. Attack, Sinistrim!", 204, 16777215))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(PACT_3_LEADER)', 1, 4))
	_uState98Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans13 = nil

-- TO STATE: endconversation
_uState98Trans14 = GdsCreateTransition (_uState40, _uState98, "State_40", "State_98_T14", "Dialog")
	_uState98Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans14:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 206, 16777215))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(PACT_3_LEADER)', 1, 4))
	_uState98Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans14 = nil

-- TO STATE: endconversation
_uState98Trans15 = GdsCreateTransition (_uState40, _uState98, "State_40", "State_98_T15", "Dialog")
	_uState98Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(PACT_3_LEADER)', 1, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans15 = nil

-- TO STATE: endconversation
_uState98Trans16 = GdsCreateTransition (_uState2, _uState98, "State_2", "State_98_T16", "Dialog")
	_uState98Trans16:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2))
	_uState98Trans16:AddCondition (CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2))
	_uState98Trans16:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState98Trans16:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState98Trans16:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 208, 16777215))
	_uState98Trans16:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_110", "*** I hope our alliance is doing well against Archon Dor'Mat.", 209, 16777215))
	_uState98Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(PACT_3_LEADER)', 1, 4))
	_uState98Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans16 = nil

-- TO STATE: endconversation
_uState98Trans17 = GdsCreateTransition (_uState47, _uState98, "State_47", "State_98_T17", "Dialog")
	_uState98Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_113PC", "*** Allright, let's do it!", 99, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_114", "Shaikan, we haven't been able to summon a titan to our aid.", 213, 16777215))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_115PC", "What can I do?", 214, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_116", "I need some crystals to hold the energy of a summoning circle.", 215, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_117PC", "A summoning circle? For a titan?", 216, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_118", "Yes, that's how we do it. And that's why our titans are among the strongest creatures on the face of Eo.", 217, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_119PC", "All right. Anything else?", 218, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_120", "We need chalk to form the summoning circle, the book of Lor'nik for the Titan incantation and fresh blood as a gift to the titan.", 219, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_121PC", "Oh great. I'll see, what I can do.", 220, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_122", "Don't be an idi… don't be ridiculous, Shaikan. I have everything here, except for the crystals. Clear?", 221, 16777215))
	_uState98Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_123PC", "Crystalclear, yes.", 222, 16777215))
	_uState98Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(PACT_3_LEADER)', 1, 4))
	_uState98Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans17 = nil

-- TO STATE: endconversation
_uState98Trans18 = GdsCreateTransition (_uState47, _uState98, "State_47", "State_98_T18", "Dialog")
	_uState98Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_124PC", "*** Let me think about that.", 99, 16777215))
	_uState98Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(PACT_3_LEADER)', 1, 4))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans18 = nil

-- TO STATE: endconversation
_uState98Trans19 = GdsCreateTransition (_uState52, _uState98, "State_52", "State_98_T19", "Dialog")
	_uState98Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_127PC", "*** Allright, let's do it!", 99, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_114", "Shaikan, we haven't been able to summon a titan to our aid.", 227, 16777215))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_115PC", "What can I do?", 228, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_116", "I need some crystals to hold the energy of a summoning circle.", 229, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_117PC", "A summoning circle? For a titan?", 230, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_118", "Yes, that's how we do it. And that's why our titans are among the strongest creatures on the face of Eo.", 231, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_119PC", "All right. Anything else?", 232, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_120", "We need chalk to form the summoning circle, the book of Lor'nik for the Titan incantation and fresh blood as a gift to the titan.", 233, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_121PC", "Oh great. I'll see, what I can do.", 234, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_122", "Don't be an idi… don't be ridiculous, Shaikan. I have everything here, except for the crystals. Clear?", 235, 16777215))
	_uState98Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_123PC", "Crystalclear, yes.", 236, 16777215))
	_uState98Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(PACT_3_LEADER)', 1, 4))
	_uState98Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans19 = nil

-- TO STATE: endconversation
_uState98Trans20 = GdsCreateTransition (_uState52, _uState98, "State_52", "State_98_T20", "Dialog")
	_uState98Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_138PC", "*** Let me think about that.", 99, 16777215))
	_uState98Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(PACT_3_LEADER)', 1, 4))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans20 = nil

-- TO STATE: endconversation
_uState98Trans21 = GdsCreateTransition (_uState56, _uState98, "State_56", "State_98_T21", "Dialog")
	_uState98Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_144PC", "The Dracon as soldiers pose a threat to your authority. Why not make them a gift to Nor?", 99, 16777215))
	_uState98Trans21:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_145", "I doubt those dogs will ever be able to challenge me in any respect. But you should kill mangy dogs as soon as possible, so that's what I'll do.", 244, 16777215))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState98Trans21:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_146", "I need your help again, Shaikan, to strengthen our abilities in battle.", 245, 16777215))
	_uState98Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_147PC", "What can I do?", 246, 16777215))
	_uState98Trans21:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_148", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 247, 16777215))
	_uState98Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(PACT_3_LEADER)', 1, 4))
	_uState98Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans21 = nil

-- TO STATE: endconversation
_uState98Trans22 = GdsCreateTransition (_uState56, _uState98, "State_56", "State_98_T22", "Dialog")
	_uState98Trans22:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_149PC", "I guess that Archon Liriel would be an adequate gift.", 99, 16777215))
	_uState98Trans22:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_150", "Yes I think this ambitious little beast will make a great gift. She probably wouldn't even know what honour I did to her.", 249, 16777215))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState98Trans22:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_146", "I need your help again, Shaikan, to strengthen our abilities in battle.", 250, 16777215))
	_uState98Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_147PC", "What can I do?", 251, 16777215))
	_uState98Trans22:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_148", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 252, 16777215))
	_uState98Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(PACT_3_LEADER)', 1, 4))
	_uState98Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans22 = nil

-- TO STATE: endconversation
_uState98Trans23 = GdsCreateTransition (_uState60, _uState98, "State_60", "State_98_T23", "Dialog")
	_uState98Trans23:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans23:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 99, 16777215))
	_uState98Trans23:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_060", "Of course! He had all this staged, because he wanted to have the notes to himself! He will pay dearly. Attack, Sinistrim!", 264, 16777215))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(PACT_3_LEADER)', 1, 4))
	_uState98Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans23 = nil

-- TO STATE: endconversation
_uState98Trans24 = GdsCreateTransition (_uState60, _uState98, "State_60", "State_98_T24", "Dialog")
	_uState98Trans24:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans24:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans24:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 266, 16777215))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans24:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(PACT_3_LEADER)', 1, 4))
	_uState98Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans24 = nil

-- TO STATE: endconversation
_uState98Trans25 = GdsCreateTransition (_uState60, _uState98, "State_60", "State_98_T25", "Dialog")
	_uState98Trans25:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans25:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans25:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(PACT_3_LEADER)', 1, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans25 = nil

-- TO STATE: endconversation
_uState98Trans26 = GdsCreateTransition (_uState65, _uState98, "State_65", "State_98_T26", "Dialog")
	_uState98Trans26:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_074PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 99, 16777215))
	_uState98Trans26:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_075", "Don't try to flatter me, Shaikan. I'm a Dracon. I live to master challenges, noone else would conquer.", 279, 16777215))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans26:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(PACT_3_LEADER)', 1, 4))
	_uState98Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans26 = nil

-- TO STATE: endconversation
_uState98Trans27 = GdsCreateTransition (_uState65, _uState98, "State_65", "State_98_T27", "Dialog")
	_uState98Trans27:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans27:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans27:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 281, 16777215))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans27:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(PACT_3_LEADER)', 1, 4))
	_uState98Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans27 = nil

-- TO STATE: endconversation
_uState98Trans28 = GdsCreateTransition (_uState65, _uState98, "State_65", "State_98_T28", "Dialog")
	_uState98Trans28:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans28:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans28:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(PACT_3_LEADER)', 1, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans28 = nil

-- TO STATE: endconversation
_uState98Trans29 = GdsCreateTransition (_uState70, _uState98, "State_70", "State_98_T29", "Dialog")
	_uState98Trans29:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans29:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_089PC", "But maybe Archon Liriel took them. She seemd quite content when I talked with her.", 99, 16777215))
	_uState98Trans29:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_090", "That's why she seperated from the other Archons! That treacherous beast. She will pay dearly. Attack, Sinistrim!", 294, 16777215))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans29:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(PACT_3_LEADER)', 1, 4))
	_uState98Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans29 = nil

-- TO STATE: endconversation
_uState98Trans30 = GdsCreateTransition (_uState70, _uState98, "State_70", "State_98_T30", "Dialog")
	_uState98Trans30:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans30:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans30:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 296, 16777215))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans30:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(PACT_3_LEADER)', 1, 4))
	_uState98Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans30 = nil

-- TO STATE: endconversation
_uState98Trans31 = GdsCreateTransition (_uState70, _uState98, "State_70", "State_98_T31", "Dialog")
	_uState98Trans31:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans31:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans31:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(PACT_3_LEADER)', 1, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans31 = nil

-- TO STATE: endconversation
_uState98Trans32 = GdsCreateTransition (_uState75, _uState98, "State_75", "State_98_T32", "Dialog")
	_uState98Trans32:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 1))
	_uState98Trans32:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_059PC", "The Dracon leader had such a smug smile on his face when I saw him. I wonder why.", 99, 16777215))
	_uState98Trans32:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_060", "Of course! He had all this staged, because he wanted to have the notes to himself! He will pay dearly. Attack, Sinistrim!", 309, 16777215))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans32:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag32(PACT_3_LEADER)', 1, 4))
	_uState98Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans32 = nil

-- TO STATE: endconversation
_uState98Trans33 = GdsCreateTransition (_uState75, _uState98, "State_75", "State_98_T33", "Dialog")
	_uState98Trans33:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 2))
	_uState98Trans33:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_061PC", "I spoke with the Archon himself. He insisted that you …", 99, 16777215))
	_uState98Trans33:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_062", "You're in allegiance with that Rat? Begone!", 311, 16777215))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans33:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag33(PACT_3_LEADER)', 1, 4))
	_uState98Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans33 = nil

-- TO STATE: endconversation
_uState98Trans34 = GdsCreateTransition (_uState75, _uState98, "State_75", "State_98_T34", "Dialog")
	_uState98Trans34:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 3))
	_uState98Trans34:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_063PC", "That sounds resonable, Sinistra.", 99, 16777215))
	_uState98Trans34:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag34(PACT_3_LEADER)', 1, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans34 = nil

-- TO STATE: endconversation
_uState98Trans35 = GdsCreateTransition (_uState56, _uState98, "State_56", "State_98_T35", "Dialog")
	_uState98Trans35:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 7))
	_uState98Trans35:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_214PC", "I doubt, that I am wise enough to counsel you on this matter.", 99, 16777215))
	_uState98Trans35:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag35(PACT_3_LEADER)', 1, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_3_LEADER)', 0, 4))
	_uState98Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans35 = nil

-- TO STATE: endconversation
_uState98Trans36 = GdsCreateTransition (_uState81, _uState98, "State_81", "State_98_T36", "Dialog")
	_uState98Trans36:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_219", "*** I hope our alliance is doing well against the Dracons.", 318, 16777215))
	_uState98Trans36:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans36:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag36(PACT_3_LEADER)', 1, 4))
	_uState98Trans36:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans36 = nil

-- TO STATE: endconversation
_uState98Trans37 = GdsCreateTransition (_uState84, _uState98, "State_84", "State_98_T37", "Dialog")
	_uState98Trans37:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_224", "*** I hope our alliance is doing well against Archon Liriel.", 323, 16777215))
	_uState98Trans37:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans37:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag37(PACT_3_LEADER)', 1, 4))
	_uState98Trans37:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans37 = nil

-- TO STATE: endconversation
_uState98Trans38 = GdsCreateTransition (_uState90, _uState98, "State_90", "State_98_T38", "Dialog")
	_uState98Trans38:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_238", "*** I hope our alliance is doing well against the Dracons.", 337, 16777215))
	_uState98Trans38:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans38:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag38(PACT_3_LEADER)', 1, 4))
	_uState98Trans38:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans38 = nil

-- TO STATE: endconversation
_uState98Trans39 = GdsCreateTransition (_uState94, _uState98, "State_94", "State_98_T39", "Dialog")
	_uState98Trans39:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_242", "*** I hope our alliance is doing well against Archon Liriel.", 341, 16777215))
	_uState98Trans39:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans39:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag39(PACT_3_LEADER)', 1, 4))
	_uState98Trans39:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans39 = nil

-- TO STATE: endconversation
_uState98Trans40 = GdsCreateTransition (_uState2, _uState98, "State_2", "State_98_T40", "Dialog")
	_uState98Trans40:AddCondition (CScriptConditionValue('', 'mf_P704_MQ7_Accepted', 1, 2))
	_uState98Trans40:AddCondition (CScriptConditionValue('', 'mf_P704_MQ7_Completed', 0, 2))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3D_Completed', 0, 2)) ))
	_uState98Trans40:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Completed', 0, 2)) ))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_006", "Welcome.", 342, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_244", "Do you hear them cheering? Emperess La'Shut! Emperess La'Shut!", 343, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_245PC", "We couldn't find the notes of Ani'Hu, though. They mysteriously disappeared along with the your Assistant.", 344, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_246", "We see again how useless you Dragonblood are! Dor'Mat must have seized Minara in the chaos and taken the notes!", 345, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_247PC", "I tell you. Minara was nowhere to be found, neither dead nor alive. And I searched Archon Dor'Mats body. I didn't find the notes either on the other leaders.", 346, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_248", "Impossible! You must be telling lies. You must want them for yourself. Yes! That's what it is. You want those notes for yourself! *Laughs hysterically*", 347, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_249PC", "This is ridiculous, Sinistra. Come to your senses. These notes have started a small civil war already here. What do you think would happen, if you'd take them to Shal. You'd not be the glorious Emperess, you wish to be but the Emperess, that brought back the Civil war after the fights had finally abated.", 348, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_250", "But I … But … you … *sighs* I hate to concede, Shaikan, that your words make sense. Now go away and leave me to my sorrow.", 349, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_251", "To get rid of you rather sooner than later let me give you some final guidance.", 350, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_252", "You have seen a lot of the Citadel during this small war. But you haven't seen half of its books. In the north of the city you find a bridge, leading to a small island.", 351, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_253", "There you find an old portal, which can be activated by this journey-crystal. It took us weeks to figure this out.", 352, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_254", "Take it, Shaikan. Find the information you need and let's hope we'll never meet again.", 353, 16777215))
	_uState98Trans40:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT3LEADER_255PC", "Thank you, Sinistra. That is my wish too.", 354, 16777215))
	_uState98Trans40:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans40:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag40(PACT_3_LEADER)', 1, 4))
	_uState98Trans40:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans40 = nil

-- TO STATE: endconversation
_uState98Trans41 = GdsCreateTransition (_uState2, _uState98, "State_2", "State_98_T41", "Dialog")
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_Pact3LeaderKnown', 0, 2) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_4_Leader')))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3A_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_1_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_1_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 0, 2))))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3B_WIPEP1_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_RETRIEVES1P3', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 0, 2))) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3D_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ3E_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ3E_Completed', 0, 2)) ))
	_uState98Trans41:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ7_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ7_Completed', 0, 2)) ))
	_uState98Trans41:AddAction (CScriptActionSay("pact_3_leader", "P704_DLG_PACT3LEADER_256", "*** I am busy right now, come back later...", 355, 16777215))
	_uState98Trans41:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_3_leader"))
	_uState98Trans41:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag41(PACT_3_LEADER)', 1, 4))
	_uState98Trans41:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_3_LEADER)', 1, 4))
	_uState98Trans41 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(PACT_3_LEADER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PACT_3_LEADER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(PACT_3_LEADER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PACT_3_LEADER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(PACT_3_LEADER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PACT_3_LEADER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(PACT_3_LEADER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_P3LeaderTalked', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(PACT_3_LEADER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(PACT_3_LEADER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(PACT_3_LEADER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(PACT_3_LEADER)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(PACT_3_LEADER)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(PACT_3_LEADER)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_P3LeaderTalked', 1, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(PACT_3_LEADER)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(PACT_3_LEADER)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(PACT_3_LEADER)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(PACT_3_LEADER)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(PACT_3_LEADER)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(PACT_3_LEADER)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_P3LeaderTalked', 1, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(PACT_3_LEADER)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(PACT_3_LEADER)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(PACT_3_LEADER)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(PACT_3_LEADER)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(PACT_3_LEADER)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(PACT_3_LEADER)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_P3LeaderTalked', 1, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(PACT_3_LEADER)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(PACT_3_LEADER)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(PACT_3_LEADER)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(PACT_3_LEADER)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(PACT_3_LEADER)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(PACT_3_LEADER)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(PACT_3_LEADER)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(PACT_3_LEADER)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3E_Accepted', 1, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(PACT_3_LEADER)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(PACT_3_LEADER)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(PACT_3_LEADER)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(PACT_3_LEADER)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3D_Accepted', 1, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(PACT_3_LEADER)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(PACT_3_LEADER)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(PACT_3_LEADER)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(PACT_3_LEADER)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 1, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(PACT_3_LEADER)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(PACT_3_LEADER)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 1, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(PACT_3_LEADER)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(PACT_3_LEADER)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_P3LeaderTalked', 1, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(PACT_3_LEADER)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions23 = nil

-- TO SELF: EndConversation Actions #24
_uEndActions24 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_24", "Dialog")
	_uEndActions24:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag24(PACT_3_LEADER)', 1, 2))
	_uEndActions24:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(PACT_3_LEADER)', 0, 4))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions24 = nil

-- TO SELF: EndConversation Actions #25
_uEndActions25 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_25", "Dialog")
	_uEndActions25:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag25(PACT_3_LEADER)', 1, 2))
	_uEndActions25:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(PACT_3_LEADER)', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions25 = nil

-- TO SELF: EndConversation Actions #26
_uEndActions26 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_26", "Dialog")
	_uEndActions26:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag26(PACT_3_LEADER)', 1, 2))
	_uEndActions26:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_P3LeaderTalked', 1, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(PACT_3_LEADER)', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions26 = nil

-- TO SELF: EndConversation Actions #27
_uEndActions27 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_27", "Dialog")
	_uEndActions27:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag27(PACT_3_LEADER)', 1, 2))
	_uEndActions27:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(PACT_3_LEADER)', 0, 4))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions27 = nil

-- TO SELF: EndConversation Actions #28
_uEndActions28 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_28", "Dialog")
	_uEndActions28:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag28(PACT_3_LEADER)', 1, 2))
	_uEndActions28:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(PACT_3_LEADER)', 0, 4))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions28 = nil

-- TO SELF: EndConversation Actions #29
_uEndActions29 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_29", "Dialog")
	_uEndActions29:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag29(PACT_3_LEADER)', 1, 2))
	_uEndActions29:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_P3LeaderTalked', 1, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(PACT_3_LEADER)', 0, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions29 = nil

-- TO SELF: EndConversation Actions #30
_uEndActions30 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_30", "Dialog")
	_uEndActions30:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag30(PACT_3_LEADER)', 1, 2))
	_uEndActions30:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(PACT_3_LEADER)', 0, 4))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions30 = nil

-- TO SELF: EndConversation Actions #31
_uEndActions31 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_31", "Dialog")
	_uEndActions31:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag31(PACT_3_LEADER)', 1, 2))
	_uEndActions31:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(PACT_3_LEADER)', 0, 4))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions31 = nil

-- TO SELF: EndConversation Actions #32
_uEndActions32 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_32", "Dialog")
	_uEndActions32:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag32(PACT_3_LEADER)', 1, 2))
	_uEndActions32:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_P3LeaderTalked', 1, 4))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag32(PACT_3_LEADER)', 0, 4))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions32 = nil

-- TO SELF: EndConversation Actions #33
_uEndActions33 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_33", "Dialog")
	_uEndActions33:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag33(PACT_3_LEADER)', 1, 2))
	_uEndActions33:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions33:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag33(PACT_3_LEADER)', 0, 4))
	_uEndActions33:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions33 = nil

-- TO SELF: EndConversation Actions #34
_uEndActions34 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_34", "Dialog")
	_uEndActions34:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag34(PACT_3_LEADER)', 1, 2))
	_uEndActions34:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions34:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag34(PACT_3_LEADER)', 0, 4))
	_uEndActions34:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions34 = nil

-- TO SELF: EndConversation Actions #35
_uEndActions35 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_35", "Dialog")
	_uEndActions35:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag35(PACT_3_LEADER)', 1, 2))
	_uEndActions35:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions35:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag35(PACT_3_LEADER)', 0, 4))
	_uEndActions35:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions35 = nil

-- TO SELF: EndConversation Actions #36
_uEndActions36 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_36", "Dialog")
	_uEndActions36:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag36(PACT_3_LEADER)', 1, 2))
	_uEndActions36:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions36:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag36(PACT_3_LEADER)', 0, 4))
	_uEndActions36:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions36 = nil

-- TO SELF: EndConversation Actions #37
_uEndActions37 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_37", "Dialog")
	_uEndActions37:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag37(PACT_3_LEADER)', 1, 2))
	_uEndActions37:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions37:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag37(PACT_3_LEADER)', 0, 4))
	_uEndActions37:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions37 = nil

-- TO SELF: EndConversation Actions #38
_uEndActions38 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_38", "Dialog")
	_uEndActions38:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag38(PACT_3_LEADER)', 1, 2))
	_uEndActions38:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions38:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag38(PACT_3_LEADER)', 0, 4))
	_uEndActions38:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions38 = nil

-- TO SELF: EndConversation Actions #39
_uEndActions39 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_39", "Dialog")
	_uEndActions39:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag39(PACT_3_LEADER)', 1, 2))
	_uEndActions39:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions39:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag39(PACT_3_LEADER)', 0, 4))
	_uEndActions39:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions39 = nil

-- TO SELF: EndConversation Actions #40
_uEndActions40 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_40", "Dialog")
	_uEndActions40:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag40(PACT_3_LEADER)', 1, 2))
	_uEndActions40:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'mf_P704_P3LeaderTalkedLast', 1, 4))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag40(PACT_3_LEADER)', 0, 4))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions40 = nil

-- TO SELF: EndConversation Actions #41
_uEndActions41 = GdsCreateTransition (_uState98, _uState98, "State_98", "EndActions_41", "Dialog")
	_uEndActions41:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag41(PACT_3_LEADER)', 1, 2))
	_uEndActions41:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_3_leader"))
	_uEndActions41:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag41(PACT_3_LEADER)', 0, 4))
	_uEndActions41:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 4))
	_uEndActions41 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState98, _uBeginState, "State_98", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_3_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_3_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 4))
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

local _uSM = GdsCreateStateMachine ("pact_3_leader_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PACT_3_LEADER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[193]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[193]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 193))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[182]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[182]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 182))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[183]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[183]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 183))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[184]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[184]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 184))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[185]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[185]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 185))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[186]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[186]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 186))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[187]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[187]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 187))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[188]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[188]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 188))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[190]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[190]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 190))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[192]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[192]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 192))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[189]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[189]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 189))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[191]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[191]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 191))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[194]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[194]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 194))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[195]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[195]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 195))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[196]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[196]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 196))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[197]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[197]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 197))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[198]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[198]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 198))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[199]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[199]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 199))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[200]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[200]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 200))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[201]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[201]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 201))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[202]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[202]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 202))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[203]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[203]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 203))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[205]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[205]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 205))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[207]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[207]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 207))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[204]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[204]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 204))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[206]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[206]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 206))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[208]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[208]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 208))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[209]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[209]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 209))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[210]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[210]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 210))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[211]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[211]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 211))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[212]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[212]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 212))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[223]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[223]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 223))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[213]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[213]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 213))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[214]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[214]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 214))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[215]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[215]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 215))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[216]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[216]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 216))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[217]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[217]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 217))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[218]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[218]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 218))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[219]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[219]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 219))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[220]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[220]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 220))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[221]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[221]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 221))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[222]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[222]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 222))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[224]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[224]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 224))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[225]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[225]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 225))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[226]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[226]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 226))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[237]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[237]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 237))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[227]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[227]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 227))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[228]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[228]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 228))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[229]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[229]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 229))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[230]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[230]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 230))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[231]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[231]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 231))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[232]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[232]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 232))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[233]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[233]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 233))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[234]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[234]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 234))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[235]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[235]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 235))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[236]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[236]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 236))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[238]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[238]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 238))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[239]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[239]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 239))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[240]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[240]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 240))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[241]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[241]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 241))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[242]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[242]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 242))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[243]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[243]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 243))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[248]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[248]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 248))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[253]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[253]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 253))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[268]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[268]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 268))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[283]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[283]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 283))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[298]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[298]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 298))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[313]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[313]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 313))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[244]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[244]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 244))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[245]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[245]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 245))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[246]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[246]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 246))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[247]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[247]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 247))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[249]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[249]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 249))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[250]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[250]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 250))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[251]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[251]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 251))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[252]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[252]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 252))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[254]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[254]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 254))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[255]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[255]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 255))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[256]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[256]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 256))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[257]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[257]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 257))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[258]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[258]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 258))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[259]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[259]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 259))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[260]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[260]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 260))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[261]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[261]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 261))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[262]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[262]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 262))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[263]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[263]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 263))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[265]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[265]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 265))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[267]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[267]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 267))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[264]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[264]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 264))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[266]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[266]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 266))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[269]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[269]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 269))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[270]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[270]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 270))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[271]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[271]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 271))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[272]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[272]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 272))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[273]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[273]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 273))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[274]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[274]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 274))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[275]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[275]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 275))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[276]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[276]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 276))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[277]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[277]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 277))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[278]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[278]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 278))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[280]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[280]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 280))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[282]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[282]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 282))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[279]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[279]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 279))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[281]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[281]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 281))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[284]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[284]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 284))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[285]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[285]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 285))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[286]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[286]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 286))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[287]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[287]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 287))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[288]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[288]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 288))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[289]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[289]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 289))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[290]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[290]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 290))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[291]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[291]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 291))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[292]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[292]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 292))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[293]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[293]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 293))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[295]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[295]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 295))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[297]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[297]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 297))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[294]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[294]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 294))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[296]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[296]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 296))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[299]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[299]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 299))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[300]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[300]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 300))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[301]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[301]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 301))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[302]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[302]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 302))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[303]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[303]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 303))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[304]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[304]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 304))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[305]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[305]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 305))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[306]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[306]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 306))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[307]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[307]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 307))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[308]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[308]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 308))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[310]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[310]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 310))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[312]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[312]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 312))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[309]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[309]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 309))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[311]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[311]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 311))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[314]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[314]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 314))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[315]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[315]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 315))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[316]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[316]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 316))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[317]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[317]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 317))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[318]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[318]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 318))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[319]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[319]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 319))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[320]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[320]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 320))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[321]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[321]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 321))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[322]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[322]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 322))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[323]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[323]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 323))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[324]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[324]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 324))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[325]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[325]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 325))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[326]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[326]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 326))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[327]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[327]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 327))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[328]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[328]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 328))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[329]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[329]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 329))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[330]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[330]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 330))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[331]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[331]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 331))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[332]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[332]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 332))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[333]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[333]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 333))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[334]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[334]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 334))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[335]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[335]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 335))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[336]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[336]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 336))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[337]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[337]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 337))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[338]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[338]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 338))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[339]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[339]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 339))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[340]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[340]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 340))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[341]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[341]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 341))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[342]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[342]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 342))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[343]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[343]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 343))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[344]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[344]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 344))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[345]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[345]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 345))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[346]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[346]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 346))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[347]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[347]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 347))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[348]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[348]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 348))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[349]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[349]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 349))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[350]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[350]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 350))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[351]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[351]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 351))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[352]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[352]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 352))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[353]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[353]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 353))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[354]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[354]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 354))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[355]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[355]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 355))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_3_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_3_leader", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_3_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
