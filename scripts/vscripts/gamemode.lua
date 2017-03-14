-- This is the primary barebones gamemode script and should be used to assist in initializing your game mode
BAREBONES_VERSION = "1.00"

-- Set this to true if you want to see a complete debug output of all events/processes done by barebones
-- You can also change the cvar 'barebones_spew' at any time to 1 or 0 for output/no output
BAREBONES_DEBUG_SPEW = false 

if GameMode == nil then
    DebugPrint( '[BAREBONES] creating barebones game mode' )
    _G.GameMode = class({})
end

-- This library allow for easily delayed/timed actions
require('libraries/timers')
-- This library can be used for advancted physics/motion/collision of units.  See PhysicsReadme.txt for more information.
require('libraries/physics')
-- This library can be used for advanced 3D projectile systems.
require('libraries/projectiles')
-- This library can be used for sending panorama notifications to the UIs of players/teams/everyone
require('libraries/notifications')
-- This library can be used for starting customized animations on units from lua
require('libraries/animations')
-- This library can be used for performing "Frankenstein" attachments on units
require('libraries/attachments')
-- This library can be used to synchronize client-server data via player/client-specific nettables
require('libraries/playertables')
-- This library can be used to create container inventories or container shops
require('libraries/containers')
-- This library provides a searchable, automatically updating lua API in the tools-mode via "modmaker_api" console command
require('libraries/modmaker')
-- This library provides an automatic graph construction of path_corner entities within the map
require('libraries/pathgraph')
-- This library (by Noya) provides player selection inspection and management from server lua
require('libraries/selection')

-- These internal libraries set up barebones's events and processes.  Feel free to inspect them/change them if you need to.
require('internal/gamemode')
require('internal/events')

-- settings.lua is where you can specify many different properties for your game mode and is one of the core barebones files.
require('settings')
-- events.lua is where you can specify the actions to be taken when any event occurs and is one of the core barebones files.
require('events')

-- events.lua is where you can specify the actions to be taken when any event occurs and is one of the core barebones files.
require('heroes/animations')



-- This is a detailed example of many of the containers.lua possibilities, but only activates if you use the provided "playground" map
if GetMapName() == "valley_a1" then
  require("solo/valley/settings")
end

--require("examples/worldpanelsExample")

