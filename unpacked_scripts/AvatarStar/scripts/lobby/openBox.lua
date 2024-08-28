module("OpenBox", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
colt = ARGB(255, 113, 83, 65)
local resDir = "/ui/skinF/"
local resDir2 = "/ui/skinF/lobby/"
local timer, ptBar
local frameC = 100
local lightGoods, lightGoods1, boxRes
local boxGrade = 1
local keyNumber = 0
local BoxNumber, ComGoods = 0, nil

function ComGoods(i)
  return ComFuc.ComItemCB("goods_" .. i, ComFuc.ComputLocation(i, -86, -84, 3, 86, 84), i)
end

local ui = Gui.Create()({
  ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0)),
  Gui.Control("main")({
    Size = Vector2(837, 480),
    Dock = "kDockCenter",
    Gui.Control("mainCtrl_2")({
      Size = Vector2(425, 480),
      Location = Vector2(412, 0),
      BackgroundColor = colw,
      Skin = SkinF.openBox_004[2],
      ComFuc.ComLabel("openB_good", "\187\198\189\240\177\166\207\228\189\177\192\248", Vector2(180, 20), Vector2(149, 28), 0, 16, colw, "kAlignCenterMiddle"),
      ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(374, 26), 0, false, false, SkinF.lookInfo_002),
      Gui.ScrollableControl({
        Size = Vector2(281, 332),
        Location = Vector2(94, 67),
        HScrollBarDisplay = "kHide",
        VScrollBarDisplay = "kVisible",
        VScrollBarWidth = 22,
        AutoScroll = true,
        AutoSize = true,
        AutoScrollMinSize = Vector2(281, 332),
        Gui.Control("goos_Content")({
          Size = Vector2(281, 2100),
          ComFuc.ComComplex(ComGoods, 1, NumeralConst.box_prize_num_max)
        })
      })
    }),
    Gui.Control("mainCtrl_1")({
      Size = Vector2(428, 480),
      BackgroundColor = colw,
      Skin = SkinF.openBox_004[1],
      ComFuc.ComControl("box_res", Vector2(40, 40), Vector2(82, 365), 255, SkinF.skin_touming),
      ComFuc.ComControl("box_key", Vector2(40, 40), Vector2(82, 401), 255, SkinF.skin_touming),
      ComFuc.ComLabel("openB_name", "\191\170\198\244\187\198\189\240\177\166\207\228", Vector2(180, 20), Vector2(135, 28), 0, 16, colw, "kAlignCenterMiddle"),
      ComFuc.ComLabel("box_count", "x 9999", Vector2(118, 20), Vector2(122, 375), 0, 16, colw),
      ComFuc.ComLabel("key_count", "x 9999", Vector2(118, 20), Vector2(122, 411), 0, 16, colw),
      ComFuc.ComButton("colse", nil, Vector2(24, 24), Vector2(360, 26), 0, false, false, SkinF.lookInfo_002),
      ComFuc.ComButton("look_good", GetUTF8Text("button_common_Check_Reward"), Vector2(84, 40), Vector2(282, 365), 16, false, true, SkinF.personalInfo_200),
      ComFuc.ComButton("bKey_buy", GetUTF8Text("button_common_Buy_Key"), Vector2(84, 40), Vector2(282, 401), 16, false, true, SkinF.personalInfo_200),
      ComFuc.ComButton("bBox_open", nil, Vector2(70, 71), Vector2(190, 306), 16, false, false, SkinF.openBox_005),
      ComFuc.ComControl("box_res_big", Vector2(251, 206), Vector2(98, 116), 255, SkinF.skin_touming)
    })
  })
})
ui.bBox_open.ClickAudio = "slottingsuccessful"

function GainGoodsFuc()
  ui.box_res_big.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(resDir .. "skin_" .. boxRes .. "_close.tga", Vector4(0, 0, 0, 0))
  })
  if ptBar then
    gui:RemoveParticle(ptBar)
    ptBar = nil
  end
end

