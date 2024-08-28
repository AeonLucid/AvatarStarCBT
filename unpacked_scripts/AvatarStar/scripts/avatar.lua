module("Avatar", package.seeall)
ESCPressed = nil
local skin_dir = "/ui/AvatarUI/ItemIcons/"
local pose_dir = "/ui/skinF/"
local reci = 0.00392156862745
local g_part_name = {
  "skin",
  "eye",
  "mouth",
  "nose",
  "ear",
  "beard",
  "hair",
  "helmet",
  "",
  "outerwear",
  "trousers",
  "glove",
  "shoes",
  "decal",
  "movable",
  "aboveneck",
  "upperbody",
  "lowerbody"
}
local partColorMsg = {
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {},
  {}
}
local partBtnClickedNo = {
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
}
local partBtnClickedPage = {
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1
}
local currentPart = 0
local mainCurrentBtn = 0
local headCurrentBtn = 0
local dressCurrentBtn = 0
local trinketCurrentBtn = 0
local isHeadFirst = true
local isSuitBuy = "Y"
local isPagebarClick = false
local timer
local isShowEditBtn = false
local curCardSlot = 0
local curCardPage = 0
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
coly = ARGB(255, 255, 255, 0)
colt = ARGB(255, 113, 83, 65)
cols = ARGB(255, 62, 26, 1)
local dataList
local partIdList = ""
local tempId = 0
local tempPrice = 0
local tempName = ""
local tempResource = ""
local editId = 0
local editPrice = 0
local editName = ""
local editResource = ""
local singleId = {
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
}
local singlePrice = {
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
}
local singleName = {
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""
}
local singleResource = {
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  ""
}
local layerId = {
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  },
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  },
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
}
local layerPrice = {
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  },
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  },
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
}
local layerName = {
  {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  },
  {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  },
  {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  }
}
local layerResource = {
  {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  },
  {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  },
  {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  }
}
local layerAddOrEdit = {
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  },
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  },
  {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
}
local tempI = 0
local tempJ = 0
local layerCurrent = 0
local editMsg = {}
local selectSkin = {}
local isEdit = false
local isAdd = false
local isClicked = false
local tabpadIndex = {
  0,
  0,
  0
}
local buttonIndex = {
  0,
  0,
  0
}
local dragLayerCurrent = -1
local personCardNo = 0
local personCardPage = 1
local postureList = {}
local postureBegin = 1
local postureCurr = 0
local searhPartId = 0
local searhPositon = 0
local isEidtFirst = true
local tempPart = 0
local cardDt = {}
local selectPersonId = -1
local idsList
local isFinishRpcCall = false
local isAllDelte = "N"
local isNeedShow = true
local insertBuyIndex, ComPersonCB = 2, nil
local ComPersonCB, ContentCB = function(i, lc)
  return Gui.Control({
    Size = Vector2(124, 216),
    Location = lc,
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_131,
    Gui.Control({
      Size = Vector2(104, 163),
      Location = Vector2(10, 4),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_083[1],
      ComFuc.ComControl(nil, Vector2(104, 163), Vector2(0, 0), 255, SkinF.personalInfo_145),
      Gui.Button("person_b_" .. i)({
        Size = Vector2(104, 163),
        CanPushDown = true,
        Visible = false,
        Gui.Control({
          Size = Vector2(104, 163),
          BackgroundColor = colw,
          Skin = SkinF.personalInfo_143,
          ComFuc.ComCharacterStaticCard(nil, i, false, false),
          ComFuc.ComControl("person_c_" .. i, Vector2(104, 163), Vector2(0, 0), 255, SkinF.personalInfo_144)
        })
      })
    }),
    ComFuc.ComButton("person_buy_" .. i, GetUTF8Text("button_common_Buy"), Vector2(54, 41), Vector2(35, 166), 16, false, true, SkinF.personalInfo_200),
    ComFuc.ComButton("person_edi_" .. i, GetUTF8Text("UI_avatar_avatar_UI_01"), Vector2(54, 41), Vector2(64, 166), 16, false, true, SkinF.personalInfo_200)
  })
end, nil
local ContentCB, ContentLyaerBtn = function(i)
  return Gui.Control("avatar_c_" .. i)({
    Size = Vector2(68, 68),
    Location = ComFuc.ComputLocation(i, -64, -27, 5, 72, 72),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_083[1],
    ComFuc.ComNewAvtButton("avatar_b_" .. i, Vector2(70, 70), Vector2(-1, -1), true, false, SkinF.avatar_main_070)
  })
end, nil
local ContentLyaerBtn, ComLayerCont = function(i, j)
  return ComFuc.ComLayerButton("btn_layer_" .. i .. "_" .. j, Vector2(360, 57), Vector2(0, -58 + j * 58), j)
end, nil
local ComLayerCont, ComSmTab = function(i)
  return Gui.Control("layer_cont_" .. i)({
    Size = Vector2(360, 464),
    Location = Vector2(16, 117),
    ContentLyaerBtn(i, 1),
    ContentLyaerBtn(i, 2),
    ContentLyaerBtn(i, 3),
    ContentLyaerBtn(i, 4),
    ContentLyaerBtn(i, 5),
    ContentLyaerBtn(i, 6),
    ContentLyaerBtn(i, 7),
    ContentLyaerBtn(i, 8)
  })
end, nil

function ComSmTab(name, hint, size, lc, skin)
  return Gui.Button(name)({
    Size = size,
    Location = lc,
    CanPushDown = true,
    Skin = skin,
    Hint = hint
  })
end

