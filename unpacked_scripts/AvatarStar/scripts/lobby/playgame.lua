module("LobbyPlayGame", package.seeall)
local my_location = 0
local show_error_time = 3
local m_inviteUI
local slot_item = {}
ui = Gui.Create()({
  Gui.Control("root")({
    Dock = "kDockFill",
    ComFuc.ComControl(nil, Vector2(1116, 40), Vector2(6, 5), 255, SkinF.skin_playgame_034),
    Gui.Control("mode_select_panel")({
      Location = Vector2(258, 46),
      Size = Vector2(863, 118),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.personalInfo_206,
      Gui.Label({
        Location = Vector2(11, 5),
        Size = Vector2(119, 18),
        Text = GetUTF8Text("UI_battlefield_Mode_Selection"),
        TextColor = ARGB(255, 255, 255, 255),
        FontSize = 16
      }),
      Gui.FlowLayout({
        Location = Vector2(6, 34),
        Size = Vector2(850, 77),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005,
        Gui.Button("btn_mode_all")({
          Size = Vector2(74, 74),
          Margin = Vector4(14, 3, 0, 0),
          Skin = SkinF.skin_playgame_035,
          CanMove = true,
          EventClick = function(sender, e)
            RefreshRoomList("kNone")
          end
        }),
        Gui.Button("btn_mode_teamdead")({
          Size = Vector2(74, 74),
          Margin = Vector4(14, 3, 0, 0),
          Skin = SkinF.battle_004[3],
          CanMove = true,
          EventClick = function(sender, e)
            RefreshRoomList("kTeamDead")
          end
        }),
        Gui.Button("btn_mode_contention")({
          Size = Vector2(74, 74),
          Margin = Vector4(14, 3, 0, 0),
          Skin = SkinF.battle_004[5],
          CanMove = true,
          EventClick = function(sender, e)
            RefreshRoomList("kContention")
          end
        }),
        Gui.Button("btn_mode_occupy")({
          Size = Vector2(74, 74),
          Margin = Vector4(14, 3, 0, 0),
          Skin = SkinF.battle_004[2],
          CanMove = true,
          EventClick = function(sender, e)
            RefreshRoomList("kOccupy")
          end
        }),
        Gui.Button("btn_mode_treasure")({
          Size = Vector2(74, 74),
          Margin = Vector4(14, 3, 0, 0),
          Skin = SkinF.battle_004[4],
          CanMove = true,
          EventClick = function(sender, e)
            RefreshRoomList("kSnatch")
          end
        })
      })
    }),
    Gui.Control("advance_panel")({
      Size = Vector2(247, 590),
      Location = Vector2(8, 46),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = Gui.ControlSkin({
        BackgroundImage = Gui.Image("ui/skinF/skin_playgame_bg26.tga", Vector4(0, 0, 0, 0))
      }),
      Padding = Vector4(13, 13, 13, 13),
      Gui.Label("tip_panel")({
        Location = Vector2(11, 483),
        Size = Vector2(226, 78),
        BackgroundColor = ARGB(0, 255, 0, 0),
        Text = GetUTF8Text("UI_battlefield_Instruction_Freestyle_Combat"),
        AutoWrap = true,
        FontSize = 16,
        TextAlign = "kAlignLeftTop"
      })
    }),
    Gui.Control("room_list_panel")({
      Location = Vector2(258, 167),
      Size = Vector2(863, 469),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.personalInfo_124,
      Gui.Control({
        Location = Vector2(5, 7),
        Size = Vector2(853, 395),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005
      }),
      Gui.ListTreeView("list")({
        Style = "Gui.AvatarListTreeView",
        Size = Vector2(841, 373),
        Location = Vector2(10, 15),
        HeaderClickAudio = "menu3rd"
      }),
      ComFuc.ComIconButton("btn_novice", Vector2(128, 56), Vector2(150, 405), SkinF.icon_playgame_001, GetUTF8Text("button_lobby_additional_string_130"), SkinF.select_character_038, function(sender, e)
        CreateNoviceRoom()
      end),
      ComFuc.ComIconButton("btn_backto_battle", Vector2(128, 56), Vector2(10, 405), SkinF.icon_playgame_004, GetUTF8Text("button_common_Back"), SkinF.select_character_038, function(sender, e)
        LobbyStartGame.SelectMainBtn(1)
      end),
      ComFuc.ComIconButton("btn_create_room", Vector2(128, 56), Vector2(591, 405), SkinF.icon_playgame_002, GetUTF8Text("button_common_Create_Room"), SkinF.select_character_038, function(sender, e)
        local state = ptr_cast(game.CurrentState)
        local room_info_desc = ptr_new("Client.RoomInfoDesc")
        room_info_desc.room_name = string.format(GetUTF8Text("UI_battlefield_strings_Room"), state:GetCharacterName())
        room_info_desc.game_type = "kTeamDead"
        room_info_desc.spawn_time = 3
        CreateRoom.SetRoomOption(room_info_desc)
        CreateRoom.ui.cb_client_count.Enable = true
        CreateRoom.ShowModal(function()
          CreateRoom.GetRoomOption(room_info_desc)
          if string.len(room_info_desc.room_name) == 0 then
            MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1282"), show_error_time)
            return
          end
          state:CreateRoom(room_info_desc)
          MessageBox.ShowWaiter(GetUTF8Text("msgbox_common_num_1295"))
        end)
      end),
      ComFuc.ComIconButton("btn_enter_room", Vector2(128, 56), Vector2(728, 405), SkinF.icon_playgame_003, GetUTF8Text("button_common_Room_Enter"), SkinF.skin_playgame_036, function(sender, e)
        local item = ui.list.SelectedItem
        if item then
          ui.msg_panel:ClearMessage()
          EnterRoom(item)
        else
          MessageBox.ShowError(GetUTF8Text("msgbox_battlefield_additional_string_131"))
        end
      end)
    }),
    Gui.Control("room_info_panel")({
      Size = Vector2(395, 645),
      Location = Vector2(0, 0),
      BackgroundColor = ARGB(0, 255, 255, 255),
      Skin = SkinF.personalInfo_124,
      Gui.Control("pic_area")({
        Size = Vector2(374, 281),
        Location = Vector2(15, 46),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.skin_playgame_023,
        Gui.Picture("pic_map")({
          Size = Vector2(306, 172),
          Location = Vector2(34, 9),
          KeepAspect = true,
          ForeGroundImage = nil
        }),
        Gui.Label({
          Size = Vector2(99, 20),
          Location = Vector2(38, 182),
          Text = GetUTF8Text("UI_battlefield_Room_Name"),
          TextColor = ARGB(255, 255, 255, 255),
          FontSize = 14
        }),
        Gui.Label("lbl_room_name")({
          Size = Vector2(187, 20),
          Location = Vector2(147, 182),
          Text = "",
          TextColor = ARGB(255, 255, 255, 0),
          FontSize = 14
        }),
        Gui.Label({
          Size = Vector2(99, 20),
          Location = Vector2(38, 203),
          Text = GetUTF8Text("UI_battlefield_Host"),
          TextColor = ARGB(255, 255, 255, 255),
          FontSize = 14
        }),
        Gui.Label("lbl_host_name")({
          Size = Vector2(187, 20),
          Location = Vector2(147, 203),
          Text = "",
          TextColor = ARGB(255, 255, 255, 0),
          FontSize = 14
        }),
        Gui.Label({
          Size = Vector2(99, 20),
          Location = Vector2(38, 224),
          Text = GetUTF8Text("UI_battlefield_Game_Mode"),
          TextColor = ARGB(255, 255, 255, 255),
          FontSize = 14
        }),
        Gui.Label("lbl_game_mode")({
          Size = Vector2(187, 20),
          Location = Vector2(147, 224),
          Text = "",
          TextColor = ARGB(255, 255, 255, 0),
          FontSize = 14
        }),
        Gui.Label({
          Size = Vector2(99, 20),
          Location = Vector2(38, 245),
          Text = GetUTF8Text("UI_battlefield_additional_string_132"),
          TextColor = ARGB(255, 255, 255, 255),
          FontSize = 14
        }),
        Gui.Label("lbl_player_limits")({
          Size = Vector2(187, 20),
          Location = Vector2(147, 245),
          Text = "",
          TextColor = ARGB(255, 255, 255, 0),
          FontSize = 14
        })
      }),
      Gui.Control("msg_area")({
        Size = Vector2(384, 305),
        Location = Vector2(10, 332),
        BackgroundColor = ARGB(0, 255, 255, 255),
        Gui.Control({
          Size = Vector2(0, 38),
          Dock = "kDockBottom",
          BackgroundColor = ARGB(255, 255, 255, 255),
          Skin = SkinF.battle_012,
          Gui.Button("send_btn")({
            Dock = "kDockRight",
            Size = Vector2(48, 0),
            Margin = Vector4(6, 3, 6, 3),
            Style = "Gui.Button",
            Text = GetUTF8Text("button_common_Send"),
            CanMove = true,
            FontSize = 16
          }),
          Gui.Textbox("input_box")({
            Dock = "kDockFill",
            Margin = Vector4(3, 0, 3, 0),
            Text = "",
            TextColor = ARGB(0, 255, 255, 255),
            BackgroundColor = ARGB(0, 255, 255, 255),
            FontSize = 16
          })
        }),
        Gui.NewMessagePanel("msg_panel")({
          Dock = "kDockFill",
          Margin = Vector4(3, 0, 3, 1),
          BackgroundColor = ARGB(255, 255, 255, 255),
          Skin = SkinF.battle_013,
          Style = "LobbyBattleGame.MessagePanel",
          MaxTextWidth = 346,
          OnePageLineNum = 12,
          MaxLineNum = 48,
          LineGap = 1
        })
      })
    }),
    Gui.Control("in_room_panel")({
      Location = Vector2(395, 46),
      Size = Vector2(726, 591),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.personalInfo_206,
      Gui.Label("tb_room_name_title")({
        Location = Vector2(11, 5),
        Size = Vector2(700, 21),
        Text = "",
        FontSize = 16,
        TextAlign = "kAlignCenterLeft",
        Gui.Control("panel_pwd")({
          Size = Vector2(250, 21),
          Dock = "kDockRight",
          BackgroundColor = ARGB(0, 255, 0, 0),
          Gui.Label({
            Size = Vector2(166, 0),
            Dock = "kDockLeft",
            Text = GetUTF8Text("UI_battlefield_Room_Password"),
            TextColor = ARGB(255, 255, 214, 49),
            FontSize = 16,
            TextAlign = "kAlignRightMiddle"
          }),
          Gui.Label("lbl_pwd")({
            Size = Vector2(80, 0),
            Dock = "kDockRight",
            BackgroundColor = ARGB(255, 255, 255, 255),
            Skin = SkinF.skin_playgame_015,
            Text = "",
            TextColor = ARGB(255, 255, 214, 49),
            TextColor = ARGB(255, 255, 214, 49),
            FontSize = 16
          })
        })
      }),
      Gui.Control({
        Location = Vector2(17, 34),
        Size = Vector2(693, 100),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.skin_playgame_013,
        Gui.Label("lbl_left")({
          Size = Vector2(49, 62),
          Location = Vector2(21, 19),
          TextColor = ARGB(255, 242, 223, 0),
          TextAlign = "kAlignCenterMiddle",
          FontSize = 36,
          Text = "0",
          TextureFont = SkinF.team_num_font_red
        }),
        Gui.Label("lbl_right")({
          Size = Vector2(49, 62),
          Location = Vector2(623, 19),
          TextColor = ARGB(255, 242, 223, 0),
          TextAlign = "kAlignCenterMiddle",
          FontSize = 36,
          Text = "0",
          TextureFont = SkinF.team_num_font_blue
        })
      }),
      Gui.Control({
        Location = Vector2(6, 135),
        Size = Vector2(714, 389),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.battle_005,
        Gui.ListTreeView("left_list")({
          Style = "Gui.AvatarListTreeView002",
          Size = Vector2(349, 375),
          Location = Vector2(7, 7),
          ItemClickAudio = "roomswitch"
        }),
        Gui.ListTreeView("right_list")({
          Style = "Gui.AvatarListTreeView003",
          Size = Vector2(349, 375),
          Location = Vector2(359, 7),
          ItemClickAudio = "roomswitch"
        })
      }),
      ComFuc.ComIconButton("b_back", Vector2(128, 56), Vector2(7, 526), SkinF.icon_playgame_004, GetUTF8Text("button_common_Back"), SkinF.select_character_038, function(sender, e)
        local state = ptr_cast(game.CurrentState)
        state:LeaveRoom()
        ui.msg_panel:ClearMessage()
      end),
      ComFuc.ComIconButton("b_invite", Vector2(128, 56), Vector2(317, 526), SkinF.icon_playgame_005, GetUTF8Text("button_common_Invite"), SkinF.select_character_038, function(sender, e)
        function OnInviteCallback(friendArray)
          local state = ptr_cast(game.CurrentState)
          
          local room_info = state:GetSelfRoomInfo()
          if room_info.GameType ~= "kNone" then
            for k, v in pairs(friendArray) do
              state:RoomInvite(v.name, room_info.RoomUid)
            end
          end
        end
        
        function OnCloseIniteCallback()
          m_inviteUI = nil
        end
        
        LobbyBoxContern.m_bCheckPlayerLevel = false
        local IDArray = {}
        for k, v in pairs(slot_item) do
          if v.Tag then
            table.insert(IDArray, ptr_cast(v.Tag).character_id)
          end
        end
        LobbyBoxContern.SetBlockIDArray(IDArray)
        m_inviteUI = LobbyBoxContern.ShowInvite(gui, true, Vector2(700, 420), OnInviteCallback, nil, true)
      end),
      ComFuc.ComIconButton("b_host_set", Vector2(128, 56), Vector2(453, 526), SkinF.icon_playgame_006, GetUTF8Text("button_common_Room_Setting"), SkinF.select_character_038, function(sender, e)
        local state = ptr_cast(game.CurrentState)
        local room_info = state:GetSelfRoomInfo()
        if room_info.RoomState == 2 then
          MessageBox.ShowError(GetUTF8Text("msgbox_battlefield_additional_string_133"), show_error_time)
          return
        end
        local room_info_desc = ptr_new("Client.RoomInfoDesc")
        room_info_desc.room_name = room_info.RoomName
        room_info_desc.use_password = room_info.UsePassword and 1 or 0
        room_info_desc.password = room_info.Password
        room_info_desc.game_type = room_info.GameType
        room_info_desc.level_id = room_info.LevelId
        room_info_desc.max_client_num = room_info.MaxClientNum
        room_info_desc.spawn_time = room_info.SpawnTime
        room_info_desc.join_halfway = room_info.JoinHalfWay
        room_info_desc.check_balance = room_info.CheckBalance
        CreateRoom.SetRoomOption(room_info_desc)
        CreateRoom.ui.cb_client_count.Enable = false
        CreateRoom.ShowModal(function()
          CreateRoom.GetRoomOption(room_info_desc)
          if string.len(room_info_desc.room_name) == 0 then
            MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1282"), show_error_time)
            return
          end
          state:RoomChangeOption(room_info_desc)
          MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_134"))
        end)
      end),
      ComFuc.ComIconButton("b_start", Vector2(128, 56), Vector2(589, 526), SkinF.icon_playgame_007, GetUTF8Text("UI_common_Start_Game"), SkinF.skin_playgame_036, function(sender, e)
      end)
    })
  })
})
ui.list.Columns.Clickable = true
ui.list:AddColumn(GetUTF8Text("UI_battlefield_NO_room"), 53, "kAlignCenterMiddle")
ui.list:AddColumn(GetUTF8Text("UI_battlefield_State"), 61, "kAlignCenterMiddle")
ui.list:AddColumn(GetUTF8Text("UI_battlefield_Room_Name"), 235, "kAlignLeftMiddle")
ui.list:AddColumn(GetUTF8Text("UI_battlefield_Host"), 164, "kAlignLeftMiddle")
ui.list:AddColumn(GetUTF8Text("UI_battlefield_Map"), 174, "kAlignLeftMiddle")
ui.list:AddColumn(GetUTF8Text("UI_avatar_room_list_mode"), 60, "kAlignCenterMiddle")
ui.list:AddColumn(GetUTF8Text("UI_battlefield_Size"), 66, "kAlignLeftMiddle")
ui.list.Columns:SetAlign(1, "kAlignCenterMiddle")
ui.list.Columns.TextColor = ARGB(255, 255, 255, 255)
ui.list.Columns.TextShadowColor = ARGB(150, 0, 0, 0)
ui.list.Columns.FontSize = 16
ui.list.ItemClickAudio = "roomselected"
if game.version_close_beta_1 then
  ui.btn_mode_occupy.Visible = false
  ui.btn_mode_treasure.Visible = false
  ui.btn_novice.Visible = false
  ui.b_invite.Visible = false
