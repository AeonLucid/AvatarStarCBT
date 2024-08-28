module("LuckDraw", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
colh = ARGB(128, 255, 255, 255)
colt = ARGB(255, 113, 83, 65)
cols = ARGB(255, 62, 26, 1)
colv = ARGB(255, 176, 53, 2)
local resDir2 = "/ui/skinF/lobby/"
local partc4, partc5
local isBegin = true
local timer = {}
local isGoods = {}
local lcmap = {}
local goodsList = {}
local headk1 = 0
local headk2 = 0
local needlc = 1
local currlc = 0
local needstep = 1
local endnum = {10, 10}
local maxNum = {6, 10}
local headposx = ptr_new("Core.PdeSplineF32")
local headposy = ptr_new("Core.PdeSplineF32")
local headspeed = {0.2, 0.1}
local lcxy0 = Vector2(550, 390)
local headlcxy = Vector2(lcxy0.x - 63, lcxy0.y - 153)
local lcxy = {
  Vector2(606, 306),
  Vector2(659, 383),
  Vector2(671, 472),
  Vector2(709, 553),
  Vector2(789, 586),
  Vector2(878, 588),
  Vector2(962, 558),
  Vector2(1019, 493),
  Vector2(997, 414),
  Vector2(920, 386),
  Vector2(837, 411),
  Vector2(737, 389),
  Vector2(719, 297),
  Vector2(775, 245),
  Vector2(887, 268),
  Vector2(972, 262),
  Vector2(1017, 191),
  Vector2(997, 110),
  Vector2(939, 46),
  Vector2(859, 26),
  Vector2(797, 81),
  Vector2(766, 169),
  Vector2(666, 168),
  Vector2(636, 82),
  Vector2(580, 19),
  Vector2(504, 49),
  Vector2(501, 134),
  Vector2(443, 209),
  Vector2(357, 157),
  Vector2(300, 90),
  Vector2(226, 38),
  Vector2(140, 27),
  Vector2(60, 64),
  Vector2(43, 139),
  Vector2(91, 214),
  Vector2(91, 313),
  Vector2(54, 397),
  Vector2(59, 481),
  Vector2(112, 546),
  Vector2(193, 576),
  Vector2(284, 564),
  Vector2(356, 517),
  Vector2(355, 441),
  Vector2(285, 390),
  Vector2(210, 336),
  Vector2(192, 239),
  Vector2(282, 210),
  Vector2(339, 281),
  Vector2(421, 305),
  Vector2(512, 292)
}
local numlcxy, ComC = {
  {
    Vector2(0, -59),
    Vector2(0, 0),
    Vector2(0, 59)
  },
  {
    Vector2(49, -59),
    Vector2(49, 0),
    Vector2(49, 59)
  }
}, {
  Vector2(0, -59),
  Vector2(0, 0),
  Vector2(0, 59)
}
local ComC, ComGoods = function(i)
  return ComFuc.ComControl("g_" .. i, Vector2(64, 64), lcxy[i], 255, SkinF.lockDraw_002[(i - 1) % 9 + 1])
end, {
  Vector2(49, -59),
  Vector2(49, 0),
  Vector2(49, 59)
}

function ComGoods(i)
  return ComFuc.ComItemCB("goods_" .. i, ComFuc.ComputLocation(i, -86, -84, 4, 86, 84), i)
end

ui = Gui.Create()({
  ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0)),
  Gui.Control("main")({
    Size = Vector2(1142, 700),
    Gui.Control("mid")({
      Size = Vector2(1124, 681),
      Location = Vector2(9, 7),
      BackgroundColor = colw,
      Skin = SkinF.lockDraw_001,
      ComFuc.ComControlAddPt("partc1", Vector2(150, 150), Vector2(145, 125), "ui_hunt_bao_water"),
      ComFuc.ComControlAddPt("partc2", Vector2(200, 200), Vector2(810, 90), "ui_hunt_bao_star"),
      Gui.Control({
        Size = Vector2(96, 59),
        Location = Vector2(504, 427),
        ComFuc.ComControl("num_1_1", Vector2(47, 59), Vector2(0, 0), 255, SkinF.lockDraw_005[1]),
        ComFuc.ComControl("num_1_2", Vector2(47, 59), Vector2(0, 59), 255, SkinF.lockDraw_005[2]),
        ComFuc.ComControl("num_2_1", Vector2(47, 59), Vector2(49, 0), 255, SkinF.lockDraw_005[1]),
        ComFuc.ComControl("num_2_2", Vector2(47, 59), Vector2(49, 59), 255, SkinF.lockDraw_005[2])
      }),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Cost") .. ":", Vector2(50, 30), Vector2(432, 624), 0, 16, colw),
      Gui.Control({
        Size = Vector2(96, 30),
        Location = Vector2(478, 624),
        ComFuc.ComCheckBox("sel_cost_1", nil, Vector2(24, 24), Vector2(0, 3), 0, nil, "Gui.CheckBox_01"),
        ComFuc.ComControl(nil, Vector2(30, 30), Vector2(27, 0), 255, SkinF.avatar_main_088[2]),
        ComFuc.ComLabel("card_cost_1", "100 ", Vector2(50, 30), Vector2(57, 0), 0, 16, colw)
      }),
      Gui.Control({
        Size = Vector2(96, 30),
        Location = Vector2(573, 624),
        ComFuc.ComCheckBox("sel_cost_2", nil, Vector2(24, 24), Vector2(0, 3), 0, nil, "Gui.CheckBox_01"),
        ComFuc.ComControl(nil, Vector2(30, 30), Vector2(27, 0), 255, SkinF.avatar_main_088[3]),
        ComFuc.ComLabel("card_cost_2", "100 ", Vector2(50, 30), Vector2(57, 0), 0, 16, colw)
      }),
      ComFuc.ComButton("begin_draw", nil, Vector2(96, 97), Vector2(504, 509), 0, false, true, SkinF.lockDraw_004[1]),
      ComFuc.ComButton("look_goods", GetUTF8Text("button_common_Check_Reward"), Vector2(100, 37), Vector2(1016, 9), 16, false, false, SkinF.lockDraw_006),
      ComFuc.ComControl("coverMoney", Vector2(250, 30), Vector2(432, 624)),
      ComFuc.ComControl("coverLook", Vector2(100, 37), Vector2(1016, 9)),
      ComFuc.ComComplex(ComC, 1, 50)
    }),
    Gui.Control("head")({
      Size = Vector2(125, 153),
      Location = lcxy0 + Vector2(-63, -153),
      BackgroundColor = colw,
      Enable = false,
      Skin = SkinF.lockDraw_003[1],
      ComFuc.ComHeadMessage(Vector2(11, 9), 7, Vector2(103, 103)),
      ComFuc.ComControl(nil, Vector2(125, 153), Vector2(0, 0), 255, SkinF.lockDraw_003[2])
    })
  }),
  Gui.Control("mainCtrl_2")({
    Size = Vector2(404, 408),
    Dock = "kDockCenter",
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_207,
    ComFuc.ComControl(nil, Vector2(384, 356), Vector2(10, 36), 255, SkinF.openBox_002),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Treasure_Hunt_Reward"), Vector2(218, 18), Vector2(20, 6), 0, 16, colw),
    ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(368, 5), 0, false, false, SkinF.lookInfo_002),
    Gui.ScrollableControl({
      Size = Vector2(364, 332),
      Location = Vector2(20, 48),
      BackgroundColor = colw,
      HScrollBarDisplay = "kHide",
      VScrollBarDisplay = "kVisible",
      VScrollBarWidth = 22,
      AutoScroll = true,
      AutoSize = true,
      AutoScrollMinSize = Vector2(364, 332),
      Gui.Control("goos_Content")({
        Size = Vector2(364, 2100),
        ComFuc.ComComplex(ComGoods, 1, NumeralConst.lottery_prize_num_max)
      })
    })
  })
})
ui.partc1.Particle:Reset()
ui.partc2.Particle:Reset()
local SetHeadPosxy, SetConverMandL = function()
  ui.head.Location = headlcxy
