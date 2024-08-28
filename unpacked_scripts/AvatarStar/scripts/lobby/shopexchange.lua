module("ShopExchange", package.seeall)
local _T = GetUTF8Text
local _L = GetUTF8Text
local white = Tip.white
local GetIcon = Tip.GetIcon
local GetGradeImage = Tip.GetGradeImage
local GetPriceId = ShopBalance.GetPriceId
local GetPrice = Tip.GetPrice
local GetCurrencyIcon = Tip.GetCurrencyIcon
local GetCurrencyText = Tip.GetCurrencyText
item = nil
local fl_exchange = Gui.FlowLayout({
  Dock = "kDockFill",
  Align = "kAlignCenterMiddle",
  BackgroundColor = ARGB(128, 0, 0, 0)
})()
local ctrl_exchange = Gui.Control({
  Size = Vector2(258, 260),
  BackgroundColor = white,
  Skin = SkinF.shop_03
})(fl_exchange, nil)
local title_ui = {}
ShopBalance.CreateTitle(ctrl_exchange, title_ui, "")
title_ui.lb.TextAlign = "kAlignCenterMiddle"

function title_ui.btn.EventClick(sender, e)
  Hide()
end

local ctrl_icon = Gui.Control({
  Location = Vector2(81, 44),
  Size = Vector2(96, 96),
  BackgroundColor = white,
  Skin = SkinF.shop_04
})(ctrl_exchange, nil)
local cb_icon = Gui.CartBox({
  Location = Vector2(8, 8),
  Size = Vector2(80, 80),
  BackgroundColor = ARGB(0, 0, 0, 0)
})(ctrl_icon, nil)
local cmb_price = Gui.ComboBox({
  Location = Vector2(9, 150),
  Size = Vector2(240, 29),
  EventItemSelected = function(sender, e)
    if item then
      item.price_index = sender.SelectedIndex + 1
    end
  end
})(ctrl_exchange, nil)
local btn_exchange = Gui.Button({
  Style = "ButtonShopExchange",
  Location = Vector2(74, 200),
  Size = Vector2(110, 36),
  Text = _T("button_common_Exchange"),
  ClickAudio = "buy"
})(ctrl_exchange, nil)
local tip_sys_interface = {
  nil,
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_avatar"
}

function cb_icon.EventMouseEnter(sender, e)
  if item then
    Tip.SetRpc(tip_sys_interface[item.type], {
      t = item.type,
      sid = item.sid
    })
    Tip.SetUseDescription(false)
    Tip.SetOwner(sender)
  end
end

function btn_exchange.EventClick(sender, e)
  if item and item.price_index then
    MessageBox.ShowWaiter(_T("tips_common_additional_tips11"))
    rpc.safecall("shop_buy", {
      buy = string.format("%d,%d,%d;", item.type, item.sid, GetPriceId(item))
    }, function(data)
      Hide()
      MessageBox.CloseWaiter()
      MessageBox.ShowError(_T("msgbox_common_num_1373"))
    end, function()
      MessageBox.CloseWaiter()
    end)
  end
end

function Show()
  if item then
    cb_icon.Icon = GetIcon(item.resource)
    cb_icon.GradeImage = GetGradeImage(item.grade, item.type)
    title_ui.lb.Text = _L(item.display)
    item.price_index = 1
    cmb_price:RemoveAll()
    local price = item.price
    for _, v in ipairs(price) do
      cmb_price:AddItem(GetPrice(v))
    end
    cmb_price.SelectedIndex = 0
    fl_exchange.Parent = gui
  end
end

function Hide()
  fl_exchange.Parent = nil
end
