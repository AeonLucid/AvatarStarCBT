module("Sociality", package.seeall)
local SEARCH_TYPE = 0
local CHANNEL_TYPE = 1
local FRIEND_TYPE = 2
local MYFRIEND_GROUP = 1
local LASTGAMER_GROUP = 2
local BLACKLIST_GROUP = 3
local STRANGER_GROUP = 4
local OFFLINE = 1
local ONLINE = 2
local INGAMING = 3
local PUBLIC_CHANNEL = 1
local GONGHUI_CHANNEL = 3
local PRIVATE_CHANNEL = 2
local bShowAddMyChannelBtn = false
local SHOW_ICON_COUNT_1 = 25
local SHOW_ICON_COUNT_2 = 75
local MAX_MYCHANNEL_COUNT = 5
local gTimer, StopTimer
local StopTimer, OnTimer = function()
  if gTimer then
    game.TimerMgr:RemoveTimer(gTimer)
    gTimer = nil
  end
end, nil
local OnTimer, RunProhibitTimer = function()
  StopTimer()
end, nil

function RunProhibitTimer()
  StopTimer()
  gTimer = game.TimerMgr:AddTimer(10)
  gTimer.EventOnTimer = OnTimer
end

local HalfHot = Gui.Icon("/ui/skinF/skin_mail_icon07.tga", Vector4(0, 0, 0, 0))
local HotN = Gui.Icon("/ui/skinF/skin_mail_icon08.tga", Vector4(0, 0, 0, 0))
local ui = Gui.Create()({
  Gui.Control("root")({
    Location = Vector2(11, 3),
    Size = Vector2(300, 599),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    ComFuc.ComLabel("name_t", GetUTF8Text("tips_abilities_Interact"), Vector2(218, 18), Vector2(16, 6), 0, 16, ARGB(255, 255, 255, 255)),
    Gui.Button("btn_close")({
      Size = Vector2(24, 25),
      Location = Vector2(266, 4),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.lookInfo_002
    }),
    Gui.Control("page_container")({
      Location = Vector2(7, 84),
      Size = Vector2(286, 506),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.personalInfo_131,
      ComFuc.ComButton("btn_AddMyChannel", GetUTF8Text("button_common_Create_Channel"), Vector2(84, 40), Vector2(14, 445), 16, false),
      ComFuc.ComButton("btn_sysinfo", GetUTF8Text("button_common_System_Info"), Vector2(84, 40), Vector2(104, 445), 16, false),
      ComFuc.ComButton("btn_search", GetUTF8Text("button_common_Add_Friend"), Vector2(84, 40), Vector2(194, 445), 16, false)
    }),
    Gui.Button("btn_channel")({
      Size = Vector2(110, 38),
      Location = Vector2(21, 48),
      Text = GetUTF8Text("button_common_Channel"),
      TextColor = ARGB(255, 62, 26, 1),
      HighlightTextColor = ARGB(255, 62, 26, 1),
      TextShadowColor = ARGB(0, 0, 0, 0),
      FontSize = 18,
      CanPushDown = true,
      Skin = SkinF.personalInfo_121,
      TextShadowWhenNormal = false,
      TextAlign = "kAlignCenterMiddle",
      Padding = Vector4(0, 0, 14, 0)
    }),
    Gui.Button("btn_friends")({
      Size = Vector2(110, 38),
      Location = Vector2(135, 48),
      Text = GetUTF8Text("button_common_Friend"),
      TextColor = ARGB(255, 62, 26, 1),
      HighlightTextColor = ARGB(255, 62, 26, 1),
      TextShadowColor = ARGB(0, 0, 0, 0),
      FontSize = 18,
      CanPushDown = true,
      Skin = SkinF.personalInfo_121,
      TextShadowWhenNormal = false,
      TextAlign = "kAlignCenterMiddle",
      Padding = Vector4(0, 0, 14, 0)
    })
  })
})
local ui_search_result, LayoutPage = Gui.Create()({
  Gui.Control("root")({
    Location = Vector2(823, 141),
    Size = Vector2(402, 390),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    Padding = Vector4(4, 4, 4, 9),
    Gui.FlowLayout({
      BackgroundColor = ARGB(0, 0, 0, 0),
      Dock = "kDockFill",
      Direction = "kVertical",
      Gui.Label({
        Dock = "kDockTop",
        Size = Vector2(0, 25),
        BackgroundColor = ARGB(0, 255, 255, 255),
        Margin = Vector4(16, 0, 0, 0),
        Text = GetUTF8Text("UI_social_additional_string_066"),
        FontSize = 16,
        Gui.Button("btn_close")({
          Dock = "kDockRight",
          Size = Vector2(24, 0),
          Margin = Vector4(0, 0, 6, 0),
          Skin = SkinF.lookInfo_002
        })
      }),
      Gui.Control({
        Dock = "kDockFill",
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005,
        Margin = Vector4(4, 4, 4, 4),
        Gui.Control({
          Dock = "kDockBottom",
          Size = Vector2(0, 43),
          BackgroundColor = ARGB(0, 0, 0, 0),
          Margin = Vector4(0, 0, 0, 11),
          Gui.NewPagesBar("page_bar")({
            Size = Vector2(260, 36),
            Dock = "kDockLeft",
            Margin = Vector4(10, 2, 0, 0)
          }),
          Gui.Button("btn_search_add_friends")({
            Size = Vector2(84, 40),
            Dock = "kDockRight",
            Text = GetUTF8Text("button_common_Add_Friend"),
            Margin = Vector4(0, 0, 10, 0),
            Enable = false
          })
        }),
        Gui.Control({
          Dock = "kDockFill",
          BackgroundColor = ARGB(255, 255, 255, 255),
          Skin = SkinF.personalInfo_068,
          Margin = Vector4(10, 10, 10, 10),
          Padding = Vector4(4, 6, 4, 6),
          Gui.ListTreeView("list")({
            Dock = "kDockFill",
            Style = "Sociality.FriendsList",
            VScrollBarDisplay = "kHide"
          })
        })
      })
    })
  })
}), {
  Gui.Control("root")({
    Location = Vector2(823, 141),
    Size = Vector2(402, 390),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    Padding = Vector4(4, 4, 4, 9),
    Gui.FlowLayout({
      BackgroundColor = ARGB(0, 0, 0, 0),
      Dock = "kDockFill",
      Direction = "kVertical",
      Gui.Label({
        Dock = "kDockTop",
        Size = Vector2(0, 25),
        BackgroundColor = ARGB(0, 255, 255, 255),
        Margin = Vector4(16, 0, 0, 0),
        Text = GetUTF8Text("UI_social_additional_string_066"),
        FontSize = 16,
        Gui.Button("btn_close")({
          Dock = "kDockRight",
          Size = Vector2(24, 0),
          Margin = Vector4(0, 0, 6, 0),
          Skin = SkinF.lookInfo_002
        })
      }),
      Gui.Control({
        Dock = "kDockFill",
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005,
        Margin = Vector4(4, 4, 4, 4),
        Gui.Control({
          Dock = "kDockBottom",
          Size = Vector2(0, 43),
          BackgroundColor = ARGB(0, 0, 0, 0),
          Margin = Vector4(0, 0, 0, 11),
          Gui.NewPagesBar("page_bar")({
            Size = Vector2(260, 36),
            Dock = "kDockLeft",
            Margin = Vector4(10, 2, 0, 0)
          }),
          Gui.Button("btn_search_add_friends")({
            Size = Vector2(84, 40),
            Dock = "kDockRight",
            Text = GetUTF8Text("button_common_Add_Friend"),
            Margin = Vector4(0, 0, 10, 0),
            Enable = false
          })
        }),
        Gui.Control({
          Dock = "kDockFill",
          BackgroundColor = ARGB(255, 255, 255, 255),
          Skin = SkinF.personalInfo_068,
          Margin = Vector4(10, 10, 10, 10),
          Padding = Vector4(4, 6, 4, 6),
          Gui.ListTreeView("list")({
            Dock = "kDockFill",
            Style = "Sociality.FriendsList",
            VScrollBarDisplay = "kHide"
          })
        })
      })
    })
  })
}

