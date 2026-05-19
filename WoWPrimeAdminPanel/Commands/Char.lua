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

function WoWPrimeAdminPanelCommands.ModelRotateLeft()
  ma_modelframe.rotation = ma_modelframe.rotation - 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function WoWPrimeAdminPanelCommands.ModelRotateRight()
  ma_modelframe.rotation = ma_modelframe.rotation + 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function WoWPrimeAdminPanelCommands.WoWPrimeAdminPanelModelOnUpdate(frame, elapsedTime)
  if ( ma_modelrotatelbutton:GetButtonState() == "PUSHED" ) then
    frame.rotation = frame.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( frame.rotation < 0 ) then
      frame.rotation = frame.rotation + (2 * PI)
    end
    frame:SetRotation(frame.rotation);
  end
  if ( ma_modelrotaterbutton:GetButtonState() == "PUSHED" ) then
    frame.rotation = frame.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( frame.rotation > (2 * PI) ) then
      frame.rotation = frame.rotation - (2 * PI)
    end
    frame:SetRotation(frame.rotation);
  end
end

function WoWPrimeAdminPanelCommands.InitModelFrame()
  ma_modelframe:SetScript("OnUpdate", function(self, elapsed) WoWPrimeAdminPanelCommands.WoWPrimeAdminPanelModelOnUpdate(self, elapsed) end)
  ma_modelframe.rotation = 0.61;
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  ma_modelframe:SetUnit("player")

end

function WoWPrimeAdminPanelCommands.ModelChanged()
  if not ma_modelframe then return end
  if not WoWPrimeAdminPanel:Selection("none") then
    ma_modelframe:SetUnit("target")
  else
    ma_modelframe:SetUnit("player")
  end
  ma_modelframe:RefreshUnit()
end

function WoWPrimeAdminPanelCommands.RevivePlayer()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".revive")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.SavePlayer()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".save")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.KickPlayer()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".kick")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.Cooldown()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".cooldown")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.ShowGUID()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".guid")
end

function WoWPrimeAdminPanelCommands.Pinfo()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".pinfo")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.Distance()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".distance")
end

function WoWPrimeAdminPanelCommands.Recall()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".recall")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.Demorph()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".morph reset")
end

