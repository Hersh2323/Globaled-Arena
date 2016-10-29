function spawnTestNpc(event)

	if testNpc1 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: testNpc1")  

		testNpc1SpawnEntity = Entities:FindByName(nil, "spawnLocationTest")
		testNpc1SpawnEntityLocation = testNpc1SpawnEntity:GetAbsOrigin()
	    testNpc1 = CreateUnitByName("npc_globaled_solo_easy_wolf", testNpc1SpawnEntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
		-- print("[ GLOBALED - VALLEY ] Found to be not nil: testNpc1")  
	end

end

function spawnTestNpcKilledNil()


  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 30 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] testNpc1 forced to nil, thus rendering available for respawn at original location.")      
		testNpc1 = nil

      return
    end)


end




function spawnEasyWolf1(event)

	if easyWolf1 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf1")  

		local easyWolf1Entity = Entities:FindByName(nil, "easyWolfSpawn1")
		local easyWolf1EntityLocation = easyWolf1Entity:GetAbsOrigin()
	    easyWolf1 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf1EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else

	end

end

function spawnEasyWolf1KilledNil()


  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 30 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf1 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf1 = nil

      return
    end)
end



function spawnEasyWolf2(event)

	if easyWolf2 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf2")  

		local easyWolf2Entity = Entities:FindByName(nil, "easyWolfSpawn2")
		local easyWolf2EntityLocation = easyWolf2Entity:GetAbsOrigin()
	    easyWolf2 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf2EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf2KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 30 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf2 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf2 = nil

      return
    end)

end


function spawnEasyWolf3(event)

	if easyWolf3 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf3")  

		local easyWolf3Entity = Entities:FindByName(nil, "easyWolfSpawn3")
		local easyWolf3EntityLocation = easyWolf3Entity:GetAbsOrigin()
	    easyWolf3 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf3EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf3KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 30 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf3 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf3 = nil

      return
    end)
  
end

function spawnEasyWolf4(event)

	if easyWolf4 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf4")  

		local easyWolf4Entity = Entities:FindByName(nil, "easyWolfSpawn4")
		local easyWolf4EntityLocation = easyWolf4Entity:GetAbsOrigin()
	    easyWolf4 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf4EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf4KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 40 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf4 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf4 = nil

      return
    end)
  
end


function spawnEasyWolf5(event)

	if easyWolf5 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf5")  

		local easyWolf5Entity = Entities:FindByName(nil, "easyWolfSpawn5")
		local easyWolf5EntityLocation = easyWolf5Entity:GetAbsOrigin()
	    easyWolf5 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf5EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf5KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 50 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf5 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf5 = nil

      return
    end)
  
end

function spawnEasyWolf6(event)

	if easyWolf6 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf6")  

		local easyWolf6Entity = Entities:FindByName(nil, "easyWolfSpawn6")
		local easyWolf6EntityLocation = easyWolf6Entity:GetAbsOrigin()
	    easyWolf6 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf6EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf6KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 60 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf6 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf6 = nil

      return
    end)
  
end


function spawnEasyWolf7(event)

	if easyWolf7 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf7")  

		local easyWolf7Entity = Entities:FindByName(nil, "easyWolfSpawn7")
		local easyWolf7EntityLocation = easyWolf7Entity:GetAbsOrigin()
	    easyWolf7 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf7EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf7KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 70 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf7 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf7 = nil

      return
    end)
  
end

function spawnEasyWolf8(event)

	if easyWolf8 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf8")  

		local easyWolf8Entity = Entities:FindByName(nil, "easyWolfSpawn8")
		local easyWolf8EntityLocation = easyWolf8Entity:GetAbsOrigin()
	    easyWolf8 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf8EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf8KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME, -- Start this timer 80 game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf8 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf8 = nil

      return
    end)
  
end

function spawnEasyWolf9(event)

	if easyWolf9 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf9")  

		local easyWolf9Entity = Entities:FindByName(nil, "easyWolfSpawn9")
		local easyWolf9EntityLocation = easyWolf9Entity:GetAbsOrigin()
	    easyWolf9 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf9EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf9KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf9 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf9 = nil

      return
    end)
  
end

function spawnEasyWolf10(event)

	if easyWolf10 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf10")  

		local easyWolf10Entity = Entities:FindByName(nil, "easyWolfSpawn10")
		local easyWolf10EntityLocation = easyWolf10Entity:GetAbsOrigin()
	    easyWolf10 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf10EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    local easyWolf10WayPointInitial = Entities:FindByName(nil, "easyWolf10_1")
	    easyWolf10:SetInitialGoalEntity(easyWolf10WayPointInitial)
	else
	end

end

function spawnEasyWolf10KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf10 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf10 = nil

      return
    end)
  
end



function spawnEasyWolf11(event)

	if easyWolf11 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf11")  

		local easyWolf11Entity = Entities:FindByName(nil, "easyWolfSpawn11")
		local easyWolf11EntityLocation = easyWolf11Entity:GetAbsOrigin()
	    easyWolf11 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf11EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf11KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf11 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf11 = nil

      return
    end)
  
