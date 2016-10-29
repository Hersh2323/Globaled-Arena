-- This file contains all barebones-registered events and has already set up the passed-in parameters for your use.

-- Cleanup a player when they leave
function GameMode:OnDisconnect(keys)
  DebugPrint('[BAREBONES] Player Disconnected ' .. tostring(keys.userid))
  DebugPrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function GameMode:OnGameRulesStateChange(keys)
  DebugPrint("[BAREBONES] GameRules State Changed")
  DebugPrintTable(keys)

  local newState = GameRules:State_Get()
end

-- An NPC has spawned somewhere in game.  This includes heroes
function GameMode:OnNPCSpawned(keys)
  DebugPrint("[BAREBONES] NPC Spawned")
  DebugPrintTable(keys)

  local npc = EntIndexToHScript(keys.entindex)

  local npc = EntIndexToHScript(keys.entindex)

  local npcName = npc:GetUnitName()
  if npcName == "npc_globaled_valley_tango" then

      local abilityLevelUpTarget = npc
      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
          end
      end
  else
  end

  
end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function GameMode:OnEntityHurt(keys)
  --DebugPrint("[BAREBONES] Entity Hurt")
  --DebugPrintTable(keys)

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless
  if keys.entindex_attacker ~= nil and keys.entindex_killed ~= nil then
    local entCause = EntIndexToHScript(keys.entindex_attacker)
    local entVictim = EntIndexToHScript(keys.entindex_killed)

    -- The ability/item used to damage, or nil if not damaged by an item/ability
    local damagingAbility = nil

    if keys.entindex_inflictor ~= nil then
      damagingAbility = EntIndexToHScript( keys.entindex_inflictor )
    end
  end
end

-- An item was picked up off the ground
function GameMode:OnItemPickedUp(keys)
  DebugPrint( '[BAREBONES] OnItemPickedUp' )
  DebugPrintTable(keys)

  local unitEntity = nil
  if keys.UnitEntitIndex then
    unitEntity = EntIndexToHScript(keys.UnitEntitIndex)
  elseif keys.HeroEntityIndex then
    unitEntity = EntIndexToHScript(keys.HeroEntityIndex)
  end

  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function GameMode:OnPlayerReconnect(keys)
  DebugPrint( '[BAREBONES] OnPlayerReconnect' )
  DebugPrintTable(keys) 
end

-- An item was purchased by a player
function GameMode:OnItemPurchased( keys )
  DebugPrint( '[BAREBONES] OnItemPurchased' )
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function GameMode:OnAbilityUsed(keys)
  DebugPrint('[BAREBONES] AbilityUsed')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function GameMode:OnNonPlayerUsedAbility(keys)
  DebugPrint('[BAREBONES] OnNonPlayerUsedAbility')
  DebugPrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function GameMode:OnPlayerChangedName(keys)
  DebugPrint('[BAREBONES] OnPlayerChangedName')
  DebugPrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function GameMode:OnPlayerLearnedAbility( keys)
  DebugPrint('[BAREBONES] OnPlayerLearnedAbility')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function GameMode:OnAbilityChannelFinished(keys)
  DebugPrint('[BAREBONES] OnAbilityChannelFinished')
  DebugPrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function GameMode:OnPlayerLevelUp(keys)
  DebugPrint('[BAREBONES] OnPlayerLevelUp')
  DebugPrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function GameMode:OnLastHit(keys)
  DebugPrint('[BAREBONES] OnLastHit')
  DebugPrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local killedEnt = EntIndexToHScript(keys.EntKilled)
end

-- A tree was cut down by tango, quelling blade, etc
function GameMode:OnTreeCut(keys)
  DebugPrint('[BAREBONES] OnTreeCut')
  DebugPrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function GameMode:OnRuneActivated (keys)
  DebugPrint('[BAREBONES] OnRuneActivated')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_BOUNTY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function GameMode:OnPlayerTakeTowerDamage(keys)
  DebugPrint('[BAREBONES] OnPlayerTakeTowerDamage')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- A player picked a hero
function GameMode:OnPlayerPickHero(keys)
  DebugPrint('[BAREBONES] OnPlayerPickHero')
  DebugPrintTable(keys)

  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
end

-- A player killed another player in a multi-team context
function GameMode:OnTeamKillCredit(keys)
  DebugPrint('[BAREBONES] OnTeamKillCredit')
  DebugPrintTable(keys)

  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