ui = Gui.Create()({
  Gui.Control("avatar_root_p")({
    Size = Vector2(1600, 900),
    BackgroundColor = colw,
    Skin = SkinF.avatar_main_085,
    Gui.Control("avatar_root")({
      Size = Vector2(1200, 900),
      Location = Vector2(200, 0),
      ComFuc.ComButton("btn_m_2", nil, Vector2(90, 90), Vector2(1074, 29), 0, true, false, SkinF.lobbyMain_013),
      ComFuc.LobbyMainTabButton(1, Lobby.mainLc[1]),
      ComFuc.LobbyMainTabButton(3, Lobby.mainLc[9]),
      ComFuc.LobbyMainTabButton(4, Lobby.mainLc[4]),
      ComFuc.LobbyMainTabButton(5, Lobby.mainLc[9]),
      ComFuc.LobbyMainTabButton(6, Lobby.mainLc[5]),
      ComFuc.LobbyMainTabButton(7, Lobby.mainLc[3]),
      ComFuc.LobbyMainTabButton(8, Lobby.mainLc[2]),
      ComFuc.LobbyMainTabButton(9, Lobby.mainLc[6]),
      ComFuc.BtmButton("btn_ESC", Vector2(1113, 862), SkinF.lobbyMain_060[4]),
      Gui.Control("avatar_mid")({
        Size = Vector2(1142, 694),
        Location = Vector2(28, 156),
        Gui.Label("price_tip")({
          Size = Vector2(196, 100),
          Location = Vector2(14, 580),
          BackgroundColor = ARGB(200, 255, 255, 255),
          FontSize = 16,
          Skin = SkinF.personalInfo_068,
          ComFuc.ComLabel(nil, GetUTF8Text("UI_avatar_Card_Cost"), Vector2(180, 30), Vector2(12, 5), 0, 16, colw),
          ComFuc.ComControl(nil, Vector2(30, 30), Vector2(12, 35), 255, SkinF.avatar_main_088[2]),
          ComFuc.ComControl(nil, Vector2(30, 30), Vector2(12, 66), 255, SkinF.avatar_main_088[3]),
          ComFuc.ComLabel("price_tip_1", "", Vector2(140, 30), Vector2(47, 35), 0, 16, colw),
          ComFuc.ComLabel("price_tip_2", "", Vector2(140, 30), Vector2(47, 66), 0, 16, colw)
        }),
        ComFuc.ComControl("right", Vector2(408, 687), Vector2(728, 3)),
        Gui.Control("left")({
          Size = Vector2(738, 642),
          Location = Vector2(-3, 45),
          BackgroundColor = col0,
          ComFuc.ComBtnHasPreIcon("btn_cre_cel", "    " .. GetUTF8Text("button_common_Cancel_Create"), Vector2(130, 57), Vector2(48, 48), Vector2(23, 580), 16, false, true, SkinF.select_character_038, SkinF.avatar_mian_087[3], 4),
          ComFuc.ComBtnHasPreIcon("btn_cre_sur", "    " .. GetUTF8Text("button_common_Complete_Create"), Vector2(130, 57), Vector2(48, 48), Vector2(585, 580), 16, false, true, SkinF.select_character_038, SkinF.avatar_mian_087[4], 4),
          Gui.Control("mrs_content")({
            Size = Vector2(63, 201),
            Location = Vector2(660, 40),
            ComFuc.ComButton("btn_mrs_1", nil, Vector2(63, 56), Vector2(0, 0), 0, true, false, SkinF.avatar_main_071),
            ComFuc.ComButton("btn_mrs_2", nil, Vector2(63, 56), Vector2(0, 69), 0, true, false, SkinF.avatar_main_072),
            ComFuc.ComButton("btn_mrs_3", nil, Vector2(63, 56), Vector2(0, 138), 0, true, false, SkinF.avatar_main_073)
          })
        })
      })
    })
  }),
  Gui.Control("new_person_card")({
    Size = Vector2(408, 687),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_098,
    Gui.Control({
      Size = Vector2(391, 563),
      Location = Vector2(9, 9),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, GetUTF8Text("UI_avatar_Avatar_Card_Style_List"), Vector2(383, 21), Vector2(4, 4), 0, 16, colw),
      ComFuc.ComLabel("has_card", nil, Vector2(83, 21), Vector2(295, 4), 0, 16, coly),
      Gui.Control({
        Size = Vector2(383, 523),
        Location = Vector2(4, 33),
        BackgroundColor = colw,
        Skin = SkinF.battle_005,
        ComPersonCB(2, ComFuc.ComputLocation(1, -124, -205, 3, 127, 221)),
        ComPersonCB(3, ComFuc.ComputLocation(2, -124, -205, 3, 127, 221)),
        ComPersonCB(4, ComFuc.ComputLocation(3, -124, -205, 3, 127, 221)),
        ComPersonCB(5, ComFuc.ComputLocation(4, -124, -205, 3, 127, 221)),
        ComPersonCB(6, ComFuc.ComputLocation(5, -124, -205, 3, 127, 221)),
        ComPersonCB(7, ComFuc.ComputLocation(6, -124, -205, 3, 127, 221)),
        ComFuc.ComPagesBar("card_page", Vector2(62, 465))
      })
    }),
    ComFuc.ComBtnHasPreIcon("create_card", "     " .. GetUTF8Text("button_common_Create_Card"), Vector2(157, 75), Vector2(48, 48), Vector2(38, 590), 16, false, true, SkinF.select_character_038, SkinF.avatar_mian_087[1], 10),
    ComFuc.ComBtnHasPreIcon("delete_card", "     " .. GetUTF8Text("button_common_Delete_Avatar_Card"), Vector2(157, 75), Vector2(48, 48), Vector2(211, 590), 16, false, true, SkinF.select_character_038, SkinF.avatar_mian_087[2], 10)
  }),
  Gui.Control("main_edit")({
    Size = Vector2(408, 687),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_098,
    Gui.Control("main_page_content")({
      Size = Vector2(391, 403),
      Location = Vector2(9, 9),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, GetUTF8Text("UI_avatar_Edit_Card"), Vector2(383, 21), Vector2(4, 4), 0, 16, colw),
      ComFuc.ComControl(nil, Vector2(383, 365), Vector2(4, 33), 255, SkinF.battle_005),
      Gui.Control("page_btnCont")({
        Size = Vector2(371, 311),
        Location = Vector2(10, 76),
        BackgroundColor = colw,
        Skin = SkinF.personalInfo_131,
        ComFuc.ComPagesBar("pageBar", Vector2(63, 263)),
        ContentCB(1),
        ContentCB(2),
        ContentCB(3),
        ContentCB(4),
        ContentCB(5),
        ContentCB(6),
        ContentCB(7),
        ContentCB(8),
        ContentCB(9),
        ContentCB(10),
        ContentCB(11),
        ContentCB(12),
        ContentCB(13),
        ContentCB(14),
        ContentCB(15)
      })
    }),
    Gui.Control("main_layer_content")({
      Size = Vector2(391, 668),
      Location = Vector2(9, 9),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, GetUTF8Text("UI_avatar_Edit_Card"), Vector2(383, 21), Vector2(4, 4), 0, 16, colw),
      ComFuc.ComControl(nil, Vector2(383, 630), Vector2(4, 33), 255, SkinF.battle_005),
      ComFuc.ComControl(nil, Vector2(371, 518), Vector2(10, 76), 255, SkinF.personalInfo_131)
    }),
    Gui.Control("cp_cont")({
      Size = Vector2(391, 202),
      Location = Vector2(9, 418),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, GetUTF8Text("UI_avatar_Color_Change"), Vector2(383, 21), Vector2(4, 4), 0, 16, colw),
      ComFuc.ComControl(nil, Vector2(383, 164), Vector2(4, 33), 0, SkinF.battle_005),
      Gui.ColorContainer("Colc")({
        Size = Vector2(353, 148),
        Location = Vector2(32, 42),
        Skin = SkinF.avatar_main_048
      })
    }),
    ComFuc.SecMainTabBtn("btn_main_1", GetUTF8Text("id_datalist_Skin") .. " ", Vector2(80, 38), Vector2(38, 49)),
    ComFuc.SecMainTabBtn("btn_main_2", GetUTF8Text("id_datalist_Head") .. " ", Vector2(80, 38), Vector2(100, 49)),
    ComFuc.SecMainTabBtn("btn_main_3", GetUTF8Text("UI_avatar_avatar_UI_02") .. " ", Vector2(80, 38), Vector2(162, 49)),
    ComFuc.SecMainTabBtn("btn_main_4", GetUTF8Text("id_datalist_Tattoo") .. " ", Vector2(80, 38), Vector2(224, 49)),
    ComFuc.SecMainTabBtn("btn_main_5", GetUTF8Text("UI_profession_Accessories") .. " ", Vector2(80, 38), Vector2(286, 49)),
    ComFuc.ComBtnHasPreIcon("btn_next", "   " .. GetUTF8Text("button_common_Add"), Vector2(128, 39), Vector2(48, 48), Vector2(136, 632), 16, false, true, nil, SkinF.avatar_mian_087[6], 6),
    ComFuc.ComBtnHasPreIcon("btn_return_create", "   " .. GetUTF8Text("button_common_Cancel"), Vector2(128, 39), Vector2(48, 48), Vector2(268, 632), 16, false, true, nil, SkinF.avatar_mian_087[7], 6)
  }),
  Gui.Control("finish_person_card")({
    Size = Vector2(408, 687),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_098,
    Gui.Control({
      Size = Vector2(391, 345),
      Location = Vector2(9, 9),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, "  " .. GetUTF8Text("UI_avatar_avatar_UI_03"), Vector2(383, 21), Vector2(4, 4), 0, 16, colw),
      Gui.Control({
        Size = Vector2(383, 306),
        Location = Vector2(4, 33),
        BackgroundColor = colw,
        Skin = SkinF.battle_005,
        ComFuc.ComTextBox("nameCard", nil, Vector2(167, 34), Vector2(107, 21), 14),
        Gui.Control({
          Size = Vector2(104, 163),
          Location = Vector2(134, 54),
          BackgroundColor = colw,
          Skin = SkinF.personalInfo_143,
          ComFuc.ComCharacterStaticCard(nil, 1, false, false)
        }),
        ComFuc.ComLabel(nil, GetUTF8Text("UI_store_Consume"), Vector2(38, 24), Vector2(66, 224), 0, 16, colt),
        Gui.Control({
          Size = Vector2(150, 31),
          Location = Vector2(114, 220),
          ComFuc.ComLabel("card_cost_1", "100 ", Vector2(122, 31), Vector2(28, 0), 255, 16, coly, "kAlignRightMiddle", SkinF.avatar_main_086),
          ComFuc.ComControl(nil, Vector2(30, 30), Vector2(32, 1), 255, SkinF.avatar_main_088[2]),
          ComFuc.ComCheckBox("sel_cost_1", nil, Vector2(24, 24), Vector2(0, 4), 0, nil, "Gui.CheckBox_01")
        }),
        Gui.Control({
          Size = Vector2(150, 31),
          Location = Vector2(114, 256),
          ComFuc.ComLabel("card_cost_2", "50 ", Vector2(122, 31), Vector2(28, 0), 255, 16, coly, "kAlignRightMiddle", SkinF.avatar_main_086),
          ComFuc.ComControl(nil, Vector2(30, 30), Vector2(32, 1), 255, SkinF.avatar_main_088[3]),
          ComFuc.ComCheckBox("sel_cost_2", nil, Vector2(24, 24), Vector2(0, 4), 0, nil, "Gui.CheckBox_01")
        })
      })
    }),
    Gui.Control({
      Size = Vector2(391, 198),
      Location = Vector2(9, 366),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, "  " .. GetUTF8Text("UI_avatar_avatar_UI_04"), Vector2(383, 21), Vector2(4, 4), 0, 16, colw),
      ComFuc.ComControl(nil, Vector2(383, 160), Vector2(4, 33), 255, SkinF.battle_005),
      ComFuc.ComGuildIconFlag("posture_1", Vector2(52, 42), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_2", Vector2(125, 42), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_3", Vector2(198, 42), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_4", Vector2(271, 42), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_5", Vector2(52, 115), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_6", Vector2(125, 115), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_7", Vector2(198, 115), Vector2(68, 68)),
      ComFuc.ComGuildIconFlag("posture_8", Vector2(271, 115), Vector2(68, 68)),
      ComFuc.ComButton("btn_pre_pos", nil, Vector2(32, 36), Vector2(13, 95), 0, false, false, SkinF.page_001),
      ComFuc.ComButton("btn_next_pos", nil, Vector2(32, 36), Vector2(346, 95), 0, false, false, SkinF.page_002)
    }),
    ComFuc.ComBtnHasPreIcon("buy_card_2", "      " .. GetUTF8Text("UI_store_OK_Buy"), Vector2(130, 57), Vector2(48, 48), Vector2(132, 578), 16, false, true, SkinF.avatar_main_089, SkinF.avatar_mian_087[5], 10),
    ComFuc.ComBtnHasPreIcon("btn_pre", "      " .. GetUTF8Text("button_common_Cancel"), Vector2(130, 57), Vector2(48, 48), Vector2(268, 578), 16, false, true, SkinF.select_character_038, SkinF.avatar_mian_087[3], 10)
  }),
  ComFuc.ComLabel("main_top_1", "   " .. GetUTF8Text("UI_avatar_Choose_Skin"), Vector2(341, 34), Vector2(15, 7), 255, 16, coly, nil, SkinF.personalInfo_088),
  ComFuc.ComLabel("main_top_4", "   " .. GetUTF8Text("UI_avatar_avatar_UI_05"), Vector2(341, 34), Vector2(15, 7), 255, 16, coly, nil, SkinF.personalInfo_088),
  Gui.Control("main_top_2")({
    Size = Vector2(356, 34),
    Location = Vector2(0, 7),
    ComSmTab("btn_head_1", GetUTF8Text("id_datalist_Eyes"), Vector2(47, 34), Vector2(15, 0), SkinF.avatar_main_062),
    ComSmTab("btn_head_2", GetUTF8Text("id_datalist_Mouth"), Vector2(47, 34), Vector2(64, 0), SkinF.avatar_main_064),
    ComSmTab("btn_head_3", GetUTF8Text("id_datalist_Nose"), Vector2(47, 34), Vector2(113, 0), SkinF.avatar_main_063),
    ComSmTab("btn_head_4", GetUTF8Text("id_datalist_Ears"), Vector2(47, 34), Vector2(162, 0), SkinF.avatar_main_065),
    ComSmTab("btn_head_5", GetUTF8Text("id_datalist_Moustache"), Vector2(47, 34), Vector2(211, 0), SkinF.avatar_main_066),
    ComSmTab("btn_head_6", GetUTF8Text("id_datalist_Hair"), Vector2(47, 34), Vector2(260, 0), SkinF.avatar_main_067),
    ComSmTab("btn_head_7", GetUTF8Text("id_datalist_Hat"), Vector2(47, 34), Vector2(309, 0), SkinF.avatar_main_068)
  }),
  Gui.Control("main_top_3")({
    Size = Vector2(356, 34),
    Location = Vector2(0, 7),
    ComSmTab("btn_dress_1", "\206\222\206\222", Vector2(0, 0), Vector2(0, 0), SkinF.avatar_main_076),
    ComSmTab("btn_dress_2", GetUTF8Text("id_datalist_Inner_Wear"), Vector2(47, 34), Vector2(15, 0), SkinF.avatar_main_076),
    ComSmTab("btn_dress_3", GetUTF8Text("id_datalist_Pants"), Vector2(47, 34), Vector2(64, 0), SkinF.avatar_main_078),
    ComSmTab("btn_dress_4", GetUTF8Text("id_datalist_Gloves"), Vector2(47, 34), Vector2(113, 0), SkinF.avatar_main_079),
    ComSmTab("btn_dress_5", GetUTF8Text("id_datalist_Shoes"), Vector2(47, 34), Vector2(162, 0), SkinF.avatar_main_080)
  }),
  Gui.Control("main_top_5")({
    Size = Vector2(356, 34),
    Location = Vector2(0, 7),
    ComSmTab("btn_trinket_1", GetUTF8Text("id_datalist_Adjustable_Trinket"), Vector2(47, 34), Vector2(15, 0), SkinF.avatar_main_081),
    ComSmTab("btn_trinket_2", GetUTF8Text("id_datalist_Head"), Vector2(47, 34), Vector2(64, 0), SkinF.avatar_main_082),
    ComSmTab("btn_trinket_3", GetUTF8Text("id_datalist_Upper_Body"), Vector2(47, 34), Vector2(113, 0), SkinF.avatar_main_077),
    ComSmTab("btn_trinket_4", GetUTF8Text("id_datalist_Lower_Body"), Vector2(47, 34), Vector2(162, 0), SkinF.avatar_main_084)
  }),
  Gui.Control("insertTip_m")({
    Dock = "kDockFill",
    ComFuc.ComControl(nil, Vector2(376, 96), Vector2(12, 0), 255, SkinF.battle_005),
    ComFuc.ComButton("insertTip_buy", GetUTF8Text("button_common_OK"), Vector2(84, 44), Vector2(118, 102)),
    ComFuc.ComButton("insertTip_canc", GetUTF8Text("button_common_Cancel"), Vector2(84, 44), Vector2(218, 102)),
    ComFuc.ComLabel("insertTip_text", "\177\190\213\197\212\236\208\205\191\168\208\232\210\170\187\168\183\209200\208\199\177\210\163\172\200\183\182\168\185\186\194\242\194\240\163\191", Vector2(340, 50), Vector2(30, 40), 0, 16, cols),
    Gui.Control({
      Size = Vector2(150, 31),
      Location = Vector2(30, 10),
      ComFuc.ComLabel("card_cost_3", "100 ", Vector2(122, 31), Vector2(28, 0), 255, 16, coly, "kAlignRightMiddle", SkinF.avatar_main_086),
      ComFuc.ComControl(nil, Vector2(30, 30), Vector2(32, 1), 255, SkinF.avatar_main_088[2]),
      ComFuc.ComCheckBox("sel_cost_3", nil, Vector2(24, 24), Vector2(0, 4), 0, nil, "Gui.CheckBox_01")
    }),
    Gui.Control({
      Size = Vector2(150, 31),
      Location = Vector2(220, 10),
      ComFuc.ComLabel("card_cost_4", "50 ", Vector2(122, 31), Vector2(28, 0), 255, 16, coly, "kAlignRightMiddle", SkinF.avatar_main_086),
      ComFuc.ComControl(nil, Vector2(30, 30), Vector2(32, 1), 255, SkinF.avatar_main_088[3]),
      ComFuc.ComCheckBox("sel_cost_4", nil, Vector2(24, 24), Vector2(0, 4), 0, nil, "Gui.CheckBox_01")
    })
  }),
  ComFuc.PopControl("insertTip", Vector2(400, 206), GetUTF8Text("UI_avatar_avatar_UI_06"), 40, 1),
  ComFuc.ComLabel("layer_top_1", "   " .. GetUTF8Text("UI_avatar_Clothing_Layer"), Vector2(360, 30), Vector2(16, 83), 255, 16, coly, nil, SkinF.personalInfo_088),
  ComFuc.ComLabel("layer_top_2", "   " .. GetUTF8Text("UI_avatar_Tattoo_Layer"), Vector2(360, 30), Vector2(16, 83), 255, 16, coly, nil, SkinF.personalInfo_088),
  ComFuc.ComLabel("layer_top_3", "   " .. GetUTF8Text("UI_avatar_Trinket_Layer"), Vector2(360, 30), Vector2(16, 83), 255, 16, coly, nil, SkinF.personalInfo_088),
  ComLayerCont(1),
  ComLayerCont(2),
  ComLayerCont(3),
  ComFuc.ComControl("coverControl", Vector2(1600, 1200), Vector2(0, 0), 0),
  ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0)),
  ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
})
ui.insertTip_text.AutoWrap = true
ui.btn_ESC.Hint = GetUTF8Text("tips_lobby_Button_Decs6")
ui.btn_m_2.ClickAudio = "game_launch"
ui.btn_m_3.Visible = false
ui.btn_m_5.Visible = false
ui.btn_m_9.Visible = false
ui.btn_mrs_1.Hint = GetUTF8Text("UI_common_Pan")
ui.btn_mrs_2.Hint = GetUTF8Text("button_common_Rotate")
ui.btn_mrs_3.Hint = GetUTF8Text("button_common_Zoom")
ui.price_tip_1.Text = tonumber(ui.card_cost_1.Text)
ui.price_tip_2.Text = tonumber(ui.card_cost_2.Text)
ui.insertTip_m.Parent = ui.insertTip_son
for i = 2, 7 do
  ui["person_edi_" .. i].Visible = false
  local ShowOnePersonCard = "insertTip_son"
