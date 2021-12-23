local M2EditModule =  {}

function M2EditModule.DEBUG_LOG(log_text)
	f=assert(io.open("M2Edit_DEBUG_LOG.txt", "a+"))
	f:write(log_text.."\n")
	io.close(f)
end

function M2EditModule.ShowQuestPos(NameID,PosX,PosY,NameVar)
	if quest_Objective_OWN~= nil then
      quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_FINISHED)
      game.navigation:UnregisterObjectivePos(game.datastore:GetNumber("OBJECTIVE_MAIN_RADAR_ID"))
   end
	quest_OWN=game.quests:NewQuest(5, 12, true, "0056000001", "0056000001") -- NAZEV MISE (treba Pila)
	quest_Objective_OWN = quest_OWN:AddObjective(NameID) -- NAZAV MOMENTALNIHO UKOLU
	game.datastore:SetNumber("OBJECTIVE_MAIN_RADAR_ID", (game.navigation:RegisterObjectivePos(PosX,PosY, (quest_Objective_OWN))))-- pozice ukolu + nazev (ocividne se da cist z AddObjective)
	game.datastore:SetVariableTemporary("OBJECTIVE_MAIN_RADAR_ID", true)
	quest_OWN:SetName(NameVar)
	quest_Objective_OWN:SetName("OBJECTIVE_MAIN")
	quest_Objective_OWN:Show(10)
	quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_IN_PROGRESS)
	game.datastore:SetNumber("M2Edit_ObjectivePos_X",PosX)
	game.datastore:SetNumber("M2Edit_ObjectivePos_Y",PosY)
end

function M2EditModule.ShowQuestEnt(NameID,Ent,NameVar)
	if quest_Objective_OWN~= nil then
      quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_FINISHED)
      game.navigation:UnregisterObjectivePos(game.datastore:GetNumber("OBJECTIVE_MAIN_RADAR_ID"))
   end
	quest_OWN=game.quests:NewQuest(5, 12, true, "0056000001", "0056000001") -- NAZEV MISE (treba Pila)
	quest_Objective_OWN = quest_OWN:AddObjective(NameID) -- NAZAV MOMENTALNIHO UKOLU
	game.datastore:SetNumber("OBJECTIVE_MAIN_RADAR_ID", (game.navigation:RegisterObjectiveEntity(Ent,(quest_Objective_OWN))))
	game.datastore:SetVariableTemporary("OBJECTIVE_MAIN_RADAR_ID", true)
	quest_OWN:SetName(NameVar)
	quest_Objective_OWN:SetName("OBJECTIVE_MAIN")
	quest_Objective_OWN:Show(10)
  quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_IN_PROGRESS)
end

function M2EditModule.ShowQuest(NameID,NameVar)
	if quest_Objective_OWN~= nil then
      quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_FINISHED)
      game.navigation:UnregisterObjectivePos(game.datastore:GetNumber("OBJECTIVE_MAIN_RADAR_ID"))
   end
	quest_OWN=game.quests:NewQuest(5, 12, true, "0056000001", "0056000001") -- NAZEV MISE (treba Pila)
	quest_Objective_OWN = quest_OWN:AddObjective(NameID) -- NAZAV MOMENTALNIHO UKOLU
	quest_OWN:SetName(NameVar)
	quest_Objective_OWN:SetName("OBJECTIVE_MAIN")
	quest_Objective_OWN:Show(10)
  quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_IN_PROGRESS)
end

function M2EditModule.RemoveQuest()
	if quest_Objective_OWN~= nil then
      quest_Objective_OWN:SetState(enums.ObjectiveStates.E_OBJECTIVESTATE_FINISHED)
      game.navigation:UnregisterObjectivePos(game.datastore:GetNumber("OBJECTIVE_MAIN_RADAR_ID"))
   end
end

function M2EditModule.NextMission(StreammapName,Part)
	CommandBuffer:Insert(arg0, {
	function(arg0)
		return game.hud:FaderFadeOut(250)
	end,
	function(arg0)
	game.traffic:DespawnPolice()
	ai.police:DeactivateAllOffences(game.game:GetActivePlayer():GetGuid())
	ai.police:SetDensity(0)
	ai.police:SetDensityMax(1)
	ai.police:SetKnownPerson(false)
	game.wardrobe:ClearAllWanted()
	game.hud:EffectAlcoholDrunk(-100)
	kteraJeMise = game.datastore:GetNumber("missionNumber")
	game.datastore:ClearTemporaryVariables()
	game.hud:TimerStop()
	end,
	function(arg0)
		game.datastore:SetNumber("missionNumber", kteraJeMise + 1)
		return game.datastore:SetNumber("missionPart",Part)
	end,
	function(arg0)
		return game.sds:ActivateStreamMapLine(StreammapName)
	end
	})
end

function M2EditModule.NextMissionPart(StreammapName,Part)
	CommandBuffer:Insert(arg0, {
	function(arg0)
		return game.hud:FaderFadeOut(250)
	end,
	function(arg0)
	game.traffic:DespawnPolice()
	ai.police:DeactivateAllOffences(game.game:GetActivePlayer():GetGuid())
	ai.police:SetDensity(0)
	ai.police:SetDensityMax(1)
	ai.police:SetKnownPerson(false)
	game.wardrobe:ClearAllWanted()
	game.hud:EffectAlcoholDrunk(-100)
	kteraJeMise = game.datastore:GetNumber("missionNumber")
  game.datastore:ClearTemporaryVariables()
	game.hud:TimerStop()
	end,
	function(arg0)
		game.datastore:SetNumber("missionNumber", kteraJeMise)
		return game.datastore:SetNumber("missionPart",Part)
	end,
	function(arg0)
		return game.sds:ActivateStreamMapLine(StreammapName)
	end
	})
end

return M2EditModule