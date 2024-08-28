module("Gui", package.seeall)
local styles = {}
local skins, WidgetConstructor = {}, package.seeall
local WidgetConstructor, ImportWidget = function(ctor, id, t)
  return function(parent, vars)
    local widget = ctor()
    if vars then
      table.insert(vars, widget)
      if id then
        vars[id] = widget
      end
    end
    if t.Style then
      widget.Style = t.Style
    else
      widget.Style = ptr_typename(widget)
    end
    for attr, value in pairs(t) do
      if type(attr) == "string" and attr ~= "Style" and attr ~= "EventCreate" then
        widget[attr] = value
      end
    end
    if t.Parent == nil and parent then
      widget.Parent = parent
    end
    for id, creator in ipairs(t) do
      creator(widget, vars)
    end
    if t.EventCreate then
      t.EventCreate(widget)
    end
    return widget
  end
end, nil
local ImportWidget, ImportSkin = function(className)
  local typeInfo = ptr_typeof(className)
  if typeInfo then
    local ctor = typeInfo:GetConstructor()
    return function(id)
      if type(id) == "table" then
        return WidgetConstructor(ctor, nil, id)
      else
        return function(t)
          return WidgetConstructor(ctor, id, t)
        end
      end
    end
  else
    error("can not import widget:" .. className)
  end
end, nil
local ImportSkin, ApplyStyle = function(className)
  local ctor = class.import(className)
  if ctor then
    return function(id)
      if type(id) == "table" then
        return ctor(id)
      else
        return function(t)
          local skin = ctor(t)
          skins[id] = skin
          return skin
        end
      end
    end
  else
    error("can not import skin:" .. className)
  end
end, nil

function ApplyStyle(widget, style)
  local tb = styles[style]
  widget = ptr_cast(widget)
  if tb then
    for attr, value in pairs(tb) do
      widget[attr] = value
    end
  end
end

function Create(parent, vars)
  vars = vars or {}
  if type(parent) == "table" then
    for id, creator in ipairs(parent) do
      creator(gui, vars)
    end
  else
    return function(t)
      for id, creator in ipairs(t) do
        creator(parent, vars)
      end
      return vars
    end
  end
  return vars
end

function Clear(parent)
  if type(parent) == "table" then
    for id, ui in ipairs(parent) do
      ui.Parent = nil
    end
  elseif parent then
    while parent.FirstChild do
      parent.FirstChild.Parent = nil
    end
  end
end

function Style(name)
  return function(t)
    styles[name] = t
  end
end

function Align(control, px, py)
  if control and control.Parent then
    local cs = control.Size
    local ps = control.Parent.Size
    local mx = ps.x - cs.x
    local my = ps.y - cs.y
    if px < 0 then
      if px < -1 then
        px = mx + px
      else
        px = mx - mx * px
      end
    end
    if not (0 < px) or 1 < px then
    else
      px = mx * px
    end
    if py < 0 then
      if py < -1 then
        py = my + py
      else
        py = my - my * py
      end
    end
    if not (0 < py) or 1 < py then
    else
      py = my * py
    end
    px = math.floor(px)
    py = math.floor(py)
    local win = ptr_cast(control, "Gui.Window")
    if win then
      win.WorldLocation = Vector3(px, py, 0)
    else
      control.Location = Vector2(px, py)
    end
  end
end

function gui.EventControlStyleChanged(sender, e)
  ApplyStyle(e.control, e.style)
end