end, function()
  ui.head.Location = headlcxy
end
local SetConverMandL, CleanGoods = function(p)
  ui.coverMoney.Visible = not ui.begin_draw.Enable or ui.begin_draw.Skin ~= SkinF.lockDraw_004[1]
  ui.coverLook.Visible = not ui.begin_draw.Enable or ui.begin_draw.Skin ~= SkinF.lockDraw_004[1]
  if p then
    ui.coverMoney.Visible = not p
    ui.coverLook.Visible = not p
  end
end, ui.partc2.Particle
local CleanGoods, WhirlHeadCard = function()
  isBegin = true
  timer = {}
  isGoods = {}
  lcmap = {}
  goodsList = {}
  headk1 = 0
  headk2 = 0
  needlc = 1
  currlc = 0
  needstep = 1
  endnum = {10, 10}
  for i = 1, 50 do
    ui["g_" .. i].Visible = false
  end
  headposx:AddPoint(0.01, lcxy0.x - 63, 0, 0, 2)
  headposx:AddPoint(tall, lcxy[1].x - 30, 0, 0, 2)
  headposy:AddPoint(0.01, lcxy0.y - 153, 0, 0, 2)
  headposy:AddPoint(tall, lcxy[1].y - 131, 0, 0, 2)
  headlcxy = Vector2(lcxy0.x - 63, lcxy0.y - 153)
  SetHeadPosxy()
  if partc4 then
    gui:RemoveParticle(partc4)
  end
  if partc5 then
    gui:RemoveParticle(partc5)
    partc5 = nil
  end
  ui.sel_cost_1.Check = true
  ui.sel_cost_2.Check = false
  ui.begin_draw.Enable = true
  ui.begin_draw.Skin = SkinF.lockDraw_004[1]
  ui.num_1_1.Skin = SkinF.lockDraw_005[10]
  ui.num_1_1.Location = Vector2(numlcxy[1][1].x, numlcxy[1][2].y)
  ui.num_1_2.Location = Vector2(numlcxy[1][1].x, numlcxy[1][1].y)
  ui.num_2_1.Skin = SkinF.lockDraw_005[10]
  ui.num_2_1.Location = Vector2(numlcxy[2][1].x, numlcxy[2][2].y)
  ui.num_2_2.Location = Vector2(numlcxy[2][1].x, numlcxy[2][1].y)
  SetConverMandL()
