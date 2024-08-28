module("LobbyHome", package.seeall)
local ui = Gui.Create({
  Gui.SpecialCtrl("main")({
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.skin_002,
    Gui.Button("public")({
      Size = Vector2(98, 38),
      Location = Vector2(9, 11),
      Text = "\185\171\184\230"
    }),
    Gui.Button("help")({
      Size = Vector2(128, 38),
      Location = Vector2(107, 11),
      Text = "\211\206\207\183\176\239\214\250"
    }),
    Gui.TextArea("txt_area")({
      Size = Vector2(1138, 620),
      Location = Vector2(9, 55),
      Text = "WELCOME TO PROJECT GO!",
      TextColor = ARGB(255, 255, 255, 255)
    })
  })
})

function Show(winRoot)
  ui.main.Parent = winRoot
  ui.main.Size = Vector2(1156, 684)
  ui.main.Location = Vector2(0, 0)
  ui.main.IsFirst = true
  ui.main.SizeGo = 0.7
  ui.main.AlaphGo = 0
  ui.main.TimesGo = 20
  local inStream = io.open("build.log")
  if inStream then
    ui.txt_area.Text = inStream:read("*a")
    assert(inStream:close())
  end
end

function Hide()
  ui.main.Parent = nil
end
