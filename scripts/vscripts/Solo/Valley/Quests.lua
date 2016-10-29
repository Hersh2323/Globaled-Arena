function GreetingMiniMeepoByLake(trigger)

    local actor = Entities:FindByName(nil, "InitialGreeter")
    actor:AddSpeechBubble(1, "#globaled_bystander_fire_suggestion_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)
end

function endSpeechBubbles(trigger)

	local cancelQuestGiverDialog = Entities:FindByName(nil, "npc")
	cancelQuestGiverDialog: DestroyAllSpeechBubbles()
end




function valleyButcherQuestText(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability



    if caster:HasModifier("modifier_chicken_following_active_datadriven") then
		caster:AddSpeechBubble(1, "#valley_butcher_chicken_nearby_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)
    else
		caster:AddSpeechBubble(1, "#valley_butcher_introduction_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)
    end

end

function valleyButcherChickenFoundText(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	caster:AddSpeechBubble(1, "#valley_butcher_chicken_found_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

    StartAnimation(caster, {duration=5.0, activity=ACT_DOTA_CHANNEL_ABILITY_4, rate=1.0})
end


function endQuestText(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	caster:DestroyAllSpeechBubbles()
end


function chickenDetectedNearPudge(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local pudgeEntity = Entities:FindByName(nil, "butcherSpawnLocation")

	local pudgeFoundEventDelayTime = ability:GetLevelSpecialValueFor("pudgeFoundEventDelayTime", 0)

	if pudgeEntity == nil then
		print("[ GLOBALED - VALLEY ] pudgeEntity == nil: true")      

	else
		if target == pudgeEntity then

			caster:RemoveModifierByName("modifier_chicken_lure_passive")

			caster:Stop()

			Timers:CreateTimer(pudgeFoundEventDelayTime, -- Start this timer 30 game-time seconds later
		    function()

		    	if caster == nil then
		    	else
		    		local chickenPointTarget = Entities:FindByName(nil, "butcherChickenTeleportArea")
		    		local chickenDestination = chickenPointTarget:GetAbsOrigin()

					FindClearSpaceForUnit(caster, chickenDestination, false)

					local pudgeAbility = pudgeEntity:FindAbilityByName("valley_butcher_quest")
					pudgeAbility:ApplyDataDrivenModifier(pudgeEntity, pudgeEntity, "modifier_butcher_chicken_kill_dialog", {})

					Timers:CreateTimer(5.0, -- Start this timer x game-time seconds later
				    function()
				    	if caster == nil then
				    	else
				    		caster:Kill(ability, caster)
				    	end
				      return  -- Rerun this timer every x game-time seconds
				    end)
		    	end

		      return  -- Rerun this timer every 30 game-time seconds
		    end)
		else
			--print("[ GLOBALED - VALLEY ] target == pudgeEntity: false")      
		end
	end

end


-- AI used to force chicken/sheep npc to follow the hero nearby
function chickenForceFollow(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

--	local check_interval = ability:GetLevelSpecialValueFor("check_interval", 0)
--	local check_interval_multiplier = ability:GetLevelSpecialValueFor("check_interval_multiplier", 0)
--	local check_interval_multiplied = check_interval*check_interval_multiplier

 	caster:MoveToNPC(target)
end

function detectChickenThinker(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability


end




function valleySitHilQuestOneText(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability



    if caster:HasModifier("modifier_sithil_quest_one_active_datadriven") then


		local stackSize = target:GetModifierStackCount("modifier_tracking_quest_one_active_datadriven", caster)
		if stackSize == GLOBALED_VALLEY_QUEST_ONE_WOLF_KILLS_REQUIRED then
			caster:RemoveModifierByName("modifier_sithil_quest_one_active_datadriven")
			target:RemoveModifierByName("modifier_tracking_quest_one_active_datadriven")
		else
	    	local SpeechBubbleLocationEnt = Entities:FindByName(nil, "questgiver_sithil_speech_npc")
			SpeechBubbleLocationEnt:AddSpeechBubble(1, "#valley_sithil_quest_one_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)
		end


    elseif caster:HasModifier("modifier_sithil_quest_two_active_datadriven") then
    	local SpeechBubbleLocationEnt = Entities:FindByName(nil, "questgiver_sithil_speech_npc")
		SpeechBubbleLocationEnt:AddSpeechBubble(1, "#valley_sithil_quest_two_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)
    end

end

function valleySitHilQuestComplete(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local sithil = Entities:FindByName(nil, "questgiver_sithil")

	if IsValidEntity(sithil) then
		sithil:RemoveModifierByName("modifier_sithil_quest_one_active_datadriven")
	else
	end
end

function valleyQuestCompleteSound(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local soundLocation = caster:GetAbsOrigin()
	--EmitSoundOnLocationWithCaster(soundLocation, "globaledarenaalpha.twinsTrack", caster)

end





function valleyQuirtQuestOneText(event)
	local caster = event.caster
	local target = event.target
	local ability = event.ability

	local SpeechBubbleLocationEnt = Entities:FindByName(nil, "questgiver_quirt_speech_npc")
	SpeechBubbleLocationEnt:AddSpeechBubble(1, "#valley_quirt_quest_one_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

	if caster:HasModifier("modifier_quest_quest_one_active") then

    	local SpeechBubbleLocationEnt = Entities:FindByName(nil, "questgiver_quirt_speech_npc")
		SpeechBubbleLocationEnt:AddSpeechBubble(1, "#valley_quirt_quest_one_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

	elseif caster:HasModifier("modifier_valley_quest_two_complete_datadriven") then

    	local SpeechBubbleLocationEnt = Entities:FindByName(nil, "questgiver_quirt_speech_npc")
		SpeechBubbleLocationEnt:AddSpeechBubble(1, "#valley_quirt_quest_one_followup_text", GLOBALED_VALLEY_QUEST_TEXT_DURATION, 0, 0)

	else
	end
end

function checkQuestTwoProgress (event)
	local self = event.target
	local ability = event.ability

	if IsValidEntity(self) and self:HasModifier("modifier_valley_quest_two_shield_buff") and self:HasModifier("modifier_valley_quest_two_blade_buff") and self:HasModifier("modifier_valley_quest_two_boots_buff") then

    	local questgiver = Entities:FindByName(nil, "questgiver_quirt")
    	if IsValidEntity(questgiver) then
    		questgiver:RemoveModifierByName("modifier_valley_quest_two_active_datadriven")
    		print("[valley][quest 2 completed] quest two active modifier removed from quirt")
    	else
    	end

	else
	end

end




function questTwocheckForCompletion(event)
	local self = event.caster
	local target = event.target
	local ability = event.ability

	if IsValidEntity(target) and target:HasModifier("modifier_valley_quest_two_shield_buff") and target:HasModifier("modifier_valley_quest_two_blade_buff") and target:HasModifier("modifier_valley_quest_two_boots_buff") then

		target:RemoveModifierByName("modifier_tracking_quest_two_active_datadriven")
		target:RemoveModifierByName("modifier_valley_quest_two_shield_buff")
		target:RemoveModifierByName("modifier_valley_quest_two_blade_buff")
		target:RemoveModifierByName("modifier_valley_quest_two_boots_buff")

		--target:addExperience(1000, true)

		Timers:CreateTimer(GLOBALED_VALLEY_QUEST_COMPLETION_DIALOG_LINGER_TIME,
		function()
			if IsValidEntity(self) then
				self:RemoveModifierByName("modifier_valley_quest_two_complete_datadriven")
			else
			end

		return
		end)


	else
	end


end




