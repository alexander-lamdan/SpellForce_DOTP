local _uSM = GdsCreateStateMachine ("sariel_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState11 = GdsCreateState (_uSM, "State_11")
_uState14 = GdsCreateState (_uSM, "State_14")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('sariel'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SARIEL)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SARIEL)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('sariel', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("sariel", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "sariel"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SARIEL)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('sariel', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("sariel")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SARIEL)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('sariel', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_Sariel_MQ_03_1', 1, 2))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('sariel', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P707_DLG_SARIEL_002PC", "Nothing so far, I will come back later", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 0, 2))
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_CaineComingOutDone', 1, 2))
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_TrueStory', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P707_DLG_SARIEL_004PC", "There's something I need to tell you. /The story with Caine's part/", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 0, 2))
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'mf_P707_CaineComingOutDone', 1, 2))
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'mf_P707_CaineDecided', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P707_DLG_SARIEL_015PC", "I've found out something about your past. /The story without Caine's part/", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 0, 2))
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'mf_P707_MQ_03_1_Done', 1, 2))
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'mf_P707_Sariel_MQ_03_2', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P707_DLG_SARIEL_022PC", "We've found almost empty inner logs of you. I'm not sure what to do with them. Do you remember anything about them?", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SARIEL)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionShowChoices())
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState2, _uState4, "State_2", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionValue('', 'mf_P707_Sariel_MQ_03_1', 1, 2))
	_uState4Trans6:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_001", "What did you find out?", 100, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 2))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_004PC", "There's something I need to tell you. /The story with Caine's part/", 99, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_005", "You sound concerned. What is it?", 104, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_006PC", "More than a thousand years ago, you were found by elves, who helped you recover after you were gravely wounded. While on your way to Tirganach, you were attacked by a young Elf, blinded by love, but repelled his attack by instinctive magic.", 105, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_007PC", "He struck a deal with a demon lord to be able to hunt you down but you spoiled his attack a second time.", 106, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_008PC", "This hunter came under the influence of Malacay, who procured him with a gas, that knocked you out so that he could bring you here.", 107, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_009PC", "When he witnessed Malacays research, which was torture to you, this hunter remembered his true feelings for you. Pained, that he couldn't save you, he fled the place, promising himself to be a wiser man and better judge from that day on.", 108, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_010PC", "But obviously not even Malacay could get past your mental defenses and so you remained a prisoner in stasis until our expedition found you and revived you with Dragonblood.", 109, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_011", "You know who this hunter is.", 110, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_012PC", "You do too. And if it wasn't for him, you'd still be in stasis.", 111, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_013", "How could he do this to me?", 112, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_014PC", "Love leads to strange reactions sometimes. I think he honestly regrets what he did but is wise enough to accept, that he can't change these past events.", 113, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'mf_P707_TrueStory', 1, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'mf_P707_CaineDecided', 1, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans7 = nil

-- TO STATE: choice
_uState4Trans8 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T8", "Dialog")
	_uState4Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 3))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_015PC", "I've found out something about your past. /The story without Caine's part/", 99, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_016", "Please tell me!", 115, 16777215))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_017PC", "You were wounded in some kind of explosion and found by some elves, who healed you.", 116, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_018PC", "Soon after you left them and came by the infamous alchemist Malacay, who lured you into his laboratory, knocked you out and used you for his experiments.", 117, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_019PC", "But obviously not even Malacay could get past your mental defenses and so you remained a prisoner in stasis until our expedition found you and revived you with Dragonblood.", 118, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_020", "Thank you, Shaikan. This something to start with, although it still doesn't answer who I really am.", 119, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_021PC", "I doubt, even Malacay knew it.", 120, 16777215))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'mf_P707_CaineDecided', 1, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState4Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('sariel', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState9Trans1 = GdsCreateTransition (_uState2, _uState9, "State_2", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Sariel_MQ_03_1', 1, 2) ))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState9Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('sariel', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState11Trans1 = GdsCreateTransition (_uState9, _uState11, "State_9", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_SarielMet', 0, 2) ))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: else
