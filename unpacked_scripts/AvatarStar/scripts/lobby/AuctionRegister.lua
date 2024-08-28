module("AuctionRegister", package.seeall)
local _T = GetUTF8Text
local white = ARGB(255, 255, 255, 255)
local brown = ARGB(255, 62, 26, 1)
local GetIcon = Tip.GetIcon
local GetGradeImage = Tip.GetGradeImage
local args = {}
local fl_register = Gui.FlowLayout({
  Dock = "kDockFill",
  Align = "kAlignCenterMiddle",
  ControlSpace = 10,
  BackgroundColor = ARGB(128, 0, 0, 0)
})()
local ctrl_register = Gui.Control({
  Size = Vector2(858, 510),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_207
})(fl_register, nil)
local title_ui = {}
ShopBalance.CreateTitle(ctrl_register, title_ui, _T("button_common_Register"))

function title_ui.btn.EventClick(sender, e)
  Hide()
end

local ctrl_bg = Gui.Control({
  Location = Vector2(8, 51),
  Size = Vector2(264, 394),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_131
})(ctrl_register, nil)
local tip_player_interface = {
  nil,
  "tip_player_item",
  "tip_player_item",
  "tip_player_item",
  "tip_player_avatar",
  "tip_player_avatar"
}
local cb = Gui.CartBox({
  Location = Vector2(93, 50),
  Size = Vector2(80, 80),
  Skin = SkinF.auction_07,
  EventClick = function(sender, e)
    sender.Icon = nil
  end,
  EventMouseEnter = function(sender, e)
    if sender.Icon then
      Tip.SetRpc(tip_player_interface[args.t], {
        t = args.t,
        pid = args.pid
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
    end
  end
})(ctrl_bg, nil)
local ctrl_money = Gui.Control({
  Location = Vector2(10, 178),
  Size = Vector2(244, 202),
  BackgroundColor = white,
  Skin = SkinF.battle_005
})(ctrl_bg, nil)
Gui.Label({
  Location = Vector2(12, 19),
  Size = Vector2(39, 18),
  FontSize = 16,
  TextColor = brown,
  Text = "\177\210\214\214"
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(99, 13),
  Size = Vector2(30, 30),
  BackgroundColor = white,
  Skin = SkinF.shop_02
})(ctrl_money, nil)
local ckb_gp = Gui.CheckBox({
  Style = "Gui.CheckBox_01",
  Location = Vector2(135, 18),
  Size = Vector2(20, 20)
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(169, 13),
  Size = Vector2(30, 30),
  BackgroundColor = white,
  Skin = SkinF.shop_10
})(ctrl_money, nil)
local ckb_mb = Gui.CheckBox({
  Style = "Gui.CheckBox_01",
  Location = Vector2(205, 18),
  Size = Vector2(20, 20)
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(12, 47),
  Size = Vector2(50, 26),
  FontSize = 16,
  TextColor = brown,
  Text = _T("UI_common_Start_Price")
})(ctrl_money, nil)
local txb_start_price = Gui.Textbox({
  Location = Vector2(89, 47),
  Size = Vector2(140, 26),
  Number = true,
  MaxLength = 9,
  CONTROL_BALLOON_FRAME_DURATION = 1
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(12, 79),
  Size = Vector2(50, 26),
  FontSize = 16,
  TextColor = brown,
  Text = _T("tips_common_additional_tips14")
})(ctrl_money, nil)
local txb_fixed_price = Gui.Textbox({
  Location = Vector2(89, 79),
  Size = Vector2(140, 26),
  Number = true,
  MaxLength = 9
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(12, 111),
  Size = Vector2(67, 26),
  FontSize = 16,
  TextColor = brown,
  Text = _T("UI_common_Auction_Period")
})(ctrl_money, nil)
local cmb = Gui.ComboBox({
  Location = Vector2(89, 111),
  Size = Vector2(140, 26)
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(10, 144),
  Size = Vector2(224, 2),
  BackgroundColor = white,
  Skin = SkinF.auction_06
})(ctrl_money, nil)
Gui.Label({
  Location = Vector2(12, 155),
  Size = Vector2(50, 26),
  FontSize = 16,
  TextColor = brown,
  Text = _T("UI_common_Admin_Fee")
})(ctrl_money, nil)
lb_poundage = ShopBalance.CreateMoneyLabel(ctrl_money, Vector2(89, 155), white, SkinF.shop_02)
local btn_auction = Gui.Button({
  Location = Vector2(52, 454),
  Size = Vector2(182, 40),
  Text = " \181\199\188\199\197\196\194\244"
})(ctrl_register, nil)

function SetArgs(t, p, s, item)
  args.t = t
  args.p = p
  args.slot = s
  args.pid = item.pid
  cb.Icon = GetIcon(t == 5 and "humancard" or item.resource)
  cb.GradeImage = GetGradeImage(item.grade, t)
  cb.Count = item.unitType == 3 and item.quantity or 0
end

local time_list = {
  {
    3,
    _T("UI_common_Very_Short")
  },
  {6, "\182\204"},
  {12, "\214\208"},
  {
    math.huge,
    "\179\164"
  }
}

function GetTimeText(m)
  local index = 0
  for i, v in ipairs(time_list) do
    if m > v[1] * 60 then
      index = i
    end
  end
  return time_list[index + 1][2]
end

for i = 1, #time_list - 1 do
  cmb:AddItem(time_list[i][1] .. _T("tips_lobby_Common_Desc31"))
end
cmb.SelectedIndex = 0

function ckb_gp.EventCheckChanged(sender, e)
  if e.Trigger == "kTriggerMouse" then
    sender.Check = true
    ckb_mb.Check = false
  end
end

local ckb_mb.EventCheckChanged, CheckArgs = function(sender, e)
  if e.Trigger == "kTriggerMouse" then
    sender.Check = true
    ckb_gp.Check = false
  end
end, function(sender, e)
  if e.Trigger == "kTriggerMouse" then
    sender.Check = true
    ckb_gp.Check = false
  end
end
local CheckArgs, Reset = function()
  if not cb.Icon then
    MessageBox.ShowError(_T("tips_lobby_Common_Desc30"))
    return false
  end
  args.duration = time_list[cmb.SelectedIndex + 1][1] * 60
  local p = tonumber(txb_start_price.Text)
  if p == nil then
    txb_start_price:Balloon(_T("msgbox_common_num_1339"))
    txb_start_price.Focused = true
    return false
  end
  if ckb_gp.Check then
    args.currency = 1
  else
    args.currency = 2
  end
  args.reservePrice = p
  args.fixedPrice = tonumber(txb_fixed_price.Text)
  MessageBox.ShowWaiter(_T("tips_common_additional_tips16"))
  return true
end, #time_list - 1
local Reset, Register = function()
  cb.Icon = nil
  cb.Count = 0
  cb.GradeImage = nil
  ckb_gp.Check = true
  ckb_mb.Check = false
  cmb.SelectedIndex = 0
  txb_start_price.Text = ""
  txb_fixed_price.Text = ""
end, 1

function Register()
  if CheckArgs() then
    rpc.safecall("auction_start", args, function(data)
      Reset()
      MessageBox.CloseWaiter()
      MessageBox.ShowError(_T("msgbox_common_num_1389"))
      UpdateStorageList()
      Update()
      ComFuc.TestIsFinishOneTask(1022)
    end, function()
      MessageBox.CloseWaiter()
    end)
  end
end

function btn_auction.EventClick(sender, e)
  Register()
end

function Show()
  Reset()
  PersonalInfo.IsCallDepot = 1
  PersonalInfo.ui.right.Parent = ctrl_register
  PersonalInfo.ui.right.Location = Vector2(268, 0)
  title_ui.lb.Parent = ctrl_register
  PersonalInfo.ui.right_main_2.Parent = PersonalInfo.ui.right
  PersonalInfo.ui.right_main_2.BackgroundColor = ARGB(0, 0, 0, 0)
  PersonalInfo.ui.right_main_3.Parent = nil
  PersonalInfo.ui.sep_1.Visible = false
  PersonalInfo.SelDepotBtn(1)
  fl_register.Parent = gui
end

function Hide()
  fl_register.Parent = nil
  PersonalInfo.ResetBagUI()
end