end, "Reset"
local WhirlHeadCard, WhirlNums = function(tall)
  local time_step = 0.05
  local message_box_time = 0
  timer[1] = game.TimerMgr:AddTimer(time_step)
  timer[1].EventOnTimer = function(sender, e)
    message_box_time = message_box_time + time_step
    local vx = headposx:GetSplineValue(message_box_time)
    local vy = headposy:GetSplineValue(message_box_time)
    headlcxy = Vector2(vx, vy)
    SetHeadPosxy()
    if partc5 then
      gui:UpdateParticlePosition(partc5, headlcxy + Vector2(ComFuc.locationChanged + 37, 163) + Vector2(62, 124))
    end
    if not partc5 then
      if needstep <= 20 then
        partc5 = gui:AddParticle("ui_hunt_startrail", headlcxy + Vector2(ComFuc.locationChanged + 37, 163) + Vector2(62, 124), Vector3(0, 1, 0))
      else
        partc5 = gui:AddParticle("ui_hunt_smoketrail", headlcxy + Vector2(ComFuc.locationChanged + 37, 163) + Vector2(62, 124), Vector3(0, 1, 0))
      end
    end
    if message_box_time >= tall then
      while message_box_time >= tall do
        message_box_time = message_box_time - tall
      end
      headposx:Clear()
      headposy:Clear()
      headk2 = headk2 + 1
    end
    if headk1 == headk2 then
      headposx:AddPoint(0.01, lcxy[(headk1 - 1) % 50 + 1].x - 30, 0, 0, 2)
      headposx:AddPoint(tall, lcxy[headk1 % 50 + 1].x - 30, 0, 0, 2)
      headposy:AddPoint(0.01, lcxy[(headk1 - 1) % 50 + 1].y - 131, 0, 0, 2)
      headposy:AddPoint(tall, lcxy[headk1 % 50 + 1].y - 131, 0, 0, 2)
      if (headk1 - 1) % 50 + 1 == needlc then
        game.TimerMgr:RemoveTimer(timer[1])
        timer[1] = nil
        currlc = needlc
        if partc5 then
          gui:RemoveParticle(partc5)
          partc5 = nil
        end
        partc4 = gui:AddParticle("ui_hunt_bao_dust", headlcxy + Vector2(ComFuc.locationChanged + 37, 163) + Vector2(63, 153), Vector3(0, 1, 0))
        for i, v in ipairs(goodsList) do
          if v.type == 2 and v.grade >= 3 then
            rpc.safecall("lottery_broadcast", {
              prizeId = v.prizeId
            })
          end
        end
        GainGoods.Show(goodsList, function()
          ui.begin_draw.Enable = true
          ui.begin_draw.Skin = SkinF.lockDraw_004[1]
          NewLead.HideLead()
          if partc4 then
            gui:RemoveParticle(partc4)
          end
          SetConverMandL()
        end, "tip_sys_lottery_base_prize", "tip_sys_lottery_prize")
      end
      headk1 = headk1 + 1
    end
  end
