local _uSM = GdsCreateStateMachine ("pact_1_leader_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState13 = GdsCreateState (_uSM, "State_13")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState28 = GdsCreateState (_uSM, "State_28")
_uState31 = GdsCreateState (_uSM, "State_31")
_uState34 = GdsCreateState (_uSM, "State_34")
_uState38 = GdsCreateState (_uSM, "State_38")
_uState40 = GdsCreateState (_uSM, "State_40")
_uState43 = GdsCreateState (_uSM, "State_43")
_uState45 = GdsCreateState (_uSM, "State_45")
_uState49 = GdsCreateState (_uSM, "State_49")
_uState52 = GdsCreateState (_uSM, "State_52")
_uState57 = GdsCreateState (_uSM, "State_57")
_uState60 = GdsCreateState (_uSM, "State_60")
_uState63 = GdsCreateState (_uSM, "State_63")
_uState66 = GdsCreateState (_uSM, "State_66")
_uState69 = GdsCreateState (_uSM, "State_69")
_uState72 = GdsCreateState (_uSM, "State_72")
_uState76 = GdsCreateState (_uSM, "State_76")
_uState78 = GdsCreateState (_uSM, "State_78")
_uState80 = GdsCreateState (_uSM, "State_80")
_uState82 = GdsCreateState (_uSM, "State_82")
_uState86 = GdsCreateState (_uSM, "State_86")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('pact_1_leader'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(PACT_1_LEADER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(PACT_1_LEADER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('pact_1_leader', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: label
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "pact_1_leader"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(PACT_1_LEADER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("pact_1_leader")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(PACT_1_LEADER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: label
_uState2Trans2 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_002PC", "I'd really like to know, how Nightsong recreated the Dracon caste.", 99, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_003", "A formidable story, Shaikan.", 102, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_004", "Nightsong knew, she was the only remaining Dracon. Within our caste-system there are three possibilities to switch castes:", 103, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_005", "First: A woman marries a man from another caste and thus becomes part of their caste too.", 104, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_006", "Second: A member of the caste is defeated in a duel and lives, thus becoming member of the winners caste.", 105, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_007", "Third: The High Archon or the High Sinistrim chooses you to become member of their caste.", 106, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_008PC", "I guess Numbers 1 and 3 were out of the question.", 107, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_009", "Your guess is right, Shaikan.", 108, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_010PC", "So she chose the duel. Seems a pretty long way to refound the Dracon caste, and arduous too.", 109, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_011", "You underestimate our Emperess, Shaikan.", 110, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_012PC", "I've long since learned, not to underestimate Nightsong. So what did she do?", 111, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_013", "She challenged the champion of the Archons, Kal'Tomar to a duel.", 112, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_014PC", "Kal'Tomar, Kal'Tomar. I think I've heard that name before. Isn't he one of the best swordsmen of your race?", 113, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_015", "Indeed he is, you are well informed.", 114, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_016PC", "What chance could she possibly have against Kal'Tomar. I know her to be a good fighter, but surely she's no match for him.", 115, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_017", "That's what Kal'Tomar thought too. So he offered her the choice of weapons.", 116, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_018PC", "That's honourable.", 117, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_019", "Nightsong chose the duel to be a singing-duel.", 118, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_020PC", "A … singing-duel? *Laughs*", 119, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_021", "Kal'Tomar had no choice but to meet her in this battle, where he was sure to loose as his tongue was hardly as flexible as his sword.", 120, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_022", "The High Archon was furious and challenged the validity of the duel.", 121, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_023PC", "I guess Nightsong was prepared for that?", 122, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_024", "Of course she was. She could quote several ancient texts, where there had been singing-duels with caste-change afterwards.", 123, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_025", "The Archon and Sinistrim leaders hated her for that but the people loved her for her cunning and wisdom.", 124, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_026PC", "I guess she couldn't do this a second time?", 125, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_027", "No, using a ploy twice would be foolish.", 126, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_028", "Kal'Tomar challenged other champions from Archons and Sinistrim and defeated them all in sword-battle.", 127, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_029", "One by one, the best swordsmen, the strongest knights, the darkest sorceresses became Dracon and we were once again a proud caste, equal to the Archon and Sinistrim.", 128, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_030PC", "Thank you, Dracon.", 129, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_Info_Nightsong_Done', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: label
_uState2Trans3 = GdsCreateTransition (_uState9, _uState2, "State_9", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_035PC", "You want those notes and I could use some good moonsilver-gear. I could help you get them.", 99, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_036", "I agree to that, but still - an alliance is out of the question.", 135, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_037PC", "Couldn't Craig order you to form an alliance?", 136, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_038", "He might have, when he was still the leader of the Dracon but now he's just a …", 137, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_039PC", "… don't say anything that might make him or me angry.", 138, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_040", "Very well, Shaikan.", 139, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P1_Alliance_Done', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: label
_uState2Trans4 = GdsCreateTransition (_uState13, _uState2, "State_13", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_062PC", "What levers are you talking about?", 99, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_063", "Within this city we found several levers. They seemed to operate several gates, which are otherwise hidden within the walls of this city.", 162, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_064PC", "This could come in handy for sneak attacks.", 163, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_065", "You're starting to get the picture.", 164, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P1_Local_Done', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: label
_uState2Trans5 = GdsCreateTransition (_uState6, _uState2, "State_6", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_066PC", "During your time here, did you learn anything about a being called Zazhut?", 99, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_067", "I'm sorry, Shaikan. But I've not really studied the books here. Although they're extremely interesting.", 166, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_068PC", "And you didn't overhear the Sinistra or any other archaeologist talking about their findings?", 167, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_069", "Only bits and pieces here and there, Shaikan. I've heard them speak of talking books, made of crystal. This really sounded amazing.", 168, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_070PC", "Thank you all the same, Dracon.", 169, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'mf_P704_Info_P1_Zazhut_Done', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState2Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_Info_Nightsong_Done', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_002PC", "I'd really like to know, how Nightsong recreated the Dracon caste.", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P1_Alliance_Done', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_031PC", "You and I, we share a common interest. Why not form an alliance?", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P1_Local_Done', 0, 2))
	_uState6Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_041PC", "Is there anything else, you can tell me?", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'mf_P704_Info_P1_Zazhut_Done', 0, 2))
	_uState6Trans4:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_066PC", "During your time here, did you learn anything about a being called Zazhut?", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 2))
	_uState6Trans5:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_071PC", "What will you do now?", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 2))
	_uState6Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4A_WIPEP2_TALKP1', 1))
	_uState6Trans6:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 6, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 2))
	_uState6Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_TALKP1', 1))
	_uState6Trans7:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 7, 16777215))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 2))
	_uState6Trans8:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3A_WIPEP4_TALKP1', 1))
	_uState6Trans8:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 8, 16777215))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 2))
	_uState6Trans9:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_TALKP1', 1))
	_uState6Trans9:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 9, 16777215))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 2))
	_uState6Trans10:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_118PC", "*** Let me think about that.", 10, 16777215))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans11:AddAction (CScriptActionShowChoices())
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2))
	_uState6Trans12:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2))
	_uState6Trans12:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))
	_uState6Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState6Trans12:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 100, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState2, _uState6, "State_2", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'mf_P704_CS02_Mainquest_End', 1, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'mf_P704_Pact1LeaderKnown', 1, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState6Trans13 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState9Trans1 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState9Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_033PC", "You surely would want to leave this place alive, so do we.", 1, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: choice
