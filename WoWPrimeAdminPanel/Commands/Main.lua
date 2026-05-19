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

function WoWPrimeAdminPanelCommands.DisplayAccountLevel()
  WoWPrimeAdminPanel:ChatMsg(".account")
end

function WoWPrimeAdminPanelCommands.ToggleGMMode(value)
  WoWPrimeAdminPanel:ChatMsg(".gm "..value)
  WoWPrimeAdminPanel:ChatMsg(".gm chat "..value)
end

function WoWPrimeAdminPanelCommands.ToggleFlyMode(value)
  local player = UnitName("target") or UnitName("player")
  WoWPrimeAdminPanel:ChatMsg(".gm fly "..value)
end

function WoWPrimeAdminPanelCommands.ToggleSpectatorMode(value)
  WoWPrimeAdminPanel:ChatMsg(".gm spectator "..value)
end

function WoWPrimeAdminPanelCommands.ToggleWhisper(value)
  WoWPrimeAdminPanel:ChatMsg(".whispers "..value)
end

function WoWPrimeAdminPanelCommands.ToggleVisible(value)
  WoWPrimeAdminPanel:ChatMsg(".gm visible "..value)
  if value == "on" then
  else
  end
end

function WoWPrimeAdminPanelCommands.ToggleCheatTaxi(value)
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".cheat taxi "..value) -- FIX 10
    if value == 1 then
    else
    end
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.KillSomething()
  local target = UnitName("target") or UnitName("player")
  WoWPrimeAdminPanel:ChatMsg(".die")
end

function WoWPrimeAdminPanelCommands.InstantKill()
  WoWPrimeAdminPanel.db.char.instantKillMode = ma_instantkillbutton:GetChecked()
end

function WoWPrimeAdminPanelCommands.ToggleInstantTeleport()
  WoWPrimeAdminPanel.db.profile.instantTeleport = ma_instantteleportbutton:GetChecked()
end

function WoWPrimeAdminPanelCommands.SetSpeed()
  local value = string.format("%.1f", ma_speedslider:GetValue())
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".mod speed all "..value)
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
    ma_speedslider:SetValue(1)
  end
end

function WoWPrimeAdminPanelCommands.SetScale()
  local value = string.format("%.1f", ma_scaleslider:GetValue())
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".modify scale "..value)
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
    ma_scaleslider:SetValue(1)
  end
end

function WoWPrimeAdminPanelCommands.Screenie()
  UIParent:Hide()
  Screenshot()
  UIParent:Show()
end

function WoWPrimeAdminPanelCommands.ShowBank()
  WoWPrimeAdminPanel:ChatMsg(".character check bank") -- FIX 10 Broken Bank button
end

function WoWPrimeAdminPanelCommands.DismountPlayer()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".dismount")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.SetJail_A()
    WoWPrimeAdminPanel:ChatMsg(".tele del ma_AllianceJail")
    WoWPrimeAdminPanel:ChatMsg(".tele add ma_AllianceJail")
end

function WoWPrimeAdminPanelCommands.SetJail_H()
    WoWPrimeAdminPanel:ChatMsg(".tele del ma_HordeJail")
    WoWPrimeAdminPanel:ChatMsg(".tele add ma_HordeJail")
end

function WoWPrimeAdminPanelCommands.GridNavigate(x, y)
  local way = WoWPrimeAdminPanel.db.char.nextGridWay
  if not x and not y then
    table.insert(WoWPrimeAdminPanel.db.char.functionQueue, "GridNavigate")
    WoWPrimeAdminPanel:ChatMsg(".gps")
  else
    local step = tonumber(ma_gridnavieditbox:GetText())
    if step then
      local newy
      local newx
      if way == "east" then  --East
        newy = y - step
        newx = x
      elseif way == "north" then --North
        newy = y
        newx = x + step
      elseif way == "south" then  --South
        newy = y
        newx = x - step
      else  --West
        newy = y + step
        newx = x
      end
      WoWPrimeAdminPanel:ChatMsg(".go xy "..newx.." "..newy)
    else
      WoWPrimeAdminPanel:Print(Locale["numbererror"])
    end
  end
end

function WoWPrimeAdminPanelCommands.ToggleChat(value)
  WoWPrimeAdminPanel:ChatMsg(".gm chat "..value)
end

function WoWPrimeAdminPanelCommands.ToggleWaterwalk(value)
  WoWPrimeAdminPanel:ChatMsg(".cheat waterwalk "..value)
end

function WoWPrimeAdminPanelCommands.ToggleCheatCastTime(value)
  WoWPrimeAdminPanel:ChatMsg(".cheat casttime "..value)
end

function WoWPrimeAdminPanelCommands.ToggleCheatCooldown(value)
  WoWPrimeAdminPanel:ChatMsg(".cheat cooldown "..value)
end

function WoWPrimeAdminPanelCommands.ToggleCheatGod(value)
  WoWPrimeAdminPanel:ChatMsg(".cheat god "..value)
end