end



function spawnEasyWolf12(event)

	if easyWolf12 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyWolf12")  

		local easyWolf12Entity = Entities:FindByName(nil, "easyWolfSpawn12")
		local easyWolf12EntityLocation = easyWolf12Entity:GetAbsOrigin()
	    easyWolf12 = CreateUnitByName("npc_globaled_solo_easy_wolf", easyWolf12EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	else
	end

end

function spawnEasyWolf12KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
    function()
      	print("[ GLOBALED - VALLEY ] easyWolf12 forced to nil, thus rendering available for respawn at original location.")      
		easyWolf12 = nil

      return
    end)
  
end

function spawnEasyMeleeCreep1(event)

	if easyMeleeCreep1 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep1")  

		local easyMeleeCreep1Entity = Entities:FindByName(nil, "easyMeleeCreep1Spawn")
		local easyMeleeCreep1EntityLocation = easyMeleeCreep1Entity:GetAbsOrigin()
	    easyMeleeCreep1 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep1EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	    local easyMeleeCreep1PointInitial = Entities:FindByName(nil, "easyMeleeCreep1_waypoint_1")
	    easyMeleeCreep1:SetInitialGoalEntity(easyMeleeCreep1PointInitial)

	    
	else
	end

end

function spawnEasyMeleeCreep1KilledNil()

  Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
    function()
      	print("[ GLOBALED - VALLEY ] easyMeleeCreep1 forced to nil, thus rendering available for respawn at original location.")      
		easyMeleeCreep1 = nil

      return
    end)
  
end


function spawnEasyRangedCreep1(event)

	if easyRangedCreep1 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep1")  

		local easyRangedCreep1Entity = Entities:FindByName(nil, "easyRangedCreep1Spawn")
		local easyRangedCreep1EntityLocation = easyRangedCreep1Entity:GetAbsOrigin()
	    easyRangedCreep1 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep1EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end




function spawnEasyMeleeCreep2(event)

	if easyMeleeCreep2 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep2")  

		local easyMeleeCreep2Entity = Entities:FindByName(nil, "easyMeleeCreep2Spawn")
		local easyMeleeCreep2EntityLocation = easyMeleeCreep2Entity:GetAbsOrigin()
	    easyMeleeCreep2 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep2EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep2(event)

	if easyRangedCreep2 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep2")  

		local easyRangedCreep2Entity = Entities:FindByName(nil, "easyRangedCreep2Spawn")
		local easyRangedCreep2EntityLocation = easyRangedCreep2Entity:GetAbsOrigin()
	    easyRangedCreep2 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep2EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end


function spawnEasyMeleeCreep3(event)

	if easyMeleeCreep3 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep3")  

		local easyMeleeCreep3Entity = Entities:FindByName(nil, "easyMeleeCreep3Spawn")
		local easyMeleeCreep3EntityLocation = easyMeleeCreep3Entity:GetAbsOrigin()
	    easyMeleeCreep3 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep3EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep3(event)

	if easyRangedCreep3 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep3")  

		local easyRangedCreep3Entity = Entities:FindByName(nil, "easyRangedCreep3Spawn")
		local easyRangedCreep3EntityLocation = easyRangedCreep3Entity:GetAbsOrigin()
	    easyRangedCreep3 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep3EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end



function spawnEasyMeleeCreep4(event)

	if easyMeleeCreep4 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep4")  

		local easyMeleeCreep4Entity = Entities:FindByName(nil, "easyMeleeCreep4Spawn")
		local easyMeleeCreep4EntityLocation = easyMeleeCreep4Entity:GetAbsOrigin()
	    easyMeleeCreep4 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep4EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep4(event)

	if easyRangedCreep4 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep4")  

		local easyRangedCreep4Entity = Entities:FindByName(nil, "easyRangedCreep4Spawn")
		local easyRangedCreep4EntityLocation = easyRangedCreep4Entity:GetAbsOrigin()
	    easyRangedCreep4 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep4EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end


function spawnEasyMeleeCreep5(event)

	if easyMeleeCreep5 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep5")  

		local easyMeleeCreep5Entity = Entities:FindByName(nil, "easyMeleeCreep5Spawn")
		local easyMeleeCreep5EntityLocation = easyMeleeCreep5Entity:GetAbsOrigin()
	    easyMeleeCreep5 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep5EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep5(event)

	if easyRangedCreep5 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep5")  

		local easyRangedCreep5Entity = Entities:FindByName(nil, "easyRangedCreep5Spawn")
		local easyRangedCreep5EntityLocation = easyRangedCreep5Entity:GetAbsOrigin()
	    easyRangedCreep5 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep5EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end