_uState9Trans2 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState9Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_035PC", "You want those notes and I could use some good moonsilver-gear. I could help you get them.", 2, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: choice
_uState9Trans3 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionShowChoices())
	_uState9Trans3 = nil

-- TO STATE: choice
_uState9Trans4 = GdsCreateTransition (_uState6, _uState9, "State_6", "State_9_T4", "Dialog")
	_uState9Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_031PC", "You and I, we share a common interest. Why not form an alliance?", 99, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_032", "An alliance? What common interest would we have, Shaikan?", 131, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState9Trans4 = nil

-- TO STATE: choice
_uState9Trans5 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T5", "Dialog")
	_uState9Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState9Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_033PC", "You surely would want to leave this place alive, so do we.", 99, 16777215))
	_uState9Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_034", "Death is only the beginning, Shaikan. Not everyone tries to wriggle out of it like your race does.", 133, 16777215))
	_uState9Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState9Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState9Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState9Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState13Trans1 = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState13Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_043PC", "Information about the enemies is always useful.", 1, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: choice
_uState13Trans2 = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState13Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_062PC", "What levers are you talking about?", 2, 16777215))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState13Trans2 = nil

-- TO STATE: choice
_uState13Trans3 = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13_T3", "Dialog")
	_uState13Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState13Trans3:AddAction (CScriptActionShowChoices())
	_uState13Trans3 = nil

-- TO STATE: choice
_uState13Trans4 = GdsCreateTransition (_uState6, _uState13, "State_6", "State_13_T4", "Dialog")
	_uState13Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 3))
	_uState13Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_041PC", "Is there anything else, you can tell me?", 99, 16777215))
	_uState13Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_042", "I could tell you something about our enemies, about some strange levers we found or about a way how you could help us, become stronger.", 141, 16777215))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState13Trans4 = nil

-- TO STATE: choice
_uState13Trans5 = GdsCreateTransition (_uState15, _uState13, "State_15", "State_13_T5", "Dialog")
	_uState13Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 3))
	_uState13Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_055PC", "Tell me about those Demons. That sounds odd.", 99, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_056", "When we left the battlefield I sensed the strong presence of Demons. I guess your friend, the demonhunter will be able to tell you more.", 155, 16777215))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_057", "Demons love chaos and they'll surely savour every moment of the fights within our ranks.", 156, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_058PC", "Then why do you still want to attack the Sinistrim?", 157, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_059", "Because those notes are more important than some Demons.", 158, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_060PC", "And if the Nal'Drommar is among them?", 159, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_061", "Then so help us Nor!", 160, 16777215))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState13Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState15Trans1 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState15Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_047PC", "I'd like to know something about the Sinistrim.", 1, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: choice
_uState15Trans2 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState15Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_051PC", "Some information about the Archons would be welcome.", 2, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: choice
_uState15Trans3 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 2))
	_uState15Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_055PC", "Tell me about those Demons. That sounds odd.", 3, 16777215))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans3 = nil

-- TO STATE: choice
_uState15Trans4 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T4", "Dialog")
	_uState15Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans4:AddAction (CScriptActionShowChoices())
	_uState15Trans4 = nil

-- TO STATE: choice
_uState15Trans5 = GdsCreateTransition (_uState13, _uState15, "State_13", "State_15_T5", "Dialog")
	_uState15Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState15Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_043PC", "Information about the enemies is always useful.", 99, 16777215))
	_uState15Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_044", "Would you rather know something about the Sinistrim, the Archons or the Demons?", 143, 16777215))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_045PC", "Demons?", 144, 16777215))
	_uState15Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_046", "Yes, Demons. I felt their presence when we were dragged form the battlefield to this place here.", 145, 16777215))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans5 = nil

-- TO STATE: choice
_uState15Trans6 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T6", "Dialog")
	_uState15Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState15Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_047PC", "I'd like to know something about the Sinistrim.", 99, 16777215))
	_uState15Trans6:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_048", "The Sinistrim aren't big fighters, they are sorcerors, mages, necromancers. Their strength is deceit and treachery.", 147, 16777215))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState15Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_049PC", "Interesting, how you talk about your former caste.", 148, 16777215))
	_uState15Trans6:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_050", "We're born within a caste. That doesn't mean we like them.", 149, 16777215))
	_uState15Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans6 = nil

-- TO STATE: choice
_uState15Trans7 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T7", "Dialog")
	_uState15Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState15Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_051PC", "Some information about the Archons would be welcome.", 99, 16777215))
	_uState15Trans7:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_052", "The Archons imbibe treachery from their infancy. They can be good fighters and good mages.", 151, 16777215))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState15Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_053PC", "You said something about Archons fighting Archons?", 152, 16777215))
	_uState15Trans7:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_054", "Yes, they seemed to be split into two factions. The Archons surely are the biggest caste here.", 153, 16777215))
	_uState15Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState15Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState21Trans1 = GdsCreateTransition (_uState6, _uState21, "State_6", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 5))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_071PC", "What will you do now?", 99, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState21Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState25Trans1 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState25Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState25Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 1, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: choice
_uState25Trans2 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionShowChoices())
	_uState25Trans2 = nil

-- TO STATE: choice
_uState25Trans3 = GdsCreateTransition (_uState6, _uState25, "State_6", "State_25_T3", "Dialog")
	_uState25Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 6))
	_uState25Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState25Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 182, 16777215))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState25Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 183, 16777215))
	_uState25Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 184, 16777215))
	_uState25Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 185, 16777215))
	_uState25Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 186, 16777215))
	_uState25Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 187, 16777215))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState25Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState28Trans1 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T1", "Dialog")
	_uState28Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState28Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_098PC", "Wipe out Sinistra La'Shut. It's time for her.", 1, 16777215))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState28Trans1 = nil

-- TO STATE: choice
_uState28Trans2 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T2", "Dialog")
	_uState28Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState28Trans2:AddAction (CScriptActionShowChoices())
	_uState28Trans2 = nil

-- TO STATE: choice
_uState28Trans3 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T3", "Dialog")
	_uState28Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 7))
	_uState28Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState28Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 191, 16777215))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 192, 16777215))
	_uState28Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 193, 16777215))
	_uState28Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 194, 16777215))
	_uState28Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 195, 16777215))
	_uState28Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 196, 16777215))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState28Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState28, _uBeginState, "State_28", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState31Trans1 = GdsCreateTransition (_uState31, _uState31, "State_31", "State_31_T1", "Dialog")
	_uState31Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState31Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState31Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_107PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 1, 16777215))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState31Trans1 = nil

-- TO STATE: choice
_uState31Trans2 = GdsCreateTransition (_uState31, _uState31, "State_31", "State_31_T2", "Dialog")
	_uState31Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState31Trans2:AddAction (CScriptActionShowChoices())
	_uState31Trans2 = nil

-- TO STATE: choice
_uState31Trans3 = GdsCreateTransition (_uState6, _uState31, "State_6", "State_31_T3", "Dialog")
	_uState31Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 8))
	_uState31Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState31Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 200, 16777215))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 201, 16777215))
	_uState31Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 202, 16777215))
	_uState31Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 203, 16777215))
	_uState31Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 204, 16777215))
	_uState31Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 205, 16777215))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState31Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState31, _uState31, "State_31", "State_31", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState31, _uBeginState, "State_31", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState34Trans1 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T1", "Dialog")
	_uState34Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState34Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState34Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 1, 16777215))
	_uState34Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState34Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState34Trans1 = nil

