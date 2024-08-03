local _uSM = GdsCreateStateMachine ("nightsong_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState22 = GdsCreateState (_uSM, "State_22")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState31 = GdsCreateState (_uSM, "State_31")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('nightsong'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NIGHTSONG)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NIGHTSONG)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('nightsong', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("nightsong", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "nightsong"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NIGHTSONG)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('nightsong', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("nightsong")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NIGHTSONG)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mf_P708_Nightsong_SQ_05', 1, 2))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState4Trans1 = GdsCreateTransition (_uState2, _uState4, "State_2", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05', 1))
	_uState4Trans1:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_001", "What can you tell me, Shaikan?", 100, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: label
_uState4Trans2 = GdsCreateTransition (_uState7, _uState4, "State_7", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 1))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_009PC", "*Show the swords of the Norcaine leaders.*", 99, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_010PC", "These are the swords of three leaders of your people. While you were away, the castes have started fighting again. The new Dracon caste is under pressure of Sinistrim and Archon alike.", 109, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState4Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_011", "It was not easy to create them in the first place. But it worked so well I really thought they'd form the equilibrium between the other castes again, like they did in the days of my father.", 110, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_012PC", "They can be, but only with a strong leader.", 111, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_013", "I understand.", 112, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'mf_P708_Arg1_Done', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: label
_uState4Trans3 = GdsCreateTransition (_uState7, _uState4, "State_7", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 2))
	_uState4Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_014PC", "*Show the frozen fish.*", 99, 16777215))
	_uState4Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_015PC", "This is frozen fish, from one of your outposts on the Icewastes of Shalibar.", 114, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_016", "I didn't even know we had an outpost that remote. Where is this land?", 115, 16777215))
	_uState4Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_017PC", "It is of no consequence. It's more that the fish you see here is hardly the best possible nourishment for your people. I know that you do care for your people. They need their Emperess in every aspect of their life.", 116, 16777215))
	_uState4Trans3:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_018", "Do I have to tell them what to eat? When to sleep? And whom to marry? ", 117, 16777215))
	_uState4Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_019PC", "No, but to look after their wellbeing. It's what makes you such a good leader, that you care for the ones you lead.", 118, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'mf_P708_Arg2_Done', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: label
_uState4Trans4 = GdsCreateTransition (_uState7, _uState4, "State_7", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 3))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_020PC", "*Show the Amulet of Zarach.*", 99, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_021PC", "This Amulet has been blessed by Zarach himself, who is your creator. It shows how much he appreciates how you care for your people, just like he cares for his.", 120, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_022", "A blessing by Zarach himself. How did you come by that?", 121, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_023PC", "Is that really important?", 122, 16777215))
	_uState4Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_024", "No, you're right. It is a great gift, Shaikan. And one that would help me in my quest to unite the people of the Norcaine.", 123, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'mf_P708_Arg3_Done', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: label