end, Gui.Control("main")({
  Size = Vector2(1142, 700),
  Gui.Control("mid")({
    Size = Vector2(1124, 681),
    Location = Vector2(9, 7),
    BackgroundColor = colw,
    Skin = SkinF.lockDraw_001,
    ComFuc.ComControlAddPt("partc1", Vector2(150, 150), Vector2(145, 125), "ui_hunt_bao_water"),
    ComFuc.ComControlAddPt("partc2", Vector2(200, 200), Vector2(810, 90), "ui_hunt_bao_star"),
    Gui.Control({
      Size = Vector2(96, 59),
      Location = Vector2(504, 427),
      ComFuc.ComControl("num_1_1", Vector2(47, 59), Vector2(0, 0), 255, SkinF.lockDraw_005[1]),
      ComFuc.ComControl("num_1_2", Vector2(47, 59), Vector2(0, 59), 255, SkinF.lockDraw_005[2]),
      ComFuc.ComControl("num_2_1", Vector2(47, 59), Vector2(49, 0), 255, SkinF.lockDraw_005[1]),
      ComFuc.ComControl("num_2_2", Vector2(47, 59), Vector2(49, 59), 255, SkinF.lockDraw_005[2])
    }),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Cost") .. ":", Vector2(50, 30), Vector2(432, 624), 0, 16, colw),
    Gui.Control({
      Size = Vector2(96, 30),
      Location = Vector2(478, 624),
      ComFuc.ComCheckBox("sel_cost_1", nil, Vector2(24, 24), Vector2(0, 3), 0, nil, "Gui.CheckBox_01"),
      ComFuc.ComControl(nil, Vector2(30, 30), Vector2(27, 0), 255, SkinF.avatar_main_088[2]),
      ComFuc.ComLabel("card_cost_1", "100 ", Vector2(50, 30), Vector2(57, 0), 0, 16, colw)
    }),
    Gui.Control({
      Size = Vector2(96, 30),
      Location = Vector2(573, 624),
      ComFuc.ComCheckBox("sel_cost_2", nil, Vector2(24, 24), Vector2(0, 3), 0, nil, "Gui.CheckBox_01"),
      ComFuc.ComControl(nil, Vector2(30, 30), Vector2(27, 0), 255, SkinF.avatar_main_088[3]),
      ComFuc.ComLabel("card_cost_2", "100 ", Vector2(50, 30), Vector2(57, 0), 0, 16, colw)
    }),
    ComFuc.ComButton("begin_draw", nil, Vector2(96, 97), Vector2(504, 509), 0, false, true, SkinF.lockDraw_004[1]),
    ComFuc.ComButton("look_goods", GetUTF8Text("button_common_Check_Reward"), Vector2(100, 37), Vector2(1016, 9), 16, false, false, SkinF.lockDraw_006),
    ComFuc.ComControl("coverMoney", Vector2(250, 30), Vector2(432, 624)),
    ComFuc.ComControl("coverLook", Vector2(100, 37), Vector2(1016, 9)),
    ComFuc.ComComplex(ComC, 1, 50)
  }),
  Gui.Control("head")({
    Size = Vector2(125, 153),
    Location = lcxy0 + Vector2(-63, -153),
    BackgroundColor = colw,
    Enable = false,
    Skin = SkinF.lockDraw_003[1],
    ComFuc.ComHeadMessage(Vector2(11, 9), 7, Vector2(103, 103)),
    ComFuc.ComControl(nil, Vector2(125, 153), Vector2(0, 0), 255, SkinF.lockDraw_003[2])
  })
})
local WhirlNums, DealGoodsdistribute = function(p, tall)
  local posy1 = ptr_new("Core.PdeSplineF32")
  local posy2 = ptr_new("Core.PdeSplineF32")
  local time_step = 0.05
  local message_box_time = 0
  local k1 = 2
  local k2 = 2
  local k3 = 3
  local k4 = 3
  local k5 = 1
  local k6 = 0
  posy1:AddPoint(0.01, numlcxy[p][2].y, 0, 0, 2)
  posy1:AddPoint(tall, numlcxy[p][3].y, 0, 0, 2)
  posy2:AddPoint(0.01, numlcxy[p][1].y, 0, 0, 2)
  posy2:AddPoint(tall, numlcxy[p][2].y, 0, 0, 2)
  ui["num_" .. p .. "_1"].Skin = SkinF.lockDraw_005[(k5 - 1) % 10 + 1]
  ui["num_" .. p .. "_2"].Skin = SkinF.lockDraw_005[(k6 - 1) % 10 + 1]
  timer[p + 1] = game.TimerMgr:AddTimer(time_step)
  timer[p + 1].EventOnTimer = function(sender, e)
    message_box_time = message_box_time + time_step
    local vy1 = posy1:GetSplineValue(message_box_time)
    local vy2 = posy2:GetSplineValue(message_box_time)
    ui["num_" .. p .. "_1"].Location = Vector2(numlcxy[p][1].x, vy1)
    ui["num_" .. p .. "_2"].Location = Vector2(numlcxy[p][1].x, vy2)
    if message_box_time >= tall then
      message_box_time = 0
      posy1:Clear()
      posy2:Clear()
      k2 = k2 + 1
      k4 = k4 + 1
    end
    if k1 == k2 then
      if k1 == 3 then
        k1 = 1
        k2 = 1
        k5 = k5 + 2
        if (k5 - 1) % maxNum[p] + 1 == maxNum[p] then
          ui["num_" .. p .. "_1"].Skin = SkinF.lockDraw_005[10]
        else
          ui["num_" .. p .. "_1"].Skin = SkinF.lockDraw_005[(k5 - 1) % maxNum[p] + 1]
        end
        if ((k6 - 1) % maxNum[p] + 1) % maxNum[p] == endnum[p] then
          game.TimerMgr:RemoveTimer(timer[p + 1])
          timer[p + 1] = nil
          if not timer[2] and not timer[3] then
            if partc4 then
              gui:RemoveParticle(partc4)
            end
            if needstep <= 20 then
              WhirlHeadCard(headspeed[1])
            else
              WhirlHeadCard(headspeed[2])
            end
          end
        end
      end
      posy1:AddPoint(0.01, numlcxy[p][(k1 - 1) % 3 + 1].y, 0, 0, 2)
      posy1:AddPoint(tall, numlcxy[p][k1 % 3 + 1].y, 0, 0, 2)
      k1 = k1 + 1
    end
    if k3 == k4 then
      if k3 == 3 then
        k3 = 1
        k4 = 1
        k6 = k6 + 2
        if (k6 - 1) % maxNum[p] + 1 == maxNum[p] then
          ui["num_" .. p .. "_2"].Skin = SkinF.lockDraw_005[10]
        else
          ui["num_" .. p .. "_2"].Skin = SkinF.lockDraw_005[(k6 - 1) % maxNum[p] + 1]
        end
        if ((k5 - 1) % maxNum[p] + 1) % maxNum[p] == endnum[p] then
          game.TimerMgr:RemoveTimer(timer[p + 1])
          timer[p + 1] = nil
          if not timer[2] and not timer[3] then
            if partc4 then
              gui:RemoveParticle(partc4)
            end
            if needstep <= 20 then
              WhirlHeadCard(headspeed[1])
            else
              WhirlHeadCard(headspeed[2])
            end
          end
        end
      end
      posy2:AddPoint(0.01, numlcxy[p][(k3 - 1) % 3 + 1].y, 0, 0, 2)
      posy2:AddPoint(tall, numlcxy[p][k3 % 3 + 1].y, 0, 0, 2)
      k3 = k3 + 1
    end
  end
