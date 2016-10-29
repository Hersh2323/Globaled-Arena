function spawnLocation (event)
	local ability = event.ability
	local target = event.caster

	local loc = target:GetOrigin()

	target.spawnLocationAI = nil
	target.spawnLocationAI = loc


	if target.spawnLocationAI == nil then
	else
    	--print("[ GLOBALED - VALLEY ] target.spawnLocationAI is not nil") 
	end
end

function wanderAI (event)
	local ability = event.ability
	local target = event.caster


	local origin = target:GetAbsOrigin()


	local current_distance_from_spawn = target.spawnLocationAI - origin
	local printDiff = current_distance_from_spawn:Length2D()


	if printDiff > GLOBALED_VALLEY_NPC_LEASH_RANGE then
		--target:MoveToPosition(target.spawnLocationAI)
	else
	end

	if target:HasModifier("modifier_combat_datadriven") then
	else
		local rollChance = math.random(100)
		--print("[ VALLEY ] [wanderAI(event)]  rollChance is: " .. rollChance)

		if GameRules:IsDaytime() then
			local delay_min_roll = ability:GetLevelSpecialValueFor("delay_min_roll", 0)
			local delay_max_roll = ability:GetLevelSpecialValueFor("delay_max_roll", 0)

			local delayRoll = math.random( delay_min_roll, delay_max_roll )
			--print("[ VALLEY ] [wanderAI(event)]  delayRoll is: " .. delayRoll)

			Timers:CreateTimer(delayRoll, -- Start this timer x game-time seconds later
			function()
					if IsValidEntity(target) then
						if target:HasModifier("modifier_combat_datadriven") then
						else

--[[
							if rollChance >= 50 then
								ability:ApplyDataDrivenModifier(target, target, "modifier_ai_think_rotate_datadriven", {})
							else
								ability:ApplyDataDrivenModifier(target, target, "modifier_ai_think_counter_rotate_datadriven", {})
							end
]]

						end
					else
					end
				return
			end)
		else
			ability:ApplyDataDrivenModifier(target, target, "modifier_ai_sleep_buff_datadriven", {})
		end
	end



end


function wanderTo (event)
--[[
		-- var
		local ability = event.ability
		local target = event.caster

		if target:IsAttacking() then
		else
			-- modifiers

		    -- make this ability passive
		    --ability:SetIdleAcquire(false)

			-- print("[ GLOBALED VALLEY ] - AI THINK WANDERING TO LOCATION")
		    
		    local wanderBoundsXMin = -GLOBALED_VALLEY_NPC_WANDER_DISTANCE
		    local wanderBoundsXMax = GLOBALED_VALLEY_NPC_WANDER_DISTANCE
		    local wanderBoundsYMin = -GLOBALED_VALLEY_NPC_WANDER_DISTANCE_VERTICAL
		    local wanderBoundsYMax = GLOBALED_VALLEY_NPC_WANDER_DISTANCE

			-- Generate random coordinates to wander to
			local x = math.random(wanderBoundsXMin, wanderBoundsXMax)
			local y = math.random(wanderBoundsYMin, wanderBoundsYMax)
			local z = GetGroundHeight(Vector(x, y, 128), nil)

			print("wandering to x: " .. x .. " y: " .. y)

			--DeepPrintTable(ability.spawnLocation)

			-- Issue the movement order to the ability
			target:MoveToPosition(Vector (target.spawnLocation + Vector(x, y, z, 0)) )
		end
]]

end

function globalWander(event)

  Timers:CreateTimer(0, -- Start this timer x game-time seconds later
    function()
      	print("[ GLOBALED - VALLEY ] Chosen npcs now attempting to wander every: " .. GLOBALED_VALLEY_NPC_WANDER_CHECK_INTERVAL) 

	    local wanderBoundsXMin = -GLOBALED_VALLEY_NPC_WANDER_DISTANCE
	    local wanderBoundsXMax = GLOBALED_VALLEY_NPC_WANDER_DISTANCE
	    local wanderBoundsYMin = -GLOBALED_VALLEY_NPC_WANDER_DISTANCE_VERTICAL
	    local wanderBoundsYMax = GLOBALED_VALLEY_NPC_WANDER_DISTANCE

--[[
      	if testNpc1 == nil then
      	else
      		if testNpc1:HasModifier("modifier_combat_datadriven") then
      		else
				local testNpc1SpawnEntity = Entities:FindByName(nil, "spawnLocationTest")
				local wanderOrigin = testNpc1SpawnEntity:GetAbsOrigin()

				-- Generate random coordinates to wander to
				local x = math.random(wanderBoundsXMin, wanderBoundsXMax)
				local y = math.random(wanderBoundsYMin, wanderBoundsYMax)
				local z = GetGroundHeight(Vector(x, y, 128), nil)

				print("wandering to x: " .. x .. " y: " .. y)
				-- Issue the movement order to the ability
				local vectorN = (wanderOrigin + Vector(x, y, z, 0))
				testNpc1:MoveToPosition(vectorN)
      		end
      	end

      return GLOBALED_VALLEY_NPC_WANDER_CHECK_INTERVAL
]]
    end)
end