local assets=
{
	Asset("ANIM", "anim/papergrenade.zip"),
	Asset("ANIM", "anim/swap_papergrenade.zip"),
        Asset("IMAGE", "images/inventoryimages/papergrenade.tex"),
	Asset("ATLAS", "images/inventoryimages/papergrenade.xml"),
}

local function OnDropped(inst)
    inst.AnimState:PlayAnimation("idle")
end

local function OnCaught(inst, catcher)
    if catcher then
        if catcher.components.inventory then
            if inst.components.equippable and not catcher.components.inventory:GetEquippedItem(inst.components.equippable.equipslot) then
				catcher.components.inventory:Equip(inst)
			else
                catcher.components.inventory:GiveItem(inst)
            end
            catcher:PushEvent("catch")
        end
    end
end

local function onCollide(inst,other)
	if inst.components.projectile and inst.components.projectile.owner then
		SpawnPrefab(inst.prefab).Transform:SetPosition(inst.Transform:GetWorldPosition())
		SpawnPrefab("impact").Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst:Remove()
	end
end

local function onTimer(inst)
	SpawnPrefab(inst.prefab).Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("impact").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst:Remove()
end

local function OnThrown(inst, owner)
	local damage = TUNING.PAPERGRENADE_DMG
	local multiplier = 1
	if owner.components.combat.damagemultiplier then
		multiplier = owner.components.combat.damagemultiplier
	end
	if TUNING.PAPERGRENADE_MUL then
		inst.components.combat.damagemultiplier = multiplier
	else
		inst.components.weapon:SetDamage(damage / multiplier)
	end
	inst.Physics:SetCollisionCallback(onCollide)
	inst:DoPeriodicTask(0.5,function() onTimer(inst) end)
end

local function OnHit(inst, owner, target)
	SpawnPrefab("collapse_small").Transform:SetPosition(target.Transform:GetWorldPosition())
	SpawnPrefab("explode_small").Transform:SetPosition(target.Transform:GetWorldPosition())
	TheWorld:PushEvent("screenflash", 0.5)
	for i, v in ipairs(AllPlayers) do
		v:ShakeCamera(CAMERASHAKE.FULL, 0.7, 0.02, 0.5, inst, 40)
	end
	if not TUNING.PAPERGRENADE_MUL then
		inst.components.weapon:SetDamage(TUNING.PAPERGRENADE_DMG)
	end
	inst.components.combat:DoAreaAttack(target, TUNING.PAPERGRENADE_AOE, inst)
	local impactfx = SpawnPrefab("impact")
	if impactfx then
		local follower = impactfx.entity:AddFollower()
		follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
		impactfx:FacePoint(Vector3(inst.Transform:GetWorldPosition()))
	end
	inst:Remove()
end

local function onequip(inst, owner) 
	owner.AnimState:OverrideSymbol("swap_object", "swap_papergrenade", "swap_spear")
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
	inst.entity:AddSoundEmitter()

	MakeInventoryPhysics(inst)
    
	inst.AnimState:SetBank("papergrenade")
	inst.AnimState:SetBuild("papergrenade")
	inst.AnimState:PlayAnimation("idle")  
	inst.AnimState:SetOrientation( ANIM_ORIENTATION.OnGround )

	if not TheWorld.ismastersim then
		return inst
	end
    
    -------        
	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(TUNING.PAPERGRENADE_DMG)
	inst.components.weapon:SetRange(8, 12)

	inst:AddComponent("combat")
	inst.components.combat.playerdamagepercent = TUNING.PAPERGRENADE_PDMG

	inst:AddComponent("projectile")
	inst.components.projectile:SetSpeed(30)
	inst.components.projectile:SetCanCatch(true)
	inst.components.projectile:SetHoming(false)
	inst.components.projectile:SetOnThrownFn(OnThrown)
	inst.components.projectile:SetOnHitFn(OnHit)
	inst.components.projectile:SetOnCaughtFn(OnCaught)

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/papergrenade.xml"
    
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip( onequip )
	inst.components.equippable:SetOnUnequip( onunequip )
	inst.components.equippable.equipstack = true

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	return inst
end

return Prefab( "common/inventory/papergrenade", fn, assets) 