function WoWPrimeAdminPanelCommands.GPS()
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".gps")
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.LearnSpell(value, state)
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    if type(value) == "string" then
      if value == "all" then
        WoWPrimeAdminPanel:ChatMsg(".learn all")
      elseif value == "all_crafts" then
        WoWPrimeAdminPanel:ChatMsg(".learn all crafts")
      elseif value == "all_default" then
        WoWPrimeAdminPanel:ChatMsg(".learn all default")
      elseif value == "all_gm" then
        WoWPrimeAdminPanel:ChatMsg(".learn all gm")
      elseif value == "all_lang" then
        WoWPrimeAdminPanel:ChatMsg(".learn all lang")
      elseif value == "all_myclass" then
        WoWPrimeAdminPanel:ChatMsg(".learn all my class")
      elseif value == "all_mypettalents" then
        WoWPrimeAdminPanel:ChatMsg(".learn all my pettalents")
      elseif value == "all_myspells" then
        WoWPrimeAdminPanel:ChatMsg(".learn all my spells")
      elseif value == "all_mytalents" then
        WoWPrimeAdminPanel:ChatMsg(".learn all my talents")
      elseif value == "all_recipes_alchemy" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes alchemy")
      elseif value == "all_recipes_blacksmithing" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes blacksmithing")
      elseif value == "all_recipes_cooking" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes cooking")
      elseif value == "all_recipes_enchanting" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes enchanting")
      elseif value == "all_recipes_engineering" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes engineering")
      elseif value == "all_recipes_firstaid" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes firstaid")
      elseif value == "all_recipes_inscription" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes inscription")
      elseif value == "all_recipes_jewelcrafting" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes jewelcrafting")
      elseif value == "all_recipes_leatherworking" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes leatherworking")
      elseif value == "all_recipes_tailoring" then
        WoWPrimeAdminPanel:ChatMsg(".learn all recipes tailoring")
      else
        WoWPrimeAdminPanel:ChatMsg(".learn "..value)
      end
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        WoWPrimeAdminPanel:ChatMsg(".learn "..v)
      end
    end
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.Modify(case, value)
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    if case == "money" then
      WoWPrimeAdminPanel:ChatMsg(".modify money "..value)
    elseif case == "levelup" then
      WoWPrimeAdminPanel:ChatMsg(".levelup "..value)
    elseif case == "leveldown" then
      WoWPrimeAdminPanel:ChatMsg(".levelup "..(-value))
    elseif case == "energy" then
      WoWPrimeAdminPanel:ChatMsg(".modify energy "..value)
    elseif case == "rage" then
      WoWPrimeAdminPanel:ChatMsg(".modify rage "..value)
    elseif case == "health" then
      WoWPrimeAdminPanel:ChatMsg(".modify hp "..value)
    elseif case == "mana" then
      WoWPrimeAdminPanel:ChatMsg(".modify mana "..value)
    elseif case == "aspeed" then
      WoWPrimeAdminPanel:ChatMsg(".modify speed all "..value)
    elseif case == "arena" then
      WoWPrimeAdminPanel:ChatMsg(".modify arena "..value)
    elseif case == "bwalk" then
      WoWPrimeAdminPanel:ChatMsg(".modify speed backwalk "..value)
    elseif case == "drunk" then
      WoWPrimeAdminPanel:ChatMsg(".modify drunk "..value)
    elseif case == "fly" then
      WoWPrimeAdminPanel:ChatMsg(".modify speed fly "..value)
    elseif case == "gender" then
      WoWPrimeAdminPanel:ChatMsg(".modify gender "..value)
    elseif case == "honor" then
      WoWPrimeAdminPanel:ChatMsg(".modify honor "..value)
    elseif case == "mount" then
      WoWPrimeAdminPanel:ChatMsg(".modify mount "..value)
    elseif case == "phase" then
      WoWPrimeAdminPanel:ChatMsg(".modify phase "..value)
    elseif case == "runicpower" then
      WoWPrimeAdminPanel:ChatMsg(".modify runicpower "..value)
    elseif case == "speed" then
      WoWPrimeAdminPanel:ChatMsg(".modify speed walk "..value)
    elseif case == "standstate" then
      WoWPrimeAdminPanel:ChatMsg(".modify standstate "..value)
    elseif case == "swim" then
      WoWPrimeAdminPanel:ChatMsg(".modify speed swim "..value)
    elseif case == "tp" then
      WoWPrimeAdminPanel:ChatMsg(".modify talentpoints "..value)
    end
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

function WoWPrimeAdminPanelCommands.Reset(value)
  if WoWPrimeAdminPanel:Selection("player") or WoWPrimeAdminPanel:Selection("self") or WoWPrimeAdminPanel:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".reset "..value.." "..player)
  else
    WoWPrimeAdminPanel:Print(Locale["selectionerror1"])
  end
end

  -- LEARN LANG
