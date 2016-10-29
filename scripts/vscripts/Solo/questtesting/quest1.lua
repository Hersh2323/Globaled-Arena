function OnStartTouchInitializeQuest1(trigger)
 
	print(trigger.activator)
	print(trigger.caller)
 


	  GameRules:SendCustomMessage("Quest 1 initialized.", 0, 0)

	--  GLOBALED_SOLO_QUEST_ONE_COMPLETE = 0
    --	print("[GLOBALED] printing current variable GLOBALED_SOLO_QUEST_ONE_COMPLETE: " .. GLOBALED_SOLO_QUEST_ONE_COMPLETE)      

	  GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
	          name = "QuestName1",
	          title = "Quest 1: Kill 3 wolves"
	      })

	  GameRules.subQuest = SpawnEntityFromTableSynchronous( "subquest_base", {
	      show_progress_bar = true,
	      progress_bar_hue_shift = -119
	  } )

	  GameRules.Quest.UnitsKilled = 0
	  GameRules.Quest.KillLimit = 3
	  GameRules.Quest:AddSubquest( GameRules.subQuest )


	  -- text on the quest timer at start
	  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
	  GameRules.Quest:SetTextReplaceValue( QUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )

	  -- value on the bar
	  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, 0 )
	  GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_TARGET_VALUE, GameRules.Quest.KillLimit )



	local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector( -10176.9, 7435.67, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

	local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector( -10624, 8768, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

	local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector( -10240, 10304, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

	local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector( -7872, 10624, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

	local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_wolf", Vector( -6016, 9792, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)


end


function OnStartTouchInitializeQuest2(trigger)

	if GLOBALED_SOLO_QUEST_TWO_AVAILABLE == 1 then
	    print("[GLOBALED] printing current variable GLOBALED_SOLO_QUEST_TWO_AVAILABLE: " .. GLOBALED_SOLO_QUEST_TWO_AVAILABLE)   

	    GLOBALED_SOLO_QUEST_TWO_AVAILABLE = 0
	    print("[GLOBALED] printing current variable GLOBALED_SOLO_QUEST_TWO_AVAILABLE: " .. GLOBALED_SOLO_QUEST_TWO_AVAILABLE)      


		print(trigger.activator)
		print(trigger.caller)
	 
		GameRules:SendCustomMessage("Quest 2 initialized.", 0, 0)

		GLOBALED_SOLO_QUEST_TWO_COMPLETE = 0
		print("[GLOBALED] printing current variable GLOBALED_SOLO_QUEST_TWO_COMPLETE: " .. GLOBALED_SOLO_QUEST_TWO_COMPLETE)      

		GameRules.Quest = SpawnEntityFromTableSynchronous( "quest", {
		      name = "QuestName1",
		      title = "Quest 2: Kill 9 wolves"
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



		local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector( 2615.45, 5303.85, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

		local easyUnitWolf = CreateUnitByName("npc_globaled_solo_easy_melee_creep", Vector( 712.396, 6519.79, 128.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)


	else
	end
 

end