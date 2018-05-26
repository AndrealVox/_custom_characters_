
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
   "the_axe", "goldenaxe", "goldenpickaxe", "goldenshovel", "teleporter", "fishingrod", "fishsticks", "fishsticks", "fishsticks", "fishsticks", "fishsticks", "fishsticks", "backpack_blueprint", "cutgrass", "cutgrass", "cutgrass", "cutgrass", "twigs", "twigs", "twigs", "twigs"
}

local function lighton(inst, data) --light aura
if TheWorld.state.isnight  then
	local light = inst.entity:AddLight()
	inst.Light:Enable(true)
	inst.Light:SetRadius(6.0)
	inst.Light:SetFalloff(.2)
	inst.Light:SetIntensity(.9)
	inst.Light:SetColour(72/255, 19/255, 52/255)
	
elseif TheWorld.state.isday then
	local light = inst.entity:AddLight()
	light:SetIntensity(0)
	light:SetRadius(0)
	light:SetFalloff(0)
	light:Enable(false)
	light:SetColour(0/255, 0/255, 0/255)
	
elseif TheWorld.state.isdusk then
	local light = inst.entity:AddLight()
	light:SetIntensity(0)
	light:SetRadius(0)
	light:SetFalloff(0)
	light:Enable(false)
	light:SetColour(0/255, 0/255, 0/255)
	end
end

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "metaldave_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "metaldave_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "metaldave.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "maxwell"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(300)
	inst.components.health.minhealth = 1
	inst.components.health:StartRegen(1, 2)
	inst.components.hunger:SetMax(300)
	inst.components.sanity:SetMax(300)
    inst.components.locomotor.walkspeed = 6
	inst.components.locomotor.runspeed = 12
	inst.components.temperature.mintemp = 20
	inst.components.temperature.maxtemp = 30
	inst.components.temperature.overheattemp = 1000
	inst.components.combat.damagemultiplier = 6
	inst.components.combat.defaultdamage = 6
	inst.components.combat.min_attack_period = 0.025
	inst.components.combat.hitrange = 2
	inst.components.combat.attackrange = 2
	inst.components.sanity.night_drain_mult = 1
	inst.components.sanity.neg_aura_mult = 0
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * .5)
    inst.components.health.fire_damage_scale = 0
	inst.components.health.fire_timestart = 0
	inst.components.eater.strongstomach = true
	inst.components.eater.ignoresspoilage = true
	inst.components.moisture.maxmoisture = 300
	inst.components.moisture.maxDryingRate = 1.9
	inst.components.moisture.baseDryingRate = .9
	
	inst:ListenForEvent("sanitydelta", lighton)

    inst:AddComponent("armor")
    inst.components.armor.absorb_percent = 6.2

	inst.OnLoad = onload
    inst.OnNewSpawn = onload

end

return MakePlayerCharacter("metaldave", prefabs, assets, common_postinit, master_postinit, start_inv)
