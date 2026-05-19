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

function WoWPrimeAdminPanelCommands.ShowTicketTab()
  ma_goticketbutton:Disable()
  ma_deleteticketbutton:Disable()
  ma_answerticketbutton:Disable()
  ma_getcharticketbutton:Disable()
  ma_gocharticketbutton:Disable()
  ma_whisperticketbutton:Disable()
  ma_resetticketsbutton:Enable()
  WoWPrimeAdminPanel:InstantGroupToggle("ticket")
  WoWPrimeAdminPanelCommands.ResetTickets()
end

function WoWPrimeAdminPanelCommands.RefreshTickets()
    -- Clear existing tickets to prevent duplicates
    wipe(WoWPrimeAdminPanel.db.profile.buffer.tickets)
    WoWPrimeAdminPanel.db.profile.buffer.tickets = {}

    ma_ticketscrollframe:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset-1, 16, 16) WoWPrimeAdminPanelCommands.InlineScrollUpdate() end)
    ma_ticketscrollframe:SetScript("OnShow", function() WoWPrimeAdminPanelCommands.InlineScrollUpdate() end)
    WoWPrimeAdminPanel.db.char.requests.ticket = true
    WoWPrimeAdminPanel:ChatMsg(".ticket list")
    for i=1,12 do
       _G["ma_ticketscrollframe"..i]:Hide()
    end
    -- Don't call InlineScrollUpdate here - it will be called when server responds
end

function WoWPrimeAdminPanelCommands.ResetTickets()
    wipe(WoWPrimeAdminPanel.db.profile.buffer.tickets)
    WoWPrimeAdminPanel.db.profile.buffer.tickets = {}
    WoWPrimeAdminPanel.db.char.requests.ticket = true
    for i=1,12 do
       _G["ma_ticketscrollframe"..i]:Hide()
    end
    ma_ticketdetail:Hide();
    ma_ticketid:SetText(nil)
    ma_ticketcreatedby:SetText(nil)
    ma_tickettimecreated:SetText(nil)
    ma_goticketbutton:Disable()
    ma_deleteticketbutton:Disable()
    ma_answerticketbutton:Disable()
    ma_getcharticketbutton:Disable()
    ma_gocharticketbutton:Disable()
    ma_whisperticketbutton:Disable()
end


--[[function WoWPrimeAdminPanel:LoadTickets(number)
  self.db.char.newTicketQueue = {}
  --self.db.profile.tickets.requested = 0
  if number then
    if tonumber(number) > 0 then
      self.db.profile.tickets.count = tonumber(number)
      if self.db.char.requests.ticket then
        self:RequestTickets()
        self:SetIcon(ROOT_PATH.."Textures\\icon.tga")
        --ma_resetsearchbutton:Enable()
      end
    else
      --ma_resetsearchbutton:Disable()
      self:NoResults("ticket")
    end
  else
    self.db.char.requests.ticket = true
    self.db.profile.tickets.count = 0
    self.db.profile.buffer.tickets = {}
    --self:ChatMsg(".ticket list")
  end
  InlineScrollUpdate()
end]]

--[[function WoWPrimeAdminPanel:RequestTickets()
  self.db.char.requests.ticket = true
  local ticketCount = 0
  for _ in pairs(self.db.profile.buffer.tickets) do ticketCount = ticketCount + 1 end
  --ma_lookupresulttext:SetText(Locale["ma_TicketCount"]..count)
  ma_top2text:SetText(Locale["realm"].." "..Locale["tickets"]..self.db.profile.tickets.count)
  local tnumber = self.db.profile.tickets.count - ticketCount
  if tnumber > 0 then
    self:ChatMsg(".ticket "..tnumber)
  else
    ma_resetsearchbutton:Disable()
  end
end]]

function WoWPrimeAdminPanelCommands.Ticket(value)
  local ticket = WoWPrimeAdminPanel.db.profile.tickets.selected
  if value == "delete" then
    WoWPrimeAdminPanel:ChatMsg(".ticket close "..ma_ticketid:GetText())
    wipe(WoWPrimeAdminPanel.db.profile.buffer.tickets)
    WoWPrimeAdminPanel.db.profile.buffer.tickets={}
--    WoWPrimeAdminPanel:ChatMsg(".ticket delete"..ma_ticketid:GetText())
--    WoWPrimeAdminPanel:LogAction("Deleted ticket with number: "..ma_ticketid:GetText())
    WoWPrimeAdminPanelCommands.ShowTicketTab()
    WoWPrimeAdminPanelCommands.ResetTickets()
    --InlineScrollUpdate()
  elseif value == "gochar" then
    WoWPrimeAdminPanel:ChatMsg(".appear "..ma_ticketcreatedby:GetText())
  elseif value == "getchar" then
    WoWPrimeAdminPanel:ChatMsg(".summon "..ma_ticketcreatedby:GetText())
  elseif value == "answer" then