end, Gui.Control("mainCtrl_2")({
  Size = Vector2(404, 408),
  Dock = "kDockCenter",
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_207,
  ComFuc.ComControl(nil, Vector2(384, 356), Vector2(10, 36), 255, SkinF.openBox_002),
  ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Treasure_Hunt_Reward"), Vector2(218, 18), Vector2(20, 6), 0, 16, colw),
  ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(368, 5), 0, false, false, SkinF.lookInfo_002),
  Gui.ScrollableControl({
    Size = Vector2(364, 332),
    Location = Vector2(20, 48),
    BackgroundColor = colw,
    HScrollBarDisplay = "kHide",
    VScrollBarDisplay = "kVisible",
    VScrollBarWidth = 22,
    AutoScroll = true,
    AutoSize = true,
    AutoScrollMinSize = Vector2(364, 332),
    Gui.Control("goos_Content")({
      Size = Vector2(364, 2100),
      ComFuc.ComComplex(ComGoods, 1, NumeralConst.lottery_prize_num_max)
    })
  })
})
local DealGoodsdistribute, DealGoodsGet = function(data)
  for i, v in ipairs(data.list) do
    local t1 = {}
    local t2 = v.gridNum
    local t3 = 1
    local t4 = 1
    if data.price then
      for i, v in ipairs(data.price) do
        if v.currency == 2 then
          ui.card_cost_1.Text = v.num .. " "
        end
        if v.currency == 3 then
          ui.card_cost_2.Text = v.num .. " "
        end
      end
    end
    while 0 < t2 do
      t3 = math.random(50)
      while true do
        if isGoods[t3] then
          t3 = t3 % 50 + 1
        else
          t1[t4] = t3
          t4 = t4 + 1
          isGoods[t3] = true
          ui["g_" .. t3].Visible = true
          ui["g_" .. t3].Skin = Gui.ControlSkin({
            BackgroundImage = Gui.Image("ui/skinF/lobby/" .. v.resource .. ".tga", Vector4(0, 0, 0, 0))
          })
          break
        end
      end
      t2 = t2 - 1
    end
    lcmap[v.category] = t1
  end
