function purifyingHeal( event )

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability
	local healPercent = ability:GetLevelSpecialValueFor("health_percent", 0)
	local casterMaxHealth = caster:GetMaxHealth()

	local healTotal = casterMaxHealth * healPercent
		target:Heal( healTotal, caster)
end


function purifyingHealCritical( event )

	-- Variables
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local healPercent = ability:GetLevelSpecialValueFor("health_percent", 0)
	local weapon_damage_multiplier = ability:GetLevelSpecialValueFor("weapon_damage", 0)
	local crit_damage = ability:GetLevelSpecialValueFor("crit_damage", 0)

	local casterMaxHealth = caster:GetMaxHealth()
	local heal = casterMaxHealth * healPercent
	local healTotalAfterCrit = heal * crit_damage

	target:Heal( healTotalAfterCrit, caster)

	local healToPrint = math.floor( heal * crit_damage )
	if healToPrint > 0 then	
		PopupNumbers(target, "heal", Vector(0, 255, 0), 2.0, healToPrint, POPUP_SYMBOL_PRE_PLUS, nil)
	else
	end
end