end
if game.version_close_beta_2 then
  ui.btn_novice.Visible = false
  ui.btn_mode_treasure.Visible = false
end
if game.version_close_beta_3 then
  ui.btn_novice.Visible = false
  ui.btn_mode_treasure.Visible = false
end

function ui.list.Columns.EventItemClick(sender, e)
  local state = ptr_cast(game.CurrentState)
  if state then
    ui.list:SortColumnExt(e.Column, false, state:GetRoomListCompareFunc())
  else
    print("state not valid when sorting rooms")
  end
end

function ui.list.EventDoubleClick(sender, e)
  local item = sender.SelectedItem
  if item then
    EnterRoom(item)
  end
end

function ui.list.EventNodeMouseEnter(sender, e)
  if e.Item then
    local item = e.Item
    local room_info = ptr_cast(item.Tag)
    UpdateRoomInfoPanel(room_info)
    ui.pic_area.Parent = gui
    ui.pic_area.Location = ui.list:CalculateTipLocation(item, ui.pic_area.Size)
  end
end

function ui.list.EventNodeMouseLeave(sender, e)
  ui.pic_area.Parent = ui.room_info_panel
  ui.pic_area.Location = Vector2(15, 46)
end

for id, list in ipairs({
  ui.left_list,
  ui.right_list
}) do
  list.Columns.Clickable = false
  list.Columns.Movable = false
  list:AddColumn("", 47, "kAlignCenterMiddle")
  list:AddColumn("", 220, "kAlignLeftMiddle")
  list:AddColumn("", 70, "kAlignLeftMiddle")
  list.Columns.TextColor = ARGB(255, 255, 255, 255)
  list.Columns.FontSize = 16
  local root = list.RootItem
  for i = 1, 8 do
    local item = list:AddItem(root, "")
    item.ID = i + (id - 1) * 8
    item:AddSubItem("")
    item:AddSubItem("")
    item:AddSubItem("")
    item:SetTextColor(0, ARGB(255, 81, 59, 45))
    item:SetTextColor(1, ARGB(255, 81, 59, 45))
    item:SetTextColor(2, ARGB(255, 81, 59, 45))
    item:SetHighLightTextColor(0, ARGB(255, 81, 59, 45))
    item:SetHighLightTextColor(1, ARGB(255, 81, 59, 45))
    item:SetHighLightTextColor(2, ARGB(255, 81, 59, 45))
    table.insert(slot_item, item)
  end
  local menu_table = {
    {
      "IDM_KICK_OUT",
      GetUTF8Text("button_common_Kick_from_Room"),
      function()
        local state = ptr_cast(game.CurrentState)
        state:RoomKickClient(ptr_cast(list.SelectedItem.Tag).slot_id)
        MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_135"))
      end
    },
    {
      "IDM_BEG_WISPER",
      GetUTF8Text("button_common_Chat"),
      function()
        assert(list.SelectedItem)
        local client_info = ptr_cast(list.SelectedItem.Tag)
        ChatBar.OpenFriendChatPair(client_info.character_id, client_info.character_name)
      end
    },
    {
      "IDM_ADD_FRIEND",
      GetUTF8Text("button_common_Add_Friend"),
      function()
        assert(list.SelectedItem)
        local client_info = ptr_cast(list.SelectedItem.Tag)
        Sociality.AddFriend(client_info.character_id, client_info.level)
      end
    },
    {
      "IDM_INVITE",
      GetUTF8Text("button_common_Invite_to_Guild"),
      function()
        assert(list.SelectedItem)
        MessageBox.ShowError("\187\185\206\180\202\181\207\214T_T", show_error_time)
      end
    },
    {
      "IDM_VIEW_PERSONALITY",
      GetUTF8Text("button_common_Info"),
      function()
        assert(list.SelectedItem)
        local client_info = ptr_cast(list.SelectedItem.Tag)
        LookInfo.Show(client_info.character_id)
      end
    },
    {
      "IDM_MOVETO_BLACK",
      GetUTF8Text("button_common_Move_To_Blacklist"),
      function()
        assert(list.SelectedItem)
        local client_info = ptr_cast(list.SelectedItem.Tag)
        Sociality.ToBlack(client_info.character_id)
      end
    }
  }
  if game.version_close_beta_1 or game.version_close_beta_2 or game.version_close_beta_3 then
    table.remove(menu_table, 6)
    table.remove(menu_table, 4)
  end
  ComFuc.InitSocialityMenu(list.PopupMenu, menu_table)
  
  function list.PopupMenu.EventOpen(sender, e)
    local client_info = ptr_cast(list.SelectedItem.Tag)
    local state = ptr_cast(game.CurrentState)
    local my_id = state:GetCharacterId()
    local room_info = state:GetSelfRoomInfo()
    for i = 0, sender.ItemCount - 1 do
      local id = sender:GetId(i)
      if id == "IDM_KICK_OUT" then
        sender:SetEnable(i, client_info.character_id ~= my_id and room_info.HostId == my_id)
      elseif id == "IDM_BEG_WISPER" then
        sender:SetEnable(i, client_info.character_id ~= my_id)
      elseif id == "IDM_ADD_FRIEND" then
        sender:SetEnable(i, client_info.character_id ~= my_id)
      elseif id == "IDM_INVITE" then
        sender:SetEnable(i, client_info.character_id ~= my_id)
      elseif id == "IDM_VIEW_PERSONALITY" then
        sender:SetEnable(i, client_info.character_id ~= my_id)
      elseif id == "IDM_MOVETO_BLACK" then
        sender:SetEnable(i, client_info.character_id ~= my_id)
      end
    end
  end
  
  function list.EventSelectItemChange(sender, e)
    local item = sender.SelectedItem
    if item then
      if item.ID > 8 then
        ui.left_list.SelectedItem = nil
      else
        ui.right_list.SelectedItem = nil
      end
      local state = ptr_cast(game.CurrentState)
      state:ChangeSlot(item.ID)
    end
  end
  
  function list.EventRightClick(sender, e)
    if sender.SelectedItem and sender.SelectedItem.Tag then
      sender.PopupMenu:Open()
    end
  end
