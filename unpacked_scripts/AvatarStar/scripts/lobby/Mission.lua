module("Mission", package.seeall)
local _T = GetUTF8Text
local _L = GetUTF8Text
local white = Tip.white
local brown = Tip.brown
local red = ARGB(255, 255, 79, 66)
local green = ARGB(255, 43, 255, 143)
local yellow = ARGB(255, 255, 214, 50)
local GetGradeImage = Tip.GetGradeImage
local GetCurrencyIcon = Tip.GetCurrencyIcon
local GetCurrencyText = Tip.GetCurrencyText
local ctrl_mission = Gui.Control({
  Location = Vector2(7, 5),
  Size = Vector2(1128, 685),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_098
})()
local ctrl_sl, Title = Gui.Control({
  Location = Vector2(13, 16),
  Size = Vector2(546, 399),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_206
})(ctrl_mission, nil), ctrl_mission

function Title(p, t)
  Gui.Label({
    Dock = "kDockTop",
    Size = Vector2(0, 30),
    TextPadding = Vector4(10, 0, 0, 0),
    FontSize = 16,
    Text = t
  })(p, nil)
end

Title(ctrl_sl, _T("UI_mission_Mission_List"))
Gui.Control({
  Location = Vector2(7, 36),
  Size = Vector2(533, 355),
  BackgroundColor = white,
  Skin = SkinF.mission_13
})(ctrl_sl, nil)
local ltv_sl = Gui.ListTreeView({
  Style = "MissionListTreeView_01",
  Location = Vector2(13, 42),
  Size = Vector2(522, 342),
  AutoExpand = true,
  ExpandPadding = Vector4(3, 7, 10, 7),
  ItemHeight = 42,
  VScrollBarSpace = 5,
  ItemClickAudio = "selecttask"
})(ctrl_sl, nil)
ltv_sl:AddColumn("", 393, "kAlignLeftMiddle")
ltv_sl:AddColumn("", 96, "kAlignRightMiddle")
local sl_node = {}
sl_node[1] = ltv_sl:AddItem(ltv_sl.RootItem, _T("UI_mission_Main_Mission"))
sl_node[1]:SetTextColor(0, brown)
sl_node[1]:SetHighLightTextColor(0, brown)
sl_node[1].ID = 1
sl_node[1].Skin = SkinF.mission_15
sl_node[2] = ltv_sl:AddItem(ltv_sl.RootItem, _T("UI_mission_Battlefield_Mission"))
sl_node[2]:SetTextColor(0, brown)
sl_node[2]:SetHighLightTextColor(0, brown)
sl_node[2].ID = 2
sl_node[2].Skin = SkinF.mission_16
local ctrl_pl = Gui.Control({
  Location = Vector2(13, 419),
  Size = Vector2(546, 256),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_206
})(ctrl_mission, nil)
Title(ctrl_pl, _T("UI_mission_Accepted_Mission"))
local ltv_pl = Gui.ListTreeView({
  Style = "MissionListTreeView_02",
  Location = Vector2(7, 36),
  Size = Vector2(532, 218),
  ItemHeight = 42,
  ItemClickAudio = "selecttask"
})(ctrl_pl, nil)
ltv_pl:AddColumn("", 6, "kAlignLeftMiddle")
ltv_pl:AddColumn("", 42, "kAlignLeftMiddle")
ltv_pl:AddColumn("", 338, "kAlignLeftMiddle")
ltv_pl:AddColumn("", 140, "kAlignRightMiddle")
local pm_item = {}
for i = 1, 5 do
  pm_item[i] = ltv_pl:AddItem(ltv_pl.RootItem, "")
  pm_item[i].CanSelect = false
