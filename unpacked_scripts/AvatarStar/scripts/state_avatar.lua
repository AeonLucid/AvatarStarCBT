require("avatar.lua")
Gui.Clear(gui)
local state = ptr_cast(game.CurrentState)

function gui.EventSizeChanged(sender, e)
  NewLead.ui.Anti_addiction.Size = Vector2(gui.Size.x, 30)
  ComFuc.locationChanged = (gui.Size.x - 1200) / 2
  Lobby.ui.down_light.Location = Lobby.ligLc[6] + Vector2(ComFuc.locationChanged, 0)
  Avatar.AlignUI()
  if NewLead.leadVisible and NewLead.leadFuc then
    NewLead.leadFuc(NewLead.leadA, NewLead.leadB, NewLead.leadT, NewLead.leadD, true)
  end
end

function state.EventLeave()
  Avatar.Hide()
  gui.EventSizeChanged = nil
  state.EventLeave = nil
  gui.EventEscPressed = nil
  ModalWindow.CloseAll()
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

function state.EventOnGuild(sender, e)
  local msg = ""
  if e.errId == 2000 then
    msg = e.c_name .. "\209\251\199\235\196\227\188\211\200\235" .. e.guild_name .. "\185\171\187\225"
    local tid = e.from_cid
    MessageBox.ShowWithTwoButtons(msg, GetUTF8Text("button_common_Accept"), GetUTF8Text("button_common_Decline"), function()
      state:JoinGuild(tid)
      SelectCharacter.isHaveGuild = "Y"
    end, function()
      state:RefuseGuild(tid)
    end)
  elseif e.errId == 2500 then
    msg = e.c_nme .. "\190\220\190\248\193\203\196\227\181\196\209\251\199\235"
    MessageBox.ShowError(msg)
  elseif e.errId >= 3000 and e.errId < 4000 then
    if e.errId == 3001 then
      msg = "\188\211\200\235" .. e.guild_name .. "\185\171\187\225\202\167\176\220"
    elseif e.errId == 3002 then
      msg = "\196\227\210\209\188\211\200\235" .. e.guild_name .. "\185\171\187\225"
    else
      msg = "\178\187\195\247\212\173\210\242\180\237\206\243"
    end
    MessageBox.ShowError(msg)
  end
end

function state.EventOnUserAnti(sender, e)
  NewLead.ShowAntiAddiction(e)
end

EscMenu.InitEscMenu(4)
gui.EventEscPressed = EscMenu.SwitchEscMenu
Avatar.ESCPressed = EscMenu.SwitchEscMenu
Avatar.Show()
NewLead.ui.Anti_addiction.Parent = gui