function WoWPrimeAdminPanelCommands.ToggleCheatPower(value)
  WoWPrimeAdminPanel:ChatMsg(".cheat power "..value)
end

function WoWPrimeAdminPanelCommands.CheatStatus()
  WoWPrimeAdminPanel:ChatMsg(".cheat status")
end

function WoWPrimeAdminPanelCommands.ToggleAccountlock(value)
  local state = (value == "on") and "lock" or "unlock"
  local confirmMsg = string.format(Locale["msg_account_lock_confirm"] or "Are you sure you want to %s this account?", state)
  WoWPrimeAdminPanel:ShowConfirmDialog(confirmMsg, function()
    WoWPrimeAdminPanelCommands.ToggleAccountlock_Confirmed(value)
  end)
end

function WoWPrimeAdminPanelCommands.GMInGame()
  WoWPrimeAdminPanel:ChatMsg(".gm ingame")
end

function WoWPrimeAdminPanelCommands.GMList()
  WoWPrimeAdminPanel:ChatMsg(".gm list")
end

function WoWPrimeAdminPanelCommands.PetCreate()
  WoWPrimeAdminPanel:ChatMsg(".pet create")
end

function WoWPrimeAdminPanelCommands.PetLearn()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".pet learn "..param)
end

function WoWPrimeAdminPanelCommands.PetUnLearn()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".pet unlearn "..param)
end

function WoWPrimeAdminPanelCommands.PetTP()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".pet tp "..param)
end

function WoWPrimeAdminPanelCommands.LookupTaxi()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".lookup taxi "..param)
end

function WoWPrimeAdminPanelCommands.GoTaxiNode()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".go taxinode "..param)
end

function WoWPrimeAdminPanelCommands.GoTrigger()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".go trigger "..param)
end

function WoWPrimeAdminPanelCommands.GoXY()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".go xy "..param)
end

function WoWPrimeAdminPanelCommands.GoXYZ()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".go xyz "..param)
end

function WoWPrimeAdminPanelCommands.GoZoneXY()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".go zonexy "..param)
end

function WoWPrimeAdminPanelCommands.LookupZone()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".lookup area "..param)
end

function WoWPrimeAdminPanelCommands.Cast()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".cast "..param)
end

function WoWPrimeAdminPanelCommands.CastBack()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".cast back "..param)
end

function WoWPrimeAdminPanelCommands.CastDist()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".cast dist "..param)
end

function WoWPrimeAdminPanelCommands.CastSelf()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".cast self "..param)
end

function WoWPrimeAdminPanelCommands.CastTarget()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".cast target "..param)
end

function WoWPrimeAdminPanelCommands.ListItem()
  local param = ma_parameter:GetText()
  WoWPrimeAdminPanel:ChatMsg(".list item "..param)
end

function WoWPrimeAdminPanelCommands.GmClear()
  ma_parameter:SetText("")
end

function WoWPrimeAdminPanelCommands.AcctCreate()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  local confirmMsg = string.format(Locale["msg_acct_create_confirm"] or "Are you sure you want to create account '%s'?", param)
  WoWPrimeAdminPanel:ShowConfirmDialog(confirmMsg, function()
    WoWPrimeAdminPanelCommands.AcctCreate_Confirmed()
  end)
end

function WoWPrimeAdminPanelCommands.AcctAddon()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".account set addon "..param)
end

function WoWPrimeAdminPanelCommands.AcctGMLvl()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".account set gmlevel "..param)
end

function WoWPrimeAdminPanelCommands.AcctPasswd()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".account set password "..param)
end

function WoWPrimeAdminPanelCommands.AcctChange()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".character changeaccount "..param)
end

function WoWPrimeAdminPanelCommands.GMNotify()
  local param = ma_parameter:GetText()
  if param == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".gmnotify "..param)
end

function WoWPrimeAdminPanelCommands.TeleAddButton()
  local cname = ma_parameter:GetText()
  if cname == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  WoWPrimeAdminPanel:ChatMsg(".tele add "..cname)

end

function WoWPrimeAdminPanelCommands.TeleDelButton()
  local cname = ma_parameter:GetText()
  if cname == "" then
    WoWPrimeAdminPanel:Print("Error: Parameter cannot be empty")
    return
  end
  local confirmMsg = string.format(Locale["msg_tele_del_confirm"] or "Are you sure you want to delete teleport location '%s'?", cname)
  WoWPrimeAdminPanel:ShowConfirmDialog(confirmMsg, function()
    WoWPrimeAdminPanelCommands.TeleDelButton_Confirmed()
  end)
end

function WoWPrimeAdminPanelCommands.ResetSpeed()
    ma_speedslider:SetValue(1)
    ma_speedsliderText:SetText("Speed: 1.0")
    WoWPrimeAdminPanel:ChatMsg(".mod speed all 1")

end

function WoWPrimeAdminPanelCommands.ResetScale()
  ma_scaleslider:SetValue(1)
  ma_scalesliderText:SetText("Scale: 1.0")
  WoWPrimeAdminPanel:ChatMsg(".mod scale 1")
end