_uState4Trans5 = GdsCreateTransition (_uState7, _uState4, "State_7", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_025PC", "*Show the wonders of the world.*", 99, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_026PC", "These are wonders of the world, that you'd be free to travel, when you're a Shadow. There are no limits, no borders.", 125, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_027", "I've roamed Eo for a long time, you know? When I was a travelling bard I travelled from Xu to Fiara, to Urgath. It was a great life I had. ", 126, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_028PC", "You could have it again, this freedom.", 127, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'mf_P708_Arg4_Done', 1, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans5 = nil

-- TO STATE: label
_uState4Trans6 = GdsCreateTransition (_uState7, _uState4, "State_7", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 5))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_029PC", "*Show the Armour of the Ravages.*", 99, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_030PC", "These are armourparts of Ravages, that helped the Soulcarrier in his quest to finally defeat Sorvina and Malacay.", 129, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_031", "Why are you showing me these?", 130, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_032PC", "These Ravages died in helping to save the world. They died not for themselves but for others.", 131, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_033", "And you think this makes them less monsterous?", 132, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_034PC", "It does, doesn't it? I know that you will never forgive the Shadows for killing your father but you also know whose hand was guiding them at that time.", 133, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_035", "Sorvinas.", 134, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_036PC", "Sorvina was Norcaine and yet she was a monster. You could be a Shadow and yet retain your care for others - as did Insali by the way.", 135, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'mf_P708_Arg5_Done', 1, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: label
_uState4Trans7 = GdsCreateTransition (_uState7, _uState4, "State_7", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 6))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_037PC", "*Tell her of Insalis love.*", 99, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_038PC", "There is something I have to tell you. Something you might already know.", 137, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_039", "What is it?", 138, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_040PC", "Insali is in love with you, truely, madly, deeply in love with you.", 139, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_041", "He... Why didn't he tell me himself?", 140, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_042PC", "He fully understands what you're going through. He went through the same stages. That's why he can't beg you to stay only because of his love to you, which would bind you here against your will.", 141, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_043", "I understand.", 142, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_044PC", "Do you love him back?", 143, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_045", "I have asked myself the same question multiple times, after I noticed his careful glances at me for the first time.", 144, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_046", "I think I care for him a great deal and if this body is capable of love I might even be able to love him someday.", 145, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_047PC", "I understand.", 146, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'mf_P708_Arg6_Done', 1, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState4Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState7Trans1 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 2))
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'mf_P708_Arg1_Done', 0, 2))
	_uState7Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05_1', 1))
	_uState7Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 735, 3, 1, 1))
	_uState7Trans1:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_009PC", "*Show the swords of the Norcaine leaders.*", 1, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: choice
_uState7Trans2 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 2))
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg2_Done', 0, 2))
	_uState7Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05_2', 1))
	_uState7Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 736, 1, 1, 1))
	_uState7Trans2:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_014PC", "*Show the frozen fish.*", 2, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: choice
_uState7Trans3 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 2))
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'mf_P708_Arg3_Done', 0, 2))
	_uState7Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05_3', 1))
	_uState7Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 737, 1, 1, 1))
	_uState7Trans3:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_020PC", "*Show the Amulet of Zarach.*", 3, 16777215))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans3 = nil

-- TO STATE: choice
_uState7Trans4 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T4", "Dialog")
	_uState7Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 2))
	_uState7Trans4:AddCondition (CScriptConditionValue('', 'mf_P708_Arg4_Done', 0, 2))
	_uState7Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05_4', 1))
	_uState7Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 738, 1, 1, 1))
	_uState7Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 739, 1, 1, 1))
	_uState7Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 740, 1, 1, 1))
	_uState7Trans4:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_025PC", "*Show the wonders of the world.*", 4, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 1, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans4 = nil

-- TO STATE: choice
_uState7Trans5 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T5", "Dialog")
	_uState7Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 2))
	_uState7Trans5:AddCondition (CScriptConditionValue('', 'mf_P708_Arg5_Done', 0, 2))
	_uState7Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05_5', 1))
	_uState7Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 741, 1, 1, 1))
	_uState7Trans5:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_029PC", "*Show the Armour of the Ravages.*", 5, 16777215))
	_uState7Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 1, 4))
	_uState7Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans5 = nil

-- TO STATE: choice
_uState7Trans6 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T6", "Dialog")
	_uState7Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 2))
	_uState7Trans6:AddCondition (CScriptConditionValue('', 'mf_P708_Arg6_Done', 0, 2))
	_uState7Trans6:AddCondition (CScriptConditionValue('', 'mf_P708_ShowDiscussed', 1, 2))
	_uState7Trans6:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_037PC", "*Tell her of Insalis love.*", 6, 16777215))
	_uState7Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 1, 4))
	_uState7Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans6 = nil

-- TO STATE: choice
_uState7Trans7 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T7", "Dialog")
	_uState7Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 2))
	_uState7Trans7:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_048PC", "I'm still collecting material, Emperess.", 7, 16777215))
	_uState7Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 1, 4))
	_uState7Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans7 = nil