function spawnEasyMeleeCreep6(event)

	if easyMeleeCreep6 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep6")  

		local easyMeleeCreep6Entity = Entities:FindByName(nil, "easyMeleeCreep6Spawn")
		local easyMeleeCreep6EntityLocation = easyMeleeCreep6Entity:GetAbsOrigin()
	    easyMeleeCreep6 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep6EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep6(event)

	if easyRangedCreep6 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep6")  

		local easyRangedCreep6Entity = Entities:FindByName(nil, "easyRangedCreep6Spawn")
		local easyRangedCreep6EntityLocation = easyRangedCreep6Entity:GetAbsOrigin()
	    easyRangedCreep6 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep6EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end

function spawnEasyMeleeCreep7(event)

	if easyMeleeCreep7 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep7")  

		local easyMeleeCreep7Entity = Entities:FindByName(nil, "easyMeleeCreep7Spawn")
		local easyMeleeCreep7EntityLocation = easyMeleeCreep7Entity:GetAbsOrigin()
	    easyMeleeCreep7 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep7EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep7(event)

	if easyRangedCreep7 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep7")  

		local easyRangedCreep7Entity = Entities:FindByName(nil, "easyRangedCreep7Spawn")
		local easyRangedCreep7EntityLocation = easyRangedCreep7Entity:GetAbsOrigin()
	    easyRangedCreep7 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep7EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end

function spawnEasyMeleeCreep8(event)

	if easyMeleeCreep8 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep8")  

		local easyMeleeCreep8Entity = Entities:FindByName(nil, "easyMeleeCreep8Spawn")
		local easyMeleeCreep8EntityLocation = easyMeleeCreep8Entity:GetAbsOrigin()
	    easyMeleeCreep8 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep8EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep8(event)

	if easyRangedCreep8 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep8")  

		local easyRangedCreep8Entity = Entities:FindByName(nil, "easyRangedCreep8Spawn")
		local easyRangedCreep8EntityLocation = easyRangedCreep8Entity:GetAbsOrigin()
	    easyRangedCreep8 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep8EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end


function spawnEasyMeleeCreep9(event)

	if easyMeleeCreep9 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep9")  

		local easyMeleeCreep9Entity = Entities:FindByName(nil, "easyMeleeCreep9Spawn")
		local easyMeleeCreep9EntityLocation = easyMeleeCreep9Entity:GetAbsOrigin()
	    easyMeleeCreep9 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep9EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep9(event)

	if easyRangedCreep9 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep9")  

		local easyRangedCreep9Entity = Entities:FindByName(nil, "easyRangedCreep9Spawn")
		local easyRangedCreep9EntityLocation = easyRangedCreep9Entity:GetAbsOrigin()
	    easyRangedCreep9 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep9EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end



function spawnEasyMeleeCreep10(event)

	if easyMeleeCreep10 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep10")  

		local easyMeleeCreep10Entity = Entities:FindByName(nil, "easyMeleeCreep10Spawn")
		local easyMeleeCreep10EntityLocation = easyMeleeCreep10Entity:GetAbsOrigin()
	    easyMeleeCreep10 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep10EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep10(event)

	if easyRangedCreep10 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep10")  

		local easyRangedCreep10Entity = Entities:FindByName(nil, "easyRangedCreep10Spawn")
		local easyRangedCreep10EntityLocation = easyRangedCreep10Entity:GetAbsOrigin()
	    easyRangedCreep10 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep10EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end


function spawnEasyMeleeCreep11(event)

	if easyMeleeCreep11 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep11")  

		local easyMeleeCreep11Entity = Entities:FindByName(nil, "easyMeleeCreep11Spawn")
		local easyMeleeCreep11EntityLocation = easyMeleeCreep11Entity:GetAbsOrigin()
	    easyMeleeCreep11 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep11EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep11(event)

	if easyRangedCreep11 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep11")  

		local easyRangedCreep11Entity = Entities:FindByName(nil, "easyRangedCreep11Spawn")
		local easyRangedCreep11EntityLocation = easyRangedCreep11Entity:GetAbsOrigin()
	    easyRangedCreep11 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep11EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end

function spawnEasyMeleeCreep12(event)

	if easyMeleeCreep12 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyMeleeCreep12")  

		local easyMeleeCreep12Entity = Entities:FindByName(nil, "easyMeleeCreep12Spawn")
		local easyMeleeCreep12EntityLocation = easyMeleeCreep12Entity:GetAbsOrigin()
	    easyMeleeCreep12 = CreateUnitByName("npc_globaled_solo_easy_melee_creep", easyMeleeCreep12EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)
	    
	else
	end

end

function spawnEasyRangedCreep12(event)

	if easyRangedCreep12 == nil then
		print("[ GLOBALED - VALLEY ] nil npc found. spawning: easyRangedCreep12")  

		local easyRangedCreep12Entity = Entities:FindByName(nil, "easyRangedCreep12Spawn")
		local easyRangedCreep12EntityLocation = easyRangedCreep12Entity:GetAbsOrigin()
	    easyRangedCreep12 = CreateUnitByName("npc_globaled_solo_easy_ranged_creep", easyRangedCreep12EntityLocation, true, nil, nil, DOTA_TEAM_NEUTRALS)

	else
	end

end

