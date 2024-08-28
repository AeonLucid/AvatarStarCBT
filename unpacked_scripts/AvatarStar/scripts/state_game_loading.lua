local Vector3 = Vector3
local Vector2 = Vector2
local state = ptr_cast(game.CurrentState)
if state then
  ComFuc.partc1:SetEnable(true)
end
local ui = Gui.Create({
  Gui.FlowLayout({
    Dock = "kDockFill",
    Align = "kAlignCenterBottom",
    Gui.Picture("background")({
      Style = "",
      BackgroundColor = ARGB(255, 0, 0, 0),
      Dock = "kDockFill",
      ForeGroundImage = Icons.GetLoadingMap(state.map_name, state.gameMode),
      KeepAspect = true
    }),
    Gui.Control({
      Size = Vector2(1100, 56),
      Margin = Vector4(0, 0, 0, 5),
      Gui.Label("Hint")({
        Size = Vector2(1100, 20),
        FontSize = 18,
        Dock = "kDockBottom",
        TextAlign = "kAlignCenterMiddle"
      })
    })
  }),
  Gui.Control("load_icon")({
    BackgroundColor = ARGB(255, 255, 255, 255),
    Size = Vector2(149, 27),
    Location = Vector2(1033, 855),
    Skin = SkinF.game_loading_001[1],
    ComFuc.LimitControl("load_icon_son", Vector2(149, 27), Vector2(0, 0), SkinF.game_loading_001[2], 255)
  })
})

function state.EventLeave()
  Gui.Clear(ui)
  if ComFuc.partc1 then
    ComFuc.partc1:SetEnable(false)
  end
  ui = nil
  state.EventLeave = nil
  state.EventProgressMove = nil
  state = nil
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

ui.load_icon_son.Size = Vector2(0, 0)

function state.EventProgressMove()
  ui.load_icon_son.Size = Vector2(149 * state.Progress, 27)
end

ui.load_icon.Parent = gui
ui.load_icon.Location = Vector2(ComFuc.locationChanged + 1033, 845)
if NewLead.ui.Anti_addiction.MissTime == 0 then
  game.online_time = 0
end
NewLead.ui.Anti_addiction.Parent = gui