-- TO STATE: choice
_uState7Trans8 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T8", "Dialog")
	_uState7Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 2))
	_uState7Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 0, 4))
	_uState7Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NIGHTSONG)', 1, 4))
	_uState7Trans8:AddAction (CScriptActionShowChoices())
	_uState7Trans8 = nil

-- TO STATE: choice
_uState7Trans9 = GdsCreateTransition (_uState4, _uState7, "State_4", "State_7_T9", "Dialog")
	_uState7Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P708_Arg1_Done', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P708_Arg2_Done', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P708_Arg3_Done', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P708_Arg4_Done', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P708_Arg5_Done', 1, 2), CScriptConditionValue('', 'mf_P708_Arg6_Done', 1, 2)))))) ))
	_uState7Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState7Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState15Trans1 = GdsCreateTransition (_uState2, _uState15, "State_2", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_SQ_05', 1) ))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState15Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 2))
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'mf_P708_WastelandAsked', 0, 2))
	_uState18Trans1:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_054PC", "Can you tell me what happened?", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 2))
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_TurnAsked', 0, 2))
	_uState18Trans2:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_059PC", "This seems wrong. Is it possible to turn you back?", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 2))
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'mf_P708_QuestGot', 0, 2))
	_uState18Trans3:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_067PC", "I see now, why he spoke of an important decision.", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 2))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 0, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NIGHTSONG)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionShowChoices())
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState15, _uState18, "State_15", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P708_NightsongMet', 0, 2) ))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans5 = nil

-- TO STATE: choice
_uState18Trans6 = GdsCreateTransition (_uState15, _uState18, "State_15", "State_18_T6", "Dialog")
	_uState18Trans6:AddCondition (CScriptConditionValue('', 'mf_P708_NightsongMet', 0, 2))
	_uState18Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_049", "You are Shaikan, aren't you?", 148, 16777215))
	_uState18Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_050PC", "I am, Emperess.", 149, 16777215))
	_uState18Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_051", "Emperess? This seems so far away. My memory is like a blurr.", 150, 16777215))
	_uState18Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_052PC", "But you still are the Emperess of the Norcaine.", 151, 16777215))
	_uState18Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_053", "Maybe I was until I died in the Wastelands of Sorrow. I'm not sure whether I am now.", 152, 16777215))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'mf_P708_NightsongMet', 1, 4))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans6 = nil

-- TO STATE: choice
_uState18Trans7 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T7", "Dialog")
	_uState18Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 1))
	_uState18Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_054PC", "Can you tell me what happened?", 99, 16777215))
	_uState18Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_055", "I remember only a few things. You'd better ask Insali about it.", 154, 16777215))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState18Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_056PC", "Insali?", 155, 16777215))
	_uState18Trans7:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_057", "It's how they call the Shadowwarrior, wielding the One Blade.", 156, 16777215))
	_uState18Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_058PC", "Alright. I will ask him about it.", 157, 16777215))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'mf_P708_WastelandAsked', 1, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans7 = nil

-- TO STATE: choice
_uState18Trans8 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T8", "Dialog")
	_uState18Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 2))
	_uState18Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_059PC", "This seems wrong. Is it possible to turn you back?", 99, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_060", "I've fought this transformation with all my heart. But it was necessary I am told.", 159, 16777215))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState18Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_061PC", "Why was it necessary?", 160, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_062", "They say I would have died, had they not transformed me. It hurt - a lot! But Insali was there, keeping watch, drying the tears that I wept.", 161, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_063PC", "This Insali must be a very nice Shadow.", 162, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_064", "He is the wielder of the One Blade, the one, who guided you here.", 163, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_065PC", "Of course, he's surely the best to understand what you're going through.", 164, 16777215))
	_uState18Trans8:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_066", "He does. But he also kept so distant, especially after the First Shadow foretold, that you would come.", 165, 16777215))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'mf_P708_TurnAsked', 1, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState18Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState22Trans1 = GdsCreateTransition (_uState22, _uState22, "State_22", "State_22_T1", "Dialog")
	_uState22Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 2))
	_uState22Trans1:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_082PC", "I'm as used to it as you are, after eight years of rulership, I am sure. But I will try to help you form a decision. May I speak to your father and Insali about it?", 1, 16777215))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 1, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState22Trans1 = nil

