function InitHeroTriggerQuest1(trigger)
 
  print(trigger.activator)
  print(trigger.caller)

  GameRules:SendCustomMessage("Speak to the lost meepo in the center of town.", 0, 0)

end

function removeAllSpeechBubbles(trigger)

  local cancelQuestGiverDialog = Entities:FindByName(nil, "questgiver1npc")
  cancelQuestGiverDialog: DestroyAllSpeechBubbles()


end


function OnEndTouch(trigger)
 
  print(trigger.activator)
  print(trigger.caller)
 
end

function HeroTriggerQuest1QuestTextMeepo(trigger)

    local questGiver = Entities:FindByName(nil, "questgiver1npc")
    questGiver:AddSpeechBubble(1, "#globaled_questgivermeepo_quest_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

end

function HeroTriggerQuest1QuestTextTheLostMeepo(trigger)

    local questGiver = Entities:FindByName(nil, "questgiver_thelostmeepo")
    questGiver:AddSpeechBubble(1, "#globaled_questgiver_the_lost_meepo_quest_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

end

function HeroTriggerBystandersFireSuggestionText(trigger)

    local textActorTarget = Entities:FindByName(nil, "questgiver_lost_meepo_bird_1")
    textActorTarget:AddSpeechBubble(1, "#globaled_bystander_fire_suggestion_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

end


function HeroTriggerQuest1(trigger)
 
  print(trigger.activator)
  print(trigger.caller)

  GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
          name = "QuestName",
          title = "#QuestKill"
      })

  GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
      show_progress_bar = true,
      progress_bar_hue_shift = -119
  } )

  GameRules.Quest.UnitsKilled = 0
  GameRules.Quest.KillLimit = 5
  GameRules.Quest:AddSubquest( GameRules.subQuest )


  -- text on the quest timer at start
  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

  -- value on the bar
  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

  GameRules:SendCustomMessage("Quest 1 started.", 0, 0)



  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector(13760, -9008, 1), false, nil, nil, DOTA_TEAM_NEUTRALS)
  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector(12240, -9072, 1), false, nil, nil, DOTA_TEAM_NEUTRALS)
  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector(11856, -9472, 0), false, nil, nil, DOTA_TEAM_NEUTRALS)
  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector(13392, -7600, 0), false, nil, nil, DOTA_TEAM_NEUTRALS)
  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector(12992, -7152, 0), false, nil, nil, DOTA_TEAM_NEUTRALS)







end




function HeroTriggerQuest2QuestTextTheLostMeepo(trigger)

  local questGiver = Entities:FindByName(nil, "questgiver_thelostmeepo2")
  questGiver:AddSpeechBubble(1, "#globaled_questgiver_the_lost_meepo_quest_text_one_quest_two", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

end


function HeroTriggerQuest2(trigger)
 
  print(trigger.activator)
  print(trigger.caller)

  GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
          name = "QuestName",
          title = "#QuestValleyKill2"
      })

  GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
      show_progress_bar = true,
      progress_bar_hue_shift = -119
  } )

  GameRules.Quest.UnitsKilled = 0
  GameRules.Quest.KillLimit = 6
  GameRules.Quest:AddSubquest( GameRules.subQuest )


  -- text on the quest timer at start
  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

  -- value on the bar
  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

  GameRules:SendCustomMessage("Quest 2 started.", 0, 0)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector(11264, -5920, 129.354), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector(11880, -7704, 134.071), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector(10496, -7264, 74.573), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector(10082.3, -6091.71, 134.071), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector(10648, -4232, 134.071), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector(10976, -3880, 134.071), false, nil, nil, DOTA_TEAM_NEUTRALS)


end