-- TO STATE: choice
_uState34Trans2 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T2", "Dialog")
	_uState34Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState34Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState34Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState34Trans2:AddAction (CScriptActionShowChoices())
	_uState34Trans2 = nil

-- TO STATE: choice
_uState34Trans3 = GdsCreateTransition (_uState6, _uState34, "State_6", "State_34_T3", "Dialog")
	_uState34Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 9))
	_uState34Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState34Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 209, 16777215))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState34Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 210, 16777215))
	_uState34Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 211, 16777215))
	_uState34Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 212, 16777215))
	_uState34Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 213, 16777215))
	_uState34Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 214, 16777215))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState34Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState34, _uBeginState, "State_34", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState38Trans1 = GdsCreateTransition (_uState2, _uState38, "State_2", "State_38_T1", "Dialog")
	_uState38Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState38Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ))
	_uState38Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState38Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2))
	_uState38Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))
	_uState38Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState38Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState38Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState38Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 221, 16777215))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState38Trans1 = nil

-- TO STATE: elseif
_uState38Trans2 = GdsCreateTransition (_uState2, _uState38, "State_2", "State_38_T2", "Dialog")
	_uState38Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 1, 2))
	_uState38Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2))
	_uState38Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState38Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2)) ))
	_uState38Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 319, 16777215))
	_uState38Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_221PC", "Archon Liriel is at the Mor Duine.", 320, 16777215))
	_uState38Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_222", "Nor guide her soul safely across.", 321, 16777215))
	_uState38Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_223PC", "You don't sound too happy, Dracon.", 322, 16777215))
	_uState38Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_224", "It will pass, Shaikan.", 323, 16777215))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState38Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState38, _uBeginState, "State_38", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState40Trans1 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T1", "Dialog")
	_uState40Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState40Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_124PC", "*** Allright, let's do it!", 1, 16777215))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState40Trans1 = nil

-- TO STATE: choice
_uState40Trans2 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T2", "Dialog")
	_uState40Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState40Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_134PC", "*** Let me think about that.", 2, 16777215))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState40Trans2 = nil

-- TO STATE: choice
_uState40Trans3 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T3", "Dialog")
	_uState40Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState40Trans3:AddAction (CScriptActionShowChoices())
	_uState40Trans3 = nil

-- TO STATE: choice
_uState40Trans4 = GdsCreateTransition (_uState38, _uState40, "State_38", "State_40_T4", "Dialog")
	_uState40Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_123", "Archon Dor'Mat then. Let's help him and the rest of his Archons to join Archon Liriel at the River of Souls.", 222, 16777215))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState40Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState40, _uBeginState, "State_40", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState43Trans1 = GdsCreateTransition (_uState2, _uState43, "State_2", "State_43_T1", "Dialog")
	_uState43Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ))
	_uState43Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))
	_uState43Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState43Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2))
	_uState43Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))
	_uState43Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState43Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState43Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState43Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState43Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 234, 16777215))
	_uState43Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState43Trans1 = nil

-- TO STATE: elseif
_uState43Trans2 = GdsCreateTransition (_uState2, _uState43, "State_2", "State_43_T2", "Dialog")
	_uState43Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 1, 2))
	_uState43Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2))
	_uState43Trans2:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2)) ))
	_uState43Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState43Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 324, 16777215))
	_uState43Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_226PC", "Archon Dor'Mat is dead.", 325, 16777215))
	_uState43Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_227", "Death is only the beginning, Shaikan.", 326, 16777215))
	_uState43Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_228PC", "You don't sound too happy, Dracon.", 327, 16777215))
	_uState43Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_229", "It will pass, Shaikan.", 328, 16777215))
	_uState43Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState43Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState43, _uState43, "State_43", "State_43", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState43, _uBeginState, "State_43", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState45Trans1 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState45Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_137PC", "*** Allright, let's do it!", 1, 16777215))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState45Trans1 = nil

-- TO STATE: choice
_uState45Trans2 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T2", "Dialog")
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState45Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_147PC", "*** Let me think about that.", 2, 16777215))
	_uState45Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState45Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState45Trans2 = nil

-- TO STATE: choice
_uState45Trans3 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T3", "Dialog")
	_uState45Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState45Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState45Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState45Trans3:AddAction (CScriptActionShowChoices())
	_uState45Trans3 = nil

-- TO STATE: choice
_uState45Trans4 = GdsCreateTransition (_uState43, _uState45, "State_43", "State_45_T4", "Dialog")
	_uState45Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_136", "Archon Liriel then. Let's help her and the rest of his Archons to join Archon Dor'Mat at the River of Souls.", 235, 16777215))
	_uState45Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState45Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState49Trans1 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T1", "Dialog")
	_uState49Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState49Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState49Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_153PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 1, 16777215))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans1 = nil

-- TO STATE: choice
_uState49Trans2 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T2", "Dialog")
	_uState49Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 2))
	_uState49Trans2:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState49Trans2:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_157PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 2, 16777215))
	_uState49Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 1, 4))
	_uState49Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans2 = nil

-- TO STATE: choice
_uState49Trans3 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T3", "Dialog")
	_uState49Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 2))
	_uState49Trans3:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_161PC", "I'm not in the position to advise you, Dracon. You will choose wisely yourself.", 3, 16777215))
	_uState49Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 1, 4))
	_uState49Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans3 = nil

-- TO STATE: choice
_uState49Trans4 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T4", "Dialog")
	_uState49Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 2))
	_uState49Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4A_WIPEP2_TALKP1', 1))
	_uState49Trans4:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 4, 16777215))
	_uState49Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 1, 4))
	_uState49Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans4 = nil

-- TO STATE: choice
_uState49Trans5 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T5", "Dialog")
	_uState49Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 2))
	_uState49Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ4C_WIPEP3_TALKP1', 1))
	_uState49Trans5:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 5, 16777215))
	_uState49Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 1, 4))
	_uState49Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans5 = nil

-- TO STATE: choice
_uState49Trans6 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T6", "Dialog")
	_uState49Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 2))
	_uState49Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3A_WIPEP4_TALKP1', 1))
	_uState49Trans6:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 6, 16777215))
	_uState49Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 1, 4))
	_uState49Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans6 = nil

-- TO STATE: choice
_uState49Trans7 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T7", "Dialog")
	_uState49Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 2))
	_uState49Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ3C_WIPEP2_TALKP1', 1))
	_uState49Trans7:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 7, 16777215))
	_uState49Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 1, 4))
	_uState49Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans7 = nil

-- TO STATE: choice
_uState49Trans8 = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49_T8", "Dialog")
	_uState49Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState49Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState49Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans8:AddAction (CScriptActionShowChoices())
	_uState49Trans8 = nil

-- TO STATE: choice
_uState49Trans9 = GdsCreateTransition (_uState2, _uState49, "State_2", "State_49_T9", "Dialog")
	_uState49Trans9:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ))
	_uState49Trans9:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState49Trans9:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState49Trans9:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2))
	_uState49Trans9:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))
	_uState49Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState49Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState49Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState49Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState49Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState49Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 247, 16777215))
	_uState49Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_149PC", "Sinistra La'Shut is no more.", 248, 16777215))
	_uState49Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_150", "That is great news, Shaikan. Did she have the notes?", 249, 16777215))
	_uState49Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_151PC", "No, I couldn't find them. But I heard someone mentioning her assistant being lost. Maybe she has them?", 250, 16777215))
	_uState49Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_152", "One of the Archons must have taken her. But which one to attack first?", 251, 16777215))
	_uState49Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState49Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState49, _uBeginState, "State_49", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState52Trans1 = GdsCreateTransition (_uState49, _uState52, "State_49", "State_52_T1", "Dialog")
	_uState52Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 3))
	_uState52Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_161PC", "I'm not in the position to advise you, Dracon. You will choose wisely yourself.", 99, 16777215))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState52Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState52, _uBeginState, "State_52", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState57Trans1 = GdsCreateTransition (_uState57, _uState57, "State_57", "State_57_T1", "Dialog")
	_uState57Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState57Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState57Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 1, 16777215))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState57Trans1 = nil

