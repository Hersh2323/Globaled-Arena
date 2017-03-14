
function ice_shield_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=0.3, activity=ACT_DOTA_VICTORY, rate=1.4})
end

function cm_root_nova_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=0.7, activity=ACT_DOTA_CAST_ABILITY_1, rate=1.5})
end

function cm_fast_strike_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_ATTACK, rate=1.75})
end

function cm_blink_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=0.625, activity=ACT_DOTA_SPAWN, rate=0.9})
end

function necro_instant_cast_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=0.5, activity=ACT_DOTA_ATTACK, rate=1.5})
end

function necro_summon_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=1.0, activity=ACT_DOTA_CAST_ABILITY_1, rate=1.0})
end

function necro_teleport_animation(event)
	local caster = event.caster

	StartAnimation(caster, {duration=0.6, activity=ACT_DOTA_VICTORY, rate=1.0})
end
