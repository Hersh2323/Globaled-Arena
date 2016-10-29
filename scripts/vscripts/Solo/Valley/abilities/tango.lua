
function activateTango (event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local healPercent = ability:GetLevelSpecialValueFor("tango_heal_percent_max_hp", 0)
	local casterMaxHealth = target:GetMaxHealth()

	local healValue = casterMaxHealth*healPercent

	if caster:HasModifier("modifier_valley_tango_heal_effect_datadriven") then

		target:Heal( healValue, target)
		local healToPrint = math.floor( healValue )
		if healToPrint > 0 then
			PopupNumbers(target, "heal", Vector(0, 255, 0), 2.0, healToPrint, POPUP_SYMBOL_PRE_PLUS, nil)
		else
		end

		target:EmitSound("DOTA_Item.Tango.Activate") --[[Returns:void
		 
		]]


		caster:RemoveModifierByName("modifier_valley_tango_heal_effect_datadriven")

		if IsValidEntity(caster) then

			-- move to garbage removal area
			local removal_location_npc = Entities:FindByName(nil, "info_target_entity_garbage_disposal")
			if removal_location_npc then

				local location = removal_location_npc:GetAbsOrigin()
				FindClearSpaceForUnit(caster, location, false)	
				caster:ForceKill(true)

			else
			end
		else
		end
	else
	end


end