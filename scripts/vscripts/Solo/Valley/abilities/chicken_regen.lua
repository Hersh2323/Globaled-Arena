function chickenRegen (event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	if target:HasModifier("modifier_combat_datadriven") then
	else
		local totalHealth = target:GetMaxHealth()
		local healPercentage = GLOBALED_VALLEY_CHICKEN_REGEN_HEAL_PERCENTAGE -- this is float
		local healValue = totalHealth*GLOBALED_VALLEY_CHICKEN_REGEN_HEAL_PERCENTAGE
		
		target:Heal(healValue, target)
	end
end