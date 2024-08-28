module("Auction", package.seeall)
local _T = GetUTF8Text
local white = Tip.white
local black = Tip.black
local brown = Tip.brown
local GetIcon = Tip.GetIcon
local GetGradeImage = Tip.GetGradeImage
local GetCurrencyText = Tip.GetCurrencyText
local GetCurrencyIcon = Tip.GetCurrencyIcon
local GetTimeText = AuctionRegister.GetTimeText
local buy_data = {
  pages = 1,
  page = 1,
  items = {}
}
local register_data = {
  page = 1,
  pages = 1,
  onSell = 0,
  maxCount = 10,
  sold = 0,
  items = {}
}
local balance_data = {
  page = 1,
  pages = 1,
  items = {}
}
local a_text = {
  _T("button_common_Browse"),
  _T("button_common_Register"),
  _T("button_common_Auction")
}
local tc_auction = Gui.TabControl({
  Style = "TabControl_01",
  Location = Vector2(7, 5),
  Size = Vector2(1128, 685),
  ClickAudio = "menu2nd"
})()
for _, v in ipairs(a_text) do
  tc_auction:AddItem(v)
end
local buy_ui = {}
local ctrl_top_buy = Gui.Control({
  Location = Vector2(20, 55),
  Size = Vector2(1088, 41),
  BackgroundColor = white,
  Skin = SkinF.shop_12
})(nil, buy_ui)
Gui.Label({
  Location = Vector2(10, 11),
  Size = Vector2(33, 19),
  FontSize = 16,
  TextColor = brown,
  Text = _T("UI_lobby_Level")
})(ctrl_top_buy, nil)
local txb_lv_1 = Gui.Textbox({
  Location = Vector2(49, 6),
  Size = Vector2(49, 30),
  MaxLength = 2,
  Number = true
})(ctrl_top_buy, nil)
Gui.Label({
  Location = Vector2(104, 11),
  Size = Vector2(13, 19),
  FontSize = 16,
  TextColor = brown,
  Text = "~"
})(ctrl_top_buy, nil)
local txb_lv_2 = Gui.Textbox({
  Location = Vector2(123, 6),
  Size = Vector2(49, 30),
  MaxLength = 2,
  Number = true
})(ctrl_top_buy, nil)
Gui.Label({
  Location = Vector2(190, 11),
  Size = Vector2(33, 19),
  FontSize = 16,
  TextColor = brown,
  Text = _T("UI_lobby_Name")
})(ctrl_top_buy, nil)
local txb_name = Gui.Textbox({
  Location = Vector2(230, 6),
  Size = Vector2(163, 30),
  MaxLength = 16
})(ctrl_top_buy, nil)
local btn_search = Gui.Button({
  Location = Vector2(411, 1),
  Size = Vector2(84, 40),
  Text = _T("UI_common_Search")
})(ctrl_top_buy, nil)
local btn_reset = Gui.Button({
  Location = Vector2(506, 1),
  Size = Vector2(84, 40),
  Text = _T("UI_common_Initialize")
})(ctrl_top_buy, nil)
local ckb_gp = Gui.CheckBox({
  Location = Vector2(972, 10),
  Size = Vector2(24, 24)
})(ctrl_top_buy, nil)
Gui.Label({
  Location = Vector2(940, 7),
  Size = Vector2(30, 30),
  BackgroundColor = white,
  Skin = SkinF.shop_02
})(ctrl_top_buy, nil)
local ckb_mb = Gui.CheckBox({
  Location = Vector2(1054, 10),
  Size = Vector2(24, 24)
})(ctrl_top_buy, nil)
Gui.Label({
  Location = Vector2(1022, 7),
  Size = Vector2(30, 30),
  BackgroundColor = white,
  Skin = SkinF.shop_10
})(ctrl_top_buy, nil)

function ckb_gp.EventCheckChanged(sender, e)
  if "kTriggerMouse" == e.Trigger and not ckb_mb.Check then
    sender.Check = true
  end
end

function ckb_mb.EventCheckChanged(sender, e)
  if "kTriggerMouse" == e.Trigger and not ckb_gp.Check then
    sender.Check = true
  end
end

