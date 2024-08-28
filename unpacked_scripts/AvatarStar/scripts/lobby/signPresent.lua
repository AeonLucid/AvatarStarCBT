module("SignPresent", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colh = ARGB(100, 255, 255, 255)
colw = ARGB(255, 255, 255, 255)
colbl = ARGB(255, 75, 75, 75)
local colv, ComDate = ARGB(255, 176, 53, 2), ARGB(255, 176, 53, 2)
local ComDate, ComCB = function(i)
  return Gui.Control("date_" .. i)({
    Size = Vector2(44, 38),
    Location = ComFuc.ComputLocation(i, -30, 63, 7, 44, 38),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.signPresent_006,
    ComFuc.ComLabel("date_lab_" .. i, i, Vector2(44, 38), Vector2(0, 0), 0, 16, colw, "kAlignCenterMiddle"),
    ComFuc.ComControl("date_ctl_" .. i, Vector2(44, 38), Vector2(0, 0), 255, SkinF.signPresent_007)
  })
end, 255
local ComCB, ComSignBar = function(name, lc, text)
  return Gui.Control(name)({
    Size = Vector2(64, 64),
    Location = lc,
    ComFuc.ComControl(name .. "_lev", Vector2(64, 64), Vector2(0, 0), 255, SkinF.personalInfo_quality[1]),
    ComFuc.ComControl(name .. "_res", Vector2(64, 64), Vector2(0, 0), 255, SkinF.skin_touming),
    ComFuc.ComLabel(name .. "_count", text, Vector2(36, 18), Vector2(27, 43), 0, 0, colw, "kAlignRightMiddle", 0, true, SkinF.hecheng_number_1)
  })
end, 176

function ComSignBar(i, t, m)
  return Gui.Control({
    Size = Vector2(320, 70),
    Location = Vector2(8, -38 + 74 * i),
    BackgroundColor = colw,
    Skin = SkinF.signPresent_004,
    ComCB("goods_" .. i .. "_1", Vector2(76, 3), 10),
    ComCB("goods_" .. i .. "_2", Vector2(142, 3), 20),
    ComFuc.ComControl("state_sign", Vector2(58, 60), Vector2(6, 5), 255, SkinF.signPresent_005[(i + 2) % 3 + 1]),
    ComFuc.ComLabel(nil, t .. "\204\236", Vector2(58, 60), Vector2(6, 5), 0, 16, colbl, "kAlignCenterMiddle"),
    ComFuc.ComLabel(nil, m .. "\188\182\191\201\193\236\200\161", Vector2(84, 20), Vector2(225, 11), 0, 14, colv, "kAlignCenterMiddle"),
    ComFuc.ComButton("btn_get_" .. i, "\193\236\200\161", Vector2(84, 40), Vector2(225, 28), 16, false, true, SkinF.personalInfo_200)
  })
end

local ui = Gui.Create()({
  ComFuc.PopControl("main", Vector2(700, 480), "\195\191\200\213\199\169\181\189", 38),
  Gui.Control("main_m")({
    Dock = "kDockFill",
    Gui.Control({
      Size = Vector2(336, 420),
      Location = Vector2(12, 4),
      BackgroundColor = colw,
      Skin = SkinF.signPresent_001,
      ComFuc.ComLabel("title_month", "2012\196\23410\212\194", Vector2(136, 20), Vector2(100, 17), 0, 16, colw, "kAlignCenterMiddle"),
      ComFuc.ComLabel(nil, "\200\213      \210\187      \182\254      \200\253      \203\196      \206\229      \193\249", Vector2(308, 38), Vector2(14, 63), 0, 16, colw, "kAlignCenterMiddle"),
      ComFuc.ComButton("btn_signP", "\199\169 \181\189      ", Vector2(124, 60), Vector2(200, 342), 18),
      ComFuc.ComControl("ctl_signP", Vector2(34, 25), Vector2(274, 360), 255, SkinF.signPresent_002),
      ComFuc.ComComplex(ComDate, 1, 42)
    }),
    Gui.Control({
      Size = Vector2(336, 78),
      Location = Vector2(352, 0),
      BackgroundColor = colw,
      Skin = SkinF.battle_005,
      ComFuc.ComLabel(nil, "\187\238\212\190\182\200", Vector2(60, 20), Vector2(16, 12), 0, 16, colbl),
      ComFuc.ComLabel(nil, "\195\191\199\169\181\189\210\187\180\206\191\201\187\241\181\1952\181\227\187\238\212\190\182\200", Vector2(260, 20), Vector2(16, 45), 0, 14, colv),
      ComFuc.ComButton("btn_getPack", "\193\236\200\161\192\241\176\252", Vector2(84, 40), Vector2(233, 35), 16, false, true, SkinF.personalInfo_200),
      ComFuc.ComProportionBar("bar_active", Vector2(234, 24), Vector2(82, 10), 100, 50, SkinF.signPresent_003)
    }),
    Gui.Control({
      Size = Vector2(336, 342),
      Location = Vector2(352, 81),
      BackgroundColor = colw,
      Skin = SkinF.battle_005,
      ComFuc.ComLabel("lab_days", "\177\190\212\194\193\172\208\248\199\169\181\189\204\236\202\253\163\18628\204\236", Vector2(300, 20), Vector2(16, 12), 0, 16, colbl),
      ComSignBar(1, 7, 5),
      ComSignBar(2, 14, 10),
      ComSignBar(3, 20, 15),
      ComSignBar(4, 25, 20)
    })
  })
})
ui.main_m.Parent = ui.main_son
ui.ctl_signP.Enable = false

function Show()
  ui.main.Parent = ModalWindow.Show("transparent").root
end

function Hide()
end
