function scaleHealthBasedOnPickedHero(event)
	local ability = event.ability
	local caster = event.caster



	if GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER == nil then

	else
      	print("[ GLOBALED - VALLEY ] GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER has passed not nil: GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER = " .. GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER) 


		if caster:HasModifier("modifier_health_scaling_calc_datadriven") then

			local hero_dps_variable = GLOBALED_VALLEY_DPS_SCALING_MULTIPLIER -- float
      		print("[ GLOBALED - VALLEY ] hero_dps_variable = " .. hero_dps_variable) 

			local unit_name = caster:GetUnitName()
      		--print("[ GLOBALED - VALLEY ] unit_name = " .. unit_name) 

			if unit_name == "npc_globaled_solo_easy_wolf" then

				--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH AND DAMAGE SCALING ] Adjusting " .. unit_name .. "'s health and damage depending on hero picked." ) 

				local seconds_to_kill = GLOBALED_VALLEY_NPC_SOLO_EASY_WOLF_SECONDS_TO_KILL 		--[[]] 	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " seconds_to_kill = " .. seconds_to_kill) 
				local calc_health_total = hero_dps_variable*seconds_to_kill						--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " calc_health_total = " .. calc_health_total) 
				local calc_health_total_to_int = math.floor(calc_health_total)      			--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " calc_health_total_to_int = " .. calc_health_total_to_int) 


				local unit_outgoing_dps = GLOBALED_VALLEY_NPC_SOLO_EASY_WOLF_DPS 				--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ]" .. unit_name .. " unit_outgoing_dps = " .. unit_outgoing_dps) 
				local unit_base_attack_time = caster:GetBaseAttackTime()						
				local determined_base_damage = unit_outgoing_dps*unit_base_attack_time			
				local determined_base_damage_to_int = math.floor(determined_base_damage)		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ]" .. unit_name .. "'s base damage before range adjustments = (dps:)" .. unit_outgoing_dps .. "*(bat:)" .. unit_base_attack_time .. " = " .. determined_base_damage_to_int)
		

				local picked_hero_expected_melee_enemy_uptime_percentage_in_float = GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] npc_health_scaling: global variable GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE passed to local picked_hero_expected_melee_enemy_uptime_percentage_in_float: " .. picked_hero_expected_melee_enemy_uptime_percentage_in_float)
				local ranged_uptime_tuning_percentage = GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT 							--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] npc_health_scaling: global variable GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT passed to local ranged_uptime_tuning_percentage : " .. GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT)
				
				if picked_hero_expected_melee_enemy_uptime_percentage_in_float < 1.0 then
					local uptime_to_damage_increase_multiplier_float_negative = 1 - ranged_uptime_tuning_percentage 		print(uptime_to_damage_increase_multiplier_float_negative)
					local uptime_to_damage_increase_multiplier_float = uptime_to_damage_increase_multiplier_float_negative*uptime_to_damage_increase_multiplier_float_negative 			--[[]]		print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] uptime_to_damage_increase_multiplier_float = " .. uptime_to_damage_increase_multiplier_float)
					local bonus_base_damage_multiplier = uptime_to_damage_increase_multiplier_float*ranged_uptime_tuning_percentage 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] bonus_base_damage_multiplier = " .. bonus_base_damage_multiplier )	
					local additional_base_damage_value = math.floor(determined_base_damage_to_int*bonus_base_damage_multiplier) 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] additional_base_damage_value = " .. additional_base_damage_value )	

					local combined_base_damage = determined_base_damage+additional_base_damage_value --[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] combined_base_damage = " .. combined_base_damage )	

					caster:SetBaseDamageMax(combined_base_damage)
					caster:SetBaseDamageMin(combined_base_damage)
				else
					caster:SetBaseDamageMax(determined_base_damage)
					caster:SetBaseDamageMin(determined_base_damage)
				end
 

				--GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT
				caster:SetBaseMaxHealth(calc_health_total_to_int)

				caster:RemoveModifierByName("modifier_health_scaling_calc_datadriven")


				--caster:Heal(calc_health_total_to_int, caster)

			else
			end

			if unit_name == "npc_globaled_solo_easy_melee_creep" then

				--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH AND DAMAGE SCALING ] Adjusting " .. unit_name .. "'s health and damage depending on hero picked." ) 

				local seconds_to_kill = GLOBALED_VALLEY_NPC_SOLO_MELEE_CREEP_SECONDS_TO_KILL 		--[[]] 	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " seconds_to_kill = " .. seconds_to_kill) 
				local calc_health_total = hero_dps_variable*seconds_to_kill						--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " calc_health_total = " .. calc_health_total) 
				local calc_health_total_to_int = math.floor(calc_health_total)      			--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " calc_health_total_to_int = " .. calc_health_total_to_int) 


				local unit_outgoing_dps = GLOBALED_VALLEY_NPC_SOLO_MELEE_CREEP_DPS 				--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ]" .. unit_name .. " unit_outgoing_dps = " .. unit_outgoing_dps) 
				local unit_base_attack_time = caster:GetBaseAttackTime()						
				local determined_base_damage = unit_outgoing_dps*unit_base_attack_time			
				local determined_base_damage_to_int = math.floor(determined_base_damage)		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ]" .. unit_name .. "'s base damage before range adjustments = (dps:)" .. unit_outgoing_dps .. "*(bat:)" .. unit_base_attack_time .. " = " .. determined_base_damage_to_int)
		

				local picked_hero_expected_melee_enemy_uptime_percentage_in_float = GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] npc_health_scaling: global variable GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE passed to local picked_hero_expected_melee_enemy_uptime_percentage_in_float: " .. picked_hero_expected_melee_enemy_uptime_percentage_in_float)
				local ranged_uptime_tuning_percentage = GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT 							--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] npc_health_scaling: global variable GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT passed to local ranged_uptime_tuning_percentage : " .. GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT)
				
				if picked_hero_expected_melee_enemy_uptime_percentage_in_float < 1.0 then
					local uptime_to_damage_increase_multiplier_float_negative = 1 - ranged_uptime_tuning_percentage 		print(uptime_to_damage_increase_multiplier_float_negative)
					local uptime_to_damage_increase_multiplier_float = uptime_to_damage_increase_multiplier_float_negative*uptime_to_damage_increase_multiplier_float_negative 			--[[]]		print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] uptime_to_damage_increase_multiplier_float = " .. uptime_to_damage_increase_multiplier_float)
					local bonus_base_damage_multiplier = uptime_to_damage_increase_multiplier_float*ranged_uptime_tuning_percentage 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] bonus_base_damage_multiplier = " .. bonus_base_damage_multiplier )	
					local additional_base_damage_value = math.floor(determined_base_damage_to_int*bonus_base_damage_multiplier) 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] additional_base_damage_value = " .. additional_base_damage_value )	

					local combined_base_damage = determined_base_damage+additional_base_damage_value --[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] combined_base_damage = " .. combined_base_damage )	

					caster:SetBaseDamageMax(combined_base_damage)
					caster:SetBaseDamageMin(combined_base_damage)
				else
					caster:SetBaseDamageMax(determined_base_damage)
					caster:SetBaseDamageMin(determined_base_damage)
				end
 

				--GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT
				caster:SetBaseMaxHealth(calc_health_total_to_int)

				caster:RemoveModifierByName("modifier_health_scaling_calc_datadriven")


				--caster:Heal(calc_health_total_to_int, caster)

			else
			end
 
			if unit_name == "npc_globaled_solo_easy_ranged_creep" then

				--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH AND DAMAGE SCALING ] Adjusting " .. unit_name .. "'s health and damage depending on hero picked." ) 

				local seconds_to_kill = GLOBALED_VALLEY_NPC_SOLO_RANGED_CREEP_SECONDS_TO_KILL 		--[[]] 	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " seconds_to_kill = " .. seconds_to_kill) 
				local calc_health_total = hero_dps_variable*seconds_to_kill						--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " calc_health_total = " .. calc_health_total) 
				local calc_health_total_to_int = math.floor(calc_health_total)      			--[[]]	print("[ GLOBALED - VALLEY ][ HEALTH SCALING ]" .. unit_name .. " calc_health_total_to_int = " .. calc_health_total_to_int) 


				local unit_outgoing_dps = GLOBALED_VALLEY_NPC_SOLO_RANGED_CREEP_DPS 				--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ]" .. unit_name .. " unit_outgoing_dps = " .. unit_outgoing_dps) 
				local unit_base_attack_time = caster:GetBaseAttackTime()						
				local determined_base_damage = unit_outgoing_dps*unit_base_attack_time			
				local determined_base_damage_to_int = math.floor(determined_base_damage)		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ]" .. unit_name .. "'s base damage before range adjustments = (dps:)" .. unit_outgoing_dps .. "*(bat:)" .. unit_base_attack_time .. " = " .. determined_base_damage_to_int)
		

				local picked_hero_expected_melee_enemy_uptime_percentage_in_float = GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] npc_health_scaling: global variable GLOBALED_VALLEY_NPC_UPTIME_SCALING_VARIABLE passed to local picked_hero_expected_melee_enemy_uptime_percentage_in_float: " .. picked_hero_expected_melee_enemy_uptime_percentage_in_float)
				local ranged_uptime_tuning_percentage = GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT 							--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] npc_health_scaling: global variable GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT passed to local ranged_uptime_tuning_percentage : " .. GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT)
				
				if picked_hero_expected_melee_enemy_uptime_percentage_in_float < 1.0 then
					local uptime_to_damage_increase_multiplier_float_negative = 1 - ranged_uptime_tuning_percentage 		print(uptime_to_damage_increase_multiplier_float_negative)
					local uptime_to_damage_increase_multiplier_float = uptime_to_damage_increase_multiplier_float_negative*uptime_to_damage_increase_multiplier_float_negative 			--[[]]		print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] uptime_to_damage_increase_multiplier_float = " .. uptime_to_damage_increase_multiplier_float)
					local bonus_base_damage_multiplier = uptime_to_damage_increase_multiplier_float*ranged_uptime_tuning_percentage 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] bonus_base_damage_multiplier = " .. bonus_base_damage_multiplier )	
					local additional_base_damage_value = math.floor(determined_base_damage_to_int*bonus_base_damage_multiplier) 		--[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] additional_base_damage_value = " .. additional_base_damage_value )	

					local combined_base_damage = determined_base_damage+additional_base_damage_value --[[]]	print("[ GLOBALED - VALLEY ][ DAMAGE SCALING ] combined_base_damage = " .. combined_base_damage )	

					caster:SetBaseDamageMax(combined_base_damage)
					caster:SetBaseDamageMin(combined_base_damage)
				else
					caster:SetBaseDamageMax(determined_base_damage)
					caster:SetBaseDamageMin(determined_base_damage)
				end
 

				--GLOBALED_VALLEY_RANGED_UPTIME_TUNING_PERCENTAGE_FLOAT

				caster:SetBaseMaxHealth(calc_health_total_to_int)
				caster:RemoveModifierByName("modifier_health_scaling_calc_datadriven")


				--caster:Heal(calc_health_total_to_int, caster)

			else
			end




		else
		end
	end

end