end

function ui.input_box.EventValueEnter(sender, e)
  if string.len(ui.input_box.Text) > 0 then
    game:Chat(nil, ui.input_box.Text)
    ui.input_box.Text = ""
  end
end

function ui.send_btn.EventClick(sender, e)
  if string.len(ui.input_box.Text) > 0 then
    game:Chat(nil, ui.input_box.Text)
    ui.input_box.Text = ""
  end
end

function UpdateRoomInfoPanel(room_info)
  local map_key = CreateRoom.find_map_key_from_id(room_info.LevelId)
  if map_key then
    ui.pic_map.ForeGroundImage = Icons.PreviewMaps[string.lower(map_key)]
  else
    ui.pic_map.ForeGroundImage = Icons.PreviewMaps.level_random
  end
  ui.lbl_room_name.Text = room_info.RoomName
  ui.lbl_host_name.Text = room_info.HostName
  ui.lbl_player_limits.Text = room_info.MaxClientNum
  ui.lbl_game_mode.Text = Text.GameMode[room_info.GameType]
  if room_info.UsePassword then
    ui.panel_pwd.Visible = true
    ui.lbl_pwd.Text = room_info.Password
  else
    ui.panel_pwd.Visible = false
  end
end

function CheckEquipment(void)
  if ComFuc.hasEquipNoTime == 0 and ComFuc.hasWeaponNoTime == 0 then
    return true
  end
  MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1191"))
  return false