function LayoutPage(strPageName, index)
  return Gui.Control(strPageName)({
    Location = Vector2(7, 7),
    Size = Vector2(272, 434),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_068,
    Gui.SocialityGroupList("group")({
      Dock = "kDockFill",
      BackgroundColor = ARGB(0, 0, 0, 0),
      EventGroupExpand = function(sender, e)
        if index == 1 then
          if sender.Text == GetUTF8Text("button_common_My_Channel") then
            ui.btn_AddMyChannel.Visible = true
            bShowAddMyChannelBtn = true
          else
            ui.btn_AddMyChannel.Visible = false
            bShowAddMyChannelBtn = false
          end
        end
      end
    })
  })
end

local ui_page_channel = Gui.Create()({
  LayoutPage("page", 1)
})
local ui_page_friends = Gui.Create()({
  LayoutPage("page", 2)
})
local ui_add_channel = Gui.Create()({
  Gui.Control("root")({
    Location = Vector2(862, 622),
    Size = Vector2(300, 160),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    ComFuc.ComLabel(nil, GetUTF8Text("button_common_Create_Channel"), Vector2(218, 18), Vector2(16, 6), 0, 16, ARGB(255, 255, 255, 255)),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_social_Enter_Channel_Name"), Vector2(218, 18), Vector2(30, 40), 0, 16, ARGB(255, 82, 54, 44)),
    ComFuc.ComTextBox("txt_channel_name", "", Vector2(240, 26), Vector2(30, 68), 12),
    Gui.Button("btn_close")({
      Size = Vector2(24, 25),
      Location = Vector2(266, 4),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.lookInfo_002
    }),
    ComFuc.ComButton("btn_OK", GetUTF8Text("button_common_OK"), Vector2(60, 40), Vector2(70, 106), 16, false),
    ComFuc.ComButton("btn_Cancel", GetUTF8Text("button_common_Cancel"), Vector2(60, 40), Vector2(170, 106), 16, false)
  })
})
local m_ui_sys, sysTimer
local imgIndex = 1
sysBtn1_Skin = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
  DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
})
local sysBtn2_Skin, CreateSystemMsgWnd = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
  DownImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
}), Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
  DownImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
})
local CreateSystemMsgWnd, StopTimer = function(parent_win)
  local ui = Gui.Create()({
    Gui.Window("root")({
      Location = Vector2(-313, 462),
      Size = Vector2(492, 388),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.personalInfo_207,
      ComFuc.ComLabel(nil, GetUTF8Text("button_common_System_Info"), Vector2(268, 24), Vector2(16, 4), 0, 16, ARGB(255, 255, 255, 255)),
      Gui.Control({
        Dock = "kDockTop",
        Size = Vector2(300, 30),
        ComFuc.ComLabel(nil, GetUTF8Text("button_common_System_Info"), Vector2(268, 24), Vector2(16, 4), 0, 16, ARGB(255, 255, 255, 255)),
        Gui.Button("close_btn")({
          Dock = "kDockRight",
          Size = Vector2(24, 24),
          Margin = Vector4(0, 4, 12, 2),
          Skin = SkinF.lookInfo_002,
          EventClick = function(sender, e)
            HideSysWnd()
          end
        })
      }),
      Gui.Control({
        Dock = "kDockFill",
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005,
        Margin = Vector4(4, 4, 4, 10),
        Gui.Control({
          Dock = "kDockFill",
          BackgroundColor = ARGB(0, 0, 0, 0),
          Padding = Vector4(11, 11, 11, 11),
          Gui.NewMessagePanel("msg_panel")({
            Dock = "kDockFill",
            Style = "Sociality.MessagePanel",
            MaxTextWidth = 416,
            OnePageLineNum = 15,
            MaxLineNum = 300,
            LineGap = 1
          })
        })
      })
    })
  })
  ui.root.Parent = parent_win
  return ui
