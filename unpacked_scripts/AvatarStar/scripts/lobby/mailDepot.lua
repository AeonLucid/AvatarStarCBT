module("MailDepot", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
colr = ARGB(255, 255, 0, 0)
colg = ARGB(255, 0, 255, 198)
coly = ARGB(255, 255, 214, 50)
colt = ARGB(255, 113, 83, 65)
cols = ARGB(255, 62, 26, 1)
colh = ARGB(255, 160, 160, 160)
dptDt = {}
depotCurr = 0
local resDir = "/ui/skinF/lobby/"
local closeCallBackFun
local hasInMail = {
  "0",
  "0",
  "0",
  "0",
  "0"
}
local ui, DealDepotList = Gui.Create()({
  Gui.Control("main")({
    Size = Vector2(592, 508),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_206,
    ComFuc.ComLabel("sep_1", GetUTF8Text("button_common_Bag"), Vector2(582, 21), Vector2(14, 4), 0, 16, colw),
    ComFuc.ComControl("right_main_2_son", Vector2(573, 357), Vector2(10, 87), 255, SkinF.personalInfo_131),
    ComFuc.SecMainTabBtn("btn_depot_" .. 1, "   " .. GetUTF8Text("button_store_equipment_button"), Vector2(136, 38), Vector2(22, 52)),
    ComFuc.SecMainTabBtn("btn_depot_" .. 2, "   " .. GetUTF8Text("button_common_Item"), Vector2(136, 38), Vector2(160, 52)),
    ComFuc.SecMainTabBtn("btn_depot_" .. 3, "   " .. GetUTF8Text("button_common_Gesture"), Vector2(136, 38), Vector2(298, 52)),
    ComFuc.SecMainTabBtn("btn_depot_" .. 4, "   " .. GetUTF8Text("button_common_Avatar_Card"), Vector2(136, 38), Vector2(436, 52)),
    ComFuc.ComPagesBar("pb_depot", Vector2(120, 458)),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(20, 40), 255, SkinF.personalInfo_203[1], true, false),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(158, 40), 255, SkinF.personalInfo_203[2], true, false),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(296, 40), 255, SkinF.personalInfo_203[3], true, false),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(434, 40), 255, SkinF.personalInfo_203[4], true, false),
    ComFuc.ComButton("main_close", nil, Vector2(24, 24), Vector2(560, 4), 0, false, false, SkinF.lookInfo_002)
  }),
  ComFuc.DepotCtrl(1, ComFuc.DepotCB, 24, "weapon", -54, -74, 2, MailDepot),
  ComFuc.DepotCtrl(2, ComFuc.DepotCB, 24, "prop", -54, -74, 3, MailDepot),
  ComFuc.DepotCtrl(3, ComFuc.DepotCB, 24, "pose", -54, -74, 4, MailDepot),
  ComFuc.DepotCtrl(4, ComFuc.CardKeyCB, 10, "person", -86, -154, 0, MailDepot),
  ComFuc.ComMoveControl(),
  ComFuc.ComMoveCard()
}), {
  Gui.Control("main")({
    Size = Vector2(592, 508),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_206,
    ComFuc.ComLabel("sep_1", GetUTF8Text("button_common_Bag"), Vector2(582, 21), Vector2(14, 4), 0, 16, colw),
    ComFuc.ComControl("right_main_2_son", Vector2(573, 357), Vector2(10, 87), 255, SkinF.personalInfo_131),
    ComFuc.SecMainTabBtn("btn_depot_" .. 1, "   " .. GetUTF8Text("button_store_equipment_button"), Vector2(136, 38), Vector2(22, 52)),
    ComFuc.SecMainTabBtn("btn_depot_" .. 2, "   " .. GetUTF8Text("button_common_Item"), Vector2(136, 38), Vector2(160, 52)),
    ComFuc.SecMainTabBtn("btn_depot_" .. 3, "   " .. GetUTF8Text("button_common_Gesture"), Vector2(136, 38), Vector2(298, 52)),
    ComFuc.SecMainTabBtn("btn_depot_" .. 4, "   " .. GetUTF8Text("button_common_Avatar_Card"), Vector2(136, 38), Vector2(436, 52)),
    ComFuc.ComPagesBar("pb_depot", Vector2(120, 458)),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(20, 40), 255, SkinF.personalInfo_203[1], true, false),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(158, 40), 255, SkinF.personalInfo_203[2], true, false),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(296, 40), 255, SkinF.personalInfo_203[3], true, false),
    ComFuc.ComControl(nil, Vector2(38, 47), Vector2(434, 40), 255, SkinF.personalInfo_203[4], true, false),
    ComFuc.ComButton("main_close", nil, Vector2(24, 24), Vector2(560, 4), 0, false, false, SkinF.lookInfo_002)
  }),
  ComFuc.DepotCtrl(1, ComFuc.DepotCB, 24, "weapon", -54, -74, 2, MailDepot),
  ComFuc.DepotCtrl(2, ComFuc.DepotCB, 24, "prop", -54, -74, 3, MailDepot),
  ComFuc.DepotCtrl(3, ComFuc.DepotCB, 24, "pose", -54, -74, 4, MailDepot),
  ComFuc.DepotCtrl(4, ComFuc.CardKeyCB, 10, "person", -86, -154, 0, MailDepot),
  ComFuc.ComMoveControl(),
  ComFuc.ComMoveCard()
}
local DealDepotList, rpc_storage_storage_list = function(data)
  ComFuc.CleanDepotTap(ui, MailDepot, depotCurr)
  ui.pb_depot.CurrIndex = data.page
  ui.pb_depot.PageCount = data.pages
  if depotCurr == 4 then
    for i = 1, 10 do
      ui["person_card_p_" .. i].Skin = SkinF.personalInfo_145
    end
  end
  for i, v in ipairs(data.items) do
    dptDt[v.slot] = v
    if depotCurr == 1 then
      local resname = ComFuc.DoWingRes(v.resource, v.subtype, 102)
      ComFuc.ShowOneButton(ui["weapon_p_" .. v.slot], ui["weapon_b_" .. v.slot], resDir, resname, v.grade, v, ui["weapon_bs_" .. v.slot], true)
    elseif depotCurr == 2 then
      ComFuc.ShowOneButton(ui["prop_p_" .. v.slot], ui["prop_b_" .. v.slot], resDir, v.resource, v.grade, v, ui["prop_bs_" .. v.slot], true)
      ComFuc.ShowQuaity(ui["prop_l_" .. v.slot], v.quantity)
    elseif depotCurr == 3 then
      ComFuc.ShowOneButton(ui["pose_p_" .. v.slot], ui["pose_b_" .. v.slot], resDir, v.resource, 0, v, ui["pose_bs_" .. v.slot], true)
    elseif depotCurr == 4 then
      local id = v.slot
      if v.slot >= 9 then
        id = v.slot + 8
      end
      ComFuc.SetPersonCardData(v.avatar, id)
      lg:UpdateStaticCardByInfoString(id, v.position)
      if ui["person_card_b_" .. v.slot] then
        ui["person_card_b_" .. v.slot].Visible = true
        if v and (v.isBind and (v.isBind == "true" or v.isBind == "Y") or v.isEquip and v.isEquip == "Y") then
          ui["person_card_bs_" .. v.slot].Visible = true
        end
      end
      if ui["person_card_p_" .. v.slot] then
        ui["person_card_p_" .. v.slot].Skin = SkinF.personalInfo_quality[v.grade]
      end
    end
    local t = {
      "weapon_bs_",
      "prop_bs_",
      "pose_bs_",
      "person_card_bs_"
    }
    for k = 1, 5 do
      if v.pid == hasInMail[k] then
        ui[t[depotCurr] .. v.slot].Visible = true
      end
    end
  end