function TimerRefresh()
  if frameC <= 8 then
    if frameC == 0 then
      gui:AddParticle("ui_bao_ray", ui.mainCtrl_1:ClientToScreen(Vector2(214, 240)), Vector3(0, 0, -1))
    end
    if frameC == 4 then
      if ptBar then
        gui:RemoveParticle(ptBar)
        ptBar = nil
      end
      ptBar = gui:AddParticle("ui_bao_star", ui.mainCtrl_1:ClientToScreen(Vector2(214, 240)), Vector3(0, 0, -1))
    end
    if frameC == 5 then
      ui.bBox_open.Enable = 0 < BoxNumber
    end
    frameC = frameC + 1
  else
    TimerRemove()
  end
end

local TimerRemove, DealBoxInfo = function()
  game.TimerMgr:RemoveTimer(timer)
  frameC = 10
  timer = nil
end, function()
  game.TimerMgr:RemoveTimer(timer)
  frameC = 10
  timer = nil
end
local DealBoxInfo, DealBoxPrizeList = function(data)
  ui.box_res_big.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(resDir .. "skin_" .. data.boxResource .. "_close.tga", Vector4(0, 0, 0, 0))
  })
  ui.box_res.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(resDir .. "skin_" .. data.boxResource .. "_02.tga", Vector4(0, 0, 0, 0))
  })
  ui.box_key.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(resDir .. "skin_baoxiang_" .. data.keyResource .. "_02.tga", Vector4(0, 0, 0, 0))
  })
  BoxNumber = data.boxNum
  keyNumber = data.keyNum
  boxRes = data.boxResource or ""
  ui.box_res.Visible = true
  ui.box_key.Visible = true
  ui.openB_name.Text = string.format(GetUTF8Text("UI_store_additional_string_118"), GetUTF8Text(data.boxName))
  ui.openB_good.Text = string.format(GetUTF8Text("UI_store_additional_string_119"), GetUTF8Text(data.boxName))
  ui.box_count.Text = "x " .. data.boxNum
  ui.key_count.Text = "x " .. data.keyNum
  ui.box_key.Hint = data.keyName
  ui.bBox_open.Enable = 0 < BoxNumber
end, ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0))
local DealBoxPrizeList, DealBoxOpen = function(data)
  local t = #data.list
  for i, v in ipairs(data.list) do
    ui["goods_" .. i .. "_lev"].Skin = SkinF.personalInfo_quality[v.grade]
    local res = v.resource
    if v.type == 2 and v.subType == 102 then
      local a = rpc.load_result("fuck = {" .. res .. "}")
      res = a.fuck[1]
    end
    ui["goods_" .. i .. "_res"].Skin = Gui.Gui.ControlSkin({
      BackgroundImage = Gui.Image(resDir2 .. res .. ".tga", Vector4(0, 0, 0, 0))
    })
    if v.unitType and v.unitType == 3 and 1 < v.unit then
      ui["goods_" .. i .. "_count"].Text = v.unit
    else
      ui["goods_" .. i .. "_count"].Text = nil
    end
    ui["goods_" .. i .. "_res"].EventMouseEnter = function(sender, e)
      Tip.SetRpc("tip_sys_box_prize", {
        t = v.type,
        prizeId = v.prizeId
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
    end
    ui["goods_" .. i .. "_lev"].Visible = true
    ui["goods_" .. i .. "_res"].Visible = true
    ui["goods_" .. i .. "_count"].Visible = true
  end
  for i = t + 1, math.max(12, (math.floor((t - 0.1) / 3) + 1) * 3) do
    ui["goods_" .. i .. "_lev"].Visible = false
    ui["goods_" .. i .. "_res"].Visible = false
    ui["goods_" .. i .. "_count"].Visible = false
  end
  ui.goos_Content.Size = Vector2(364, math.max(332, (math.floor((t - 0.1) / 3) + 1) * 84 - 4))
end, Gui.Control("main")({
  Size = Vector2(837, 480),
  Dock = "kDockCenter",
  Gui.Control("mainCtrl_2")({
    Size = Vector2(425, 480),
    Location = Vector2(412, 0),
    BackgroundColor = colw,
    Skin = SkinF.openBox_004[2],
    ComFuc.ComLabel("openB_good", "\187\198\189\240\177\166\207\228\189\177\192\248", Vector2(180, 20), Vector2(149, 28), 0, 16, colw, "kAlignCenterMiddle"),
    ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(374, 26), 0, false, false, SkinF.lookInfo_002),
    Gui.ScrollableControl({
      Size = Vector2(281, 332),
      Location = Vector2(94, 67),
      HScrollBarDisplay = "kHide",
      VScrollBarDisplay = "kVisible",
      VScrollBarWidth = 22,
      AutoScroll = true,
      AutoSize = true,
      AutoScrollMinSize = Vector2(281, 332),
      Gui.Control("goos_Content")({
        Size = Vector2(281, 2100),
        ComFuc.ComComplex(ComGoods, 1, NumeralConst.box_prize_num_max)
      })
    })
  }),
  Gui.Control("mainCtrl_1")({
    Size = Vector2(428, 480),
    BackgroundColor = colw,
    Skin = SkinF.openBox_004[1],
    ComFuc.ComControl("box_res", Vector2(40, 40), Vector2(82, 365), 255, SkinF.skin_touming),
    ComFuc.ComControl("box_key", Vector2(40, 40), Vector2(82, 401), 255, SkinF.skin_touming),
    ComFuc.ComLabel("openB_name", "\191\170\198\244\187\198\189\240\177\166\207\228", Vector2(180, 20), Vector2(135, 28), 0, 16, colw, "kAlignCenterMiddle"),
    ComFuc.ComLabel("box_count", "x 9999", Vector2(118, 20), Vector2(122, 375), 0, 16, colw),
    ComFuc.ComLabel("key_count", "x 9999", Vector2(118, 20), Vector2(122, 411), 0, 16, colw),
    ComFuc.ComButton("colse", nil, Vector2(24, 24), Vector2(360, 26), 0, false, false, SkinF.lookInfo_002),
    ComFuc.ComButton("look_good", GetUTF8Text("button_common_Check_Reward"), Vector2(84, 40), Vector2(282, 365), 16, false, true, SkinF.personalInfo_200),
    ComFuc.ComButton("bKey_buy", GetUTF8Text("button_common_Buy_Key"), Vector2(84, 40), Vector2(282, 401), 16, false, true, SkinF.personalInfo_200),
    ComFuc.ComButton("bBox_open", nil, Vector2(70, 71), Vector2(190, 306), 16, false, false, SkinF.openBox_005),
    ComFuc.ComControl("box_res_big", Vector2(251, 206), Vector2(98, 116), 255, SkinF.skin_touming)
  })
})
local DealBoxOpen, DealEndQuickBuy = function(data)
  keyNumber = keyNumber - 1
  BoxNumber = BoxNumber - 1
  ui.box_count.Text = "x " .. BoxNumber
  ui.key_count.Text = "x " .. keyNumber
  ui.box_res_big.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(resDir .. "skin_" .. boxRes .. "_open.tga", Vector4(0, 0, 0, 0))
  })
  frameC = 0
  timer = game.TimerMgr:AddTimer(0.1)
  timer.EventOnTimer = TimerRefresh
  GainGoods.Show(data.list, GainGoodsFuc, "tip_sys_box_prize")
