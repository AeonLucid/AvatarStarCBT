module("ShopBalance", package.seeall)
local _T = GetUTF8Text
local _L = GetUTF8Text
local white = Tip.white
local brown = Tip.brown
local yellow = Tip.yellow
local GetIcon = Tip.GetIcon
local GetPrice = Tip.GetPrice
local GetGradeImage = Tip.GetGradeImage
local GetCurrencyText = Tip.GetCurrencyText
local GetCurrencyIcon = Tip.GetCurrencyIcon
local format = string.format
list = {}
give = false
local friend_list = {}

function GetPriceId(item)
  return item.price[item.price_index].priceId
end

local fl_balance = Gui.FlowLayout({
  Dock = "kDockFill",
  Align = "kAlignCenterMiddle",
  BackgroundColor = ARGB(128, 0, 0, 0)
})()
local ctrl_balance = Gui.Control({
  Size = Vector2(966, 635),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_207
})(fl_balance, nil)
local title_ui = {}

function CreateTitle(p, ui, t)
  ui.lb = Gui.Label({
    Size = Vector2(0, 30),
    Dock = "kDockTop",
    TextPadding = Vector4(10, 0, 0, 0),
    FontSize = 16,
    Text = t
  })(p, nil)
  ui.btn = Gui.Button({
    Size = Vector2(24, 24),
    Margin = Vector4(0, 3, 8, 4),
    Dock = "kDockRight",
    Skin = SkinF.lookInfo_002
  })(ui.lb, nil)
end

CreateTitle(ctrl_balance, title_ui, "")

function title_ui.btn.EventClick(sender, e)
  Hide()
end

local ctrl_bb = Gui.Control({
  Location = Vector2(9, 44),
  Size = Vector2(375, 573)
})(ctrl_balance, nil)
local fl_bb = Gui.FlowLayout({
  Size = Vector2(371, 527),
  LineSpace = 1
})(ctrl_bb, nil)
local bb_ui = {}
for i = 1, 4 do
  Gui.BuyBox({Style = "BuyBox_01", State = "kBSBalance"})(nil, bb_ui)
end
local pg_list = Gui.NewPagesBar({
  Location = Vector2(60, 534),
  Size = Vector2(260, 36)
})(ctrl_bb, nil)
local ctrl_price = Gui.Control({
  Location = Vector2(386, 44),
  Size = Vector2(571, 527),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_208
})(ctrl_balance, nil)
Gui.Label({
  Location = Vector2(10, 7),
  Size = Vector2(301, 21),
  FontSize = 16,
  TextColor = brown,
  TextPadding = Vector4(0, 0, 0, 0),
  Text = _T("UI_store_Pricing_list")
})(ctrl_price, nil)
local ctrl_scr = Gui.Control({
  Location = Vector2(7, 32),
  Size = Vector2(358, 348),
  Padding = Vector4(0, 8, 6, 8),
  BackgroundColor = white,
  Skin = SkinF.shop_01
})(ctrl_price, nil)
local scr = Gui.ScrollableControl({Dock = "kDockFill"})(ctrl_scr, nil)
local fl_price = Gui.FlowLayout({
  LineSpace = 9,
  Align = "kAlignTopMiddle"
})(scr, nil)

function CreateMoneyLabel(p, l, c, s)
  return Gui.Label({
    Location = l,
    Size = Vector2(138, 31),
    TextPadding = Vector4(0, 0, 6, 0),
    TextAlign = "kAlignRightMiddle",
    FontSize = 16,
    TextColor = c,
    BackgroundColor = white,
    Skin = SkinF.avatar_main_086,
    Gui.Label({
      Location = Vector2(2, 0),
      Size = Vector2(30, 30),
      BackgroundColor = white,
      Skin = s
    })
  })(p, nil)
end

function CreateMoneyUI(p, ui)
  ui.ctrl_money = Gui.Control({
    Size = Vector2(371, 97)
  })(p, nil)
  Gui.Label({
    Location = Vector2(11, 27),
    Size = Vector2(55, 26),
    FontSize = 16,
    TextColor = brown,
    Text = _T("UI_store_Consume")
  })(ui.ctrl_money, nil)
  ui.lb_gp = CreateMoneyLabel(ui.ctrl_money, Vector2(78, 24), yellow, SkinF.shop_02)
  ui.lb_mb = CreateMoneyLabel(ui.ctrl_money, Vector2(222, 24), yellow, SkinF.shop_10)
  Gui.Label({
    Location = Vector2(11, 59),
    Size = Vector2(55, 26),
    FontSize = 16,
    TextColor = brown,
    Text = _T("UI_store_My")
  })(ui.ctrl_money, nil)
  ui.my_gp = CreateMoneyLabel(ui.ctrl_money, Vector2(78, 56), white, SkinF.shop_02)
  ui.my_mb = CreateMoneyLabel(ui.ctrl_money, Vector2(222, 56), white, SkinF.shop_10)
  PushCmd.SubscribeMoney("shop_balance_gp", function(g, m, t)
    ui.my_gp.Text = g
  end)
  PushCmd.SubscribeMoney("shop_balance_mb", function(g, m, t)
    ui.my_mb.Text = m
  end)
