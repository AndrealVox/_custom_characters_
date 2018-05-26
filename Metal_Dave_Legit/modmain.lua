
PrefabFiles = {
	"metaldave",
	"metaldave_none",
	"teleporter",
	"the_axe",

}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/metaldave.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/metaldave.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/metaldave.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/metaldave.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/metaldave_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/metaldave_silho.xml" ),

    Asset( "IMAGE", "bigportraits/metaldave.tex" ),
    Asset( "ATLAS", "bigportraits/metaldave.xml" ),
	
	Asset( "IMAGE", "images/map_icons/metaldave.tex" ),
	Asset( "ATLAS", "images/map_icons/metaldave.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_metaldave.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_metaldave.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_metaldave.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_metaldave.xml" ),
	
	Asset( "IMAGE", "images/names_metaldave.tex" ),
    Asset( "ATLAS", "images/names_metaldave.xml" ),
	
    Asset( "IMAGE", "bigportraits/metaldave_none.tex" ),
    Asset( "ATLAS", "bigportraits/metaldave_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

GLOBAL.STRINGS.NAMES.TELEPORTER = "Teleport Device"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.TELEPORTER = "Im Here, Then There!"

local TUNING = GLOBAL.TUNING

TUNING.FISHING_CATCH_CHANCE = 0.9
TUNING.FISHINGROD_USES = 40
TUNING.FISHING_MINWAIT = 1
TUNING.FISHING_MAXWAIT = 2


-- The character select screen lines
STRINGS.CHARACTER_TITLES.metaldave = "The Heavy Metal Rocker"
STRINGS.CHARACTER_NAMES.metaldave = "Metal Dave"
STRINGS.CHARACTER_DESCRIPTIONS.metaldave = "*Heightened stats.\n*Super speed.\n*Starts with a teleporter."
STRINGS.CHARACTER_QUOTES.metaldave = "\"Rock on, man!\""

-- Custom speech strings
STRINGS.CHARACTERS.METALDAVE = require "speech_metaldave"

-- The character's name as appears in-game 
STRINGS.NAMES.METALDAVE = "Metal Dave"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.METALDAVE = 
{
	GENERIC = "It's Metal Dave!",
	ATTACKER = "That's Metal Dave, I wouldn't want to fight him.",
	MURDERER = "Murderer!",
	REVIVER = "Metal Dave, friend of ghosts.",
	GHOST = "Metal Dave could use a heart.",
}


AddMinimapAtlas("images/map_icons/metaldave.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("metaldave", "MALE")