end

function UpdateInRoomButtonState(self_character_info)
  local state = ptr_cast(game.CurrentState)
  local room_info = state:GetSelfRoomInfo()
  if room_info.RoomState == 2 then
    if self_character_info.ready and not self_character_info.host then
    else
      ui.b_start_lbl.Text = GetUTF8Text("button_common_Join")
      ui.b_start_lbl.Icon = SkinF.icon_playgame_007
      ComFuc.isReadyStart = false
      
      function ui.b_start.EventClick(sender, e)
        if CheckEquipment() then
          MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_136"))
          state:EnterGame()
        end
      end
    end
  elseif self_character_info.host then
    ui.b_start_lbl.Text = GetUTF8Text("UI_common_Start_Game")
    ui.b_start_lbl.Icon = SkinF.icon_playgame_007
    ComFuc.isReadyStart = false
    
    function ui.b_start.EventClick(sender, e)
      if CheckEquipment() then
        MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_136"))
        state:StartGame()
      end
    end
  elseif self_character_info.ready then
    ui.b_start_lbl.Text = GetUTF8Text("button_common_Cancel_Ready")
    ui.b_start_lbl.Icon = SkinF.icon_playgame_008
    ComFuc.isReadyStart = true
    
    function ui.b_start.EventClick(sender, e)
      MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_137"))
      state:Ready(false)
    end
  else
    ui.b_start_lbl.Text = GetUTF8Text("button_battlefield_additional_string_138")
    ui.b_start_lbl.Icon = SkinF.icon_playgame_009
    ComFuc.isReadyStart = false
    
    function ui.b_start.EventClick(sender, e)
      if CheckEquipment() then
        MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_139"))
        state:Ready(true)
      end
    end
  end
  if self_character_info.host then
    ui.b_invite.Enable = true
    ui.b_host_set.Enable = true
  else
    ui.b_invite.Enable = false
    ui.b_host_set.Enable = false
  end