local ctrl_filter = Gui.Control({
  Location = Vector2(20, 106),
  Size = Vector2(220, 562),
  BackgroundColor = white,
  Skin = SkinF.auction_01
})(nil, buy_ui)
Gui.Label({
  Location = Vector2(9, 6),
  Size = Vector2(202, 19),
  FontSize = 16,
  Text = _T("UI_common_Setting_Filter")
})(ctrl_filter, nil)
local lv = Gui.ListTreeView({
  Style = "AuctionListTreeView",
  Location = Vector2(10, 35),
  Size = Vector2(200, 562)
})(ctrl_filter, nil)
local filter = {
  {
    1,
    _T("button_store_equipment_button"),
    {nil, 2}
  },
  {
    2,
    _T("tips_abilities_Rifle"),
    {
      nil,
      2,
      1
    }
  },
  {
    2,
    _T("tips_abilities_Sniper_Rifle"),
    {
      nil,
      2,
      2
    }
  },
  {
    2,
    _T("UI_common_M_G"),
    {
      nil,
      2,
      3
    }
  },
  {
    2,
    _T("tips_abilities_Shotgun"),
    {
      nil,
      2,
      4
    }
  },
  {
    2,
    _T("tips_abilities_Pistol"),
    {
      nil,
      2,
      5
    }
  },
  {
    2,
    _T("tips_lobby_Common_Desc28"),
    {
      nil,
      2,
      11
    }
  },
  {
    2,
    _T("tips_abilities_Grenade"),
    {
      nil,
      2,
      10
    }
  },
  {
    2,
    "\185\173\188\253",
    {
      nil,
      2,
      12
    }
  },
  {
    2,
    "\182\220\197\198",
    {
      nil,
      2,
      13
    }
  },
  {
    2,
    "\182\204\181\182",
    {
      nil,
      2,
      6
    }
  },
  {
    2,
    "\187\172\207\232\215\176\214\195",
    {
      nil,
      2,
      102
    }
  },
  {
    2,
    _T("button_common_Ring"),
    {
      nil,
      2,
      103
    }
  },
  {
    1,
    _T("button_common_Item"),
    {nil, 3}
  },
  {
    1,
    _T("tips_abilities_Treasure_Chest"),
    {
      nil,
      3,
      202
    }
  },
  {
    1,
    _T("button_common_Avatar_Card"),
    {nil, 5}
  }
}
lv:AddColumn("", 140, "kAlignLeftMiddle")
local yellow = ARGB(255, 252, 221, 49)
local gray = ARGB(255, 164, 165, 165)
local node_1, node_2, node_3
for i, v in ipairs(filter) do
  if v[1] == 1 then
    node_1 = lv:AddItem(lv.RootItem, v[2])
    node_1.ID = i
    node_1:SetTextColor(0, yellow)
    node_1:SetHighLightTextColor(0, brown)
  elseif v[1] == 2 then
    if node_1 then
      node_2 = lv:AddItem(node_1, v[2])
      node_2.ID = i
      node_2:SetTextColor(0, white)
      node_2:SetHighLightTextColor(0, brown)
    end
  elseif v[1] == 3 and node_2 then
    node_2:SetTextColor(0, yellow)
    node_3 = lv:AddItem(node_2, v[2])
    node_3.ID = i
    node_3:SetTextColor(0, white)
    node_3:SetHighLightTextColor(0, brown)
  end
end
local fl_buy = Gui.FlowLayout({
  Location = Vector2(253, 106),
  Size = Vector2(854, 530),
  LineSpace = 5,
  Align = "kAlignCenterTop"
})(nil, buy_ui)
local buy_text, CreateHeader = {
  {
    292,
    _T("UI_lobby_Name")
  },
  {
    96,
    _T("tips_abilities_Quality")
  },
  {
    120,
    _T("UI_common_Current_Bid")
  },
  {
    120,
    _T("tips_common_additional_tips14")
  },
  {
    130,
    _T("UI_store_Seller")
  },
  {
    96,
    _T("tips_lobby_Common_Desc5")
  }
}, {
  292,
  _T("UI_lobby_Name")
}

function CreateHeader(p, text)
  local ah = Gui.AuctionHeader({
    SortIndex = 0,
    Size = Vector2(0, 31),
    Dock = "kDockTop",
    Margin = Vector4(0, 0, 0, 5),
    TextColor = white,
    FontSize = 16,
    TextShadowColor = ARGB(150, 0, 0, 0)
  })(p, nil)
  for _, vv in ipairs(text) do
    ah:AddItem(vv[1], vv[2])
  end
  return ah
end

local ah_buy = CreateHeader(fl_buy, buy_text)
local buy_item, CreateItem = {}, buy_text

function CreateItem(p, ui, text)
  for i = 1, 5 do
    local at = Gui.AuctionItem({
      Size = Vector2(p.Size.x, 93),
      TextColor = brown
    })(p, ui)
    for _, vv in ipairs(text) do
      at:AddItem(vv[1], "")
    end
  end