-- An entity died
function GameMode:OnEntityKilled( keys )
  DebugPrint( '[BAREBONES] OnEntityKilled Called' )
  DebugPrintTable( keys )
  

  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  -- The ability/item used to kill, or nil if not killed by an item/ability
  local killerAbility = nil

  if keys.entindex_inflictor ~= nil then
    killerAbility = EntIndexToHScript( keys.entindex_inflictor )
  end

  local damagebits = keys.damagebits -- This might always be 0 and therefore useless

-- Put code here to handle when an entity gets killed

  if GetMapName() == "arena_a3" and IsServer() then

    local killedUnitTeam = killedUnit:GetTeam()
    print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current killedUnitTeam variable: "..killedUnitTeam)

    if killedUnitTeam == 2 and killedUnit:IsRealHero() then
      -- 2 = radiant

      GLOBALED_GAMEMODE_DIRE_KILLS = GLOBALED_GAMEMODE_DIRE_KILLS+1
      print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current GLOBALED_GAMEMODE_DIRE_KILLS variable: "..GLOBALED_GAMEMODE_DIRE_KILLS)

      GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT = GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT-1
      print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT variable: "..GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT)


    elseif killedUnitTeam == 3 and killedUnit:IsRealHero() then
      -- 3 = dire

      GLOBALED_GAMEMODE_RADIANT_KILLS = GLOBALED_GAMEMODE_RADIANT_KILLS+1
      print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current GLOBALED_GAMEMODE_RADIANT_KILLS variable: "..GLOBALED_GAMEMODE_RADIANT_KILLS)

      GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE = GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE-1
      print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE variable: "..GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE)


    else
    end



  else
  end


  if GetMapName() == "testzone" then

    if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_test_npc_one")  then
 
        npcOneDeathTime = GameRules:GetDOTATime(false, false)

    else
    end


  else
  end




  if GetMapName() == "valley_a1" then
    
      -- valley test

      if  killedUnit == testNpc1 then
          print("[ GLOBALED - VALLEY ] killedUnit == testNpc1")  
          spawnTestNpcKilledNil()
      else
      end

      if  killedUnit == easyWolf1 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf1")  
          spawnEasyWolf1KilledNil()
      else
      end


      if  killedUnit == easyWolf2 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf2")  
          spawnEasyWolf2KilledNil()
      else
      end


      if  killedUnit == easyWolf3 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf3")  
          spawnEasyWolf3KilledNil()
      else
      end


      if  killedUnit == easyWolf4 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf4")  
          spawnEasyWolf4KilledNil()
      else
      end


      if  killedUnit == easyWolf5 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf5")  
          spawnEasyWolf5KilledNil()
      else
      end


      if  killedUnit == easyWolf6 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf6")  
          spawnEasyWolf6KilledNil()
      else
      end


      if  killedUnit == easyWolf7 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf7")  
          spawnEasyWolf7KilledNil()
      else
      end

      if  killedUnit == easyWolf8 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf8")  
          spawnEasyWolf8KilledNil()
      else
      end

      if  killedUnit == easyWolf9 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf9")  
          spawnEasyWolf9KilledNil()
      else
      end

      if  killedUnit == easyWolf10 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf10")  
          spawnEasyWolf10KilledNil()
      else
      end

      if  killedUnit == easyWolf11 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf11")  
          spawnEasyWolf11KilledNil()
      else
      end
      
      if  killedUnit == easyWolf12 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyWolf12")  
          spawnEasyWolf12KilledNil()
      else
      end

      if  killedUnit == easyMeleeCreep1 then
          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep1")  
          spawnEasyMeleeCreep1KilledNil()
      else
      end


      if  killedUnit == easyRangedCreep1 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep1")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep1 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep1 = nil

          return
          end)
      else
      end

      if  killedUnit == easyMeleeCreep2 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep2")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep2 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep2 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep2 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep2")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep2 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep2 = nil

          return
          end)
      else
      end


-- 




      if  killedUnit == easyMeleeCreep3 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep3")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep3 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep3 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep3 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep3")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep3 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep3 = nil

          return
          end)
      else
      end


-- 




      if  killedUnit == easyMeleeCreep4 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep4")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep4 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep4 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep4 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep4")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep4 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep4 = nil

          return
          end)
      else
      end






-- 




      if  killedUnit == easyMeleeCreep5 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep5")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep5 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep5 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep5 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep5")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep5 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep5 = nil

          return
          end)
      else
      end




-- 




      if  killedUnit == easyMeleeCreep6 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep6")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep6 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep6 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep6 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep6")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep6 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep6 = nil

          return
          end)
      else
      end




