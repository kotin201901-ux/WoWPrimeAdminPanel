-------------------------------------------------------------------------------------------------------------
--
-- WoWPrimeAdminPanel Version 3.x
-- WoWPrimeAdminPanel is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <https://www.gnu.org/licenses/gpl-3.0.en.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Repository: https://github.com/kotin201901-ux/WoWPrimeAdminPanel
--
-------------------------------------------------------------------------------------------------------------

WoWPrimeAdminPanelCommands = WoWPrimeAdminPanelCommands or {}

function WoWPrimeAdminPanelCommands.InitModelFrameNPC()
  ma_npcmodelframe:SetScript("OnUpdate", function(self, elapsed) WoWPrimeAdminPanelCommands.WoWPrimeAdminPanelNpcModelOnUpdate(self, elapsed) end)
  ma_npcmodelframe.rotation = 0.61;
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  ma_npcmodelframe:SetUnit("player")

end

function WoWPrimeAdminPanelCommands.NpcModelRotateLeft()
  ma_npcmodelframe.rotation = ma_npcmodelframe.rotation - 0.03
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function WoWPrimeAdminPanelCommands.NpcModelRotateRight()
  ma_npcmodelframe.rotation = ma_npcmodelframe.rotation + 0.03
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function WoWPrimeAdminPanelCommands.WoWPrimeAdminPanelNpcModelOnUpdate(frame, elapsedTime)
  if ( ma_npcmodelrotatelbutton:GetButtonState() == "PUSHED" ) then
  frame.rotation = frame.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
  if ( frame.rotation < 0 ) then
    frame.rotation = frame.rotation + (2 * PI)
  end
  frame:SetRotation(frame.rotation);
  end
  if ( ma_npcmodelrotaterbutton:GetButtonState() == "PUSHED" ) then
  frame.rotation = frame.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
  if ( frame.rotation > (2 * PI) ) then
    frame.rotation = frame.rotation - (2 * PI)
  end
  frame:SetRotation(frame.rotation);
  end
end

function WoWPrimeAdminPanelCommands.NpcModelChanged()
  if not ma_npcmodelframe then
  return -- Frame not created yet
  end
  if not WoWPrimeAdminPanel:Selection("none") then
  ma_npcmodelframe:SetUnit("target")
  else
  ma_npcmodelframe:SetUnit("player")
  end
  ma_npcmodelframe:RefreshUnit()
end

function WoWPrimeAdminPanelCommands.NPCKillSomething()
  local target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".die")
end

function WoWPrimeAdminPanelCommands.Respawn()
  WoWPrimeAdminPanel:ChatMsg(".respawn")
end

function WoWPrimeAdminPanelCommands.NPCDistance()
  -- Check if a target exists
  if UnitExists("target") then
    WoWPrimeAdminPanel:ID_Setting_Start_Write(1)
    local NPC_target = UnitName("target")
    WoWPrimeAdminPanel:ChatMsg(".distance")
  else
    print("Target NPC to use distance command")
  end
end

function WoWPrimeAdminPanelCommands.NPCShowGUID()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".guid")
end

function WoWPrimeAdminPanelCommands.NPCInfo()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc info")
end

function WoWPrimeAdminPanelCommands.NPCDemorph()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".demorph")
end


function WoWPrimeAdminPanelCommands.NPCMove()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc move")
end



function WoWPrimeAdminPanelCommands.NPCDel()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc del")
end

function WoWPrimeAdminPanelCommands.NPC_GUID_Get()
	WoWPrimeAdminPanel:ID_Setting_Start_Write(1)
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc info")
end

function WoWPrimeAdminPanelCommands.NPC_Add()
  local NPC_target = UnitName("target")
  local npc = ma_NPC_idbutton:GetText()
  WoWPrimeAdminPanel:ChatMsg(".npc add "..npc)
end

function WoWPrimeAdminPanelCommands.NPC_AddID()
  local idbox = ma_NPC_idbutton:GetText()
  local params = ma_npccharactertarget:GetText()
  local creatureid = (idbox ~= "" and idbox) or params
  WoWPrimeAdminPanel:ChatMsg(".npc add "..creatureid)
end

function WoWPrimeAdminPanelCommands.NPCGo()
  local NPC_target = UnitName("target")
  local npc =	ma_NPC_guidbutton:GetText()
  WoWPrimeAdminPanel:ChatMsg(".go creature "..npc)
end

function WoWPrimeAdminPanelCommands.NPCMorph()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".modify morph "..npccname)
end

function WoWPrimeAdminPanelCommands.NPCSay()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".npc say "..npccname)
end

function WoWPrimeAdminPanelCommands.NPCYell()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".npc yell "..npccname)
end

function WoWPrimeAdminPanelCommands.NPCAura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".aura "..npccname)
end

function WoWPrimeAdminPanelCommands.NPCUnaura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".unaura "..npccname)
end

function WoWPrimeAdminPanelCommands.NpcEmote(emote)
  WoWPrimeAdminPanel:ChatMsg(".npc playemote "..emote)
end

function WoWPrimeAdminPanelCommands.NPCBindSight()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".bindsight")
end