end

CreateItem(fl_buy, buy_item, buy_text)
local pg_buy = Gui.NewPagesBar({
  Location = Vector2(433, 632),
  Size = Vector2(260, 36)
})(nil, buy_ui)
local lb_bid = Gui.Label({
  Location = Vector2(739, 635),
  Size = Vector2(30, 30)
})(nil, buy_ui)
local txb_bid = Gui.Textbox({
  Location = Vector2(772, 635),
  Size = Vector2(112, 29),
  Number = true,
  MaxLength = 9,
  CONTROL_BALLOON_FRAME_DURATION = 1
})(nil, buy_ui)
local btn_bid = Gui.Button({
  Location = Vector2(892, 629),
  Size = Vector2(104, 40),
  Text = _T("button_common_Auction")
})(nil, buy_ui)
local btn_buy, ResetBuy = Gui.Button({
  Location = Vector2(1005, 629),
  Size = Vector2(102, 40),
  Text = _T("button_common_Fixed_Price")
})(nil, buy_ui), nil

function ResetBuy()
  txb_lv_1.Text = ""
  txb_lv_2.Text = ""
  txb_name.Text = ""
  ckb_gp.Check = true
  ckb_mb.Check = true
  ah_buy.SortIndex = 0
  lv.SelectedItem = nil
  local item = lv.RootItem.FirstChild
  while item do
    item.Expanded = false
    item = item:GetNextNode()
  end
end

function btn_reset.EventClick(sender, e)
  ResetBuy()
end

local sort_buy = {
  "NAME",
  "GRADE",
  "BIDDING_PRICE",
  "FIXED_PRICE",
  "AUCTIONEER_NAME",
  "EXPIRE_TIME"
}
local buy_args, UpdateBuyArgs = {}, "GRADE"
local UpdateBuyArgs, UpdateBuyList = function()
  buy_args.occupation = nil
  buy_args.t = nil
  buy_args.st = nil
  local item = lv.SelectedItem
  if item then
    local f = filter[item.ID][3]
    buy_args.occupation = f[1]
    buy_args.t = f[2]
    buy_args.st = f[3]
  end
  buy_args.p = pg_buy.CurrIndex
  buy_args.minLevel = tonumber(txb_lv_1.Text)
  buy_args.maxLevel = tonumber(txb_lv_2.Text)
  buy_args.itemName = txb_name.Text
  buy_args.order = ah_buy.SortUp and -1 or 1
  buy_args.orderField = sort_buy[ah_buy.SortIndex + 1]
end, "BIDDING_PRICE"
local UpdateBuyList, RequestBuyList = function()
  pg_buy.PageCount = buy_data.pages
  lb_bid.Icon = nil
  for i, v in ipairs(buy_item) do
    local item = buy_data.items[i]
    if item then
      v.Type = item.type
      v.TipId = item.itemId
      if item.type == 5 or item.type == 6 then
        item.resource = "humancard"
      end
      v.Icon = GetIcon(item.resource)
      v.Count = item.quantity
      v.GradeImage = GetGradeImage(item.grade, item.type)
      v:SetItemText(0, item.display)
      v:SetItemText(1, item.grade .. _T("tips_common_additional_tips15"))
      v:SetItemText(2, (item.biddingPrice or item.reservePrice) .. GetCurrencyText(item.currency))
      v:SetItemText(3, item.fixedPrice and item.fixedPrice .. GetCurrencyText(item.currency) or _T("tips_abilities_None"))
      v:SetItemText(4, item.auctioneerName)
      v:SetItemText(5, GetTimeText(item.leftTime))
      v.Ready = true
      if buy_data.sel == i then
        v.Selected = true
        lb_bid.Icon = GetCurrencyIcon(item.currency)
      else
        v.Selected = false
      end
    else
      v.Ready = false
    end
  end
end, "FIXED_PRICE"
local RequestBuyList, Search = function()
  rpc.safecall("auction_list", buy_args, function(data)
    buy_data = data
    UpdateBuyList()
  end)
end, "AUCTIONEER_NAME"

function Search()
  UpdateBuyArgs()
  RequestBuyList()
end

function btn_search.EventClick(sender, e)
  Search()
end

function lv.EventSelectItemChange(sender, e)
  if lv.SelectedItem then
    Search()
  end
end

local ah_buy.EventSortChanged, Bid = function(sender, e)
  Search()
end, function(sender, e)
  Search()
end

