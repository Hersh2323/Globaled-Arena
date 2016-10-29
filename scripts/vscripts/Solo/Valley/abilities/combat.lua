function combatAdjustmentForMelee (event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local duration = ability:GetLevelSpecialValueFor("combat_duration", 0)
	local durationMelee = ability:GetLevelSpecialValueFor("combat_duration_melee", 0)


	if target:IsRangedAttacker() then
	else
		target:FindModifierByName("modifier_combat_datadriven"):SetDuration(durationMelee, true)
	end
end