-- TO STATE: choice
_uState57Trans2 = GdsCreateTransition (_uState57, _uState57, "State_57", "State_57_T2", "Dialog")
	_uState57Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState57Trans2:AddAction (CScriptActionShowChoices())
	_uState57Trans2 = nil

-- TO STATE: choice
_uState57Trans3 = GdsCreateTransition (_uState49, _uState57, "State_49", "State_57_T3", "Dialog")
	_uState57Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4))
	_uState57Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState57Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 272, 16777215))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 273, 16777215))
	_uState57Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 274, 16777215))
	_uState57Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 275, 16777215))
	_uState57Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 276, 16777215))
	_uState57Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 277, 16777215))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState57Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState57, _uState57, "State_57", "State_57", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState57, _uBeginState, "State_57", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState60Trans1 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T1", "Dialog")
	_uState60Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState60Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_098PC", "Wipe out Sinistra La'Shut. It's time for her.", 1, 16777215))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState60Trans1 = nil

-- TO STATE: choice
_uState60Trans2 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T2", "Dialog")
	_uState60Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState60Trans2:AddAction (CScriptActionShowChoices())
	_uState60Trans2 = nil

-- TO STATE: choice
_uState60Trans3 = GdsCreateTransition (_uState49, _uState60, "State_49", "State_60_T3", "Dialog")
	_uState60Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 5))
	_uState60Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState60Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 281, 16777215))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState60Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 282, 16777215))
	_uState60Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 283, 16777215))
	_uState60Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 284, 16777215))
	_uState60Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 285, 16777215))
	_uState60Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 286, 16777215))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState60Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState60, _uBeginState, "State_60", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState63Trans1 = GdsCreateTransition (_uState63, _uState63, "State_63", "State_63_T1", "Dialog")
	_uState63Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState63Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState63Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_107PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 1, 16777215))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState63Trans1 = nil

-- TO STATE: choice
_uState63Trans2 = GdsCreateTransition (_uState63, _uState63, "State_63", "State_63_T2", "Dialog")
	_uState63Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState63Trans2:AddAction (CScriptActionShowChoices())
	_uState63Trans2 = nil

-- TO STATE: choice
_uState63Trans3 = GdsCreateTransition (_uState49, _uState63, "State_49", "State_63_T3", "Dialog")
	_uState63Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 6))
	_uState63Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState63Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 290, 16777215))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 291, 16777215))
	_uState63Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 292, 16777215))
	_uState63Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 293, 16777215))
	_uState63Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 294, 16777215))
	_uState63Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 295, 16777215))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState63Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState63, _uState63, "State_63", "State_63", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState63, _uBeginState, "State_63", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState66Trans1 = GdsCreateTransition (_uState66, _uState66, "State_66", "State_66_T1", "Dialog")
	_uState66Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 2))
	_uState66Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState66Trans1:AddAction (CScriptActionChoice("P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 1, 16777215))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 1, 4))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState66Trans1 = nil

-- TO STATE: choice
_uState66Trans2 = GdsCreateTransition (_uState66, _uState66, "State_66", "State_66_T2", "Dialog")
	_uState66Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 2))
	_uState66Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 0, 4))
	_uState66Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(PACT_1_LEADER)', 1, 4))
	_uState66Trans2:AddAction (CScriptActionShowChoices())
	_uState66Trans2 = nil

-- TO STATE: choice
_uState66Trans3 = GdsCreateTransition (_uState49, _uState66, "State_49", "State_66_T3", "Dialog")
	_uState66Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 7))
	_uState66Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_082PC", "*** I would have an idea, if you wish to hear.", 99, 16777215))
	_uState66Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_083", "*** Listening, Shaikan.", 299, 16777215))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState66Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_084PC", "What would you think if I told you there were two Archon bases at war with each other.", 300, 16777215))
	_uState66Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_085", "It would fit their nature, Shaikan.", 301, 16777215))
	_uState66Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_086PC", "As a soldier you might see the opportunity here.", 302, 16777215))
	_uState66Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_087", "What you say bears some truth, Shaikan.", 303, 16777215))
	_uState66Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_088PC", "Then why still attack the Sinistrim? Kill off the Archons before they reunite.", 304, 16777215))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState66Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState66, _uState66, "State_66", "State_66", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState66, _uBeginState, "State_66", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState69Trans1 = GdsCreateTransition (_uState2, _uState69, "State_2", "State_69_T1", "Dialog")
	_uState69Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2))
	_uState69Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState69Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState69Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 310, 16777215))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState69Trans1 = nil

-- TO STATE: elseif
_uState69Trans2 = GdsCreateTransition (_uState2, _uState69, "State_2", "State_69_T2", "Dialog")
	_uState69Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1))
	_uState69Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1))
	_uState69Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState69Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState69Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState69Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState69Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState69Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState69Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 307, 16777215))
	_uState69Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_209PC", "I'm intrigued what the armour and weapons will look like when forged from these remains. Here are your 20 bones.", 308, 16777215))
	_uState69Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_210", "Thank you, Shaikan. Now we'll be even stronger.", 309, 16777215))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveArtifactP1', 1, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState69Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState69, _uState69, "State_69", "State_69", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState69, _uBeginState, "State_69", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState72Trans1 = GdsCreateTransition (_uState2, _uState72, "State_2", "State_72_T1", "Dialog")
	_uState72Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2))
	_uState72Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState72Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 316, 16777215))
	_uState72Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState72Trans1 = nil

-- TO STATE: elseif
_uState72Trans2 = GdsCreateTransition (_uState2, _uState72, "State_2", "State_72_T2", "Dialog")
	_uState72Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1))
	_uState72Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState72Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState72Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 313, 16777215))
	_uState72Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_209PC", "I'm intrigued what the armour and weapons will look like when forged from these remains. Here are your 20 bones.", 314, 16777215))
	_uState72Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_210", "Thank you, Shaikan. Now we'll be even stronger.", 315, 16777215))
	_uState72Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveArtifactP1', 1, 4))
	_uState72Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState72Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState72, _uState72, "State_72", "State_72", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState72, _uBeginState, "State_72", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState76Trans1 = GdsCreateTransition (_uState2, _uState76, "State_2", "State_76_T1", "Dialog")
	_uState76Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 1, 2))
	_uState76Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1D_Completed', 0, 2))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2)) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState76Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState76Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 329, 16777215))
	_uState76Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState76Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState76, _uState76, "State_76", "State_76", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState76, _uBeginState, "State_76", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState78Trans1 = GdsCreateTransition (_uState76, _uState78, "State_76", "State_78_T1", "Dialog")
	_uState78Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1D_WIPEP2_RETRIEVEBONESP1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 676, 1, 1, 1)) ))
	_uState78Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState78Trans1 = nil