end, Gui.Control("main")({
  Size = Vector2(592, 508),
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_206,
  ComFuc.ComLabel("sep_1", GetUTF8Text("button_common_Bag"), Vector2(582, 21), Vector2(14, 4), 0, 16, colw),
  ComFuc.ComControl("right_main_2_son", Vector2(573, 357), Vector2(10, 87), 255, SkinF.personalInfo_131),
  ComFuc.SecMainTabBtn("btn_depot_" .. 1, "   " .. GetUTF8Text("button_store_equipment_button"), Vector2(136, 38), Vector2(22, 52)),
  ComFuc.SecMainTabBtn("btn_depot_" .. 2, "   " .. GetUTF8Text("button_common_Item"), Vector2(136, 38), Vector2(160, 52)),
  ComFuc.SecMainTabBtn("btn_depot_" .. 3, "   " .. GetUTF8Text("button_common_Gesture"), Vector2(136, 38), Vector2(298, 52)),
  ComFuc.SecMainTabBtn("btn_depot_" .. 4, "   " .. GetUTF8Text("button_common_Avatar_Card"), Vector2(136, 38), Vector2(436, 52)),
  ComFuc.ComPagesBar("pb_depot", Vector2(120, 458)),
  ComFuc.ComControl(nil, Vector2(38, 47), Vector2(20, 40), 255, SkinF.personalInfo_203[1], true, false),
  ComFuc.ComControl(nil, Vector2(38, 47), Vector2(158, 40), 255, SkinF.personalInfo_203[2], true, false),
  ComFuc.ComControl(nil, Vector2(38, 47), Vector2(296, 40), 255, SkinF.personalInfo_203[3], true, false),
  ComFuc.ComControl(nil, Vector2(38, 47), Vector2(434, 40), 255, SkinF.personalInfo_203[4], true, false),
  ComFuc.ComButton("main_close", nil, Vector2(24, 24), Vector2(560, 4), 0, false, false, SkinF.lookInfo_002)
})
local rpc_storage_storage_list, SelDepotBtn = function(i)
  rpc.safecall("storage_storage_list", {
    t = depotCurr + 1,
    p = i,
    s = ComFuc.depotS[depotCurr]
  }, DealDepotList)