end

function UpdateRoomSlotItem(item, room_slot)
  local client_info = room_slot.client
  if client_info then
    item:SetText(0, "")
    item:SetIcon(0, IconsF.PlayerCareerIcons[client_info.career + 1])
    item:SetText(1, string.format("LV %d %s", client_info.level, client_info.character_name))
    if client_info.host then
      item:SetIcon(2, IconsF.PlayerStatusIcons.HostN)
      item:SetHoverIcon(2, IconsF.PlayerStatusIcons.HostA)
    elseif client_info.in_game then
      item:SetIcon(2, IconsF.PlayerStatusIcons.PlayingN)
      item:SetHoverIcon(2, IconsF.PlayerStatusIcons.PlayingA)
    elseif client_info.ready then
      item:SetIcon(2, IconsF.PlayerStatusIcons.ReadyN)
      item:SetHoverIcon(2, IconsF.PlayerStatusIcons.ReadyA)
    else
      item:SetIcon(2, nil)
      item:SetHoverIcon(2, nil)
    end
    item.Tag = client_info
  else
    item:SetText(0, "")
    item:SetIcon(0, nil)
    item:SetHoverIcon(0, nil)
    item:SetText(1, "")
    item:SetIcon(2, nil)
    item:SetHoverIcon(2, nil)
    item.Tag = nil
  end
