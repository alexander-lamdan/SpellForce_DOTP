local _uSM = GdsCreateStateMachine ("twiddle4_sesame_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState9 = GdsCreateState (_uSM, "State_9")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('twiddle4_sesame'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(TWIDDLE4_SESAME)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(TWIDDLE4_SESAME)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('twiddle4_sesame', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("twiddle4_sesame", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "twiddle4_sesame"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE4_SESAME)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(TWIDDLE4_SESAME)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('twiddle4_sesame', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("twiddle4_sesame")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE4_SESAME)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE4_SESAME)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(TWIDDLE4_SESAME)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle4_sesame"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle4_sesame', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE4_SESAME)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE4_SESAME)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P710_DLG_TWIDDLE4SESAME_018PC", "About the revival...", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE4_SESAME)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P710_DLG_TWIDDLE4SESAME_027PC", "About the mixture...", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron1_End', 0, 2))
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 1, 2))
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 0, 2) ))
	_uState4Trans4:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_017", "Ah, comrade!", 116, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 0, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 1, 4))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_001", "Does being revived by Dragonblood leave you always so shaky?", 100, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_002PC", "The first time is worst. Sometimes people have to be revived three or four times before the shaking vanishes.", 101, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_003", "I don't think I'd want that, Shaikan. Wait. I'm a Shaikan now myself. *laughs*", 102, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_004PC", "What's our next move, Professor?", 103, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_005", "I can't do a thing, shaking that much. And my other selves don't seem to be much better off. You have to mix that Portal-substance.", 104, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_006PC", "Can't we just wait until your abilities have been restored?", 105, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_007", "There's no time like the present, my friend. Especially when you have to deal with timetravellers.", 106, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_008PC", "Alright. Tell me what to do.", 107, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_009", "To mix the Portal-coctail, first crush the Sapphires to Sapphire-dust. Put it into the waiting kettle over there.", 108, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_010", "Then wait for exactly twenty seconds and put in the Fools Gold, one by one, all six pieces.", 109, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_011", "After another 6 minutes, during which you melt the pure Copper, you slowly fill in the Copper, while stirring the cocktail counterclockwise.", 110, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_012", "Wait till the brew takes a reddish colour and then throw in all Hornsilver-parts at once. When it turns purple, you've done it right.", 111, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_013PC", "And how are the portals reactivated?", 112, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_014", "The fluid will start to stir and emit energy, which will hit the prepared Portal. The portal stone will take up the energy and distribute it throughout all islands.", 113, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_015PC", "I will do my very best, Professor.", 114, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_016", "Don't be too worried, Shaikan. You can start over again any time. We've got a big store of kettles and water here.", 115, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'mf_P710_Twiddle4_Sesame_Talked', 1, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 1))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_018PC", "About the revival...", 99, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_019", "Does being revived by Dragonblood leave you always so shaky?", 118, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE4_SESAME)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE4_SESAME)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_020PC", "The first time is worst. Sometimes people have to be revived three or four times before the shaking vanishes.", 119, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_021", "I don't think I'd want that, Shaikan. Wait. I'm a Shaikan now myself. *laughs*", 120, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_022PC", "What's our next move, Professor?", 121, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_023", "I can't do a thing, shaking that much. And my other selves don't seem to be much better off. You have to mix that Portal-substance.", 122, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_024PC", "Can't we just wait until your abilities have been restored?", 123, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_025", "There's no time like the present, my friend. Especially when you have to deal with timetravellers.", 124, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_026PC", "Alright. Tell me what to do.", 125, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 2))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_027PC", "About the mixture...", 99, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_028", "To mix the Portal-coctail, first crush the Sapphires to Sapphire-dust. Put it into the waiting kettle over there.", 127, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE4_SESAME)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE4_SESAME)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_029", "Then wait for exactly twenty seconds and put in the Fools Gold, one by one, all six pieces.", 128, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_030", "After another 6 minutes, during which you melt the pure Copper, you slowly fill in the Copper, while stirring the cocktail counterclockwise.", 129, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_031", "Wait till the brew takes a reddish colour and then throw in all Hornsilver-parts at once. When it turns purple, you've done it right.", 130, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_032PC", "And how are the portals reactivated?", 131, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_033", "The fluid will start to stir and emit energy, which will hit the prepared Portal. The portal stone will take up the energy and distribute it throughout all islands.", 132, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_034PC", "I will do my very best, Professor.", 133, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_035", "Don't be too worried, Shaikan. You can start over again any time. We've got a big store of kettles and water here.", 134, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState4Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle4_sesame"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle4_sesame"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle4_sesame', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE4_SESAME)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState9Trans1 = GdsCreateTransition (_uState1, _uState9, "State_1", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Cauldron1_End', 1, 2))
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 1, 2))
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 0, 2) ))
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P710_Cauldron1_End', 0, 2), CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 1, 2)) ))
	_uState9Trans1:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_036", "It didn't work!", 135, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P710_DLG_TWIDDLE4SESAME_037PC", "I know, but why?", 136, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("twiddle4_sesame", "P710_DLG_TWIDDLE4SESAME_038", "Let me think... Of course! It needs an activator. Use a flash-spell on the brew. That will work!", 137, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'mf_P710_Twiddle4_Sesame_Cauldron1_Talked', 1, 4))
	_uState9Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle4_sesame"))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(TWIDDLE4_SESAME)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: endconversation
_uState9Trans2 = GdsCreateTransition (_uState1, _uState9, "State_1", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 0, 2) ))
	_uState9Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P710_Cauldron1_End', 0, 2), CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 1, 2)) ))
	_uState9Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P710_Cauldron1_End', 1, 2), CScriptConditionValue('', 'mf_P710_Twiddle4_Sesame_FirstMeet', 1, 2)) ))
	_uState9Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle4_sesame"))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(TWIDDLE4_SESAME)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE4_SESAME)', 1, 4))
	_uState9Trans2 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(TWIDDLE4_SESAME)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle4_sesame"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(TWIDDLE4_SESAME)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE4_SESAME)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(TWIDDLE4_SESAME)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle4_sesame"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(TWIDDLE4_SESAME)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE4_SESAME)', 1, 4))
	_uEndActions2 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(TWIDDLE4_SESAME)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE4_SESAME)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle4_sesame', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE4_SESAME)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState9 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("twiddle4_sesame_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(TWIDDLE4_SESAME)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(TWIDDLE4_SESAME)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle4_sesame'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle4_sesame", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle4_sesame', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
