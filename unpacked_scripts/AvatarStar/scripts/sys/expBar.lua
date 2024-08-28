module("ExpBar", package.seeall)
colw = ARGB(255, 255, 255, 255)
coly = ARGB(255, 255, 255, 0)

function ComExpBar(name, size, lc, has, need, skin1, skin2, algin, vis)
  return Gui.Control(name)({
    Size = size,
    Location = lc,
    BackgroundColor = colw,
    Skin = skin1,
    Gui.Control(name .. "_c")({
      Size = size * Vector2(has / need, 1),
      ComFuc.ComControl(nil, size, Vector2(0, 0), 255, skin2)
    }),
    ComFuc.ComLabel(name .. "_l", "   " .. has .. "/" .. need, size, Vector2(0, 0), 0, 16, coly, algin),
    ComFuc.ComLabel(nil, "EXP", Vector2(30, size.y), Vector2(size.x - 40, 0), 0, 16, colw, "kAlignCenterMiddle", nil, not vis)
  })
end

function SetExpBar(u, uc, ul, a, b)
  uc.Size = u.Size * Vector2(a / b, 1)
  ul.Text = "   " .. a .. "/" .. b
  if 2100000000 < b then
    uc.Size = u.Size
    ul.Text = "   MAX/MAX"
  end
end
