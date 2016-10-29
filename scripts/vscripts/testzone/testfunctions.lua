function spawnTestNpcOne()

  local testNpcOne = CreateUnitByName("npc_globaled_test_npc_one", Vector( -3065.46, 3204.67, 129.354 ), false, nil, nil, DOTA_TEAM_NEUTRALS)

end

function triggerTestNpcOneStart(trigger)

	npcOneCombatStartTime = GameRules:GetDOTATime(false, false)

    Notifications:TopToAll({text="Combat started with test npc one", duration=5.0})

end

function spawnTestNpcTwo()
	
end

function spawnTestNpcThree()
	
end

function spawnTestNpcFour()
	
end

function spawnTestNpcFive()
	
end