-- TO STATE: choice
_uState22Trans2 = GdsCreateTransition (_uState22, _uState22, "State_22", "State_22_T2", "Dialog")
	_uState22Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 2))
	_uState22Trans2:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_084PC", "I can do this only later, first I have an other important task.", 2, 16777215))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 1, 4))
	_uState22Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState22Trans2 = nil

-- TO STATE: choice
_uState22Trans3 = GdsCreateTransition (_uState22, _uState22, "State_22", "State_22_T3", "Dialog")
	_uState22Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 2))
	_uState22Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 0, 4))
	_uState22Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NIGHTSONG)', 1, 4))
	_uState22Trans3:AddAction (CScriptActionShowChoices())
	_uState22Trans3 = nil

-- TO STATE: choice
_uState22Trans4 = GdsCreateTransition (_uState18, _uState22, "State_18", "State_22_T4", "Dialog")
	_uState22Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 3))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_067PC", "I see now, why he spoke of an important decision.", 99, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_068", "I don't know who you mean, but they told me that I would have to make a decision.", 167, 16777215))
	_uState22Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState22Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState22Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_069PC", "What kind of decision?", 168, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_070", "They've noticed how I fought the transformation, that's why they've not yet finalized it. I still retain a part of my old self.", 169, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_071", "But they told me, that I had to decide, whether I want to be a Shadow or be transformed back into a Norcaine.", 170, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_072PC", "This surely is no difficult decison? After you fought the transformation so heavily, you'll surely decide to go back to your old self.", 171, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_073", "It's not that easy, Shaikan. I didn't like my old self either. All this diplomacy, these intrigues, the courting and fighting. Days without end of ruling and decision making.", 172, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_074PC", "I understand.", 173, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_075", "Do you? For I don't understand my reluctance myself.", 174, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_076PC", "I'm sure your father would like you to return to your old self.", 175, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_077", "And Insali wants me to stay here. I know it, when he looks at me, although he'd never speak it out loud.", 176, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_078PC", "So the decision is more difficult.", 177, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_079", "I doubt that I am able to make it on my own. I remember you now. You're from the Shaikan council of Elders.", 178, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_080PC", "I am, Nightsong.", 179, 16777215))
	_uState22Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_081", "Then you are used to make difficult decisions. Can't you help me decide?", 180, 16777215))
	_uState22Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState22Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState22, _uState22, "State_22", "State_22", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState22, _uBeginState, "State_22", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState25Trans1 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'mf_P708_Nightsong_SQ_05_6', 1, 2))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P708_Nightsong_SQ_05', 1, 2) ))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: elseif
_uState25Trans2 = GdsCreateTransition (_uState4, _uState25, "State_4", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg1_Done', 1, 2))
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg2_Done', 1, 2))
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg3_Done', 1, 2))
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg4_Done', 1, 2))
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg5_Done', 1, 2))
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_Arg6_Done', 1, 2))
	_uState25Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_002", "Now you've shown me how my people suffer, how I am needed as a leader and even blessed by the dark God Zarach himself.", 101, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_003", "You've also told me, that there's more to life than duty. That there is freedom, ability to explore, to roam the world in ways normal mortals will never know.", 102, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_004", "You showed me, that the Shadows aren't the monsterous creatures I always saw in them and that there is one Shadow in particular who has feelings for me, which I might even reciprocate.", 103, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_005", "And on the other hand there is my father, whose education and heritage I hold dear and who taught me to sometimes favour the wellbeing of others over my own wellbeing.", 104, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_006", "I'm overwhelmed by the arguments in favour of both decisions. I doubt that I will ever be able to reach that decision, let alone take it.", 105, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_007", "If you were in my place, Shaikan. How would you decide?", 106, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_008PC", "I can't take a decision, that is so extremely affecting your life and your own possible future.", 107, 16777215))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'mf_P708_Shadowsong_SQ_05_6', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'mf_P708_Nightsong_SQ_05', 0, 4))
	_uState25Trans2:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_05_6', 1, 0))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState25Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState27Trans1 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 2))
	_uState27Trans1:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_088PC", "*Advise her to remain a Shadow.*", 1, 16777215))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 1, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState27Trans1 = nil

-- TO STATE: choice
_uState27Trans2 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T2", "Dialog")
	_uState27Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 2))
	_uState27Trans2:AddAction (CScriptActionChoice("P708_DLG_NIGHTSONG_096PC", "*Advise her to become Norcaine again.*", 2, 16777215))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 1, 4))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState27Trans2 = nil

