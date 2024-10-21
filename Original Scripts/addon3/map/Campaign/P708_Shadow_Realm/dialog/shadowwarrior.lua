local _uSM = GdsCreateStateMachine ("shadowwarrior_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState12 = GdsCreateState (_uSM, "State_12")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 2))
	_uState2Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_MQ_05_2', 2) ))
	_uState2Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'SSSR_MQ_05_3', 2) ))
	_uState2Trans1:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_002PC", "I'll go complete your quests.", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 2))
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'mf_P708_ShadowWarriorQuests_Reported', 0, 2))
	_uState2Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_MQ_05_2', 2))
	_uState2Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'SSSR_MQ_05_3', 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_003PC", "I've fulfilled your quests.", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 2))
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'mf_P708_WastelandAsked', 1, 2))
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'mf_P708_WastelandDiscussed', 0, 2))
	_uState2Trans3:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_013PC", "What happened after Wastelands of Sorrow?", 3, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: choice
_uState2Trans4 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 2))
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'mf_P708_NightsongDiscussed', 1, 2))
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'mf_P708_FoolDiscussed', 0, 2))
	_uState2Trans4:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_020PC", "You're a fool.", 4, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: choice
_uState2Trans5 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 2))
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'mf_P708_FirstShadowDiscussed', 0, 2))
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'mf_P708_FoolDiscussed', 1, 2))
	_uState2Trans5:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_026PC", "Who is this First Shadow?", 5, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans5 = nil

-- TO STATE: choice
_uState2Trans6 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 2))
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'mf_P708_Hesitate1Discussed', 0, 2))
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'mf_P708_FoolDiscussed', 1, 2))
	_uState2Trans6:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_039PC", "What makes you hesitate?", 6, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 1, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: choice
_uState2Trans7 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 2))
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'mf_P708_Hesitate2Discussed', 0, 2))
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'mf_P708_Hesitate1Discussed', 1, 2))
	_uState2Trans7:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_044PC", "But there is more, isn't it?", 7, 16777215))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 1, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans7 = nil

-- TO STATE: choice
_uState2Trans8 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T8", "Dialog")
	_uState2Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 2))
	_uState2Trans8:AddCondition (CScriptConditionValue('', 'mf_P708_ShowDiscussed', 0, 2))
	_uState2Trans8:AddCondition (CScriptConditionValue('', 'mf_P708_FoolDiscussed', 1, 2))
	_uState2Trans8:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_062PC", "If you want to win her, you have to show her the way of the Shadows.", 8, 16777215))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 1, 4))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans8 = nil

-- TO STATE: choice
_uState2Trans9 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T9", "Dialog")
	_uState2Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 2))
	_uState2Trans9:AddAction (CScriptActionChoice("P708_DLG_SHADOWWARRIOR_078PC", "We have to talk, but first I have more important tasks.", 9, 16777215))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 1, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans9 = nil

-- TO STATE: choice
_uState2Trans10 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T10", "Dialog")
	_uState2Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 2))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans10:AddAction (CScriptActionShowChoices())
	_uState2Trans10 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('shadowwarrior'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SHADOWWARRIOR)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SHADOWWARRIOR)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('shadowwarrior', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("shadowwarrior", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "shadowwarrior"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHADOWWARRIOR)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SHADOWWARRIOR)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('shadowwarrior', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("shadowwarrior")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T11", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SHADOWWARRIOR)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_001", "You're back.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans12 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T12", "Dialog")
	_uState2Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 3))
	_uState2Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_013PC", "What happened after Wastelands of Sorrow?", 99, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_014", "Zazhut appeared from the open portal and with him seemed to flow magic and energy in power unmeasurable.", 113, 16777215))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState2Trans12:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_015", "It was so much destructive energy, that almost everyone near the portal was killed instantly. I am surprised that Caine and Sariel survived but I guess he could bring himself and her into safety.", 114, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_016PC", "The others weren't that lucky.", 115, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_017", "If I had had the opportunity, I would have saved them as well, but I had hardly time to save myself and Nightsong and was myself gravely wounded.", 116, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_018", "I don't know how I managed to get to the innermost Shadow but there I could heal and it was decided that to save Nightsong, she would have to be turned into a Shadow as well.", 117, 16777215))
	_uState2Trans12:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_019", "I was in no position to argue at that time. Otherwise, I might have given her the choice - to either die or be transformed. But I can't change what happened. I … nevermind.", 118, 16777215))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'mf_P708_WastelandDiscussed', 1, 4))
	_uState2Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans12 = nil

