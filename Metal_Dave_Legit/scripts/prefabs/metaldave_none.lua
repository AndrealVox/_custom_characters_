local assets =
{
	Asset( "ANIM", "anim/metaldave.zip" ),
	Asset( "ANIM", "anim/ghost_metaldave_build.zip" ),
}

local skins =
{
	normal_skin = "metaldave",
	ghost_skin = "ghost_metaldave_build",
}

local base_prefab = "metaldave"

local tags = {"METALDAVE", "CHARACTER"}

return CreatePrefabSkin("metaldave_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})