-- TO STATE: choice
_uState27Trans3 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T3", "Dialog")
	_uState27Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 2))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 0, 4))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NIGHTSONG)', 1, 4))
	_uState27Trans3:AddAction (CScriptActionShowChoices())
	_uState27Trans3 = nil

-- TO STATE: choice
_uState27Trans4 = GdsCreateTransition (_uState25, _uState27, "State_25", "State_27_T4", "Dialog")
	_uState27Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_086", "Please, Shaikan! I implore you. I can't make this decision alone. Please advise me. I will follow your advice no matter the consequences.", 185, 16777215))
	_uState27Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_087PC", "*sighs* As you have stated yourself, this is an extremely difficult decision.", 186, 16777215))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState27Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState31Trans1 = GdsCreateTransition (_uState7, _uState31, "State_7", "State_31_T1", "Dialog")
	_uState31Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 7))
	_uState31Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_048PC", "I'm still collecting material, Emperess.", 99, 16777215))
	_uState31Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NIGHTSONG)', 1, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(NIGHTSONG)', 0, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState31Trans1 = nil

-- TO STATE: endconversation
_uState31Trans2 = GdsCreateTransition (_uState22, _uState31, "State_22", "State_31_T2", "Dialog")
	_uState31Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 1))
	_uState31Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_082PC", "I'm as used to it as you are, after eight years of rulership, I am sure. But I will try to help you form a decision. May I speak to your father and Insali about it?", 99, 16777215))
	_uState31Trans2:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_083", "Please do so, Shaikan. ", 182, 16777215))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState31Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NIGHTSONG)', 1, 4))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState31Trans2 = nil

-- TO STATE: endconversation
_uState31Trans3 = GdsCreateTransition (_uState22, _uState31, "State_22", "State_31_T3", "Dialog")
	_uState31Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 2))
	_uState31Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_084PC", "I can do this only later, first I have an other important task.", 99, 16777215))
	_uState31Trans3:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_085", "I have not too much time in this state, Shaikan! Please hurry!", 184, 16777215))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState31Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NIGHTSONG)', 1, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState31Trans3 = nil

-- TO STATE: endconversation
_uState31Trans4 = GdsCreateTransition (_uState27, _uState31, "State_27", "State_31_T4", "Dialog")
	_uState31Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 1))
	_uState31Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_088PC", "*Advise her to remain a Shadow.*", 99, 16777215))
	_uState31Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_089PC", "Leading a whole race is a great burden, I know that. Even though I have become an Elder by my own choosing, I have sometimes wished, to just lay that burden aside and be free again.", 188, 16777215))
	_uState31Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState31Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState31Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_090PC", "You have never had that kind of choice and always craved for unlimited freedom.", 189, 16777215))
	_uState31Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_091", "You are saying, that I should take what I've always wanted.", 190, 16777215))
	_uState31Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_092PC", "It has never been so close at hand, Nightsong. And you have someone to guide you, to help you out, to love you.", 191, 16777215))
	_uState31Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_093", "This is something I craved for as well, especially after the death of my father. I only hope that he'll not be too disappointed.", 192, 16777215))
	_uState31Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_094PC", "He'll get over it, especially when I can convince him, that his daughter is happy and has taken her decision with open eyes.", 193, 16777215))
	_uState31Trans4:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_095", "Thank you, Shaikan. As a Shadow, I won't be needing this amulet anymore. Please wear it as a memory of me and of what I was and of what I've become.", 194, 16777215))
	_uState31Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uState31Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NIGHTSONG)', 1, 4))
	_uState31Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState31Trans4 = nil