end
local ShowCreateAndCancel = function(i, isShow)
  ui["person_b_" .. i].Visible = isShow
  ui["person_buy_" .. i].Visible = isShow
end
local ShowAddAndCancel = function(isShow)
  ui.btn_cre_cel.Visible = isShow
  ui.price_tip.Visible = not isShow
  ui.btn_cre_sur.Visible = isShow
  ui.sel_cost_1.Check = true
  ui.sel_cost_2.Check = false
end
local SelPersonBtn = function(isShow)
  ui.btn_return_create.Visible = isShow
  ui.btn_next.Visible = isShow
end
local ShowOnePersonCard, ShowCreatePersonCard = function(i)
  ui.delete_card.Enable = true
  selectPersonId = cardDt[i].pid
  curCardSlot = i
  curCardPage = ui.card_page.CurrIndex
  for j = 2, 7 do
    if j == i then
      ui["person_b_" .. j].PushDown = true
      ComFuc.DealAvatarEquipRoom(cardDt[i].avatar)
      ag:PlayPoseAnimation(cardDt[i].position)
    else
      ui["person_b_" .. j].PushDown = false
    end
  end
end, ui["person_edi_" .. i]
local ShowCreatePersonCard, ShowMainEdit = function()
  ui.new_person_card.Parent = ui.right
  ui.finish_person_card.Parent = nil
  ui.main_edit.Parent = nil
  ShowCreateAndCancel(false)
  if bit.band(64, ComFuc.leadList) == 64 then
    NewLead.ShowNewLeadNoLock(Vector2(793, 750), Vector2(158, 74), GetUTF8Text("UI_avatar_avatar_help"), 0)
  end
end, "Visible"
local ShowMainEdit, ShowFinishCard = function()
  ui.new_person_card.Parent = nil
  ui.finish_person_card.Parent = nil
  ui.main_edit.Parent = ui.right
  ShowAddAndCancel(false)
  ShowCreateAndCancel(true)
  if bit.band(64, ComFuc.leadList) == 64 then
    NewLead.ShowNewLeadNoLock(Vector2(758, 160), Vector2(402, 686), GetUTF8Text("UI_avatar_additional_string_121"), 3)
  end
end, false
local ShowFinishCard, ShowInsertTip = function()
  ui.new_person_card.Parent = nil
  ui.finish_person_card.Parent = ui.right
  ui.main_edit.Parent = nil
  ui.nameCard.Text = GetUTF8Text("UI_common_Enter_Card_Name")
  ui.nameCard.Focused = true
  ShowCreateAndCancel(false)
  if bit.band(64, ComFuc.leadList) == 64 then
    NewLead.ShowNewLeadNoLock(Vector2(878, 220), Vector2(164, 40), GetUTF8Text("UI_common_Enter_Card_Name"), 0)
  end
end, ComFuc.ComLabel("main_top_4", "   " .. GetUTF8Text("UI_avatar_avatar_UI_05"), Vector2(341, 34), Vector2(15, 7), 255, 16, coly, nil, SkinF.personalInfo_088)
local ShowInsertTip, HideInsertTip = function(i)
  insertBuyIndex = i
  ui.coverControl2.Parent = gui
  ui.insertTip.Parent = gui
  ui.sel_cost_3.Check = true
  ui.sel_cost_4.Check = false
  ui.insertTip_text.Text = string.format(GetUTF8Text("msgbox_common_num_1182"), tonumber(ui.card_cost_3.Text), GetUTF8Text("id_common_CC"))
  Gui.Align(ui.insertTip, 0.5, 0.5)
end, Gui.Control("main_top_2")({
  Size = Vector2(356, 34),
  Location = Vector2(0, 7),
  ComSmTab("btn_head_1", GetUTF8Text("id_datalist_Eyes"), Vector2(47, 34), Vector2(15, 0), SkinF.avatar_main_062),
  ComSmTab("btn_head_2", GetUTF8Text("id_datalist_Mouth"), Vector2(47, 34), Vector2(64, 0), SkinF.avatar_main_064),
  ComSmTab("btn_head_3", GetUTF8Text("id_datalist_Nose"), Vector2(47, 34), Vector2(113, 0), SkinF.avatar_main_063),
  ComSmTab("btn_head_4", GetUTF8Text("id_datalist_Ears"), Vector2(47, 34), Vector2(162, 0), SkinF.avatar_main_065),
  ComSmTab("btn_head_5", GetUTF8Text("id_datalist_Moustache"), Vector2(47, 34), Vector2(211, 0), SkinF.avatar_main_066),
  ComSmTab("btn_head_6", GetUTF8Text("id_datalist_Hair"), Vector2(47, 34), Vector2(260, 0), SkinF.avatar_main_067),
  ComSmTab("btn_head_7", GetUTF8Text("id_datalist_Hat"), Vector2(47, 34), Vector2(309, 0), SkinF.avatar_main_068)
})
local HideInsertTip, ShowPersonInfoCard = function()
  ui.coverControl2.Parent = nil
  ui.insertTip.Parent = nil
end, Gui.Control("main_top_3")({
  Size = Vector2(356, 34),
  Location = Vector2(0, 7),
  ComSmTab("btn_dress_1", "\206\222\206\222", Vector2(0, 0), Vector2(0, 0), SkinF.avatar_main_076),
  ComSmTab("btn_dress_2", GetUTF8Text("id_datalist_Inner_Wear"), Vector2(47, 34), Vector2(15, 0), SkinF.avatar_main_076),
  ComSmTab("btn_dress_3", GetUTF8Text("id_datalist_Pants"), Vector2(47, 34), Vector2(64, 0), SkinF.avatar_main_078),
  ComSmTab("btn_dress_4", GetUTF8Text("id_datalist_Gloves"), Vector2(47, 34), Vector2(113, 0), SkinF.avatar_main_079),
  ComSmTab("btn_dress_5", GetUTF8Text("id_datalist_Shoes"), Vector2(47, 34), Vector2(162, 0), SkinF.avatar_main_080)
})
local ShowPersonInfoCard, InitLayerData = function()
  ptr_cast(game.CurrentState):ReturnToLobby()
  Lobby.OnComSwitch(1)
  PersonalInfo.SelDepotBtn(4)
end, Gui.Control("main_top_5")({
  Size = Vector2(356, 34),
  Location = Vector2(0, 7),
  ComSmTab("btn_trinket_1", GetUTF8Text("id_datalist_Adjustable_Trinket"), Vector2(47, 34), Vector2(15, 0), SkinF.avatar_main_081),
  ComSmTab("btn_trinket_2", GetUTF8Text("id_datalist_Head"), Vector2(47, 34), Vector2(64, 0), SkinF.avatar_main_082),
  ComSmTab("btn_trinket_3", GetUTF8Text("id_datalist_Upper_Body"), Vector2(47, 34), Vector2(113, 0), SkinF.avatar_main_077),
  ComSmTab("btn_trinket_4", GetUTF8Text("id_datalist_Lower_Body"), Vector2(47, 34), Vector2(162, 0), SkinF.avatar_main_084)
})
local InitLayerData, SetTempMsg = function()
  for i = 1, 3 do
    for j = 1, 8 do
      ui["btn_layer_" .. i .. "_" .. j].NumberText.Text = ui["btn_layer_" .. i .. "_" .. j].ID
      ui["btn_layer_" .. i .. "_" .. j].IconBG.Skin = SkinF.personalInfo_083[1]
      ui["btn_layer_" .. i .. "_" .. j].IconStamp.Skin = SkinF.avatar_layer_stamp[i]
    end
  end
end, Gui.Control("insertTip_m")({
  Dock = "kDockFill",
  ComFuc.ComControl(nil, Vector2(376, 96), Vector2(12, 0), 255, SkinF.battle_005),
  ComFuc.ComButton("insertTip_buy", GetUTF8Text("button_common_OK"), Vector2(84, 44), Vector2(118, 102)),
  ComFuc.ComButton("insertTip_canc", GetUTF8Text("button_common_Cancel"), Vector2(84, 44), Vector2(218, 102)),
  ComFuc.ComLabel("insertTip_text", "\177\190\213\197\212\236\208\205\191\168\208\232\210\170\187\168\183\209200\208\199\177\210\163\172\200\183\182\168\185\186\194\242\194\240\163\191", Vector2(340, 50), Vector2(30, 40), 0, 16, cols),
  Gui.Control({
    Size = Vector2(150, 31),
    Location = Vector2(30, 10),
    ComFuc.ComLabel("card_cost_3", "100 ", Vector2(122, 31), Vector2(28, 0), 255, 16, coly, "kAlignRightMiddle", SkinF.avatar_main_086),
    ComFuc.ComControl(nil, Vector2(30, 30), Vector2(32, 1), 255, SkinF.avatar_main_088[2]),
    ComFuc.ComCheckBox("sel_cost_3", nil, Vector2(24, 24), Vector2(0, 4), 0, nil, "Gui.CheckBox_01")
  }),
  Gui.Control({
    Size = Vector2(150, 31),
    Location = Vector2(220, 10),
    ComFuc.ComLabel("card_cost_4", "50 ", Vector2(122, 31), Vector2(28, 0), 255, 16, coly, "kAlignRightMiddle", SkinF.avatar_main_086),
    ComFuc.ComControl(nil, Vector2(30, 30), Vector2(32, 1), 255, SkinF.avatar_main_088[3]),
    ComFuc.ComCheckBox("sel_cost_4", nil, Vector2(24, 24), Vector2(0, 4), 0, nil, "Gui.CheckBox_01")
  })
})
local SetTempMsg, SetEditMsg = function(i)
  tempId = i
end, ComFuc.PopControl("insertTip", Vector2(400, 206), GetUTF8Text("UI_avatar_avatar_UI_06"), 40, 1)
local SetEditMsg, SetsingleMsg = function(i)
  editId = i
end, ComFuc.ComLabel("layer_top_1", "   " .. GetUTF8Text("UI_avatar_Clothing_Layer"), Vector2(360, 30), Vector2(16, 83), 255, 16, coly, nil, SkinF.personalInfo_088)
local SetsingleMsg, SetLayerMsg = function(index, i)
  singleId[index] = i
end, ComFuc.ComLabel("layer_top_2", "   " .. GetUTF8Text("UI_avatar_Tattoo_Layer"), Vector2(360, 30), Vector2(16, 83), 255, 16, coly, nil, SkinF.personalInfo_088)
local SetLayerMsg, GetAllChannelColor = function(index1, index2, i)
  layerId[index1][index2] = i
end, ComFuc.ComLabel("layer_top_3", "   " .. GetUTF8Text("UI_avatar_Trinket_Layer"), Vector2(360, 30), Vector2(16, 83), 255, 16, coly, nil, SkinF.personalInfo_088)
local GetAllChannelColor, set_edit_state = function(currColc)
  local c0 = currColc:GetColorByID(0)
  local c1 = currColc:GetColorByID(1)
  local c2 = currColc:GetColorByID(2)
  local a = Vector4(c0.r * reci, c0.g * reci, c0.b * reci, 0.5)
  local b = Vector4(c1.r * reci, c1.g * reci, c1.b * reci, 0.5)
  local c = Vector4(c2.r * reci, c2.g * reci, c2.b * reci, 0.5)
  return a, b, c
end, ComLayerCont(1)
local set_edit_state, ShowEditBtn = function(i)
  for k = 1, 3 do
    if k == i then
      ui["btn_mrs_" .. k].PushDown = true
    else
      ui["btn_mrs_" .. k].PushDown = false
    end
  end
  ag:SetCurrEditState(i - 1)
end, ComLayerCont(2)
local ShowEditBtn, HideEditBtn = function()
  ui.mrs_content.Visible = true
  isShowEditBtn = true
  set_edit_state(1)
  ag:SetCurrEditState(0)
  ag:SetShowCtrlMesh(true)
end, ComLayerCont(3)
local HideEditBtn, ClearDressSelct = function()
  isShowEditBtn = false
  ui.mrs_content.Visible = false
  ag:SetShowCtrlMesh(false)
end, ComFuc.ComControl("coverControl", Vector2(1600, 1200), Vector2(0, 0), 0)
local ClearDressSelct, ClearTrinketSelct = function()
  for i = 9, 13 do
    if i ~= currentPart then
      partBtnClickedNo[i] = 0
    end
  end
end, ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0))
local ClearTrinketSelct, SetAllState = function()
  for i = 15, 18 do
    if i ~= currentPart then
      partBtnClickedNo[i] = 0
    end
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetAllState, SetCurrContentBtn = function()
  if 2 <= currentPart and currentPart <= 5 or 14 <= currentPart and currentPart <= 15 then
    if 2 <= currentPart and currentPart <= 4 then
      ag:SetCurrEditPart(1)
      ag:SetCurrFaceAnimEditPartID(currentPart)
    elseif currentPart == 5 then
      ag:SetCurrEditPart(3)
    elseif currentPart == 14 then
      ag:SetCurrEditPart(0)
    elseif currentPart == 15 then
      ag:SetCurrEditPart(2)
    end
    ShowEditBtn()
  else
    ag:SetCurrEditPart(100)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetCurrContentBtn, ManageBtnClick = function()
  HideEditBtn()
  local k = partBtnClickedNo[currentPart] - 15 * (partBtnClickedPage[currentPart] - 1)
  if searhPositon ~= 0 then
    k = searhPositon
    partBtnClickedNo[currentPart] = 15 * (partBtnClickedPage[currentPart] - 1) + k
  end
  if 0 < k and k <= 15 then
    ui.Colc.Visible = true
    ui["avatar_b_" .. k].PushDown = true
    ui["avatar_b_" .. k].BriefControl_2.Visible = true
    if dataList then
      local t = dataList[k].value
      local ti = dataList[k].id
      if currentPart == 5 then
        if t[3] == 1 then
          ui.Colc:SetChannelColor1(partColorMsg[currentPart][1])
        elseif t[3] == 2 then
          ui.Colc:SetChannelColor2(partColorMsg[currentPart][1], partColorMsg[currentPart][2])
        elseif t[3] == 3 then
          ui.Colc:SetChannelColor3(partColorMsg[currentPart][1], partColorMsg[currentPart][2], partColorMsg[currentPart][3])
        end
      elseif t[2] == 1 then
        ui.Colc:SetChannelColor1(partColorMsg[currentPart][1])
      elseif t[2] == 2 then
        ui.Colc:SetChannelColor2(partColorMsg[currentPart][1], partColorMsg[currentPart][2])
      elseif t[2] == 3 then
        ui.Colc:SetChannelColor3(partColorMsg[currentPart][1], partColorMsg[currentPart][2], partColorMsg[currentPart][3])
      end
      if 8 < currentPart and isEdit then
        SetEditMsg(ti)
        editMsg[3] = t[1]
        editMsg[4] = t[2]
        if t[2] == 1 then
          ui.Colc:SetChannelColor1(editMsg[2][1])
        elseif t[2] == 2 then
          ui.Colc:SetChannelColor2(editMsg[2][1], editMsg[2][2])
        elseif t[2] == 3 then
          ui.Colc:SetChannelColor3(editMsg[2][1], editMsg[2][2], editMsg[2][3])
        end
        selectSkin = t[1]
      end
    end
    SetAllState()
  else
    ag:SetCurrEditPart(100)
    ui.Colc.Visible = false
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ManageBtnClick, ManageBtn2Click = function(numIndex)
  HideEditBtn()
  tempPart = currentPart
  isClicked = true
  ui.Colc.Visible = true
  ui["avatar_b_" .. numIndex].PushDown = true
  ui["avatar_b_" .. numIndex].BriefControl_2.Visible = true
  if 9 <= currentPart and currentPart <= 13 then
    ClearDressSelct()
  elseif 15 <= currentPart and currentPart <= 18 then
    ClearTrinketSelct()
  end
  local KC = partBtnClickedNo[currentPart] - 15 * (partBtnClickedPage[currentPart] - 1)
  if 0 < KC and KC <= 15 then
    ui["avatar_b_" .. KC].BriefControl_2.Visible = false
    ui["avatar_b_" .. KC].PushDown = false
  end
  partBtnClickedNo[currentPart] = numIndex + 15 * (partBtnClickedPage[currentPart] - 1)
  if dataList then
    local t = dataList[numIndex].value
    local ti = dataList[numIndex].id
    tempPart = currentPart
    tempId = ti
    selectSkin = t[1]
    if currentPart == 5 then
      if t[3] == 1 then
        partColorMsg[currentPart][1] = ARGB(255, t[4], t[5], t[6])
        ui.Colc:SetChannelColor1(ARGB(255, t[4], t[5], t[6]))
      elseif t[3] == 2 then
        partColorMsg[currentPart][1] = ARGB(255, t[4], t[5], t[6])
        partColorMsg[currentPart][2] = ARGB(255, t[7], t[8], t[9])
        ui.Colc:SetChannelColor2(ARGB(255, t[4], t[5], t[6]), ARGB(255, t[7], t[8], t[9]))
      elseif t[3] == 3 then
        partColorMsg[currentPart][1] = ARGB(255, t[4], t[5], t[6])
        partColorMsg[currentPart][2] = ARGB(255, t[7], t[8], t[9])
        partColorMsg[currentPart][3] = ARGB(255, t[10], t[11], t[12])
        ui.Colc:SetChannelColor3(ARGB(255, t[4], t[5], t[6]), ARGB(255, t[7], t[8], t[9]), ARGB(255, t[10], t[11], t[12]))
      end
    elseif t[2] == 1 then
      partColorMsg[currentPart][1] = ARGB(255, t[3], t[4], t[5])
      ui.Colc:SetChannelColor1(ARGB(255, t[3], t[4], t[5]))
    elseif t[2] == 2 then
      partColorMsg[currentPart][1] = ARGB(255, t[3], t[4], t[5])
      partColorMsg[currentPart][2] = ARGB(255, t[6], t[7], t[8])
      ui.Colc:SetChannelColor2(ARGB(255, t[3], t[4], t[5]), ARGB(255, t[6], t[7], t[8]))
    elseif t[2] == 3 then
      partColorMsg[currentPart][1] = ARGB(255, t[3], t[4], t[5])
      partColorMsg[currentPart][2] = ARGB(255, t[6], t[7], t[8])
      partColorMsg[currentPart][3] = ARGB(255, t[9], t[10], t[11])
      ui.Colc:SetChannelColor3(ARGB(255, t[3], t[4], t[5]), ARGB(255, t[6], t[7], t[8]), ARGB(255, t[9], t[10], t[11]))
    end
    if currentPart < 9 then
      SetsingleMsg(currentPart, ti)
    else
      SetTempMsg(ti)
    end
    SetAllState()
    local a, b, c = GetAllChannelColor(ui.Colc)
    if currentPart == 1 then
      ag:SetBaseBodyTex(currentPart, t[1], t[2], a, b, c)
    elseif 2 <= currentPart and currentPart <= 4 then
      ag:SetFace(currentPart, t[1], t[2], a, b, c)
    elseif currentPart == 5 then
      ag:SetEar(currentPart, t[2], t[1], t[3], a, b, c)
    elseif 6 <= currentPart and currentPart <= 8 then
      ag:SetHeadPart(currentPart, t[1], t[2], a, b, c)
    elseif 9 <= currentPart and currentPart <= 13 then
      tabpadIndex[1] = currentPart - 8
      ag:SetCloth(layerCurrent, currentPart, t[1], t[2], a, b, c)
    elseif currentPart == 14 then
      ag:SetDecal(layerCurrent, currentPart, t[1], t[2], a, b, c)
    elseif 15 <= currentPart and currentPart <= 18 then
      tabpadIndex[3] = currentPart - 14
      if currentPart == 15 then
        ag:SetMoveableTrinket(layerCurrent, currentPart, t[1], t[2], a, b, c)
      else
        ag:SetImmovableTrinket(layerCurrent, currentPart, t[1], t[2], a, b, c)
      end
    end
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ManageBtn2Click, DealSysAvatarPartList = function()
  HideEditBtn()
  SetTempMsg(0)
  SetsingleMsg(currentPart, 0)
  isClicked = false
  ui.Colc.Visible = false
  ag:SetCurrEditPart(100)
  local KC = partBtnClickedNo[currentPart] - 15 * (partBtnClickedPage[currentPart] - 1)
  if 0 < KC and KC <= 15 then
    ui["avatar_b_" .. KC].BriefControl_2.Visible = false
    ui["avatar_b_" .. KC].PushDown = false
  end
  partBtnClickedNo[currentPart] = 0
  if currentPart == 1 then
    ag:SetBaseBodyTex(currentPart, "onecolor_skin", 1, Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1))
  elseif 2 <= currentPart and currentPart <= 4 then
    ag:SetFace(currentPart, "onecolor_a", 1, Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1))
  elseif currentPart == 5 then
    ag:SetEar(currentPart, 1, "", 1, Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1))
  elseif 6 <= currentPart and currentPart <= 8 then
    ag:SetHeadPart(currentPart, "", 1, Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1), Vector4(0.5, 0.5, 0.5, 1))
  elseif 9 <= currentPart and currentPart <= 13 then
    ag:DeleteCloth(layerCurrent)
  elseif currentPart == 14 then
    ag:DeleteDecal(layerCurrent)
  elseif 15 <= currentPart and currentPart <= 18 then
    ag:DeleteTrinket(layerCurrent)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local DealSysAvatarPartList, SetCurrAvatarPart = function(data)
  if isPagebarClick then
    isPagebarClick = false
  end
  ui.pageBar.PageCount = data.pages
  ui.pageBar.CurrIndex = data.page
  dataList = data.list
  if data.position then
    searhPositon = data.position
  else
    searhPositon = 0
  end
  for i, v in ipairs(dataList) do
    ui["avatar_b_" .. i].Visible = true
    ui["avatar_b_" .. i].BriefControl_1.Skin = Gui.ButtonSkin({
      BackgroundImage = Gui.Image(skin_dir .. v.value[1] .. ".tga", Vector4(0, 0, 0, 0))
    })
  end
  SetCurrContentBtn()
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetCurrAvatarPart, SetHeadTabpad = function()
  for i = 1, 15 do
    ui["avatar_b_" .. i].Visible = false
    ui["avatar_b_" .. i].PushDown = false
    ui["avatar_b_" .. i].BriefControl_2.Visible = false
  end
  if currentPart == 12 then
    ag:PlayAnim("gloves_a", true)
  elseif currentPart == 14 then
    ag:PlayAnim("idletotidle")
    ag:SetIdleAnimation("tidle")
  else
    ag:PlayAnim("idlea")
    ag:SetIdleAnimation("idlea")
  end
  if isPagebarClick then
    rpc.safecall("sys_avatar_part_get", {
      partId = currentPart,
      p = partBtnClickedPage[currentPart],
      size = 15
    }, DealSysAvatarPartList)
  else
    if mainCurrentBtn <= 2 then
      searhPartId = singleId[currentPart]
    else
      searhPartId = 0
      if isEdit then
        if isEidtFirst then
          isEidtFirst = false
          searhPartId = layerId[tempI][tempJ]
          tempId = layerId[tempI][tempJ]
        elseif tempPart == currentPart then
          searhPartId = tempId
        else
          searhPartId = 0
        end
      end
      if isAdd then
        if tempPart == currentPart then
          searhPartId = tempId
        else
          searhPartId = 0
        end
      end
    end
    rpc.safecall("sys_avatar_part_get", {
      partId = currentPart,
      sysAvatarPartId = searhPartId,
      size = 15
    }, DealSysAvatarPartList)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetHeadTabpad, SetDressTabpad = function(i)
  if i <= 5 then
    ag:SetLookAtHead()
  else
    ag:SetLookAtBody()
  end
  for k = 1, 7 do
    if k == i then
      ui["btn_head_" .. k].PushDown = true
    else
      ui["btn_head_" .. k].PushDown = false
    end
  end
  if headCurrentBtn ~= i then
    headCurrentBtn = i
    currentPart = headCurrentBtn + 1
    SetCurrAvatarPart()
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetDressTabpad, SetDecalTabpad = function(i)
  if 2 == i then
    ag:SetLookAtChest()
  elseif 3 == i or 5 == i then
    ag:SetLookAtHip()
  elseif 4 == i then
    ag:SetLookAtHand()
  end
  for k = 1, 5 do
    if k == i then
      ui["btn_dress_" .. k].PushDown = true
    else
      ui["btn_dress_" .. k].PushDown = false
    end
  end
  if dressCurrentBtn ~= i then
    dressCurrentBtn = i
    currentPart = i + 8
    SetCurrAvatarPart()
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetDecalTabpad, SetTrinketTabpad = function()
  ag:SetLookAtBody()
  currentPart = 14
  SetCurrAvatarPart()
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetTrinketTabpad, GoShowLayer = function(i)
  if 1 == i or 2 == i then
    ag:SetLookAtHead()
  elseif 3 == i then
    ag:SetLookAtChest()
  elseif 4 == i then
    ag:SetLookAtHip()
  end
  for k = 1, 4 do
    if k == i then
      ui["btn_trinket_" .. k].PushDown = true
    else
      ui["btn_trinket_" .. k].PushDown = false
    end
  end
  if trinketCurrentBtn ~= i then
    trinketCurrentBtn = i
    currentPart = i + 14
    SetCurrAvatarPart()
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local GoShowLayer, GoSlectLayer = function(i)
  local t = i - 2
  ui["layer_top_" .. t].Parent = ui.main_layer_content
  ui["layer_cont_" .. t].Parent = ui.main_layer_content
  ui.main_layer_content.Parent = ui.main_edit
  ui["main_top_" .. i].Parent = nil
  ui.main_page_content.Parent = nil
  ui.cp_cont.Parent = nil
  ui.btn_cre_sur.Enable = true
  for j = 1, 5 do
    if j ~= i then
      ui["btn_main_" .. j].Parent = ui.main_edit
    end
  end
  ui["btn_main_" .. i].Parent = ui.main_edit
  ShowAddAndCancel(false)
  ag:SetCurrEditPart(100)
  ag:PlayAnim("idlea", false)
  dressCurrentBtn = 0
  trinketCurrentBtn = 0
  HideEditBtn()
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local GoSlectLayer, ThreeCancel = function(i)
  local t = i - 2
  ui["layer_top_" .. t].Parent = nil
  ui["layer_cont_" .. t].Parent = nil
  ui.main_layer_content.Parent = nil
  ui["main_top_" .. i].Parent = ui.page_btnCont
  ui.main_page_content.Parent = ui.main_edit
  ui.cp_cont.Parent = ui.main_edit
  ui.btn_cre_sur.Enable = false
  ShowAddAndCancel(true)
  for j = 1, 5 do
    if j ~= i then
      ui["btn_main_" .. j].Parent = ui.main_edit
    end
  end
  ui["btn_main_" .. i].Parent = ui.main_edit
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ThreeCancel, SetSure = function(i)
  ui["main_top_" .. i].Parent = nil
  ui.main_page_content.Parent = nil
  ui.cp_cont.Parent = nil
  ShowAddAndCancel(false)
  ag:SetCurrEditPart(100)
  if isEdit then
    isEdit = false
    if i == 1 then
      ag:LoadDressData(layerCurrent)
    elseif i == 2 then
      ag:LoadDecalData(layerCurrent)
    elseif i == 3 then
      ag:LoadTrinketData(layerCurrent)
    end
  elseif isAdd then
    isAdd = false
    if isClicked then
      if i == 1 then
        ag:DeleteCloth(layerCurrent)
      elseif i == 2 then
        ag:DeleteDecal(layerCurrent)
      elseif i == 3 then
        ag:DeleteTrinket(layerCurrent)
      end
    end
  end
  if isClicked then
    isClicked = false
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetSure, CleanLayers = function(i, j)
  ui["btn_layer_" .. i .. "_" .. j].DeleteButton.Visible = true
  ui["btn_layer_" .. i .. "_" .. j].IconStamp.Visible = false
  ui["btn_layer_" .. i .. "_" .. j].EditButton.Text = GetUTF8Text("button_common_Edit")
  ui["btn_layer_" .. i .. "_" .. j].IconShow.Visible = true
  ui["btn_layer_" .. i .. "_" .. j].IconShow.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(skin_dir .. selectSkin .. ".tga", Vector4(0, 0, 0, 0))
  })
  if i ~= 2 then
    ui["btn_layer_" .. i .. "_" .. j].TabpadIndex = tabpadIndex[i]
  end
  layerAddOrEdit[i][j] = 1
  SetLayerMsg(i, j, tempId)
  ui["btn_layer_" .. i .. "_" .. j].Color01 = ui.Colc:GetColorByID(0)
  ui["btn_layer_" .. i .. "_" .. j].Color02 = ui.Colc:GetColorByID(1)
  ui["btn_layer_" .. i .. "_" .. j].Color03 = ui.Colc:GetColorByID(2)
  if i == 1 then
    ag:SaveDressData(layerCurrent)
  elseif i == 2 then
    ag:SaveDecalData(layerCurrent)
  elseif i == 3 then
    ag:SaveTrinketData(layerCurrent)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local CleanLayers, SetPartColorMsg = function()
  for i = 1, 3 do
    for k = 1, 8 do
      layerAddOrEdit[i][k] = 0
      ui["btn_layer_" .. i .. "_" .. k].EditButton.Text = GetUTF8Text("button_common_Add")
      ui["btn_layer_" .. i .. "_" .. k].DeleteButton.Visible = false
      ui["btn_layer_" .. i .. "_" .. k].IconStamp.Visible = true
      ui["btn_layer_" .. i .. "_" .. k].IconShow.Visible = false
    end
  end
  ag:ClearAllInfo()
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetPartColorMsg, SetLayerColorMsg = function(i, p, t, a)
  singleId[i] = p
  if t[a] == 1 then
    partColorMsg[i][1] = ARGB(255, t[a + 1] * 255, t[a + 2] * 255, t[a + 3] * 255)
  elseif t[a] == 2 then
    partColorMsg[i][1] = ARGB(255, t[a + 1] * 255, t[a + 2] * 255, t[a + 3] * 255)
    partColorMsg[i][2] = ARGB(255, t[a + 4] * 255, t[a + 5] * 255, t[a + 6] * 255)
  elseif t[a] == 3 then
    partColorMsg[i][1] = ARGB(255, t[a + 1] * 255, t[a + 2] * 255, t[a + 3] * 255)
    partColorMsg[i][2] = ARGB(255, t[a + 4] * 255, t[a + 5] * 255, t[a + 6] * 255)
    partColorMsg[i][3] = ARGB(255, t[a + 7] * 255, t[a + 8] * 255, t[a + 9] * 255)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetLayerColorMsg, ReInitalData = function(i, j, p, t, a)
  ui["btn_layer_" .. i .. "_" .. j].DeleteButton.Visible = true
  ui["btn_layer_" .. i .. "_" .. j].IconStamp.Visible = false
  ui["btn_layer_" .. i .. "_" .. j].EditButton.Text = GetUTF8Text("button_common_Edit")
  ui["btn_layer_" .. i .. "_" .. j].IconShow.Visible = true
  ui["btn_layer_" .. i .. "_" .. j].IconShow.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(skin_dir .. t[1] .. ".tga", Vector4(0, 0, 0, 0))
  })
  layerAddOrEdit[i][j] = 1
  SetLayerMsg(i, j, p)
  if t[a] == 1 then
    ui["btn_layer_" .. i .. "_" .. j].Color01 = ARGB(255, t[a + 1] * 255, t[a + 2] * 255, t[a + 3] * 255)
  elseif t[a] == 2 then
    ui["btn_layer_" .. i .. "_" .. j].Color01 = ARGB(255, t[a + 1] * 255, t[a + 2] * 255, t[a + 3] * 255)
    ui["btn_layer_" .. i .. "_" .. j].Color02 = ARGB(255, t[a + 4] * 255, t[a + 5] * 255, t[a + 6] * 255)
  elseif t[a] == 3 then
    ui["btn_layer_" .. i .. "_" .. j].Color01 = ARGB(255, t[a + 1] * 255, t[a + 2] * 255, t[a + 3] * 255)
    ui["btn_layer_" .. i .. "_" .. j].Color02 = ARGB(255, t[a + 4] * 255, t[a + 5] * 255, t[a + 6] * 255)
    ui["btn_layer_" .. i .. "_" .. j].Color03 = ARGB(255, t[a + 7] * 255, t[a + 8] * 255, t[a + 9] * 255)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ReInitalData, DealPersonalCardList = function()
  partIdList = ""
  SetTempMsg(0)
  SetEditMsg(0)
  singleId = {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  }
  layerId = {
    {
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    },
    {
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    },
    {
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    }
  }
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local DealPersonalCardList, ShowPersonCard = function(data)
  cardDt = {}
  for i = 2, 7 do
    ag:ClearPersonCardData(i)
    ShowOnePersonCard(i, false)
  end
  ui.card_page.CurrIndex = data.page
  ui.card_page.PageCount = data.pages
  for i, v in ipairs(data.items) do
    local t = i + 1
    cardDt[t] = v
    if selectPersonId == v.pid then
      ui["person_b_" .. t].PushDown = true
    else
      ui["person_b_" .. t].PushDown = false
    end
    ShowOnePersonCard(t, true)
    ComFuc.SetPersonCardDataARoom(v.avatar, t)
    ag:UpdateStaticCardByInfoString(t, v.position)
    ui["person_c_" .. t].EventMouseEnter = function(sender, e)
      Tip.SetRpc("tip_player_avatar", {
        t = 5,
        pid = v.pid
      })
      Tip.SetUseDescription(false)
      Tip.SetOwner(sender)
    end
  end
  if isNeedShow then
    isNeedShow = false
    if ui["person_b_" .. 2].Visible then
      SelPersonBtn(2)
    end
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ShowPersonCard, SelCurrPosBtn = function(index)
  rpc.safecall("storage_storage_list", {
    t = 6,
    p = index,
    s = 6
  }, DealPersonalCardList)
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SelCurrPosBtn, SetPosPageEnable = function()
  for k = 1, 8 do
    if k == postureCurr then
      ui["posture_" .. k .. "_b"].PushDown = true
      ui["posture_" .. k .. "_c"].Visible = true
    else
      ui["posture_" .. k .. "_b"].PushDown = false
      ui["posture_" .. k .. "_c"].Visible = false
    end
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetPosPageEnable, SetPostrueIcon = function()
  if postureBegin == 1 then
    ui.btn_pre_pos.Enable = false
  else
    ui.btn_pre_pos.Enable = true
  end
  if postureBegin + 7 >= #postureList then
    ui.btn_next_pos.Enable = false
  else
    ui.btn_next_pos.Enable = true
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SetPostrueIcon, DealPoseList = function(b, c)
  for i = 1, 0 + c do
    ui["posture_" .. i .. "_b"].Visible = true
    ui["posture_" .. i .. "_b"].Skin = Gui.ButtonSkin({
      BackgroundImage = Gui.Image(pose_dir .. "skin_avatarroom_custom_0" .. postureBegin + i - 2 .. ".tga", Vector4(0, 0, 0, 0))
    })
  end
  for i = c + 1, 8 do
    ui["posture_" .. i .. "_b"].Visible = false
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local DealPoseList, RecoverLayerButton = function(data)
  if data.price then
    for i, v in ipairs(data.price) do
      if v.currency == 2 then
        ui.card_cost_1.Text = v.num .. " "
        ui.card_cost_3.Text = v.num .. " "
      end
      if v.currency == 3 then
        ui.card_cost_2.Text = v.num .. " "
        ui.card_cost_4.Text = v.num .. " "
      end
    end
  end
  ui.price_tip_1.Text = tonumber(ui.card_cost_1.Text)
  ui.price_tip_2.Text = tonumber(ui.card_cost_2.Text)
  postureList = data.list
  postureBegin = 1
  postureCurr = 1
  ag:UpdateStaticCardByVan(1, postureList[1].position)
  SelCurrPosBtn()
  SetPosPageEnable()
  local tmax = math.min(8, #postureList)
  SetPostrueIcon(postureBegin, tmax)
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local RecoverLayerButton, ClearAvatarSelf = function()
  for i = 1, 3 do
    for j = 1, 8 do
      ui["btn_layer_" .. i .. "_" .. j].Location = Vector2(0, -58 + ui["btn_layer_" .. i .. "_" .. j].ID * 58)
      ui["btn_layer_" .. i .. "_" .. j].LayerCurrent = ui["btn_layer_" .. i .. "_" .. j].ID - 1
    end
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ClearAvatarSelf, ClearAllInfo = function()
  local info = ag:GetVanInfo()
  info:ClearPartString()
  ag:UpdateVanByInfoString()
  ag:SetBaseColor(Vector4(0.7, 0.7, 0.7, 1), 0)
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local ClearAllInfo, SaveSuit = function()
  mainCurrentBtn = 0
  headCurrentBtn = 0
  currentPart = 0
  selectPersonId = -1
  curCardSlot = 0
  curCardPage = 0
  for i = 1, 18 do
    partBtnClickedNo[i] = 0
    partBtnClickedPage[i] = 1
    partColorMsg[i] = {}
  end
  ui.Colc.Visible = false
  ui.delete_card.Enable = false
  isHeadFirst = true
  isEidtFirst = true
  ReInitalData()
  InitLayerData()
  HideEditBtn()
  CleanLayers()
  RecoverLayerButton()
  ClearAvatarSelf()
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SaveSuit, DeleteSuit = function()
  gui:PlayAudio("buy")
  ag:UpdateVanInfo()
  local info = ag:GetVanInfo()
  local skinstr = ComFuc.GetDressInfo(info.skin_info, -1, 1)
  local Count = info:GetDressInfoArrCount()
  local dressstrArr = {}
  for k = 1, 5 do
    dressstrArr[k] = "{"
    for i = 1, Count do
      local singleDressInfoStruct = info:GetDressInfoByID(i - 1)
      if singleDressInfoStruct.part_id == k + 8 then
        dressstrArr[k] = dressstrArr[k] .. ComFuc.GetDressInfo(singleDressInfoStruct, i - 1, k + 8) .. ","
      end
    end
    dressstrArr[k] = dressstrArr[k] .. "}"
  end
  local mouthstr = ""
  local nosestr = ""
  local eyestr = ""
  local leye, reye
  Count = info:GetFaceAnimInfoArrCount()
  for i = 1, Count do
    local faceinfoX = info:GetFaceAnimInfoByID(i - 1)
    if faceinfoX.part_id == 3 then
      mouthstr = ComFuc.GetFaceAnimInfo(faceinfoX)
    elseif faceinfoX.part_id == 4 then
      nosestr = ComFuc.GetFaceAnimInfo(faceinfoX)
    elseif faceinfoX.part_name == "eye_l" then
      leye = faceinfoX
    elseif faceinfoX.part_name == "eye_r" then
      reye = faceinfoX
    end
  end
  if leye.tex_res_name == "onecolor_a" then
    eyestr = "{}"
  else
    eyestr = string.format("{'%s',2,%g,%g,%g,%g,%g,%g,%g,%g,%g,%g,%s}", leye.tex_res_name, leye.translate_x, leye.translate_y, leye.theta, leye.scale_x, leye.scale_y, reye.translate_x, reye.translate_y, reye.theta, reye.scale_x, reye.scale_y, ComFuc.GetChannelInfoStr(leye))
  end
  local earstr, beardstr, hairstr, helmetstr
  Count = info:GetHeadPartTrinketInfoArrCount()
  for i = 1, Count do
    local spartinfo = info:GetHeadPartTrinketByID(i - 1)
    local strtemp = ComFuc.GetSpartInfo(spartinfo)
    if spartinfo.part_id == 6 then
      beardstr = strtemp
    elseif spartinfo.part_id == 7 then
      hairstr = strtemp
    elseif spartinfo.part_id == 8 then
      helmetstr = strtemp
    end
  end
  earstr = ComFuc.GetEarInfo(info.ear_info)
  beardstr = beardstr or "{}"
  hairstr = hairstr or "{}"
  helmetstr = helmetstr or "{}"
  local decalstr = "{"
  Count = info:GetDecalInfoArrCount()
  for i = 1, Count do
    decalstr = decalstr .. ComFuc.GetDecalInfo(info:GetDecalInfoByID(i - 1)) .. ","
  end
  decalstr = decalstr .. "}"
  local mpartstr = "{"
  Count = info:GetMTrinketInfoArrCount()
  for i = 1, Count do
    mpartstr = mpartstr .. ComFuc.GetMTrinketInfo(info:GetMTrinketByID(i - 1)) .. ","
  end
  mpartstr = mpartstr .. "}"
  immobilestr = ComFuc.GetImmovealbeHeadUpDown(info, 16)
  immobileUpstr = ComFuc.GetImmovealbeHeadUpDown(info, 17)
  immobileDownstr = ComFuc.GetImmovealbeHeadUpDown(info, 18)
  local state = ptr_cast(game.CurrentState, "Client.StateAvatar")
  partIdList = ""
  for i = 1, 8 do
    if tonumber(singleId[i]) ~= 0 then
      partIdList = partIdList .. ComFuc.NumToStr(i) .. "=" .. ComFuc.NumToStr(singleId[i]) .. ";"
    end
  end
  local dressStrID = {
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    }
  }
  local decalStrID = {
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1
  }
  local trinketStrID = {
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    },
    {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    }
  }
  for i = 1, 3 do
    for j = 1, 8 do
      if ui["btn_layer_" .. i .. "_" .. j].DeleteButton.Visible then
        if i == 1 then
          dressStrID[ui["btn_layer_" .. i .. "_" .. j].TabpadIndex][ui["btn_layer_" .. i .. "_" .. j].LayerCurrent + 1] = layerId[i][j]
        end
        if i == 2 then
          decalStrID[ui["btn_layer_" .. i .. "_" .. j].LayerCurrent + 1] = layerId[i][j]
        end
        if i == 3 then
          trinketStrID[ui["btn_layer_" .. i .. "_" .. j].TabpadIndex][ui["btn_layer_" .. i .. "_" .. j].LayerCurrent + 1] = layerId[i][j]
        end
      end
    end
  end
  local testK1 = 0
  for i = 1, 5 do
    for j, v in ipairs(dressStrID[i]) do
      if tonumber(v) > 0 then
        if testK1 == 0 then
          partIdList = partIdList .. ComFuc.NumToStr(i + 8) .. "=" .. ComFuc.NumToStr(v)
        else
          partIdList = partIdList .. "," .. ComFuc.NumToStr(v)
        end
        testK1 = testK1 + 1
      end
    end
    if 0 < testK1 then
      testK1 = 0
      partIdList = partIdList .. ";"
    end
  end
  for j, v in ipairs(decalStrID) do
    if tonumber(v) > 0 then
      if testK1 == 0 then
        partIdList = partIdList .. ComFuc.NumToStr(14) .. "=" .. ComFuc.NumToStr(v)
      else
        partIdList = partIdList .. "," .. ComFuc.NumToStr(v)
      end
      testK1 = testK1 + 1
    end
  end
  if 0 < testK1 then
    testK1 = 0
    partIdList = partIdList .. ";"
  end
  for i = 1, 4 do
    for j, v in ipairs(trinketStrID[i]) do
      if tonumber(v) > 0 then
        if testK1 == 0 then
          partIdList = partIdList .. ComFuc.NumToStr(i + 14) .. "=" .. ComFuc.NumToStr(v)
        else
          partIdList = partIdList .. "," .. ComFuc.NumToStr(v)
        end
        testK1 = testK1 + 1
      end
    end
    if 0 < testK1 then
      testK1 = 0
      partIdList = partIdList .. ";"
    end
  end
  local isInputName = 0
  local tnct = ui.nameCard.Text
  if ui.nameCard.Text == GetUTF8Text("UI_common_Enter_Card_Name") or ui.nameCard.Text == "" then
    tnct, n = string.gsub(GetUTF8Text("msgbox_common_conditionkey_155"), "{" .. tostring(0) .. "}", SelectCharacter.role_text)
    isInputName = ""
  end
  local costType = 2
  if ui.sel_cost_2.Check then
    costType = 3
  end
  if not partIdList or partIdList == "" or partIdList == " " then
    MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1354"))
  else
    rpc.safecall("player_avatar_save", {
      isEmptyName = isInputName,
      currency = costType,
      ids = partIdList,
      buy = isSuitBuy,
      name = tnct,
      avatarId = selectPersonId,
      poseId = postureList[postureBegin + postureCurr - 1].poseId,
      skin = skinstr,
      eye = eyestr,
      mouth = mouthstr,
      nose = nosestr,
      ear = earstr,
      beard = beardstr,
      hair = hairstr,
      helmet = helmetstr,
      underwear = dressstrArr[1],
      outerwear = dressstrArr[2],
      trousers = dressstrArr[3],
      glove = dressstrArr[4],
      shoes = dressstrArr[5],
      decal = decalstr,
      movable = mpartstr,
      immobile = immobilestr,
      immobileUp = immobileUpstr,
      immobileDown = immobileDownstr
    }, function(data)
      if not data.error then
        ClearAllInfo()
        ShowCreatePersonCard()
        ShowPersonCard(1)
        ShowPersonInfoCard()
      end
    end)
  end
  if bit.band(64, ComFuc.leadList) == 64 then
    ComFuc.SetOneLeadFinish(64)
  end
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local DeleteSuit, AddOneLayer = function(i)
  if isAllDelte == "N" then
    rpc.safecall("storage_remove", {
      t = 6,
      p = curCardPage,
      s = 6,
      slot = curCardSlot - 1,
      pid = selectPersonId
    }, nil)
  else
    rpc.safecall("player_dream_avatar_delete", {all = "Y"}, nil)
  end
  ClearAllInfo()
  ShowPersonCard(ui.card_page.CurrIndex)
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local AddOneLayer, SelMainBtn = function()
  local tC = 0
  ag:SetLookAtBody()
  if isClicked then
    isClicked = false
    tC = currentPart
    if isAdd then
      isAdd = false
    elseif isEdit then
      isEdit = false
      if tonumber(tempId) == 0 then
        SetTempMsg(editId)
      end
    end
    SetSure(tempI, tempJ)
  else
    if isAdd then
      isAdd = false
    elseif isEdit then
      isEdit = false
      SetLayerMsg(tempI, tempJ, 0)
    end
    ui["btn_layer_" .. tempI .. "_" .. tempJ].EditButton.Text = GetUTF8Text("button_common_Add")
    ui["btn_layer_" .. tempI .. "_" .. tempJ].DeleteButton.Visible = false
    ui["btn_layer_" .. tempI .. "_" .. tempJ].IconStamp.Visible = true
    ui["btn_layer_" .. tempI .. "_" .. tempJ].IconShow.Visible = false
    layerAddOrEdit[tempI][tempJ] = 0
  end
  GoShowLayer(mainCurrentBtn)
  local tPA = ""
  if tC == 10 then
    local t1 = {"coat", "ic-coat-ic"}
    local t2 = math.random(2)
    tPA = t1[t2]
  elseif tC == 11 then
    local t1 = {
      "ib-pants-ib",
      "pants"
    }
    local t2 = math.random(2)
    tPA = t1[t2]
  elseif tC == 12 then
    tPA = "gloves_b"
  elseif tC == 13 then
    local t1 = {
      "ib-shoes-ib",
      "shoesc"
    }
    local t2 = math.random(2)
    tPA = t1[t2]
  elseif tC == 14 then
    ag:SetIdleAnimation("idlea")
    local t1 = {"decal_a", "decal_b"}
    local t2 = math.random(2)
    tPA = t1[t2]
  elseif tC == 15 then
    tPA = "trinket"
  elseif tC == 16 then
    tPA = "trinket_head"
  elseif tC == 17 then
    tPA = "trinket_coat"
  elseif tC == 18 then
    tPA = "trinket_pants"
  end
  ag:PlayAnim(tPA, false)
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)
local SelMainBtn, DealPesonalCardEdit = function(i)
  if 2 == i then
    ag:SetLookAtHead()
  else
    ag:SetLookAtBody()
  end
  local kcb = mainCurrentBtn
  if mainCurrentBtn ~= i then
    HideEditBtn()
    if 2 < mainCurrentBtn then
      if not ui.btn_cre_sur.Enable then
        AddOneLayer(0)
      end
      ui["main_top_" .. mainCurrentBtn - 2].Parent = nil
    end
    ui.btn_cre_sur.Enable = true
    mainCurrentBtn = i
    if i <= 2 then
      if i == 1 then
        currentPart = 1
        SetCurrAvatarPart()
      elseif isHeadFirst then
        isHeadFirst = false
        SetHeadTabpad(1)
      else
        currentPart = headCurrentBtn + 1
        SetCurrAvatarPart()
      end
    else
      GoShowLayer(mainCurrentBtn)
    end
  end
  for j = 1, 5 do
    if j == i then
      ui["btn_main_" .. j].PushDown = true
      if kcb ~= i then
        if j <= 2 then
          ui.main_layer_content.Parent = nil
          ui["main_top_" .. j].Parent = ui.page_btnCont
          ui.main_page_content.Parent = ui.main_edit
          ui.cp_cont.Parent = ui.main_edit
        else
          local t = j - 2
          ui["layer_top_" .. t].Parent = ui.main_layer_content
          ui["layer_cont_" .. t].Parent = ui.main_layer_content
          ui.main_layer_content.Parent = ui.main_edit
          ui.main_page_content.Parent = nil
          ui.cp_cont.Parent = nil
        end
      end
    else
      ui["btn_main_" .. j].PushDown = false
      ui["main_top_" .. j].Parent = nil
      if 2 < j then
        local t = j - 2
        ui["layer_top_" .. t].Parent = nil
        ui["layer_cont_" .. t].Parent = nil
      end
    end
  end
  for j = 1, 5 do
    if j ~= i then
      ui["btn_main_" .. j].Parent = ui.main_edit
    end
  end
  ui["btn_main_" .. i].Parent = ui.main_edit
