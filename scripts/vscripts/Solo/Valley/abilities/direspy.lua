function suicideDamage (keys)

	local caster = keys.caster
	local target = keys.target

	local targetTotalHP = target:GetHealth()
	local targetTotalHPDeficit = target:GetHealthDeficit()
	local targetCurrentHP = targetTotalHP - targetTotalHPDeficit
	local damageToDeal = targetCurrentHP * 0.9

	local damageTable = {
							victim = target,
							attacker = caster,
							damage_type = DAMAGE_TYPE_MAGICAL,
							damage = damageToDeal
						}

	ApplyDamage(damageTable)
end