function Bid()
  if buy_data.sel then
    if not tonumber(txb_bid.Text) then
      txb_bid:Balloon(_T("UI_common_Enter_bid"))
      txb_bid.Focused = true
      return
    end
    local item = buy_data.items[buy_data.sel]
    MessageBox.ShowWaiter("\199\235\201\212\186\242")
    rpc.safecall("auction_bid", {
      aid = item.aid,
      price = tonumber(txb_bid.Text)
    }, function(data)
      MessageBox.CloseWaiter()
      MessageBox.ShowError(_T("tips_common_additional_tips17"))
      RequestBuyList()
    end, function()
      MessageBox.CloseWaiter()
    end)
  else
    MessageBox.ShowError(_T("UI_common_Please_select_item_to_be_auctioned"))
  end
end

local btn_bid.EventClick, Buy = function(sender, e)
  Bid()
end, function(sender, e)
  Bid()
end

function Buy()
  if buy_data.sel then
    local item = buy_data.items[buy_data.sel]
    MessageBox.ShowWaiter("\199\235\201\212\186\242")
    rpc.safecall("auction_buy", {
      aid = item.aid
    }, function(data)
      MessageBox.CloseWaiter()
      MessageBox.ShowError(_T("msgbox_common_num_1210"))
      RequestBuyList()
    end, function()
      MessageBox.CloseWaiter()
    end)
  else
    MessageBox.ShowError(_T("msgbox_common_num_1348"))
  end
end

function btn_buy.EventClick(sender, e)
  Buy()
end

function pg_buy.EventIndexChanged(sender, e)
  Search()
end

