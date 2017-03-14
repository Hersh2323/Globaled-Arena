
function globalCooldown ()

end

function activate_gcd(event)
	local ability = event.ability
	local caster = event.caster


	if caster:GetUnitName() == "npc_dota_hero_necrolyte" then
		local ability_1 = caster:GetAbilityByIndex(1)			if ability_1 then print("[GCD][" .. ability_1:GetAbilityName() .. "] Ability_1 not nil") end

		local ability_2 = caster:GetAbilityByIndex(2)			if ability_2 then print("[GCD][" .. ability_2:GetAbilityName() .. "] Ability_2 not nil") end

		local ability_3 = caster:GetAbilityByIndex(3)			if ability_3 then print("[GCD][" .. ability_3:GetAbilityName() .. "] Ability_3 not nil") end

		local ability_4 = caster:GetAbilityByIndex(4)			if ability_4 then print("[GCD][" .. ability_4:GetAbilityName() .. "] Ability_4 not nil") end

		local ability_5 = caster:GetAbilityByIndex(5)			if ability_5 then print("[GCD][" .. ability_5:GetAbilityName() .. "] Ability_5 not nil") end

		local ability_6 = caster:GetAbilityByIndex(6)			if ability_6 then print("[GCD][" .. ability_6:GetAbilityName() .. "] Ability_6 not nil") end

		--local ability_7 = caster:(6)			if ability_7 then print("[GCD][" .. ability_7:GetAbilityName() .. "] Ability_7 not nil") end




	else
		print("[GCD] activate_gcd did not detect npc_dota_hero_necrolyte as unit name")
	end


end