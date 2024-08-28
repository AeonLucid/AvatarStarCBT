require("sys/all.lua")
require("setting.lua")
require("escMenu.lua")
Setting.Init()
local state = ptr_cast(game.CurrentState)
require("login.lua")
Gui.Clear(gui)

function gui.EventSizeChanged(sender, e)
  ComFuc.locationChanged = (sender.Size.x - 1200) / 2
  Login.AlignUI()
end

function state.EventLeave()
  Setting.Hide()
  Login.Hide()
  gui.EventSizeChanged = nil
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

EscMenu.InitEscMenu(1)
ComFuc.locationChanged = (gui.Size.x - 1200) / 2
gui.EventEscPressed = EscMenu.SwitchEscMenu
Login.ESCPressed = EscMenu.SwitchEscMenu
Login.Show()