end, Gui.Control("main")({
  Size = Vector2(837, 480),
  Dock = "kDockCenter",
  Gui.Control("mainCtrl_2")({
    Size = Vector2(425, 480),
    Location = Vector2(412, 0),
    BackgroundColor = colw,
    Skin = SkinF.openBox_004[2],
    ComFuc.ComLabel("openB_good", "\187\198\189\240\177\166\207\228\189\177\192\248", Vector2(180, 20), Vector2(149, 28), 0, 16, colw, "kAlignCenterMiddle"),
    ComFuc.ComButton("colse_2", nil, Vector2(24, 24), Vector2(374, 26), 0, false, false, SkinF.lookInfo_002),
    Gui.ScrollableControl({
      Size = Vector2(281, 332),
      Location = Vector2(94, 67),
      HScrollBarDisplay = "kHide",
      VScrollBarDisplay = "kVisible",
      VScrollBarWidth = 22,
      AutoScroll = true,
      AutoSize = true,
      AutoScrollMinSize = Vector2(281, 332),
      Gui.Control("goos_Content")({
        Size = Vector2(281, 2100),
        ComFuc.ComComplex(ComGoods, 1, NumeralConst.box_prize_num_max)
      })
    })
  }),
  Gui.Control("mainCtrl_1")({
    Size = Vector2(428, 480),
    BackgroundColor = colw,
    Skin = SkinF.openBox_004[1],
    ComFuc.ComControl("box_res", Vector2(40, 40), Vector2(82, 365), 255, SkinF.skin_touming),
    ComFuc.ComControl("box_key", Vector2(40, 40), Vector2(82, 401), 255, SkinF.skin_touming),
    ComFuc.ComLabel("openB_name", "\191\170\198\244\187\198\189\240\177\166\207\228", Vector2(180, 20), Vector2(135, 28), 0, 16, colw, "kAlignCenterMiddle"),
    ComFuc.ComLabel("box_count", "x 9999", Vector2(118, 20), Vector2(122, 375), 0, 16, colw),
    ComFuc.ComLabel("key_count", "x 9999", Vector2(118, 20), Vector2(122, 411), 0, 16, colw),
    ComFuc.ComButton("colse", nil, Vector2(24, 24), Vector2(360, 26), 0, false, false, SkinF.lookInfo_002),
    ComFuc.ComButton("look_good", GetUTF8Text("button_common_Check_Reward"), Vector2(84, 40), Vector2(282, 365), 16, false, true, SkinF.personalInfo_200),
    ComFuc.ComButton("bKey_buy", GetUTF8Text("button_common_Buy_Key"), Vector2(84, 40), Vector2(282, 401), 16, false, true, SkinF.personalInfo_200),
    ComFuc.ComButton("bBox_open", nil, Vector2(70, 71), Vector2(190, 306), 16, false, false, SkinF.openBox_005),
    ComFuc.ComControl("box_res_big", Vector2(251, 206), Vector2(98, 116), 255, SkinF.skin_touming)
  })
})

function DealEndQuickBuy()
  rpc.safecall("box_info", {
    type = 3,
    subType = 400,
    category = boxGrade
  }, DealBoxInfo)
  PersonalInfo.ReflashMail()
end

function ui.colse.EventClick(sender, e)
  Hide()
end

function ui.colse_2.EventClick(sender, e)
  ui.main.Size = Vector2(428, 480)
  ui.mainCtrl_2.Visible = false
  if ptBar then
    ui.main:UpdateLayout(true)
    gui:UpdateParticlePosition(ptBar, ui.mainCtrl_1:ClientToScreen(Vector2(214, 240)))
  end
end

function ui.look_good.EventClick(sender, e)
  ui.mainCtrl_2.Visible = not ui.mainCtrl_2.Visible
  if ui.mainCtrl_2.Visible then
    ui.main.Size = Vector2(837, 480)
  else
    ui.main.Size = Vector2(428, 480)
  end
  if ptBar then
    gui:UpdateLayout(true)
    local pos = ui.mainCtrl_1:ClientToScreen(Vector2(214, 240))
    print(pos.x, pos.y)
    gui:UpdateParticlePosition(ptBar, pos)
  end
end

function ui.bKey_buy.EventClick(sender, e)
  QuickBuy.Show({
    t = 3,
    st = "401",
    category = boxGrade
  })
  QuickBuy.callback = DealEndQuickBuy
end

function ui.bBox_open.EventClick(sender, e)
  if keyNumber <= 0 then
    MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1275"))
  else
    sender.Enable = false
    rpc.safecall("box_open", {
      type = 3,
      subType = 400,
      category = boxGrade
    }, DealBoxOpen)
    PersonalInfo.ReflashMail()
  end
end

function Show(data)
  gui:PlayAudio("putdown")
  boxGrade = data
  ui.box_res.Visible = false
  ui.box_key.Visible = false
  ui.mainCtrl_2.Visible = false
  rpc.safecall("box_info", {
    type = 3,
    subType = 400,
    category = boxGrade
  }, DealBoxInfo)
  rpc.safecall("box_prize_list", {
    type = 3,
    subType = 400,
    category = boxGrade
  }, DealBoxPrizeList)
  ui.coverControl2.Parent = gui
  ui.main.Size = Vector2(428, 480)
  if timer then
    TimerRemove()
  end
  TimerRefresh()
  ui.main.Parent = gui
end

function Hide()
  TimerRemove()
  ui.box_res.Visible = false
  ui.box_key.Visible = false
  ui.coverControl2.Parent = nil
  ui.main.Parent = nil
end
