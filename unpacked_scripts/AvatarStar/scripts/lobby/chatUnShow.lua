module("ChatUnShow", package.seeall)
local ui = Gui.Create()({
  Gui.Window("root")({
    Location = Vector2(1040, 526),
    Size = Vector2(326, 328),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    Moveable = true,
    Gui.FlowLayout({
      BackgroundColor = ARGB(0, 0, 0, 0),
      Dock = "kDockFill",
      Direction = "kVertical",
      Gui.Label({
        Dock = "kDockTop",
        Size = Vector2(0, 25),
        BackgroundColor = ARGB(0, 255, 255, 255),
        Margin = Vector4(10, 4, 10, 0),
        Text = GetUTF8Text("UI_social_Unread_Message"),
        FontSize = 16,
        Gui.Button("btn_close")({
          Dock = "kDockRight",
          Size = Vector2(24, 0),
          Skin = SkinF.lookInfo_002,
          EventClick = function(sender, e)
            Hide()
          end
        })
      }),
      Gui.Control({
        Dock = "kDockFill",
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005,
        Margin = Vector4(10, 8, 10, 12),
        Gui.Control({
          Dock = "kDockTop",
          Size = Vector2(0, 44),
          BackgroundColor = ARGB(0, 255, 255, 255),
          Gui.Label({
            Location = Vector2(20, 9),
            Size = Vector2(34, 36),
            TextAlign = "kAlignCenterMiddle",
            BackgroundColor = ARGB(0, 255, 255, 255),
            Icon = Gui.Icon("/ui/SkinF/skin_mail_icon03.tga")
          }),
          Gui.Label({
            Location = Vector2(60, 7),
            Size = Vector2(230, 38),
            TextAlign = "kAlignLeftCenter",
            TextColor = ARGB(255, 152, 37, 10),
            BackgroundColor = ARGB(0, 255, 255, 255),
            Text = GetUTF8Text("UI_social_Please_close_the_chat_box"),
            FontSize = 14,
            AutoWrap = true
          })
        }),
        Gui.Control({
          Dock = "kDockFill",
          BackgroundColor = ARGB(255, 255, 255, 255),
          Skin = SkinF.personalInfo_068,
          Margin = Vector4(10, 3, 10, 10),
          Gui.ListTreeView("list")({
            Margin = Vector4(6, 6, 5, 6),
            Dock = "kDockFill",
            Style = "Sociality.UnReadList"
          })
        })
      })
    })
  })
})

function ui.list.EventDoubleClick(sender, e)
  local chat = ptr_cast(game.ChatConnect)
  local SelectedItem = sender.SelectedItem
  if not chat or not SelectedItem then
    return
  end
  if ChatBar.IsCanOpenChatPair(SelectedItem:GetText(2), SelectedItem:GetText(3), SelectedItem:GetText(4)) then
    ChatBar.OpenChatPair(SelectedItem:GetText(2), SelectedItem:GetText(3), SelectedItem:GetText(4), SelectedItem:GetText(1), true, true, SelectedItem:GetText(5), true)
    chat:MoveUnShowChatItem(SelectedItem:GetText(2), SelectedItem:GetText(3), SelectedItem:GetText(4))
    sender:DeleteNode(SelectedItem)
    if 1 > sender.ItemCount then
      Hide()
    end
  else
    MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1236"))
  end
end

local UpdateUnShowChatList, Initialize = function()
  local list = ui.list
  if not list then
    return
  end
  local root = list.RootItem
  local item, chatItem
  local index = 0
  local chat = ptr_cast(game.ChatConnect)
  if not chat then
    return
  end
  list:DeleteAll()
  local selected_item = list.SelectedItem
  while true do
    chatItem = chat:GetUnShowChatItem(index)
    if not chatItem then
      break
    end
    item = list:AddItem(root, "")
    list:AddSubItem(item, chatItem.strName)
    item:SetTextColor(1, ARGB(255, 255, 255, 255))
    item:SetHighLightTextColor(1, ARGB(255, 255, 255, 0))
    list:AddSubItem(item, chatItem.unType)
    list:AddSubItem(item, chatItem.un64ChannelID)
    list:AddSubItem(item, chatItem.un64ID)
    list:AddSubItem(item, chatItem.unOwerID)
    if selected_item and tonumber(selected_item:GetText(2)) == chatItem.unType and tonumber(selected_item:GetText(3)) == chatItem.un64ChannelID and tonumber(selected_item:GetText(4)) == chatItem.un64ID then
      sender.SelectedItem = RetItem
    end
    index = index + 1
  end
end, function()
  local list = ui.list
  if not list then
    return
  end
  local root = list.RootItem
  local item, chatItem
  local index = 0
  local chat = ptr_cast(game.ChatConnect)
  if not chat then
    return
  end
  list:DeleteAll()
  local selected_item = list.SelectedItem
  while true do
    chatItem = chat:GetUnShowChatItem(index)
    if not chatItem then
      break
    end
    item = list:AddItem(root, "")
    list:AddSubItem(item, chatItem.strName)
    item:SetTextColor(1, ARGB(255, 255, 255, 255))
    item:SetHighLightTextColor(1, ARGB(255, 255, 255, 0))
    list:AddSubItem(item, chatItem.unType)
    list:AddSubItem(item, chatItem.un64ChannelID)
    list:AddSubItem(item, chatItem.un64ID)
    list:AddSubItem(item, chatItem.unOwerID)
    if selected_item and tonumber(selected_item:GetText(2)) == chatItem.unType and tonumber(selected_item:GetText(3)) == chatItem.un64ChannelID and tonumber(selected_item:GetText(4)) == chatItem.un64ID then
      sender.SelectedItem = RetItem
    end
    index = index + 1
  end
end

function Initialize()
  CommonUtility.InitLtvHeader(ui.list, {
    {
      "",
      32,
      "kAlignLeftMiddle"
    },
    {
      "",
      228,
      "kAlignLeftMiddle"
    },
    {
      "",
      1,
      "kAlignLeftMiddle"
    },
    {
      "",
      1,
      "kAlignLeftMiddle"
    },
    {
      "",
      1,
      "kAlignLeftMiddle"
    },
    {
      "",
      1,
      "kAlignLeftMiddle"
    }
  })
end

function Visible()
  return ui.root.Parent ~= nil
end

function AlignUI()
  if not Visible() then
    return
  end
  if Sociality.Visible() then
    Gui.Align(ui.root, -319, 524)
  else
    Gui.Align(ui.root, -19, 524)
  end
end

function Show(MailWin)
  ui.root.Parent = gui
  AlignUI()
  UpdateUnShowChatList()
end

function Hide()
  ui.root.Parent = nil
  local list = ui.list
  if list and list.ItemCount > 0 and Lobby then
    Lobby.NotifyUnShowChat()
  end
end

Initialize()
