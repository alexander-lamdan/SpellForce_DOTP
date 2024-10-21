local _uSM = GdsCreateStateMachine ("npc_marriedman_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState16 = GdsCreateState (_uSM, "State_16")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('npc_marriedman'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NPC_MARRIEDMAN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NPC_MARRIEDMAN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('npc_marriedman', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "npc_marriedman"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NPC_MARRIEDMAN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("npc_marriedman")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NPC_MARRIEDMAN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_002PC", "It was kinda hard to miss. Everybody's talking about that.", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_026PC", "This is none of my business.", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'mf_P702_MarriedManAngry', 0, 2))
	_uState3Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_001", "The pillar. It has come alive again. Have you heard it?", 100, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState3Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_006PC", "Don't miss good for naive.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_024PC", "This is none of my business.", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 2))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 0, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionShowChoices())
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState3, _uState5, "State_3", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 1))
	_uState5Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_002PC", "It was kinda hard to miss. Everybody's talking about that.", 99, 16777215))
	_uState5Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_003", "It indicates evil creatures. Something got inside the town again.", 102, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState5Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_004PC", "You don't seem concerned too much.", 103, 16777215))
	_uState5Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_005", "Happens all the time, but we're good people, you know. We've got nothing to hide. Evil can't hurt us.", 104, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState5Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState7Trans1 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 2))
	_uState7Trans1:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_012PC", "Exactly! That proves my point.", 1, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 1, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState7Trans1 = nil

-- TO STATE: choice
_uState7Trans2 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T2", "Dialog")
	_uState7Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 2))
	_uState7Trans2:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_022PC", "This is none of my business.", 2, 16777215))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 1, 4))
	_uState7Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState7Trans2 = nil

-- TO STATE: choice
_uState7Trans3 = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7_T3", "Dialog")
	_uState7Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 2))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 0, 4))
	_uState7Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState7Trans3:AddAction (CScriptActionShowChoices())
	_uState7Trans3 = nil

-- TO STATE: choice
_uState7Trans4 = GdsCreateTransition (_uState5, _uState7, "State_5", "State_7_T4", "Dialog")
	_uState7Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 1))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_006PC", "Don't miss good for naive.", 99, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_007", "What are you getting at?", 106, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_008PC", "You, my friend, may have a kind heart, but you can bet that others here are lacking in that department. You know, even your wife is cheating on you.", 107, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_009", "What the- !?", 108, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_010PC", "Believe me, I have a keen eye for this. How could I tell that you are married in the first place?", 109, 16777215))
	_uState7Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_011", "Um... you are right, proudly married for ten years now. The happiest days of my life. If only we had children.", 110, 16777215))
	_uState7Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState7Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState9Trans1 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 2))
	_uState9Trans1:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_016PC", "Jorgos? The tall man over there with the satisfied smile on his face?", 1, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 1, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: choice
_uState9Trans2 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 2))
	_uState9Trans2:AddAction (CScriptActionChoice("P702_DLG_MARRIEDMAN_020PC", "This is none of my business.", 2, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState9Trans2 = nil

-- TO STATE: choice
_uState9Trans3 = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9_T3", "Dialog")
	_uState9Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 2))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 0, 4))
	_uState9Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState9Trans3:AddAction (CScriptActionShowChoices())
	_uState9Trans3 = nil

-- TO STATE: choice
_uState9Trans4 = GdsCreateTransition (_uState7, _uState9, "State_7", "State_9_T4", "Dialog")
	_uState9Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 1))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_012PC", "Exactly! That proves my point.", 99, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_013", "Pardon?", 112, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState9Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_014PC", "You don't have children, because... come closer... because your wife doesn't love you, she loves someone else, and... CHEATS on you! Maybe even now, right before your eyes.", 113, 16777215))
	_uState9Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_015", "Nowadays she hangs out with our friend, Jorgos, the butcher. They spend a whole lot of time together...", 114, 16777215))
	_uState9Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState9Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState16Trans1 = GdsCreateTransition (_uState9, _uState16, "State_9", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 1))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_016PC", "Jorgos? The tall man over there with the satisfied smile on his face?", 99, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_017", "That is him. He... he... and my darling...", 116, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_018PC", "Look! You must put up with it. What happened, happened. You are all good people afterall.", 117, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_019", "NEVER! JORGOOOOS! You pathetic excuse of a friend, I'll skin you alive!", 118, 16777215))
	_uState16Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: endconversation
_uState16Trans2 = GdsCreateTransition (_uState9, _uState16, "State_9", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 2))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_020PC", "This is none of my business.", 99, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_021", "You really think so?", 120, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: endconversation
_uState16Trans3 = GdsCreateTransition (_uState7, _uState16, "State_7", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 2))
	_uState16Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_022PC", "This is none of my business.", 99, 16777215))
	_uState16Trans3:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_023", "You really think so?", 122, 16777215))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans3 = nil

-- TO STATE: endconversation
_uState16Trans4 = GdsCreateTransition (_uState5, _uState16, "State_5", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 2))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_024PC", "This is none of my business.", 99, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_025", "You really think so?", 124, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans4 = nil

-- TO STATE: endconversation
_uState16Trans5 = GdsCreateTransition (_uState3, _uState16, "State_3", "State_16_T5", "Dialog")
	_uState16Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 2))
	_uState16Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_026PC", "This is none of my business.", 99, 16777215))
	_uState16Trans5:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_027", "You really think so?", 126, 16777215))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uState16Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans5 = nil

-- TO STATE: endconversation
_uState16Trans6 = GdsCreateTransition (_uState1, _uState16, "State_1", "State_16_T6", "Dialog")
	_uState16Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_MarriedManAngry', 0, 2) ))
	_uState16Trans6:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_028", "And I thought that love is my destiny...", 127, 16777215))
	_uState16Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_MARRIEDMAN_029PC", "It still can be. There is plenty of fish in the sea.", 128, 16777215))
	_uState16Trans6:AddAction (CScriptActionSay("npc_marriedman", "P702_DLG_MARRIEDMAN_030", "But I sacrificed all my best fisherman years for nothing. Just leave me now.", 129, 16777215))
	_uState16Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_marriedman"))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_MARRIEDMAN)', 1, 4))
	_uState16Trans6 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NPC_MARRIEDMAN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_MarriedManAngry', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_MARRIEDMAN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NPC_MARRIEDMAN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_MARRIEDMAN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NPC_MARRIEDMAN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_MARRIEDMAN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NPC_MARRIEDMAN)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_MARRIEDMAN)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(NPC_MARRIEDMAN)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NPC_MARRIEDMAN)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(NPC_MARRIEDMAN)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_marriedman"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NPC_MARRIEDMAN)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 4))
	_uEndActions6 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_marriedman', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState5 = nil
_uState7 = nil
_uState9 = nil
_uState16 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("npc_marriedman_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_MARRIEDMAN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_marriedman'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_marriedman", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_marriedman', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
