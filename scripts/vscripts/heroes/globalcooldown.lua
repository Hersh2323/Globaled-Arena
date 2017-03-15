function activate_gcd_without_ability_specific(event)
	local caster = event.caster
	local gcd_ability = caster:FindAbilityByName("all_heroes_gcd_datadriven")

	if gcd_ability then

		gcd_ability:ApplyDataDrivenModifier(caster, caster, "modifier_gcd_activated_datadriven", {}) 
	else
		print("[GCD][ gcd_ability not found ]")
	end
end

function cancel_gcd(event)
	local caster = event.caster

	local gcd_modifier = caster:FindModifierByName("modifier_gcd_activated_datadriven")

	if gcd_modifier then
		local gcd_time_remaining = gcd_modifier:GetDuration()
		print("[GCD][ gcd_time_remaining: " .. gcd_time_remaining .. " ]")
	end
end

function activate_gcd(event)
	local ability = event.ability
	local caster = event.caster


	if caster:GetUnitName() == "npc_dota_hero_necrolyte" then

		local gcd_duration = ability:GetLevelSpecialValueFor("global_cooldown", ability:GetLevel() )

	    for abilitySlot=0,17 do
	        local zAbility = caster:GetAbilityByIndex(abilitySlot)

	        if zAbility then
	        	local zAbility_cooldown_time_remaining = zAbility:GetCooldownTimeRemaining()
	        	if zAbility_cooldown_time_remaining then
	        		if zAbility_cooldown_time_remaining < gcd_duration then
	        			zAbility:StartCooldown(gcd_duration)
	        		end
	        	end
	        end
	    end

	    for itemSlot=0,17 do
	        local yAbility = caster:GetItemInSlot(itemSlot)

	        if yAbility then
	        	local yAbility_cooldown_time_remaining = yAbility:GetCooldownTimeRemaining()
	        	if yAbility_cooldown_time_remaining then
	        		if yAbility_cooldown_time_remaining < gcd_duration then
	        			yAbility:StartCooldown(gcd_duration)
	        		end
	        	end
	        end
	    end

	else
		print("[GCD] activate_gcd did not detect npc_dota_hero_necrolyte as unit name")
	end


end

