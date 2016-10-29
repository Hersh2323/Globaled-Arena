LinkLuaModifier("modifier_gcd_active_lua", "heroes/modifier_gcd_active_lua.lua", LUA_MODIFIER_MOTION_NONE)


function globalCooldown (event)
	local caster = event.caster
--[[




	local heroName = caster:GetUnitName()

	if heroName == "npc_dota_hero_lina" then

		for abilitySlot=0,5 do
			local ability = caster:GetAbilityByIndex(abilitySlot)

			if ability then
				if IsValidEntity(caster) then


					local abilityCooldown = ability:GetCooldownTimeRemaining()
					if abilityCooldown <= GLOBALED_GLOBAL_COOLDOWN then

						if ability:GetAbilityName() == "lina_fireball" then


						else
							ability:StartCooldown(GLOBALED_GLOBAL_COOLDOWN)

						end

					else
					end

				else
				end
			end
		end



	    for itemSlot=0,5 do
	        local item = caster:GetItemInSlot(itemSlot)

	        if item then
				if IsValidEntity(caster) then

					local abilityCooldown = item:GetCooldownTimeRemaining()
					if abilityCooldown <= GLOBALED_GLOBAL_COOLDOWN then

						item:StartCooldown(GLOBALED_GLOBAL_COOLDOWN)
					else
					end

				else
				end
	        end
	    end

	else
	end




]]







end
