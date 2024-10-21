local _uSM = GdsCreateStateMachine ("ghost_05_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState9 = GdsCreateState (_uSM, "State_9")

-- TO STATE: choice
_uState2Trans1 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 2))
	_uState2Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST05_004PC", "First, tell me something about yourself and how your death came about.", 1, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 1, 4))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState2Trans1 = nil

-- TO STATE: choice
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 2))
	_uState2Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST05_031PC", "I hope that you might have a smaller number than myself, which you are willing to swap with mine. For I am on a very important mission to save Eo of the Nameless scourge.", 2, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: choice
_uState2Trans3 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 2))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_05)', 1, 4))
	_uState2Trans3:AddAction (CScriptActionShowChoices())
	_uState2Trans3 = nil

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('ghost_05'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(GHOST_05)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(GHOST_05)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('ghost_05', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("ghost_05", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: choice
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "ghost_05"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_05)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(GHOST_05)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('ghost_05', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("ghost_05")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_05)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T4", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(GHOST_05)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_05_dialog_started', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_RepeatEvent_ghost_02_dialog_fix_HasTriggered', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_001", "Shan Muir, late masterhealer of Liannon, at your service.", 100, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_002PC", "Thank you, Shan. I'm sorry that you're dead. Infact, I do require your service.", 101, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_003", "In what way do you think I could be of help?", 102, 16777215))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: choice
_uState2Trans5 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 1))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_004PC", "First, tell me something about yourself and how your death came about.", 99, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_005", "I will tell you something about myself, if you in return tell me something about yourself.", 104, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_006PC", "Deal.", 105, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_007", "I have lived long and prosper in a small town in Northander, which is human territory in Fiara. Maybe you've heard of Liannon?", 106, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_008PC", "Indeed I have, Shan. Isn't that, where the famous cartographer Darius lived for a long time?", 107, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_009", "You are well informed, my friend. I lived there with my sister, Lea, until she was abducted and killed by a powerful mage. After a long time of mourning I entered the services of the Lord of Liannon, for I am a very skilled healer.", 108, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_010PC", "I'm sorry about what happened to your sister, Shan. I think I've heard of her lover, Amra.", 109, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_011", "Ah, yes. Amra was a fierce warrior. I wonder whether I'll meet him here - and Lea too, finally together … But I'm forgetting myself. You wanted to know about the circumstances of my death, didn't you?", 110, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_012PC", "If you don't mind, yes.", 111, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_013", "It's a strange request. Pray tell me, why this interests you.", 112, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_014PC", "I'm Shaikan. And I'm already old, even by the standards of my race. So after eluding death for so long, I'm hoping for some insight.", 113, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_015", "Aren't you dead yourself?", 114, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_016PC", "No, I'm on a very important mission, hoping to save Eo.", 115, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_017", "I sense that there is more.", 116, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_018PC", "What more could there be?", 117, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_019", "You are on that mission, but your motives are twofold. It's not only that mission that drives you. There's more.", 118, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_020PC", "I'd rather not talk about it.", 119, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_021", "Why?", 120, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_022PC", "… Because … It hurts even to think about it, let alone talk about it.", 121, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_023", "Then I leave it up to you, whether you want to tell me sometime or not. But let me give you one advice. Vengance and hatred can only lead to more sorrow and pain. Just look at Amra and Lea.", 122, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_024PC", "Thank you, Shan. I'll try to stick to that advice.", 123, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_025", "The circumstances of my death are neither special nor of much interest to anybody. I was searching for a special herb, which is needed in an antidote I needed to make for the son of the cook of the Lord of Liannon.", 124, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_026", "I was climbing the mountains near the town, when a group of rogue goblins attacked me. I tried to outrun them but tripped and fell into a gorge.", 125, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_027PC", "I'm sorry. I hope it didn't hurt too much.", 126, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_028", "No, my neck broke and I was dead instantly.", 127, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_029PC", "Amazing how you can be so cool about your own death.", 128, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_030", "I always knew one day I'd die. One way or the other. The only regret I have is, that I couldn't help the ill son of the cook.", 129, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState2Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_05"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_05"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_05', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P703_DLG_GHOST05_038PC", "I'd give him the Zirfar-potion. I think he suffered enough.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P703_DLG_GHOST05_043PC", "I'd give him the potion to cure his pain. But the murder can't be redeemed so easily.", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_05)', 0, 2))
	_uState5Trans3:AddAction (CScriptActionChoice("P703_DLG_GHOST05_048PC", "I think I don't know enough about the case to form a valid decision. I'd need to know more.", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_05)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 2))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GHOST_05)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionShowChoices())
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState2, _uState5, "State_2", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 2))
	_uState5Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_031PC", "I hope that you might have a smaller number than myself, which you are willing to swap with mine. For I am on a very important mission to save Eo of the Nameless scourge.", 99, 16777215))
	_uState5Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_032", "If you are on such an important mission I want to help if I can, of course. I own the number 35, would that be of help?", 131, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 4))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 4))
	_uState5Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_033PC", "That would be great!", 132, 16777215))
	_uState5Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_034", "I sense much pain and anger in you, so I have to ask you one question, before you can get my number.", 133, 16777215))
	_uState5Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_035", "There was a murderer who was punished for his deeds by cripling him with a poison. It made him weak and frail but he lived to remember what he'd done.", 134, 16777215))
	_uState5Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_036", "After 15 years of punishment the man asked to be redeemed, so that he'd not have to suffer the pain of the poison anymore. Two options presented themselves - the first was an antidote, the Zirfar potion, the second was a potion to cure the pain but not the weakness and frailty.", 135, 16777215))
	_uState5Trans5:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_037", "Which one would you give the man?", 136, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState5Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_05"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_05"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_05', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState9Trans1 = GdsCreateTransition (_uState5, _uState9, "State_5", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 1))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_038PC", "I'd give him the Zirfar-potion. I think he suffered enough.", 99, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_039", "A Runewarrior took just that decision. He found a healer to brew the Zirfar-potion. After the redeemed murderer drank it, his old aggression came back and the Runewarrior had to kill him. ", 138, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_05)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_040PC", "Why are you telling me this?", 139, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_041", "Because I think you have to consider on what knowledge you base your decisions and what it is, that really motivates and drives you.", 140, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_042", "Here you have your number. May your mission go well.", 141, 16777215))
	_uState9Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_05"))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GHOST_05)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: endconversation
