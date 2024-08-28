module("MessageBox", package.seeall)
local wmbHolder, message_box
local uiS = Vector2(560, 178)
local icon_ok = Gui.Icon("ui/skinF/skin_button_icon_ok.tga", Vector4(0, 0, 0, 0))
local icon_cancel, GetStandardMB = Gui.Icon("ui/skinF/skin_button_icon_cancel.tga", Vector4(0, 0, 0, 0)), "ui/skinF/skin_button_icon_cancel.tga"
local GetStandardMB, AddButton = function(message, time)
  message_box = Gui.Create({
    Gui.Control("panel")({
      Size = Vector2(480, 160),
      Dock = "kDockFill",
      Padding = Vector4(5, 5, 5, 0),
      Gui.FlowLayout("button_area")({
        Size = Vector2(0, 46),
        Dock = "kDockBottom",
        Align = "kAlignRightMiddle",
        ControlAlign = "kAlignRightMiddle",
        ControlSpace = 6
      }),
      Gui.Label("proportion_area")({
        Size = Vector2(2, 8),
        Dock = "kDockBottom"
      }),
      Gui.Label({
        Style = "MessageBoxStyle.Text",
        Text = message
      })
    })
  })
  local modalwin = ModalWindow.GetNew()
  modalwin.screen.AllowEscToExit = false
  modalwin.root.Size = uiS
  message_box.panel.Parent = modalwin.root
  message_box.root = modalwin.root
  
  function message_box.Close()
    modalwin.Close()
  end
  
  if time and 0 < tonumber(time) then
    message_box.button_area.Size = Vector2(0, 0)
    message_box.root.Timer = time
  end
  return message_box
end, Vector4(0, 0, 0, 0)

function AddButton(button, clicked, style, icon)
  if message_box then
    local button_control
    if type(button) == "string" then
      button_control = ptr_new("Gui.Button")
      button_control.Style = style or "MessageBoxStyle.Button"
      button_control.Parent = message_box.button_area
      button_control.EventClick = clicked
      button_control.ClickAudio = "button"
      if icon then
        button_icon = ptr_new("Gui.Label")
        button_icon.Style = "Gui.Label"
        button_icon.Dock = "kDockFill"
        button_icon.Margin = Vector4(6, 0, 0, 0)
        button_icon.Text = button
        button_icon.TextAlign = "kAlignLeftMiddle"
        button_icon.Icon = icon
        button_icon.Parent = button_control
        button_icon.BackgroundColor = ARGB(0, 0, 0, 0)
        button_icon.FontSize = 16
      else
        button_control.Text = button
      end
      return button_control
    end
  end
end

function ShowWithTwoButtons(message, strA, strB, clickedA, clickedB, styleA, styleB, iconA, iconB)
  gui:PlayAudio("prompt")
  local tempMB = GetStandardMB(message)
  local btn_a, btn_b
  if strA then
    btn_a = AddButton(strA, function()
      if clickedA then
        clickedA()
      end
      if tempMB.root then
        tempMB.Close()
      end
    end, styleA, iconA)
  end
  if strB then
    btn_b = AddButton(strB, function()
      if clickedB then
        clickedB()
      end
      if tempMB.root then
        tempMB.Close()
      end
    end, styleB, iconB)
  end
  if btn_a then
    btn_a.Focused = true
  elseif btn_b then
    btn_b.Focused = true
  else
    tempMB.panel.Focused = true
  end
  return tempMB
end

function ShowWithConfirmCancel(message, clickedA, clickedB)
  ShowWithTwoButtons(message, GetUTF8Text("button_common_OK"), GetUTF8Text("button_common_Cancel"), clickedA, clickedB, nil, nil, icon_ok, icon_cancel)
end

function Show(message, button, clicked, time)
  gui:PlayAudio("prompt")
  local tempMB = GetStandardMB(message, time)
  local btn_a
  if button then
    btn_a = AddButton(button, function()
      if clicked then
        clicked()
      end
      if tempMB.root then
        tempMB.Close()
      end
    end)
  end
  if btn_a then
    btn_a.Focused = true
  else
    tempMB.panel.Focused = true
  end
  return tempMB
end

function ShowError(err, time)
  Show(tostring(err), nil, nil, tonumber(time) or 1)
end

function CloseWaiter()
  if wmbHolder then
    wmbHolder.Close()
    wmbHolder = nil
  end
end

function ShowWaiter(msg)
  CloseWaiter()
  wmbHolder = Show(msg)
  wmbHolder.button_area.Size = Vector2(0, 0)
end
