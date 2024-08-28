module("LevelUpTipShow", package.seeall)
coly = ARGB(255, 255, 255, 0)
ui = Gui.Create()({
  Gui.Control("main")({
    Dock = "kDockCenter",
    Size = Vector2(522, 820),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.levelUpTipShow_001,
    Gui.Control("c_1")({
      Size = Vector2(466, 216),
      Location = Vector2(28, 18),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.levelUpTipShow_002,
      ComFuc.ComControl(nil, Vector2(466, 30), Vector2(0, 24), 255, SkinF.levelUpTipShow_003),
      ComFuc.ComControl("i_1", Vector2(48, 48), Vector2(10, 14), 255, SkinF.levelUpTipShow_004[1]),
      ComFuc.ComLabel("l_1", GetUTF8Text("UI_common_new_quests"), Vector2(404, 24), Vector2(62, 27), 0, 16, coly),
      Gui.ScrollableControl({
        Size = Vector2(421, 129),
        Location = Vector2(30, 70),
        BackgroundColor = colw,
        HScrollBarDisplay = "kHide",
        VScrollBarDisplay = "kVisible",
        VScrollBarWidth = 22,
        AutoScroll = true,
        AutoSize = true,
        AutoScrollMinSize = Vector2(421, 129),
        Gui.Control("m_1_c")({
          Size = Vector2(421, 297),
          ComFuc.ComLabel("m_1_1", nil, Vector2(394, 30), Vector2(0, 0), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_2", nil, Vector2(394, 30), Vector2(0, 33), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_3", nil, Vector2(394, 30), Vector2(0, 66), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_4", nil, Vector2(394, 30), Vector2(0, 99), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_5", nil, Vector2(394, 30), Vector2(0, 132), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_6", nil, Vector2(394, 30), Vector2(0, 165), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_7", nil, Vector2(394, 30), Vector2(0, 198), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_8", nil, Vector2(394, 30), Vector2(0, 231), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_9", nil, Vector2(394, 30), Vector2(0, 264), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_10", nil, Vector2(394, 30), Vector2(0, 297), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_11", nil, Vector2(394, 30), Vector2(0, 330), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_12", nil, Vector2(394, 30), Vector2(0, 363), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_13", nil, Vector2(394, 30), Vector2(0, 396), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_14", nil, Vector2(394, 30), Vector2(0, 429), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_15", nil, Vector2(394, 30), Vector2(0, 462), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_16", nil, Vector2(394, 30), Vector2(0, 495), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_17", nil, Vector2(394, 30), Vector2(0, 528), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_18", nil, Vector2(394, 30), Vector2(0, 561), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_19", nil, Vector2(394, 30), Vector2(0, 594), 255, 16, coly, nil, SkinF.levelUpTipShow_003),
          ComFuc.ComLabel("m_1_20", nil, Vector2(394, 30), Vector2(0, 627), 255, 16, coly, nil, SkinF.levelUpTipShow_003)
        })
      })
    }),
    Gui.Control("c_2")({
      Size = Vector2(466, 172),
      Location = Vector2(28, 241),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.levelUpTipShow_002,
      ComFuc.ComControl(nil, Vector2(466, 30), Vector2(0, 24), 255, SkinF.levelUpTipShow_003),
      ComFuc.ComControl("i_2", Vector2(48, 48), Vector2(10, 14), 255, SkinF.levelUpTipShow_004[2]),
      ComFuc.ComLabel("l_2", GetUTF8Text("UI_common_new_functions"), Vector2(404, 24), Vector2(62, 27), 0, 16, coly),
      ComFuc.ComControl(nil, Vector2(84, 84), Vector2(53, 70), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl(nil, Vector2(84, 84), Vector2(149, 70), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl(nil, Vector2(84, 84), Vector2(245, 70), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl(nil, Vector2(84, 84), Vector2(341, 70), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl("m_2_1", Vector2(80, 80), Vector2(55, 72), 255),
      ComFuc.ComControl("m_2_2", Vector2(80, 80), Vector2(151, 72), 255),
      ComFuc.ComControl("m_2_3", Vector2(80, 80), Vector2(247, 72), 255),
      ComFuc.ComControl("m_2_4", Vector2(80, 80), Vector2(343, 72), 255),
      ComFuc.ComControl("m_2_5", Vector2(80, 80), Vector2(55, 72), 255),
      ComFuc.ComControl("m_2_6", Vector2(80, 80), Vector2(151, 72), 255),
      ComFuc.ComControl("m_2_7", Vector2(80, 80), Vector2(247, 72), 255),
      ComFuc.ComControl("m_2_8", Vector2(80, 80), Vector2(343, 72), 255)
    }),
    Gui.Control("c_3")({
      Size = Vector2(466, 302),
      Location = Vector2(28, 424),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.levelUpTipShow_002,
      ComFuc.ComControl(nil, Vector2(466, 30), Vector2(0, 24), 255, SkinF.levelUpTipShow_003),
      ComFuc.ComControl("i_3", Vector2(48, 48), Vector2(10, 14), 255, SkinF.levelUpTipShow_004[3]),
      ComFuc.ComLabel("l_3", GetUTF8Text("UI_common_new_level_design"), Vector2(404, 24), Vector2(62, 27), 0, 16, coly),
      ComFuc.ComControl(nil, Vector2(172, 104), Vector2(51, 70), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl(nil, Vector2(172, 104), Vector2(243, 70), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl(nil, Vector2(172, 104), Vector2(51, 180), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl(nil, Vector2(172, 104), Vector2(243, 180), 255, SkinF.levelUpTipShow_005),
      ComFuc.ComControl("m_3_1", Vector2(164, 96), Vector2(55, 74), 255),
      ComFuc.ComControl("m_3_2", Vector2(164, 96), Vector2(247, 74), 255),
      ComFuc.ComControl("m_3_3", Vector2(164, 96), Vector2(55, 184), 255),
      ComFuc.ComControl("m_3_4", Vector2(164, 96), Vector2(247, 184), 255)
    }),
    ComFuc.ComButton("btn_sure", GetUTF8Text("button_common_OK"), Vector2(260, 66), Vector2(131, 738), nil, false, true, SkinF.select_character_029)
  })
})

function ui.btn_sure.EventClick()
  Hide()
end

function AlignUI()
  Gui.Align(ui.main, 0.5, 0.5)
end

function Show(n)
  local p1, p2, p3
  local t1, t2, t3 = 0, 0, 0
  if LevelUpTip.GetNewTaskList(n) then
    p1 = LevelUpTip.GetNewTaskList(n)
    t1 = #p1
  end
  if LevelUpTip.GetNewFunctionList(n) then
    p2 = LevelUpTip.GetNewFunctionList(n)
    t2 = #p2
  end
  if LevelUpTip.GetNewMapList(n) then
    p3 = LevelUpTip.GetNewMapList(n)
    t3 = #p3
  end
  ui.main.Size = Vector2(522, 337)
  ui.btn_sure.Location = Vector2(131, 245)
  ui.m_1_c.Size = Vector2(421, math.max(4, t1) * 33)
  ui.c_2.Visible = 0 < t2
  ui.c_3.Visible = 0 < t3
  if 0 < t1 then
    for i, v in ipairs(p1) do
      ui["m_1_" .. i].Text = v[2]
    end
  else
    return Hide()
  end
  if 0 < t2 then
    ui.main.Size = Vector2(522, 518)
    ui.btn_sure.Location = Vector2(131, 426)
    for i = 1, 8 do
      ui["m_2_" .. i].Visible = false
    end
    for i, v in ipairs(p2) do
      ui["m_2_" .. i].Visible = true
      ui["m_2_" .. i + 4].Visible = true
      ui["m_2_" .. i].Skin = Gui.ControlSkin({
        BackgroundImage = Gui.Image("ui/skinF/" .. v[2], Vector4(0, 0, 0, 0))
      })
      ui["m_2_" .. i + 4].Skin = Gui.ControlSkin({
        BackgroundImage = Gui.Image("ui/skinF/" .. v[3], Vector4(0, 0, 0, 0))
      })
    end
  end
  if 0 < t3 then
    ui.main.Size = Vector2(522, 830)
    ui.btn_sure.Location = Vector2(131, 738)
    for i = 1, 4 do
      ui["m_3_" .. i].Visible = false
    end
    for i, v in ipairs(p3) do
      ui["m_3_" .. i].Visible = true
      ui["m_2_" .. i].Skin = Gui.ControlSkin({
        BackgroundImage = Gui.Image("ui/MapsAndBG/previewMaps/" .. v[2], Vector4(0, 0, 0, 0))
      })
    end
  end
  ui.main.Parent = gui
end

function Hide()
  ui.main.Parent = nil
end