end, {
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
  DownImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
}
local StopTimer, OnTimer = function()
  if sysTimer then
    game.TimerMgr:RemoveTimer(sysTimer)
    sysTimer = nil
    imgIndex = 1
    ui.btn_sysinfo.Skin = sysBtn1_Skin
  end
end, Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
local OnTimer, RunTimer = function()
  if imgIndex == 1 then
    ui.btn_sysinfo.Skin = sysBtn2_Skin
    imgIndex = 2
  else
    ui.btn_sysinfo.Skin = sysBtn1_Skin
    imgIndex = 1
  end
end, "ui/skinF/skin_common_button_disabled.tga"

function RunTimer()
  if m_ui_sys then
    GetSysMsgHistory()
  elseif not sysTimer then
    sysTimer = game.TimerMgr:AddTimer(0.5)
    sysTimer.EventOnTimer = OnTimer
    imgIndex = 1
  end
end

local lobbyTimer, OnLobbyTimer = nil, Vector4(20, 18, 20, 18)

function OnLobbyTimer()
  if Lobby then
    Lobby.ClearFirstLineMessage()
    if Lobby.GetMessageLineCount() < 1 then
      StopLobbyTimer()
    end
  end
end

function RunLobbyMsgTimer()
  if not lobbyTimer then
    lobbyTimer = game.TimerMgr:AddTimer(10)
    lobbyTimer.EventOnTimer = OnLobbyTimer
  end
end

function StopLobbyTimer()
  if lobbyTimer then
    game.TimerMgr:RemoveTimer(lobbyTimer)
    lobbyTimer = nil
  end
end

function AlignSysMsgWndUI()
  if m_ui_sys then
    Gui.Align(m_ui_sys.root, -313, 462)
  end
end

local GetSysMsgHistory, ShowSysWnd = function()
  if not m_ui_sys then
    return
  end
  m_ui_sys.msg_panel:ClearMessage()
  local pMsgItem
  local nIndex = 0
  local chat = ptr_cast(game.ChatConnect)
  if chat then
    while true do
      pMsgItem = chat:GetHistorySysMsg(nIndex)
      if not pMsgItem then
        break
      end
      m_ui_sys.msg_panel:AddSystemMessage(pMsgItem.unType, pMsgItem.strMsg, true)
      nIndex = nIndex + 1
    end
  end
end, function()
  if not m_ui_sys then
    return
  end
  m_ui_sys.msg_panel:ClearMessage()
  local pMsgItem
  local nIndex = 0
  local chat = ptr_cast(game.ChatConnect)
  if chat then
    while true do
      pMsgItem = chat:GetHistorySysMsg(nIndex)
      if not pMsgItem then
        break
      end
      m_ui_sys.msg_panel:AddSystemMessage(pMsgItem.unType, pMsgItem.strMsg, true)
      nIndex = nIndex + 1
    end
  end
end

function ShowSysWnd(parent_win, location)
  if not m_ui_sys then
    m_ui_sys = CreateSystemMsgWnd(parent_win)
    AlignSysMsgWndUI()
  end
  GetSysMsgHistory()
  StopTimer()
end

function HideSysWnd()
  if m_ui_sys then
    m_ui_sys.root.Parent = nil
    m_ui_sys = nil
  end
end

local ui.btn_sysinfo.EventClick, TabSetCurSel = function(sender, e)
  HideAddChannelUI()
  HideSearchResult()
  if m_ui_sys then
    HideSysWnd()
  else
    ShowSysWnd(gui, Vector2(199, 23))
  end
end, ui.btn_sysinfo