-- 




      if  killedUnit == easyMeleeCreep7 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep7")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep7 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep7 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep7 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep7")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep7 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep7 = nil

          return
          end)
      else
      end

-- 




      if  killedUnit == easyMeleeCreep8 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep8")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep8 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep8 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep8 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep8")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep8 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep8 = nil

          return
          end)
      else
      end




-- 




      if  killedUnit == easyMeleeCreep9 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep9")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep9 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep9 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep9 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep9")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep9 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep9 = nil

          return
          end)
      else
      end


-- 




      if  killedUnit == easyMeleeCreep10 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep10")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep10 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep10 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep10 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep10")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep10 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep10 = nil

          return
          end)
      else
      end

-- 




      if  killedUnit == easyMeleeCreep11 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep11")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep11 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep11 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep11 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep11")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep11 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep11 = nil

          return
          end)
      else
      end


-- 




      if  killedUnit == easyMeleeCreep12 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyMeleeCreep12")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyMeleeCreep12 forced to nil, thus rendering available for respawn at original location.")      
              easyMeleeCreep12 = nil

          return
          end)
      else
      end

      if  killedUnit == easyRangedCreep12 then

          print("[ GLOBALED - VALLEY ] killedUnit == easyRangedCreep12")  

          Timers:CreateTimer(GLOBALED_VALLEY_NPC_SPAWN_TIME,
          function()
              print("[ GLOBALED - VALLEY ] easyRangedCreep12 forced to nil, thus rendering available for respawn at original location.")      
              easyRangedCreep12 = nil

          return
          end)
      else
      end

--


    --
    -- tango drop system
    --

    local tangoRollChance = GLOBALED_VALLEY_CONSUMABLE_TANGO_CHANCE
    local tangoDuration = GLOBALED_VALLEY_CONSUMABLE_TANGO_DURATION

    if tangoRollChance ~= nil then

        local tangoRoll = RandomInt(1,100)

        if tangoRoll <= tangoRollChance then

                if killerEntity:IsRealHero() then

                  -- create tango unit
                  local unitTeam = killerEntity:GetTeamNumber()

                  local fv = killedUnit:GetForwardVector()
                  local origin = killedUnit:GetAbsOrigin()
                  local distance = -128

                  local forward_placent_location = origin + fv * distance
                  local tangoUnitCreationLocation = forward_placent_location

                  CreateUnitByName("npc_globaled_valley_tango", tangoUnitCreationLocation, true, killerEntity, killerEntity,unitTeam) --[[Returns:handle
                  Creates a DOTA unit by its dota_npc_units.txt name ( szUnitName, vLocation, bFindClearSpace, hNPCOwner, hUnitOwner, iTeamNumber )
                  ]]

                else
                  print("IsValidPlayer(KillerEntity) = false")
                end



            if IsValidEntity(KilledUnit) then


            else
            end
        else
        end
    else
        print("ERROR: tangoRollChance has failed to register global variables: GLOBALED_VALLEY_CONSUMABLE_TANGO_CHANCE, ")
    end



    -- quest 1 sithill wolf kill tracking
    local killedUnitName = killedUnit:GetUnitName()

    if  killedUnitName == "npc_globaled_solo_easy_wolf" then

        local teamNumber = killerEntity:GetTeamNumber()
        local killerLocation = killerEntity:GetAbsOrigin()

      local heroes = HeroList:GetAllHeroes()
      for  _,hero in pairs(heroes) do 
        if hero:IsRealHero() then 

            if hero:HasModifier("modifier_tracking_quest_one_active_datadriven") then

                --print("[ GLOBALED - VALLEY ] killedUnitName == npc_globaled_solo_easy_wolf") 
                local modifierStackToAdjust = hero:FindModifierByName("modifier_tracking_quest_one_active_datadriven")
                local ModifierCaster = Entities:FindByName(nil, "questgiver_sithil")
                local initialStackCount = hero:GetModifierStackCount("modifier_tracking_quest_one_active_datadriven", ModifierCaster)

                if initialStackCount <1 or initialStackCount == nil then
                    if initialStackCount < GLOBALED_VALLEY_QUEST_ONE_WOLF_KILLS_REQUIRED then
                        hero:SetModifierStackCount("modifier_tracking_quest_one_active_datadriven", ModifierCaster, 1)
                    else
                    end
                else
                    if initialStackCount < GLOBALED_VALLEY_QUEST_ONE_WOLF_KILLS_REQUIRED then
                        hero:SetModifierStackCount("modifier_tracking_quest_one_active_datadriven", ModifierCaster, initialStackCount+1)
                    else
                    end
                end

                if initialStackCount == GLOBALED_VALLEY_QUEST_ONE_WOLF_KILLS_REQUIRED then
                  hero:RemoveModifierByName("modifier_tracking_quest_one_active_datadriven")
                else
                end

            else
                print("hero:HasModifier(modifier_tracking_quest_one_active_datadriven) failed")
            end

        end
      end
     --[[

        local questing_hero = FindUnitsInRadius(
                            teamNumber,
                            killerLocation, 
                            nil,
                            3000,
                            DOTA_UNIT_TARGET_TEAM_FRIENDLY,
                            DOTA_UNIT_TARGET_HERO,
                            DOTA_UNIT_TARGET_FLAG_NONE, 
                            FIND_CLOSEST, 
                            true)

     ]]   


    else
    end






  end



  if GetMapName() == "questtesting_a1" then

      -- Quest 1

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_easy_wolf")
          then

          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)
              GameRules:SendCustomMessage("Speak to Questgiver 2.", 0, 0)

              GLOBALED_SOLO_QUEST_ONE_COMPLETE = 1
              GLOBALED_SOLO_QUEST_TWO_AVAILABLE = 1
          end
      end



      -- Quest 2

      if  killedUnit and string.find(killedUnit:GetUnitName(), "npc_globaled_solo_easy_melee_creep")
          then
          
          -- Fill the quest bar and substract one from the quest remaining text
          GameRules.Quest.UnitsKilled = GameRules.Quest.UnitsKilled + 1
          GameRules.Quest:SetTextReplaceValue(QUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled)
          GameRules.subQuest:SetTextReplaceValue( SUBQUEST_TEXT_REPLACE_VALUE_CURRENT_VALUE, GameRules.Quest.UnitsKilled )



          -- Check if quest completed 
          if GameRules.Quest.UnitsKilled == GameRules.Quest.KillLimit then
              GameRules.Quest:CompleteQuest()
              GameRules:SendCustomMessage("Quest complete.", 0, 0)
              GameRules:SendCustomMessage("Speak to Questgiver 3.", 0, 0)

              GLOBALED_SOLO_QUEST_TWO_COMPLETE = 1
          end
      end






    else
  end






