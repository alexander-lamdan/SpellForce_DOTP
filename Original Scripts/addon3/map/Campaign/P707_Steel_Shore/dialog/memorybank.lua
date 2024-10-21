local _uSM = GdsCreateStateMachine ("memorybank_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState13 = GdsCreateState (_uSM, "State_13")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 2))
	_uState2Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 725, 1, 1, 1))
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mf_P707_Read1013', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_002PC", "Use Memory Card: Caine 1013", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 2))
	_uState2Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 726, 1, 1, 1))
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'mf_P707_Read1014', 0, 2))
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'mv_P707_UnreadCards', 8, 1))
	_uState2Trans2:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_010PC", "Use Memory Card: Caine 1014", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 2))
	_uState2Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 727, 1, 1, 1))
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'mf_P707_Read1015', 0, 2))
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'mv_P707_UnreadCards', 7, 1))
	_uState2Trans3:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_017PC", "Use Memory Card: Caine 1015", 3, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: choice
_uState2Trans4 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 2))
	_uState2Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 728, 1, 1, 1))
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'mf_P707_Read1020', 0, 2))
	_uState2Trans4:AddCondition (CScriptConditionValue('', 'mv_P707_UnreadCards', 7, 1))
	_uState2Trans4:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_029PC", "Use Memory Card: Caine 1020", 4, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 1, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: choice
_uState2Trans5 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 2))
	_uState2Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 729, 1, 1, 1))
	_uState2Trans5:AddCondition (CScriptConditionValue('', 'mf_P707_Read1002', 0, 2))
	_uState2Trans5:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_034PC", "Use Memory Card: Monster1_1002", 5, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 1, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans5 = nil

-- TO STATE: choice
_uState2Trans6 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 2))
	_uState2Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 730, 1, 1, 1))
	_uState2Trans6:AddCondition (CScriptConditionValue('', 'mf_P707_Read0957', 0, 2))
	_uState2Trans6:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_037PC", "Use Memory Card: Monster2_0957", 6, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 1, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: choice
_uState2Trans7 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 2))
	_uState2Trans7:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 723, 1, 1, 1))
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'mf_P707_Read1264', 0, 2))
	_uState2Trans7:AddCondition (CScriptConditionValue('', 'mv_P707_UnreadCards', 6, 1))
	_uState2Trans7:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_040PC", "Use Memory Card: Sariel 1264", 7, 16777215))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 1, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans7 = nil

-- TO STATE: choice
_uState2Trans8 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T8", "Dialog")
	_uState2Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 2))
	_uState2Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 724, 1, 1, 1))
	_uState2Trans8:AddCondition (CScriptConditionValue('', 'mf_P707_Read1271', 0, 2))
	_uState2Trans8:AddCondition (CScriptConditionValue('', 'mv_P707_UnreadCards', 5, 1))
	_uState2Trans8:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_042PC", "Use Memory Card: Sariel 1271", 8, 16777215))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 1, 4))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans8 = nil

-- TO STATE: choice
_uState2Trans9 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T9", "Dialog")
	_uState2Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 2))
	_uState2Trans9:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 732, 1, 1, 1))
	_uState2Trans9:AddCondition (CScriptConditionValue('', 'mf_P707_Read0213', 0, 2))
	_uState2Trans9:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_044PC", "Use Memory Card: Shadow 0213", 9, 16777215))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 1, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans9 = nil

-- TO STATE: choice
_uState2Trans10 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T10", "Dialog")
	_uState2Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 2))
	_uState2Trans10:AddAction (CScriptActionChoice("P707_DLG_MEMORYBANK_047PC", "Leave", 10, 16777215))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 1, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans10 = nil

