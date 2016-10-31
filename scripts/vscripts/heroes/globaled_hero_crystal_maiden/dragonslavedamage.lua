function cmDragonSlaveDamage( keys )

	-- Variables
	local caster = keys.caster
	local target = keys.target

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = keys.ability

		if not target:IsMagicImmune() then

			-- kv
			local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
			local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
			local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
			local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
			local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
			local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
			local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)


			local ability_damage_type = ability:GetAbilityDamageType()

			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = ability_damage_type,
				damage = caster_base_damage * weapon_damage_multiplier,
			}
			 
			ApplyDamage(damageTable)
		else
		end


	else
	end

end




function cmDragonSlaveDamageCritical( keys )

	-- Variables
	local caster = keys.caster
	local target = keys.target

	if IsValidEntity(caster) and IsValidEntity(target) then

		local ability = keys.ability

		if not target:IsMagicImmune() then

			-- kv
			local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
			local caster_base_crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)

			local caster_base_damage_min = caster:GetBaseDamageMin() 																--print("[caster_base_damage_min] " .. caster_base_damage_min)
			local caster_base_damage_max = caster:GetBaseDamageMax()																--print("[caster_base_damage_max] " .. caster_base_damage_max)
			local caster_base_damage_combined_possibly_float = caster_base_damage_min + caster_base_damage_max						--print("[caster_base_damage_combined_possibly_float] " .. caster_base_damage_combined_possibly_float)
			local caster_base_damage_combined_possibly_float_average = caster_base_damage_combined_possibly_float/2					--print("[caster_base_damage_combined_possibly_float_average] " .. caster_base_damage_combined_possibly_float_average)		
			local caster_base_damage_combined_average_int = math.ceil(caster_base_damage_combined_possibly_float_average) 			--print("[caster_base_damage_combined_average_int] " .. caster_base_damage_combined_average_int)
			local caster_base_damage = caster_base_damage_combined_average_int 														--print("[caster_base_damage] " .. caster_base_damage)


			local caster_combined_damage_value = caster_base_damage * weapon_damage_multiplier

			local ability_damage_type = ability:GetAbilityDamageType()

			local damageTable = {
				victim = target,
				attacker = caster,
				damage_type = ability_damage_type,
				damage = caster_combined_damage_value * caster_base_crit_damage,
			}
			 
			ApplyDamage(damageTable)

			local damageToPrint = math.floor( caster_combined_damage_value * caster_base_crit_damage )
			
			if damageToPrint > 0 then
				PopupNumbers(target, "crit", Vector(255, 0, 0), 2.0, damageToPrint, nil, POPUP_SYMBOL_POST_LIGHTNING)	
			else
			end

		else
		end

	else
	end

end