function TabSetCurSel(nIndex)
  ui.btn_channel.PushDown = false
  ui.btn_friends.PushDown = false
  ui_page_channel.page.Parent = nil
  ui_page_friends.page.Parent = nil
  if nIndex == 0 then
    ui_page_channel.page.Parent = ui.page_container
    ui.btn_channel.PushDown = true
    ui.btn_AddMyChannel.Visible = bShowAddMyChannelBtn
  else
    ui_page_friends.page.Parent = ui.page_container
    ui.btn_friends.PushDown = true
    ui.btn_AddMyChannel.Visible = false
  end
end

function MoveFriend(nChannelID, unPlayerID, strPlayerName, nOption, level)
  local chat = ptr_cast(game.ChatConnect)
  if chat then
    chat:RequestMoveFriend(nChannelID, unPlayerID, nOption, level)
  end
end

function AddFriend(playID, level)
  MoveFriend(STRANGER_GROUP, playID, nil, 2, level)
end

function AddFriendsGroupItem(nType, group_list, online_state, player_level, player_name, player_id)
  local list = group_list
  local root = list.RootItem
  local item
  if tonumber(nType) == SEARCH_TYPE or tonumber(nType) == FRIEND_TYPE then
    item = list:AddItem(root, "")
    if tonumber(online_state) == INGAMING then
      item:SetIcon(0, IconsF.SocialityStatusIcons.PlayingA)
    elseif tonumber(online_state) == ONLINE then
      item:SetIcon(0, IconsF.SocialityStatusIcons.OnlineA)
    else
      item:SetIcon(0, IconsF.SocialityStatusIcons.OnlineN)
    end
    list:AddSubItem(item, "Lv" .. tonumber(player_level))
    item:SetTextColor(1, ARGB(255, 255, 255, 255))
    item:SetHighLightTextColor(1, ARGB(255, 62, 26, 1))
    list:AddSubItem(item, player_name)
    item:SetTextColor(2, ARGB(255, 255, 255, 255))
    item:SetHighLightTextColor(2, ARGB(255, 62, 26, 1))
    list:AddSubItem(item, player_id)
    list:AddSubItem(item, online_state)
  else
    item = list:AddItem(root, player_name)
    item:SetTextColor(0, ARGB(255, 255, 255, 255))
    item:SetHighLightTextColor(0, ARGB(255, 62, 26, 1))
    list:AddSubItem(item, player_id)
  end
  return item
end

function ui.btn_close.EventClick(sender, e)
  Hide()
end

function ui.btn_channel.EventClick(sender, e)
  TabSetCurSel(0)
end

local ui.btn_friends.EventClick, SearchAddToFriend = function(sender, e)
  HideSearchResult()
  HideAddChannelUI()
  TabSetCurSel(1)
end, ui.btn_friends

function SearchAddToFriend(unOnline_state, unPlayer_level, strPlayer_name, un64PlayerID)
  local chat = ptr_cast(game.ChatConnect)
  if chat then
    chat:SearchAddToFriend(unOnline_state, unPlayer_level, strPlayer_name, un64PlayerID)
  end
end

function ui_search_result.btn_search_add_friends.EventClick(sender, e)
  if ui_search_result.list.SelectedItem then
    if ui_search_result.list.SelectedItem:GetText(2) == SelectCharacter.role_text then
      MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1324"))
    else
      local level = string.sub(ui_search_result.list.SelectedItem:GetText(1), string.len("Lv") + 1)
      SearchAddToFriend(ui_search_result.list.SelectedItem:GetText(0), tonumber(level), ui_search_result.list.SelectedItem:GetText(2), ui_search_result.list.SelectedItem:GetText(3))
    end
  end
end

local ui_search_result.list.EventClick, RefreshSearchResult = function(sender, e)
  local list = sender
  if list.SelectedItem then
    ui_search_result.btn_search_add_friends.Enable = true
  else
    ui_search_result.btn_search_add_friends.Enable = false
  end
end, ui_search_result.list

function RefreshSearchResult(search_name, search_page)
  local list = ui_search_result.list
  list:DeleteAll()
  rpc.safecall("friend_search", {
    name = search_name,
    currentPage = search_page,
    pageSize = 10
  }, function(data)
    for _, v in ipairs(data.friends.list) do
      AddFriendsGroupItem(SEARCH_TYPE, list, v.playerState, v.playerLevel, v.playerName, v.playerId)
    end
    local page_bar = ui_search_result.page_bar
    page_bar.EventIndexChanged = nil
    page_bar.PageCount = data.friends.pageNum
    page_bar.CurrIndex = data.friends.currentPage
    
    function page_bar.EventIndexChanged(sender, e)
      RefreshSearchResult(search_name, sender.CurrIndex)
    end
    
    if list.ItemCount > 0 then
      list.SelectedItem = list:GetItemAt(Vector2(0, 0))
      ui_search_result.btn_search_add_friends.Enable = true
      if page_bar.PageCount > 1 then
        page_bar.Enable = true
      end
    else
      ui_search_result.btn_search_add_friends.Enable = false
      page_bar.Enable = false
    end
  end)
end

local ui.btn_search.EventClick, AddMyChannel = function(sender, e)
  HideAddChannelUI()
  HideSearchResult()
  InputBox.Show(GetUTF8Text("UI_social_Search_Player"), GetUTF8Text("UI_social_Enter_Players_Nickname"), function(player_name)
    RefreshSearchResult(player_name, 1)
    ShowSearchResult()
  end)
end, ui.btn_search

