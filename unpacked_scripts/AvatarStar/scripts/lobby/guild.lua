module("Guild", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
colh = ARGB(128, 255, 255, 255)
colt = ARGB(255, 113, 83, 65)
cols = ARGB(255, 62, 26, 1)
colv = ARGB(255, 176, 53, 2)
local resDir = "/ui/skinF/lobby/"
local classText = {
  "\187\225\179\164",
  "\185\217\212\177",
  "\190\171\211\162",
  "\208\194\177\248"
}
local curMainBtn = 0
local curMemb = 0
local timer
local sysIcon = {}
local temIcon = {}
local memDt
local temDt = 0
local iconCost = 50
local allPermission = {}
local isOnline, MemberList = "N", nil
local MemberList, ItemSeqBtn = function(i)
  return Gui.Control({
    Size = Vector2(533, 41),
    Location = Vector2(0, -6 + 42 * i),
    BackgroundColor = colh,
    Skin = SkinF.guild_021,
    Gui.LcButton("mb_" .. i)({
      Style = "Gui.Button",
      Size = Vector2(533, 41),
      CanPushDown = true,
      Skin = SkinF.guild_020[1],
      ComFuc.ComControl("mb_1_" .. i, Vector2(31, 31), Vector2(15, 4), 255, SkinF.personalInfo_job[i % 3 + 1]),
      ComFuc.ComLabel("mb_2_" .. i, nil, Vector2(199, 35), Vector2(76, 0), 0, 16, colt, "kAlignLeftMiddle"),
      ComFuc.ComLabel("mb_3_" .. i, nil, Vector2(79, 35), Vector2(275, 0), 0, 16, colt, "kAlignLeftMiddle"),
      ComFuc.ComLabel("mb_4_" .. i, nil, Vector2(86, 35), Vector2(354, 0), 0, 16, colt, "kAlignLeftMiddle"),
      ComFuc.ComLabel("mb_5_" .. i, nil, Vector2(93, 35), Vector2(440, 0), 0, 16, colt, "kAlignLeftMiddle")
    })
  })
end, nil

function ItemSeqBtn(i, text, size, lc, skin, align)
  return Gui.Button("membl_" .. i)({
    Size = size,
    Location = lc,
    Text = text,
    Skin = SkinF.guild_023,
    TextAlign = "kAlignLeftMiddle",
    CanPushDown = true,
    TextColor = colw,
    HighlightTextColor = colw,
    ComFuc.ComControl("dir" .. i, Vector2(20, 29), Vector2(size.x - 22, 1), 255, SkinF.guild_022[1])
  })
end

ui = Gui.Create()({
  ComFuc.ComControl("main", Vector2(1142, 700), Vector2(0, 0)),
  Gui.Control("init_guild")({
    Size = Vector2(1142, 694),
    ComFuc.ComControl(nil, Vector2(1128, 645), Vector2(7, 45), 255, SkinF.guild_025),
    ComFuc.MainTabBtn("btn_info_p", "\185\171\187\225\208\197\207\162", Vector2(28, 5)),
    ComFuc.MainTabBtn("btn_build_p", "\185\171\187\225\189\168\201\232", Vector2(238, 5)),
    Gui.Control({
      Size = Vector2(560, 492),
      Location = Vector2(291, 104),
      BackgroundColor = colw,
      Skin = SkinF.skin_playgame_030,
      ComFuc.ComLabel(nil, "\180\180\189\168\185\171\187\225", Vector2(549, 27), Vector2(16, 3), 0, 16, colw),
      Gui.Control({
        Size = Vector2(540, 117),
        Location = Vector2(10, 48),
        BackgroundColor = colw,
        Skin = SkinF.skin_playgame_033,
        ComFuc.ComLabel(nil, "\185\171\187\225\195\251\179\198", Vector2(68, 18), Vector2(236, 13), 0, 16, colt),
        ComFuc.ComLabel(nil, "\199\235\202\228\200\2351\161\17114\184\246\215\214\183\251", Vector2(144, 18), Vector2(193, 34), 0, 16, colv),
        ComFuc.ComTextBox("init_name", nil, Vector2(306, 34), Vector2(117, 63), 14)
      }),
      Gui.Control({
        Size = Vector2(268, 254),
        Location = Vector2(10, 170),
        BackgroundColor = colw,
        Skin = SkinF.skin_playgame_033,
        ComFuc.ComLabel(nil, "\185\171\187\225\177\234\214\190", Vector2(78, 18), Vector2(100, 13), 0, 16, colt),
        ComFuc.ComLabel(nil, "\209\161\212\241\185\171\187\225\177\234\214\190", Vector2(154, 18), Vector2(85, 34), 0, 16, colv),
        ComFuc.ComControl(nil, Vector2(140, 145), Vector2(64, 58), 255, SkinF.guild_019),
        ComFuc.ComControl("init_ph_pre", Vector2(128, 128), Vector2(70, 64), 255, SkinF.guild_026),
        ComFuc.ComControl("init_photo", Vector2(128, 128), Vector2(70, 64), 0),
        ComFuc.ComButton("btn_selIcon", "\209\161\212\241\177\234\214\190", Vector2(84, 40), Vector2(92, 206), 16, false, true)
      }),
      Gui.Control({
        Size = Vector2(268, 254),
        Location = Vector2(282, 170),
        BackgroundColor = colw,
        Skin = SkinF.skin_playgame_033,
        ComFuc.ComLabel(nil, "\185\171\187\225\208\251\209\212", Vector2(78, 18), Vector2(100, 13), 0, 16, colt),
        ComFuc.ComLabel(nil, "\199\235\202\228\200\2350\161\17150\184\246\215\214\183\251", Vector2(154, 18), Vector2(62, 34), 0, 16, colv),
        ComFuc.ComTextArea("guild_dela_1", Vector2(190, 184), Vector2(39, 58), 16, colw, 50)
      }),
      ComFuc.ComLabel(nil, "\180\180\189\168\185\171\187\225\208\232\210\170\207\251\186\19610000\189\240\177\210", Vector2(300, 20), Vector2(20, 445), 0, 16, colv),
      ComFuc.ComButton("btn_finish", "\180\180  \189\168", Vector2(122, 43), Vector2(418, 435), 16, false, true)
    })
  }),
  Gui.Control("main_guild")({
    Size = Vector2(1142, 694),
    ComFuc.ComControl(nil, Vector2(1128, 645), Vector2(7, 45), 255, SkinF.personalInfo_098),
    ComFuc.MainTabBtn("btn_main_1", "\185\171\187\225\208\197\207\162", Vector2(28, 5)),
    ComFuc.MainTabBtn("btn_main_2", "\185\171\187\225\189\168\201\232", Vector2(238, 5))
  }),
  Gui.Control("info_guild")({
    Size = Vector2(1136, 651),
    Location = Vector2(3, 42),
    Gui.Control({
      Size = Vector2(508, 291),
      Location = Vector2(17, 18),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComControl(nil, Vector2(140, 145), Vector2(12, 48), 255, SkinF.guild_019),
      ComFuc.ComControl("info_photo", Vector2(128, 128), Vector2(18, 54), 0),
      ComFuc.ComLabel(nil, "   \187\249\177\190\208\197\207\162", Vector2(498, 21), Vector2(5, 5), 0, 16, colw),
      ComFuc.ComLabel("info_name", nil, Vector2(312, 20), Vector2(166, 58), 0, 16, colt),
      ComFuc.ComLabel("info_leader", nil, Vector2(312, 20), Vector2(166, 90), 0, 16, colt),
      ComFuc.ComLabel("info_level", nil, Vector2(312, 20), Vector2(166, 122), 0, 16, colt),
      ComFuc.ComLabel("dela_text", nil, Vector2(304, 60), Vector2(177, 154), 0, 16, colt),
      ComFuc.ComProportionBar("info_levelBar", Vector2(273, 23), Vector2(166, 154), 100, 60),
      ComFuc.ComButton("btn_icon", "\184\252\184\196\187\225\177\234", Vector2(84, 40), Vector2(12, 239), 16, false, true),
      ComFuc.ComButton("btn_get", "\193\236\200\161\177\219\213\194", Vector2(84, 40), Vector2(100, 239), 16, false, true),
      ComFuc.ComButton("btn_dela", "\208\222\184\196\208\251\209\212", Vector2(84, 40), Vector2(188, 239), 16, false, true)
    }),
    Gui.Control({
      Size = Vector2(508, 322),
      Location = Vector2(17, 315),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, "   \185\171\184\230", Vector2(498, 21), Vector2(5, 5), 0, 16, colw),
      ComFuc.ComTextArea("info_dela", Vector2(490, 219), Vector2(9, 44), 16, colw, 300),
      ComFuc.ComButton("btn_change", "\208\222\184\196\185\171\184\230", Vector2(84, 40), Vector2(12, 270), 16, false, true)
    }),
    Gui.Control({
      Size = Vector2(592, 619),
      Location = Vector2(529, 18),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_206,
      ComFuc.ComLabel(nil, "   \185\171\187\225\179\201\212\177", Vector2(582, 21), Vector2(5, 5), 0, 16, colw),
      ComFuc.ComButton("btn_quit", "\205\203\179\246\185\171\187\225", Vector2(84, 40), Vector2(12, 567), 16, false, true),
      ComFuc.ComButton("btn_invite", "\209\251\199\235\187\225\212\177", Vector2(84, 40), Vector2(410, 567), 16, false, true),
      ComFuc.ComButton("btn_powerSet", "\200\168\207\222\201\232\214\195", Vector2(84, 40), Vector2(500, 567), 16, false, true),
      ComFuc.ComCheckBox("showOnlyOnline", "\214\187\207\212\202\190\212\218\207\223\205\230\188\210", Vector2(150, 29), Vector2(251, 571), 16, colt),
      Gui.ScrollableControl({
        Size = Vector2(566, 498),
        Location = Vector2(14, 48),
        HScrollBarDisplay = "kHide",
        VScrollBarDisplay = "kVisible",
        VScrollBarWidth = 22,
        AutoScroll = true,
        AutoSize = true,
        AutoScrollMinSize = Vector2(566, 498),
        Gui.Control("member_list")({
          Size = Vector2(566, 498),
          ComFuc.ComComplex(MemberList, 1, 50)
        })
      }),
      Gui.Control({
        Size = Vector2(533, 35),
        Location = Vector2(14, 48),
        ItemSeqBtn(1, "   \214\176\210\181", Vector2(76, 32), Vector2(0, 0)),
        ItemSeqBtn(2, "  \208\213\195\251", Vector2(199, 32), Vector2(76, 0)),
        ItemSeqBtn(3, "  \181\200\188\182", Vector2(79, 32), Vector2(275, 0)),
        ItemSeqBtn(4, "  \185\177\207\215\182\200", Vector2(86, 32), Vector2(354, 0)),
        ItemSeqBtn(5, "  \187\225\189\215", Vector2(93, 32), Vector2(440, 0))
      })
    })
  }),
  Gui.Control("build_guild")({
    Size = Vector2(1136, 651),
    Location = Vector2(3, 42)
  }),
  Gui.Control("set_guild_m")({
    Dock = "kDockFill",
    ComFuc.ComControl(nil, Vector2(510, 210), Vector2(12, 0), 255, SkinF.battle_005),
    ComFuc.ComLabel(nil, "\181\247\213\251\187\225\189\215", Vector2(68, 17), Vector2(76, 23), 0, 16, cols),
    ComFuc.ComLabel(nil, "\208\222\184\196\185\171\184\230", Vector2(68, 17), Vector2(163, 23), 0, 16, cols),
    ComFuc.ComLabel(nil, "\204\222\179\253\187\225\212\177", Vector2(68, 17), Vector2(250, 23), 0, 16, cols),
    ComFuc.ComLabel(nil, "\209\251\199\235\187\225\212\177", Vector2(68, 17), Vector2(337, 23), 0, 16, cols),
    ComFuc.ComLabel(nil, "\201\232\202\169\206\172\187\164", Vector2(68, 17), Vector2(424, 23), 0, 16, cols),
    ComFuc.ComLabel(nil, "\185\217\212\177", Vector2(36, 17), Vector2(31, 64), 0, 16, cols),
    ComFuc.ComLabel(nil, "\190\171\211\162", Vector2(36, 17), Vector2(31, 113), 0, 16, cols),
    ComFuc.ComLabel(nil, "\208\194\177\248", Vector2(36, 17), Vector2(31, 162), 0, 16, cols),
    ComFuc.ComCheckBox("set_1_1", nil, Vector2(29, 29), Vector2(94, 58)),
    ComFuc.ComCheckBox("set_1_2", nil, Vector2(29, 29), Vector2(181, 58)),
    ComFuc.ComCheckBox("set_1_3", nil, Vector2(29, 29), Vector2(268, 58)),
    ComFuc.ComCheckBox("set_1_4", nil, Vector2(29, 29), Vector2(355, 58)),
    ComFuc.ComCheckBox("set_1_5", nil, Vector2(29, 29), Vector2(442, 58)),
    ComFuc.ComCheckBox("set_2_1", nil, Vector2(29, 29), Vector2(94, 107)),
    ComFuc.ComCheckBox("set_2_2", nil, Vector2(29, 29), Vector2(181, 107)),
    ComFuc.ComCheckBox("set_2_3", nil, Vector2(29, 29), Vector2(268, 107)),
    ComFuc.ComCheckBox("set_2_4", nil, Vector2(29, 29), Vector2(355, 107)),
    ComFuc.ComCheckBox("set_2_5", nil, Vector2(29, 29), Vector2(442, 107)),
    ComFuc.ComCheckBox("set_3_1", nil, Vector2(29, 29), Vector2(94, 156)),
    ComFuc.ComCheckBox("set_3_2", nil, Vector2(29, 29), Vector2(181, 156)),
    ComFuc.ComCheckBox("set_3_3", nil, Vector2(29, 29), Vector2(268, 156)),
    ComFuc.ComCheckBox("set_3_4", nil, Vector2(29, 29), Vector2(355, 156)),
    ComFuc.ComCheckBox("set_3_5", nil, Vector2(29, 29), Vector2(442, 156)),
    ComFuc.CancelBtn(Vector2(84, 40), Vector2(282, 215)),
    ComFuc.ComButton("btn_setSure", "\200\183 \182\168", Vector2(84, 40), Vector2(149, 215), 16)
  }),
  Gui.Control("search_guild_m")({
    Dock = "kDockFill",
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.battle_005,
    Margin = Vector4(7, 3, 7, 3),
    Gui.Control({
      Size = Vector2(0, 53),
      Dock = "kDockBottom",
      Margin = Vector4(0, 0, 0, 11),
      Gui.Pager("serarch_pageBar")({
        Size = Vector2(197, 43),
        Dock = "kDockTopCenter"
      })
    }),
    Gui.Control({
      Dock = "kDockFill",
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_068,
      Margin = Vector4(11, 11, 11, 11),
      Padding = Vector4(11, 11, 11, 11),
      Gui.ListTreeView("search_list")({
        Dock = "kDockFill",
        Style = "Sociality.FriendsList"
      })
    })
  }),
  Gui.Control("icon_guild_m")({
    Size = Vector2(562, 474),
    Gui.Control({
      Size = Vector2(546, 415),
      Location = Vector2(8, 0),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_131,
      ComFuc.ComGuildIconFlag("icon_1", Vector2(8, 8), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_2", Vector2(142, 8), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_3", Vector2(276, 8), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_4", Vector2(410, 8), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_5", Vector2(8, 141), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_6", Vector2(142, 141), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_7", Vector2(276, 141), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_8", Vector2(410, 141), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_9", Vector2(8, 274), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_10", Vector2(142, 274), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_11", Vector2(276, 274), Vector2(128, 128)),
      ComFuc.ComGuildIconFlag("icon_12", Vector2(410, 274), Vector2(128, 128))
    }),
    ComFuc.ComPagesBar("icon_pageBar", Vector2(107, 429)),
    ComFuc.CancelBtn(Vector2(84, 40), Vector2(469, 424)),
    ComFuc.ComButton("btn_iconBuy", "\185\186 \194\242", Vector2(84, 40), Vector2(8, 424), 16),
    ComFuc.ComButton("btn_iconSure", "\200\183 \182\168", Vector2(84, 40), Vector2(382, 424), 16)
  }),
  Gui.Control("dela_guild_m")({
    Size = Vector2(372, 214),
    Gui.Control({
      Size = Vector2(342, 164),
      Location = Vector2(15, 2),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.battle_005,
      ComFuc.ComLabel(nil, "\199\235\202\228\200\235\185\171\187\225\208\251\209\212", Vector2(300, 20), Vector2(24, 16), 0, 16, colt),
      ComFuc.ComTextArea("guild_dela_2", Vector2(292, 80), Vector2(24, 42), 16, colw, 50),
      ComFuc.ComLabel(nil, "\208\222\184\196\208\251\209\212\208\232\210\170\207\251\186\1965000\189\240\177\210", Vector2(300, 20), Vector2(24, 126), 0, 16, colv)
    }),
    ComFuc.ComButton("btn_delaSure", "\200\183 \182\168", Vector2(84, 40), Vector2(180, 170), 16),
    ComFuc.CancelBtn(Vector2(84, 40), Vector2(272, 170))
  }),
  ComFuc.ComMenu("menu_1"),
  ComFuc.ComMenu("menu_2"),
  ComFuc.ComMenu("menu_3"),
  ComFuc.PopControl("set_guild", Vector2(534, 314), "\200\168\207\222\201\232\214\195", 40),
  ComFuc.PopControl("search_guild", Vector2(372, 690), "\203\209\203\247\189\225\185\251", 30, 1),
  ComFuc.PopControl("icon_guild", Vector2(562, 524), "\184\252\184\196\187\225\177\234", 40),
  ComFuc.PopControl("dela_guild", Vector2(372, 264), "\208\222\184\196\208\251\209\212", 40)
})
ui.dela_text.Text = "\185\171\187\225\208\251\209\212\163\186"
ui.dela_text.AutoWrap = true
ui.info_levelBar.Visible = false
ui.guild_dela_1.Text = "\180\203\185\166\196\220\212\221\178\187\191\170\183\197\161\163"
ui.guild_dela_1.Enable = false
ui.btn_dela.Enable = false
ui.guild_dela_1.AllowEnter = false
ui.guild_dela_1.VScrollBarDisplay = false
ui.guild_dela_2.Text = "\183\162\177\237\196\227\181\196\184\246\208\212\185\171\187\225\208\251\209\212\176\201\163\161"
ui.guild_dela_2.AllowEnter = false
ui.guild_dela_2.VScrollBarDisplay = false
ui.btn_info_p.PushDown = true
ui.btn_build_p.Enable = false
ui.set_guild_m.Parent = ui.set_guild_son
ui.search_guild_m.Parent = ui.search_guild_son
ui.icon_guild_m.Parent = ui.icon_guild_son
local ui.dela_guild_m.Parent, SelOneClassBtn = ui.dela_guild_son, ui.dela_guild_m
local SelOneClassBtn, SelMemListHead = function(name, p, q, k)
  for i = p, q do
    if k == i then
      ui[name .. i].PushDown = true
    else
      ui[name .. i].PushDown = false
    end
  end