end, Gui.Control("mainCtrl_2")({
  Size = Vector2(404, 408),
  Dock = "kDockCenter",
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_207,
  ComFuc.ComControl(nil, Vector2(384, 356), Vector2(10, 36), 255, SkinF.openBox_002),
  ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Treasure_Hunt_Reward"), Vector2(218, 18), Vector2(20, 6), 0, 16, colw),
  ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(368, 5), 0, false, false, SkinF.lookInfo_002),
  Gui.ScrollableControl({
    Size = Vector2(364, 332),
    Location = Vector2(20, 48),
    BackgroundColor = colw,
    HScrollBarDisplay = "kHide",
    VScrollBarDisplay = "kVisible",
    VScrollBarWidth = 22,
    AutoScroll = true,
    AutoSize = true,
    AutoScrollMinSize = Vector2(364, 332),
    Gui.Control("goos_Content")({
      Size = Vector2(364, 2100),
      ComFuc.ComComplex(ComGoods, 1, NumeralConst.lottery_prize_num_max)
    })
  })
})

function DealGoodsGet(data)
  while true do
    local t = #lcmap[data.prize.category]
    t = math.random(t)
    needlc = lcmap[data.prize.category][t]
    needstep = (50 + needlc - currlc - 1) % 50 + 1
    if needstep < 50 or #lcmap[data.prize.category] < 2 then
      break
    end
  end
  endnum[1] = math.floor(needstep / 10)
  endnum[2] = needstep % 10
  goodsList[1] = data.prize
  for i, v in ipairs(data.appendage) do
    goodsList[i + 1] = v
  end
  isBegin = true