end, ComFuc.ComControl("strawControl", Vector2(32, 32), Vector2(0, 0), 255, SkinF.avatar_main_044)

function DealPesonalCardEdit(data)
  idsList = nil
  if data.ids then
    idsList = data.ids
    if idsList.skin then
      SetPartColorMsg(1, idsList.skin[1], data.skin, 4)
    end
    if idsList.eye then
      SetPartColorMsg(2, idsList.eye[1], data.eye, 13)
    end
    if idsList.mouth then
      SetPartColorMsg(3, idsList.mouth[1], data.mouth, 8)
    end
    if idsList.nose then
      SetPartColorMsg(4, idsList.nose[1], data.nose, 8)
    end
    if idsList.ear then
      SetPartColorMsg(5, idsList.ear[1], data.ear, 31)
    end
    if idsList.beard then
      SetPartColorMsg(6, idsList.beard[1], data.beard, 4)
    end
    if idsList.hair then
      SetPartColorMsg(7, idsList.hair[1], data.hair, 4)
    end
    if idsList.helmet then
      SetPartColorMsg(8, idsList.helmet[1], data.helmet, 4)
    end
    if idsList.underwear then
      partColorMsg[9][1] = col0
      partColorMsg[9][2] = col0
      partColorMsg[9][3] = col0
      for i, v in ipairs(idsList.underwear) do
        local t = data.underwear[i][3] + 1
        ui["btn_layer_1_" .. t].TabpadIndex = 1
        SetLayerColorMsg(1, t, v, data.underwear[i], 4)
      end
    end
    if idsList.outerwear then
      partColorMsg[10][1] = col0
      partColorMsg[10][2] = col0
      partColorMsg[10][3] = col0
      for i, v in ipairs(idsList.outerwear) do
        local t = data.outerwear[i][3] + 1
        ui["btn_layer_1_" .. t].TabpadIndex = 2
        SetLayerColorMsg(1, t, v, data.outerwear[i], 4)
      end
    end
    if idsList.trousers then
      partColorMsg[11][1] = col0
      partColorMsg[11][2] = col0
      partColorMsg[11][3] = col0
      for i, v in ipairs(idsList.trousers) do
        local t = data.trousers[i][3] + 1
        ui["btn_layer_1_" .. t].TabpadIndex = 3
        SetLayerColorMsg(1, t, v, data.trousers[i], 4)
      end
    end
    if idsList.glove then
      partColorMsg[12][1] = col0
      partColorMsg[12][2] = col0
      partColorMsg[12][3] = col0
      for i, v in ipairs(idsList.glove) do
        local t = data.glove[i][3] + 1
        ui["btn_layer_1_" .. t].TabpadIndex = 4
        SetLayerColorMsg(1, t, v, data.glove[i], 4)
      end
    end
    if idsList.shoes then
      partColorMsg[13][1] = col0
      partColorMsg[13][2] = col0
      partColorMsg[13][3] = col0
      for i, v in ipairs(idsList.shoes) do
        local t = data.shoes[i][3] + 1
        ui["btn_layer_1_" .. t].TabpadIndex = 5
        SetLayerColorMsg(1, t, v, data.shoes[i], 4)
      end
    end
    if idsList.decal then
      partColorMsg[14][1] = col0
      partColorMsg[14][2] = col0
      partColorMsg[14][3] = col0
      for i, v in ipairs(idsList.decal) do
        SetLayerColorMsg(2, i, v, data.decal[i], 20)
      end
    end
    if idsList.movable then
      partColorMsg[15][1] = col0
      partColorMsg[15][2] = col0
      partColorMsg[15][3] = col0
      for i, v in ipairs(idsList.movable) do
        local t = data.movable[i][3] + 1
        ui["btn_layer_3_" .. t].TabpadIndex = 1
        SetLayerColorMsg(3, t, v, data.movable[i], 19)
      end
    end
    if idsList.immobile then
      partColorMsg[16][1] = col0
      partColorMsg[16][2] = col0
      partColorMsg[16][3] = col0
      for i, v in ipairs(idsList.immobile) do
        local t = data.immobile[i][3] + 1
        ui["btn_layer_3_" .. t].TabpadIndex = 2
        SetLayerColorMsg(3, t, v, data.immobile[i], 4)
      end
    end
    if idsList.immobile_up then
      partColorMsg[17][1] = col0
      partColorMsg[17][2] = col0
      partColorMsg[17][3] = col0
      for i, v in ipairs(idsList.immobile_up) do
        local t = data.immobileUp[i][3] + 1
        ui["btn_layer_3_" .. t].TabpadIndex = 3
        SetLayerColorMsg(3, t, v, data.immobileUp[i], 4)
      end
    end
    if idsList.immobile_down then
      partColorMsg[18][1] = col0
      partColorMsg[18][2] = col0
      partColorMsg[18][3] = col0
      for i, v in ipairs(idsList.immobile_down) do
        local t = data.immobileDown[i][3] + 1
        ui["btn_layer_3_" .. t].TabpadIndex = 4
        SetLayerColorMsg(3, t, v, data.immobileDown[i], 4)
      end
    end
  end
  SelMainBtn(1)
