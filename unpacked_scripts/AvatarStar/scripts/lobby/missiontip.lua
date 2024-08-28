module("MissionTip", package.seeall)
local GetGradeImage = Tip.GetGradeImage
local GetGradeColor = Tip.GetGradeColor
local GetCurrencyText = Tip.GetCurrencyText
local white = ARGB(255, 255, 255, 255)
local _T = Tip._T
local _L = Tip._L
local fl_pop = Gui.FlowLayout({
  Align = "kAlignCenterMiddle"
})()
local ctrl_accept = Gui.Control({
  Size = Vector2(809, 89),
  BackgroundColor = white,
  Skin = SkinF.mission_30
})()
local reward_height = 256
local ctrl_reward = Gui.Control({
  Size = Vector2(819, reward_height),
  BackgroundColor = white,
  Skin = SkinF.mission_31
})()
local np_get_reward = Gui.NewMessagePanel({
  Location = Vector2(0, 96),
  Size = Vector2(819, 22),
  FontSize = 18,
  Style = "LobbyBattleGame.tip_panel",
  MaxTextWidth = 819,
  BackgroundColor = ARGB(0, 0, 0, 0),
  TextAlign = "kAlignCenterMiddle",
  Skin = SkinF.skin_touming
})(ctrl_reward, nil)
local fl_reward = Gui.FlowLayout({
  Location = Vector2(0, 126),
  Size = Vector2(819, 80),
  Align = "kAlignCenterMiddle",
  ControlSpace = 12
})(ctrl_reward, nil)
local lb_reward_tip = Gui.Label({
  Location = Vector2(0, 214),
  Size = Vector2(819, 22),
  FontSize = 16
})(ctrl_reward, nil)
local reward_ui = {}

function ShowAccept()
  fl_pop.Size = Vector2(gui.Size.x, 89)
  fl_pop.Location = Vector2(0, 400)
  ctrl_reward.Parent = nil
  ctrl_accept.Parent = fl_pop
  fl_pop.Parent = gui
  local pt = gui:AddParticle("ui_jierenwu", Vector2(gui.Size.x / 2, gui.Size.y / 2), Vector3(0, 1, 0))
  Task.Schedule(function()
    gui:RemoveParticle(pt)
    pt = nil
    fl_pop.Parent = nil
  end, 1)
end

function HideAccept()
  fl_pop.Parent = nil
end

local currency_grade_image = {
  Gui.Icon("/ui/SkinF/skin_common_icon_gold01.tga", Vector4(0, 0, 0, 0)),
  Gui.Icon("/ui/SkinF/xingbi.tga", Vector4(0, 0, 0, 0)),
  Gui.Icon("/ui/SkinF/xunzhang.tga", Vector4(0, 0, 0, 0))
}
local currency_icon, UpdateReward = {
  IconsF.BigGpIcon,
  IconsF.BigMbIcon,
  IconsF.BigTbIcon
}, IconsF.BigGpIcon

function UpdateReward(data)
  for _, v in ipairs(reward_ui) do
    v.Parent = nil
  end
  np_get_reward:ClearMessage()
  np_get_reward:PushNewEmptyLine()
  np_get_reward:PushBlockToLastLine(_T("UI_store_Congratulations") .. "   ", ARGB(255, 255, 255, 0), false)
  np_get_reward:PushBlockToLastLine(_T("UI_store_Obtain") .. "   ", ARGB(255, 255, 255, 255), false)
  for i, v in ipairs(data.reward) do
    if not reward_ui[i] then
      Gui.CartBox({
        Size = Vector2(80, 80),
        BackgroundColor = white,
        Skin = SkinF.mission_19
      })(nil, reward_ui)
    end
    if v.type == 7 then
      local c = tonumber(v.itemId)
      np_get_reward:PushBlockToLastLine(" " .. GetCurrencyText(c), GetGradeColor(1, 2))
      reward_ui[i].Icon = currency_icon[c]
      reward_ui[i].GradeImage = GetGradeImage(1, 2)
      reward_ui[i].Count = v.unit
    else
      np_get_reward:PushBlockToLastLine(" " .. _T(v.displayName), GetGradeColor(v.grade))
      reward_ui[i].Icon = Tip.GetIcon(v.resource)
      reward_ui[i].GradeImage = GetGradeImage(v.grade, v.type)
      reward_ui[i].Count = v.unitType == 3 and v.unit or 0
    end
    reward_ui[i].Parent = fl_reward
  end
