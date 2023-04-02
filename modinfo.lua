-- This information tells other players more about the mod
name = "Paper Grenade"
version = "1.2.9.m"
description = "You just Throw, and Pop! v"..version
author = "Zerunokasiar"

-- This is the URL name of the mod's thread on the forum; the part after the index.php? and before the first & in the URL
forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with both the base game and reign of giants
reign_of_giants_compatible = false
dont_starve_compatible = false
dst_compatible = true
all_clients_require_mod = true

-- Can specify a custom icon for this mod!
icon_atlas = "images/modicon.xml"
icon = "modicon.tex"

configuration_options = {
    {
        name = "paper_grenade_dmg",
        label = "Explosion Damage",
        options =
        {
            {description="25", data = 25, hover = ""},
            {description="50", data = 50, hover = ""},
            {description="75", data = 75, hover = ""},
            {description="100", data = 100, hover = "Default"},
            {description="125", data = 125, hover = ""},
            {description="150", data = 150, hover = ""},
            {description="175", data = 175, hover = ""},
            {description="200", data = 200, hover = ""},
        },
        default = 100,
    },
    {
        name = "paper_grenade_aoe",
        label = "Explosion Range",
        options =
        {
            {description="5", data = 5, hover = ""},
            {description="4", data = 4, hover = ""},
            {description="3", data = 3, hover = "Default"},
            {description="2", data = 2, hover = ""},
            {description="1", data = 1, hover = ""},
        },
        default = 3,
    },
    {
        name = "paper_grenade_pdmg",
        label = "Damage to the Player",
        options =
        {
            {description="100%", data = 1, hover = ""},
            {description="95%", data = 0.95, hover = ""},
            {description="90%", data = 0.9, hover = ""},
            {description="85%", data = 0.85, hover = ""},
            {description="80%", data = 0.8, hover = ""},
            {description="75%", data = 0.75, hover = ""},
            {description="70%", data = 0.7, hover = ""},
            {description="65%", data = 0.65, hover = ""},
            {description="60%", data = 0.6, hover = ""},
            {description="55%", data = 0.55, hover = ""},
            {description="50%", data = 0.5, hover = ""},
            {description="45%", data = 0.45, hover = ""},
            {description="40%", data = 0.4, hover = ""},
            {description="35%", data = 0.35, hover = ""},
            {description="30%", data = 0.3, hover = ""},
            {description="25%", data = 0.25, hover = ""},
            {description="20%", data = 0.2, hover = ""},
            {description="15%", data = 0.15, hover = ""},
            {description="10%", data = 0.1, hover = "Default"},
            {description="5%", data = 0.05, hover = ""},
            {description="0%", data = 0, hover = ""},
        },
        default = 0.1,
    },
    {
        name = "paper_grenade_cnt",
        label = "Output Count",
        options =
        {
            {description="1", data = 1, hover = ""},
            {description="2", data = 2, hover = ""},
            {description="3", data = 3, hover = ""},
            {description="4", data = 4, hover = ""},
            {description="5", data = 5, hover = "Default"},
            {description="6", data = 6, hover = ""},
            {description="7", data = 7, hover = ""},
            {description="8", data = 8, hover = ""},
            {description="9", data = 9, hover = ""},
            {description="10", data = 10, hover = ""},
            {description="11", data = 11, hover = ""},
            {description="12", data = 12, hover = ""},
            {description="13", data = 13, hover = ""},
            {description="14", data = 14, hover = ""},
            {description="15", data = 15, hover = ""},
            {description="16", data = 16, hover = ""},
            {description="17", data = 17, hover = ""},
            {description="18", data = 18, hover = ""},
            {description="19", data = 19, hover = ""},
            {description="20", data = 20, hover = ""},
        },
        default = 5,
    },
}