end

for i = 1, 5 do
  ui["btn_main_" .. i].EventClick = function(sender, e)
    SelMainBtn(i)
    if NewLead.leadVisible then
      NewLead.HideLead()
    end
  end
end
for i = 1, 7 do
  ui["btn_head_" .. i].EventClick = function(sender, e)
    SetHeadTabpad(i)
  end
end
for i = 1, 5 do
  ui["btn_dress_" .. i].EventClick = function(sender, e)
    SetDressTabpad(i)
  end
end
for i = 1, 4 do
  ui["btn_trinket_" .. i].EventClick = function(sender, e)
    SetTrinketTabpad(i)
  end
end
for i = 1, 15 do
  ui["avatar_b_" .. i].EventClick = function(sender, e)
    if i + 15 * (partBtnClickedPage[currentPart] - 1) == partBtnClickedNo[currentPart] then
      ManageBtn2Click()
    else
      ManageBtnClick(i)
    end
    if NewLead.leadVisible then
      NewLead.HideLead()
    end
  end
end
for i = 1, 3 do
  ui["btn_mrs_" .. i].EventClick = function(sender, e)
    set_edit_state(i)
  end
end
for i = 1, 3 do
  for j = 1, 8 do
    ui["btn_layer_" .. i .. "_" .. j].DeleteButton.Text = GetUTF8Text("button_common_Delete")
  end