end, ComFuc.DepotCtrl(1, ComFuc.DepotCB, 24, "weapon", -54, -74, 2, MailDepot)
local SelDepotBtn, DragToMail = function(i)
  for j = 1, 4 do
    if i == j then
      ComFuc.ShowSecTap(ui, "depot", j, true, ui.right_main_2_son)
    else
      ComFuc.ShowSecTap(ui, "depot", j, false)
    end
  end
  if depotCurr ~= i then
    ComFuc.CleanDepotTap(ui, MailDepot, depotCurr)
    depotCurr = i
    rpc_storage_storage_list(1)
  end
end, ComFuc.DepotCtrl(2, ComFuc.DepotCB, 24, "prop", -54, -74, 3, MailDepot)
local DragToMail, WeaponUp = function(c, i, type)
  if Mail.IsMailWriteVisible() then
    for k = 1, 5 do
      if PersonalInfo.ComFuc.IsInAABB(c, Vector2(ComFuc.maBl[k].x, ComFuc.maBl[k].y), ComFuc.maS) then
        Mail.OnAddAttachment(k, dptDt[i], type)
        break
      end
    end
  end
end, ComFuc.DepotCtrl(3, ComFuc.DepotCB, 24, "pose", -54, -74, 4, MailDepot)
local WeaponUp, PropUp = function(i, c)
  gui:PlayAudio("putdown")
  DragToMail(c, i, 2)
  ui.moveControl.Parent = nil
end, ComFuc.DepotCtrl(4, ComFuc.CardKeyCB, 10, "person", -86, -154, 0, MailDepot)
local PropUp, PoseUp = function(i, c)
  gui:PlayAudio("putdown")
  DragToMail(c, i, 3)
  ui.moveControl.Parent = nil
end, ComFuc.ComMoveControl()
local PoseUp, PersonUp = function(i, c)
  gui:PlayAudio("putdown")
  DragToMail(c, i, 4)
  ui.moveControl.Parent = nil
end, ComFuc.ComMoveCard()

function PersonUp(i, c)
  gui:PlayAudio("putdown")
  DragToMail(c, i, 5)
  ui.moveCard.Parent = nil
  ui.moveCard_s.ID = -1
end

function SendToMailOK()
  rpc_storage_storage_list(ui.pb_depot.CurrIndex)
end

function SetItemInMail(itemQid, isIn)
  if itemQid and (itemQid ~= "0" or 0 < itemQid) then
    if isIn then
      for i = 1, 5 do
        if hasInMail[i] == "0" then
          hasInMail[i] = itemQid
          break
        end
      end
    else
      for i = 1, 5 do
        if hasInMail[i] == itemQid then
          hasInMail[i] = "0"
          break
        end
      end
    end
  end
  for i = 1, 24 do
    if dptDt[i] and dptDt[i].pid == itemQid then
      local t = {
        "weapon_bs_",
        "prop_bs_",
        "pose_bs_",
        "person_card_bs_"
      }
      ui[t[depotCurr] .. i].Visible = isIn
    end
  end