end

function UpdateRoomInfoItem(item, room_info)
  for i = 0, 6 do
    item:SetTextColor(i, ARGB(255, 81, 59, 45))
    item:SetHighLightTextColor(i, ARGB(255, 81, 59, 45))
  end
  if room_info.UsePassword then
    item:SetIcon(1, IconsF.RoomStatusIcons.PasswordN)
  elseif room_info.MaxClientNum <= room_info.CurrentClientNum then
    item:SetIcon(1, IconsF.RoomStatusIcons.FullN)
  elseif room_info.RoomState == 1 then
    item:SetIcon(1, IconsF.RoomStatusIcons.WaitingN)
  elseif room_info.RoomState == 2 then
    item:SetIcon(1, IconsF.RoomStatusIcons.PlayingN)
  end
  item:SetText(2, room_info.RoomName)
  item:SetText(3, room_info.HostName)
  item:SetText(4, CreateRoom.map_show_name_of_map_id[room_info.LevelId])
  item:SetIcon(5, IconsF.GameTypeIcons[room_info.GameType])
  item:SetText(6, string.format("%d/%d", room_info.CurrentClientNum, room_info.MaxClientNum))
  item.Tag = room_info
end

function format_room_uid(uid)
  return string.format("%c%d", 64 + bit.bshift(uid, -16), bit.band(uid, 65535))
end

local selected_uid

function RefreshRoomList(game_type)
  ui.btn_mode_all.PushDown = false
  ui.btn_mode_occupy.PushDown = false
  ui.btn_mode_teamdead.PushDown = false
  ui.btn_mode_treasure.PushDown = false
  ui.btn_mode_contention.PushDown = false
  if game_type == "kTeamDead" then
    ui.btn_mode_teamdead.PushDown = true
  elseif game_type == "kContention" then
    ui.btn_mode_contention.PushDown = true
  elseif game_type == "kOccupy" then
    ui.btn_mode_occupy.PushDown = true
  elseif game_type == "kSnatch" then
    ui.btn_mode_treasure.PushDown = true
  elseif game_type == "kNovice" then
  else
    ui.btn_mode_all.PushDown = true
  end
  local state = ptr_cast(game.CurrentState)
  if state then
    local list = ui.list
    local root = list.RootItem
    if list.SelectedItem then
      local room_info = ptr_cast(list.SelectedItem.Tag)
      if room_info then
        selected_uid = room_info.RoomUid
      end
    end
    list:DeleteAll()
    for i = 0, state:GetRoomCount() - 1 do
      local room_info = state:GetRoomInfo(i)
      if (game_type == "kNone" or game_type == room_info.GameType) and room_info.LevelId ~= 16 then
        local item = list:AddItem(root, format_room_uid(room_info.RoomUid))
        UpdateRoomInfoItem(item, room_info)
        if selected_uid and selected_uid == room_info.RoomUid then
          list.SelectedItem = item
        end
      end
    end
    list:Ready()
  end