-- TO STATE: else
_uState78Trans2 = GdsCreateTransition (_uState76, _uState78, "State_76", "State_78_T2", "Dialog")
	_uState78Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1D_WIPEP2_RETRIEVEBONESP1', 1))
	_uState78Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 676, 1, 1, 1))
	_uState78Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_231", "Here you have your book, Dracon. I took it from the lifeless body of the Sinistrim leader.", 330, 16777215))
	_uState78Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_232PC", "Thank you, Shaikan. Now we'll be even stronger.", 331, 16777215))
	_uState78Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveBonesP1', 1, 4))
	_uState78Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState78Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState78, _uState78, "State_78", "State_78", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState78, _uBeginState, "State_78", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState80Trans1 = GdsCreateTransition (_uState2, _uState80, "State_2", "State_80_T1", "Dialog")
	_uState80Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 1, 2))
	_uState80Trans1:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1E_Completed', 0, 2))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2)) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState80Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1D_Completed', 0, 2)) ))
	_uState80Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 334, 16777215))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState80Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState80, _uState80, "State_80", "State_80", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState80, _uBeginState, "State_80", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState82Trans1 = GdsCreateTransition (_uState80, _uState82, "State_80", "State_82_T1", "Dialog")
	_uState82Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1E_WIPEP4_RETRIEVEBONESP1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 676, 1, 1, 1)) ))
	_uState82Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState82Trans1 = nil

-- TO STATE: else
_uState82Trans2 = GdsCreateTransition (_uState80, _uState82, "State_80", "State_82_T2", "Dialog")
	_uState82Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'TC_MQ1E_WIPEP4_RETRIEVEBONESP1', 1))
	_uState82Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 676, 1, 1, 1))
	_uState82Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_231", "Here you have your book, Dracon. I took it from the lifeless body of the Sinistrim leader.", 335, 16777215))
	_uState82Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_232PC", "Thank you, Shaikan. Now we'll be even stronger.", 336, 16777215))
	_uState82Trans2:AddAction (CScriptActionValueModify('', 'mf_P704_GiveBonesP1', 1, 4))
	_uState82Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState82Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState82, _uState82, "State_82", "State_82", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState82, _uBeginState, "State_82", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState86Trans1 = GdsCreateTransition (_uState21, _uState86, "State_21", "State_86_T1", "Dialog")
	_uState86Trans1:AddCondition (CScriptConditionScriptTagAlive('Pact_3_Leader'))
	_uState86Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState86Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))
	_uState86Trans1:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_072", "So it's just the Sinistrim and us. We will finally be able to destroy them.", 171, 16777215))
	_uState86Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PACT_1_LEADER)', 1, 4))
	_uState86Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans1 = nil

-- TO STATE: endconversation
_uState86Trans2 = GdsCreateTransition (_uState21, _uState86, "State_21", "State_86_T2", "Dialog")
	_uState86Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_3_Leader'), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))) ))
	_uState86Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_073", "I will start sending troops against those Sinistrim idiots.", 172, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_074PC", "If we'd form an alliance, we could be more effective.", 173, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_075", "No, Shaikan. An alliance is out of the question for us. But there's one thing you could do.", 174, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_076PC", "I'm all ears.", 175, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_077", "The Archons hate the Sinistrim almost as much as we do. Maybe you could convince their leaders into helping us, destroy these fools, before they destroy us.", 176, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_078PC", "Diplomatic mission then? I love them …", 177, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_079", "I should warn you, that there's one thing the Archon hate more than the Sinistrim.", 178, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_080PC", "And that would be …?", 179, 16777215))
	_uState86Trans2:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_081", "The Dracon.", 180, 16777215))
	_uState86Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PACT_1_LEADER)', 1, 4))
	_uState86Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans2 = nil

-- TO STATE: endconversation
_uState86Trans3 = GdsCreateTransition (_uState25, _uState86, "State_25", "State_86_T3", "Dialog")
	_uState86Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 99, 16777215))
	_uState86Trans3:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_090", "Indeed, you speak like a true tactician. Let's kill some Archon then, Dracon! For NOR!", 189, 16777215))
	_uState86Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PACT_1_LEADER)', 1, 4))
	_uState86Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans3 = nil

-- TO STATE: endconversation
_uState86Trans4 = GdsCreateTransition (_uState28, _uState86, "State_28", "State_86_T4", "Dialog")
	_uState86Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_098PC", "Wipe out Sinistra La'Shut. It's time for her.", 99, 16777215))
	_uState86Trans4:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_099", "Finally! For NOR!", 198, 16777215))
	_uState86Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(PACT_1_LEADER)', 1, 4))
	_uState86Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans4 = nil

-- TO STATE: endconversation
_uState86Trans5 = GdsCreateTransition (_uState31, _uState86, "State_31", "State_86_T5", "Dialog")
	_uState86Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_107PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 99, 16777215))
	_uState86Trans5:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_108", "Don't try to flatter me, Shaikan. I'm a Dracon. I live to master challenges, noone else would conquer.", 207, 16777215))
	_uState86Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(PACT_1_LEADER)', 1, 4))
	_uState86Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans5 = nil

-- TO STATE: endconversation
_uState86Trans6 = GdsCreateTransition (_uState34, _uState86, "State_34", "State_86_T6", "Dialog")
	_uState86Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 99, 16777215))
	_uState86Trans6:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_090", "Indeed, you speak like a true tactician. Let's kill some Archon then, Dracon! For NOR!", 216, 16777215))
	_uState86Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(PACT_1_LEADER)', 1, 4))
	_uState86Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans6 = nil

-- TO STATE: endconversation
_uState86Trans7 = GdsCreateTransition (_uState6, _uState86, "State_6", "State_86_T7", "Dialog")
	_uState86Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 10))
	_uState86Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_118PC", "*** Let me think about that.", 99, 16777215))
	_uState86Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(PACT_1_LEADER)', 1, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(PACT_1_LEADER)', 0, 4))
	_uState86Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans7 = nil

-- TO STATE: endconversation
_uState86Trans8 = GdsCreateTransition (_uState2, _uState86, "State_2", "State_86_T8", "Dialog")
	_uState86Trans8:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2))
	_uState86Trans8:AddCondition (CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2))
	_uState86Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState86Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState86Trans8:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 218, 16777215))
	_uState86Trans8:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_120", "*** I hope our alliance is doing well against the Sinistrim.", 219, 16777215))
	_uState86Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_121PC", "*** Of course.", 220, 16777215))
	_uState86Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(PACT_1_LEADER)', 1, 4))
	_uState86Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans8 = nil

-- TO STATE: endconversation
_uState86Trans9 = GdsCreateTransition (_uState40, _uState86, "State_40", "State_86_T9", "Dialog")
	_uState86Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_124PC", "*** Allright, let's do it!", 99, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_125", "Shaikan, we haven't been able to summon a titan to our aid.", 224, 16777215))
	_uState86Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_126", "For this we need the book of Lor'nik.", 225, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_127PC", "You need a book to summon a titan?", 226, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_128", "The book contains numerous incantations but it's not the only item we need for this ritual.", 227, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_129PC", "What else do you need?", 228, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_130", "We need chalk to form a summoning circle, crystals to preserve the energy and fresh blood as a gift to the Titan.", 229, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_131PC", "Oh great. I'll see, what I can do.", 230, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_132", "Sorry, Shaikan. You misunderstood me. We need only the book. The other items we have here.", 231, 16777215))
	_uState86Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_133PC", "The book. Just the book, understood.", 232, 16777215))
	_uState86Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(PACT_1_LEADER)', 1, 4))
	_uState86Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans9 = nil

