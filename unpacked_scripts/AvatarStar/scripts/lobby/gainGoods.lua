module("GainGoods", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
coly = ARGB(255, 255, 255, 0)
colt = {
  ARGB(255, 180, 180, 180),
  ARGB(255, 54, 255, 0),
  ARGB(255, 0, 180, 255),
  ARGB(255, 198, 0, 255),
  ARGB(255, 255, 128, 0),
  ARGB(255, 255, 255, 255)
}
local resDir2 = "/ui/skinF/lobby/"
local callFuc, timer
local frameC = 0
local isRemain = false
local tip_sys_interface, ComCB = {
  "tip_sys_skill",
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_avatar",
  "tip_sys_avatar"
}, "tip_sys_skill"

function ComCB(i)
  return Gui.Control("gain_" .. i)({
    Size = Vector2(80, 80),
    Location = Vector2(-86 + 86 * i, 0),
    Skin = SkinF.skin_touming,
    ComFuc.ComControl("gain_" .. i .. "_lev", Vector2(80, 80), Vector2(0, 0), 255),
    ComFuc.ComControl("gain_" .. i .. "_res", Vector2(80, 80), Vector2(0, 0), 255),
    ComFuc.ComLabel("gain_" .. i .. "_count", nil, Vector2(36, 18), Vector2(43, 59), 0, 0, colw, "kAlignRightMiddle", SkinF.skin_touming, true, SkinF.hecheng_number_1)
  })
end

local ui = Gui.Create()({
  Gui.Control("main")({
    Size = Vector2(1180, 441),
    Dock = "kDockTopCenter",
    Gui.Control("main_son")({
      Size = Vector2(1200, 181),
      Location = Vector2(-10, 260),
      Gui.Control("main_sson")({
        Size = Vector2(1200, 181),
        BackgroundColor = colw,
        Skin = SkinF.gainGoods_001,
        Gui.NewMessagePanel("name_content")({
          Size = Vector2(1200, 20),
          Location = Vector2(0, 34),
          Style = "LobbyBattleGame.tip_panel",
          MaxTextWidth = 1200,
          BackgroundColor = col0,
          TextAlign = "kAlignCenterMiddle",
          Skin = SkinF.skin_touming,
          FontSize = 18
        }),
        Gui.Control("goods_content_p")({
          Size = Vector2(424, 80),
          Location = Vector2(388, 71),
          Skin = SkinF.skin_touming,
          Gui.Control("goods_content")({
            Size = Vector2(424, 80),
            Skin = SkinF.skin_touming,
            Dock = "kDockCenter",
            ComCB(1),
            ComCB(2),
            ComCB(3),
            ComCB(4),
            ComCB(5)
          })
        })
      })
    })
  })
})

function TimerRemove()
  game.TimerMgr:RemoveTimer(timer)
  frameC = 0
  ui.main.Parent = nil
  timer = nil
end

function TimerRefresh()
  local ts = math.min(1, frameC / 8)
  ComFuc.SetCtrlColorLcSize(ui.main_son, ui.main_son.Size, Vector2(-10, 60 + 200 * (1 - ts)), ARGB(ts * 255, 255, 255, 255))
  if not isRemain or frameC < 20 then
    frameC = frameC + 1
  end
  if 40 <= frameC then
    callFuc()
    ui.main.Parent = nil
    ComFuc.SetCtrlColorLcSize(ui.main_son, ui.main_son.Size, Vector2(-10, 260), ARGB(0, 255, 255, 255))
    TimerRemove()
  end
end

function Show(data, fuc, interf, interf2)
  callFuc = fuc or function()
  end
  ui.name_content.Size = Vector2(1200, 20)
  ui.name_content.Location = Vector2(0, 34)
  ui.goods_content_p.Location = Vector2(388, 71)
  ui.goods_content.Size = Vector2(#data * 86 - 6, 80)
  ui.name_content:ClearMessage()
  ui.name_content:PushNewEmptyLine()
  ui.name_content:PushBlockToLastLine(GetUTF8Text("UI_store_Congratulations") .. "   ", coly, false)
  ui.name_content:PushBlockToLastLine(GetUTF8Text("UI_store_Obtain") .. "   ", colw, false)
  for i, v in ipairs(data) do
    local tname = GetUTF8Text("id_common_Gold")
    ui["gain_" .. i .. "_lev"].Skin = SkinF.personalInfo_quality[v.grade]
    local tnum = 0
    if v.num then
      tnum = v.num
    elseif v.unit then
      tnum = v.unit
    end
    if tonumber(v.type) == 7 and (tonumber(v.id) == 1 or tonumber(v.id) == 2 or tonumber(v.id) == 3) then
      ui["gain_" .. i .. "_count"].Text = tnum
      ui["gain_" .. i .. "_res"].Skin = Gui.Gui.ControlSkin({
        BackgroundImage = Gui.Image("ui/skinF/skin_common_icon_gold01.tga", Vector4(0, 0, 0, 0))
      })
    else
      tname = v.displayName
      local res = v.resource
      if v.type == 2 and v.subType == 102 then
        local a = rpc.load_result("fuck = {" .. res .. "}")
        res = a.fuck[1]
      end
      ui["gain_" .. i .. "_res"].Skin = Gui.Gui.ControlSkin({
        BackgroundImage = Gui.Image(resDir2 .. res .. ".tga", Vector4(0, 0, 0, 0))
      })
    end
    if (v.unitType and v.unitType == 3 or v.type == 7) and 1 < tnum then
      ui["gain_" .. i .. "_count"].Text = tnum
    else
      ui["gain_" .. i .. "_count"].Text = nil
    end
    ui["gain_" .. i .. "_res"].EventMouseEnter = function(sender, e)
      if tonumber(v.type) ~= 7 then
        local temp = interf
        if interf2 and i == 1 then
          temp = interf2
        end
        Tip.SetRpc(temp, {
          t = v.type,
          prizeId = v.prizeId
        })
        Tip.SetUseDescription(false)
        Tip.SetOwner(sender)
      end
    end
    local tgrade = 1
    if v.grade and v.grade >= 1 and 6 >= v.grade then
      tgrade = v.grade
    end
    ui.name_content:PushBlockToLastLine(GetUTF8Text(tname) .. "   ", colt[tgrade], false)
  end
  if timer then
    TimerRemove()
  end
  isRemain = false
  ComFuc.SetCtrlColorLcSize(ui.main_son, ui.main_son.Size, Vector2(-10, 260), ARGB(0, 255, 255, 255))
  timer = game.TimerMgr:AddTimer(0.05)
  timer.EventOnTimer = TimerRefresh
  ui.main.Parent = gui
end

function ShowVip(data)
  function callFuc()
  end
  
  ui.name_content.Size = Vector2(1200, 60)
  ui.name_content.Location = Vector2(0, 88)
  ui.goods_content_p.Location = Vector2(388, 20)
  ui.goods_content.Size = Vector2(80, 80)
  ui.name_content:ClearMessage()
  ui.name_content:PushNewEmptyLine()
  ui.name_content:PushBlockToLastLine("  " .. string.format(GetUTF8Text("msgbox_common_num_1273"), 30), colw, false)
  for i, v in ipairs(data) do
    ui["gain_" .. i .. "_lev"].Skin = SkinF.personalInfo_quality[v.grade]
    ui["gain_" .. i .. "_res"].Skin = Gui.Gui.ControlSkin({
      BackgroundImage = Gui.Image(resDir2 .. v.resource .. ".tga", Vector4(0, 0, 0, 0))
    })
    ui["gain_" .. i .. "_count"].Text = nil
    ui["gain_" .. i .. "_res"].EventMouseEnter = function(sender, e)
      Tip.SetRpc(tip_sys_interface[3], {
        t = 3,
        sid = v.sid
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
    end
  end
  if timer then
    TimerRemove()
  end
  isRemain = false
  ComFuc.SetCtrlColorLcSize(ui.main_son, ui.main_son.Size, Vector2(-10, 260), ARGB(0, 255, 255, 255))
  timer = game.TimerMgr:AddTimer(0.05)
  timer.EventOnTimer = TimerRefresh
  ui.main.Parent = gui
end
