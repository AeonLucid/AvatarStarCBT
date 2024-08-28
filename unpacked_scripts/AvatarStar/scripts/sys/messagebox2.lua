module("MessageBox2", package.seeall)

function GetStandardMB(message, time)
  message_box = Gui.Create({
    Gui.TopmostWindow("panel")({
      Size = Vector2(480, 160),
      Dock = "kDockCenter",
      BackgroundColor = ARGB(255, 255, 0, 0),
      Moveable = false,
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
  local modalwin = ModalWindow.GetNew("transparent")
  modalwin.screen.AllowEscToExit = false
  message_box.panel.Parent = gui
  message_box.modalwin = modalwin
  local spline = ptr_new("Core.PdeSplineF32")
  spline:AddPoint(0.01, 0, 0, 0, 2)
  spline:AddPoint(0.15, 2, 0, 0, 2)
  spline:AddPoint(0.19, 1.5, 0, 0, 2)
  spline:AddPoint(0.23, 1, 0, 0, 2)
  message_box.spline = spline
  local time_step = 0.03
  local timer = game.TimerMgr:AddTimer(time_step)
  local message_box_time = 0
  
  function timer.EventOnTimer(sender, e)
    message_box_time = message_box_time + time_step
    local value = spline:GetSplineValue(message_box_time)
    message_box.panel.WorldScale = Vector3(value, value, value)
    if 1 <= message_box_time then
      game.TimerMgr:RemoveTimer(timer)
    end
  end
  
  message_box.timer = timer
  
  function message_box.Close()
    message_box.panel.Parent = nil
    modalwin.Close()
    game.TimerMgr:RemoveTimer(timer)
  end
  
  if time and 0 < tonumber(time) then
    print("aaa")
    
    function message_box.modalwin.root.EventTimeUp(sender, e)
      message_box.Close()
    end
    
    message_box.modalwin.root.Timer = time
  end
  return message_box
end