function WoWPrimeAdminPanelCommands.LearnDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_AllCrafts"],"all_crafts"},
      {Locale["ma_AllDefault"],"all_default"},
      {Locale["ma_AllGMSpells"],"all_gm"},
      {Locale["ma_AllLang"],"all_lang"},
      {Locale["ma_AllMyClass"],"all_myclass"},
      {Locale["ma_AllMyPetTalents"],"all_mypettalents"},
      {Locale["ma_AllMySpells"],"all_myspells"},
      {Locale["ma_AllMyTalents"],"all_mytalents"},
      {Locale["ma_AllRecipesAlchemy"],"all_recipes_alchemy"},
      {Locale["ma_AllRecipesBlacksmithing"],"all_recipes_blacksmithing"},
      {Locale["ma_AllRecipesCooking"],"all_recipes_cooking"},
      {Locale["ma_AllRecipesEnchanting"],"all_recipes_enchanting"},
      {Locale["ma_AllRecipesEngineering"],"all_recipes_engineering"},
      {Locale["ma_AllRecipesFirstAid"],"all_recipes_firstaid"},
      {Locale["ma_AllRecipesInscription"],"all_recipes_inscription"},
      {Locale["ma_AllRecipesJewelcrafting"],"all_recipes_jewelcrafting"},
      {Locale["ma_AllRecipesLeatherworking"],"all_recipes_leatherworking"},
      {Locale["ma_AllRecipesTailoring"],"all_recipes_tailoring"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_learnlangdropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

  -- MODIFY
function WoWPrimeAdminPanelCommands.ModifyDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_AllSpeeds"],"aspeed"},
      {Locale["ma_Arena"],"arena"},
      {Locale["ma_BackWalk"],"bwalk"},
      {Locale["ma_Drunk"],"drunk"},
      {Locale["ma_Energy"],"energy"},
      {Locale["ma_FlySpeed"],"fly"},
      {Locale["ma_Gender"],"gender"},
      {Locale["ma_Healthpoints"],"health"},
      {Locale["ma_Honor"],"honor"},
      {Locale["ma_LevelUp"],"levelup"},
      {Locale["ma_LevelDown"],"leveldown"},
      {Locale["ma_Mana"],"mana"},
      {Locale["ma_Money"],"money"},
      {Locale["ma_MountSpeed"],"mount"},
      {Locale["ma_Phase"],"phase"},
      {Locale["ma_Rage"],"rage"},
      {Locale["ma_RunicPower"],"runicpower"},
      {Locale["ma_Speed"],"speed"},
      {Locale["ma_StandState"],"standstate"},
      {Locale["ma_SwimSpeed"],"swim"},
      {Locale["ma_TalentPoints"],"tp"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_modifydropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_modifydropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

  -- RESET
function WoWPrimeAdminPanelCommands.ResetDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_Honor"],"honor"},
      {Locale["ma_Level"],"level"},
      {Locale["ma_Spells"],"spells"},
      {Locale["ma_Stats"],"stats"},
      {Locale["ma_Talents"],"talents"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_resetdropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_resetdropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

  -- BAN TYPE
function WoWPrimeAdminPanelCommands.BanDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_BanAccount"],"account"},
      {Locale["ma_BanCharacter"],"character"},
      {Locale["ma_BanIP"],"ip"},
      {Locale["ma_BanPlayerAcct"],"playeraccount"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_bandropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_bandropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

function WoWPrimeAdminPanelCommands.CharModelZoomIn()
    ma_modelframe:SetCamera(0)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function WoWPrimeAdminPanelCommands.CharModelZoomOut()
    ma_modelframe:SetCamera(1)
    ma_modelframe:RefreshUnit()
   -- ma_modelframe:SetCamera(2)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() * .5)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()
end

function WoWPrimeAdminPanelCommands.CharBindSight()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".bindsight")
end

function WoWPrimeAdminPanelCommands.CharUnBindSight()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".unbindsight")
end

function WoWPrimeAdminPanelCommands.CharRename()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".character rename")
end

function WoWPrimeAdminPanelCommands.CharCustomize()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".character customize")
end

function WoWPrimeAdminPanelCommands.CharChangeRace()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".character changerace")
end

function WoWPrimeAdminPanelCommands.CharChangeFaction()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".character changefaction")
end

function WoWPrimeAdminPanelCommands.CharCombatStop()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".combatstop")
end

function WoWPrimeAdminPanelCommands.CharMaxSkill()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".maxskill")
end

function WoWPrimeAdminPanelCommands.CharFreeze()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".freeze")
end

function WoWPrimeAdminPanelCommands.CharUnFreeze()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".unfreeze")
end

function WoWPrimeAdminPanelCommands.CharListDeleted()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".character deleted list")
end

