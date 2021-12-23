# Mafia-2-LUA M2Edit-module
Module for making scripting in Mafia 2 easier.

# About
This module was developed during making DLC Henry for Mafia 2, and how time was going it was used in others projects like Mafia 2 Lost Heaven DLC and Motorfield. Now I decided to publish it and make some sort of wiki for it so people can easily make missions.

# Installation
Place the file M2Edit.lua to anywhere you want in directory Mafia II\pc. (for better compatibility it's better to place it to DLC folder if you making one, for example Mafia II\pc\dlcs\cnt_Lost_Heaven_Map\DATA\plugins)

# How to use
```lua
--if the file is in Mafia II\pc\DATA\plugins\M2Edit.lua

--for inejector
M2Edit = require("DATA.plugins.M2Edit")
M2Edit.ShowQuest("0051010032","QUEST_SHOP")

--for script in game
function onGameInit(arg0)
  M2Edit = require("DATA.plugins.M2Edit")
  M2Edit.ShowQuest("0051010032","QUEST_SHOP")
end
```

# Commands
```lua
--write cutsom string to file "M2Edit_DEBUG_LOG.txt" in Mafia II\pc
M2Edit.DEBUG_LOG("test string")

--this function will show objective "Destroy the store"
--first parameter is text id (from pc\sds_en\text\text_default.sds), second one is name of the quest defined by user.
M2Edit.ShowQuest("0051010032","QUEST_SHOP")

--this function will show objective "Destroy the store" on entity Joe
--first parameter is text id (from pc\sds_en\text\text_default.sds), second one is name of the entity (from actor file) third one is name of the quest defined by user.
M2Edit.ShowQuestEnt("0051010032", "Joe", "QUEST_SHOP")

--this function will show objective "Destroy the store" on position 30, 50
M2Edit.ShowQuestPos("0051010032",30,50,"QUEST_SHOP")
```
