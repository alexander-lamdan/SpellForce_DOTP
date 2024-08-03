local _uSM = GdsCreateStateMachine ("norcaine_leader_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState11 = GdsCreateState (_uSM, "State_11")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('norcaine_leader'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(NORCAINE_LEADER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(NORCAINE_LEADER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('norcaine_leader', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("norcaine_leader", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "norcaine_leader"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_LEADER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(NORCAINE_LEADER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('norcaine_leader', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("norcaine_leader")
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
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(NORCAINE_LEADER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState4Trans1 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1) ))
	_uState4Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 2) ))
	_uState4Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState4Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState4Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: elseif
_uState4Trans2 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2))
	_uState4Trans2:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'mf_P709_NorcaineLeaderKnown', 1, 4))
	_uState4Trans2:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_001", "I thank you too, Shaikan, for helping us.", 100, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState4Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "norcaine_leader", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState11Trans1 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2))
	_uState11Trans1:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState11Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans1:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_002", "You're back.", 101, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_003PC", "I've come to you with a request from the great Dragon Jorbal.", 102, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_004", "What can I do for the noble Dragon?", 103, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_005PC", "Allow us to take the bones from your ship.", 104, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_006", "Why would you do that?", 105, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_007PC", "Because your people committed a sacrilege against the Dragons by using the bones.  We need to collect them and purge them from the foul magic of the Necromancers.", 106, 16777215))
	_uState11Trans1:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_008", "I am, as leader of this expedition, responsible for the actions of us all. I am deeply sorry, Shaikan, please relay that to the great Dragon. May he one day forgive us. Of course you can take the bones.", 107, 16777215))
	_uState11Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NORCAINE_LEADER)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: endconversation
_uState11Trans2 = GdsCreateTransition (_uState4, _uState11, "State_4", "State_11_T2", "Dialog")
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_009PC", "Let's not pretend to like each other, Norcaine. I trust Craig Un'Shallach and I trust his word, that you will help us, after we helped you.", 108, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_010", "I'm no friend of pretensions either, Shaikan. And I too, trust the word of my Lord, that you will be able to help us.", 109, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_011PC", "Good, Having cleared this, let's get down to business - what can we do?", 110, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_012", "I've dispatched scouts to light the signal fires, where our defenses outside the camp are best. Afterwards, they should check out the fishing holes to see if our fishers can return there.", 111, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_013PC", "Let me guess - they haven't returned yet?", 112, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_014", "Indeed. If you could take a look, what has become of them, that would be most helpful.", 113, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_015", "If you want, you can speak with my weapons-smith. He seems to have a fancy idea about a weapon able to kill that Wolf beast.", 114, 16777215))
	_uState11Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_016PC", "Very well. I'll report back to you when I've found their bodies.", 115, 16777215))
	_uState11Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NORCAINE_LEADER)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans2 = nil

-- TO STATE: endconversation
_uState11Trans3 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T3", "Dialog")
	_uState11Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1))
	_uState11Trans3:AddCondition (CScriptConditionValue('', 'mf_P709_DeadScout1', 1, 2))
	_uState11Trans3:AddCondition (CScriptConditionValue('', 'mf_P709_DeadScout2', 1, 2))
	_uState11Trans3:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState11Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState11Trans3:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_017", "You're back.", 116, 16777215))
	_uState11Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_018PC", "As expected, I found only the dead bodies of your scouts. They were mauled by wild beasts, probably wolves.", 117, 16777215))
	_uState11Trans3:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_019", "Then we must pray to Nor, that he will light their way to the Mor Duine.", 118, 16777215))
	_uState11Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_020PC", "I guess now it's up to me to light those signal fires?", 119, 16777215))
	_uState11Trans3:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_021", "How very wise of you.", 120, 16777215))
	_uState11Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NORCAINE_LEADER)', 1, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans3 = nil

-- TO STATE: endconversation
_uState11Trans4 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T4", "Dialog")
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2) ))
	_uState11Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_21', 2))
	_uState11Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_22', 2))
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout1', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout2', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_022", "You're back.", 121, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_023PC", "All the fires are lit but I guess you won't be needing them anymore.", 122, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_024", "What do you mean?", 123, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_025PC", "At the last fire, the huge Wolf Spirit itself rose to attack us. I guess it was the beast you told us about.", 124, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_026", "And yet you live?", 125, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_027PC", "We killed the Wolf Spirit.", 126, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_028", "You killed it! A great battle it must have been.", 127, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_029PC", "It's nothing I am proud of. This animal was probably following orders of his Goddess - Elen.", 128, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_030", "And the reason why Elen would guard a place like this is the reason why you and your party are here?", 129, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_031PC", "You assume correctly. I cannot tell you more but we have to explore the rest of these lands. Can you disable the barrier?", 130, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_032", "It's the only safeguard we have against those Undead forces. I would rather not risk the life of all present, you includdded.", 131, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_033PC", "You promised to help! Now fulfil your promise.", 132, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_034", "Why do you force me to make this choice? [Pause] Very well. I will take the barrier down. Maybe you can deal better with these Undead than we have.", 133, 16777215))
	_uState11Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_035PC", "Thank you, Dracon.", 134, 16777215))
	_uState11Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NORCAINE_LEADER)', 1, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans4 = nil