function HeroTriggerQuest3QuestText ( trigger )

    local questGiverbilly = Entities:FindByName(nil, "questgiver_billy_the_ranged_creep_one")
    questGiverbilly:AddSpeechBubble(1, "#globaled_questgiver_quest_three_billy_the_ranged_creep_1", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

end

function HeroTriggerQuest3(trigger)
 
  print(trigger.activator)
  print(trigger.caller)

  GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
          name = "QuestName",
          title = "#QuestValleyKill3"
      })

  GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
      show_progress_bar = true,
      progress_bar_hue_shift = -119
  } )

  GameRules.Quest.UnitsKilled = 0
  GameRules.Quest.KillLimit = 6
  GameRules.Quest:AddSubquest( GameRules.subQuest )


  -- text on the quest timer at start
  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

  -- value on the bar
  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

  GameRules:SendCustomMessage("Quest 3 Started.", 0, 0)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", Vector( 3664, -14232, 513.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", Vector( 3194.8, -15660.9, 522.904 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", Vector( 1897.44, -14324.3, 522.905 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", Vector( 351.548, -13117, 522.905 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", Vector( 122.377, -14925, 522.905 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

  local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", Vector( 139.1, -14389.2, 522.905 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

end






function HeroTriggerQuest4text1(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverrichard = Entities:FindByName(nil, "questgiver_richard_the_ranged_creep_1")
    questGiverrichard:AddSpeechBubble(1, "#globaled_questgiver_quest_four_richard_the_ranged_creep_text_1", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end



function HeroTriggerQuest4(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestValley4"
          })

      GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      GameRules.Quest.UnitsKilled = 0
      GameRules.Quest.KillLimit = 2
      GameRules.Quest:AddSubquest( GameRules.subQuest )


      -- text on the quest timer at start
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      -- value on the bar
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      GameRules:SendCustomMessage("Quest Started.", 0, 0)

     local easyUnitDireSpy1 = CreateUnitByName("npc_globaled_solo_dire_spy", Vector( 4999.45, -11814.5, 513.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

     local easyUnitDireSpy2 = CreateUnitByName("npc_globaled_solo_dire_spy", Vector( 5524.65, -15480.6, 512.7 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

  else
  end
end


function HeroTriggerQuest4spytext1(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local spy1 = Entities:FindByName(nil, "questgiver_richard_the_ranged_creep_1")
    spy1:AddSpeechBubble(1, "#globaled_valley_quest_four_spytext", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end


function HeroTriggerQuest4text2(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverrichard = Entities:FindByName(nil, "questgiver_richard_the_ranged_creep_1")
    questGiverrichard:AddSpeechBubble(1, "#globaled_questgiver_quest_four_richard_the_ranged_creep_text_2", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end






function HeroTriggerQuest5text1(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverrichard = Entities:FindByName(nil, "questgiver_richard_the_ranged_creep_1")
    questGiverrichard:AddSpeechBubble(1, "#globaled_questgiver_quest_four_richard_the_ranged_creep_text_1", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end



function HeroTriggerQuest5(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestValley5"
          })

      GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      GameRules.Quest.UnitsKilled = 0
      GameRules.Quest.KillLimit = 8
      GameRules.Quest:AddSubquest( GameRules.subQuest )


      -- text on the quest timer at start
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      -- value on the bar
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      GameRules:SendCustomMessage("Quest Started.", 0, 0)

    local easyunitkobold1 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(1024, -8768, 1.35434), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold2 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(-1202.42, -9079.18, 0.35437), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold3 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(-2071.93, -11147.4, 0.35434), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold4 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(-4236.53, -12853.9, 256.354), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold5 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(-8128, -11968, 0.354279), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold6 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(-8000, -13760, 0.354279), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold7 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(-4437.72, -14814, 384.354), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local easyunitkobold8 = CreateUnitByName("npc_globaled_solo_easy_kobold", Vector(1125.94, -11075.2, 384.354), false, nil, nil, DOTA_TEAM_NEUTRALS)

  else
  end
end


function HeroTriggerQuest5text(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_five_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end

function HeroTriggerQuest5texttwo(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_five_text_two", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end


function HeroTriggerQuest6(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestValley6"
          })

      GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      GameRules.Quest.UnitsKilled = 0
      GameRules.Quest.KillLimit = 6
      GameRules.Quest:AddSubquest( GameRules.subQuest )


      -- text on the quest timer at start
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      -- value on the bar
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      GameRules:SendCustomMessage("Quest Started.", 0, 0)

    local mediumUnitWildwing1 = CreateUnitByName("npc_globaled_solo_medium_wildwing", Vector(2240, -5712, 129.354), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitWildwing2 = CreateUnitByName("npc_globaled_solo_medium_wildwing", Vector(3072, -3184, 129.463), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitWildwing3 = CreateUnitByName("npc_globaled_solo_medium_wildwing", Vector(4979.14, -4273.23, 129.463), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitWildwing4 = CreateUnitByName("npc_globaled_solo_medium_wildwing", Vector(5006.13, -5872.58, 385.463), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitWildwing5 = CreateUnitByName("npc_globaled_solo_medium_wildwing", Vector(7270.76, -6835.93, 385.463), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitWildwing6 = CreateUnitByName("npc_globaled_solo_medium_wildwing", Vector(5338.46, -7556.04, 385.463), false, nil, nil, DOTA_TEAM_NEUTRALS)



  else
  end
end



function HeroTriggerQuest6text(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_six_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end




function HeroTriggerQuest6texttwo(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_six_text_two", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end















function HeroTriggerQuest7(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestValley7"
          })

      GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      GameRules.Quest.UnitsKilled = 0
      GameRules.Quest.KillLimit = 6
      GameRules.Quest:AddSubquest( GameRules.subQuest )


      -- text on the quest timer at start
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      -- value on the bar
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      GameRules:SendCustomMessage("Quest Started.", 0, 0)

    local mediumUnitGolem1 = CreateUnitByName("npc_globaled_solo_medium_golem", Vector(456.588, -2203.5, -252), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitGolem2 = CreateUnitByName("npc_globaled_solo_medium_golem", Vector(1639.05, 2114.81, -253.883), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitGolem3 = CreateUnitByName("npc_globaled_solo_medium_golem", Vector(2295.62, 3696.72, -253.883), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitGolem4 = CreateUnitByName("npc_globaled_solo_medium_golem", Vector(3454.24, 3183.41, -253.883), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitGolem5 = CreateUnitByName("npc_globaled_solo_medium_golem", Vector(3859.17, 5803.1, -253.883), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitGolem6 = CreateUnitByName("npc_globaled_solo_medium_golem", Vector(4062.15, 7381.54, -253.883), false, nil, nil, DOTA_TEAM_NEUTRALS)

  else
  end
end



function HeroTriggerQuest7text(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_seven_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end




function HeroTriggerQuest7texttwo(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_seven_text_two", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end



--[[
function destroyTest ( trigger )

  if IsServer() then

    local destroyThis = Entities:FindByName(nil, "questgiver1npc")
    destroyThis:Destroy()

  else
  end

end
]]



function HeroTriggerQuest8(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestValley8"
          })

      GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      GameRules.Quest.UnitsKilled = 0
      GameRules.Quest.KillLimit = 12
      GameRules.Quest:AddSubquest( GameRules.subQuest )


      -- text on the quest timer at start
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      -- value on the bar
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      GameRules:SendCustomMessage("Quest Started.", 0, 0)

    local mediumUnitHarpy1 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(8820, -2664, 385.354), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy2 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(11020.1, -2447.98, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy3 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(13027.4, -2544.58, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy4 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(14276.6, -3770.03, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy5 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(15249.6, -5694.78, 255.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy6 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(12512.8, 301.016, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy7 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(14044.6, -579.351, 511.918), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy8 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(15138.1, -1146.78, 511.918), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy9 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(14758.2, 948.928, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy10 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(13056, 1184, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy11 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(14867, 2254.02, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local mediumUnitHarpy12 = CreateUnitByName("npc_globaled_solo_medium_harpy", Vector(11694.9, -1481.16, 511.919), false, nil, nil, DOTA_TEAM_NEUTRALS)

  else
  end
end



function HeroTriggerQuest8text(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_location_two_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_eight_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end




function HeroTriggerQuest8texttwo(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_location_two_radiant_general")
      questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_eight_text_two", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end




function HeroTriggerQuest9(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestValley9"
          })

      GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      GameRules.Quest.UnitsKilled = 0
      GameRules.Quest.KillLimit = 4
      GameRules.Quest:AddSubquest( GameRules.subQuest )


      -- text on the quest timer at start
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      -- value on the bar
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

      GameRules:SendCustomMessage("Quest Started.", 0, 0)

    local ghostNpc1 = CreateUnitByName("npc_valley_solo_ghost", Vector(10192, 1216, 288), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local ghostNpc2 = CreateUnitByName("npc_valley_solo_ghost", Vector(8738.42, 383.059, 117.438), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local ghostNpc3 = CreateUnitByName("npc_valley_solo_ghost", Vector(10206.2, 4351.63, 117.438), false, nil, nil, DOTA_TEAM_NEUTRALS)

    local ghostNpc4 = CreateUnitByName("npc_valley_solo_ghost", Vector(12071.3, 3646.09, 245.437), false, nil, nil, DOTA_TEAM_NEUTRALS)

  else
  end
end



function HeroTriggerQuest9text(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

    local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_location_two_radiant_general")
    questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_nine_text_one", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end




function HeroTriggerQuest9texttwo(trigger)
 
  -- print(trigger.activator)
  -- print(trigger.caller)

  if IsServer() then

      local questGiverRadiantGeneral = Entities:FindByName(nil, "questgiver_forward_camp_location_two_radiant_general")
      questGiverRadiantGeneral:AddSpeechBubble(1, "#globaled_questgiver_quest_nine_text_two", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

  else
  end
end



function HeroSpecificTriggerQuest(trigger)
 
  local hero = trigger.activator
  -- print(trigger.caller)

  if IsServer() then

      hero.Quest = SpawnEntityFromTableSynchronous( "quest", {
              name = "QuestName",
              title = "#QuestTitleString"
          })

      hero.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
          show_progress_bar = true,
          progress_bar_hue_shift = -119
      } )

      hero.Quest.UnitsKilled = 0
      hero.Quest.KillLimit = 1
      hero.Quest:AddSubquest( hero.subQuest )


      -- text on the quest timer at start
      hero.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      hero.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, hero.Quest.KillLimit )

      -- value on the bar
      hero.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
      hero.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, hero.Quest.KillLimit )

      hero:SendCustomMessage("Quest Started.", 0, 0)

  else
  end
end













--[[
      -- Quest 1

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_easy_wolf")   then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local DisableOne = Entities:FindByName(nil, "start_valley_quest_1")
              DisableOne:Disable()

              local DisableTwo = Entities:FindByName(nil, "InitializeQuest1")
              DisableTwo:Disable()


              local EnableQuestTwo = Entities:FindByName(nil, "start_valley_quest_2")
              EnableQuestTwo:Enable()

          end
      end



      -- Quest 2

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_easy_melee_creep")   then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local disableQuestTwo = Entities:FindByName(nil, "start_valley_quest_2")
              disableQuestTwo:Disable()

              local enableQuestThree = Entities:FindByName(nil, "start_valley_quest_3")
              enableQuestThree:Enable()

          end
      end

      -- Quest 3

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_easy_ranged_creep")   then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_3")
              questGiverTriggerToBeDisabled:Disable()

          end
      end

      -- Quest 4

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_dire_spy") then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete. Return to Richard for more information.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_4")
              questGiverTriggerToBeDisabled:Disable()

              local enableQuestGiverQuest4text2 = Entities:FindByName(nil, "start_valley_quest_4_followup_1")
              enableQuestGiverQuest4text2:Enable()

          end
      end

      -- Quest 5

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_easy_kobold") then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_5")
              questGiverTriggerToBeDisabled:Disable()

              local enableQuestGiverQuesttext2 = Entities:FindByName(nil, "start_valley_quest_5_followup")
              enableQuestGiverQuesttext2:Enable()

          end
      end

      -- Quest 6

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_medium_wildwing") then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_6")
              questGiverTriggerToBeDisabled:Disable()

              local enableQuestGiverQuesttext2 = Entities:FindByName(nil, "start_valley_quest_6_followup")
              enableQuestGiverQuesttext2:Enable()

          end
      end
      
      -- Quest 7

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_medium_golem") then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_7")
              questGiverTriggerToBeDisabled:Disable()

              local enableQuestGiverQuesttext2 = Entities:FindByName(nil, "start_valley_quest_7_followup")
              enableQuestGiverQuesttext2:Enable()

          end
      end


      -- Quest 8

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_medium_harpy") then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_8")
              questGiverTriggerToBeDisabled:Disable()

              local enableQuestGiverQuesttext2 = Entities:FindByName(nil, "start_valley_quest_8_followup")
              enableQuestGiverQuesttext2:Enable()

          end
      end



      -- Quest 9

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_valley_solo_ghost") then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)

              local questGiverTriggerToBeDisabled = Entities:FindByName(nil, "start_valley_quest_9")
              questGiverTriggerToBeDisabled:Disable()

              local enableQuestGiverQuesttext2 = Entities:FindByName(nil, "start_valley_quest_9_followup")
              enableQuestGiverQuesttext2:Enable()

          end
      end

]]