-- TO STATE: endconversation
_uState31Trans5 = GdsCreateTransition (_uState27, _uState31, "State_27", "State_31_T5", "Dialog")
	_uState31Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 2))
	_uState31Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_096PC", "*Advise her to become Norcaine again.*", 99, 16777215))
	_uState31Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_097PC", "I've had many shortcomings as a leader myself but one thing was always the most important thing in my life - the wellbeing of my people, which I was always willing to put up front before my own interest.", 196, 16777215))
	_uState31Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NIGHTSONG)', 0, 4))
	_uState31Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NIGHTSONG)', 0, 4))
	_uState31Trans5:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_098", "You are saying, that this is, what I should do as well. ", 197, 16777215))
	_uState31Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_NIGHTSONG_099PC", "For the wellbeing of your people and the peace and future of Eo, yes, Emperess. This is, what you should do.", 198, 16777215))
	_uState31Trans5:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_100", "Very well, Shaikan. I only regret losing Insali as a councelor. Please tell him I am sorry.", 199, 16777215))
	_uState31Trans5:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_101", "And as a last farewell to the Shadowlands I will ask our smiths to reforge the armour of these Ravages into a Shadowpulsearmour. Wear it in rememberance of me and their kind.", 200, 16777215))
	_uState31Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uState31Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NIGHTSONG)', 1, 4))
	_uState31Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState31Trans5 = nil

-- TO STATE: endconversation
_uState31Trans6 = GdsCreateTransition (_uState1, _uState31, "State_1", "State_31_T6", "Dialog")
	_uState31Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P708_Nightsong_SQ_05', 1, 2) ))
	_uState31Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P708_Nightsong_SQ_05_6', 1, 2) ))
	_uState31Trans6:AddAction (CScriptActionSay("nightsong", "P708_DLG_NIGHTSONG_102", "DEBUG: no root if() nor elseif() evaluated to true", 201, 16777215))
	_uState31Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "nightsong"))
	_uState31Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NIGHTSONG)', 1, 4))
	_uState31Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NIGHTSONG)', 1, 4))
	_uState31Trans6 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NIGHTSONG)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NIGHTSONG)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NIGHTSONG)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uEndActions2:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_05', 1, 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P708_NightsongDiscussed', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P708_QuestGot', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NIGHTSONG)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NIGHTSONG)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NIGHTSONG)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NIGHTSONG)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P708_Arg_Done', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('pl_Human', 'af_P708_Shadowsong_Is_Shadow', 1, 4))
	_uEndActions4:AddAction (CScriptActionDialogEnable('Nightsong', 0))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NIGHTSONG)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(NIGHTSONG)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P708_Arg_Done', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('pl_Human', 'af_P708_Shadowsong_Is_Shadow', 0, 4))
	_uEndActions5:AddAction (CScriptActionDialogEnable('Nightsong', 0))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NIGHTSONG)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(NIGHTSONG)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "nightsong"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NIGHTSONG)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 4))
	_uEndActions6 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState31, _uBeginState, "State_31", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('nightsong', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState2 = nil
_uState4 = nil
_uState7 = nil
_uState15 = nil
_uState18 = nil
_uState22 = nil
_uState25 = nil
_uState27 = nil
_uState31 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("nightsong_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NIGHTSONG)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NIGHTSONG)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[183]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[183]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 183))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[182]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[182]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 182))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[184]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[184]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 184))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[185]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[185]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 185))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[186]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[186]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 186))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[187]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[187]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 187))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[195]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[195]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 195))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[188]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[188]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 188))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[189]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[189]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 189))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[190]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[190]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 190))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[191]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[191]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 191))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[192]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[192]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 192))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[193]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[193]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 193))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[194]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[194]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 194))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[196]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[196]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 196))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[197]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[197]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 197))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[198]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[198]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 198))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[199]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[199]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 199))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[200]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[200]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 200))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[201]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[201]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 201))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'nightsong'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "nightsong", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'nightsong', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