-- TO STATE: choice
_uState2Trans11 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T11", "Dialog")
	_uState2Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 2))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 0, 4))
	_uState2Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MEMORYBANK)', 1, 4))
	_uState2Trans11:AddAction (CScriptActionShowChoices())
	_uState2Trans11 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('memorybank'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(MEMORYBANK)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(MEMORYBANK)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('memorybank', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("memorybank", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "memorybank"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MEMORYBANK)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(MEMORYBANK)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('memorybank', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("memorybank")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T12", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(MEMORYBANK)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P707_InMemoryBank', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_001", "A strange device, which you have learned is called a Memory Bank. Obviously it was designed to access the information stored on those Memory Cards.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans13 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T13", "Dialog")
	_uState2Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 1))
	_uState2Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_002PC", "Use Memory Card: Caine 1013", 99, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_003", "You are strong, young hunter. But you are no match for me. Did you really think, you and your demon friends could so easily hunt me down?", 102, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_004", "Shake your head as furiously as you want, you won't get out. Do you know who I am? Do you know, what I am capable of?", 103, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_005", "I know that you will regret, keeping me here.", 104, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_006", "How do you think you'll escape? Your demon friends won't help you, of that you can be sure. You are under my control now and will do as I say.", 105, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_007", "I will do nothing of that sort!", 106, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_008", "We'll see about that. But before I start, I will probe your mind, if you don't mind *chuckles*.", 107, 16777215))
	_uState2Trans13:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_009", "What do we have here? Ah. Caine isn't your real name, is it? You were born … Now that is a surprise! An Elf in league with demons. Ke'an, Ke'an, you've been a naughty boy.", 108, 16777215))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mf_P707_Read1013', 1, 4))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans13 = nil

-- TO STATE: choice
_uState2Trans14 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T14", "Dialog")
	_uState2Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 2))
	_uState2Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_010PC", "Use Memory Card: Caine 1014", 99, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_011", "Now this is more to my liking, Caine. I think I'll stick with this name. It fits your new, darker, nature much better, than Ke'an, which means Sun of the east.", 110, 16777215))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans14:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_012", "Let's probe your mind a little further, shall we?", 111, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_013", "*makes grunting noises*", 112, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_014", "Your childhood? Boring. I hate those treehuggers. Show me some action!", 113, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_015", "What have we here? A bluehaired Elf. Oh, Caine - you were in love with a girl from the Aryn cult? Silly you. But wait. Her hair is a much darker blue than we find with the frostweavers.", 114, 16777215))
	_uState2Trans14:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_016", "What is this? Some kind of mental defense? All I get is this image and burning blue eyes. Damn! I'll have to increase the mental spell.", 115, 16777215))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'mf_P707_Read1014', 1, 4))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans14 = nil

-- TO STATE: choice
_uState2Trans15 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T15", "Dialog")
	_uState2Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 3))
	_uState2Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_017PC", "Use Memory Card: Caine 1015", 99, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_018", "A willing puppet, just how I like it, Caine. And yet. There's still this image of that woman with the blue hair. Let's see, whether I get a name.", 117, 16777215))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_019", "Sari'el - Lost one. An odd name for an Elf. I wonder...", 118, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_020", "Leave... her... alone!", 119, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_021", "Still some resistance? This must have been a real killer for you! But there's nothing you can do.", 120, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_022", "Aha, she was found by your kind, gravely wounded.", 121, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_023", "What's that? Some kind of healing ritual obviously. But she's keeping herself to herself.", 122, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_024", "Her body has healed, but not her mind. What is she? Who is she? This is really something, my friend, really something.", 123, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_025", "Now what? You two alone? Ah, you're on your way somewhere. But you can't keep the distance.", 124, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_026", "Huh, wow! That was some amazing piece of magic that she performed there, Caine. Must have hurt a lot.", 125, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_027", "Let me see, ah yes, of course. Wounded as you were, you struck a deal with the Demon lord Agrazog, second only to Ulather himself. Nice one, Caine. Must have gotten you quite some abilities.", 126, 16777215))
	_uState2Trans15:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_028", "But not enough to get to me, hunter. Not enough to get to me.", 127, 16777215))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'mf_P707_Read1015', 1, 4))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans15 = nil

