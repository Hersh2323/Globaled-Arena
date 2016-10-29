ListenToGameEvent( "entity_killed", Dynamic_Wrap( GameMode, "OnEntityKilled" ), self )


GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
        name = "QuestName",
        title = "#QuestKill"
    })

GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
    show_progress_bar = true,
    progress_bar_hue_shift = -119
} )
GameRules.Quest.UnitsKilled = 0
GameRules.Quest.KillLimit = 10
GameRules.Quest:AddSubquest( GameRules.subQuest )

-- text on the quest timer at start
GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

-- value on the bar
GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

