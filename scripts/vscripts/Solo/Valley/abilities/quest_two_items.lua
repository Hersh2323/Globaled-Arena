function pickUpItems (event)
	local self = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(self) and IsValidEntity(target) then

		if target:HasModifier("modifier_tracking_quest_two_active_datadriven") then

			if self:GetUnitName() == "npc_valley_quest_two_shield_item" then

				if target:HasModifier("modifier_valley_quest_two_shield_buff") then
				else
					ability:ApplyDataDrivenModifier(self, target, "modifier_valley_quest_two_shield_buff", {} )
					self:ForceKill(true)
				end

			elseif self:GetUnitName() == "npc_valley_quest_two_blade_item" then

				if target:HasModifier("modifier_valley_quest_two_blade_buff") then
				else
					ability:ApplyDataDrivenModifier(self, target, "modifier_valley_quest_two_blade_buff", {} )
					self:ForceKill(true)
				end

			elseif self:GetUnitName() == "npc_valley_quest_two_boots_item" then

				if target:HasModifier("modifier_valley_quest_two_boots_buff") then
				else
					ability:ApplyDataDrivenModifier(self, target, "modifier_valley_quest_two_boots_buff", {} )
					self:ForceKill(true)
				end

			else 
			end
		else
		end

	else
	end
end




--modifier_valley_quest_two_shield_buff
--modifier_valley_quest_two_blade_buff
--modifier_valley_quest_two_boots_buff