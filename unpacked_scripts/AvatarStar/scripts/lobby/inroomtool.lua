module("InRoomTool", package.seeall)
local win, sub
local window_width_choice = 479
local window_height_choice = 654
local item_width = 193
local item_height = 105
local Data, load_err, ReqTcData, FillTcData
tc_arg = {
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  where = 5,
  type = 1,
  subType = -1,
  page = 1
}
PAGE = 0
PID = 0
ID = 0
IID = 0
RESNAME = 0
local DISPLAYNAME, onFinishClick = 0, 0
local onFinishClick, onItemClick = function(ib, arg)
  sub.Using = false
  sub.root:Hide(1)
  win.root:Show(1)
  tc_ui.ctrl.Parent = nil
  local itembox = Util.WhichSelected(ib)
  if itembox then
    local info = arg[itembox.ID]
    PAGE = tc_ui.pageBar.Index + 1
    if info then
      PID = info.PID
      ID = itembox.ID
      IID = info.IID
      RESNAME = info.name
      DISPLAYNAME = info.display
    else
      PID = 0
      ID = itembox.ID
      IID = 0
      RESNAME = nil
      DISPLAYNAME = nil
    end
    PlayGame.SetCreateRoomUIToolPic()
    if PlayGame.state then
      local self_room_info = PlayGame.state:GetSelfRoomInfo()
      if self_room_info then
        local room_option = ptr_cast(self_room_info.option)
        if room_option then
          room_option.item_id = PID
          room_option.item_resource = RESNAME
          room_option.item_name = DISPLAYNAME
          print("###########page, pid, id, resource", PAGE, room_option.item_id, ID, room_option.item_resource)
        end
      end
    end
  end
end, {}
local onItemClick, onItemEnter = function(sender, arg)
  Util.ClickIB(sender)
end, {}
local onItemEnter, onItemLeave = function(sender, arg)
  local info = arg[sender.ID]
  local pos = sub.root.WorldLocation
  if arg.where == 5 and sender.Type ~= -1 and info then
    Tooltip.ShowR(gui, pos.x, pos.y, info.where, info)
  end
end, {}

function onItemLeave(sender, arg)
  if arg.where == 5 and sender.Type ~= -1 then
    Tooltip.AllHide()
  end
end

local setup_item_to_tc, create_ui = function(numItem, root)
  local ctrl_page = {
    Gui.Control("ctrl")({
      Dock = "kDockFill",
      BackgroundColor = ARGB(0, 255, 0, 0),
      Gui.Label({
        Style = "Line02",
        Size = Vector2(window_width_choice, 2),
        Location = Vector2(0, window_height_choice - 125)
      }),
      Gui.Label("hint")({
        Dock = "kDockTop",
        Size = Vector2(0, 30),
        Text = "\184\249\190\221\196\227\209\161\212\241\181\196\196\163\202\189,\178\206\202\253\181\200,\207\212\202\190\191\201\210\212\202\185\211\195\181\196\183\191\188\228\181\192\190\223:",
        BackgroundColor = ARGB(0, 255, 0, 0)
      }),
      Gui.FlowLayout("ib_flo")({
        Dock = "kDockTop",
        Size = Vector2(0, 485),
        BackgroundColor = ARGB(0, 255, 0, 0),
        Margin = Vector4(40, 0, 40, 0)
      })
    })
  }
  tc_ui = Gui.Create(root)(ctrl_page)
  for i = 1, numItem do
    local item_page = {
      Gui.ItemBox("ib")({
        Empty = false,
        Size = Vector2(item_width, item_height),
        LoadingImage = Gui.AnimatedImage("ui/skinD/skinD_loading_ring.tga", 4, 2, 8),
        Margin = Vector4(3, 3, 0, 3),
        CanCancel = true,
        ID = i,
        EventSelected = function(sender, e)
          if sender.Type == -1 then
            sender.Selected = false
            return
          end
          if sender.Type ~= -1 then
            onItemClick(sender, tc_arg)
          end
        end,
        EventCancel = function(sender, e)
          PAGE = 0
          PID = 0
          ID = 0
        end,
        EventMouseEnter = function(sender, e)
          onItemEnter(sender, tc_arg)
        end,
        EventMouseLeave = function(sender, e)
          onItemLeave(sender, tc_arg)
        end
      })
    }
    Gui.Create(tc_ui.ib_flo)(item_page)
  end
  local pb_page = {
    Gui.PageBar("pb")({
      Dock = "kDockRightBottom",
      Count = 1
    })
  }
  Gui.Create(tc_ui.ib_flo)(pb_page)
  local button_page = {
    Gui.Button("btn_wc")({
      Dock = "kDockNone",
      Size = Vector2(90, 54),
      Location = Vector2(383, 570),
      Text = "\205\234\161\161\179\201",
      EventClick = function(sender, e)
        onFinishClick(ptr_cast(tc_ui.ib_flo.FirstChild), tc_arg)
      end
    }),
    Gui.Textbox("tb")({
      Dock = "kDockNone",
      Location = Vector2(20, 570),
      Size = Vector2(350, 50),
      Text = "",
      Visible = false
    })
  }
  Gui.Create(tc_ui.ctrl)(button_page)
  setmetatable(tc_ui, tc_ui)
  tc_ui.__index = {
    pageBar = ptr_cast(tc_ui.ib_flo:GetChildByIndex(8)),
    btn_wc = ptr_cast(tc_ui.ctrl:GetChildByIndex(2)),
    tb = ptr_cast(tc_ui.ctrl:GetChildByIndex(3))
  }
  tc_ui.ctrl.Parent = root
end, {}

function create_ui(root)
  if tc_ui then
    tc_ui.ctrl.Parent = root
    return
  end
  setup_item_to_tc(8, root)
  
  function tc_ui.pageBar.EventIndexChanged(sender, e)
    print(sender.Index)
    ReqTcData({
      p = sender.Index + 1,
      t = filter,
      gtk = game_type
    })
  end
end

function Show(window, flr, gtk)
  filter = flr
  game_type = gtk
  if window then
    win = window
    win.root:Hide(1)
    sub = getSubWindow(Vector2(window_width_choice, window_height_choice))
    sub.root.IconA = Icons.WinTitleIconsA.Depot
    sub.root.IconB = Icons.WinTitleIconsB.ItemChoose
    create_ui(sub.root)
  end
  ReqTcData({
    p = 1,
    t = filter,
    gtk = game_type
  })
end

function FillTcData(result, err)
  Tooltip.AllHide()
  if not result then
    error("err:" .. err)
    return
  end
  Data, load_err = rpc.load_result(result)
  if not Data then
    error("load_err:" .. load_err)
    return
  end
  tc_ui.pageBar.Count = Data.pages
  local items = Data.items
  Util.SetIBLoading(tc_ui.ib_flo, false, 8)
  if items then
    for i, item in ipairs(items) do
      local ib = ptr_cast(tc_ui.ib_flo:GetChildByIndex(i - 1))
      Util.FillItem(ib, item, tc_arg)
    end
  end
end

function ReqTcData(arg)
  Util.ClearIB(tc_ui.ib_flo, 8)
  local args = {
    p = arg.p,
    t = arg.t,
    gtk = arg.gtk
  }
  print("\199\235\199\243\183\191\188\228\181\192\190\223\193\208\177\237...", args.p, args.t, args.gtk)
  rpc.call("storage_room_item_list", args, FillTcData)
end