end



-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function GameMode:PlayerConnect(keys)
  DebugPrint('[BAREBONES] PlayerConnect')
  DebugPrintTable(keys)
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function GameMode:OnConnectFull(keys)
  DebugPrint('[BAREBONES] OnConnectFull')
  DebugPrintTable(keys)
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
end

-- This function is called whenever illusions are created and tells you which was/is the original entity
function GameMode:OnIllusionsCreated(keys)
  DebugPrint('[BAREBONES] OnIllusionsCreated')
  DebugPrintTable(keys)

  local originalEntity = EntIndexToHScript(keys.original_entindex)
end

-- This function is called whenever an item is combined to create a new item
function GameMode:OnItemCombined(keys)
  DebugPrint('[BAREBONES] OnItemCombined')
  DebugPrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end
  local player = PlayerResource:GetPlayer(plyID)

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
end

-- This function is called whenever an ability begins its PhaseStart phase (but before it is actually cast)
function GameMode:OnAbilityCastBegins(keys)
  DebugPrint('[BAREBONES] OnAbilityCastBegins')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local abilityName = keys.abilityname
end

-- This function is called whenever a tower is killed
function GameMode:OnTowerKill(keys)
  DebugPrint('[BAREBONES] OnTowerKill')
  DebugPrintTable(keys)

  local gold = keys.gold
  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local team = keys.teamnumber
end

-- This function is called whenever a player changes there custom team selection during Game Setup 
function GameMode:OnPlayerSelectedCustomTeam(keys)
  DebugPrint('[BAREBONES] OnPlayerSelectedCustomTeam')
  DebugPrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.player_id)
  local success = (keys.success == 1)
  local team = keys.team_id
end

-- This function is called whenever an NPC reaches its goal position/target
function GameMode:OnNPCGoalReached(keys)
  DebugPrint('[BAREBONES] OnNPCGoalReached')
  DebugPrintTable(keys)

  local goalEntity = EntIndexToHScript(keys.goal_entindex)
  local nextGoalEntity = EntIndexToHScript(keys.next_goal_entindex)
  local npc = EntIndexToHScript(keys.npc_entindex)
end

-- This function is called whenever any player sends a chat message to team or All
function GameMode:OnPlayerChat(keys)
  local teamonly = keys.teamonly
  local userID = keys.userid
  local playerID = self.vUserIds[userID]:GetPlayerID()

  local text = keys.text
end