function AddMyChannel()
  local channel_name = string.gsub(ui_add_channel.txt_channel_name.Text, "^%s+", "")
  channel_name = string.gsub(channel_name, "%s+$", "")
  local strName = channel_name
  channel_name = string.gsub(channel_name, "%" .. GetUTF8Text("button_common_Channel") .. "+$", "")
  channel_name = string.gsub(channel_name, "%s+$", "")
  if string.len(channel_name) == 0 then
    if strName == GetUTF8Text("button_common_Channel") then
      MessageBox.ShowError(GetUTF8Text("msgbox_social_additional_string_067"), 2)
    else
      MessageBox.ShowError(GetUTF8Text("UI_social_Enter_Channel_Name"), 2)
    end
    return
  end
  channel_name = channel_name .. GetUTF8Text("button_common_Channel")
  local chat = ptr_cast(game.ChatConnect)
  if chat and chat:SendAddMyChannal(channel_name) then
    ui_add_channel.btn_OK.Enable = false
  end
end

function HideAddChannelUI()
  if ui_add_channel.root.Parent then
    ui_add_channel.txt_channel_name.Text = ""
    ui_add_channel.btn_OK.Enable = false
    ui_add_channel.root.Parent = nil
  end
end

function ui.btn_AddMyChannel.EventClick(sender, e)
  ui_add_channel.root.Parent = gui
  ui_add_channel.btn_OK.Enable = true
  ui_add_channel.txt_channel_name.Text = ""
end

function ui_add_channel.btn_OK.EventClick(sender, e)
  AddMyChannel()
end

function ui_add_channel.txt_channel_name.EventValueEnter(sender, e)
  AddMyChannel()
end

function ui_add_channel.btn_close.EventClick(sender, e)
  HideAddChannelUI()
end

local ui_add_channel.btn_Cancel.EventClick, AddChannelGroup = function(sender, e)
  HideAddChannelUI()
end, ui_add_channel.btn_Cancel
local AddChannelGroup, InitFriendsGroupListPopupMenu = function(name, channel_id)
  local group = ui_page_channel.group:AddChannelGroup(name)
  local list = group.ChannelList
  local align
  group.Tag = channel_id
  list.ItemGap = 2
  if tonumber(channel_id) == PUBLIC_CHANNEL then
    list.Style = "Sociality.ChannelList2"
    align = "kAlignCenterMiddle"
  else
    list.Style = "Sociality.ChannelList"
    align = "kAlignLeftMiddle"
  end
  CommonUtility.InitLtvHeader(list, {
    {
      "",
      1,
      "kAlignCenterMiddle"
    },
    {
      "",
      1,
      align
    },
    {
      "",
      1,
      "kAlignCenterMiddle"
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
      "kAlignCenterMiddle"
    }
  })
  
  function list.EventDoubleClick(sender, e)
    HideSearchResult()
    HideAddChannelUI()
    if sender.SelectedItem then
      if tonumber(channel_id) == PUBLIC_CHANNEL then
        if tonumber(list.SelectedItem:GetText(3)) >= tonumber(list.SelectedItem:GetText(4)) then
          if not ChatBar.CheckChatPairIsOpen(CHANNEL_TYPE, PUBLIC_CHANNEL, list.SelectedItem:GetText(2)) then
            MessageBox.ShowError(GetUTF8Text("msgbox_social_additional_string_068"), 2)
          end
        else
          local chat = ptr_cast(game.ChatConnect)
          if chat then
            chat:SendEnterOrLeaveChannal(PUBLIC_CHANNEL, list.SelectedItem:GetText(2), true)
          end
        end
      elseif tonumber(channel_id) == PUBLIC_CHANNEL then
        ChatBar.OpenChatPair(CHANNEL_TYPE, tonumber(channel_id), list.SelectedItem:GetText(2), sender.SelectedItem:GetText(1), true, true, 0, true)
      else
        ChatBar.OpenChatPair(CHANNEL_TYPE, tonumber(channel_id), list.SelectedItem:GetText(2), sender.SelectedItem:GetText(1), true, true, list.SelectedItem:GetText(5), true)
      end
    end
  end
  
  return group
end, function(sender, e)
  HideAddChannelUI()
end
local InitFriendsGroupListPopupMenu, InitFriendsGroupListPopupMenuForRecent = function(list)
  ComFuc.InitSocialityMenu(list.PopupMenu, {
    {
      "IDM_BEG_WISPER",
      GetUTF8Text("button_common_Chat"),
      function()
        if tonumber(list.SelectedItem:GetText(4)) == OFFLINE then
          MessageBox.ShowError(GetUTF8Text("msgbox_social_additional_string_069"), 2)
        else
          ChatBar.OpenChatPair(FRIEND_TYPE, MYFRIEND_GROUP, list.SelectedItem:GetText(3), list.SelectedItem:GetText(2), true, true, 0, true)
        end
      end
    },
    {
      "IDM_VIEW_PERSONALITY",
      GetUTF8Text("button_common_Info"),
      function()
        LookInfo.Show(list.SelectedItem:GetText(3))
      end
    },
    {
      "IDM_DELETE_FRIEND",
      GetUTF8Text("button_common_Delete"),
      function()
        local strMsg = string.format(GetUTF8Text("msgbox_common_num_1242"), list.SelectedItem:GetText(2))
        MessageBox.ShowWithConfirmCancel(strMsg, function()
          MoveFriend(MYFRIEND_GROUP, list.SelectedItem:GetText(3), list.SelectedItem:GetText(2), 0, 1)
        end, nil)
      end
    },
    {
      "IDM_MOVETO_BLACK",
      GetUTF8Text("button_common_Blacklist"),
      function()
        MoveFriend(MYFRIEND_GROUP, list.SelectedItem:GetText(3), list.SelectedItem:GetText(2), 1, 1)
      end
    }
  })
  
  function list.EventRightClick(sender, e)
    HideSearchResult()
    if sender.SelectedItem then
      local menu = sender.PopupMenu
      menu:Open()
    end
  end
