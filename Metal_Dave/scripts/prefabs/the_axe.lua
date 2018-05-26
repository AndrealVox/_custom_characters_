local assets=
{
    Asset("ANIM", "anim/shusui.zip"),
    Asset("ANIM", "anim/swap_shusui.zip"),
 
    Asset("ATLAS", "images/inventoryimages/the_axe.xml"),
    Asset("IMAGE", "images/inventoryimages/the_axe.tex"),
}

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_shusui", "swap_shusui")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end


local function fn(Sim)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
    inst.AnimState:SetBank("shusui")
    inst.AnimState:SetBuild("shusui")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("sharp")

	if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(100)
    inst.components.weapon:SetRange(2, 2)
    
    -------
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "the_axe"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/the_axe.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	MakeHauntableLaunch(inst)
    
    return inst
end

STRINGS.NAMES.THE_AXE = "The Axe"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.THE_AXE = "The Legendary Axe"

return Prefab( "common/inventory/the_axe", fn, assets) 