end

for i = 1, 2 do
  ui["sel_cost_" .. i].EventCheckChanged = function(sender, e)
    if "kTriggerMouse" == e.Trigger then
      sender.Check = true
      ui["sel_cost_" .. 3 - i].Check = false
    end
  end
  local BeginDrawnNum = Gui.Control("mainCtrl_2")({
    Size = Vector2(404, 408),
    Dock = "kDockCenter",
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_207,
    ComFuc.ComControl(nil, Vector2(384, 356), Vector2(10, 36), 255, SkinF.openBox_002),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Treasure_Hunt_Reward"), Vector2(218, 18), Vector2(20, 6), 0, 16, colw),
    ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(368, 5), 0, false, false, SkinF.lookInfo_002),
    Gui.ScrollableControl({
      Size = Vector2(364, 332),
      Location = Vector2(20, 48),
      BackgroundColor = colw,
      HScrollBarDisplay = "kHide",
      VScrollBarDisplay = "kVisible",
      VScrollBarWidth = 22,
      AutoScroll = true,
      AutoSize = true,
      AutoScrollMinSize = Vector2(364, 332),
      Gui.Control("goos_Content")({
        Size = Vector2(364, 2100),
        ComFuc.ComComplex(ComGoods, 1, NumeralConst.lottery_prize_num_max)
      })
    })
  })
end

function BeginDrawnNum(sender, e)
  sender.Enable = false
  SetConverMandL()
  if isBegin then
    if ComFuc.globalLV < 5 then
      MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1276"))
      SetConverMandL(true)
    elseif ui.sel_cost_1.Check then
      if ComFuc.globalMB < tonumber(ui.card_cost_1.Text) then
        MessageBox.ShowWithTwoButtons(GetUTF8Text("msgbox_common_num_1277_01"), GetUTF8Text("button_common_Topup"), GetUTF8Text("button_common_Cancel"), function()
          MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1385"))
        end)
        SetConverMandL(true)
      else
        BeginDrawnNum()
      end
    elseif ComFuc.globalTB < tonumber(ui.card_cost_2.Text) then
      MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1277"))
      SetConverMandL(true)
    else
      BeginDrawnNum()
    end
    sender.Enable = true
  else
    NewLead.ShowEmptyHasLock(Vector2(37, 163), Vector2(1124, 681))
    local costType = 2
    if ui.sel_cost_2.Check then
      costType = 3
    end
    rpc.safecall("lottery_open", {currency = costType}, DealGoodsGet)
  end