end
local ctrl_info_1 = Gui.Control({
  Location = Vector2(563, 16),
  Size = Vector2(554, 659),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_124
})(ctrl_mission, nil)
local ctrl_info_2 = Gui.Control({
  Location = Vector2(7, 7),
  Size = Vector2(540, 645),
  BackgroundColor = white,
  Skin = SkinF.mission_03
})(ctrl_info_1, nil)
local ctrl_info_empty = Gui.Control({
  Location = Vector2(7, 7),
  Size = Vector2(540, 645),
  BackgroundColor = white,
  Skin = SkinF.mission_03
})()
local lb_icon = Gui.Label({
  Location = Vector2(22, 36),
  Size = Vector2(34, 34)
})(ctrl_info_2, nil)
local lb_name = Gui.Label({
  Location = Vector2(65, 41),
  Size = Vector2(450, 24),
  FontSize = 20,
  TextPadding = Vector4(10, 0, 0, 0),
  TextColor = yellow
})(ctrl_info_2, nil)
local lb_state = Gui.Label({
  Location = Vector2(432, 25),
  Size = Vector2(90, 55),
  BackgroundColor = white,
  Skin = SkinF.mission_18
})()
Gui.Label({
  Location = Vector2(16, 87),
  Size = Vector2(506, 20),
  FontSize = 16,
  Text = _T("UI_mission_Mission_Description"),
  TextColor = yellow
})(ctrl_info_2, nil)
local lb_desc, Line = Gui.Label({
  Location = Vector2(16, 111),
  Size = Vector2(506, 94),
  TextAlign = "kAlignLeftTop",
  AutoWrap = true,
  FontSize = 16
})(ctrl_info_2, nil), ctrl_info_2

function Line(y)
  Gui.Control({
    Location = Vector2(12, y),
    Size = Vector2(516, 2),
    BackgroundColor = white,
    Skin = SkinF.mission_02
  })(ctrl_info_2, nil)
end

Line(215)
Gui.Label({
  Location = Vector2(16, 217),
  Size = Vector2(506, 20),
  FontSize = 16,
  TextColor = yellow,
  Text = _T("UI_mission_Completion_Criteria")
})(ctrl_info_2, nil)
local lb_target = Gui.Label({
  Location = Vector2(16, 241),
  TextAlign = "kAlignLeftTop",
  Size = Vector2(506, 70),
  FontSize = 16,
  AutoWrap = true
})(ctrl_info_2, nil)
Line(319)
local lb_reward = Gui.Label({
  Location = Vector2(15, 321),
  Size = Vector2(506, 20),
  FontSize = 16,
  TextColor = yellow,
  Text = _T("UI_mission_Mission_Reward")
})(ctrl_info_2, nil)
local ctrl_money = Gui.Control({
  Location = Vector2(16, 335),
  Size = Vector2(506, 36)
})(nil, nil)
local fl_money = Gui.FlowLayout({
  Size = Vector2(428, 36)
})(ctrl_money, nil)
local money_ui, CreateMoneyUI = {}, nil

function CreateMoneyUI()
  local ui = {}
  ui.ctrl = Gui.Control({
    Size = Vector2(130, 36)
  })()
  ui[1] = Gui.Label({
    Location = Vector2(0, 6),
    Size = Vector2(30, 30)
  })(ui.ctrl, nil)
  ui[2] = Gui.Label({
    Location = Vector2(30, 10),
    Size = Vector2(100, 20),
    FontSize = 16,
    TextAlign = "kAlignLeftMiddle"
  })(ui.ctrl, nil)
  table.insert(money_ui, ui)
end

