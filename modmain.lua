local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local require = GLOBAL.require
local SpawnPrefab = GLOBAL.SpawnPrefab
local ACTIONS = GLOBAL.ACTIONS
local Action = GLOBAL.Action
local TECH = GLOBAL.TECH
local GetPlayer = GLOBAL.GetPlayer
local Vector3 = GLOBAL.Vector3
local resolvefilepath = GLOBAL.resolvefilepath

GLOBAL.TUNING.PAPERGRENADE_MUL = GetModConfigData("paper_grenade_dmg_multiplier")
GLOBAL.TUNING.PAPERGRENADE_DMG = GetModConfigData("paper_grenade_dmg")
GLOBAL.TUNING.PAPERGRENADE_AOE = GetModConfigData("paper_grenade_aoe")
GLOBAL.TUNING.PAPERGRENADE_PDMG = GetModConfigData("paper_grenade_pdmg")
GLOBAL.TUNING.PAPERGRENADE_CNT = GetModConfigData("paper_grenade_cnt")

PrefabFiles = {
	"papergrenade",
}

STRINGS.NAMES.PAPERGRENADE = "Paper Grenade"
STRINGS.RECIPE_DESC.PAPERGRENADE = "Harmless Grenade."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PAPERGRENADE = "It is just Paper. Trust Me."

Assets = {
	Asset( "IMAGE", "images/inventoryimages/papergrenade.tex"),
	Asset( "ATLAS", "images/inventoryimages/papergrenade.xml"),
}

local recipe = {Ingredient("papyrus", 1), Ingredient("nitre", 1), Ingredient("gunpowder", 1)}
local paper = Recipe("papergrenade", recipe, RECIPETABS.WAR, {SCIENCE = 2, MAGIC = 0, ANCIENT = 0}, nil, nil, nil, TUNING.PAPERGRENADE_CNT)
paper.atlas = "images/inventoryimages/papergrenade.xml"