end

ui.begin_draw.EventClick = BeginDrawnNum

function BeginDrawnNum(sender, e)
  rpc.safecall("lottery_prize_list", {}, function(data)
    ui.coverControl2.Parent = gui
    local t = #data.list
    for i, v in ipairs(data.list) do
      ui["goods_" .. i .. "_lev"].Skin = SkinF.personalInfo_quality[v.grade or 1]
      if v.unitType and v.unitType == 3 and 1 < v.unit then
        ui["goods_" .. i .. "_count"].Text = v.unit
      else
        ui["goods_" .. i .. "_count"].Text = nil
      end
      if v.type == 7 then
        ui["goods_" .. i .. "_count"].Text = v.unit
        ui["goods_" .. i .. "_res"].Skin = Gui.Gui.ControlSkin({
          BackgroundImage = Gui.Image("ui/skinF/skin_common_icon_gold01.tga", Vector4(0, 0, 0, 0))
        })
      else
        local res = v.resource
        if v.type == 2 and v.subType == 102 then
          local a = rpc.load_result("fuck = {" .. res .. "}")
          res = a.fuck[1]
        end
        ui["goods_" .. i .. "_res"].Skin = Gui.Gui.ControlSkin({
          BackgroundImage = Gui.Image(resDir2 .. res .. ".tga", Vector4(0, 0, 0, 0))
        })
      end
      if v.type ~= 7 then
        ui["goods_" .. i .. "_res"].EventMouseEnter = function(sender, e)
          Tip.SetRpc("tip_sys_lottery_prize", {
            t = v.type,
            prizeId = v.prizeId
          })
          Tip.SetUseDescription(false)
          Tip.SetOwner(sender)
        end
      end
      ui["goods_" .. i .. "_lev"].Visible = true
      ui["goods_" .. i .. "_res"].Visible = true
      ui["goods_" .. i .. "_count"].Visible = true
    end
    for i = t + 1, math.max(16, (math.floor((t - 0.1) / 4) + 1) * 4) do
      ui["goods_" .. i .. "_lev"].Visible = false
      ui["goods_" .. i .. "_res"].Visible = false
      ui["goods_" .. i .. "_count"].Visible = false
    end
    ui.goos_Content.Size = Vector2(364, math.max(332, (math.floor((t - 0.1) / 4) + 1) * 84 - 4))
    ui.mainCtrl_2.Parent = gui
  end)
end

ui.look_goods.EventClick = BeginDrawnNum

function BeginDrawnNum(sender, e)
  ui.coverControl2.Parent = nil
  ui.mainCtrl_2.Parent = nil
end

ui.colse_2.EventClick = BeginDrawnNum

function CanSwitch()
  return true, GetUTF8Text("msgbox_common_num_1398")
end

function Show(winRoot)
  ui.main.Parent = winRoot
  CleanGoods()
  rpc.safecall("lottery_list", {}, DealGoodsdistribute)
end

function Hide()
  ui.main.Parent = nil
  ui.coverControl2.Parent = nil
  NewLead.HideLead()
  if partc4 then
    gui:RemoveParticle(partc4)
  end
  if partc5 then
    gui:RemoveParticle(partc5)
    partc5 = nil
  end
  if timer[1] then
    game.TimerMgr:RemoveTimer(timer[1])
    timer[1] = nil
  end
  if timer[2] then
    game.TimerMgr:RemoveTimer(timer[2])
    timer[2] = nil
  end
  if timer[3] then
    game.TimerMgr:RemoveTimer(timer[3])
    timer[3] = nil
  end
end