end
for i = 1, 3 do
  for j = 1, 8 do
    ui["btn_layer_" .. i .. "_" .. j].EventItemChanged = function(sender, e)
      local k = sender.LayerCurrent
      if sender.DeltaM > 0 then
        for m = 1, 8 do
          local k2 = ui["btn_layer_" .. i .. "_" .. m].LayerCurrent
          if k < k2 and k2 <= k + sender.DeltaM then
            ui["btn_layer_" .. i .. "_" .. m].LayerCurrent = k2 - 1
            ui["btn_layer_" .. i .. "_" .. m].Location = Vector2(0, 0 + (k2 - 1) * 58)
          end
        end
        sender.LayerCurrent = k + sender.DeltaM
      end
      if sender.DeltaM < 0 then
        for m = 1, 8 do
          local k2 = ui["btn_layer_" .. i .. "_" .. m].LayerCurrent
          if k2 >= k + sender.DeltaM and k > k2 then
            ui["btn_layer_" .. i .. "_" .. m].LayerCurrent = k2 + 1
            ui["btn_layer_" .. i .. "_" .. m].Location = Vector2(0, 0 + (k2 + 1) * 58)
          end
        end
        local m = math.max(k + sender.DeltaM, 0)
        sender.LayerCurrent = m
      end
    end
    ui["btn_layer_" .. i .. "_" .. j].EventMouseUp = function(sender, e)
      local k = sender.LayerCurrent
      sender.Skin = SkinF.avatar_main_074
      for m = 1, 8 do
        ui["btn_layer_" .. i .. "_" .. m].Location = Vector2(0, 0 + ui["btn_layer_" .. i .. "_" .. m].LayerCurrent * 58)
        ui["btn_layer_" .. i .. "_" .. m].NumberText.Text = ui["btn_layer_" .. i .. "_" .. m].LayerCurrent + 1
      end
      if sender.DeltaNL ~= 0 then
        ag:DragLayer(i, dragLayerCurrent, sender.DeltaNL)
      end
    end
    ui["btn_layer_" .. i .. "_" .. j].EventMouseDown = function(sender, e)
      dragLayerCurrent = sender.LayerCurrent
      sender.Skin = SkinF.avatar_main_075
    end
  end
end
for i = 1, 3 do
  for j = 1, 8 do
    ui["btn_layer_" .. i .. "_" .. j].EditButton.ClickAudio = "button_add"
    ui["btn_layer_" .. i .. "_" .. j].EditButton.EventClick = function()
      tempI = i
      tempJ = j
      SetTempMsg(0)
      layerCurrent = ui["btn_layer_" .. i .. "_" .. j].LayerCurrent
      GoSlectLayer(mainCurrentBtn)
      if layerAddOrEdit[i][j] == 0 then
        isAdd = true
        isClicked = false
        if i == 1 then
          for k = 9, 13 do
            partBtnClickedNo[k] = 0
            partBtnClickedPage[k] = 1
          end
          SetDressTabpad(2)
        elseif i == 2 then
          partBtnClickedNo[14] = 0
          partBtnClickedPage[14] = 1
          SetDecalTabpad()
        elseif i == 3 then
          for k = 15, 18 do
            partBtnClickedNo[k] = 0
            partBtnClickedPage[k] = 1
          end
          SetTrinketTabpad(1)
        end
      elseif layerAddOrEdit[i][j] == 1 then
        isEdit = true
        isClicked = true
        isEidtFirst = true
        tabpadIndex[i] = ui["btn_layer_" .. i .. "_" .. j].TabpadIndex
        if i == 1 then
          currentPart = tabpadIndex[1] + 8
          tempPart = currentPart
          for k = 9, 13 do
            if k == currentPart then
              partBtnClickedPage[k] = 1 + math.floor(partBtnClickedNo[k] / 15.001)
            else
              partBtnClickedNo[k] = 0
              partBtnClickedPage[k] = 1
            end
          end
          SetDressTabpad(tabpadIndex[1])
          ag:SaveDressData(layerCurrent)
        elseif i == 2 then
          tempPart = 14
          partBtnClickedPage[14] = 1 + math.floor(partBtnClickedNo[14] / 15.001)
          ag:SetDecalCurrEditIndex(layerCurrent)
          ag:SetCurrEditPart(0)
          SetDecalTabpad()
          ag:SaveDecalData(layerCurrent)
        elseif i == 3 then
          currentPart = tabpadIndex[3] + 14
          tempPart = currentPart
          for k = 15, 18 do
            if k == currentPart then
              partBtnClickedPage[k] = 1 + math.floor(partBtnClickedNo[k] / 15.001)
            else
              partBtnClickedNo[k] = 0
              partBtnClickedPage[k] = 1
            end
          end
          ag:SetCurrTrinketEditIndex(layerCurrent)
          SetTrinketTabpad(tabpadIndex[3])
          ag:SaveTrinketData(layerCurrent)
          ag:SetCurrEditPart(2)
        end
        editMsg[1] = currentPart
        editMsg[2] = {
          ui["btn_layer_" .. i .. "_" .. j].Color01,
          ui["btn_layer_" .. i .. "_" .. j].Color02,
          ui["btn_layer_" .. i .. "_" .. j].Color03
        }
        if currentPart == 14 or currentPart == 15 then
          ShowEditBtn()
        end
      end
    end
  end
end
for i = 1, 3 do
  for j = 1, 8 do
    ui["btn_layer_" .. i .. "_" .. j].DeleteButton.ClickAudio = "button_add"
    ui["btn_layer_" .. i .. "_" .. j].DeleteButton.EventClick = function(sender, e)
      sender.Visible = false
      ui["btn_layer_" .. i .. "_" .. j].IconStamp.Visible = true
      layerAddOrEdit[i][j] = 0
      SetLayerMsg(i, j, 0)
      ui["btn_layer_" .. i .. "_" .. j].EditButton.Text = GetUTF8Text("button_common_Add")
      ui["btn_layer_" .. i .. "_" .. j].IconShow.Visible = false
      layerCurrent = ui["btn_layer_" .. i .. "_" .. j].LayerCurrent
      if i == 1 then
        ag:DeleteCloth(layerCurrent)
      elseif i == 2 then
        ag:DeleteDecal(layerCurrent)
      else
        ag:DeleteTrinket(layerCurrent)
      end
    end
  end
end
for i = 2, 7 do
  ui["person_b_" .. i].EventClick = function(sender, e)
    SelPersonBtn(i)
  end
  ui["person_buy_" .. i].EventClick = function(sender, e)
    ShowInsertTip(i)
  end
  ui["person_edi_" .. i].EventClick = function(sender, e)
    ComFuc.DealAvatarEquipRoom(cardDt[i].avatar)
    rpc.safecall("player_avatar_edit", {
      avatarId = cardDt[i].pid
    }, DealPesonalCardEdit)
    ShowMainEdit()
  end
end
for i = 1, 8 do
  ui["posture_" .. i .. "_b"].EventClick = function(sender, e)
    if postureCurr ~= i then
      postureCurr = i
      SelCurrPosBtn()
      ag:UpdateStaticCardByVan(1, postureList[postureBegin + postureCurr - 1].position)
      ag:PlayPoseAnimation(postureList[postureBegin + postureCurr - 1].position)
    end
  end
end
for i = 1, 9 do
  ui["btn_m_" .. i].EventClick = function(sender, e)
    if i ~= 6 then
      if ui.main_edit.Parent or ui.finish_person_card.Parent then
        MessageBox.ShowWithConfirmCancel(GetUTF8Text("msgbox_common_num_1185"), function(sender, e)
          Lobby.GoLobby(i)
        end)
      else
        Lobby.GoLobby(i)
      end
    else
      sender.PushDown = true
    end
  end
end
for i = 1, 2 do
  ui["sel_cost_" .. i].EventCheckChanged = function(sender, e)
    if "kTriggerMouse" == e.Trigger then
      sender.Check = true
      ui["sel_cost_" .. 3 - i].Check = false
    end
  end