-- TO STATE: choice
_uState2Trans16 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T16", "Dialog")
	_uState2Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 4))
	_uState2Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_029PC", "Use Memory Card: Caine 1020", 99, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_030", "So my little pet-hunter. You have done well. Let me see, how you managed it.", 129, 16777215))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans16:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_031", "There is Sari'el. Good. You've not raised your stupid sword again. She would have noticed you from miles away with aggressive attentions.", 130, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_032", "And now the vial. Careful now. Yes! The gas knocked her out.", 131, 16777215))
	_uState2Trans16:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_033", "It's interesting. Although I blocked your memory about her, you still take her up, like you're still in love with her. Maybe one day I'll do some research into this feeling ...love.", 132, 16777215))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'mf_P707_Read1020', 1, 4))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans16 = nil

-- TO STATE: choice
_uState2Trans17 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T17", "Dialog")
	_uState2Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 5))
	_uState2Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_034PC", "Use Memory Card: Monster1_1002", 99, 16777215))
	_uState2Trans17:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_035", "You are a hunter. A raptor. Yes! I can feel your urge to fight, your urge to kill.", 134, 16777215))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans17:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_036", "But you're still not what I'm looking for. I wonder... A dragon maybe? The hunters of the Emperor are about to capture Ur. I think I should have a talk with the Emperor.", 135, 16777215))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'mf_P707_Read1002', 1, 4))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans17 = nil

-- TO STATE: choice
_uState2Trans18 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T18", "Dialog")
	_uState2Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 6))
	_uState2Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_037PC", "Use Memory Card: Monster2_0957", 99, 16777215))
	_uState2Trans18:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_038", "What a pitiful memory! You're a bloodhound. You're supposed to crave for blood and fight not to think about how you fooled around as a puppy.", 137, 16777215))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans18:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_039", "I need something much more aggressive. Maybe a raptor.", 138, 16777215))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'mf_P707_Read0957', 1, 4))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans18 = nil

-- TO STATE: choice
_uState2Trans19 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T19", "Dialog")
	_uState2Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 7))
	_uState2Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_040PC", "Use Memory Card: Sariel 1264", 99, 16777215))
	_uState2Trans19:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_041", "Ohhh yes. You're the answer to my highest hopes. Your defenses are so strong - not even Ur could keep eluding me for so long. I'll have to think of something else. This log can be recreated another time.", 140, 16777215))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'mf_P707_Read1264', 1, 4))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans19 = nil

-- TO STATE: choice
_uState2Trans20 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T20", "Dialog")
	_uState2Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 8))
	_uState2Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_042PC", "Use Memory Card: Sariel 1271", 99, 16777215))
	_uState2Trans20:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_043", "NO! Impossible! Why did you react to my knockout gas but to no other alchemic substance I gave you? I have to do more research! The Materia Prima will surely get to you one day. Then this log can be recreated.", 142, 16777215))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'mf_P707_Read1271', 1, 4))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans20 = nil

-- TO STATE: choice
_uState2Trans21 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T21", "Dialog")
	_uState2Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 9))
	_uState2Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_044PC", "Use Memory Card: Shadow 0213", 99, 16777215))
	_uState2Trans21:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_045", "I discovered an interdiemensiona rift today in one of the backrooms. Odd, that it would appear just there.", 144, 16777215))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState2Trans21:AddAction (CScriptActionSay("memorybank", "P707_DLG_MEMORYBANK_046", "I've covered it with a spell and tied the spell to the substances in the four cauldrons around it. Extinguishing the fires in the correct sequence will drop the spell.", 145, 16777215))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'mf_P707_Read0213', 1, 4))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'mv_P707_UnreadCards', 1, 1))
	_uState2Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState2Trans21 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "memorybank"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "memorybank"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('memorybank', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MEMORYBANK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState13Trans1 = GdsCreateTransition (_uState2, _uState13, "State_2", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 10))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P707_DLG_MEMORYBANK_047PC", "Leave", 99, 16777215))
	_uState13Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "memorybank"))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MEMORYBANK)', 1, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MEMORYBANK)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MEMORYBANK)', 1, 4))
	_uState13Trans1 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(MEMORYBANK)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "memorybank"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P707_InMemoryBank', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MEMORYBANK)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MEMORYBANK)', 1, 4))
	_uEndActions1 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(MEMORYBANK)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MEMORYBANK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('memorybank', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MEMORYBANK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState13 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("memorybank_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MEMORYBANK)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MEMORYBANK)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'memorybank'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "memorybank", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'memorybank', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