-- TO STATE: endconversation
_uState86Trans10 = GdsCreateTransition (_uState40, _uState86, "State_40", "State_86_T10", "Dialog")
	_uState86Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState86Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_134PC", "*** Let me think about that.", 99, 16777215))
	_uState86Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(PACT_1_LEADER)', 1, 4))
	_uState86Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans10 = nil

-- TO STATE: endconversation
_uState86Trans11 = GdsCreateTransition (_uState45, _uState86, "State_45", "State_86_T11", "Dialog")
	_uState86Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_137PC", "*** Allright, let's do it!", 99, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_125", "Shaikan, we haven't been able to summon a titan to our aid.", 237, 16777215))
	_uState86Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans11:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_126", "For this we need the book of Lor'nik.", 238, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_127PC", "You need a book to summon a titan?", 239, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_128", "The book contains numerous incantations but it's not the only item we need for this ritual.", 240, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_129PC", "What else do you need?", 241, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_130", "We need chalk to form a summoning circle, crystals to preserve the energy and fresh blood as a gift to the Titan.", 242, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_131PC", "Oh great. I'll see, what I can do.", 243, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_132", "Sorry, Shaikan. You misunderstood me. We need only the book. The other items we have here.", 244, 16777215))
	_uState86Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_133PC", "The book. Just the book, understood.", 245, 16777215))
	_uState86Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(PACT_1_LEADER)', 1, 4))
	_uState86Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans11 = nil

-- TO STATE: endconversation
_uState86Trans12 = GdsCreateTransition (_uState45, _uState86, "State_45", "State_86_T12", "Dialog")
	_uState86Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState86Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_147PC", "*** Let me think about that.", 99, 16777215))
	_uState86Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(PACT_1_LEADER)', 1, 4))
	_uState86Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans12 = nil

-- TO STATE: endconversation
_uState86Trans13 = GdsCreateTransition (_uState49, _uState86, "State_49", "State_86_T13", "Dialog")
	_uState86Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_153PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 99, 16777215))
	_uState86Trans13:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_154", "Indeed, you speak like a true tactician. Let's kill some Archon then, Dracon! For NOR!", 253, 16777215))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState86Trans13:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_155", "I need your help again, Shaikan, to strengthen our abilities in battle.", 254, 16777215))
	_uState86Trans13:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_156", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 255, 16777215))
	_uState86Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(PACT_1_LEADER)', 1, 4))
	_uState86Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans13 = nil

-- TO STATE: endconversation
_uState86Trans14 = GdsCreateTransition (_uState49, _uState86, "State_49", "State_86_T14", "Dialog")
	_uState86Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 2))
	_uState86Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_157PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 99, 16777215))
	_uState86Trans14:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_158", "Don't try to flatter me, Shaikan. I'm a Dracon. I live to master challenges, noone else would conquer.", 257, 16777215))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(PACT_1_LEADER)', 0, 4))
	_uState86Trans14:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_155", "I need your help again, Shaikan, to strengthen our abilities in battle.", 258, 16777215))
	_uState86Trans14:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_156", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 259, 16777215))
	_uState86Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(PACT_1_LEADER)', 1, 4))
	_uState86Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans14 = nil

-- TO STATE: endconversation
_uState86Trans15 = GdsCreateTransition (_uState52, _uState86, "State_52", "State_86_T15", "Dialog")
	_uState86Trans15:AddCondition (CScriptConditionScriptTagAlive('Pact_2_Leader'))
	_uState86Trans15:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_162", "It must be Archon Liriel then. She must have the notes!", 261, 16777215))
	_uState86Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_163PC", "That, or the poor assistant is lying dead somewhere, while the Demons feast on her body.", 262, 16777215))
	_uState86Trans15:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_164", "We can still search for her body if she's not in the Archon camp! Let's kill some Archon then, Dracon! For NOR!", 263, 16777215))
	_uState86Trans15:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_155", "I need your help again, Shaikan, to strengthen our abilities in battle.", 264, 16777215))
	_uState86Trans15:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_156", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 265, 16777215))
	_uState86Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(PACT_1_LEADER)', 1, 4))
	_uState86Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans15 = nil

-- TO STATE: endconversation
_uState86Trans16 = GdsCreateTransition (_uState52, _uState86, "State_52", "State_86_T16", "Dialog")
	_uState86Trans16:AddCondition (CScriptConditionScriptTagAlive('Pact_4_Leader'))
	_uState86Trans16:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState86Trans16:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_167", "Archon Dor'Mat then. I knew it! He's the one.", 266, 16777215))
	_uState86Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_168PC", "That, or the poor assistant is lying dead somewhere, while the Demons feast on her body.", 267, 16777215))
	_uState86Trans16:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_169", "We can still search for her body if she's not in the Archon camp! Let's kill some Archon then, Dracon! For NOR!", 268, 16777215))
	_uState86Trans16:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_155", "I need your help again, Shaikan, to strengthen our abilities in battle.", 269, 16777215))
	_uState86Trans16:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_156", "I know there are Demons out there and our smith is able to forge formidable armour and weapons out of their bones. If you could provide us with 20 of these bones, then we could become even stronger.", 270, 16777215))
	_uState86Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(PACT_1_LEADER)', 1, 4))
	_uState86Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans16 = nil

-- TO STATE: endconversation
_uState86Trans17 = GdsCreateTransition (_uState52, _uState86, "State_52", "State_86_T17", "Dialog")
	_uState86Trans17:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ))
	_uState86Trans17:AddCondition (GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ))
	_uState86Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(PACT_1_LEADER)', 1, 4))
	_uState86Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans17 = nil

-- TO STATE: endconversation
_uState86Trans18 = GdsCreateTransition (_uState57, _uState86, "State_57", "State_86_T18", "Dialog")
	_uState86Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 99, 16777215))
	_uState86Trans18:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_090", "Indeed, you speak like a true tactician. Let's kill some Archon then, Dracon! For NOR!", 279, 16777215))
	_uState86Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(PACT_1_LEADER)', 1, 4))
	_uState86Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans18 = nil

-- TO STATE: endconversation
_uState86Trans19 = GdsCreateTransition (_uState60, _uState86, "State_60", "State_86_T19", "Dialog")
	_uState86Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_098PC", "Wipe out Sinistra La'Shut. It's time for her.", 99, 16777215))
	_uState86Trans19:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_099", "Finally! For NOR!", 288, 16777215))
	_uState86Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(PACT_1_LEADER)', 1, 4))
	_uState86Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans19 = nil

-- TO STATE: endconversation
_uState86Trans20 = GdsCreateTransition (_uState63, _uState86, "State_63", "State_86_T20", "Dialog")
	_uState86Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_107PC", "Start with Archon Dor'Mats base to the east. He's the heavyweight but easily outmanouvered by your skill.", 99, 16777215))
	_uState86Trans20:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_108", "Don't try to flatter me, Shaikan. I'm a Dracon. I live to master challenges, noone else would conquer.", 297, 16777215))
	_uState86Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(PACT_1_LEADER)', 1, 4))
	_uState86Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans20 = nil

-- TO STATE: endconversation
_uState86Trans21 = GdsCreateTransition (_uState66, _uState86, "State_66", "State_86_T21", "Dialog")
	_uState86Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 1))
	_uState86Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_089PC", "Start with Archon Liriel's base to the northwest. She's the easier target.", 99, 16777215))
	_uState86Trans21:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_090", "Indeed, you speak like a true tactician. Let's kill some Archon then, Dracon! For NOR!", 306, 16777215))
	_uState86Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(PACT_1_LEADER)', 0, 4))
	_uState86Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(PACT_1_LEADER)', 1, 4))
	_uState86Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans21 = nil