end

function EnterRoom(item)
  assert(item)
  local state = ptr_cast(game.CurrentState)
  local room_info = ptr_cast(item.Tag)
  if room_info then
    if room_info.UsePassword then
      InputBox.Show(GetUTF8Text("UI_common_Enter_room_password"), GetUTF8Text("UI_common_Enter_room_password"), function(room_password)
        MessageBox.ShowWaiter(GetUTF8Text("msgbox_common_num_1295"))
        state:EnterRoom(room_info.RoomUid, room_password)
      end)
    else
      MessageBox.ShowWaiter(GetUTF8Text("msgbox_common_num_1295"))
      state:EnterRoom(room_info.RoomUid, "")
    end
  end
end

novice_state_spec = false

function InitStateCallBack()
  local state = ptr_cast(game.CurrentState)
  if state then
    function state.EventRoomListChanged()
      if ui.btn_mode_occupy.PushDown then
        RefreshRoomList("kOccupy")
      elseif ui.btn_mode_teamdead.PushDown then
        RefreshRoomList("kTeamDead")
      elseif ui.btn_mode_treasure.PushDown then
        RefreshRoomList("kSnatch")
      elseif ui.btn_mode_contention.PushDown then
        RefreshRoomList("kContention")
      else
        RefreshRoomList("kNone")
      end
    end
    
    function state.EventEnterChannel(sender, e)
      print(" %% state.EventEnterChannel: " .. e.Ret)
      if e.Ret ~= 0 then
        MessageBox.CloseWaiter()
        MessageBox.ShowError(GetUTF8Text("UI_mission_Quest_Desc_3008"), show_error_time)
      elseif LobbyBattleGame.ui.main.Parent then
        LobbyBattleGame.OnEnterChannel(sender, e)
      end
    end
    
    function state.EventLeaveChannel(sender, e)
      print(" %% state.EventLeaveChannel")
      if ComFuc.isInRoom then
        SwitchRoomListPanel()
        ComFuc.isReadyStart = false
      elseif LobbyBattleGame.ui.main.Parent then
        LobbyBattleGame.OnLeaveChannel(sender, e)
      end
    end
    
    function state.EventEnterRoomSuccess()
      print(" %% state.EventEnterRoomSuccess")
      MessageBox.CloseWaiter()
      local room_info = state:GetSelfRoomInfo()
      CreateRoom.print_room_info(room_info)
      if novice_state_spec then
        novice_state_spec = false
        MessageBox.ShowWaiter(GetUTF8Text("msgbox_battlefield_additional_string_140"))
        state:StartGame()
      else
        SwitchInRoomPanel()
      end
    end
    
    function state.EventEnterRoomFailed(sender, e)
      print(" %% state.EventEnterRoomFailed: " .. e.Ret)
      MessageBox.CloseWaiter()
      MessageBox.ShowError(Text.ErrorText[e.Ret], show_error_time)
      if LobbyBattleGame.ui.main.Parent then
        LobbyBattleGame.OnEnterRoomFailed(sender, e)
      end
    end
    
    function state.EventRoomOptionChanged()
      print(" %% state.EventRoomOptionChanged")
      MessageBox.CloseWaiter()
      local room_info = state:GetSelfRoomInfo()
      ui.tb_room_name_title.Text = room_info.RoomName
      UpdateRoomInfoPanel(room_info)
    end
    
    function state.EventRoomOptionChangedFailed(sender, e)
      print(" %% state.EventRoomOptionChangedFailed: " .. e.Ret)
      MessageBox.CloseWaiter()
      MessageBox.ShowError(Text.ErrorText[e.Ret], show_error_time)
    end
    
    function state.EventRoomClientListChanged()
      print(" %% state.EventRoomClientListChanged")
      local room_info = state:GetSelfRoomInfo()
      ui.tb_room_name_title.Text = room_info.RoomName
      UpdateRoomInfoPanel(room_info)
      local left_num = 0
      local right_num = 0
      for i = 1, 16 do
        local slot = state:GetSlot(i)
        UpdateRoomSlotItem(slot_item[i], slot)
        local client_info = slot.client
        if client_info then
          local my_id = state:GetCharacterId()
          if client_info.character_id == my_id then
            UpdateInRoomButtonState(client_info)
            if i <= 8 then
              my_location = 1
            else
              my_location = 2
            end
          end
          if i <= 8 then
            left_num = left_num + 1
          else
            right_num = right_num + 1
          end
        end
        slot_item[i].CanSelect = true
      end
      for i = math.floor(room_info.MaxClientNum / 2 + 1), 8 do
        slot_item[i].CanSelect = false
        slot_item[i + 8].CanSelect = false
      end
      ui.lbl_left.Text = left_num
      ui.lbl_right.Text = right_num
    end
    
    function state.EventGameBegin(sender, e)
      print(" %% state.EventGameBegin: " .. e.Ret)
      if LobbyBattleGame.ui.main.Parent then
        LobbyBattleGame.OnGameBegin(sender, e)
      elseif e.Ret == 0 then
        MessageBox.CloseWaiter()
      else
        MessageBox.CloseWaiter()
        MessageBox.ShowError(Text.ErrorText[e.Ret], show_error_time)
      end
    end
    
    function state.EventGameReady(sender, e)
      print(" %% state.EventGameReady: " .. e.Ret)
      if e.Ret == 0 then
        MessageBox.CloseWaiter()
      else
        MessageBox.CloseWaiter()
        MessageBox.ShowError(Text.ErrorText[e.Ret], show_error_time)
      end
    end
    
    function state.EventLeaveRoom(sender, e)
      print(" %% state.EventLeaveRoom: " .. e.Ret)
      if e.Ret == 0 then
        if LobbyBattleGame.ui.main.Parent then
          LobbyBattleGame.OnLeaveRoom(sender, e)
        else
          SwitchRoomListPanel()
          ComFuc.isReadyStart = false
        end
      else
        MessageBox.ShowError(Text.ErrorText[e.Ret], show_error_time)
      end
    end
    
    function state.EventRoomKickClient(sender, e)
      print(" %% state.EventRoomKickClient: " .. e.Ret)
      if e.Ret == 0 then
        MessageBox.CloseWaiter()
      else
        MessageBox.CloseWaiter()
        MessageBox.ShowError(Text.ErrorText[e.Ret], show_error_time)
      end
    end
    
    function state.EventKickedInRoom()
      print(" %% state.EventKickedInRoom")
      MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1204"))
    end
    
    function state.EventResponseRoomInvite(sender, e)
      print(" %% state.EventResponseRoomInvite: " .. e.Ret)
    end
    
    function state.EventRoomInvite(sender, e)
      print(" %% state.EventRoomInvite")
      local RoomUid = e.uid
      local token = e.index
      if not ComFuc.isInRoom and not ComFuc.isReadyStart and not ComFuc.isReadyMatch then
        MessageBox.ShowWithConfirmCancel(string.format(GetUTF8Text("msgbox_common_num_1197"), e.name, format_room_uid(e.uid)), function(sender, e)
          local state = ptr_cast(game.CurrentState)
          if state then
            if not LobbyStartGame.ui.main.Parent and Lobby then
              Lobby.MainBtnSelect(2)
            end
            LobbyStartGame.SelectMainBtn(2)
            MessageBox.ShowWaiter(GetUTF8Text("msgbox_common_num_1295"))
            state:EnterRoom(RoomUid, "", token)
          end
        end)
      end
    end
  end
