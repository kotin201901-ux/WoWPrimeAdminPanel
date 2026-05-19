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

function WoWPrimeAdminPanelCommands.Announce(value)
  WoWPrimeAdminPanel:ChatMsg(".announce "..value)
end

function WoWPrimeAdminPanelCommands.Restart(value)
  if value == "" then
    WoWPrimeAdminPanel:Print(Locale["msg_restart_time_required"])
    return
  end

  local confirmMsg = string.format(Locale["msg_restart_confirm"], value)

  WoWPrimeAdminPanel:ShowConfirmDialog(confirmMsg, function()
    WoWPrimeAdminPanelCommands.Restart_Confirmed(value)
  end)
end

function WoWPrimeAdminPanelCommands.Restart_Confirmed(value)
  WoWPrimeAdminPanel:ChatMsg(".server restart "..value)
  ma_restartbutton:Disable()
  ma_shutdownbutton:Disable()
  ma_shutdowneditbox:ClearFocus()
  ma_shutdowneditbox:EnableMouse(false)
  ma_shutdowneditbox:EnableKeyboard(false)
  ma_cancelshutdownbutton:Show()
  WoWPrimeAdminPanel.db.char.serverRestartState = "restart"
end

function WoWPrimeAdminPanelCommands.Shutdown(value)
  if value == "" then
    WoWPrimeAdminPanel:Print(Locale["msg_shutdown_time_required"])
    return
  end

  local confirmMsg = string.format(Locale["msg_shutdown_confirm"], value)

  WoWPrimeAdminPanel:ShowConfirmDialog(confirmMsg, function()
    WoWPrimeAdminPanelCommands.Shutdown_Confirmed(value)
  end)
end

function WoWPrimeAdminPanelCommands.Shutdown_Confirmed(value)
  WoWPrimeAdminPanel:ChatMsg(".server shutdown "..value)
  ma_restartbutton:Disable()
  ma_shutdownbutton:Disable()
  ma_shutdowneditbox:ClearFocus()
  ma_shutdowneditbox:EnableMouse(false)
  ma_shutdowneditbox:EnableKeyboard(false)
  ma_cancelshutdownbutton:Show()
  WoWPrimeAdminPanel.db.char.serverRestartState = "shutdown"
end

function WoWPrimeAdminPanelCommands.CancelShutdown()
  WoWPrimeAdminPanel:ChatMsg(".server shutdown cancel")
  ma_cancelshutdownbutton:Hide()
  ma_restartbutton:Enable()
  ma_shutdownbutton:Enable()
  ma_shutdowneditbox:EnableMouse(true)
  ma_shutdowneditbox:EnableKeyboard(true)
  WoWPrimeAdminPanel.db.char.serverRestartState = nil
end

function WoWPrimeAdminPanelCommands.ReloadTable(tablename)
  if tablename ~= "" then
    WoWPrimeAdminPanel:ChatMsg(".reload "..tablename)
  end
end

function WoWPrimeAdminPanelCommands.ReloadScripts()
  WoWPrimeAdminPanel:ChatMsg(".reload smart_scripts")
end