end, Vector4(20, 18, 20, 18)
local InitFriendsGroupListPopupMenuForRecent, InitFriendsGroupListPopupMenuForBlack = function(list, nChannelID)
  ComFuc.InitSocialityMenu(list.PopupMenu, {
    {
      "IDM_ADD_FRIEND",
      GetUTF8Text("button_common_Add_Friend"),
      function()
        assert(list.SelectedItem)
        if nChannelID == SEARCH_TYPE then
          local level = string.sub(list.SelectedItem:GetText(1), string.len("Lv") + 1)
          SearchAddToFriend(list.SelectedItem:GetText(0), tonumber(level), list.SelectedItem:GetText(2), list.SelectedItem:GetText(3))
        else
          MoveFriend(LASTGAMER_GROUP, list.SelectedItem:GetText(3), list.SelectedItem:GetText(2), 2, 1)
        end
      end
    },
    {
      "IDM_VIEW_PERSONALITY",
      GetUTF8Text("button_common_Info"),
      function()
        LookInfo.Show(list.SelectedItem:GetText(3))
      end
    }
  })
  
  function list.EventRightClick(sender, e)
    if nChannelID ~= SEARCH_TYPE then
      HideSearchResult()
    end
    if sender.SelectedItem then
      sender.PopupMenu:Open()
    end
  end
end, Vector4(20, 18, 20, 18)
local InitFriendsGroupListPopupMenuForBlack, AddFriendsGroup = function(list)
  ComFuc.InitSocialityMenu(list.PopupMenu, {
    {
      "IDM_DELETE_FRIEND",
      GetUTF8Text("button_common_Delete"),
      function()
        local strMsg = string.format(GetUTF8Text("msgbox_social_additional_string_070"), list.SelectedItem:GetText(2))
        MessageBox.ShowWithConfirmCancel(strMsg, function()
          MoveFriend(BLACKLIST_GROUP, list.SelectedItem:GetText(3), list.SelectedItem:GetText(2), 0, 1)
        end, nil)
      end
    },
    {
      "IDM_VIEW_PERSONALITY",
      GetUTF8Text("button_common_Info"),
      function()
        LookInfo.Show(list.SelectedItem:GetText(3))
      end
    },
    {
      "IDM_ADD_TO_FRIEND",
      GetUTF8Text("button_common_Add_Friend"),
      function()
        MoveFriend(BLACKLIST_GROUP, list.SelectedItem:GetText(3), list.SelectedItem:GetText(2), 3, 1)
      end
    }
  })
  
  function list.EventRightClick(sender, e)
    HideSearchResult()
    if sender.SelectedItem then
      local menu = sender.PopupMenu
      menu:Open()
    end
  end
end, Vector4(20, 18, 20, 18)
local AddFriendsGroup, InitialSearchResult = function(name, id)
  local group = ui_page_friends.group:AddFriendsGroup(name)
  local list = group.FriendsList
  list.Style = "Sociality.FriendsList"
  LobbyBoxContern.InitFriendListHeader(list)
  if tonumber(id) == tonumber(BLACKLIST_GROUP) then
    InitFriendsGroupListPopupMenuForBlack(list)
  elseif tonumber(id) == tonumber(LASTGAMER_GROUP) then
    InitFriendsGroupListPopupMenuForRecent(list, LASTGAMER_GROUP)
  else
    InitFriendsGroupListPopupMenu(list)
  end
  if id == MYFRIEND_GROUP then
    group.ExpendFlag = true
  end
  
  function list.EventDoubleClick(sender, e)
    HideSearchResult()
    HideAddChannelUI()
    if sender.SelectedItem then
      if tonumber(id) == tonumber(BLACKLIST_GROUP) then
        MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1351"))
      elseif tonumber(id) == tonumber(MYFRIEND_GROUP) then
        if tonumber(list.SelectedItem:GetText(4)) == OFFLINE then
          MessageBox.ShowError(GetUTF8Text("msgbox_social_additional_string_071"), 2)
        else
          ChatBar.OpenChatPair(FRIEND_TYPE, id, list.SelectedItem:GetText(3), sender.SelectedItem:GetText(2), true, true, 0, true)
        end
      end
    end
  end
  
  return group
end, Vector4(20, 18, 20, 18)