-- TO STATE: choice
_uState2Trans13 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T13", "Dialog")
	_uState2Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 4))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_020PC", "You're a fool.", 99, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_021", "Am I? Then leave me in peace.", 120, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_022PC", "Then you loose your chance to win her.", 121, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_023", "So you know?", 122, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_024PC", "Know that you love her? Even if you were six dimensions away this would still stand out against the wind.", 123, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_025", "*sighs* I don't know what to do. The First Shadow has decreed that she has to decide after you were here.", 124, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mf_P708_FoolDiscussed', 1, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans13 = nil

-- TO STATE: choice
_uState2Trans14 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T14", "Dialog")
	_uState2Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 5))
	_uState2Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_026PC", "Who is this First Shadow?", 99, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_027", "He is our Master. The first Shadow to arise on this world, after they landed with the dark star.", 126, 16777215))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_028PC", "This is all very weird, Shadowwarrior. The Shadows are not from this world?", 127, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_029", "No they are not. They are from beyond the stars although I'm not sure where exactly that is. The First Shadow retains all the memories of our origin.", 128, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_030PC", "But he doesn't share them.", 129, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_031", "Only small portions - and only if necessary.", 130, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_032", "He knows much, and from that knowledge he has guided the Shadows for many milennia. He has seen the Shapers rise and fall, he has seen the Dragons rule Eo only to be bested again by Human hunters.", 131, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_033", "He knows about Zazhut, knows what he is and what drives him. That much he disclosed. But he didn't share what nor why he doesn't want us to be involved.", 132, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_034PC", "I guess there is nothing we can offer you, that would change his mind?", 133, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_035", "You are right, Shaikan. The only thing we crave for is to return to our Origin and that is impossible, even for the Gods. If they were capable of it, they would have done so, when the Dark Star crashed on this planet.", 134, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_036", "And even if we agreed. Zazhut is extremely powerful and cunning. It would be a very difficult task to lure him into the Shadow Realm at all.", 135, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_037PC", "Zarach was right - you were bluffing.", 136, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_038", "Maybe just a little bit.", 137, 16777215))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'mf_P708_FirstShadowDiscussed', 1, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans14 = nil

-- TO STATE: choice
_uState2Trans15 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T15", "Dialog")
	_uState2Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 6))
	_uState2Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_039PC", "What makes you hesitate?", 99, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_040", "Why I hesitate, you ask? Think of the irony of this situation.", 139, 16777215))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_041", "I, who has fought valiantly against the transformation, should ask her, to consent willingly to it?", 140, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_042", "And that not out of ulterior motives but just for my own satisfaction, to have her as a lover.", 141, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_043PC", "I see.", 142, 16777215))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'mf_P708_Hesitate1Discussed', 1, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans15 = nil

-- TO STATE: choice
_uState2Trans16 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T16", "Dialog")
	_uState2Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 7))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_044PC", "But there is more, isn't it?", 99, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_045", "You are quite a good judge of character, Shaikan. Yes, there is more.", 144, 16777215))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_046", "When I took up the Sword, to save this cursed world, I was determined to fight the pain and the transformation.", 145, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_047", "Hokan Ashir used this determination against me by making me his errand-boy.", 146, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_048", "He got payback when the Phoenixguardian and I eradicated the Circle once and for all. Isn't it ironic, that back then we had a being of pure Archfire already at hand?", 147, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_049", "The Phoenixguardian and I left the bonetemple and Xu and set out to enjoy the wonders of the world, while we still could.", 148, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_050", "Fits of pain and strange visions made it more and more difficult for me to hold up. She supported me as best she could but I could see it in her eyes. She didn't believe I would make it.", 149, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_051", "This gift of Shadows, to see through any web of lies is at the same time a curse. For example I see, that not all of your party play with open cards.", 150, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_052PC", "You don't have to be a Shadow to realise that.", 151, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_053", "Probably not.", 152, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_054PC", "What happened to you and the Phoenixguardian?", 153, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_055", "Soon after my last fit, we parted ways.", 154, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_056PC", "You left her.", 155, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_057", "I thought it best for both of us.", 156, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_058PC", "Wouldn't you rather have her, make that choice?", 157, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_059", "It's who I am. I've always made decisions concerning my life by myself. I never relied on anyone else. Never trusted anyone far enough.", 158, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_060PC", "Except for this time. This decision affects your life deeply and you're not able to make the decision yourself.", 159, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_061", "Now you know why I hesitate.", 160, 16777215))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'mf_P708_Hesitate2Discussed', 1, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState2Trans16 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shadowwarrior"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "shadowwarrior"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shadowwarrior', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHADOWWARRIOR)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState12Trans1 = GdsCreateTransition (_uState2, _uState12, "State_2", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 1))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_002PC", "I'll go complete your quests.", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shadowwarrior"))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHADOWWARRIOR)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: endconversation