function WoWPrimeAdminPanelCommands.NPCUnBindSight()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".unbindsight")
end

function WoWPrimeAdminPanelCommands.NPCComeToMe()
  local npccname = ma_npccharactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".cometome 1")

end

function WoWPrimeAdminPanelCommands.DisplayUP()
  -- Check if display ID exists
  local guid = ma_NPC_guidbutton:GetText()
  local displayid = ma_npcdisplayid:GetText()

  if UnitExists("target") and guid ~= "" and displayid ~= "" then
    local currentid = ma_npcdisplayid:GetText()
    currentid = currentid + 1
    ma_npcdisplayid:SetText(currentid)
    WoWPrimeAdminPanel:ChatMsg(".npc set model "..currentid)
  else
    print("Target NPC and use 'Get GUID' first")
  end
end

function WoWPrimeAdminPanelCommands.DisplayDown()
  -- Check if display ID exists
  local guid = ma_NPC_guidbutton:GetText()
  local displayid = ma_npcdisplayid:GetText()

  if UnitExists("target") and guid ~= "" and displayid ~= "" then
    local currentid = ma_npcdisplayid:GetText()
    currentid = currentid - 1
    ma_npcdisplayid:SetText(currentid)
    WoWPrimeAdminPanel:ChatMsg(".npc set model "..currentid)
  else
    print("Target NPC and use 'Get GUID' first")
  end
end

function WoWPrimeAdminPanelCommands.ID_UP()
  -- Check if ID exists
  local guid = ma_NPC_guidbutton:GetText()
  local npcid = ma_NPC_idbutton:GetText()

  if UnitExists("target") and guid ~= "" and npcid ~= "" then
    local currentid = ma_NPC_idbutton:GetText()
    currentid = currentid + 1
    ma_NPC_idbutton:SetText(currentid)
  else
    print("Target NPC and use 'Get GUID' first")
  end
end

function WoWPrimeAdminPanelCommands.ID_DOWN()
  -- Check if ID exists
  local guid = ma_NPC_guidbutton:GetText()
  local npcid = ma_NPC_idbutton:GetText()

  if UnitExists("target") and guid ~= "" and npcid ~= "" then
    local currentid = ma_NPC_idbutton:GetText()
    currentid = currentid - 1
    ma_NPC_idbutton:SetText(currentid)
  else
    print("Target NPC and use 'Get GUID' first")
  end
end

function WoWPrimeAdminPanelCommands.NPCClear()
  -- Clear all NPC info text boxes
  ma_NPC_guidbutton:SetText("")
  ma_NPC_idbutton:SetText("")
  ma_npcdisplayid:SetText("")
  ma_npc_distance_box:SetText("")
end

function WoWPrimeAdminPanelCommands.NPCModelZoomIn()
  ma_npcmodelframe:SetCamera(0)
--  ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() + .1)
  --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
  --ma_modelframe:RefreshUnit()
end

function WoWPrimeAdminPanelCommands.NPCModelZoomOut()
  ma_npcmodelframe:SetCamera(1)
  ma_npcmodelframe:RefreshUnit()

   -- ma_modelframe:SetCamera(2)
  --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() * .5)
  --ma_modelframe:SetPosition(0,0,0)
  --ma_modelframe:RefreshUnit()

end

function WoWPrimeAdminPanelCommands.NPCPossess()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".possess")

end
function WoWPrimeAdminPanelCommands.NPCUnPossess()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".unpossess")

end

function WoWPrimeAdminPanelCommands.NPCFreeze()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc set movetype stay NODEL")
end

function WoWPrimeAdminPanelCommands.NPCFreezeDEL()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc set movetype stay")
end

function WoWPrimeAdminPanelCommands.WayEndAdd()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".wp add")
end

function WoWPrimeAdminPanelCommands.NPCAdd_Way()
  local NPC_target = UnitName("target")
  local npc =	ma_NPC_guidbutton:GetText()
  WoWPrimeAdminPanel:ChatMsg(".wp add "..npc)
  --WoWPrimeAdminPanel:Way_Point_Add_Start_Write(1)
end

function WoWPrimeAdminPanelCommands.WayModifyAdd()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".wp modify add")
end

function WoWPrimeAdminPanelCommands.WayModifyDel()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".wp modify del")
end

function WoWPrimeAdminPanelCommands.NPCAdd_WayShowOn()
  local NPC_target = UnitName("target")
  local npc =	ma_NPC_guidbutton:GetText()
  WoWPrimeAdminPanel:ChatMsg(".wp show on "..npc)
end

function WoWPrimeAdminPanelCommands.WayShowOn()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".wp show on")
end

function WoWPrimeAdminPanelCommands.WayShowOff()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".wp show off")
end

function WoWPrimeAdminPanelCommands.NPCUnFreeze_Way()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".npc set movetype way NODEL")
end

function WoWPrimeAdminPanelCommands.ShowMove()
  local NPC_target = UnitName("target")
  WoWPrimeAdminPanel:ChatMsg(".movegens")
end

function WoWPrimeAdminPanelCommands.NpcClearParams()
  ma_npccharactertarget:SetText("")
end
