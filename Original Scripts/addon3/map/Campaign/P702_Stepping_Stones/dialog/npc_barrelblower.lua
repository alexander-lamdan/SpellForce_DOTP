local _uSM = GdsCreateStateMachine ("npc_barrelblower_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState12 = GdsCreateState (_uSM, "State_12")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('npc_barrelblower'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NPC_BARRELBLOWER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NPC_BARRELBLOWER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('npc_barrelblower', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "npc_barrelblower"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NPC_BARRELBLOWER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('npc_barrelblower', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("npc_barrelblower")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NPC_BARRELBLOWER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_barrelblower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P702_DLG_BARRELBLOWER_003PC", "What is this about?", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P702_DLG_BARRELBLOWER_020PC", "I don't want to be involved.", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P702_ZerboBarrelBlowerKnown', 0, 2) ))
	_uState4Trans4:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_002", "Come on, I know you love tricks! Wanna see this one?", 101, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'mf_P702_ZerboBarrelBlowerKnown', 0, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'mf_P702_ZerboBarrelBlowerKnown', 1, 4))
	_uState4Trans5:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_001", "You there! Wanna see a trick?", 100, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState4Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_barrelblower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 629, 1, 1, 1))
	_uState6Trans1:AddAction (CScriptActionChoice("P702_DLG_BARRELBLOWER_007PC", "Ok, how about an apple?", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P702_DLG_BARRELBLOWER_010PC", "Have this coin.", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 0, 2))
	_uState6Trans3:AddAction (CScriptActionChoice("P702_DLG_BARRELBLOWER_013PC", "One-hundred gold.", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 0, 2))
	_uState6Trans4:AddAction (CScriptActionChoice("P702_DLG_BARRELBLOWER_019PC", "I don't want to be involved.", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 2))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionShowChoices())
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 1))
	_uState6Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_003PC", "What is this about?", 99, 16777215))
	_uState6Trans6:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_004", "Simple. You donate me something and I set this barrel on fire, then we run. Everybody who can get away before the guards arrive, wins.", 103, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uState6Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_005PC", "I smell gunpowder.", 104, 16777215))
	_uState6Trans6:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_006", "See? That's the trick!", 105, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState6Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_barrelblower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState12Trans1 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 1))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_007PC", "Ok, how about an apple?", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_008", "The famous and exorbitantly priced apple that grants you superhuman strength for years? You are too kind, my dear Sir. Of course, I'll take it.", 107, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_009", "All is set. Did you do a proper warm-up? You need to be fast!", 108, 16777215))
	_uState12Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: endconversation
_uState12Trans2 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 2))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_010PC", "Have this coin.", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_011", "One coin? Really? Are you from Westguard or something? Anyway, beggars are not choosers, so I'll take it.", 110, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_012", "All is set. Did you do a proper warm-up? You need to be fast!", 111, 16777215))
	_uState12Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: endconversation
_uState12Trans3 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 3))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_013PC", "One-hundred gold.", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_014", "This is a really good day. Here, a weapon gratis for you. Just be sure you don't show it much around the guards. They are... how to put this?", 113, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_015PC", "Looking for it? Is it stolen?", 114, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_016", "It just lied there, I swear. You want it or not?", 115, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_017PC", "Just give it to me.", 116, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("npc_barrelblower", "P702_DLG_BARRELBLOWER_018", "All is set. Did you do a proper warm-up? You need to be fast!", 117, 16777215))
	_uState12Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: endconversation
_uState12Trans4 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 4))
	_uState12Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_019PC", "I don't want to be involved.", 99, 16777215))
	_uState12Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans4 = nil

-- TO STATE: endconversation
_uState12Trans5 = GdsCreateTransition (_uState4, _uState12, "State_4", "State_12_T5", "Dialog")
	_uState12Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 2))
	_uState12Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P702_DLG_BARRELBLOWER_020PC", "I don't want to be involved.", 99, 16777215))
	_uState12Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "npc_barrelblower"))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NPC_BARRELBLOWER)', 1, 4))
	_uState12Trans5 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NPC_BARRELBLOWER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uEndActions1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 629, 1))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P702_ZerboBarrelBlow', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NPC_BARRELBLOWER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NPC_BARRELBLOWER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uEndActions2:AddAction (CScriptActionPlayerSubMoney('pl_Human', 1))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P702_ZerboBarrelBlow', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NPC_BARRELBLOWER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NPC_BARRELBLOWER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uEndActions3:AddAction (CScriptActionPlayerSubMoney('pl_Human', 100))
	_uEndActions3:AddAction (CScriptActionPlayerGiveItem('pl_Human', 1, 2004, 1))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_ZerboBarrelBlow', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P702_ZerboAvatarHasTheMace', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NPC_BARRELBLOWER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NPC_BARRELBLOWER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NPC_BARRELBLOWER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(NPC_BARRELBLOWER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "npc_barrelblower"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NPC_BARRELBLOWER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 1, 4))
	_uEndActions5 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NPC_BARRELBLOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('npc_barrelblower', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState6 = nil
_uState12 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("npc_barrelblower_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NPC_BARRELBLOWER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'npc_barrelblower'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "npc_barrelblower", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'npc_barrelblower', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