local fl_bb = Gui.FlowLayout({
  Location = Vector2(16, 370),
  Size = Vector2(332, 80),
  ControlSpace = 4
})(ctrl_info_2, nil)
local item_ui = {}
for i = 1, 4 do
  Gui.CartBox({
    Size = Vector2(80, 80),
    BackgroundColor = ARGB(0, 0, 0, 0),
    Skin = SkinF.mission_19,
    EventMouseEnter = function(sender, e)
      Tip.SetRpc("tip_sys_quest_reward_item", {
        t = 7,
        sid = sender.Id
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
    end
  })(nil, item_ui)
end
Line(454)
local lb_level = Gui.Label({
  Location = Vector2(16, 455),
  Size = Vector2(300, 30),
  FontSize = 16,
  TextColor = yellow
})(ctrl_info_2, nil)
local fl_level = Gui.FlowLayout({
  Location = Vector2(16, 479),
  Size = Vector2(488, 90),
  ControlSpace = 36
})(ctrl_info_2, nil)
local level_sel
local sm_list_data = {}
pm_list_data = nil
local level_text = {
  _T("tips_lobby_Common_Desc8"),
  _T("UI_mission_Elite"),
  "\211\162\208\219"
}
local small_level_icon = {
  SkinF.mission_24,
  SkinF.mission_25,
  SkinF.mission_26
}
local big_level_icon = {
  SkinF.mission_27,
  SkinF.mission_28,
  SkinF.mission_29
}
local level_ui = {}
local check_ui = {}
for i = 1, 3 do
  Gui.Control({
    Size = Vector2(106, 92)
  })(fl_level, level_ui)
  Gui.CheckBox({
    Location = Vector2(0, 29),
    Style = "Gui.CheckBox_01",
    Size = Vector2(24, 24),
    FontSize = 16
  })(level_ui[i], check_ui)
  Gui.Label({
    Location = Vector2(34, 0),
    Size = Vector2(66, 61),
    Icon = big_level_icon[i]
  })(level_ui[i], nil)
  Gui.Label({
    Location = Vector2(42, 51),
    Size = Vector2(66, 20),
    FontSize = 16,
    Text = level_text[i]
  })(level_ui[i], nil)
end
local btn_give_up = Gui.Button({
  Location = Vector2(316, 572),
  Size = Vector2(102, 60),
  Text = _T("button_common_Abandon")
})(nil, nil)
local btn_accept, ShowInfo = Gui.Button({
  Location = Vector2(424, 572),
  Size = Vector2(102, 60),
  Enable = false
})(ctrl_info_2, nil), ctrl_info_2
local ShowInfo, IsActive = function(s)
  if s then
    ctrl_info_empty.Parent = nil
    ctrl_info_2.Parent = ctrl_info_1
  else
    ctrl_info_2.Parent = nil
    ctrl_info_empty.Parent = ctrl_info_1
  end
end, nil

function IsActive()
  return Lobby.mainBtnPushDown == 8
end

local sm_item, CanNotAccept = {
  {},
  {},
  {}
}, {}
local CanNotAccept, GetSelPMState = function(q, lv)
  return lv < q.minLevel or q.canAccept == "N"
end, {}

function GetSelPMState(id)
  for _, v in ipairs(pm_list_data.quests) do
    if v.qid == id then
      return v.state
    end
  end
  return -1
end

local sl_node1_expanded, UpdateSMList = false, 20
local UpdateSMList, UpdateSMListData = function(t)
  for _, v in ipairs(sm_item[t]) do
    v.Parent = nil
  end
  local lv = PushCmd.GetLevel()
  local quests = sm_list_data[t].quests
  sl_node[t].CanSelect = 0 < #quests
  for i, v in ipairs(quests) do
    if not sm_item[t][i] then
      sm_item[t][i] = ltv_sl:CreateItem()
    end
    local item = sm_item[t][i]
    ltv_sl:AddExistingItem(sl_node[t], item)
    item.Tag = v.id
    local hover_color = brown
    local normal_color = white
    if CanNotAccept(v, lv) then
      lv_color = red
      hover_color = red
      normal_color = red
      item:SetIcon(1, nil, 0, false)
    elseif v.isAccepted == "N" then
      item:SetIcon(1, SkinF.mission_01, 0, true)
    else
      item:SetIcon(1, nil, 0, true)
    end
    item:SetTextColor(0, normal_color)
    item:SetHighLightTextColor(0, hover_color)
    item:SetText(0, string.format(_T("tips_abilities_Lv_num_and_above_01"), v.minLevel, _L(v.name)))
    local s_text = ""
    local s_normal_color = green
    local s_hover_color = brown
    local state = GetSelPMState(v.id)
    if state == 2 then
      s_text = _T("button_common_Complete")
      s_normal_color = yellow
    elseif state == 3 then
      s_text = _T("tips_common_additional_tips10")
      s_normal_color = red
      s_hover_color = red
    elseif state == 1 and v.isAccepted == "Y" then
      s_text = _T("msgbox_common_num_1334")
    end
    item:SetTextColor(1, s_normal_color)
    item:SetHighLightTextColor(1, s_hover_color)
    item:SetText(1, s_text)
  end
  local guide_quest = sm_list_data[1].quests[1]
  if guide_quest and guide_quest.id == "1001" and guide_quest.isAccepted == "N" then
    sl_node[1].Expanded = true
    if IsActive() then
      NewLead.ShowNewLeadEmptyHasParent(Vector2(35, 43), Vector2(461, 42), ltv_sl)
    end
  elseif not ltv_pl.SelectedItem then
    ltv_sl.SelectedItem = sm_item[1][1]
  end
  if sl_node1_expanded then
    sl_node[1].Expanded = true
    sl_node1_expanded = false
  end
  local empty = true
  for i = 1, 2 do
    if sl_node[i].FirstChild then
      empty = false
      break
    end
  end
end, _T("UI_mission_Accepted_Mission")

function UpdateSMListData(data)
  for w in string.gmatch(data.t, "%d+") do
    local n = tonumber(w)
    sm_list_data[n] = {
      t = n,
      quests = {}
    }
  end
  for _, v in ipairs(data.quests) do
    if sm_list_data[v.type] then
      table.insert(sm_list_data[v.type].quests, v)
    end
  end
  for i = 1, 2 do
    UpdateSMList(i)
  end
end

local RequestSMList, RequestAllSMList = function(args)
  rpc.safecall("sys_quest_list", args, function(data)
    UpdateSMListData(data)
  end)
end, function(args)
  rpc.safecall("sys_quest_list", args, function(data)
    UpdateSMListData(data)
  end)
end

function RequestAllSMList()
  rpc.safecall("sys_quest_list", {t = "1;2;"}, function(data)
    UpdateSMListData(data)
  end)
end

local GetOccupationNA, SetReward = Tip.GetOccupationNA, _T("UI_mission_Accepted_Mission")

function SetReward(r)
  ctrl_money.Parent = nil
  for _, v in ipairs(money_ui) do
    v.ctrl.Parent = nil
  end
  for _, v in ipairs(item_ui) do
    v.Parent = nil
  end
  local money_index = 1
  local item_index = 1
  for i, v in ipairs(r) do
    if v.type == 7 then
      if not money_ui[money_index] then
        CreateMoneyUI()
      end
      local currency = tonumber(v.itemId)
      money_ui[money_index][1].Icon = GetCurrencyIcon(currency)
      money_ui[money_index][2].Text = v.unit
      money_ui[money_index].ctrl.Parent = fl_money
      money_index = money_index + 1
      ctrl_money.Parent = ctrl_info_2
    elseif not GetOccupationNA(v.occupation) then
      item_ui[item_index].Id = v.id
      item_ui[item_index].Icon = Tip.GetIcon(v.resource)
      item_ui[item_index].GradeImage = GetGradeImage(v.grade, v.type)
      item_ui[item_index].Parent = fl_bb
      if v.unitType == 3 then
        item_ui[item_index].Count = v.unit
      else
        item_ui[item_index].Count = 0
      end
      item_index = item_index + 1
    end
  end
end

local info_data, GetSelSM = nil, _T("UI_mission_Accepted_Mission")

function GetSelSM(t, id)
  for _, v in ipairs(sm_list_data[t].quests) do
    if v.id == id then
      return v
    end
  end
end

local type_icon, UpdateInfo = {
  SkinF.mission_21,
  SkinF.mission_22,
  SkinF.mission_23
}, SkinF.mission_21

function UpdateInfo()
  lb_icon.Icon = type_icon[info_data.type]
  lb_name.Text = _L(info_data.name)
  lb_state.Parent = nil
  local info = info_data.info[level_sel]
  lb_desc.Text = _L(info.description)
  lb_target.Text = _L(info.objectiveDesc)
  if info_data.sys then
    lb_level.Text = _T("UI_mission_Mission_Difficulty_Selection")
    btn_give_up.Parent = nil
    if info_data.isAccepted == "Y" then
      btn_accept.Text = _T("button_common_Receive_Reward")
      btn_accept.Enable = false
    else
      btn_accept.Text = _T("button_common_Accept_Mission")
      local lv = PushCmd.GetLevel()
      local q = GetSelSM(info_data.type, info_data.id)
      if q and CanNotAccept(q, lv) then
        btn_accept.Enable = false
      else
        btn_accept.Enable = true
      end
    end
  else
    btn_give_up.Parent = ctrl_info_2
    btn_give_up.Enable = true
    lb_level.Text = _T("UI_common_Mission_Difficulty")
    btn_accept.Text = _T("button_common_Receive_Reward")
    if info_data.state == 1 or info_data.state == 3 then
      btn_accept.Enable = false
    elseif info_data.state == 2 then
      btn_accept.Enable = true
      lb_state.Parent = ctrl_info_2
    end
  end
  SetReward(info.reward)
  if info_data.qid == "1000" and IsActive() then
    NewLead.ShowNewLeadNoLock(Vector2(1029, 755), Vector2(102, 60), GetUTF8Text("UI_common_Click"), 0)
    Sociality.Hide()
  end
  ShowInfo(true)
end

for i, v in ipairs(check_ui) do
  function v.EventCheckChanged(sender, e)
    if "kTriggerMouse" == e.Trigger then
      sender.Check = true
      
      if level_sel ~= i then
        level_sel = i
        UpdateInfo()
        for j = 1, 3 do
          if j ~= i then
            check_ui[j].Check = false
          end
        end
      end
    end
  end
  
  local RequestSMInfo = _T("UI_mission_Accepted_Mission")
end

function UpdatePMList()
  for i, v in ipairs(pm_item) do
    local q = pm_list_data.quests[i]
    if q then
      v:SetIcon(1, small_level_icon[q.difficulty])
      v.Tag = q.id
      v:SetText(2, _L(q.name))
      v:SetTextColor(2, white)
      v:SetHighLightTextColor(2, brown)
      v.CanSelect = true
      local s_normal_color = green
      local s_hover_color = brown
      if q.state == 2 then
        s_text = _T("button_common_Complete")
        s_normal_color = yellow
      elseif q.state == 3 then
        s_text = _T("tips_common_additional_tips10")
        s_normal_color = red
        s_hover_color = red
      elseif q.processDesc then
        local pd = _L(q.processDesc)
        for k, vv in pairs(q.parameter) do
          pd = string.gsub(pd, "{{" .. k .. "}}", vv)
        end
        s_text = pd
      else
        s_text = _T("msgbox_common_num_1334")
      end
      v:SetTextColor(3, s_normal_color)
      v:SetHighLightTextColor(3, s_hover_color)
      v:SetText(3, s_text)
      if q.state ~= 3 and q.qid == "1021" and SelectCharacter.isHaveGuild == "Y" then
        rpc.safecall("player_quest_accompish_client", {
          questId = q.id
        }, function(data)
        end)
      end
    else
      v.Tag = 0
      v:SetIcon(1, nil)
      v:SetText(2, "")
      v:SetText(3, "")
      v.CanSelect = false
    end
  end
  if pm_list_data and #pm_list_data.quests > 0 then
    ltv_pl.SelectedItem = pm_item[1]
  end
end

local RequestPMList, RequestPMInfo = function()
  rpc.safecall("player_quest_list", {}, function(data)
    ComFuc.taskLists = data.quests
    pm_list_data = data
    UpdatePMList()
  end)
end, function(args)
  rpc.safecall("sys_quest_info", args, function(data)
    table.sort(data.info, function(t1, t2)
      return t1.difficulty < t2.difficulty
    end)
    info_data = data
    info_data.sys = true
    level_sel = 1
    for i = 1, 3 do
      level_ui[i].Visible = data.info[i]
    end
    check_ui[1].Check = true
    check_ui[2].Check = false
    check_ui[3].Check = false
    UpdateInfo()
  end)
end
local GetSelPMId = function(args)
  rpc.safecall("player_quest_info", args, function(data)
    info_data = data
    info_data.sys = false
    level_sel = 1
    for i, v in ipairs(level_ui) do
      if data.info[1].difficulty == i then
        v.Visible = true
        check_ui[i].Check = true
      else
        v.Visible = false
      end
    end
    UpdateInfo()
  end)
end

function RequestSMInfo(sender, e)
  NewLead.HideLead()
  ShowInfo(false)
  local item = sender.SelectedItem
  if item and item.Level > 0 then
    ltv_pl.SelectedItem = nil
    local id = GetSelPMId(ptr_cast(item.Tag))
    if id then
      RequestPMInfo({id = id})
    else
      RequestSMInfo({
        type = item.Parent.ID,
        id = ptr_cast(item.Tag)
      })
    end
  end
end

ltv_sl.EventSelectItemChange = RequestSMInfo

function RequestSMInfo(sender, e)
  local item = sender.SelectedItem
  if item and ptr_cast(item.Tag) == "1001" and not GetSelPMId(ptr_cast(item.Tag)) then
    NewLead.HideLead()
    if IsActive() then
      NewLead.ShowNewLeadNoLock(Vector2(1029, 755), Vector2(102, 60), GetUTF8Text("UI_common_Click"), 0)
      Sociality.Hide()
    end
  end
end

ltv_sl.EventClick = RequestSMInfo

function RequestSMInfo(sender, e)
  ShowInfo(false)
  local item = sender.SelectedItem
  if item then
    ltv_sl.SelectedItem = nil
    RequestPMInfo({
      id = ptr_cast(item.Tag)
    })
  end
end

local ltv_pl.EventSelectItemChange, RequestAcceptSM = RequestSMInfo, function(id)
  for _, v in ipairs(pm_list_data.quests) do
    if v.qid == id then
      return v.id
    end
  end
  return nil
end
local RequestSMInfo, RequestDeliverPM = function(args)
  ltv_sl.SelectedItem = nil
  ltv_pl.SelectedItem = nil
  rpc.safecall("sys_quest_accept", args, function(data)
    MissionTip.ShowAccept()
    if data.qid == "1001" and IsActive() then
      NewLead.ShowNewLeadNoLock(Vector2(371, 78), Vector2(72, 73), GetUTF8Text("UI_common_Click"), 1)
    end
  end)
end, _T("UI_mission_Accepted_Mission")
local RequestDeliverPM, RequestGiveUpPM = function(args)
  local info = info_data.info[level_sel]
  ltv_sl.SelectedItem = nil
  ltv_pl.SelectedItem = nil
  rpc.safecall("player_quest_deliver", args, function(data)
    MissionTip.ShowReward(data)
  end)
end, function(sender, e)
  if "kTriggerMouse" == e.Trigger then
    sender.Check = true
    if level_sel ~= i then
      level_sel = i
      UpdateInfo()
      for j = 1, 3 do
        if j ~= i then
          check_ui[j].Check = false
        end
      end
    end
  end
end

function RequestGiveUpPM(args)
  ltv_sl.SelectedItem = nil
  ltv_pl.SelectedItem = nil
  rpc.safecall("player_quest_giveup", args, function(data)
  end)
end

function btn_give_up.EventClick(sender, e)
  MessageBox.ShowWithConfirmCancel(_T("msgbox_common_num_1370"), function(sender, e)
    if info_data then
      btn_give_up.Enable = false
      btn_accept.Enable = false
      RequestGiveUpPM({
        id = info_data.id
      })
    end
  end)
end

function btn_accept.EventClick(sender, e)
  if info_data then
    btn_give_up.Enable = false
    btn_accept.Enable = false
    local info = info_data.info[level_sel]
    if info_data.sys then
      NewLead.HideLead()
      RequestAcceptSM({
        infoId = info.id,
        qid = info_data.id
      })
    else
      NewLead.HideLead()
      local electId
      for _, v in ipairs(info.reward) do
        if v.isElect == "Y" and not GetOccupationNA(v.occupation) then
          electId = v.id
        end
      end
      RequestDeliverPM({
        id = info_data.id,
        qid = info_data.qid,
        electId = electId
      })
    end
  end
end

function Active()
  return ctrl_mission.Parent ~= nil
end

function Show(p)
  ShowInfo(false)
  sl_node1_expanded = true
  sl_node[2].Expanded = false
  ltv_sl:ScrollToItem(sl_node[1])
  RequestPMList()
  RequestAllSMList()
  ctrl_mission.Parent = p
end

function Hide()
  ltv_sl.SelectedItem = nil
  ltv_pl.SelectedItem = nil
  ctrl_mission.Parent = nil
end
