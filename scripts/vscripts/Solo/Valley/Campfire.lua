function OnStartTouchCampfire(trigger)
 
  print(trigger.activator)
  print(trigger.caller)
  
    local player = trigger.activator

	player:AddNewModifier(player,nil,"modifier_rune_regen", nil)
 
end


function CampfireBuffOff(trigger)
 
  print(trigger.activator)
  print(trigger.caller)
 
end






function campfireTouching(trigger)
 
	local target = trigger.activator
	--local ability = 
  
 
end


function campfireRemove(trigger)
 
  print(trigger.activator)
  print(trigger.caller)
 
end