--[[
  This function should be used to set up Async precache calls at the beginning of the gameplay.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will 
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability# 
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).

  This function should generally only be used if the Precache() function in addon_game_mode.lua is not working.
]]
function GameMode:PostLoadPrecache()
  DebugPrint("[BAREBONES] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

  --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
  --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
end

--[[
  This function is called once and only once as soon as the first player (almost certain to be the server in local lobbies) loads in.
  It can be used to initialize state that isn't initializeable in InitGameMode() but needs to be done before everyone loads in.
]]
function GameMode:OnFirstPlayerLoaded()
  DebugPrint("[BAREBONES] First Player has loaded")
end

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function GameMode:OnAllPlayersLoaded()
  DebugPrint("[BAREBONES] All Players have loaded into the game")
end

--[[
  This function is called once and only once for every player when they spawn into the game for the first time.  It is also called
  if the player's hero is replaced with a new hero for any reason.  This function is useful for initializing heroes, such as adding
  levels, changing the starting gold, removing/adding abilities, adding physics, etc.

  The hero parameter is the hero entity that just spawned in
]]
function GameMode:OnHeroInGame(hero)
  DebugPrint("[BAREBONES] Hero spawned in game for first time -- " .. hero:GetUnitName())

  -- This line for example will set the starting gold of every hero to 500 unreliable gold
  --hero:SetGold(500, false)

  -- These lines will create an item and add it to the player, effectively ensuring they start with the item

  --[[ --These lines if uncommented will replace the W ability of any hero that loads into the game
    --with the "example_ability" ability

  local abil = hero:GetAbilityByIndex(1)
  hero:RemoveAbility(abil:GetAbilityName())
  hero:AddAbility("example_ability")]]


  -- This line for example will set the starting gold of every hero to 500 unreliable gold
  hero:SetGold(0, false)


  if GetMapName() == "arena_a3" then


    if IsServer() then

      local heroCheckTeam = hero:GetTeam()
      print("[GLOBALED] Printing to console current heroCheckTeam variable: "..heroCheckTeam)   

      if heroCheckTeam == 2 then
        -- 2 = radiant

        GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT = GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT+1
        print("[GLOBALED] GameMode:OnHeroInGame: Printing to console current GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT variable: "..GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT)

        GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT = GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT+1
        print("[GLOBALED] GameMode:OnHeroInGame: Printing to console current GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT variable: "..GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT)

        GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_DIRE = GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT
        print("[GLOBALED] GameMode:OnHeroInGame: Printing to console current GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_DIRE variable: "..GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_DIRE)   


      elseif heroCheckTeam == 3 then
        -- 3 = dire  

        GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE = GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE+1
        print("[GLOBALED] GameMode:OnHeroInGame: Printing to console current GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE variable: "..GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE)   

        GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE = GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE+1
        print("[GLOBALED] GameMode:OnHeroInGame: Printing to console current GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE variable: "..GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE)

        GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_RADIANT = GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE
        print("[GLOBALED] GameMode:OnHeroInGame: Printing to console current GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_RADIANT variable: "..GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_RADIANT)   

      else
      end

    else
    end

  else
  end





  if GetMapName() == "12v12a1" or "arena_a3" or "valley_a1" then

      local hero_name = hero:GetUnitName()
      print("[GLOBALED] Printing to console current hero_name variable: "..hero_name)

      if hero_name == "npc_dota_hero_crystal_maiden" then



            local item = CreateItem("item_frc_ice_shield", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_frc_icecube", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_frc_rn", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_frc_fast_strike", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_cm_sheep_disorient", hero, hero)
            hero:AddItem(item)



          elseif hero_name == "npc_dota_hero_bounty_hunter" then 

            local item = CreateItem("item_bh_disp", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_sma_dash", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_bh_fan", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_bh_amp_damage", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_sma_dodge", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_drow_ranger" then 

            local item = CreateItem("item_drow_fire_trap", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_drow_flare", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_drow_slowtrap", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_drow_disorient", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_enchantress" then 

            local item = CreateItem("item_treant_aoe_heal", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_healer_mana_potion", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_treant_dubious_mushroom", hero, hero)
            hero:AddItem(item)
            --local item = CreateItem("item_treant_dispel_stealth", hero, hero)
            --hero:AddItem(item)
            local item = CreateItem("item_enchantress_cyclone", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_necrolyte" then 

            local item = CreateItem("item_necrolyte_curse_dmg_attack_reduction", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_necrolyte_blink", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_necrolyte_raze", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_necrolyte_curse_slow", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_necrolyte_horrify_horrify", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_omniknight" then 

            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_omniknight_prevent_slow", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_omniknight_radiance", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_omniknight_inv_shield", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_omniknight_prevent_physical_harm", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_phantom_assassin" then 

            local item = CreateItem("item_sma_disp", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_sma_dash", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_pa_backupplan", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_sma_dodge", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_storm_spirit" then

            local item = CreateItem("item_storm_spirit_pain", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_storm_spirit_mana_drain", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_storm_spirit_turn_foe", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_storm_spirit_mana_gnoll", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)

          elseif hero_name == "npc_dota_hero_undying" then

            local item = CreateItem("item_undying_decaying_circle", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_undying_armor", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_undying_fiends_grasp", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_undying_reanimate_soul", hero, hero)
            hero:AddItem(item)


          elseif hero_name == "npc_dota_hero_lina" then
            local item = CreateItem("item_frc_icecube", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_cm_sheep_disorient", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_lina_root_nova", hero, hero)
            hero:AddItem(item)
            local item = CreateItem("item_lina_blast", hero, hero)
            hero:AddItem(item)



      end     
  else
  end
















  if GetMapName() == "12v12a1" then

    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
 
 
    for abilitySlot=0,17 do
        local ability = hero:GetAbilityByIndex(abilitySlot)

        if ability then
            ability:SetLevel(1)
            hero:SetAbilityPoints(hero:GetAbilityPoints() - 1)
        end
    end

    elseif  GetMapName() == "arena_a3" or "testzone" then

    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
    hero:HeroLevelUp(false)
   




    for abilitySlot=0,17 do
        local ability = hero:GetAbilityByIndex(abilitySlot)

        if ability then
                        ability:SetLevel(1)
                        hero:SetAbilityPoints(hero:GetAbilityPoints() - 1)
        end
    end


    else
  end 
 


  if GetMapName() == "valley_a1" then

    local determineHeroForDpsScaling = hero:GetUnitName()


      -- Variables are passed for use in solo/valley/npc_health_scaling.lua
      if determineHeroForDpsScaling == "npc_dota_hero_crystal_maiden" then
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 330.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_CRYSTAL_MAIDEN_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.: GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_bounty_hunter" then 
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 200.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_BOUNTY_HUNTER_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT    --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_drow_ranger" then 
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 225.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_DROW_RANGER_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT      --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_enchantress" then 
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 25.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_ENCHANTRESS_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT      --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_necrolyte" then 
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 135.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_NECROLYTE_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT        --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_omniknight" then 
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 250.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_OMNIKNIGHT_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT       --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_phantom_assassin" then
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 175.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_PHANTOM_ASSASSIN_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_storm_spirit" then
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 25.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_STORM_SPIRIT_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT     --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 

          elseif determineHeroForDpsScaling == "npc_dota_hero_undying" then
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 255.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_UNDYING_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT          --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 
 
          elseif determineHeroForDpsScaling == "npc_dota_hero_lina" then
              GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = 135.0
              GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = GLOBALED_VALLEY_NPC_DOTA_HERO_LINA_EXPECTED_MELEE_ENEMY_UPTIME_IN_FLOAT          --[[]]  print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] - Expected melee npc uptime on hero picked for use in npc_health_scaling.:GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE = " .. GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE) 


      end     




  end




end

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function GameMode:OnGameInProgress()
  DebugPrint("[BAREBONES] The game has officially begun")

  Timers:CreateTimer(30, -- Start this timer 30 game-time seconds later
    function()
      DebugPrint("This function is called 30 seconds after the game begins, and every 30 seconds thereafter")
      return 30.0 -- Rerun this timer every 30 game-time seconds 
    end)


 
  GameRules:SendCustomMessage("Welcome to Globaled Arena Alpha.", 0, 0)
  GameRules:SendCustomMessage("Looking to try out Globaled Arena? Hersh is looking for alpha testers to test and assess gameplay quality.", 0, 0)


  Timers:CreateTimer(30, -- Start this timer 30 game-time seconds later
    function()
      print("[GLOBALED] This prints every 30s. Base barebones example of timer")      

      return 30.0 -- Rerun this timer every 30 game-time seconds
    end)


  if GetMapName() == "valley_a1" then
      Timers:CreateTimer(0, -- Start this timer x game-time seconds later
      function()
        print("[ GLOBALED - VALLEY ] Searching for nil npcs every: " .. GLOBALED_VALLEY_NPC_SPAWN_CHECK_INTERVAL)      


        spawnTestNpc()
        spawnEasyWolf1()
        spawnEasyWolf2()
        spawnEasyWolf3()
        spawnEasyWolf4()
        spawnEasyWolf5()
        spawnEasyWolf6()
        spawnEasyWolf7()
        spawnEasyWolf8()
        spawnEasyWolf9()
        spawnEasyWolf10()
        spawnEasyWolf11()

        spawnEasyMeleeCreep1()
        spawnEasyRangedCreep1()
        spawnEasyMeleeCreep2()
        spawnEasyRangedCreep2()
        spawnEasyMeleeCreep3()
        spawnEasyRangedCreep3()
        spawnEasyMeleeCreep4()
        spawnEasyRangedCreep4()
        spawnEasyMeleeCreep5()
        spawnEasyRangedCreep5()
        spawnEasyMeleeCreep6()
        spawnEasyRangedCreep6()
        spawnEasyMeleeCreep7()
        spawnEasyRangedCreep7()
        spawnEasyMeleeCreep8()
        spawnEasyRangedCreep8()
        spawnEasyMeleeCreep9()
        spawnEasyRangedCreep9()
        spawnEasyMeleeCreep10()
        spawnEasyRangedCreep10()
        spawnEasyMeleeCreep11()
        spawnEasyRangedCreep11()
        spawnEasyMeleeCreep12()
        spawnEasyRangedCreep12()

        return GLOBALED_VALLEY_NPC_SPAWN_CHECK_INTERVAL -- Rerun this timer every GLOBALED_VALLEY_NPC_SPAWN_INTERVAL game-time seconds
      end)

      --globalWander()


      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "butcherSpawnLocation")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
          end
      end
      
      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "questgiver_sithil")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
          end
      end


      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "townChicken")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
          end
      end


      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "townChicken2")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
          end
      end

      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "questgiver_quirt")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
          end
      end


      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "quest_two_item_shield")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
              StartAnimation(abilityLevelUpTarget, {duration=10800, activity=ACT_DOTA_IDLE, rate=1.0})


          end
      end


      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "quest_two_item_blade")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
              StartAnimation(abilityLevelUpTarget, {duration=10800, activity=ACT_DOTA_IDLE, rate=1.0})

          end
      end


      -- skill abilities of npcs here
      local abilityLevelUpTarget = Entities:FindByName(nil, "quest_two_item_boots")

      for abilitySlot=0,5 do
          local ability = abilityLevelUpTarget:GetAbilityByIndex(abilitySlot)

          if ability then
              ability:SetLevel(1)
              StartAnimation(abilityLevelUpTarget, {duration=10800, activity=ACT_DOTA_IDLE, rate=1.0})


          end
      end


  else
  end



  if GetMapName() == "testzone"   then

  Timers:CreateTimer(0, -- Start this timer 30 game-time seconds later
    function()
      print("[GLOBALED TEST MAP] This prints every 30s to print time taken to kill each test npc.")

      print("[GLOBALED TEST MAP] Test NPC one fight data")
      print("[GLOBALED] Printing npcOneCombatStartTime variable: ".. npcOneCombatStartTime)
      print("[GLOBALED] Printing npcOneDeathTime variable: ".. npcOneDeathTime)

      local elapsedTimeToKillNpcOne = npcOneDeathTime - npcOneCombatStartTime
      print("[GLOBALED] Printing elapsedTimeToKillNpcOne variable: ".. elapsedTimeToKillNpcOne)


      return 30.0 -- Rerun this timer every 30 game-time seconds
    end)




  else
  end

















  if GetMapName() == "arena_a3" then



  Timers:CreateTimer(8, -- Start this timer 5 game-time seconds later
    function()
      print("[GLOBALED] This prints every 8s. Checking to see if one team has no alive heroes.")      


      if GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT == 0 and GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT >= 1 then

        GLOBALED_GAMEMODE_ROUNDS_WON_DIRE = GLOBALED_GAMEMODE_ROUNDS_WON_DIRE+1
        print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current GLOBALED_GAMEMODE_ROUNDS_WON_DIRE variable: "..GLOBALED_GAMEMODE_ROUNDS_WON_DIRE)
        --ShowMessage('[GLOBALED] Dire Round wins:' .. GLOBALED_GAMEMODE_ROUNDS_WON_DIRE)

        GameRules:GetGameModeEntity():SetTopBarTeamValue(3, GLOBALED_GAMEMODE_ROUNDS_WON_DIRE)

        Notifications:TopToAll({text="Round victory for the Dire!", duration=5.0})

        globaled_respawn_heroes()

      elseif GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE == 0 and GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE >= 1 then

        GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT = GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT+1
        print("[GLOBALED] GameMode:OnEntityKilled: Printing to console current GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT variable: "..GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT)
        --ShowMessage('[GLOBALED] Dire Round wins:' .. GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT)

        --UTIL_MessageTextAll('[GLOBALED] Radiant Round wins:' .. GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT, 255, 255, 255, 255)

        GameRules:GetGameModeEntity():SetTopBarTeamValue(2, GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT)

        Notifications:TopToAll({text="Round victory for the Radiant!", duration=5.0})

        globaled_respawn_heroes()

      else
      end

      -- overall
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_ROUNDS:" .. GLOBALED_GAMEMODE_ROUNDS)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_ROUNDS_TO_WIN:" .. GLOBALED_GAMEMODE_ROUNDS_TO_WIN)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT:" .. GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_ROUNDS_WON_DIRE:" .. GLOBALED_GAMEMODE_ROUNDS_WON_DIRE)

      -- radiant
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_RADIANT:" .. GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_RADIANT)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_RADIANT_KILLS:" .. GLOBALED_GAMEMODE_RADIANT_KILLS)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT:" .. GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT:" .. GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT)

      -- dire
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_DIRE:" .. GLOBALED_GAMEMODE_KILLS_TO_WIN_ROUND_DIRE)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_DIRE_KILLS:" .. GLOBALED_GAMEMODE_DIRE_KILLS)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE:" .. GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE)
      print("[GLOBALED] GAME STATUS: Printing to console current  variable: GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE:" .. GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE)



      if GLOBALED_GAMEMODE_ROUNDS_WON_DIRE == GLOBALED_GAMEMODE_ROUNDS_TO_WIN then

        GameRules:SetGameWinner( DOTA_TEAM_BADGUYS )
        GameRules:SetSafeToLeave( true )

      elseif GLOBALED_GAMEMODE_ROUNDS_WON_RADIANT == GLOBALED_GAMEMODE_ROUNDS_TO_WIN then

        GameRules:SetGameWinner( DOTA_TEAM_GOODGUYS )
        GameRules:SetSafeToLeave( true )

      end



      return 8.0 -- Rerun this timer every 5 game-time seconds
    end)    


  else
  end



  if GetMapName() == "12v12a1" then

    

  else
  end




  if GetMapName() == "testzone" then

    spawnTestNpcOne()
    spawnTestNpcTwo()
    spawnTestNpcThree()
    spawnTestNpcFour()
    spawnTestNpcFive()

  else
  end














end


function globaled_respawn_heroes( event )
  local heroes = HeroList:GetAllHeroes()
  for  _,hero in pairs(heroes) do 
    if hero:IsRealHero() then 

      hero:Purge( true, true, false, true, false)
      hero:SetRespawnsDisabled(false)
      hero:RespawnHero(true, false, false)
      hero:RemoveModifierByName("modifier_invisible")
    end
  end

  GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_DIRE = GLOBALED_GAMEMODE_TOTAL_HEROES_DIRE
  GLOBALED_GAMEMODE_TOTAL_HEROES_ALIVE_RADIANT = GLOBALED_GAMEMODE_TOTAL_HEROES_RADIANT

end 



-- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function GameMode:InitGameMode()
  GameMode = self
  DebugPrint('[BAREBONES] Starting to load Barebones gamemode...')

  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", FCVAR_CHEAT )

  DebugPrint('[BAREBONES] Done loading Barebones gamemode!\n\n')
end

-- This is an example console command
function GameMode:ExampleConsoleCommand()
  print( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

  print( '*********************************************' )
end