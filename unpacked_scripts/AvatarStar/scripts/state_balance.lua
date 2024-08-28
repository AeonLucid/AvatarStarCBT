require("game_balance.lua")
Gui.Clear(gui)
local state = ptr_cast(game.CurrentState, "Client.StateBalance")

function gui.EventSizeChanged(sender, e)
  ComFuc.locationChanged = (sender.Size.x - 1200) / 2
  Balance.AlignUI()
end

function state.EventLeave()
  state.EventLeave = nil
  state.EventServerCmd = nil
  Balance.Hide()
  Lobby.AlignUI()
  gui.EventSizeChanged = nil
  ModalWindow.CloseAll()
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

function Init()
  state.EventServerCmd = PushCmd.OnServerCmd
  Balance.Show()
  if game.online_time > 0 then
    e = {}
    e.errId = 1000
    e.online_time = game.online_time
    NewLead.ShowAntiAddiction(e)
  end
  ComFuc.isFromGame = false
end

if state then
  if state.StageClear then
    Init()
  else
    state:Quit()
  end
end