end

local CanSwitch, HideAllPanel = function()
  return true, GetUTF8Text("msgbox_common_num_1398")
end, function()
  return true, GetUTF8Text("msgbox_common_num_1398")
end

function HideAllPanel()
  ui.mode_select_panel.Visible = false
  ui.advance_panel.Visible = false
  ui.room_list_panel.Visible = false
  ui.room_info_panel.Visible = false
  ui.in_room_panel.Visible = false
end

function SwitchRoomListPanel()
  HideAllPanel()
  ui.mode_select_panel.Visible = true
  ui.advance_panel.Visible = true
  ui.room_list_panel.Visible = true
  if m_inviteUI then
    LobbyBoxContern.CloseInvite()
    m_inviteUI = nil
  end
  ComFuc.isInRoom = false
end

function SwitchInRoomPanel()
  HideAllPanel()
  ui.room_info_panel.Visible = true
  ui.in_room_panel.Visible = true
  ComFuc.isInRoom = true
end

function RequestRoomList()
  local state = ptr_cast(game.CurrentState)
  state:RequestRoomList()
end

function CreateNoviceRoom()
  local room_info_desc = ptr_new("Client.RoomInfoDesc")
  room_info_desc.room_name = "aaa"
  room_info_desc.use_password = false
  room_info_desc.password = ""
  room_info_desc.level_id = 16
  room_info_desc.max_client_num = 16
  room_info_desc.spawn_time = 3
  room_info_desc.join_halfway = false
  room_info_desc.check_balance = false
  local state = ptr_cast(game.CurrentState)
  state:CreateRoom(room_info_desc)
  MessageBox.ShowWaiter(GetUTF8Text("msgbox_common_num_1295"))
  novice_state_spec = true
end

function Show(winRoot)
  ui.root.Parent = winRoot
end

function Hide()
  ui.root.Parent = nil
end