function InitialSearchResult()
  local list = ui_search_result.list
  list:DeleteColumns()
  LobbyBoxContern.InitFriendListHeader(list)
  InitFriendsGroupListPopupMenuForRecent(list, 0)
  
  function list.EventDoubleClick(sender, e)
    if ui_search_result.list.SelectedItem:GetText(2) == SelectCharacter.role_text then
      MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1324"))
    else
      local level = string.sub(ui_search_result.list.SelectedItem:GetText(1), string.len("Lv") + 1)
      SearchAddToFriend(ui_search_result.list.SelectedItem:GetText(0), tonumber(level), ui_search_result.list.SelectedItem:GetText(2), ui_search_result.list.SelectedItem:GetText(3))
    end
  end
  
  function ui_search_result.btn_close.EventClick(sender, e)
    local page_bar = ui_search_result.page_bar
    page_bar.CurrIndex = 1
    ui_search_result.root.Parent = nil
  end
end

function ShowSearchResult()
  ui_search_result.root.Parent = gui
  ui_search_result.page_bar.CurrIndex = 1
  AlignSearchResult()
end

function HideSearchResult()
  ui_search_result.root.Parent = nil
end

local AlignSearchResult, UpdateChannel = function()
  Gui.Align(ui_search_result.root, 0.5, 0.5)
end, function()
  Gui.Align(ui_search_result.root, 0.5, 0.5)
end
local UpdateChannel, UpdateChannelGroup = function(nType)
  local chat = ptr_cast(game.ChatConnect)
  if not chat then
    return
  end
  if tonumber(nType) == CHANNEL_TYPE then
    ui_page_channel.group:RemoveAllGroup()
  elseif tonumber(nType) == FRIEND_TYPE then
    ui_page_friends.group:RemoveAllGroup()
  else
    return
  end
  local channelItem
  local index = 0
  local group
  while true do
    channelItem = chat:GetChannelItem(nType, index)
    if not channelItem then
      break
    end
    if tonumber(nType) == CHANNEL_TYPE then
      group = AddChannelGroup(channelItem.strName, channelItem.un64ChannelID)
      chat:SetGroupList(nType, channelItem.un64ChannelID, group.ChannelList)
    else
      group = AddFriendsGroup(channelItem.strName, channelItem.un64ChannelID)
      chat:SetGroupList(nType, channelItem.un64ChannelID, group.FriendsList)
    end
    group.TitleBtn.CloseBtn.Visible = false
    if index == 0 then
      group.ExpendFlag = true
    end
    index = index + 1
  end
end, Vector4(20, 18, 20, 18)
local UpdateChannelGroup, UpdateFriendList = function(sender, un64ChannelID, count)
  local list = sender
  local chat = ptr_cast(game.ChatConnect)
  if chat == nil or list == nil then
    return
  end
  local selected_item = list.SelectedItem
  list:DeleteAll()
  for i = 1, count do
    local Group = chat:GetChannelGroupItem(un64ChannelID, i - 1)
    if Group then
      local item = ptr_cast(list:AddItem(list.RootItem, ""), "Gui.SocialityChannelListItem")
      if item then
        item:SetLocation(0, Vector2(6, 6))
        item:SetSize(0, Vector2(48, 48))
        list:AddSubItem(item, Group.strGroupName)
        item:SetTextColor(1, ARGB(255, 255, 255, 255))
        item:SetHighLightTextColor(1, ARGB(255, 255, 255, 0))
        if tonumber(un64ChannelID) == PUBLIC_CHANNEL then
          item:SetLocation(1, Vector2(10, 3))
        else
          item:SetLocation(1, Vector2(10, 5))
        end
        item:SetSize(1, Vector2(236, 23))
        list:AddSubItem(item, Group.un64GroupID)
        item:SetSize(2, Vector2(0, 0))
        if tonumber(un64ChannelID) == PUBLIC_CHANNEL then
          list:AddSubItem(item, Group.unPlayer_num)
          item:SetSize(3, Vector2(0, 0))
        else
          list:AddSubItem(item, GetUTF8Text("UI_common_Current_Size") .. Group.unPlayer_num .. "/" .. Group.unMaxPlayer)
          item:SetTextColor(3, ARGB(255, 255, 255, 255))
          item:SetHighLightTextColor(3, ARGB(255, 255, 255, 0))
          item:SetLocation(3, Vector2(10, 28))
          item:SetSize(3, Vector2(199, 23))
        end
        list:AddSubItem(item, Group.unMaxPlayer)
        item:SetSize(4, Vector2(0, 0))
        if tonumber(un64ChannelID) == PUBLIC_CHANNEL then
          list:AddSubItem(item, "")
          item:SetLocation(5, Vector2(223, 8))
          item:SetSize(5, Vector2(16, 16))
          if tonumber(Group.unPacent) >= tonumber(SHOW_ICON_COUNT_1) and tonumber(Group.unPacent) < tonumber(SHOW_ICON_COUNT_2) then
            item:SetIcon(5, HalfHot)
          elseif tonumber(Group.unPacent) >= tonumber(SHOW_ICON_COUNT_2) then
            item:SetIcon(5, HotN)
          end
        else
          list:AddSubItem(item, Group.unOwerID)
          item:SetSize(5, Vector2(0, 0))
        end
        if selected_item and tonumber(selected_item:GetText(2)) == Group.un64GroupID then
          list.SelectedItem = item
        end
      end
    end
  end
  if tonumber(un64ChannelID) == PRIVATE_CHANNEL then
    if tonumber(count) == MAX_MYCHANNEL_COUNT then
      ui.btn_AddMyChannel.Enable = false
    else
      ui.btn_AddMyChannel.Enable = true
    end
  end
