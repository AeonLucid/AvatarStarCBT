module("ModalWindow", package.seeall)
local AllModalWindows = {}
local singletonMW

function GetNew(style, title)
  local modal_win = Gui.Create(gui)({
    Gui.ModalControl("screen")({})
  })
  if style and style == "transparent" then
    modal_win.screen.RootPanel.Style = "Gui.Control"
  else
    modal_win.screen.RootPanel.Style = "Gui.ModalWindow"
  end
  modal_win.screen.RootPanel.Size = Vector2(1200, 900)
  modal_win.root = modal_win.screen.RootPanel
  
  function modal_win.Close(isLaterRemove)
    if not isLaterRemove then
      local found = -1
      for i, v in ipairs(AllModalWindows) do
        if v == modal_win then
          found = i
        end
      end
      if 0 < found then
        table.remove(AllModalWindows, found)
      end
    end
    modal_win.root:Close()
  end
  
  table.insert(AllModalWindows, modal_win)
  return modal_win
end

function Close()
  if singletonMW then
    singletonMW.Close()
    singletonMW = nil
  end
end

function CloseAll()
  Close()
  while 0 < #AllModalWindows do
    AllModalWindows[1].Close(true)
    table.remove(AllModalWindows, 1)
  end
end

function Show(style, title)
  Close()
  singletonMW = GetNew(style, title)
  return singletonMW
end