_uState11Trans2 = GdsCreateTransition (_uState9, _uState11, "State_9", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_SarielMet', 0, 2))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_029", "You've found the seal! Will you now help me with my problem?", 128, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_030PC", "Of course, Sariel, although we don't have much time. Can you tell me anything about Steelcoast, anything you remember?", 129, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_031", "As I said, Shaikan. It's all a blurr. Every now and then I see flashes of fire as of an explosion of some kind. But I can't connect it.", 130, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_032PC", "This must be frustrating.", 131, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_033", "It is, Shaikan. And I hope that you can change something about it.", 132, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_034PC", "Where were you, when the expedition found you?", 133, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_035", "It was some kind of stasis-chamber I think I was trapped in there for a very long time. And although I don't remember what happened, the feelings I have about it...", 134, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_036PC", "You'd like to smash it?", 135, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_037", "Smash it, incinerate it, freeze it, whatever is the most destructive!", 136, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_038PC", "I'll try to find anything. There must be some old documents or notes somewhere.", 137, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_039", "Ohhhh!", 138, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_040PC", "Sariel! What is it?", 139, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_041", "It was … just … some kind of flashback.", 140, 16777215))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'mf_P707_SarielMet', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('pl_Human', 'af_P707_FactCaineWasHereBefore', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState11Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('sariel', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState14Trans1 = GdsCreateTransition (_uState4, _uState14, "State_4", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 1))
	_uState14Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_002PC", "Nothing so far, I will come back later", 99, 16777215))
	_uState14Trans1:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_003", "Have to be some information out there! Please find those for me!", 102, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SARIEL)', 1, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState14Trans1 = nil

-- TO STATE: endconversation
_uState14Trans2 = GdsCreateTransition (_uState4, _uState14, "State_4", "State_14_T2", "Dialog")
	_uState14Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 4))
	_uState14Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_022PC", "We've found almost empty inner logs of you. I'm not sure what to do with them. Do you remember anything about them?", 99, 16777215))
	_uState14Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_023", "As I've told you, there was this machine, where Malacay used those memory cards. If you can find this machine, you might be able to fill these logs.", 122, 16777215))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SARIEL)', 0, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SARIEL)', 0, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SARIEL)', 0, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SARIEL)', 0, 4))
	_uState14Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_024PC", "But that would mean, you'd have to subject yourself again to this machine. Remembering your fear and pain at your flashback earlier on I'm not sure this is a good idea.", 123, 16777215))
	_uState14Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_025", "That was because I was overwhelmed by the sudden memory. If I step into it willingly, you might even be able to surpass my mental defenses.", 124, 16777215))
	_uState14Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_026PC", "Are you sure?", 125, 16777215))
	_uState14Trans2:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_027", "I've never been so sure in my entire life - at least the life I remember. I want this, Shaikan. Please help me.", 126, 16777215))
	_uState14Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_028PC", "I will search for this machine and hope we'll be able to do this without hurting you.", 127, 16777215))
	_uState14Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SARIEL)', 1, 4))
	_uState14Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState14Trans2 = nil

-- TO STATE: endconversation
_uState14Trans3 = GdsCreateTransition (_uState11, _uState14, "State_11", "State_14_T3", "Dialog")
	_uState14Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_042PC", "What did you see?", 141, 16777215))
	_uState14Trans3:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_043", "A man in a ornate grey robe placing some kind of magical wood into a large apparatus. Then he looks at me. I can't move! No! No! Stop it!", 142, 16777215))
	_uState14Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_044PC", "It's alright, Sariel. He can't hurt you anymore.", 143, 16777215))
	_uState14Trans3:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_045", "I think he called this magical wood a memory card, whatever that means.", 144, 16777215))
	_uState14Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_046PC", "I heard Professor Twiddle speak about them once. From what I understood, they are magical devices, storing memories of subjects, who were put under a mental spell or a device of some sort.", 145, 16777215))
	_uState14Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_SARIEL_047PC", "I will try to find those. Maybe they can give us a hint to your past.", 146, 16777215))
	_uState14Trans3:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_048", "Thank you, Shaikan.", 147, 16777215))
	_uState14Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SARIEL)', 1, 4))
	_uState14Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState14Trans3 = nil

-- TO STATE: endconversation
_uState14Trans4 = GdsCreateTransition (_uState1, _uState14, "State_1", "State_14_T4", "Dialog")
	_uState14Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P707_Sariel_MQ_03_1', 1, 2) ))
	_uState14Trans4:AddAction (CScriptActionSay("sariel", "P707_DLG_SARIEL_049", "DEBUG: no root if() nor elseif() evaluated to true", 148, 16777215))
	_uState14Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "sariel"))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SARIEL)', 1, 4))
	_uState14Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SARIEL)', 1, 4))
	_uState14Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState14, _uState14, "State_14", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SARIEL)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SARIEL)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SARIEL)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState14, _uState14, "State_14", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SARIEL)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P707_Sariel_MQ_03_2', 1, 4))
	_uEndActions2:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_MQ_03_2', 1, 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SARIEL)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SARIEL)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState14, _uState14, "State_14", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SARIEL)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uEndActions3:AddAction (CScriptActionSetQuestState('pl_Human', 'SSSR_MQ_03_1', 1, 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P707_Sariel_MQ_03_1', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SARIEL)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SARIEL)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState14, _uState14, "State_14", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SARIEL)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "sariel"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SARIEL)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SARIEL)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SARIEL)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SARIEL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('sariel', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SARIEL)', 0, 4))
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
_uState9 = nil
_uState11 = nil
_uState14 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("sariel_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SARIEL)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SARIEL)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'sariel'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "sariel", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'sariel', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