end

local money_ui = {}
CreateMoneyUI(ctrl_price, money_ui)
money_ui.ctrl_money.Location = Vector2(200, 429)
local name_ui = {}
local price_ui, UpdatePrice = {}, 200
local UpdatePrice, UpdateMoney = function(clear)
  fl_price.Size = Vector2(519, #list * 19 + (#list - 1) * 9)
  if clear then
    Gui.Clear(fl_price)
  end
  for i, v in ipairs(list) do
    if clear then
      if not name_ui[i] then
        Gui.Label({
          Size = Vector2(253, 19),
          FontSize = 16,
          TextPadding = Vector4(10, 0, 0, 0),
          AutoEllipsis = true
        })(nil, name_ui)
        Gui.Label({
          Size = Vector2(266, 19),
          FontSize = 16,
          TextAlign = "kAlignRightMiddle",
          TextPadding = Vector4(0, 0, 0, 0)
        })(nil, price_ui)
      end
      name_ui[i].Parent = fl_price
      price_ui[i].Parent = fl_price
    end
    name_ui[i].Text = format("%d.  %s", i, _L(v.display))
    price_ui[i].Text = GetPrice(v.price[v.price_index])
  end
end, 429

function UpdateMoney()
  local money = {
    0,
    0,
    0
  }
  for _, v in ipairs(list) do
    local price = v.price[v.price_index]
    local c = price.currency
    local p = price.price
    money[c] = money[c] + p
  end
  for i, v in ipairs(money) do
    if 0 < v then
      money[i] = -v
    end
  end
  money_ui.lb_gp.Text = money[1]
  money_ui.lb_mb.Text = money[2]
end

local ctrl_give = Gui.Control({
  Location = Vector2(200, 389),
  Size = Vector2(369, 38)
})()
Gui.Label({
  Location = Vector2(11, 3),
  Size = Vector2(164, 22),
  FontSize = 16,
  TextColor = brown,
  Text = _T("UI_common_Gift_to")
})(ctrl_give, nil)
local cmb_give = Gui.ComboBox({
  Location = Vector2(181, 0),
  Size = Vector2(184, 28)
})(ctrl_give, nil)
Gui.Label({
  Location = Vector2(9, 36),
  Size = Vector2(353, 2),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_128
})(ctrl_give, nil)
local btn_buy = Gui.Button({
  Location = Vector2(586, 576),
  Size = Vector2(178, 43),
  Text = _T("button_common_Buy"),
  ClickAudio = "buy",
  EventClick = function(sender, e)
    local bl = {}
    for _, v in ipairs(list) do
      bl[#bl + 1] = format("%d,%d,%d", v.type, v.sid, GetPriceId(v))
    end
    bl[#bl + 1] = ""
    if give then
      if cmb_give.ItemCount == 0 then
        MessageBox.ShowError(_T("msgbox_common_num_1366"))
      elseif 0 > cmb_give.SelectedIndex then
        MessageBox.ShowError(_T("tips_common_additional_tips13"))
      else
        MessageBox.ShowWaiter(_T("tips_common_additional_tips11"))
        table.foreach(friend_list, print)
        rpc.safecall("shop_present", {
          rId = friend_list[cmb_give.SelectedIndex + 1].id,
          present = table.concat(bl, ";")
        }, function(data)
          Hide()
          MessageBox.CloseWaiter()
          MessageBox.ShowError(_T("msgbox_common_num_1356"))
          Shop.ClearCart()
        end, function()
          MessageBox.CloseWaiter()
        end)
      end
    else
      MessageBox.ShowWaiter(_T("tips_common_additional_tips11"))
      rpc.safecall("shop_buy", {
        buy = table.concat(bl, ";")
      }, function(data)
        Hide()
        MessageBox.CloseWaiter()
        MessageBox.ShowError(_T("msgbox_common_num_1210"))
        Shop.ClearCart()
      end, function()
        MessageBox.CloseWaiter()
      end)
    end
  end
})(ctrl_balance, nil)
local btn_prepaid = Gui.Button({
  Style = "ButtonShopPrepaid",
  Location = Vector2(769, 576),
  Size = Vector2(92, 43),
  Text = _T("button_common_Online_Topup"),
  Enable = config.IsRecharge,
  EventClick = function(sender, e)
    game:OpenUrl(config.RechargeUrl)
  end
})(ctrl_balance, nil)
local btn_cancel, UpdateMaxPage = Gui.Button({
  Location = Vector2(866, 576),
  Size = Vector2(92, 43),
  Text = _T("button_common_Cancel"),
  EventClick = function(sender, e)
    Hide()
  end
})(ctrl_balance, nil), ctrl_balance
local UpdateMaxPage, UpdateList = function()
  pg_list.PageCount = math.ceil(#list / 4)
end, nil
local UpdateList, GetListIndex = function()
  for i, v in ipairs(bb_ui) do
    local index = (pg_list.CurrIndex - 1) * 4 + i
    local item = list[index]
    if item then
      v.Name = _L(item.display)
      v.Icon = GetIcon(item.resource)
      v.GradeImage = GetGradeImage(item.grade, item.type)
      v:RemoveAllPrice()
      for _, vv in ipairs(item.price) do
        v:AddPrice(GetPrice(vv))
      end
      v.PriceIndex = item.price_index - 1
      v.Parent = fl_bb
    else
      v.Parent = nil
    end
  end
end, "button_common_Cancel"

function GetListIndex(index)
  return (pg_list.CurrIndex - 1) * 4 + index
end

local tip_sys_interface = {
  nil,
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_avatar"
}
for i, v in ipairs(bb_ui) do
  function v.EventPriceChanged(sender, e)
    local index = GetListIndex(i)
    
    local item = list[index]
    item.price_index = sender.PriceIndex + 1
    UpdatePrice(false)
    UpdateMoney()
  end
  
  function v.EventTipActiveChanged(sender, e)
    if sender.TipActive then
      local index = GetListIndex(i)
      local item = list[index]
      Tip.SetRpc(tip_sys_interface[item.type], {
        t = item.type,
        sid = item.sid
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
      Tip.SetOffset(Vector2(5, 33))
      Tip.SetAlignSize(Vector2(80, 80))
    else
      Tip.SetOwner(nil)
    end
  end
  
  function v.EventCancelClick(sender, e)
    local index = GetListIndex(i)
    table.remove(list, index)
    if #list > 0 then
      UpdateMaxPage()
      UpdateList()
      UpdatePrice(true)
      UpdateMoney()
    else
      Hide()
    end
  end
end
local pg_list.EventIndexChanged, UpdateFriend = function(sender, e)
  UpdateList()
end, function(sender, e)
  UpdateList()
end

function UpdateFriend()
  cmb_give:RemoveAll()
  friend_list = {}
  local fl = LobbyBoxContern.GetFriendList() or {}
  for _, v in pairs(fl) do
    cmb_give:AddItem(v.name)
    table.insert(friend_list, v)
  end
  if cmb_give.ItemCount == 0 then
    cmb_give.Enable = false
    MessageBox.ShowError(_T("msgbox_common_num_1366"))
  else
    cmb_give.Enable = true
  end
end

function Show()
  money_ui.my_gp.Text = PushCmd.GetGP()
  money_ui.my_mb.Text = PushCmd.GetMB()
  UpdateMaxPage()
  pg_list.CurrIndex = 1
  for i, v in ipairs(list) do
    v.price_index = 1
  end
  UpdateList()
  UpdatePrice(true)
  UpdateMoney()
  if give then
    UpdateFriend()
    title_ui.lb.Text = _T("button_common_Gift")
    btn_buy.Text = _T("button_common_Gift")
    btn_buy.Style = "ButtonShopPresent"
    ctrl_scr.Size = Vector2(558, 348)
    ctrl_give.Parent = ctrl_price
  else
    title_ui.lb.Text = _T("button_common_Buy")
    btn_buy.Text = _T("button_common_Buy")
    btn_buy.Style = "ButtonShopBuy"
    ctrl_scr.Size = Vector2(558, 386)
    ctrl_give.Parent = nil
  end
  fl_balance.Parent = gui
end

function Hide()
  list = {}
  fl_balance.Parent = nil
end
