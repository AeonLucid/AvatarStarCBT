require("lobby/battleGame.lua")
require("lobby/sociality.lua")
Gui.Clear(gui)
local state = ptr_cast(game.CurrentState)

function gui.EventSizeChanged(sender, e)
  NewLead.ui.Anti_addiction.Size = Vector2(gui.Size.x, 30)
  ComFuc.locationChanged = (gui.Size.x - 1200) / 2
  local index = Lobby.mainBtnPushDown
  if index < 1 or 9 < index then
    index = 2
  end
  Lobby.ui.down_light.Location = Lobby.ligLc[index] + Vector2(ComFuc.locationChanged, 0)
  Lobby.AlignUI()
  if NewLead.leadVisible and NewLead.leadFuc then
    NewLead.leadFuc(NewLead.leadA, NewLead.leadB, NewLead.leadT, NewLead.leadD, true)
  end
  if Lobby.mainBtnPushDown == 9 then
    LuckDraw.SetHeadPosxy()
  end
end

function state.EventLeave()
  Guild.TimerRemove()
  Lobby.Hide()
  Setting.Hide()
  state.EventLeave = nil
  gui.EventSizeChanged = nil
  gui.EventEscPressed = nil
  ModalWindow.CloseAll()
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

function state.EventInitUI()
  EscMenu.InitEscMenu(3)
  gui.EventEscPressed = EscMenu.SwitchEscMenu
  Lobby.Show()
  Lobby.OnEnterLobby()
end

function state.EventRestoreUI()
  EscMenu.InitEscMenu(3)
  gui.EventEscPressed = EscMenu.SwitchEscMenu
  Lobby.Show()
  Lobby.OnRestoreLobby()
end

function state.EventUpdateLevelList()
  CreateRoom.UpdateLevelList()
end

function state.EventOnGuild(sender, e)
  local msg = ""
  if e.errId > 0 and e.errId < 2000 then
    if e.errId == 2 then
      msg = e.c_name .. "\210\209\190\173\211\208\185\171\187\225"
    elseif e.errId == 3 then
      msg = "\196\227\195\187\211\208\209\251\199\235\200\168\207\222"
    elseif e.errId == 1001 then
      msg = e.c_name .. "\178\187\212\218\207\223"
    elseif e.errId == 1002 then
      msg = "\196\227\178\187\196\220\209\251\199\235\215\212\188\186"
    elseif e.errId == 1003 then
      msg = e.c_name .. "\213\253\212\218\211\206\207\183\214\208"
    elseif e.errId == 1004 then
      msg = "\209\251\199\235\188\211\200\235\185\171\187\225\202\167\176\220"
    elseif e.errId == 1006 then
      msg = "\207\242" .. e.c_name .. "\181\196\185\171\187\225\209\251\199\235\210\209\183\162\203\205"
    else
      msg = "\178\187\195\247\212\173\210\242\180\237\206\243"
    end
    MessageBox.ShowError(msg)
  elseif e.errId == 2000 then
    msg = e.c_name .. "\209\251\199\235\196\227\188\211\200\235" .. e.guild_name .. "\185\171\187\225"
    local tid = e.from_cid
    MessageBox.ShowWithTwoButtons(msg, GetUTF8Text("button_common_Accept"), GetUTF8Text("button_common_Decline"), function()
      state:JoinGuild(tid)
      SelectCharacter.isHaveGuild = "Y"
    end, function()
      state:RefuseGuild(tid)
    end)
  elseif e.errId == 2500 then
    msg = e.c_name .. "\190\220\190\248\193\203\196\227\181\196\209\251\199\235"
    MessageBox.ShowError(msg)
  elseif e.errId >= 3000 and e.errId < 4000 then
    Guild.UpdateAllInfo()
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

Lobby.ESCPressed = EscMenu.SwitchEscMenu
NewLead.ui.Anti_addiction.Parent = gui
if game.online_time > 0 and ComFuc.isFromGame then
  e = {}
  e.errId = 1000
  e.online_time = game.online_time
  NewLead.ShowAntiAddiction(e)
  ComFuc.isFromGame = false
end