end, Vector4(20, 18, 20, 18)
local UpdateFriendList, InitChatCallBack = function(list, nType, un64ChannelID, un64GroupID, count)
  local chat = ptr_cast(game.ChatConnect)
  if not chat or not list then
    return
  end
  local selected_item = list.SelectedItem
  list:DeleteAll()
  for i = 1, count do
    local GroupItem = chat:GetFriendGroupItem(nType, un64ChannelID, un64GroupID, i - 1)
    local RetItem = AddFriendsGroupItem(nType, list, GroupItem.unOnline_state, GroupItem.unPlayer_level, GroupItem.strPlayer_name, GroupItem.un64PlayerID)
    if selected_item and selected_item:GetText(3) == tostring(GroupItem.un64PlayerID) then
      list.SelectedItem = RetItem
    end
  end
end, Vector4(20, 18, 20, 18)

function InitChatCallBack()
  local chat = ptr_cast(game.ChatConnect)
  if not chat then
    return
  end
  
  function chat.EventReturnResult(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateMainGame")
    if state then
      return
    end
    if e.unRetValue == Text.SocialityErrorChat.kErrorSocialChatToFast then
      RunProhibitTimer()
    end
    if e.unRetValue ~= 0 then
      if not ui_add_channel.btn_OK.Enable then
        ui_add_channel.btn_OK.Enable = true
      end
      HideSearchResult()
      MessageBox.ShowError(Text.SocialityErrorText[e.unRetValue])
    else
      MessageBox.ShowError(e.msg)
    end
  end
  
  function chat.EventUpdateChannel(sender, e)
    if tonumber(e.un64ChannelID) == 0 then
      UpdateChannel(e.unType)
    elseif tonumber(e.un64GroupID) == 0 then
      if tonumber(e.unType) == CHANNEL_TYPE then
        UpdateChannelGroup(sender, e.un64ChannelID, e.unCount)
      elseif tonumber(e.unType) == FRIEND_TYPE then
        UpdateFriendList(sender, e.unType, e.un64ChannelID, 0, e.unCount)
      end
    elseif tonumber(e.unType) == CHANNEL_TYPE then
      UpdateFriendList(sender, e.unType, e.un64ChannelID, e.un64GroupID, e.unCount)
    end
  end
  
  function chat.EventUpdateChatMsg(sender, e)
    ChatBar.OnUpdateChatMsg(sender, e)
  end
  
  function chat.EventAddChannel(sender, e)
    HideAddChannelUI()
    MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1226"))
  end
  
  function chat.EventEnterChannel(sender, e)
    ChatBar.OpenChatPair(CHANNEL_TYPE, e.un64ChannelID, e.un64GroupID, e.strGroupName, true, true, 0, true)
  end
  
  function chat.EventInviteFriend(sender, e)
    ChatBar.OnInviteFriend(sender, e)
  end
  
  function chat.EventFriendAsking(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateMainGame")
    if state then
      return
    end
    local pItem = chat:GetFriendGroupItem(3, 0, 0, 0)
    if pItem then
      local strMsg = string.format(GetUTF8Text("msgbox_social_additional_string_072"), pItem.strPlayer_name)
      MessageBox.ShowWithConfirmCancel(strMsg, function()
        chat:FriendAskingAgree(pItem.un64PlayerID, true)
      end, function()
        chat:FriendAskingAgree(pItem.un64PlayerID, false)
      end)
    end
  end
  
  function chat.EventUpdateChannelFriend(sender, e)
    ChatBar.OnUpdateChannelFriend(sender, e)
  end
  
  function chat.EventGroupDelete(sender, e)
    ChatBar.OnGroupDelete(sender, e)
  end
  
  function chat.EventSystemMessage(sender, e)
    if e.unType == 1 then
      LobbyBoxContern.ShowSysMsgTip(e.unType, e.msg)
      RunTimer()
    else
      Lobby.ShowSysMsgTip(e.unType, e.msg)
      RunLobbyMsgTimer()
    end
  end
end

function Initialize()
  bShowAddMyChannelBtn = false
  InitialSearchResult()
  InitChatCallBack()
  UpdateChannel(CHANNEL_TYPE)
  ui.btn_AddMyChannel.Visible = false
  UpdateChannel(FRIEND_TYPE)
  TabSetCurSel(1)
end

function AlignUI()
  Gui.Align(ui.root, -13, 253)
  AlignSearchResult()
  AlignSysMsgWndUI()
end

function Visible()
  return ui.root.Parent ~= nil
end

function Show(MailWin)
  ui.root.Parent = gui
  AlignUI()
  InitChatCallBack()
  ChatUnShow.AlignUI()
end

function Hide()
  ui.root.Parent = nil
  HideSearchResult()
  HideAddChannelUI()
  StopTimer()
  StopLobbyTimer()
  ChatUnShow.AlignUI()
end

Initialize()

function TestMsg()
  local strMsg = "<msg type=\"s\"><content key=\"msgbox_common_conditionkey_185\"><entry><player id=\"22\" name=\"heye1\" /></entry><entry><sysItem id=\"10\" name=\"id_datalist_Savage_Terminator\" grade=\"2\" /></entry><entry>8</entry></content></msg>"
  Lobby.ShowSysMsgTip(1, strMsg)
end
