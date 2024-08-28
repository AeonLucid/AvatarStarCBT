module("QuickBuy", package.seeall)
local _T = GetUTF8Text
local _L = GetUTF8Text
local white = Tip.white
local brown = Tip.brown
local yellow = Tip.yellow
local GetIcon = Tip.GetIcon
local GetGradeImage = Tip.GetGradeImage
local GetPriceId = ShopBalance.GetPriceId
local GetCurrencyText = Tip.GetCurrencyText
local GetCurrencyIcon = Tip.GetCurrencyIcon
local SortPrice = Tip.SortPrice
local GetPrice = Tip.GetPrice
local fl_buy = Gui.FlowLayout({
  Dock = "kDockFill",
  Align = "kAlignCenterMiddle",
  BackgroundColor = ARGB(128, 0, 0, 0)
})()
local ctrl_buy = Gui.Control({
  Size = Vector2(407, 332),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_207
})(fl_buy)
local title_ui = {}
ShopBalance.CreateTitle(ctrl_buy, title_ui, _T("button_common_Buy"))
local bb = Gui.BuyBox({
  Style = "BuyBox_01",
  State = "kBSBalance",
  CanCancel = false,
  Location = Vector2(18, 44)
})(ctrl_buy, nil)
local ctrl_info = Gui.Control({
  Location = Vector2(18, 180),
  Size = Vector2(371, 97),
  BackgroundColor = white,
  Skin = SkinF.personalInfo_208
})(ctrl_buy, nil)
local money_ui = {}
ShopBalance.CreateMoneyUI(ctrl_info, money_ui)
local btn_buy = Gui.Button({
  Style = "ButtonShopBuy",
  Location = Vector2(215, 281),
  Size = Vector2(84, 40),
  Text = _T("button_common_Buy")
})(ctrl_buy, nil)
local btn_cancel = Gui.Button({
  Location = Vector2(305, 281),
  Size = Vector2(84, 40),
  Text = _T("button_common_Cancel")
})(ctrl_buy, nil)

function title_ui.btn.EventClick(sender, e)
  Hide()
end

local item, UpdateMoney = nil, function(sender, e)
  Hide()
end

function UpdateMoney()
  local money = {0, 0}
  local price = item.price[item.price_index]
  local c = price.currency
  money[c] = money[c] + price.price
  if 0 < money[c] then
    money[c] = -money[c]
  end
  money_ui.lb_gp.Text = money[1]
  money_ui.lb_mb.Text = money[2]
end

function bb.EventPriceChanged(sender, e)
  if item then
    item.price_index = sender.PriceIndex + 1
    UpdateMoney()
  end
end

local tip_player_interface = {
  "tip_player_skill",
  "tip_player_item",
  "tip_player_item",
  "tip_player_item",
  "tip_player_avatar",
  "tip_player_avatar"
}
local bb.EventTipActiveChanged, RequestShopList = function(sender, e)
  if item then
    Tip.SetRpc(tip_player_interface[item.type], {
      t = item.type,
      sid = item.sid
    })
    Tip.SetUseDescription(false)
    Tip.SetOwner(sender)
    Tip.SetOffset(Vector2(5, 33))
    Tip.SetAlignSize(Vector2(80, 80))
  end
end, function(sender, e)
  if item then
    Tip.SetRpc(tip_player_interface[item.type], {
      t = item.type,
      sid = item.sid
    })
    Tip.SetUseDescription(false)
    Tip.SetOwner(sender)
    Tip.SetOffset(Vector2(5, 33))
    Tip.SetAlignSize(Vector2(80, 80))
  end
end
local RequestShopList, RequestBuy = function(args)
  rpc.safecall("shop_item_list", args, function(data)
    item = data.items[1]
    item.price_index = 1
    item.type = data.t
    bb.Name = _L(item.display)
    bb.Icon = GetIcon(item.resource)
    bb.GradeImage = GetGradeImage(item.grade, item.type)
    bb.Desc = _L(item.description)
    bb:RemoveAllPrice()
    table.sort(item.price, SortPrice)
    for _, vv in ipairs(item.price) do
      bb:AddPrice(GetPrice(vv))
    end
    bb.PriceIndex = 0
    UpdateMoney()
    fl_buy.Parent = gui
  end)
end, "tip_player_item"

function RequestBuy()
  if item then
    MessageBox.ShowWaiter(_T("tips_common_additional_tips11"))
    rpc.safecall("shop_buy", {
      buy = string.format("%d,%d,%d;", item.type, item.sid, GetPriceId(item))
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

function btn_buy.EventClick(sender, e)
  RequestBuy()
end

function btn_cancel.EventClick(sender, e)
  Hide()
end

function Show(args)
  args.p = 1
  args.pageSize = 1
  args.currency = "1,2"
  money_ui.my_gp.Text = PushCmd.GetGP()
  money_ui.my_mb.Text = PushCmd.GetMB()
  RequestShopList(args)
end

callback = nil

function Hide()
  fl_buy.Parent = nil
  if callback then
    callback()
    callback = nil
  end
end