end, "Parent"
local SelMemListHead, ShowNoGuild = function(i)
  for k = 1, 5 do
    if k == i then
      ui["dir" .. k].Visible = true
      ui["dir" .. k].Skin = SkinF.guild_022[1]
    else
      ui["dir" .. k].Visible = false
    end
  end
end, ui.dela_guild_son
local ShowNoGuild, DealGuildShow = function()
  ui.init_name.Text = ""
  ui.init_photo.BackgroundColor = col0
  ui.init_ph_pre.Visible = true
  ui.init_guild.Parent = ui.main
  ui.main_guild.Parent = nil
end, "dela_guild_son"
local DealGuildShow, SelMainBC = function(data)
  if not data.name then
    SelectCharacter.isHaveGuild = "N"
    ShowNoGuild()
    return
  end
  allPermission = data.permission
  ui.info_levelBar.CurrentValue = data.rank
  ui.info_name.Text = "  \185\171\187\225\195\251\179\198 : " .. data.name
  ui.info_leader.Text = "  \187\225\179\164 : " .. data.playerName
  ui.info_level.Text = "  \185\171\187\225\181\200\188\182 : Lv" .. data.guildLevel
  ui.info_photo.BackgroundColor = colw
  if ui.btn_change.Visible and ui.btn_change.Text == "\208\222\184\196\185\171\184\230" then
    ui.info_dela.Text = data.notice
  end
  ui.info_photo.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(resDir .. data.resource .. ".tga", Vector4(0, 0, 0, 0))
  })
  if data.flag and data.flag == "Y" then
    ui.btn_get.Enable = false
  else
    ui.btn_get.Enable = true
  end
  if data.gmFloor == 1 then
    ui.btn_icon.Text = "\184\252\184\196\187\225\177\234"
    ui.btn_quit.Text = "\189\226\201\162\185\171\187\225"
    ui.btn_dela.Visible = true
    ui.btn_change.Visible = true
    ui.btn_invite.Visible = true
    ui.btn_powerSet.Visible = true
  else
    ui.btn_icon.Text = "\178\233\191\180\187\225\177\234"
    ui.btn_quit.Text = "\205\203\179\246\185\171\187\225"
    ui.btn_dela.Visible = false
    ui.btn_powerSet.Visible = false
    if data.gmFloor == 2 then
      if allPermission.officer.modify == 1 then
        ui.btn_change.Enable = true
      else
        ui.btn_change.Enable = false
      end
      if allPermission.officer.invite == 1 then
        ui.btn_invite.Enable = true
      else
        ui.btn_invite.Enable = false
      end
    elseif data.gmFloor == 3 then
      if allPermission.elite.modify == 1 then
        ui.btn_change.Enable = true
      else
        ui.btn_change.Enable = false
      end
      if allPermission.elite.invite == 1 then
        ui.btn_invite.Enable = true
      else
        ui.btn_invite.Enable = false
      end
    elseif data.gmFloor == 4 then
      if allPermission.fresh.modify == 1 then
        ui.btn_change.Enable = true
      else
        ui.btn_change.Enable = false
      end
      if allPermission.fresh.invite == 1 then
        ui.btn_invite.Enable = true
      else
        ui.btn_invite.Enable = false
      end
    end
  end
  for i = 1, 50 do
    ui["mb_" .. i].Visible = false
  end
  memDt = data.list
  for i, v in ipairs(data.list) do
    ui["mb_1_" .. i].Skin = SkinF.personalInfo_job[v.occupation % 3 + 1]
    ui["mb_2_" .. i].Text = "  " .. v.name
    ui["mb_3_" .. i].Text = "  " .. v.level
    ui["mb_4_" .. i].Text = "  " .. (v.contribution or 0)
    ui["mb_5_" .. i].Text = "  " .. classText[v.floor]
    ui["mb_" .. i].Visible = true
  end
  local k = math.max(11, #data.list)
  ui.member_list.Size = Vector2(566, 36 + 42 * k)
end, Gui.Control("main_guild")({
  Size = Vector2(1142, 694),
  ComFuc.ComControl(nil, Vector2(1128, 645), Vector2(7, 45), 255, SkinF.personalInfo_098),
  ComFuc.MainTabBtn("btn_main_1", "\185\171\187\225\208\197\207\162", Vector2(28, 5)),
  ComFuc.MainTabBtn("btn_main_2", "\185\171\187\225\189\168\201\232", Vector2(238, 5))
})
local SelMainBC, SelectIcon = function(i)
  ui.btn_main_1.PushDown = i == 1
  ui.btn_main_2.PushDown = i == 2
  if curMainBtn ~= i then
    if i == 1 then
      ui.info_guild.Parent = ui.main_guild
      ui.build_guild.Parent = nil
      rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
    else
      ui.info_guild.Parent = nil
      ui.build_guild.Parent = ui.main_guild
    end
    curMainBtn = i
  end
end, Gui.Control("info_guild")({
  Size = Vector2(1136, 651),
  Location = Vector2(3, 42),
  Gui.Control({
    Size = Vector2(508, 291),
    Location = Vector2(17, 18),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_206,
    ComFuc.ComControl(nil, Vector2(140, 145), Vector2(12, 48), 255, SkinF.guild_019),
    ComFuc.ComControl("info_photo", Vector2(128, 128), Vector2(18, 54), 0),
    ComFuc.ComLabel(nil, "   \187\249\177\190\208\197\207\162", Vector2(498, 21), Vector2(5, 5), 0, 16, colw),
    ComFuc.ComLabel("info_name", nil, Vector2(312, 20), Vector2(166, 58), 0, 16, colt),
    ComFuc.ComLabel("info_leader", nil, Vector2(312, 20), Vector2(166, 90), 0, 16, colt),
    ComFuc.ComLabel("info_level", nil, Vector2(312, 20), Vector2(166, 122), 0, 16, colt),
    ComFuc.ComLabel("dela_text", nil, Vector2(304, 60), Vector2(177, 154), 0, 16, colt),
    ComFuc.ComProportionBar("info_levelBar", Vector2(273, 23), Vector2(166, 154), 100, 60),
    ComFuc.ComButton("btn_icon", "\184\252\184\196\187\225\177\234", Vector2(84, 40), Vector2(12, 239), 16, false, true),
    ComFuc.ComButton("btn_get", "\193\236\200\161\177\219\213\194", Vector2(84, 40), Vector2(100, 239), 16, false, true),
    ComFuc.ComButton("btn_dela", "\208\222\184\196\208\251\209\212", Vector2(84, 40), Vector2(188, 239), 16, false, true)
  }),
  Gui.Control({
    Size = Vector2(508, 322),
    Location = Vector2(17, 315),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_206,
    ComFuc.ComLabel(nil, "   \185\171\184\230", Vector2(498, 21), Vector2(5, 5), 0, 16, colw),
    ComFuc.ComTextArea("info_dela", Vector2(490, 219), Vector2(9, 44), 16, colw, 300),
    ComFuc.ComButton("btn_change", "\208\222\184\196\185\171\184\230", Vector2(84, 40), Vector2(12, 270), 16, false, true)
  }),
  Gui.Control({
    Size = Vector2(592, 619),
    Location = Vector2(529, 18),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_206,
    ComFuc.ComLabel(nil, "   \185\171\187\225\179\201\212\177", Vector2(582, 21), Vector2(5, 5), 0, 16, colw),
    ComFuc.ComButton("btn_quit", "\205\203\179\246\185\171\187\225", Vector2(84, 40), Vector2(12, 567), 16, false, true),
    ComFuc.ComButton("btn_invite", "\209\251\199\235\187\225\212\177", Vector2(84, 40), Vector2(410, 567), 16, false, true),
    ComFuc.ComButton("btn_powerSet", "\200\168\207\222\201\232\214\195", Vector2(84, 40), Vector2(500, 567), 16, false, true),
    ComFuc.ComCheckBox("showOnlyOnline", "\214\187\207\212\202\190\212\218\207\223\205\230\188\210", Vector2(150, 29), Vector2(251, 571), 16, colt),
    Gui.ScrollableControl({
      Size = Vector2(566, 498),
      Location = Vector2(14, 48),
      HScrollBarDisplay = "kHide",
      VScrollBarDisplay = "kVisible",
      VScrollBarWidth = 22,
      AutoScroll = true,
      AutoSize = true,
      AutoScrollMinSize = Vector2(566, 498),
      Gui.Control("member_list")({
        Size = Vector2(566, 498),
        ComFuc.ComComplex(MemberList, 1, 50)
      })
    }),
    Gui.Control({
      Size = Vector2(533, 35),
      Location = Vector2(14, 48),
      ItemSeqBtn(1, "   \214\176\210\181", Vector2(76, 32), Vector2(0, 0)),
      ItemSeqBtn(2, "  \208\213\195\251", Vector2(199, 32), Vector2(76, 0)),
      ItemSeqBtn(3, "  \181\200\188\182", Vector2(79, 32), Vector2(275, 0)),
      ItemSeqBtn(4, "  \185\177\207\215\182\200", Vector2(86, 32), Vector2(354, 0)),
      ItemSeqBtn(5, "  \187\225\189\215", Vector2(93, 32), Vector2(440, 0))
    })
  })
})
local SelectIcon, DealGuildIconGet = function(i)
  for j = 1, 12 do
    if j == i then
      ui["icon_" .. j .. "_b"].PushDown = true
      ui["icon_" .. j .. "_c"].Visible = true
    else
      ui["icon_" .. j .. "_b"].PushDown = false
      ui["icon_" .. j .. "_c"].Visible = false
    end
  end
  temIcon = sysIcon[i]
  if temIcon.price and temIcon.price.gp and temIcon.price.gp[1] and temIcon.price.gp[1].price then
    iconCost = temIcon.price.gp[1].price
  end
  if sysIcon[i].category == 1 then
    ui.btn_iconBuy.Enable = false
    if ui.btn_iconSure.Visible then
      ui.btn_iconSure.Enable = true
    end
  elseif sysIcon[i].category == 2 then
    ui.btn_iconBuy.Enable = true
    if ui.btn_iconSure.Visible then
      ui.btn_iconSure.Enable = false
    end
  end
end, Gui.Control("build_guild")({
  Size = Vector2(1136, 651),
  Location = Vector2(3, 42)
})
local DealGuildIconGet, DealGuildCreate = function(data)
  ui.icon_pageBar.CurrIndex = data.page
  ui.icon_pageBar.PageCount = data.pages
  for i = 1, 12 do
    ui["icon_" .. i .. "_b"].Visible = false
  end
  for i, v in ipairs(data.list) do
    sysIcon[i] = v
    ui["icon_" .. i .. "_b"].Visible = true
    if temIcon.itemId == v.itemId then
      ui["icon_" .. i .. "_b"].PushDown = true
      ui["icon_" .. i .. "_c"].Visible = true
    else
      ui["icon_" .. i .. "_b"].PushDown = false
      ui["icon_" .. i .. "_c"].Visible = false
    end
    if v.category == 1 then
      ui["icon_" .. i .. "_b"].Skin = Gui.ButtonSkin({
        BackgroundImage = Gui.Image(resDir .. v.resource .. ".tga", Vector4(0, 0, 0, 0))
      })
    elseif v.category == 2 then
      ui["icon_" .. i .. "_b"].Skin = Gui.ButtonSkin({
        BackgroundImage = Gui.Image(resDir .. v.resource .. "_disabled" .. ".tga", Vector4(0, 0, 0, 0))
      })
    end
  end
  ui.icon_guild.Parent = ModalWindow.Show("transparent").root
end, Gui.Control("set_guild_m")({
  Dock = "kDockFill",
  ComFuc.ComControl(nil, Vector2(510, 210), Vector2(12, 0), 255, SkinF.battle_005),
  ComFuc.ComLabel(nil, "\181\247\213\251\187\225\189\215", Vector2(68, 17), Vector2(76, 23), 0, 16, cols),
  ComFuc.ComLabel(nil, "\208\222\184\196\185\171\184\230", Vector2(68, 17), Vector2(163, 23), 0, 16, cols),
  ComFuc.ComLabel(nil, "\204\222\179\253\187\225\212\177", Vector2(68, 17), Vector2(250, 23), 0, 16, cols),
  ComFuc.ComLabel(nil, "\209\251\199\235\187\225\212\177", Vector2(68, 17), Vector2(337, 23), 0, 16, cols),
  ComFuc.ComLabel(nil, "\201\232\202\169\206\172\187\164", Vector2(68, 17), Vector2(424, 23), 0, 16, cols),
  ComFuc.ComLabel(nil, "\185\217\212\177", Vector2(36, 17), Vector2(31, 64), 0, 16, cols),
  ComFuc.ComLabel(nil, "\190\171\211\162", Vector2(36, 17), Vector2(31, 113), 0, 16, cols),
  ComFuc.ComLabel(nil, "\208\194\177\248", Vector2(36, 17), Vector2(31, 162), 0, 16, cols),
  ComFuc.ComCheckBox("set_1_1", nil, Vector2(29, 29), Vector2(94, 58)),
  ComFuc.ComCheckBox("set_1_2", nil, Vector2(29, 29), Vector2(181, 58)),
  ComFuc.ComCheckBox("set_1_3", nil, Vector2(29, 29), Vector2(268, 58)),
  ComFuc.ComCheckBox("set_1_4", nil, Vector2(29, 29), Vector2(355, 58)),
  ComFuc.ComCheckBox("set_1_5", nil, Vector2(29, 29), Vector2(442, 58)),
  ComFuc.ComCheckBox("set_2_1", nil, Vector2(29, 29), Vector2(94, 107)),
  ComFuc.ComCheckBox("set_2_2", nil, Vector2(29, 29), Vector2(181, 107)),
  ComFuc.ComCheckBox("set_2_3", nil, Vector2(29, 29), Vector2(268, 107)),
  ComFuc.ComCheckBox("set_2_4", nil, Vector2(29, 29), Vector2(355, 107)),
  ComFuc.ComCheckBox("set_2_5", nil, Vector2(29, 29), Vector2(442, 107)),
  ComFuc.ComCheckBox("set_3_1", nil, Vector2(29, 29), Vector2(94, 156)),
  ComFuc.ComCheckBox("set_3_2", nil, Vector2(29, 29), Vector2(181, 156)),
  ComFuc.ComCheckBox("set_3_3", nil, Vector2(29, 29), Vector2(268, 156)),
  ComFuc.ComCheckBox("set_3_4", nil, Vector2(29, 29), Vector2(355, 156)),
  ComFuc.ComCheckBox("set_3_5", nil, Vector2(29, 29), Vector2(442, 156)),
  ComFuc.CancelBtn(Vector2(84, 40), Vector2(282, 215)),
  ComFuc.ComButton("btn_setSure", "\200\183 \182\168", Vector2(84, 40), Vector2(149, 215), 16)
})
local DealGuildCreate, DealDelGuild = function(data)
  if not data.error then
    ui.init_guild.Parent = nil
    ui.main_guild.Parent = ui.main
    SelectCharacter.isHaveGuild = "Y"
    SelMemListHead(5)
    SelMainBC(1)
    ComFuc.TestIsFinishOneTask(1021)
  end
end, Gui.Control("search_guild_m")({
  Dock = "kDockFill",
  BackgroundColor = ARGB(255, 255, 255, 255),
  Skin = SkinF.battle_005,
  Margin = Vector4(7, 3, 7, 3),
  Gui.Control({
    Size = Vector2(0, 53),
    Dock = "kDockBottom",
    Margin = Vector4(0, 0, 0, 11),
    Gui.Pager("serarch_pageBar")({
      Size = Vector2(197, 43),
      Dock = "kDockTopCenter"
    })
  }),
  Gui.Control({
    Dock = "kDockFill",
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_068,
    Margin = Vector4(11, 11, 11, 11),
    Padding = Vector4(11, 11, 11, 11),
    Gui.ListTreeView("search_list")({
      Dock = "kDockFill",
      Style = "Sociality.FriendsList"
    })
  })
})
local DealDelGuild, DealGetGuildFlag = function(data)
  if not data.error then
    ShowNoGuild()
    SelectCharacter.isHaveGuild = "N"
  end
end, Gui.Control("icon_guild_m")({
  Size = Vector2(562, 474),
  Gui.Control({
    Size = Vector2(546, 415),
    Location = Vector2(8, 0),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_131,
    ComFuc.ComGuildIconFlag("icon_1", Vector2(8, 8), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_2", Vector2(142, 8), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_3", Vector2(276, 8), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_4", Vector2(410, 8), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_5", Vector2(8, 141), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_6", Vector2(142, 141), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_7", Vector2(276, 141), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_8", Vector2(410, 141), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_9", Vector2(8, 274), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_10", Vector2(142, 274), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_11", Vector2(276, 274), Vector2(128, 128)),
    ComFuc.ComGuildIconFlag("icon_12", Vector2(410, 274), Vector2(128, 128))
  }),
  ComFuc.ComPagesBar("icon_pageBar", Vector2(107, 429)),
  ComFuc.CancelBtn(Vector2(84, 40), Vector2(469, 424)),
  ComFuc.ComButton("btn_iconBuy", "\185\186 \194\242", Vector2(84, 40), Vector2(8, 424), 16),
  ComFuc.ComButton("btn_iconSure", "\200\183 \182\168", Vector2(84, 40), Vector2(382, 424), 16)
})

function DealGetGuildFlag(data)
  if not data.error then
    MessageBox.Show(GetUTF8Text("msgbox_common_num_1253"), GetUTF8Text("button_common_OK"), function()
      rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
    end)
  else
    MessageBox.ShowError(GetUTF8Text("msgbox_common_num_1075"))
  end
end

local InitSocialityMenu, InitFriendsGroupListPopupMenuForRecent = function(menu, t)
  local menu_key = {}
  menu:RemoveAll()
  for _, v in ipairs(t) do
    if v ~= nil then
      menu_key[v[1]] = v[3]
      menu:AddItem(v[2], v[1])
    else
      menu:AddSeparator()
    end
  end
  
  function menu.EventClick(sender, e)
    local id = sender:GetId(menu.SelectedIndex)
    menu_key[id]()
  end
end, function(menu, t)
  local menu_key = {}
  menu:RemoveAll()
  for _, v in ipairs(t) do
    if v ~= nil then
      menu_key[v[1]] = v[3]
      menu:AddItem(v[2], v[1])
    else
      menu:AddSeparator()
    end
  end
  
  function menu.EventClick(sender, e)
    local id = sender:GetId(menu.SelectedIndex)
    menu_key[id]()
  end
end
local InitFriendsGroupListPopupMenuForRecent, InitFriendsGroupListPopupMenu = function(list)
  InitSocialityMenu(list.PopupMenu, {
    {
      "IDM_ADD_FRIEND",
      "\209\251\199\235\188\211\200\235\185\171\187\225",
      function()
        print(list.SelectedItem:GetText(4))
        local state = ptr_cast(game.CurrentState)
        state:InviteGuild(list.SelectedItem:GetText(4))
      end
    }
  })
  
  function list.EventRightClick(sender, e)
    if sender.SelectedItem then
      sender.PopupMenu:Open()
    end
  end
end, ComFuc.ComMenu("menu_1")
local InitFriendsGroupListPopupMenu, InitialSearchResult = function(list)
  local menu = list.PopupMenu
  local sub_menu = Gui.Menu({})(nil, nil)
  InitSocialityMenu(list.PopupMenu, {
    {
      "IDM_BEG_WISPER",
      "\191\170\202\188\193\196\204\236",
      function()
        ChatBar.OpenFriendChatPair(list.SelectedItem:GetText(1))
      end
    },
    {
      "IDM_ADD_FRIEND",
      "\188\211\206\170\186\195\211\209",
      function()
        assert(list.SelectedItem)
        print("\213\253\212\218\204\237\188\211" .. list.SelectedItem:GetText(1) .. "[" .. list.SelectedItem:GetText(4) .. "]")
        rpc.safecall("friend_make", {
          friendId = list.SelectedItem:GetText(4)
        }, function(data)
          if not data.error then
            print("\204\237\188\211" .. list.SelectedItem:GetText(1) .. "\179\201\185\166")
            Sociality.RefreshFriendsGroupList()
          end
        end)
      end
    },
    {
      "IDM_ADJUST_CLASS",
      "\181\247\213\251\187\225\189\215",
      function()
        print("\181\247\213\251\187\225\189\215-----------------------")
      end
    },
    {
      "IDM_TRANSFER_GUILD",
      "\215\170\200\195\185\171\187\225",
      function()
        rpc.safecall("guild_member_floor_change", {
          pid = list.SelectedItem:GetText(4),
          floor = 1
        }, function(data)
        end)
      end
    },
    {
      "IDM_OUT_GUILD",
      "\204\223\179\246\185\171\187\225",
      function()
        rpc.safecall("guild_member_eliminate", {
          pid = list.SelectedItem:GetText(4)
        }, function(data)
        end)
      end
    },
    {
      "IDM_MOVETO_BLACK",
      "\198\193\177\206\181\189\186\218\195\251\181\165",
      function()
        print("\213\253\212\218\210\198\182\175" .. list.SelectedItem:GetText(1) .. "\181\189\186\218\195\251\181\165")
        rpc.safecall("friend_toblack", {
          blackPlayerName = list.SelectedItem:GetText(1)
        }, function(data)
          if not data.error then
            print("\210\198\182\175\181\189\186\218\195\251\181\165\179\201\185\166")
            RefreshFriendsGroupList()
          end
        end)
      end
    }
  })
  InitSocialityMenu(sub_menu, {
    {
      "IDM_BE_OFFICER",
      "\185\217\212\177",
      function()
        rpc.safecall("guild_member_floor_change", {
          pid = list.SelectedItem:GetText(4),
          floor = 2
        }, function(data)
        end)
      end
    },
    {
      "IDM_BE_ELITE",
      "\190\171\211\162",
      function()
        rpc.safecall("guild_member_floor_change", {
          pid = list.SelectedItem:GetText(4),
          floor = 3
        }, function(data)
        end)
      end
    },
    {
      "IDM_BE_FRESH",
      "\208\194\202\214",
      function()
        rpc.safecall("guild_member_floor_change", {
          pid = list.SelectedItem:GetText(4),
          floor = 4
        }, function(data)
        end)
      end
    }
  })
  menu:SetSubMenu(2, sub_menu)
  
  function list.EventRightClick(sender, e)
    if sender.SelectedItem then
      menu:Open()
    end
  end
end, ComFuc.ComMenu("menu_2")

function InitialSearchResult()
  local list = ui.search_list
  list:DeleteColumns()
  CommonUtility.InitLtvHeader(list, {
    {
      "",
      38,
      "kAlignCenterMiddle"
    },
    {
      "",
      62,
      "kAlignLeftMiddle"
    },
    {
      "",
      148,
      "kAlignLeftMiddle"
    },
    {
      "",
      27,
      "kAlignCenterMiddle"
    },
    {
      "",
      1,
      "kAlignCenterMiddle"
    }
  })
  InitFriendsGroupListPopupMenuForRecent(list)
  
  function list.EventDoubleClick(sender, e)
  end
end

InitialSearchResult()
local RefreshSearchResult = InitialSearchResult

function RefreshSearchResult(search_name, search_page)
  print("\213\253\212\218\203\209\203\247" .. search_name)
  rpc.safecall("friend_search", {
    name = search_name,
    currentPage = search_page,
    totalNum = ""
  }, function(data)
    local list = ui.search_list
    list:DeleteAll()
    for _, v in ipairs(data.friends.list) do
      if v.playerState == 2 then
        Sociality.AddFriendsGroupItem(list, v.playerState == 2, v.playerLevel, v.playerName, v.playerState == 3, v.playerId)
      end
    end
    local page_bar = ui.serarch_pageBar
    page_bar.EventPageChanged = nil
    page_bar.MaxPage = data.friends.pageNum
    page_bar.Page = data.friends.currentPage
    
    function page_bar.EventPageChanged(sender, e)
      RefreshSearchResult(search_name, sender.Page)
    end
  end)
end

function UpdateAllInfo()
  if SelectCharacter.isHaveGuild == "Y" then
    if not ui.main_guild.Parent then
      SelMemListHead(5)
      SelMainBC(1)
      ui.init_guild.Parent = nil
      ui.main_guild.Parent = ui.main
    else
      rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
    end
  end
end

function TimerRefresh()
  UpdateAllInfo()
end

function TimerRemove()
  game.TimerMgr:RemoveTimer(timer)
  timer = nil
end

ui["menu_" .. 1]:AddItem("\191\170\202\188\193\196\204\236")
ui["menu_" .. 1]:AddItem("\188\211\206\170\186\195\211\209")
ui["menu_" .. 1]:AddItem("\181\247\213\251\187\225\189\215")
ui["menu_" .. 1]:AddItem("\215\170\200\195\185\171\187\225")
ui["menu_" .. 1]:AddItem("\204\223\179\246\185\171\187\225")
ui["menu_" .. 1]:AddItem("\198\193\177\206\181\189\186\218\195\251\181\165")
ui["menu_" .. 1]:AddItem("\178\233\191\180\208\197\207\162")
ui["menu_" .. 2]:AddItem("\185\217\212\177")
ui["menu_" .. 2]:AddItem("\190\171\211\162")
ui["menu_" .. 2]:AddItem("\208\194\202\214")
ui["menu_" .. 1]:SetSubMenu(2, ui["menu_" .. 2])
ui["menu_" .. 3]:AddItem("\209\251\199\235\188\211\200\235\185\171\187\225")
ui["menu_" .. 3]:AddItem("\178\233\209\175\208\197\207\162")
for i = 1, 2 do
  ui["menu_" .. i].EventClick = function(sender, e)
    local t = sender.SelectedIndex
    if i == 1 then
      if t == 0 then
        ChatBar.OpenFriendChatPair(memDt[temDt].name)
      elseif t == 1 then
        rpc.safecall("friend_make", {
          friendId = memDt[temDt].pId
        }, function(data)
          if not data.error then
            Sociality.RefreshFriendsGroupList()
          end
        end)
      elseif t == 3 then
        rpc.safecall("guild_member_floor_change", {
          pid = memDt[temDt].pId,
          floor = 1
        }, function(data)
          if not data.error then
            rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
          end
        end)
      elseif t == 4 then
        rpc.safecall("guild_member_eliminate", {
          pid = memDt[temDt].pId
        }, function(data)
          if not data.error then
            rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
          end
        end)
      elseif t == 5 then
        rpc.safecall("friend_toblack", {
          blackPlayerName = memDt[temDt].pId
        }, function(data)
          if not data.error then
            RefreshFriendsGroupList()
          end
        end)
      elseif t == 6 then
        LookInfo.Show(memDt[temDt].pId)
      end
    elseif i == 2 then
      if t == 0 then
        rpc.safecall("guild_member_floor_change", {
          pid = memDt[temDt].pId,
          floor = 2
        }, function(data)
          print("zhj1------------------------------------------")
          if not data.error then
            rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
          end
        end)
      elseif t == 1 then
        rpc.safecall("guild_member_floor_change", {
          pid = memDt[temDt].pId,
          floor = 3
        }, function(data)
          if not data.error then
            rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
          end
        end)
      elseif t == 2 then
        rpc.safecall("guild_member_floor_change", {
          pid = memDt[temDt].pId,
          floor = 4
        }, function(data)
          if not data.error then
            rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
          end
        end)
      end
    end
  end
end
for i = 1, 50 do
  ui["mb_" .. i].EventRightClick = function(sender, e)
    if tostring("  " .. SelectCharacter.role_text) ~= tostring(ui["mb_2_" .. i].Text) then
      ui["menu_" .. 1].Location = sender.CurrentCursorPosition + Vector2(ComFuc.locationChanged, 0)
      ui["menu_" .. 1]:Open()
      temDt = i
      SelOneClassBtn("mb_", 1, 50, i)
    end
  end
  ui["mb_" .. i].EventClick = function(sender, e)
    SelOneClassBtn("mb_", 1, 50, i)
  end
end
for i = 1, 5 do
  ui["membl_" .. i].EventClick = function(sender, e)
    if i ~= curMemb then
      SelMemListHead(i)
    elseif ui["dir" .. i].Skin == SkinF.guild_022[1] then
      ui["dir" .. i].Skin = SkinF.guild_022[2]
    else
      ui["dir" .. i].Skin = SkinF.guild_022[1]
    end
    curMemb = i
    SelOneClassBtn("membl_", 1, 5, i)
  end
end
for i = 1, 12 do
  ui["icon_" .. i .. "_b"].EventClick = function(sender, e)
    SelectIcon(i)
  end
end
for i = 1, 2 do
  ui["btn_main_" .. i].EventClick = function(sender, e)
    SelMainBC(i)
  end
end

function ui.btn_dela.EventClick(sender, e)
  ui.dela_guild.Parent = ModalWindow.Show("transparent").root
end

function ui.btn_info_p.EventClick(sender, e)
  sender.PushDown = true
end

function ui.btn_finish.EventClick(sender, e)
  MessageBox.ShowWithConfirmCancel("\180\180\189\168\185\171\187\225\210\170\207\251\186\19610000\189\240\177\210\163\172\200\183\182\168\180\180\189\168\194\240\163\191", function(sender, e)
    rpc.safecall("guild_create", {
      name = ui.init_name.Text,
      itemId = temIcon.itemId
    }, DealGuildCreate)
    rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
  end)
end

function ui.btn_selIcon.EventClick(sender, e)
  ui.btn_iconSure.Visible = true
  ui.btn_iconSure.Enable = false
  ui.btn_iconBuy.Enable = false
  rpc.safecall("guild_icon_list", {page = 1, type = 101}, DealGuildIconGet)
end

function ui.btn_icon.EventClick(sender, e)
  if sender.Text == "\184\252\184\196\187\225\177\234" then
    ui.btn_iconSure.Visible = true
    ui.btn_iconSure.Enable = false
    ui.btn_iconBuy.Enable = false
  elseif sender.Text == "\178\233\191\180\187\225\177\234" then
    ui.btn_iconSure.Visible = false
  end
  rpc.safecall("guild_icon_list", {page = 1, type = 101}, DealGuildIconGet)
end

function ui.btn_get.EventClick(sender, e)
  rpc.safecall("guild_icon_achieve", {}, DealGetGuildFlag)
end

function ui.btn_quit.EventClick(sender, e)
  if sender.Text == "\189\226\201\162\185\171\187\225" then
    MessageBox.ShowWithConfirmCancel(GetUTF8Text("msgbox_common_num_1254"), function(sender, e)
      rpc.safecall("guild_disband", {}, DealDelGuild)
    end)
  elseif sender.Text == "\205\203\179\246\185\171\187\225" then
    MessageBox.ShowWithConfirmCancel("\205\203\179\246\185\171\187\225\187\225\200\195\196\227\181\196\185\177\207\215\214\181\199\229\193\227\163\172\200\183\182\168\205\203\179\246\194\240\163\191", function(sender, e)
      rpc.safecall("guild_member_eliminate", {
        pid = SelectCharacter.roleServerId
      }, DealDelGuild)
    end)
  end
end

function ui.btn_iconSure.EventClick(sender, e)
  ModalWindow.Close()
  if SelectCharacter.isHaveGuild == "Y" then
    MessageBox.ShowWithConfirmCancel("\184\252\184\196\187\225\177\234\208\232\210\170\186\196\183\209" .. iconCost .. "\189\240\177\210\163\172\200\183\182\168\184\252\184\196\194\240\163\191", function(sender, e)
      rpc.safecall("guild_icon_change", {
        itemId = temIcon.itemId
      }, nil)
      rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
    end)
  else
    ui.init_ph_pre.Visible = false
    ui.init_photo.BackgroundColor = colw
    ui.init_photo.Skin = Gui.ControlSkin({
      BackgroundImage = Gui.Image(resDir .. temIcon.resource .. ".tga", Vector4(0, 0, 0, 0))
    })
  end
end

function ui.btn_iconBuy.EventClick(sender, e)
  QuickBuy.Show({t = 2, st = "101"})
end

function ui.btn_change.EventClick(sender, e)
  if sender.Text == "\208\222\184\196\185\171\184\230" then
    ui.info_dela.Readonly = false
    ui.info_dela.Skin = SkinF.mail_textarea_001
    ui.info_dela.Focused = true
    sender.Text = "\205\234 \179\201"
  elseif sender.Text == "\205\234 \179\201" then
    ui.info_dela.Readonly = true
    ui.info_dela.Skin = SkinF.mail_textarea_001_readonly
    rpc.safecall("guild_notice_change", {
      notice = ui.info_dela.Text
    })
    rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
    sender.Text = "\208\222\184\196\185\171\184\230"
  end
end

function ui.btn_invite.EventClick(sender, e)
  InputBox.Show("\209\251\199\235\187\225\212\177", "\199\235\202\228\200\235\205\230\188\210\195\251\179\198", function(player_name)
    RefreshSearchResult(player_name, 1)
    ui.search_guild.Parent = gui
    Gui.Align(ui.search_guild, 0.5, 0.5)
  end)
end

function ui.btn_powerSet.EventClick(sender, e)
  for i = 1, 3 do
    local tA
    if i == 1 then
      tA = allPermission.officer
    elseif i == 2 then
      tA = allPermission.elite
    elseif i == 3 then
      tA = allPermission.fresh
    end
    for j = 1, 5 do
      local tB
      if j == 1 then
        tB = tA.adjust
      elseif j == 2 then
        tB = tA.modify
      elseif j == 3 then
        tB = tA.reject
      elseif j == 4 then
        tB = tA.invite
      elseif j == 5 then
        tB = tA.maintain
      end
      if tB == 0 then
        ui["set_" .. i .. "_" .. j].Check = false
      elseif tB == 1 then
        ui["set_" .. i .. "_" .. j].Check = true
      end
    end
  end
  ui.set_guild.Parent = ModalWindow.Show("transparent").root
end

function ui.btn_setSure.EventClick(sender, e)
  local str = ""
  for i = 1, 3 do
    for j = 1, 5 do
      local t = ""
      if ui["set_" .. i .. "_" .. j].Check then
        t = 1
      else
        t = 0
      end
      str = str .. t
    end
    if i < 3 then
      str = str .. ","
    end
  end
  rpc.safecall("guild_permission_change", {permission = str}, nil)
  ModalWindow.Close()
  rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
end

function ui.showOnlyOnline.EventCheckChanged(sender, e)
  if sender.Check then
    isOnline = "Y"
  else
    isOnline = "N"
  end
  rpc.safecall("guild_show", {onlineState = isOnline}, DealGuildShow)
end

function ui.search_guild_cha.EventClick(sender, e)
  ui.search_guild.Parent = nil
end

function ui.icon_pageBar.EventIndexChanged(sender, e)
  rpc.safecall("guild_icon_list", {
    page = ui.icon_pageBar.CurrIndex,
    type = 101
  }, DealGuildIconGet)
end

function CanSwitch()
  return true, GetUTF8Text("msgbox_common_num_1398")
end

function Show(winRoot)
  curMainBtn = 0
  sysIcon = {}
  temIcon = {}
  timer = game.TimerMgr:AddTimer(10)
  timer.EventOnTimer = TimerRefresh
  if SelectCharacter.isHaveGuild == "Y" then
    allPermission = {}
    curMemb = 0
    SelMemListHead(5)
    SelMainBC(1)
    ui.init_guild.Parent = nil
    ui.main_guild.Parent = ui.main
  else
    ShowNoGuild()
  end
  ui.btn_change.Text = "\208\222\184\196\185\171\184\230"
  ui.info_dela.Skin = SkinF.mail_textarea_001_readonly
  ui.info_dela.Readonly = true
  ui.main.Parent = winRoot
end

function Hide()
  TimerRemove()
  ui.main.Parent = nil
end