local tip_player_interface = {
  nil,
  "tip_player_item",
  "tip_player_item",
  "tip_player_item",
  "tip_player_avatar",
  "tip_player_avatar"
}
for i, v in ipairs(buy_item) do
  function v.EventTipActiveChanged(sender, e)
    if sender.Ready then
      Tip.SetRpc(tip_player_interface[sender.Type], {
        t = sender.Type,
        
        pid = sender.TipId
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
      Tip.SetOffset(Vector2(5, 4))
      Tip.SetAlignSize(Vector2(80, 80))
    end
  end
  
  function v.EventClick(sender, e)
    if sender.Ready then
      local index = tc_auction.SelectedIndex
      buy_data.sel = i
      UpdateBuyList()
    end
  end
end
local register_ui = {}
local ctrl_top_register = Gui.Control({
  Location = Vector2(20, 55),
  Size = Vector2(1088, 41),
  BackgroundColor = white,
  Skin = SkinF.shop_12
})(nil, register_ui)
local lb_register = Gui.Label({
  Location = Vector2(730, 12),
  Size = Vector2(195, 19),
  FontSize = 16,
  TextColor = brown
})(ctrl_top_register, nil)
local prop_register = Gui.ProportionBar({
  Location = Vector2(913, 14),
  Size = Vector2(159, 17),
  DrawValueText = true,
  Icon = SkinF.auction_05
})(ctrl_top_register, nil)
local fl_register = Gui.FlowLayout({
  Location = Vector2(20, 106),
  Size = Vector2(1087, 530),
  LineSpace = 5,
  Align = "kAlignCenterTop"
})(nil, register_ui)
local register_text = {
  {
    445,
    _T("UI_lobby_Name")
  },
  {
    96,
    _T("tips_abilities_Quality")
  },
  {
    160,
    _T("UI_common_Current_Bid")
  },
  {
    160,
    _T("tips_common_additional_tips14")
  },
  {
    130,
    _T("UI_common_Buyer")
  },
  {
    96,
    _T("tips_lobby_Common_Desc5")
  }
}
local ah_register = CreateHeader(fl_register, register_text)
local register_item = {}
CreateItem(fl_register, register_item, register_text)
local btn_register = Gui.Button({
  Location = Vector2(9, 1),
  Size = Vector2(120, 40),
  Text = _T("UI_common_Register_Item"),
  EventClick = function(sender, e)
    AuctionRegister.Show()
  end
})(ctrl_top_register, nil)
local pg_register = Gui.NewPagesBar({
  Location = Vector2(433, 632),
  Size = Vector2(260, 36)
})(nil, register_ui)
local btn_cancel = Gui.Button({
  Location = Vector2(883, 629),
  Size = Vector2(102, 40),
  Text = _T("UI_common_Cancel_login")
})(nil, register_ui)
local btn_cancel_all, UpdateRegisterList = Gui.Button({
  Location = Vector2(990, 629),
  Size = Vector2(117, 40),
  Text = _T("button_common_Cancel_all_registered")
})(nil, register_ui), nil

function UpdateRegisterList()
  prop_register.MaxValue = register_data.maxCount
  prop_register.CurrentValue = register_data.maxCount - register_data.onSell
  lb_register.Text = string.format("\191\201\181\199\188\199\180\206\202\253%d/\215\238\182\224%d\180\206", register_data.maxCount - register_data.onSell, register_data.maxCount)
  pg_register.PageCount = register_data.pages
  for i, v in ipairs(register_item) do
    local item = register_data.items[i]
    if item then
      v.Type = item.type
      v.TipId = item.itemId
      if item.type == 5 or item.type == 6 then
        item.resource = "humancard"
      end
      v.Icon = GetIcon(item.resource)
      v.Count = item.quantity
      v.GradeImage = GetGradeImage(item.grade, item.type)
      v:SetItemText(0, item.display)
      v:SetItemText(1, item.grade .. _T("tips_common_additional_tips15"))
      v:SetItemText(2, (item.biddingPrice or item.reservePrice) .. GetCurrencyText(item.currency))
      v:SetItemText(3, item.fixedPrice and item.fixedPrice .. GetCurrencyText(item.currency) or _T("tips_abilities_None"))
      v:SetItemText(4, item.bidderName or _T("tips_abilities_None"))
      v:SetItemText(5, GetTimeText(item.leftTime))
      v.Ready = true
    else
      v.Ready = false
    end
    v.Selected = register_data.sel == i
  end
end

local sort_register = {
  "NAME",
  "GRADE",
  "RESERVE_PRICE",
  "FIXED_PRICE",
  "AUCTIONEER_NAME",
  "EXPIRE_TIME"
}
local register_args, RequestRegisterList = {}, "GRADE"

function RequestRegisterList()
  register_args.p = pg_register.CurrIndex
  register_args.order = ah_register.SortUp and -1 or 1
  register_args.orderField = sort_register[ah_register.SortIndex + 1]
  rpc.safecall("auction_self_list", register_args, function(data)
    register_data = data
    UpdateRegisterList()
  end)
end

AuctionRegister.Update = RequestRegisterList

function ah_register.EventSortChanged(sender, e)
  RequestRegisterList()
end

function btn_cancel.EventClick(sender, e)
  if not register_data.items[1] then
    MessageBox.ShowError(_T("msgbox_common_num_1307"))
    return
  end
  if register_data.sel then
    MessageBox.ShowWithConfirmCancel(_T("msgbox_common_num_1297"), function(sender, e)
      local item = register_data.items[register_data.sel]
      MessageBox.ShowWaiter("\199\235\201\212\186\243...")
      rpc.safecall("auction_cancel", {
        aid = item.aid
      }, function(data)
        MessageBox.CloseWaiter()
        pg_register.PageCount = 1
        RequestRegisterList()
      end, function()
        MessageBox.CloseWaiter()
      end)
    end)
  else
    MessageBox.ShowError(_T("UI_common_Please_select_item_to_be_deregistered"))
  end
end

function btn_cancel_all.EventClick(sender, e)
  if not register_data.items[1] then
    MessageBox.ShowError(_T("msgbox_common_num_1307"))
    return
  end
  MessageBox.ShowWithConfirmCancel(_T("msgbox_common_num_1290"), function(sender, e)
    MessageBox.ShowWaiter("\199\235\201\212\186\243...")
    rpc.safecall("auction_cancel_all", {}, function(data)
      MessageBox.CloseWaiter()
      pg_register.PageCount = 1
      RequestRegisterList()
    end, function()
      MessageBox.CloseWaiter()
    end)
  end)
end

function pg_register.EventIndexChanged(sender, e)
  register_data.page = sender.CurrIndex
  RequestRegisterList()
end

for i, v in ipairs(register_item) do
  function v.EventTipActiveChanged(sender, e)
    if sender.Ready then
      Tip.SetRpc(tip_player_interface[sender.Type], {
        t = sender.Type,
        
        pid = sender.TipId
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
      Tip.SetOffset(Vector2(5, 4))
      Tip.SetAlignSize(Vector2(80, 80))
    end
  end
  
  function v.EventClick(sender, e)
    if sender.Ready then
      local index = tc_auction.SelectedIndex
      balance_data.sel = i
      UpdateBalanceList()
    end
  end
end

function CanSwitch()
  return true, _T("msgbox_common_num_1398")
end

function Show(p)
  ResetBuy()
  tc_auction.SelectedIndex = 0
  ShowBuy()
  buy_data = {
    page = 1,
    pages = 1,
    items = {}
  }
  UpdateBuyList()
  Search()
  tc_auction.Parent = p
end

function Hide()
  tc_auction.Parent = nil
end