end

function CleanItemInMail()
  hasInMail = {
    "0",
    "0",
    "0",
    "0",
    "0"
  }
end

for i = 1, 4 do
  ui["btn_depot_" .. i].EventClick = function(sender, e)
    SelDepotBtn(i)
  end
end
for i = 1, 24 do
  ui["weapon_b_" .. i].EventMouseDown = function(sender, e)
    if not ui["weapon_bs_" .. i].Visible and dptDt[i] then
      local s, l, c = ComFuc.GetMoveMesg(sender)
      if sender.IsCapture then
        local resname = ComFuc.DoWingRes(dptDt[i].resource, dptDt[i].subtype, 102)
        ComFuc.ShowMoveControl(s, l, resDir, resname, dptDt[i].grade, ui.moveControl, ui.moveControl_son, true)
      else
        WeaponUp(i, c)
      end
    end
  end
  ui["weapon_b_" .. i].EventMouseMove = function(sender, e)
    ComFuc.OnMouseMove(sender, false, ui.moveCard, ui.moveControl, true)
  end
  ui["weapon_b_" .. i].EventMouseUp = function(sender, e)
    WeaponUp(i, sender.CurrentCursorPosition)
  end
end
for i = 1, 24 do
  ui["prop_b_" .. i].EventMouseDown = function(sender, e)
    if not ui["prop_bs_" .. i].Visible and dptDt[i] then
      local s, l, c = ComFuc.GetMoveMesg(sender)
      if sender.IsCapture then
        ComFuc.ShowMoveControl(s, l, resDir, dptDt[i].resource, dptDt[i].grade, ui.moveControl, ui.moveControl_son, true)
      else
        PropUp(i, c)
      end
    end
  end
  ui["prop_b_" .. i].EventMouseMove = function(sender, e)
    ComFuc.OnMouseMove(sender, false, ui.moveCard, ui.moveControl, true)
  end
  ui["prop_b_" .. i].EventMouseUp = function(sender, e)
    PropUp(i, sender.CurrentCursorPosition)
  end
end
for i = 1, 24 do
  ui["pose_b_" .. i].EventMouseDown = function(sender, e)
    if not ui["pose_bs_" .. i].Visible and dptDt[i] then
      local s, l, c = ComFuc.GetMoveMesg(sender)
      if sender.IsCapture then
        ComFuc.ShowMoveControl(s, l, resDir, dptDt[i].resource, 1, ui.moveControl, ui.moveControl_son, true)
      else
        PoseUp(i, c)
      end
    end
  end
  ui["pose_b_" .. i].EventMouseMove = function(sender, e)
    ComFuc.OnMouseMove(sender, false, ui.moveCard, ui.moveControl, true)
  end
  ui["pose_b_" .. i].EventMouseUp = function(sender, e)
    PoseUp(i, sender.CurrentCursorPosition)
  end
end
for i = 1, 10 do
  ui["person_card_b_" .. i].EventMouseDown = function(sender, e)
    if not ui["person_card_bs_" .. i].Visible then
      local s, l, c = ComFuc.GetMoveMesg(sender)
      if sender.IsCapture then
        ComFuc.ShowMoveCard(s, l, ui["person_card_s_" .. i], dptDt[i].grade, ui.moveCard, ui.moveCard_son, ui.moveCard_s, ui.moveCard_c, true)
      else
        PersonUp(i, c)
      end
    end
  end
  ui["person_card_b_" .. i].EventMouseMove = function(sender, e)
    ComFuc.OnMouseMove(sender, true, ui.moveCard, ui.moveControl, true)
  end
  ui["person_card_b_" .. i].EventMouseUp = function(sender, e)
    PersonUp(i, sender.CurrentCursorPosition)
  end
end

function ui.pb_depot.EventIndexChanged(sender, e)
  rpc_storage_storage_list(ui.pb_depot.CurrIndex)
end

function ui.main_close.EventClick(sender, e)
  Hide()
  if closeCallBackFun then
    closeCallBackFun()
  end
end

function Visible()
  return ui.main.Parent ~= nil
end

function Show(parent, fun1)
  if parent then
    ui.main.Parent = parent
  end
  closeCallBackFun = fun1
  depotCurr = 0
  SelDepotBtn(1)
end

function Hide()
  ui.main.Parent = nil
  PersonalInfo.ReflashMail()
end
