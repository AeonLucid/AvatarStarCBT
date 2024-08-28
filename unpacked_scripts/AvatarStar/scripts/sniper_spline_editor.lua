module("SnipperSplineEditor", package.seeall)
ui = Gui.Create()({
  Gui.FlowLayout("root")({
    Location = Vector2(100, 100),
    Size = Vector2(600, 500),
    BackgroundColor = ARGB(100, 0, 255, 0),
    Align = "kAlignCenterTop",
    Gui.SplineView("spline_view")({
      Size = Vector2(500, 300)
    }),
    Gui.Button({
      Size = Vector2(200, 90)
    })
  })
})

function Show(parent_win)
  ui.root.Parent = parent_win
end

function Hide()
  ui.root.Parent = nil
end

Show(gui)
ui.spline_view.Spline = ptr_cast(game.Player:GetObjectBase()).shake_spline