function WoWPrimeAdminPanelCommands.CharDeletedRestore()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".character deleted restore "..cname)
end

function WoWPrimeAdminPanelCommands.CharPossess()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".possess")
end

function WoWPrimeAdminPanelCommands.CharUnPossess()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".unpossess")
end

function WoWPrimeAdminPanelCommands.CharRecall()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".recall")
end

function WoWPrimeAdminPanelCommands.CharRepair()
    local player = UnitName("target") or UnitName("player")
    WoWPrimeAdminPanel:ChatMsg(".gear repair")
end

function WoWPrimeAdminPanelCommands.BanButton(bantype)
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".ban "..bantype.." "..cname)

end

function WoWPrimeAdminPanelCommands.GoNameButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".appear "..cname)

end

function WoWPrimeAdminPanelCommands.CreateGuildButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".guild create "..cname)

end

function WoWPrimeAdminPanelCommands.BanInfoButton(bantype)
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".baninfo "..bantype.." "..cname)

end

function WoWPrimeAdminPanelCommands.GroupGoButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".groupsummon "..cname)

end

function WoWPrimeAdminPanelCommands.GuildInviteButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".guild invite "..cname)

end

function WoWPrimeAdminPanelCommands.BanlistButton(bantype)
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".banlist "..bantype.." "..cname)

end

function WoWPrimeAdminPanelCommands.NameGoButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".summon "..cname)

end

function WoWPrimeAdminPanelCommands.GuildRankButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".guild rank "..cname)

end

function WoWPrimeAdminPanelCommands.TeleGroupButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".tele group "..cname)

end

function WoWPrimeAdminPanelCommands.UnBanButton(bantype)
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".unban "..bantype.." "..cname)

end

function WoWPrimeAdminPanelCommands.GuildDeleteButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".guild delete "..cname)

end

function WoWPrimeAdminPanelCommands.GuildUninviteButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".guild uninvite "..cname)

end

function WoWPrimeAdminPanelCommands.TeleNameButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".tele name "..cname)

end

function WoWPrimeAdminPanelCommands.MuteButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".mute "..cname)

end

function WoWPrimeAdminPanelCommands.CharMorphButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".modify morph "..cname)

end

function WoWPrimeAdminPanelCommands.CharAuraButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".aura "..cname)

end

function WoWPrimeAdminPanelCommands.CharUnAuraButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".unaura "..cname)

end

function WoWPrimeAdminPanelCommands.JailA()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".tele name "..cname.." ma_AllianceJail")
    WoWPrimeAdminPanel:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function WoWPrimeAdminPanelCommands.JailH()
    local cname = ma_charactertarget:GetText()
    --self:ChatMsg("Selected "..cname)
    WoWPrimeAdminPanel:ChatMsg(".tele name "..cname.." ma_HordeJail")
    WoWPrimeAdminPanel:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function WoWPrimeAdminPanelCommands.UnJail()
    local cname = ma_charactertarget:GetText()
    WoWPrimeAdminPanel:ChatMsg(".recall "..cname)
    WoWPrimeAdminPanel:ChatMsg(".notify "..cname.." has been pardoned and released from jail.")
end

function WoWPrimeAdminPanelCommands.UnMuteButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".unmute "..cname)

end

function WoWPrimeAdminPanelCommands.DamageButton ()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".damage "..cname)

end

function WoWPrimeAdminPanelCommands.HideAreaButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".hidearea "..cname)
end

function WoWPrimeAdminPanelCommands.ShowAreaButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".showarea "..cname)
end

function WoWPrimeAdminPanelCommands.CheckBagButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".character check bag "..cname)
end

function WoWPrimeAdminPanelCommands.CheckProfessionButton()
  local cname = ma_charactertarget:GetText()
  WoWPrimeAdminPanel:ChatMsg(".character check profession "..cname)
end

function WoWPrimeAdminPanelCommands.CharClearParams()
  ma_charactertarget:SetText("")
end