-- TO STATE: endconversation
_uState86Trans22 = GdsCreateTransition (_uState69, _uState86, "State_69", "State_86_T22", "Dialog")
	_uState86Trans22:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_212", "*** I hope our alliance is doing well against Archon Liriel.", 311, 16777215))
	_uState86Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_213PC", "*** Of course.", 312, 16777215))
	_uState86Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(PACT_1_LEADER)', 1, 4))
	_uState86Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans22 = nil

-- TO STATE: endconversation
_uState86Trans23 = GdsCreateTransition (_uState72, _uState86, "State_72", "State_86_T23", "Dialog")
	_uState86Trans23:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_218", "*** I hope our alliance is doing well against Archon Dor Mat.", 317, 16777215))
	_uState86Trans23:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_219PC", "*** Of course.", 318, 16777215))
	_uState86Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(PACT_1_LEADER)', 1, 4))
	_uState86Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans23 = nil

-- TO STATE: endconversation
_uState86Trans24 = GdsCreateTransition (_uState78, _uState86, "State_78", "State_86_T24", "Dialog")
	_uState86Trans24:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_233", "*** I hope our alliance is doing well against Archon Liriel.", 332, 16777215))
	_uState86Trans24:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_234PC", "*** Of course.", 333, 16777215))
	_uState86Trans24:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(PACT_1_LEADER)', 1, 4))
	_uState86Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans24 = nil

-- TO STATE: endconversation
_uState86Trans25 = GdsCreateTransition (_uState82, _uState86, "State_82", "State_86_T25", "Dialog")
	_uState86Trans25:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_238", "*** I hope our alliance is doing well against Archon Dor'Mat.", 337, 16777215))
	_uState86Trans25:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_239PC", "*** Of course.", 338, 16777215))
	_uState86Trans25:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(PACT_1_LEADER)', 1, 4))
	_uState86Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans25 = nil

-- TO STATE: endconversation
_uState86Trans26 = GdsCreateTransition (_uState2, _uState86, "State_2", "State_86_T26", "Dialog")
	_uState86Trans26:AddCondition (CScriptConditionValue('', 'mf_P704_MQ5_Accepted', 1, 2))
	_uState86Trans26:AddCondition (CScriptConditionValue('', 'mf_P704_MQ5_Completed', 0, 2))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2)) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1D_Completed', 0, 2)) ))
	_uState86Trans26:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Completed', 0, 2)) ))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_001", "Shaikan.", 339, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_241PC", "This is it. You are the last caste standing.", 340, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_242", "The fight is over. May Nor guide the lost souls safely across.", 341, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_243PC", "We couldn't find the notes of Ani'Hu, though. They mysteriously disappeared along with the Assistant of Sinistra La'Shut.", 342, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_244", "So they disappeared? Mysteriously as you say. *Pause*", 343, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_245PC", "And I hope they will stay disappeared. They started a small civil war already here. What do you think would happen in Shal?", 344, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_246", "But we … *sighs* You're wise, Shaikan. Let me now help you in your quest, after you helped me in mine.", 345, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_247", "You have seen a lot of the Citadel during this small war. But you haven't seen half of its books. In the north of the city you find a bridge, leading to a small island.", 346, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_248", "There you find an old portal, which can be activated by this journey-crystal. It took us weeks to figure this out.", 347, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_249", "Take it, Shaikan. Find the information you need and let's hope you can save Eo in time.", 348, 16777215))
	_uState86Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P704_DLG_PACT1LEADER_250PC", "Thank you, Dracon. I will do my very best.", 349, 16777215))
	_uState86Trans26:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(PACT_1_LEADER)', 1, 4))
	_uState86Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans26 = nil