end
for i = 3, 4 do
  ui["sel_cost_" .. i].EventCheckChanged = function(sender, e)
    if "kTriggerMouse" == e.Trigger then
      sender.Check = true
      ui["sel_cost_" .. 7 - i].Check = false
    end
    if i == 3 then
      ui.insertTip_text.Text = string.format(GetUTF8Text("msgbox_common_num_1182"), tonumber(ui.card_cost_3.Text), GetUTF8Text("id_common_CC"))
    else
      ui.insertTip_text.Text = string.format(GetUTF8Text("msgbox_common_num_1182"), tonumber(ui.card_cost_4.Text), GetUTF8Text("id_common_Medal"))
    end
  end
end

function ui.Colc.CPicker.EventColorChanged(sender, e)
  local c_argb = ui.Colc.CPicker:GetColor()
  local color = Vector4(c_argb.r * reci, c_argb.g * reci, c_argb.b * reci, 1)
  partColorMsg[currentPart][ui.Colc.CurrentChannel + 1] = c_argb
  if currentPart == 1 then
    ag:SetBaseColor(color, ui.Colc.CurrentChannel)
  elseif 2 <= currentPart and currentPart <= 4 then
    ag:SetFaceColor(currentPart, color, ui.Colc.CurrentChannel)
  elseif currentPart == 5 then
    ag:SetEarColor(color, ui.Colc.CurrentChannel)
  elseif 6 <= currentPart and currentPart <= 8 then
    ag:SetHeadPartColor(g_part_name[currentPart], color, ui.Colc.CurrentChannel)
  elseif 9 <= currentPart and currentPart <= 13 then
    ag:SetClothColor(layerCurrent, color, ui.Colc.CurrentChannel)
  elseif currentPart == 14 then
    ag:SetDecalColor(layerCurrent, color, ui.Colc.CurrentChannel)
  elseif currentPart == 15 then
    ag:SetMoveableTrinketColor("MTrinket" .. layerCurrent, color, ui.Colc.CurrentChannel)
  elseif 16 <= currentPart and currentPart <= 18 then
    ag:SetImmovableTrinketColor("STrinket" .. layerCurrent, color, ui.Colc.CurrentChannel)
  end
end

function ui.pageBar.EventIndexChanged(sender, e)
  isPagebarClick = true
  partBtnClickedPage[currentPart] = ui.pageBar.CurrIndex
  SetCurrAvatarPart()
end

function ui.btn_pre_pos.EventClick(sender, e)
  ui.btn_next_pos.Enable = true
  postureBegin = postureBegin - 8
  postureCurr = postureCurr + 8
  SelCurrPosBtn()
  SetPosPageEnable()
  SetPostrueIcon(postureBegin, 8)
end

ui.btn_next_pos.Enable = false

function ui.btn_next_pos.EventClick(sender, e)
  ui.btn_pre_pos.Enable = false
  postureBegin = postureBegin + 8
  postureCurr = postureCurr - 8
  SelCurrPosBtn()
  SetPosPageEnable()
  local tmax = math.min(8, #postureList + 1 - postureBegin)
  SetPostrueIcon(postureBegin, tmax)
end

function ui.card_page.EventIndexChanged(sender, e)
  ShowPersonCard(ui.card_page.CurrIndex)
end

function ui.create_card.EventClick(sender, e)
  selectPersonId = -1
  ShowMainEdit()
  SelMainBtn(1)
  ClearAvatarSelf()
end

function ui.btn_return_create.EventClick(sender, e)
  ag:SetLookAtBody()
  ThreeCancel(mainCurrentBtn - 2)
  GoShowLayer(mainCurrentBtn)
end

function ui.btn_next.EventClick(sender, e)
  AddOneLayer()
end

function ui.btn_cre_cel.EventClick(sender, e)
  ag:SetLookAtBody()
  ClearAllInfo()
  ShowCreatePersonCard()
  ShowPersonCard(1)
  ag:PlayAnim("idlea", false)
end

function ui.btn_cre_sur.EventClick(sender, e)
  ag:SetLookAtBody()
  if 3 <= mainCurrentBtn then
    ThreeCancel(mainCurrentBtn - 2)
    GoShowLayer(mainCurrentBtn)
  end
  ShowFinishCard()
  if isShowEditBtn then
    HideEditBtn()
    isShowEditBtn = true
  end
  ag:UpdateStaticCardByVan(1)
  ag:SetIdleAnimation("idlea")
end

function ui.btn_pre.EventClick(sender, e)
  ShowMainEdit()
  if isShowEditBtn then
    ShowEditBtn()
  end
end

function ui.buy_card_2.EventClick(sender, e)
  isSuitBuy = "Y"
  NewLead.HideLead()
  if ui.sel_cost_1.Check then
    MessageBox.ShowWithConfirmCancel(string.format(GetUTF8Text("msgbox_common_num_1182"), tonumber(ui.card_cost_1.Text), GetUTF8Text("id_common_CC")), SaveSuit)
  else
    MessageBox.ShowWithConfirmCancel(string.format(GetUTF8Text("msgbox_common_num_1182"), tonumber(ui.card_cost_2.Text), GetUTF8Text("id_common_Medal")), SaveSuit)
  end
end

function ui.delete_card.EventClick(sender, e)
  if tonumber(selectPersonId) > 0 then
    isAllDelte = "N"
    MessageBox.ShowWithConfirmCancel(string.format(GetUTF8Text("msgbox_common_num_1184")), DeleteSuit)
  end
end

function ui.btn_ESC.EventClick(sender, e)
  if ESCPressed then
    ESCPressed()
  end
end

function ui.insertTip_buy.EventClick(sender, e)
  local costType = 2
  if ui.sel_cost_4.Check then
    costType = 3
  end
  rpc.safecall("player_dream_avatar_buy", {
    currency = costType,
    avatarId = cardDt[insertBuyIndex].pid
  }, function(data)
    if not data.error then
      gui:PlayAudio("buyavatar")
      ShowPersonInfoCard()
    end
    HideInsertTip()
  end)
end

function ui.insertTip_cha.EventClick(sender, e)
  HideInsertTip()
end

local ui.insertTip_canc.EventClick, MoveUiFromLobby = function(sender, e)
  HideInsertTip()
end, ui.insertTip_canc
local MoveUiFromLobby, RecoverUiToLooby = function()
  Lobby.ui.btn_money.Parent = ui.avatar_root
  Lobby.ui.btn_receive.Parent = ui.avatar_root
  Lobby.ui.btn_chatUnShow.Parent = ui.avatar_root
  Lobby.ui.btn_sign.Parent = ui.avatar_root
  Lobby.ui.btn_mail.Parent = ui.avatar_root
  Lobby.ui.btn_social.Parent = ui.avatar_root
  Lobby.ui.look_info.Parent = ui.avatar_root
  Lobby.ui.topHead.Parent = ui.avatar_root
  Lobby.ui.topHead_c.Parent = ui.avatar_root
  Lobby.ui.role_job.Parent = ui.avatar_root
  Lobby.ui.role_level.Parent = ui.avatar_root
  Lobby.ui.role_name.Parent = ui.avatar_root
  Lobby.ui.bar_exp.Parent = ui.avatar_root
  Lobby.ui.role_gbi.Parent = ui.avatar_root
  Lobby.ui.role_dianbi.Parent = ui.avatar_root
  Lobby.ui.role_mbi.Parent = ui.avatar_root
  Lobby.ui.lobby_btm.Parent = ui.avatar_root
  Lobby.ui.sys_pulic.Parent = ui.avatar_root
  Lobby.ui.buf_1.Parent = ui.avatar_root
  Lobby.ui.buf_2.Parent = ui.avatar_root
  Lobby.ui.buf_3.Parent = ui.avatar_root
  Lobby.ui.buf_4.Parent = ui.avatar_root
  Lobby.ui.gameLastT_p.Parent = ui.avatar_root
  Lobby.ui.btn_closeLT.Parent = ui.avatar_root
  Lobby.ui.mail_f.Parent = ui.avatar_root
  Lobby.ui.partc3.Parent = ui.avatar_root
end, "EventClick"

function RecoverUiToLooby()
  Lobby.ui.btn_money.Parent = Lobby.ui.lobby_root
  Lobby.ui.btn_receive.Parent = Lobby.ui.lobby_root
  Lobby.ui.btn_sign.Parent = Lobby.ui.lobby_root
  Lobby.ui.btn_chatUnShow.Parent = Lobby.ui.lobby_root
  Lobby.ui.btn_mail.Parent = Lobby.ui.lobby_root
  Lobby.ui.btn_social.Parent = Lobby.ui.lobby_root
  Lobby.ui.look_info.Parent = Lobby.ui.lobby_root
  Lobby.ui.topHead.Parent = Lobby.ui.lobby_root
  Lobby.ui.topHead_c.Parent = Lobby.ui.lobby_root
  Lobby.ui.role_job.Parent = Lobby.ui.lobby_root
  Lobby.ui.role_level.Parent = Lobby.ui.lobby_root
  Lobby.ui.role_name.Parent = Lobby.ui.lobby_root
  Lobby.ui.bar_exp.Parent = Lobby.ui.lobby_root
  Lobby.ui.role_gbi.Parent = Lobby.ui.lobby_root
  Lobby.ui.role_dianbi.Parent = Lobby.ui.lobby_root
  Lobby.ui.role_mbi.Parent = Lobby.ui.lobby_root
  Lobby.ui.lobby_btm.Parent = Lobby.ui.lobby_root
  Lobby.ui.sys_pulic.Parent = Lobby.ui.lobby_root
  Lobby.ui.buf_1.Parent = Lobby.ui.lobby_root
  Lobby.ui.buf_2.Parent = Lobby.ui.lobby_root
  Lobby.ui.buf_3.Parent = Lobby.ui.lobby_root
  Lobby.ui.buf_4.Parent = Lobby.ui.lobby_root
  Lobby.ui.gameLastT_p.Parent = Lobby.ui.lobby_root
  Lobby.ui.btn_closeLT.Parent = Lobby.ui.lobby_root
  Lobby.ui.mail_f.Parent = Lobby.ui.lobby_root
  Lobby.ui.partc3.Parent = Lobby.ui.lobby_root
end

function AlignUI()
  Gui.Align(ui.avatar_root_p, 0.5, 0.5)
  Gui.Align(ui.btn_finish, -160, -12)
end

function Show()
  if not Visible then
    local state = ptr_cast(game.CurrentState, "Client.StateAvatar")
    if not state then
      return
    end
    ComFuc.fromAToL = true
    isNeedShow = true
    ui.btn_m_2.PushDown = false
    ui.btn_m_1.PushDown = false
    ui.btn_m_3.PushDown = false
    ui.btn_m_5.PushDown = false
    ui.btn_m_4.PushDown = false
    ui.btn_m_6.PushDown = true
    ui.btn_m_7.PushDown = false
    ui.btn_m_8.PushDown = false
    ui.avatar_root_p.Parent = gui
    ui.btn_cre_sur.Enable = true
    Lobby.ui.down_light.Parent = gui
    Lobby.ui.down_light.Location = Lobby.ligLc[6] + Vector2(ComFuc.locationChanged, 0)
    rpc.safecall("sys_avatar_pose_list", nil, DealPoseList)
    Lobby.ui.partc3.Visible = true
    ChatBar.Show(Lobby.ui.lobby_btm)
    MoveUiFromLobby()
    ClearAllInfo()
    ShowPersonCard(1)
    ShowCreatePersonCard()
    AlignUI()
    Visible = true
    if Lobby.buf_end_time[5] and 0 < Lobby.buf_end_time[5] then
      if timer then
        TimerRemove()
      end
      timer = game.TimerMgr:AddTimer(1)
      timer.EventOnTimer = Lobby.TimerRefresh
    end
    if Lobby.ui.btn_m_8_c.IsGo and Lobby.ui.btn_m_8_c.IsBegin then
      ui.btn_m_8_c.IsGo = true
      ui.btn_m_8_c.IsBegin = true
    end
    if ui.btn_m_8_c.IsGo and ui.btn_m_8_c.IsBegin then
      if ComFuc.taskPart then
        gui:RemoveParticle(ComFuc.taskPart)
        ComFuc.taskPart = nil
      end
      ComFuc.taskPart = gui:AddParticle("ui_renwu_star", Vector2(557 + ComFuc.locationChanged - 75, 114), Vector3(0, 1, 0))
    end
  end
  Lobby.SetNewMail()
end

function Hide()
  Visible = false
  ClearAllInfo()
  RecoverUiToLooby()
  ui.avatar_root_p.Parent = nil
  Sociality.Hide()
  Mail.Hide()
  ChatBar.Hide()
  Lobby.ui.partc3.Visible = false
  local state = ptr_cast(game.CurrentState, "Client.StateAvatar")
  if state then
    state.EventLeave = nil
  end
  if ComFuc.taskPart then
    gui:RemoveParticle(ComFuc.taskPart)
    ComFuc.taskPart = nil
  end
  if timer then
    game.TimerMgr:RemoveTimer(timer)
    timer = nil
  end
end

Visible = false