_uState9Trans2 = GdsCreateTransition (_uState5, _uState9, "State_5", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 2))
	_uState9Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_043PC", "I'd give him the potion to cure his pain. But the murder can't be redeemed so easily.", 99, 16777215))
	_uState9Trans2:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_044", "So you condemn this man to weakness and frailty but you'd relieve the pain?", 143, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_05)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_045PC", "Yes, from what you told me, the man has suffered a long time. His deeds cannot be redeemed but there's no need to be cruel either.", 144, 16777215))
	_uState9Trans2:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_046", "Remember this decision, when considering your own mission and your own motives.", 145, 16777215))
	_uState9Trans2:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_047", "Here you have your number. May your mission go well.", 146, 16777215))
	_uState9Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_05"))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GHOST_05)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: endconversation
_uState9Trans3 = GdsCreateTransition (_uState5, _uState9, "State_5", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 3))
	_uState9Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P703_DLG_GHOST05_048PC", "I think I don't know enough about the case to form a valid decision. I'd need to know more.", 99, 16777215))
	_uState9Trans3:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_049", "This is a wise judgement, my friend. Unless you don't know enough, all that you decided will be based on prejudice and bias.", 148, 16777215))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GHOST_05)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GHOST_05)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GHOST_05)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionSay("ghost_05", "P703_DLG_GHOST05_050", "Here you have your number. May your mission go well.", 149, 16777215))
	_uState9Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "ghost_05"))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GHOST_05)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GHOST_05)', 1, 4))
	_uState9Trans3 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(GHOST_05)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_05"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_05_trade', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GHOST_05)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_05)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(GHOST_05)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_05"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_05_trade', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GHOST_05)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_05)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState9, _uState9, "State_9", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(GHOST_05)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "ghost_05"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P703_ghost_05_trade', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GHOST_05)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_05)', 1, 4))
	_uEndActions3 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(GHOST_05)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GHOST_05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('ghost_05', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GHOST_05)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState5 = nil
_uState9 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("ghost_05_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GHOST_05)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GHOST_05)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'ghost_05'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "ghost_05", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'ghost_05', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