_uState12Trans2 = GdsCreateTransition (_uState2, _uState12, "State_2", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 2))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_003PC", "I've fulfilled your quests.", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_004", "Good. Now I'll show you the object you've come for.", 103, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_005PC", "Can I ask you a question?", 104, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_006", "I can hardly prevent it.", 105, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_007PC", "Why are you so intent on playing hostile?", 106, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_008", "Why are you so intent on playing friendly?", 107, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_009PC", "I asked first.", 108, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_010", "It's not you or anyone of your party…. It's what you stand for.", 109, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_011PC", "What do we stand for?", 110, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_012", "The most important decision of my entire life since I took up that cursed Sword in the Firefangs!", 111, 16777215))
	_uState12Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shadowwarrior"))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SHADOWWARRIOR)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: endconversation
_uState12Trans3 = GdsCreateTransition (_uState2, _uState12, "State_2", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 8))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_062PC", "If you want to win her, you have to show her the way of the Shadows.", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_063", "I don't know. I've been a Shadow for only twenty years. How can I show her?", 162, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_064PC", "That makes you ideal for her. How many other Shadows have been transformed in the last decades?", 163, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_065", "None - you are right.", 164, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_066PC", "You seem to have come to acceptance with your new race and used them even to save the world.", 165, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_067", "Two Ravages died, killed by Malar, when they helped the Soulcarrier disable the defense-towers Malacay used to protect Steelcoast.", 166, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_068PC", "Maybe this can show her, that the Shadows aren't the monsters she sees in them. After all, they killed her father.", 167, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_069PC", "What else can you think of, that would demonstrate to her, that being a Shadow has its advantages.", 168, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_070", "We're experts at stealth and thus can deal a lot of damage while unseen.", 169, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_071PC", "She hates fight and warcraft. I doubt that this will be a bonus for you.", 170, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_072", "We can travel the world freely. The Shadowrealm has many layers in which we can move, unharmed by the Sea of Elements.", 171, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_073PC", "Did you tell her that?", 172, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_074", "She knows already but I guess I'd have to bring her some wonders of the world, to make her see and believe.", 173, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_075PC", "I will try to find these wonders and maybe some armour of those poor Ravages. And I will tell her, that you love her. Maybe this will help her decide.", 174, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("shadowwarrior", "P708_DLG_SHADOWWARRIOR_076", "No you can't tell her that!", 175, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_077PC", "Yes I can! And I will, as you are too hesitant to do it yourself.", 176, 16777215))
	_uState12Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shadowwarrior"))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SHADOWWARRIOR)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: endconversation
_uState12Trans4 = GdsCreateTransition (_uState2, _uState12, "State_2", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 9))
	_uState12Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P708_DLG_SHADOWWARRIOR_078PC", "We have to talk, but first I have more important tasks.", 99, 16777215))
	_uState12Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "shadowwarrior"))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SHADOWWARRIOR)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(SHADOWWARRIOR)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SHADOWWARRIOR)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SHADOWWARRIOR)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "shadowwarrior"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SHADOWWARRIOR)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHADOWWARRIOR)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SHADOWWARRIOR)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "shadowwarrior"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P708_ShadowWarriorQuests_Reported', 1, 4))
	_uEndActions2:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_MQ_05_4', 1, 0))
	_uEndActions2:AddAction (CScriptActionDialogEnable('Nightsong', 1))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SHADOWWARRIOR)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHADOWWARRIOR)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SHADOWWARRIOR)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "shadowwarrior"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P708_ShowDiscussed', 1, 4))
	_uEndActions3:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_05_4', 1, 0))
	_uEndActions3:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_SQ_05_5', 1, 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SHADOWWARRIOR)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHADOWWARRIOR)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SHADOWWARRIOR)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "shadowwarrior"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SHADOWWARRIOR)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHADOWWARRIOR)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SHADOWWARRIOR)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SHADOWWARRIOR)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('shadowwarrior', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SHADOWWARRIOR)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState12 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("shadowwarrior_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHADOWWARRIOR)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SHADOWWARRIOR)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'shadowwarrior'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "shadowwarrior", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'shadowwarrior', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
