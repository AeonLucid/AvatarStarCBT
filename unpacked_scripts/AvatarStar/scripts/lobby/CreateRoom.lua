module("CreateRoom", package.seeall)
ui = Gui.Create()({
  Gui.Control("root")({
    Location = Vector2(0, 0),
    Size = Vector2(730, 566),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.skin_playgame_030,
    Gui.Label({
      Location = Vector2(16, 7),
      Size = Vector2(100, 18),
      Text = GetUTF8Text("button_common_Create_Room"),
      TextColor = ARGB(255, 255, 255, 255),
      FontSize = 16
    }),
    Gui.Control({
      Location = Vector2(0, 48),
      Size = Vector2(730, 30),
      BackgroundColor = ARGB(0, 255, 0, 0),
      Gui.Label({
        Location = Vector2(21, 5),
        Size = Vector2(69, 21),
        Text = GetUTF8Text("UI_battlefield_Room_Name"),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.Textbox("tb_room_name")({
        Location = Vector2(100, 0),
        Size = Vector2(306, 30),
        Text = "",
        FontSize = 16,
        MaxLength = 18
      }),
      Gui.Label({
        Location = Vector2(500, 5),
        Size = Vector2(70, 21),
        Text = GetUTF8Text("UI_battlefield_Password"),
        BackgroundColor = ARGB(0, 0, 255, 0),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.Textbox("tb_password")({
        Location = Vector2(580, 0),
        Size = Vector2(134, 30),
        Text = "",
        FontSize = 16,
        MaxLength = 6
      })
    }),
    Gui.Control({
      Location = Vector2(0, 88),
      Size = Vector2(730, 30),
      BackgroundColor = ARGB(0, 255, 255, 255),
      Gui.Label({
        Location = Vector2(21, 5),
        Size = Vector2(69, 21),
        Text = GetUTF8Text("UI_battlefield_Size"),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.ComboBox("cb_client_count")({
        Location = Vector2(100, 0),
        Size = Vector2(198, 30)
      }),
      Gui.Label("lbl_break_join")({
        Location = Vector2(262, 5),
        Size = Vector2(69, 21),
        Text = GetUTF8Text("UI_battlefield_Join_Midway"),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.CheckBox("cx_break_join")({
        Location = Vector2(340, 3),
        Size = Vector2(24, 24)
      }),
      Gui.Label({
        Location = Vector2(500, 5),
        Size = Vector2(190, 21),
        Text = GetUTF8Text("UI_battlefield_Auto_Balance"),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.CheckBox("cx_balance")({
        Location = Vector2(690, 3),
        Size = Vector2(24, 24)
      })
    }),
    Gui.Control({
      Location = Vector2(0, 128),
      Size = Vector2(730, 92),
      BackgroundColor = ARGB(0, 255, 0, 0),
      Gui.Label({
        Location = Vector2(21, 5),
        Size = Vector2(69, 21),
        Text = GetUTF8Text("UI_battlefield_Mode_Selection"),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.Control({
        Location = Vector2(100, 0),
        Size = Vector2(614, 92),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.skin_playgame_033,
        Gui.ComboBox("cb_game_type")({
          Location = Vector2(370, 5),
          Size = Vector2(114, 45),
          Visible = false
        }),
        Gui.Button("btn_mode_teamdead")({
          Size = Vector2(74, 74),
          Location = Vector2(18, 9),
          Skin = SkinF.battle_004[3],
          CanMove = true,
          EventClick = function(sender, e)
            ui.cb_game_type.SelectedIndex = game_type_index("kTeamDead") - 1
          end
        }),
        Gui.Button("btn_mode_contention")({
          Size = Vector2(74, 74),
          Location = Vector2(106, 9),
          Skin = SkinF.battle_004[5],
          CanMove = true,
          EventClick = function(sender, e)
            ui.cb_game_type.SelectedIndex = game_type_index("kContention") - 1
          end
        }),
        Gui.Button("btn_mode_occupy")({
          Size = Vector2(74, 74),
          Location = Vector2(194, 9),
          Skin = SkinF.battle_004[2],
          CanMove = true,
          EventClick = function(sender, e)
            ui.cb_game_type.SelectedIndex = game_type_index("kOccupy") - 1
          end
        }),
        Gui.Button("btn_mode_treasure")({
          Size = Vector2(74, 74),
          Location = Vector2(282, 9),
          Skin = SkinF.battle_004[4],
          CanMove = true,
          EventClick = function(sender, e)
            ui.cb_game_type.SelectedIndex = game_type_index("kSnatch") - 1
          end
        })
      })
    }),
    Gui.Control({
      Location = Vector2(0, 230),
      Size = Vector2(730, 280),
      BackgroundColor = ARGB(0, 255, 255, 255),
      Gui.Label({
        Location = Vector2(21, 5),
        Size = Vector2(69, 21),
        Text = GetUTF8Text("UI_battlefield_Map_Selection"),
        TextColor = ARGB(255, 81, 59, 45),
        FontSize = 16
      }),
      Gui.Control({
        Location = Vector2(100, 0),
        Size = Vector2(614, 280),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.skin_playgame_033,
        Gui.ImageBrowser("ib_map")({
          Location = Vector2(18, 10),
          Size = Vector2(578, 222),
          DisplayRowAndCol = Vector2(2, 3),
          PictureStyle = "Gui.PictureMapInBrowser",
          Margin = Vector4(0, 0, 0, 0)
        }),
        Gui.NewPagesBar("page_bar")({
          Location = Vector2(177, 238),
          Size = Vector2(260, 36),
          PageCount = 5
        })
      }),
      Gui.ComboBox("cb_spawn_time")({
        Location = Vector2(659, 230),
        Size = Vector2(131, 34),
        Visible = false
      })
    }),
    Gui.Button("btn_confirm")({
      Location = Vector2(540, 516),
      Size = Vector2(84, 40),
      Text = GetUTF8Text("button_common_OK"),
      CanMove = true
    }),
    Gui.Button("btn_close")({
      Location = Vector2(630, 516),
      Size = Vector2(84, 40),
      Text = GetUTF8Text("button_common_Cancel"),
      CanMove = true
    })
  })
})
ui.lbl_break_join.Visible = false
ui.cx_break_join.Visible = false
if game.version_close_beta_1 then
  ui.btn_mode_occupy.Visible = false
  ui.btn_mode_treasure.Visible = false
  ui.btn_mode_contention.Location = ui.btn_mode_occupy.Location
end
if game.version_close_beta_2 then
  ui.btn_mode_treasure.Visible = false
end
if game.version_close_beta_3 then
  ui.btn_mode_treasure.Visible = false
end
game_type_key = {
  "kTeamDead",
  "kContention",
  "kOccupy",
  "kSnatch",
  "kNovice"
}
local game_type_index, game_type = function(key)
  for k, v in ipairs(game_type_key) do
    if v == key then
      return k
    end
  end
end, function(key)
  for k, v in ipairs(game_type_key) do
    if v == key then
      return k
    end
  end
end

function game_type(key)
  return game_type_table[key]
end

function fill_cbx_game_type(cbx)
  cbx:RemoveAll()
  for i = 1, #game_type_key do
    cbx:AddItem(Text.GameMode[game_type_key[i]])
  end
end

local max_player, fill_cbx_max_player = {
  8,
  12,
  16
}, 8
local fill_cbx_max_player, max_player_index = function(cbx)
  cbx:RemoveAll()
  for i = 1, #max_player do
    cbx:AddItem(string.format(GetUTF8Text("button_common_num_people"), max_player[i]))
  end
end, 12

function max_player_index(v)
  for k, vv in ipairs(max_player) do
    if vv == v then
      return k
    end
  end
end

local rebirth_time, fill_cbx_rebirth_time = {
  3,
  5,
  10
}, 3
local fill_cbx_rebirth_time, rebirth_time_index = function(cbx)
  cbx:RemoveAll()
  for i = 1, #rebirth_time do
    cbx:AddItem(rebirth_time[i] .. GetUTF8Text("tips_abilities_Sec"))
  end
end, 5
local rebirth_time_index, what_map_select = function(v)
  for k, vv in ipairs(rebirth_time) do
    if vv == v then
      return k
    end
  end
  return 1
end, 10
local what_map_select, setup_ui_map_picture = function(pic, gtk)
  if pic.Text == what_map_name_select then
    pic.Highlighted = true
  else
    pic.Highlighted = false
  end
end, Gui.Control("root")({
  Location = Vector2(0, 0),
  Size = Vector2(730, 566),
  BackgroundColor = ARGB(255, 255, 255, 255),
  Skin = SkinF.skin_playgame_030,
  Gui.Label({
    Location = Vector2(16, 7),
    Size = Vector2(100, 18),
    Text = GetUTF8Text("button_common_Create_Room"),
    TextColor = ARGB(255, 255, 255, 255),
    FontSize = 16
  }),
  Gui.Control({
    Location = Vector2(0, 48),
    Size = Vector2(730, 30),
    BackgroundColor = ARGB(0, 255, 0, 0),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Room_Name"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Textbox("tb_room_name")({
      Location = Vector2(100, 0),
      Size = Vector2(306, 30),
      Text = "",
      FontSize = 16,
      MaxLength = 18
    }),
    Gui.Label({
      Location = Vector2(500, 5),
      Size = Vector2(70, 21),
      Text = GetUTF8Text("UI_battlefield_Password"),
      BackgroundColor = ARGB(0, 0, 255, 0),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Textbox("tb_password")({
      Location = Vector2(580, 0),
      Size = Vector2(134, 30),
      Text = "",
      FontSize = 16,
      MaxLength = 6
    })
  }),
  Gui.Control({
    Location = Vector2(0, 88),
    Size = Vector2(730, 30),
    BackgroundColor = ARGB(0, 255, 255, 255),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Size"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.ComboBox("cb_client_count")({
      Location = Vector2(100, 0),
      Size = Vector2(198, 30)
    }),
    Gui.Label("lbl_break_join")({
      Location = Vector2(262, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Join_Midway"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.CheckBox("cx_break_join")({
      Location = Vector2(340, 3),
      Size = Vector2(24, 24)
    }),
    Gui.Label({
      Location = Vector2(500, 5),
      Size = Vector2(190, 21),
      Text = GetUTF8Text("UI_battlefield_Auto_Balance"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.CheckBox("cx_balance")({
      Location = Vector2(690, 3),
      Size = Vector2(24, 24)
    })
  }),
  Gui.Control({
    Location = Vector2(0, 128),
    Size = Vector2(730, 92),
    BackgroundColor = ARGB(0, 255, 0, 0),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Mode_Selection"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Control({
      Location = Vector2(100, 0),
      Size = Vector2(614, 92),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.skin_playgame_033,
      Gui.ComboBox("cb_game_type")({
        Location = Vector2(370, 5),
        Size = Vector2(114, 45),
        Visible = false
      }),
      Gui.Button("btn_mode_teamdead")({
        Size = Vector2(74, 74),
        Location = Vector2(18, 9),
        Skin = SkinF.battle_004[3],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kTeamDead") - 1
        end
      }),
      Gui.Button("btn_mode_contention")({
        Size = Vector2(74, 74),
        Location = Vector2(106, 9),
        Skin = SkinF.battle_004[5],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kContention") - 1
        end
      }),
      Gui.Button("btn_mode_occupy")({
        Size = Vector2(74, 74),
        Location = Vector2(194, 9),
        Skin = SkinF.battle_004[2],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kOccupy") - 1
        end
      }),
      Gui.Button("btn_mode_treasure")({
        Size = Vector2(74, 74),
        Location = Vector2(282, 9),
        Skin = SkinF.battle_004[4],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kSnatch") - 1
        end
      })
    })
  }),
  Gui.Control({
    Location = Vector2(0, 230),
    Size = Vector2(730, 280),
    BackgroundColor = ARGB(0, 255, 255, 255),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Map_Selection"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Control({
      Location = Vector2(100, 0),
      Size = Vector2(614, 280),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.skin_playgame_033,
      Gui.ImageBrowser("ib_map")({
        Location = Vector2(18, 10),
        Size = Vector2(578, 222),
        DisplayRowAndCol = Vector2(2, 3),
        PictureStyle = "Gui.PictureMapInBrowser",
        Margin = Vector4(0, 0, 0, 0)
      }),
      Gui.NewPagesBar("page_bar")({
        Location = Vector2(177, 238),
        Size = Vector2(260, 36),
        PageCount = 5
      })
    }),
    Gui.ComboBox("cb_spawn_time")({
      Location = Vector2(659, 230),
      Size = Vector2(131, 34),
      Visible = false
    })
  }),
  Gui.Button("btn_confirm")({
    Location = Vector2(540, 516),
    Size = Vector2(84, 40),
    Text = GetUTF8Text("button_common_OK"),
    CanMove = true
  }),
  Gui.Button("btn_close")({
    Location = Vector2(630, 516),
    Size = Vector2(84, 40),
    Text = GetUTF8Text("button_common_Cancel"),
    CanMove = true
  })
})
local setup_ui_map_picture, setup_ui_map_browser = function(ib, row, col, map_key)
  local pic = ib:GetDisplayPicture(row, col)
  pic.Text = map_key
  pic.ForeGroundImage = Icons.PreviewMaps[string.lower(pic.Text)]
  if string.len(pic.Text) ~= 0 then
    pic.BeStatic = false
  else
    pic.BeStatic = true
  end
  
  function pic.EventClick(sender, e)
    what_map_name_select = pic.Text
    ib:AllPictureHL(false)
    pic.Highlighted = true
  end
end, Gui.Control("root")({
  Location = Vector2(0, 0),
  Size = Vector2(730, 566),
  BackgroundColor = ARGB(255, 255, 255, 255),
  Skin = SkinF.skin_playgame_030,
  Gui.Label({
    Location = Vector2(16, 7),
    Size = Vector2(100, 18),
    Text = GetUTF8Text("button_common_Create_Room"),
    TextColor = ARGB(255, 255, 255, 255),
    FontSize = 16
  }),
  Gui.Control({
    Location = Vector2(0, 48),
    Size = Vector2(730, 30),
    BackgroundColor = ARGB(0, 255, 0, 0),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Room_Name"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Textbox("tb_room_name")({
      Location = Vector2(100, 0),
      Size = Vector2(306, 30),
      Text = "",
      FontSize = 16,
      MaxLength = 18
    }),
    Gui.Label({
      Location = Vector2(500, 5),
      Size = Vector2(70, 21),
      Text = GetUTF8Text("UI_battlefield_Password"),
      BackgroundColor = ARGB(0, 0, 255, 0),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Textbox("tb_password")({
      Location = Vector2(580, 0),
      Size = Vector2(134, 30),
      Text = "",
      FontSize = 16,
      MaxLength = 6
    })
  }),
  Gui.Control({
    Location = Vector2(0, 88),
    Size = Vector2(730, 30),
    BackgroundColor = ARGB(0, 255, 255, 255),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Size"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.ComboBox("cb_client_count")({
      Location = Vector2(100, 0),
      Size = Vector2(198, 30)
    }),
    Gui.Label("lbl_break_join")({
      Location = Vector2(262, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Join_Midway"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.CheckBox("cx_break_join")({
      Location = Vector2(340, 3),
      Size = Vector2(24, 24)
    }),
    Gui.Label({
      Location = Vector2(500, 5),
      Size = Vector2(190, 21),
      Text = GetUTF8Text("UI_battlefield_Auto_Balance"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.CheckBox("cx_balance")({
      Location = Vector2(690, 3),
      Size = Vector2(24, 24)
    })
  }),
  Gui.Control({
    Location = Vector2(0, 128),
    Size = Vector2(730, 92),
    BackgroundColor = ARGB(0, 255, 0, 0),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Mode_Selection"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Control({
      Location = Vector2(100, 0),
      Size = Vector2(614, 92),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.skin_playgame_033,
      Gui.ComboBox("cb_game_type")({
        Location = Vector2(370, 5),
        Size = Vector2(114, 45),
        Visible = false
      }),
      Gui.Button("btn_mode_teamdead")({
        Size = Vector2(74, 74),
        Location = Vector2(18, 9),
        Skin = SkinF.battle_004[3],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kTeamDead") - 1
        end
      }),
      Gui.Button("btn_mode_contention")({
        Size = Vector2(74, 74),
        Location = Vector2(106, 9),
        Skin = SkinF.battle_004[5],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kContention") - 1
        end
      }),
      Gui.Button("btn_mode_occupy")({
        Size = Vector2(74, 74),
        Location = Vector2(194, 9),
        Skin = SkinF.battle_004[2],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kOccupy") - 1
        end
      }),
      Gui.Button("btn_mode_treasure")({
        Size = Vector2(74, 74),
        Location = Vector2(282, 9),
        Skin = SkinF.battle_004[4],
        CanMove = true,
        EventClick = function(sender, e)
          ui.cb_game_type.SelectedIndex = game_type_index("kSnatch") - 1
        end
      })
    })
  }),
  Gui.Control({
    Location = Vector2(0, 230),
    Size = Vector2(730, 280),
    BackgroundColor = ARGB(0, 255, 255, 255),
    Gui.Label({
      Location = Vector2(21, 5),
      Size = Vector2(69, 21),
      Text = GetUTF8Text("UI_battlefield_Map_Selection"),
      TextColor = ARGB(255, 81, 59, 45),
      FontSize = 16
    }),
    Gui.Control({
      Location = Vector2(100, 0),
      Size = Vector2(614, 280),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.skin_playgame_033,
      Gui.ImageBrowser("ib_map")({
        Location = Vector2(18, 10),
        Size = Vector2(578, 222),
        DisplayRowAndCol = Vector2(2, 3),
        PictureStyle = "Gui.PictureMapInBrowser",
        Margin = Vector4(0, 0, 0, 0)
      }),
      Gui.NewPagesBar("page_bar")({
        Location = Vector2(177, 238),
        Size = Vector2(260, 36),
        PageCount = 5
      })
    }),
    Gui.ComboBox("cb_spawn_time")({
      Location = Vector2(659, 230),
      Size = Vector2(131, 34),
      Visible = false
    })
  }),
  Gui.Button("btn_confirm")({
    Location = Vector2(540, 516),
    Size = Vector2(84, 40),
    Text = GetUTF8Text("button_common_OK"),
    CanMove = true
  }),
  Gui.Button("btn_close")({
    Location = Vector2(630, 516),
    Size = Vector2(84, 40),
    Text = GetUTF8Text("button_common_Cancel"),
    CanMove = true
  })
})

function setup_ui_map_browser(ib, game_type)
  local ib_display_pic_count = ib.DisplayRowAndCol.x * ib.DisplayRowAndCol.y
  
  function OnPageChanged(newPage)
    local start_map_key_index = ib_display_pic_count * (newPage - 1)
    for row = 1, ib.DisplayRowAndCol.x do
      for col = 1, ib.DisplayRowAndCol.y do
        setup_ui_map_picture(ib, row, col, map_keys_of_game_type[game_type][start_map_key_index + (row - 1) * ib.DisplayRowAndCol.y + col])
        what_map_select(ib:GetDisplayPicture(row, col), game_type)
      end
    end
  end
  
  function ui.page_bar.EventIndexChanged(sender, e)
    if sender.CurrIndex >= 1 and sender.CurrIndex <= sender.PageCount then
      OnPageChanged(sender.CurrIndex)
    end
  end
  
  local pagenum = 1
  for i = 1, #map_keys_of_game_type[game_type] do
    if what_map_name_select == map_keys_of_game_type[game_type][i] then
      pagenum = math.floor((i - 1) / ib_display_pic_count) + 1
      break
    end
  end
  ui.page_bar.PageCount = math.ceil(#map_keys_of_game_type[game_type] / ib_display_pic_count)
  ui.page_bar.CurrIndex = pagenum
  OnPageChanged(pagenum)
  ib.LeftBtn.Visible = false
  ib.RightBtn.Visible = false
end

level_count = 0
map_id_of_key = {}
map_show_name_of_key = {}
map_desc_of_key = {}
map_keys_of_game_type = {}
game_type_of_map_id = {}
map_show_name_of_map_id = {}
map_key_of_map_id = {}

function print_level_info(level_info)
  print("level info.id:", level_info.id)
  print("level info.name:", level_info.name)
  print("level info.game_type:", level_info.game_type)
  print("level info.show_name:", level_info.show_name)
  print("level info.description:", level_info.description)
end

function print_room_info_desc(room_info_desc)
  print("room_info_desc.room_name:", room_info_desc.room_name)
  print("room_info_desc.use_password:", room_info_desc.use_password)
  print("room_info_desc.password:", room_info_desc.password)
  print("room_info_desc.level_id:", room_info_desc.level_id)
  print("room_info_desc.max_client_num:", room_info_desc.max_client_num)
  print("room_info_desc.spawn_time:", room_info_desc.spawn_time)
  print("room_info_desc.join_halfway:", room_info_desc.join_halfway)
  print("room_info_desc.check_balance:", room_info_desc.check_balance)
end

function print_room_info(room_info)
  print("        room_info.RoomUid", room_info.RoomUid)
  print("        room_info.RoomState", room_info.RoomState)
  print("        room_info.MapName", map_show_name_of_map_id[room_info.LevelId])
  print("        room_info.HostName", room_info.HostName)
  print("        room_info.UsePassword", room_info.UsePassword)
  print("        room_info.LevelId", room_info.LevelId .. "[" .. map_key_of_map_id[room_info.LevelId] .. "]")
  print("        room_info.HostId", room_info.HostId)
  print("        room_info.GameType", room_info.GameType)
  print("        room_info.SpawnTime", room_info.SpawnTime)
  print("        room_info.JoinHalfWay", room_info.JoinHalfWay)
  print("        room_info.CheckBalance", room_info.CheckBalance)
  print("        room_info.Matching", room_info.Matching)
  print("        room_info.Password", room_info.Password)
  print("        room_info.MaxClientNum", room_info.MaxClientNum)
  print("        room_info.CurrentClientNum", room_info.CurrentClientNum)
end

function print_client_info(client_info)
  print("client_info, character_id", client_info.character_id)
  print("client_info, character_name", client_info.character_name)
  print("client_info, character_guild", client_info.character_guild)
  print("client_info, career", client_info.career)
  print("client_info, ready", client_info.ready)
  print("client_info, host", client_info.host)
  print("client_info, level", client_info.level)
end

local find_map_key_from_id, RandomMapKey = function(id)
  for k, v in pairs(map_id_of_key) do
    if v == id then
      return k
    end
  end
end, function(id)
  for k, v in pairs(map_id_of_key) do
    if v == id then
      return k
    end
  end
end

function RandomMapKey(gtk)
  local map_key = map_keys_of_game_type and map_keys_of_game_type[gtk] or nil
  print(gtk, map_keys_of_game_type, map_key)
  if map_key then
    local i = math.random(2, #map_key)
    print("which:", i, map_key[i])
    return map_key[i]
  end
  return ""
end

function UpdateLevelList()
  local state = ptr_cast(game.CurrentState)
  level_count = state:GetLevelCount()
  map_id_of_key = {}
  map_show_name_of_key = {}
  map_desc_of_key = {}
  map_keys_of_game_type = {}
  game_type_of_map_id = {}
  map_show_name_of_map_id = {}
  map_key_of_map_id = {}
  map_id_of_key.level_random = "0"
  map_show_name_of_key.level_random = GetUTF8Text("UI_common_Random_Map")
  map_desc_of_key.level_random = ""
  map_show_name_of_map_id["0"] = GetUTF8Text("UI_common_Random_Map")
  map_key_of_map_id["0"] = "level_random"
  for i = 1, level_count do
    local level_info = state:GetLevelInfo(i - 1)
    map_id_of_key[level_info.name] = level_info.id
    map_show_name_of_key[level_info.name] = level_info.show_name
    map_desc_of_key[level_info.name] = level_info.description
    if not map_keys_of_game_type[level_info.game_type] then
      map_keys_of_game_type[level_info.game_type] = {}
    end
    table.insert(map_keys_of_game_type[level_info.game_type], level_info.name)
    game_type_of_map_id[level_info.id] = level_info.game_type
    map_show_name_of_map_id[level_info.id] = GetUTF8Text(level_info.show_name)
    map_key_of_map_id[level_info.id] = level_info.name
  end
  for _, v in ipairs(game_type_key) do
    if map_keys_of_game_type[v] then
      table.sort(map_keys_of_game_type[v], function(lhs, rhs)
        return tonumber(string.match(lhs, "%d+")) < tonumber(string.match(rhs, "%d+"))
      end)
      table.insert(map_keys_of_game_type[v], 1, "level_random")
    else
      map_keys_of_game_type[v] = {}
    end
  end
end

function SetCreateRoomInfo(gtk, room_info_desc)
  ui.btn_mode_teamdead.PushDown = false
  ui.btn_mode_occupy.PushDown = false
  ui.btn_mode_contention.PushDown = false
  ui.btn_mode_treasure.PushDown = false
  if gtk == "kTeamDead" then
    ui.btn_mode_teamdead.PushDown = true
  elseif gtk == "kOccupy" then
    ui.btn_mode_occupy.PushDown = true
  elseif gtk == "kContention" then
    ui.btn_mode_contention.PushDown = true
  elseif gtk == "kSnatch" then
    ui.btn_mode_treasure.PushDown = true
  end
  fill_cbx_max_player(ui.cb_client_count)
  fill_cbx_rebirth_time(ui.cb_spawn_time)
  if game_type_of_map_id[room_info_desc.level_id] == gtk then
    what_map_name_select = find_map_key_from_id(room_info_desc.level_id)
  else
    what_map_name_select = "level_random"
  end
  setup_ui_map_browser(ui.ib_map, gtk)
  ui.cb_client_count.SelectedIndex = max_player_index(room_info_desc.max_client_num) - 1
  ui.cb_spawn_time.SelectedIndex = rebirth_time_index(room_info_desc.spawn_time) - 1
  ui.cx_break_join.Check = room_info_desc.join_halfway
  ui.cx_balance.Check = room_info_desc.check_balance
end

function SetRoomOption(room_info_desc)
  ui.tb_room_name.Text = room_info_desc.room_name
  if room_info_desc.use_password ~= 0 then
    ui.tb_password.Text = room_info_desc.password
  else
    ui.tb_password.Text = ""
  end
  fill_cbx_game_type(ui.cb_game_type)
  
  function ui.cb_game_type.EventValueChanged(sender, e)
    SetCreateRoomInfo(game_type_key[ui.cb_game_type.SelectedIndex + 1], room_info_desc)
  end
  
  local game_type = room_info_desc.game_type
  game_type = game_type or "kTeamDead"
  ui.cb_game_type.Text = Text.GameMode[game_type]
  SetCreateRoomInfo(game_type_key[ui.cb_game_type.SelectedIndex + 1], room_info_desc)
end

function GetRoomOption(return_room_info_desc)
  return_room_info_desc.room_name = ui.tb_room_name.Text
  return_room_info_desc.password = ui.tb_password.Text
  if string.len(ui.tb_password.Text) > 0 then
    return_room_info_desc.use_password = 1
  else
    return_room_info_desc.use_password = 0
  end
  local gtk = game_type_key[ui.cb_game_type.SelectedIndex + 1]
  return_room_info_desc.max_client_num = max_player[ui.cb_client_count.SelectedIndex + 1]
  return_room_info_desc.spawn_time = rebirth_time[ui.cb_spawn_time.SelectedIndex + 1]
  return_room_info_desc.join_halfway = ui.cx_break_join.Check
  return_room_info_desc.check_balance = ui.cx_balance.Check
  if not what_map_name_select or what_map_name_select == "level_random" then
    return_room_info_desc.level_id = map_id_of_key.level_random
    return_room_info_desc.game_type = gtk
  else
    return_room_info_desc.level_id = map_id_of_key[what_map_name_select]
    return_room_info_desc.game_type = game_type_of_map_id[return_room_info_desc.level_id]
  end
end

function ShowModal(ConfirmEvent)
  local mw = ModalWindow.GetNew(1)
  mw.screen.AllowEscToExit = true
  mw.screen.AllowF1 = false
  mw.root.Size = ui.root.Size
  ui.root.Parent = mw.root
  mw.screen.Visible = true
  
  function CloseModal()
    ui.root.Parent = nil
    mw.Close()
  end
  
  function ui.btn_close.EventClick(sender, e)
    CloseModal()
  end
  
  function mw.screen.EventEscPressed(sender, e)
    CloseModal()
  end
  
  if ConfirmEvent then
    function ui.btn_confirm.EventClick(sender, e)
      ConfirmEvent()
      
      CloseModal()
    end
  end
end