-- TO STATE: endconversation
_uState11Trans5 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T5", "Dialog")
	_uState11Trans5:AddCondition (CScriptConditionValue('', 'mf_P709_IOS_SIDEQ_2_REPORTBACK', 0, 2))
	_uState11Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_1', 2) ))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout1', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout2', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_21', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_22', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans5:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_036", "You're back.", 135, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_037", "This time, I have a favour to ask from you.", 136, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_038PC", "What can I do for you, Dracon?", 137, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_039", "You've found the dead bodies of the scouts. Did they still have their weapons on them?", 138, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_040PC", "I'm not sure. Why?", 139, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_041", "For us Dracon, our weapons become special, once we've used them in battle. To honour the deceased we'd need the weapons of our scouts.", 140, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_042PC", "You need the weapons but not the bodies?", 141, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_043", "The bodies are just lifeless shells. Their weapons still have meaning to them and to us.", 142, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_044PC", "Very well. I will take care, that you'll get them.", 143, 16777215))
	_uState11Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NORCAINE_LEADER)', 1, 4))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans5 = nil

-- TO STATE: endconversation
_uState11Trans6 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T6", "Dialog")
	_uState11Trans6:AddCondition (CScriptConditionValue('', 'mf_P709_IOS_SIDEQ_2_REPORTBACK', 1, 2))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_1', 2) ))
	_uState11Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 759, 1, 1, 1))
	_uState11Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 760, 1, 1, 1))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout1', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout2', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_21', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_22', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_IOS_SIDEQ_2_REPORTBACK', 0, 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans6:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_045", "You're back.", 144, 16777215))
	_uState11Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P709_DLG_NORCAINELEADER_046PC", "I've got the weapons of the scouts for you.", 145, 16777215))
	_uState11Trans6:AddAction (CScriptActionSay("norcaine_leader", "P709_DLG_NORCAINELEADER_047", "Thank you. We will honour their memories and your's along with it.", 146, 16777215))
	_uState11Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NORCAINE_LEADER)', 1, 4))
	_uState11Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans6 = nil

-- TO STATE: endconversation
_uState11Trans7 = GdsCreateTransition (_uState1, _uState11, "State_1", "State_11_T7", "Dialog")
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_NorcaineLeaderKnown', 0, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_SIDEQ_4_Accepted', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )) ))
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1) ), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))) ))
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_1', 1), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout1', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P709_DeadScout2', 1, 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2) ), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_21', 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_SUBQ_22', 2), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_IOS_SIDEQ_2_REPORTBACK', 0, 2), CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IOS_MQ_2', 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_1', 2) ), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') )))) ))
	_uState11Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P709_IOS_SIDEQ_2_REPORTBACK', 1, 2), CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IOS_SIDEQ_1', 2) ), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 759, 1, 1, 1), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 760, 1, 1, 1), GdsNegateCondition( CScriptConditionScriptTagIsFighting('pl_HumanAvatar') ))))) ))
	_uState11Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "norcaine_leader"))
	_uState11Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(NORCAINE_LEADER)', 1, 4))
	_uState11Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(NORCAINE_LEADER)', 1, 4))
	_uState11Trans7 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(NORCAINE_LEADER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_4_Started', 1, 4))
	_uEndActions1:AddAction (CScriptActionDialogEnable('norcaine_leader', 0))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(NORCAINE_LEADER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(NORCAINE_LEADER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P709_MQ_1_Accepted', 1, 4))
	_uEndActions2:AddAction (CScriptActionDialogEnable('norcaine_leader', 0))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(NORCAINE_LEADER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(NORCAINE_LEADER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P709_MQ_1_Completed', 1, 4))
	_uEndActions3:AddAction (CScriptActionDialogEnable('norcaine_leader', 0))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(NORCAINE_LEADER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(NORCAINE_LEADER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P709_MQ_2_Completed', 1, 4))
	_uEndActions4:AddAction (CScriptActionDialogEnable('norcaine_leader', 0))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(NORCAINE_LEADER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(NORCAINE_LEADER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_1_Accepted', 1, 4))
	_uEndActions5:AddAction (CScriptActionDialogEnable('norcaine_leader', 0))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(NORCAINE_LEADER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(NORCAINE_LEADER)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P709_SIDEQ_1_Completed', 1, 4))
	_uEndActions6:AddAction (CScriptActionDialogEnable('norcaine_leader', 0))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(NORCAINE_LEADER)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState11, _uState11, "State_11", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(NORCAINE_LEADER)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "norcaine_leader"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(NORCAINE_LEADER)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 4))
	_uEndActions7 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(NORCAINE_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('norcaine_leader', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(NORCAINE_LEADER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState11 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("norcaine_leader_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NORCAINE_LEADER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/urwounded2_BeginDialog.tak', 'pl_HumanAvatar', 'norcaine_leader'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(NORCAINE_LEADER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