Image = class.import("Gui.Image")
Icon = class.import("Gui.Icon")
ProportionIcon = class.import("Gui.ProportionIcon")
AnimatedImage = class.import("Gui.AnimatedImage")
TextureFont = class.import("Client.TextureFont")
ControlSkin = ImportSkin("Gui.ControlSkin")
ButtonSkin = ImportSkin("Gui.ButtonSkin")
CheckBoxSkin = ImportSkin("Gui.CheckBoxSkin")
TextboxSkin = ImportSkin("Gui.TextboxSkin")
ScrollableControlSkin = ImportSkin("Gui.ScrollableControlSkin")
TextAreaSkin = ImportSkin("Gui.TextAreaSkin")
ComboBoxSkin = ImportSkin("Gui.ComboBoxSkin")
ComboListSkin = ImportSkin("Gui.ComboListSkin")
TabpadSkin = ImportSkin("Gui.TabpadSkin")
SliderSkin = ImportSkin("Gui.SliderSkin")
ListItemSkin = ImportSkin("Gui.ListItemSkin")
ListTreeViewSkin = ImportSkin("Gui.ListTreeViewSkin")
HeaderSkin = ImportSkin("Gui.HeaderSkin")
ItemBoxSkin = ImportSkin("Gui.ItemBoxSkin")
PictureSkin = ImportSkin("Gui.PictureSkin")
ItemPictureSkin = ImportSkin("Gui.ItemPictureSkin")
MenuSkin = ImportSkin("Gui.MenuSkin")
BalloonSkin = ImportSkin("Gui.BalloonSkin")
TooltipSkin = ImportSkin("Gui.TooltipSkin")
ColorContainerSkin = ImportSkin("Gui.ColorContainerSkin")
BuyBoxSkin = ImportSkin("Gui.BuyBoxSkin")
ExchangeBoxSkin = ImportSkin("Gui.ExchangeBoxSkin")
TabControlSkin = ImportSkin("Gui.TabControlSkin")
CartBoxSkin = ImportSkin("Gui.CartBoxSkin")
AuctionItemSkin = ImportSkin("Gui.AuctionItemSkin")
AuctionHeaderSkin = ImportSkin("Gui.AuctionHeaderSkin")
ItemTipSkin = ImportSkin("Gui.ItemTipSkin")
Window = ImportWidget("Gui.Window")
TopmostWindow = ImportWidget("Gui.TopmostWindow")
Control = ImportWidget("Gui.Control")
ScrollableControl = ImportWidget("Gui.ScrollableControl")
Label = ImportWidget("Gui.Label")
ProportionBar = ImportWidget("Gui.ProportionBar")
Picture = ImportWidget("Gui.Picture")
Button = ImportWidget("Gui.Button")
ColorPicker = ImportWidget("Gui.ColorPicker")
ColorContainer = ImportWidget("Gui.ColorContainer")
LayerButton = ImportWidget("Gui.LayerButton")
DragBtn = ImportWidget("Gui.DragBtn")
DepotDelBtn = ImportWidget("Gui.DepotDelBtn")
DepotRepairBtn = ImportWidget("Gui.DepotRepairBtn")
MoveControl = ImportWidget("Gui.MoveControl")
RotateBtn = ImportWidget("Gui.RotateBtn")
AvtButton = ImportWidget("Gui.AvtButton")
NewAvtButton = ImportWidget("Gui.NewAvtButton")
FloatingControl = ImportWidget("Gui.FloatingControl")
AvtEditBtn = ImportWidget("Gui.AvtEditBtn")
SpecialCtrl = ImportWidget("Gui.SpecialCtrl")
NewPageBar = ImportWidget("Gui.NewPageBar")
NewPagesBar = ImportWidget("Gui.NewPagesBar")
PersonalMainBtn = ImportWidget("Gui.PersonalMainBtn")
Textbox = ImportWidget("Gui.Textbox")
TextArea = ImportWidget("Gui.TextArea")
CheckBox = ImportWidget("Gui.CheckBox")
RadioButton = ImportWidget("Gui.RadioButton")
RadioGroup = ImportWidget("Gui.RadioGroup")
Slider = ImportWidget("Gui.Slider")
ComboBox = ImportWidget("Gui.ComboBox")
Header = ImportWidget("Gui.Header")
ListItem = ImportWidget("Gui.ListItem")
ListTreeView = ImportWidget("Gui.ListTreeView")
FlowLayout = ImportWidget("Gui.FlowLayout")
NumFlash = ImportWidget("Gui.NumFlash")
Tabpad = ImportWidget("Gui.Tabpad")
Pager = ImportWidget("Gui.Pager")
ItemBox = ImportWidget("Gui.ItemBox")
ItemPicture = ImportWidget("Gui.ItemPicture")
PropertyGrid = ImportWidget("Gui.PropertyGrid")
PropertyView = ImportWidget("Gui.PropertyView")
ComboList = ImportWidget("Gui.ComboList")
ImageBrowser = ImportWidget("Gui.ImageBrowser")
SplineView = ImportWidget("Gui.SplineView")
WindowUI = ImportWidget("Gui.WindowUI")
ModalControl = ImportWidget("Gui.ModalControl")
Balloon = ImportWidget("Gui.Balloon")
Menu = ImportWidget("Gui.Menu")
KeyBox = ImportWidget("Gui.KeyBox")
CharacterAnimCard = ImportWidget("Gui.CharacterAnimCard")
CharacterStaticCard = ImportWidget("Gui.CharacterStaticCard")
HeadPhotoCard = ImportWidget("Gui.HeadPhotoCard")
ParticleCard = ImportWidget("Gui.ParticleCard")
OpenTreasure = ImportWidget("Gui.OpenTreasure")
FlashNew = ImportWidget("Gui.FlashNew")
FlashArrow = ImportWidget("Gui.FlashArrow")
WaitTime = ImportWidget("Gui.WaitTime")
LcButton = ImportWidget("Gui.LcButton")
AutoLcLabel = ImportWidget("Gui.AutoLcLabel")
BreathingCtrl = ImportWidget("Gui.BreathingCtrl")
ElasticCtrl = ImportWidget("Gui.ElasticCtrl")
LobbyBCTip = ImportWidget("Gui.LobbyBCTip")
BuyBox = ImportWidget("Gui.BuyBox")
ExchangeBox = ImportWidget("Gui.ExchangeBox")
TabControl = ImportWidget("Gui.TabControl")
CartBox = ImportWidget("Gui.CartBox")
SocialityChannelGroup = ImportWidget("Gui.SocialityChannelGroup")
SocialityChannelList = ImportWidget("Gui.SocialityChannelList")
SocialityChannelListItem = ImportWidget("Gui.SocialityChannelListItem")
SocialityGroupList = ImportWidget("Gui.SocialityGroupList")
ChatBar = ImportWidget("Gui.ChatBar")
ChatPair = ImportWidget("Gui.ChatPair")
NewMessagePanel = ImportWidget("Gui.NewMessagePanel")
AuctionItem = ImportWidget("Gui.AuctionItem")
AuctionHeader = ImportWidget("Gui.AuctionHeader")
ItemTip = ImportWidget("Gui.ItemTip")
AnimControl = ImportWidget("Gui.AnimControl")
AutoMissLabel = ImportWidget("Gui.AutoMissLabel")