end

function ShowReward(data)
  UpdateReward(data)
  fl_pop.Size = Vector2(gui.Size.x, reward_height)
  fl_pop.Location = Vector2(0, 400)
  ctrl_accept.Parent = nil
  ctrl_reward.Parent = fl_pop
  fl_pop.Parent = gui
  local pt = gui:AddParticle("ui_jiaorenwu", Vector2(gui.Size.x / 2, gui.Size.y / 2), Vector3(0, 1, 0))
  Task.Schedule(function()
    fl_pop.Parent = nil
  end, 1.2)
end

local fl_pm = Gui.FlowLayout({
  Dock = "kDockFill",
  Align = "kAlignCenterMiddle",
  BackgroundColor = ARGB(128, 0, 0, 0)
})()
local ctrl_pm = Gui.Control({
  BackgroundColor = white,
  Skin = SkinF.mission_32
})(fl_pm, nil)
local btn_reward = Gui.Button({
  Size = Vector2(102, 40),
  Text = _T("UI_mission_get_reward")
})(ctrl_pm, nil)
local btn_delay = Gui.Button({
  Size = Vector2(102, 40),
  Text = _T("UI_mission_reward_later")
})(ctrl_pm, nil)

function btn_reward.EventClick(sender, e)
  if ptr_cast(game.CurrentState, "Client.StateAvatar") then
    Lobby.GoLobby(8)
  else
    Lobby.MainBtnSelect(8)
  end
  HidePM()
end

function btn_delay.EventClick(sender, e)
  HidePM()
end

local fl_pm_list = Gui.FlowLayout({
  Location = Vector2(12, 85),
  LineSpace = 5
})(ctrl_pm, nil)
local pm_ui = {}

function UpdatePM(data)
  for _, v in ipairs(pm_ui) do
    v[1].Parent = nil
  end
  local c = 0
  for i, v in ipairs(data.quests) do
    if v.state == 2 then
      c = c + 1
      if not pm_ui[c] then
        pm_ui[c] = {}
        Gui.Control({
          Size = Vector2(477, 29),
          BackgroundColor = white,
          Skin = SkinF.mission_33
        })(nil, pm_ui[c])
        Gui.Label({
          Location = Vector2(8, 4),
          Size = Vector2(380, 20),
          FontSize = 16
        })(pm_ui[c][1], pm_ui[c])
        Gui.Label({
          Location = Vector2(388, 4),
          Size = Vector2(81, 20),
          TextColor = ARGB(255, 52, 254, 5),
          TextAlign = "kAlignRightMiddle",
          FontSize = 16
        })(pm_ui[c][1], pm_ui[c])
      end
      pm_ui[c][2].Text = string.format(_T("tips_abilities_Lv_num_and_above_01"), v.minLevel, _L(v.name))
      pm_ui[c][3].Text = _T("UI_mission_misson_already")
      pm_ui[c][1].Parent = fl_pm_list
    end
  end
  if 0 < c then
    local height = 29 * c + (c - 1) * 5
    ctrl_pm.Size = Vector2(500, 155 + height)
    fl_pm_list.Size = Vector2(477, height)
    btn_reward.Location = Vector2(280, 102 + height)
    btn_delay.Location = Vector2(388, 102 + height)
    fl_pm.Parent = gui
  end
end

function ShowPM()
  rpc.safecall("player_quest_list", {}, UpdatePM)
end

function HidePM()
  fl_pm.Parent = nil
end