-- TO STATE: endconversation
_uState86Trans27 = GdsCreateTransition (_uState2, _uState86, "State_2", "State_86_T27", "Dialog")
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P704_CS02_Mainquest_End', 0, 2) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 0, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mv_P704_Num_Living_Clans', 2, 0), CScriptConditionScriptTagAlive('Pact_3_Leader')))) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1A_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1A_Completed', 0, 2)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_2_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_4_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))))) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionScriptTagAlive('Pact_3_Leader') ), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_2_Leader'), CScriptConditionAND(CScriptConditionScriptTagAlive('Pact_4_Leader'), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 0, 2))))) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1B_WIPEP2_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 0, 2)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'TC_MQ1C_WIPEP4_RETRIEVES1P1', 1), CScriptConditionPlayerHasItem('pl_Human', 3, 675, 20, 1, 1)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 0, 2)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1B_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1C_Completed', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 0, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 0, 2))) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1D_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1D_Completed', 0, 2)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ1E_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ1E_Completed', 0, 2)) ))
	_uState86Trans27:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P704_MQ5_Accepted', 1, 2), CScriptConditionValue('', 'mf_P704_MQ5_Completed', 0, 2)) ))
	_uState86Trans27:AddAction (CScriptActionSay("pact_1_leader", "P704_DLG_PACT1LEADER_251", "*** I am busy right now, come back later...", 350, 16777215))
	_uState86Trans27:AddAction (CScriptActionDialogRequestEnd("pl_Human", "pact_1_leader"))
	_uState86Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(PACT_1_LEADER)', 1, 4))
	_uState86Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(PACT_1_LEADER)', 1, 4))
	_uState86Trans27 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(PACT_1_LEADER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(PACT_1_LEADER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(PACT_1_LEADER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1A_Accepted', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(PACT_1_LEADER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(PACT_1_LEADER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_P1LeaderTalked', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(PACT_1_LEADER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(PACT_1_LEADER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_P1LeaderTalked', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(PACT_1_LEADER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(PACT_1_LEADER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_P1LeaderTalked', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(PACT_1_LEADER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(PACT_1_LEADER)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_P1LeaderTalked', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(PACT_1_LEADER)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(PACT_1_LEADER)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(PACT_1_LEADER)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(PACT_1_LEADER)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(PACT_1_LEADER)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(PACT_1_LEADER)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1E_Accepted', 1, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(PACT_1_LEADER)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(PACT_1_LEADER)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(PACT_1_LEADER)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(PACT_1_LEADER)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1D_Accepted', 1, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(PACT_1_LEADER)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(PACT_1_LEADER)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(PACT_1_LEADER)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(PACT_1_LEADER)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 1, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(PACT_1_LEADER)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(PACT_1_LEADER)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 1, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(PACT_1_LEADER)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(PACT_1_LEADER)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1B_Accepted', 1, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(PACT_1_LEADER)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(PACT_1_LEADER)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ1C_Accepted', 1, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2A_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2B_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3B_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4B_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ2C_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_Accepted', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(PACT_1_LEADER)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(PACT_1_LEADER)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(PACT_1_LEADER)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(PACT_1_LEADER)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4A_P1LeaderTalked', 1, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(PACT_1_LEADER)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(PACT_1_LEADER)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'mf_P704_MQ4C_P1LeaderTalked', 1, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(PACT_1_LEADER)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(PACT_1_LEADER)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3A_P1LeaderTalked', 1, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(PACT_1_LEADER)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(PACT_1_LEADER)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'mf_P704_MQ3C_P1LeaderTalked', 1, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(PACT_1_LEADER)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(PACT_1_LEADER)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(PACT_1_LEADER)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(PACT_1_LEADER)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(PACT_1_LEADER)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions23 = nil

-- TO SELF: EndConversation Actions #24
_uEndActions24 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_24", "Dialog")
	_uEndActions24:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag24(PACT_1_LEADER)', 1, 2))
	_uEndActions24:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(PACT_1_LEADER)', 0, 4))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions24 = nil

-- TO SELF: EndConversation Actions #25
_uEndActions25 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_25", "Dialog")
	_uEndActions25:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag25(PACT_1_LEADER)', 1, 2))
	_uEndActions25:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(PACT_1_LEADER)', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions25 = nil

-- TO SELF: EndConversation Actions #26
_uEndActions26 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_26", "Dialog")
	_uEndActions26:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag26(PACT_1_LEADER)', 1, 2))
	_uEndActions26:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'mf_P704_P1LeaderTalkedLast', 1, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(PACT_1_LEADER)', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions26 = nil

-- TO SELF: EndConversation Actions #27
_uEndActions27 = GdsCreateTransition (_uState86, _uState86, "State_86", "EndActions_27", "Dialog")
	_uEndActions27:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag27(PACT_1_LEADER)', 1, 2))
	_uEndActions27:AddCondition (CScriptConditionDialogStopped("pl_Human", "pact_1_leader"))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(PACT_1_LEADER)', 0, 4))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 4))
	_uEndActions27 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState86, _uBeginState, "State_86", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pact_1_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState6 = nil
_uState9 = nil
_uState13 = nil
_uState15 = nil
_uState21 = nil
_uState25 = nil
_uState28 = nil
_uState31 = nil
_uState34 = nil
_uState38 = nil
_uState40 = nil
_uState43 = nil
_uState45 = nil
_uState49 = nil
_uState52 = nil
_uState57 = nil
_uState60 = nil
_uState63 = nil
_uState66 = nil
_uState69 = nil
_uState72 = nil
_uState76 = nil
_uState78 = nil
_uState80 = nil
_uState82 = nil
_uState86 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("pact_1_leader_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(PACT_1_LEADER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[190]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[190]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 190))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[199]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[199]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 199))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[208]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[208]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 208))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[217]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[217]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 217))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[182]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[182]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 182))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[183]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[183]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 183))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[184]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[184]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 184))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[185]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[185]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 185))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[186]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[186]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 186))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[187]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[187]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 187))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[188]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[188]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 188))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[189]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[189]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 189))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[191]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[191]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 191))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[192]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[192]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 192))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[193]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[193]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 193))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[194]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[194]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 194))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[195]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[195]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 195))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[196]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[196]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 196))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[197]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[197]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 197))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[198]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[198]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 198))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[200]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[200]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 200))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[201]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[201]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 201))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[202]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[202]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 202))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[203]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[203]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 203))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[204]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[204]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 204))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[205]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[205]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 205))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[206]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[206]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 206))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[207]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[207]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 207))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[209]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[209]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 209))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[210]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[210]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 210))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[211]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[211]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 211))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[212]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[212]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 212))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[213]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[213]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 213))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[214]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[214]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 214))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[215]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[215]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 215))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[216]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[216]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 216))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[218]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[218]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 218))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[219]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[219]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 219))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[220]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[220]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 220))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[221]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[221]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 221))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[222]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[222]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 222))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[223]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[223]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 223))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[233]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[233]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 233))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[224]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[224]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 224))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[225]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[225]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 225))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[226]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[226]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 226))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[227]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[227]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 227))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[228]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[228]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 228))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[229]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[229]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 229))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[230]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[230]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 230))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[231]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[231]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 231))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[232]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[232]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 232))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[234]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[234]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 234))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[235]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[235]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 235))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[236]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[236]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 236))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[246]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[246]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 246))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[237]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[237]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 237))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[238]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[238]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 238))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[239]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[239]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 239))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[240]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[240]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 240))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[241]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[241]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 241))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[242]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[242]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 242))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[243]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[243]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 243))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[244]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[244]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 244))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[245]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[245]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 245))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[247]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[247]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 247))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[248]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[248]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 248))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[249]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[249]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 249))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[250]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[250]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 250))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[251]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[251]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 251))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[252]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[252]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 252))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[256]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[256]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 256))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[260]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[260]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 260))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[271]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[271]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 271))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[280]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[280]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 280))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[289]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[289]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 289))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[298]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[298]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 298))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[253]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[253]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 253))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[254]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[254]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 254))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[255]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[255]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 255))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[257]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[257]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 257))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[258]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[258]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 258))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[259]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[259]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 259))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[261]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[261]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 261))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[262]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[262]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 262))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[263]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[263]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 263))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[264]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[264]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 264))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[265]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[265]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 265))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[266]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[266]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 266))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[267]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[267]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 267))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[268]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[268]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 268))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[269]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[269]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 269))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[270]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[270]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 270))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[272]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[272]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 272))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[273]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[273]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 273))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[274]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[274]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 274))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[275]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[275]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 275))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[276]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[276]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 276))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[277]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[277]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 277))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[278]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[278]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 278))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[279]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[279]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 279))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[281]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[281]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 281))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[282]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[282]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 282))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[283]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[283]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 283))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[284]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[284]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 284))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[285]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[285]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 285))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[286]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[286]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 286))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[287]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[287]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 287))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[288]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[288]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 288))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[290]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[290]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 290))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[291]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[291]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 291))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[292]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[292]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 292))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[293]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[293]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 293))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[294]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[294]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 294))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[295]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[295]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 295))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[296]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[296]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 296))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[297]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[297]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 297))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[299]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[299]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 299))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[300]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[300]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 300))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[301]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[301]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 301))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[302]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[302]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 302))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[303]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[303]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 303))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[304]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[304]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 304))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[305]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[305]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 305))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[306]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[306]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 306))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[307]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[307]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 307))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[308]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[308]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 308))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[309]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[309]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 309))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[310]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[310]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 310))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[311]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[311]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 311))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[312]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[312]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 312))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[313]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[313]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 313))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[314]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[314]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 314))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[315]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[315]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 315))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[316]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[316]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 316))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[317]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[317]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 317))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[318]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[318]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 318))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[319]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[319]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 319))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[320]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[320]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 320))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[321]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[321]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 321))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[322]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[322]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 322))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[323]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[323]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 323))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[324]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[324]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 324))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[325]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[325]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 325))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[326]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[326]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 326))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[327]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[327]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 327))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[328]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[328]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 328))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[329]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[329]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 329))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[330]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[330]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 330))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[331]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[331]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 331))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[332]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[332]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 332))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[333]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[333]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 333))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[334]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[334]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 334))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[335]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[335]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 335))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[336]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[336]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 336))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[337]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[337]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 337))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[338]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[338]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 338))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[339]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[339]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 339))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[340]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[340]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 340))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[341]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[341]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 341))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[342]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[342]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 342))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[343]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[343]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 343))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[344]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[344]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 344))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[345]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[345]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 345))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[346]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[346]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 346))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[347]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[347]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 347))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[348]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[348]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 348))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[349]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[349]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 349))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[350]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[350]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 350))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'pact_1_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "pact_1_leader", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'pact_1_leader', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
