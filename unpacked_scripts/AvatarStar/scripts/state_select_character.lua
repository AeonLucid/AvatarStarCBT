require("sys/newLead.lua")
require("select_character.lua")
Gui.Clear(gui)
local state = ptr_cast(game.CurrentState)

function gui.EventSizeChanged(sender, e)
  NewLead.ui.Anti_addiction.Size = Vector2(gui.Size.x, 30)
  ComFuc.locationChanged = (sender.Size.x - 1200) / 2
  SelectCharacter.AlignUI()
  if NewLead.leadVisible and NewLead.leadFuc then
    NewLead.leadFuc(NewLead.leadA, NewLead.leadB, NewLead.leadT, NewLead.leadD, true)
  end
end

function state.EventLeave()
  SelectCharacter.Hide()
  gui.EventSizeChanged = nil
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

function state.EventOnUserAnti(sender, e)
  NewLead.ShowAntiAddiction(e)
end

EscMenu.InitEscMenu()
gui.EventEscPressed = EscMenu.SwitchEscMenu
SelectCharacter.ESCPressed = EscMenu.SwitchEscMenu
SelectCharacter.Show()
NewLead.ui.Anti_addiction.Parent = gui