--    WoWPrimeAdminPanel:TogglePopup("mail", {recipient = ma_ticketcreatedby:GetText(), subject = "Ticket("..ma_ticketid:GetText()..")"})
    WoWPrimeAdminPanel:TogglePopup("mail", {recipient = ma_ticketcreatedby:GetText(), subject = "Ticket("..ma_ticketid:GetText()..")"})
--    WoWPrimeAdminPanel:TogglePopup("mail", {recipient = ma_ticketcreatedby:GetText(), subject = "Ticket("..ma_ticketid:GetText()..")", body = ma_ticketdetail:GetText()})
    ma_maileditbox:SetText(ma_ticketdetail:GetText())
  elseif value == "whisper" then
--    ChatFrameEditBox:Show()
--    ChatFrameEditBox:Insert("/w "..ma_ticketcreatedby:GetText().." ");
       local editbox = ChatFrame1EditBox
       if not editbox then
         -- Support for 3.3.5 and newer
         editbox = ChatEdit_GetActiveWindow()
       end
       ChatEdit_ActivateChat(editbox);
       if editbox then
         editbox:Insert("/w "..ma_ticketcreatedby:GetText().." ");
       end

  elseif value == "goticket" then
    WoWPrimeAdminPanel:ChatMsg(".go ticket "..ma_ticketid:GetText())
  end
end

--[[function WoWPrimeAdminPanel:ToggleTickets(value)
  WoWPrimeAdminPanel:ChatMsg(".ticket "..value)
end]]


function WoWPrimeAdminPanelCommands.InlineScrollUpdate()
    local ticketCount = 0
    for _ in pairs(WoWPrimeAdminPanel.db.profile.buffer.tickets) do ticketCount = ticketCount + 1 end
    if ticketCount > 0 then
      ma_ticketscrollframe1:SetText("Loading")
      local lineplusoffset
      local line
      ma_ticketscrollframe:Show()
      FauxScrollFrame_Update(ma_ticketscrollframe,ticketCount,12,16);
      for line = 1,12 do
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_ticketscrollframe)
        if lineplusoffset <= ticketCount then
          local object = WoWPrimeAdminPanel.db.profile.buffer.tickets[lineplusoffset]
          if object then
            _G["ma_ticketscrollframe"..line]:SetText("|cff00ff00Ticket:|r |cffffff00"..object["tNumber"].."|r  |cff00ff00Created by:|r |cffffff00"..object["tChar"].."|r")
            WoWPrimeAdminPanel.db.profile.tickets.selected = object
            _G["ma_ticketscrollframe"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
            _G["ma_ticketscrollframe"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
            _G["ma_ticketscrollframe"..line]:SetScript("OnClick", function() WoWPrimeAdminPanelCommands.ReadTicket(object["tNumber"], object["tChar"], object["tLCreate"], object["tLUpdate"], object["tMsg"]) end)
            _G["ma_ticketscrollframe"..line]:Enable()
            _G["ma_ticketscrollframe"..line]:Show()
          end
        else
          _G["ma_ticketscrollframe"..line]:Hide()
        end
      end
    else
      --WoWPrimeAdminPanel:NoResults("ticket")
    end
--  else
--  end
--WoWPrimeAdminPanel.db.profile.buffer.tickets = {}
--WoWPrimeAdminPanel.db.char.requests.ticket = false
end

function WoWPrimeAdminPanelCommands.ReadTicket(tNumber, tChar, tLCreate, tLUpdate, tMsg)
    WoWPrimeAdminPanel.db.char.requests.ticket = false
    ma_goticketbutton:Enable()
    ma_deleteticketbutton:Enable()
    ma_answerticketbutton:Enable()
    ma_getcharticketbutton:Enable()
    ma_gocharticketbutton:Enable()
    ma_whisperticketbutton:Enable()
    tNumber = string.match(tNumber, "%d+")
    WoWPrimeAdminPanel:ChatMsg(".ticket viewid "..tNumber)
    ma_ticketid:SetText(tNumber)
    ma_ticketcreatedby:SetText(tChar)
    ma_tickettimecreated:SetText(tLCreate)
    -- Set the ticket message if available, otherwise it will be set when the server responds
    if tMsg and tMsg ~= "" then
        ma_ticketdetail.originalText = tMsg
        ma_ticketdetail:SetText(tMsg)
        ma_ticketdetail:SetCursorPosition(0)
    else
        ma_ticketdetail.originalText = ""
        ma_ticketdetail:SetText("")
        ma_ticketdetail:SetCursorPosition(0)
    end
    ma_ticketdetail:ClearFocus()
    -- Scroll to top of the scroll frame
    ma_ticketdetailscrollframe:SetVerticalScroll(0)
    ma_ticketdetail:Show()
end
 
