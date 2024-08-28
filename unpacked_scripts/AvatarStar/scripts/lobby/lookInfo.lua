module("LookInfo", package.seeall)
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
colt = ARGB(255, 113, 83, 65)
coly = ARGB(255, 255, 214, 50)
colg = ARGB(255, 0, 255, 198)
colb = ARGB(255, 0, 187, 221)
local resDir = "/ui/skinF/lobby/"
local isFirst1 = true
local isFirst2 = true
local roleId = 0
local itemDt
local tip_player_interface = {
  "tip_player_skill",
  "tip_player_item",
  "tip_player_item",
  "tip_player_item",
  "tip_player_avatar",
  "tip_player_avatar"
}
local jobName, ComCB = {
  GetUTF8Text("UI_profession_Guardian"),
  GetUTF8Text("UI_profession_Gunner"),
  GetUTF8Text("UI_profession_Assassin")
}, GetUTF8Text("UI_profession_Guardian")

function ComCB(name, size, lc, type, k)
  return Gui.Control(name)({
    Size = size,
    Location = lc,
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_083[1],
    Visible = false,
    Gui.Control(name .. "_son")({
      Size = size,
      BackgroundColor = colw,
      Skin = SkinF.skin_touming,
      Gui.Control(name .. "_s")({
        Size = size,
        BackgroundColor = colw,
        Skin = SkinF.skin_touming,
        EventMouseEnter = function(sender, e)
          if type == 1 then
          elseif type == 2 then
            Tip.SetRpc(tip_player_interface[1], {
              t = 1,
              pid = itemDt.slots[1][k].itemid
            })
            Tip.SetUseDescription(false)
            Tip.SetOwner(sender)
          elseif type == 3 then
            Tip.SetRpc(tip_player_interface[2], {
              t = 2,
              pid = itemDt.slots[2][k].itemid
            })
            Tip.SetUseDescription(false)
            Tip.SetOwner(sender)
          elseif type == 4 then
            Tip.SetRpc(tip_player_interface[2], {
              t = 2,
              pid = itemDt.equips[k].itemid
            })
            Tip.SetUseDescription(false)
            Tip.SetOwner(sender)
          end
        end
      })
    })
  })
end

local ui = Gui.Create()({
  ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0)),
  Gui.Control("main")({
    Size = Vector2(888, 498),
    Dock = "kDockCenter",
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_207,
    Gui.Control({
      Size = Vector2(880, 31),
      Location = Vector2(4, 4),
      ComFuc.ComLabel("name_t", GetUTF8Text("tips_lobby_Common_Desc19"), Vector2(218, 22), Vector2(16, 0), 0, 16, colw),
      Gui.Button("colse")({
        Size = Vector2(24, 24),
        Location = Vector2(848, 1),
        BackgroundColor = colw,
        Skin = SkinF.lookInfo_002
      })
    }),
    Gui.Control({
      Size = Vector2(458, 442),
      Location = Vector2(6, 40),
      Gui.CharacterAnimCard({
        ID = 3,
        Size = Vector2(458, 442)
      }),
      Gui.Control({
        Size = Vector2(129, 70),
        Location = Vector2(7, 7),
        BackgroundColor = colw,
        Skin = SkinF.personalInfo_225,
        ComFuc.ComControl(nil, Vector2(119, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Power"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
        ComFuc.ComLabel("info_power", 0, Vector2(120, 36), Vector2(10, 29), 0, 0, colw, nil, nil, true, SkinF.info_number_1)
      }),
      Gui.Control("power_hits")({
        Size = Vector2(400, 120),
        Location = Vector2(6, 80),
        BackgroundColor = colw,
        Skin = SkinF.lookInfo_004,
        Visible = false,
        ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc1"), Vector2(140, 21), Vector2(10, 6), 0, 16, colw),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc2"), Vector2(140, 21), Vector2(210, 6), 0, 16, colw),
        ComFuc.ComLabel("pow_pf", 0, Vector2(100, 21), Vector2(150, 6), 0, 16, coly),
        ComFuc.ComLabel("pow_wf", 0, Vector2(100, 21), Vector2(350, 6), 0, 16, coly),
        ComFuc.ComLabel("pow_text", GetUTF8Text("tips_lobby_Ability_Desc3"), Vector2(380, 78), Vector2(10, 32), 0, 16, colw)
      }),
      Gui.Control({
        Size = Vector2(444, 70),
        Location = Vector2(7, 368),
        BackgroundColor = colw,
        Skin = SkinF.personalInfo_225,
        ComFuc.ComControl(nil, Vector2(434, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
        ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 26), 255, SkinF.personalInfo_229[1]),
        ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 25), 255, SkinF.personalInfo_229[6]),
        ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 25), 255, SkinF.personalInfo_229[2]),
        ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 46), 255, SkinF.personalInfo_229[3]),
        ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 46), 255, SkinF.personalInfo_229[4]),
        ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 46), 255, SkinF.personalInfo_229[5]),
        ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Character_Attribute"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_HP"), Vector2(72, 17), Vector2(34, 23), 0, 14, colw),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Stamina"), Vector2(72, 17), Vector2(172, 23), 0, 14, colw),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Vitality"), Vector2(72, 17), Vector2(310, 23), 0, 14, colw),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Recovery"), Vector2(72, 17), Vector2(34, 43), 0, 14, colw),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Amor"), Vector2(72, 17), Vector2(172, 43), 0, 14, colw),
        ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Armor_Penetration"), Vector2(72, 17), Vector2(310, 43), 0, 14, colw),
        ComFuc.ComLabel("main_par_1", nil, Vector2(90, 17), Vector2(54, 23), 0, 14, colw, "kAlignRightMiddle"),
        ComFuc.ComLabel("main_par_6", nil, Vector2(90, 17), Vector2(192, 23), 0, 14, colw, "kAlignRightMiddle"),
        ComFuc.ComLabel("main_par_2", nil, Vector2(90, 17), Vector2(330, 23), 0, 14, colw, "kAlignRightMiddle"),
        ComFuc.ComLabel("main_par_3", nil, Vector2(90, 17), Vector2(54, 43), 0, 14, colw, "kAlignRightMiddle"),
        ComFuc.ComLabel("main_par_4", nil, Vector2(90, 17), Vector2(192, 43), 0, 14, colw, "kAlignRightMiddle"),
        ComFuc.ComLabel("main_par_5", nil, Vector2(90, 17), Vector2(330, 43), 0, 14, colw, "kAlignRightMiddle")
      })
    }),
    Gui.Control({
      Size = Vector2(414, 445),
      Location = Vector2(468, 40),
      BackgroundColor = colw,
      Skin = SkinF.battle_005,
      ComFuc.ComControl("right", Vector2(399, 399), Vector2(8, 40), 255, SkinF.personalInfo_131),
      ComFuc.SecMainTabBtn("btn_" .. 1, GetUTF8Text("button_common_Character_Info") .. " ", Vector2(110, 38), Vector2(26, 4)),
      ComFuc.SecMainTabBtn("btn_" .. 2, GetUTF8Text("button_common_Skill_Info") .. " ", Vector2(110, 38), Vector2(140, 4)),
      ComFuc.SecMainTabBtn("btn_" .. 3, GetUTF8Text("button_common_Equipment_Info") .. " ", Vector2(110, 38), Vector2(254, 4))
    }),
    Gui.Control("tab_1")({
      Size = Vector2(399, 399),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Name"), Vector2(64, 22), Vector2(13, 13), 0, 16, colt),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Level"), Vector2(64, 22), Vector2(13, 45), 0, 16, colt),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Class_Type"), Vector2(64, 22), Vector2(13, 77), 0, 16, colt),
      ComFuc.ComLabel("nam_r", "\195\251\179\198 :  HOLD_001", Vector2(375, 22), Vector2(77, 13), 0, 16, colt),
      ComFuc.ComLabel("lev_r", "\181\200\188\182 :  LV.30", Vector2(375, 22), Vector2(77, 47), 0, 16, colt),
      ComFuc.ComLabel("job_r", "\214\176\210\181 ;  \187\164\206\192\177\248", Vector2(375, 22), Vector2(115, 79), 0, 16, colt),
      ComFuc.ComLabel("pub_r", "\185\171\187\225 :  \206\229\185\226\202\174\201\171", Vector2(375, 22), Vector2(77, 111), 0, 16, colt),
      ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Battlefield_Info"), Vector2(376, 24), Vector2(12, 194), 255, 16, colw, nil, SkinF.lookInfo_003),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Victory"), Vector2(150, 18), Vector2(13, 228), 0, 16, colt),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kills"), Vector2(150, 18), Vector2(13, 254), 0, 16, colt),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kill_Streak"), Vector2(150, 18), Vector2(13, 280), 0, 16, colt),
      ComFuc.ComLabel("win_r", "", Vector2(260, 22), Vector2(120, 228), 0, 16, colb, "kAlignRightMiddle"),
      ComFuc.ComLabel("kil_r", "", Vector2(260, 22), Vector2(120, 254), 0, 16, colb, "kAlignRightMiddle"),
      ComFuc.ComLabel("max_r", "", Vector2(260, 22), Vector2(120, 280), 0, 16, colb, "kAlignRightMiddle"),
      ComFuc.ComLabel("suc_r", "", Vector2(260, 22), Vector2(120, 306), 0, 16, colb, "kAlignRightMiddle"),
      ComFuc.ComControl("job_h", Vector2(31, 31), Vector2(77, 72), 255, SkinF.personalInfo_job[1]),
      ExpBar.ComExpBar("bar_exp", Vector2(212, 23), Vector2(113, 46), 0, 1, SkinF.lobbyMain_expbar[1], SkinF.lobbyMain_expbar[2], "kAlignLeftMiddle")
    }),
    Gui.Control("tab_2")({
      Size = Vector2(399, 399),
      ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Class_Skill"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
      ComCB("ski_1", Vector2(80, 80), Vector2(12, 34), 2, 1),
      ComCB("ski_2", Vector2(80, 80), Vector2(98, 34), 2, 2),
      ComCB("ski_3", Vector2(80, 80), Vector2(184, 34), 2, 3),
      ComCB("ski_4", Vector2(80, 80), Vector2(270, 34), 2, 4),
      ComCB("ski_5", Vector2(80, 80), Vector2(12, 124), 2, 5)
    }),
    Gui.Control("tab_3")({
      Size = Vector2(399, 399),
      ComFuc.ComLabel(nil, " " .. GetUTF8Text("button_common_Weapon"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
      ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Ring_Amor"), Vector2(376, 24), Vector2(12, 126), 255, 16, colw, nil, SkinF.lookInfo_003),
      ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Equipment_for_back"), Vector2(376, 24), Vector2(12, 246), 255, 16, colw, nil, SkinF.lookInfo_003),
      ComCB("wea_1", Vector2(80, 80), Vector2(12, 34), 3, 1),
      ComCB("wea_2", Vector2(80, 80), Vector2(98, 34), 3, 2),
      ComCB("wea_3", Vector2(80, 80), Vector2(184, 34), 3, 3),
      ComCB("ind_1", Vector2(80, 80), Vector2(12, 154), 4, 1),
      ComCB("ind_2", Vector2(80, 80), Vector2(98, 154), 4, 2),
      ComCB("ind_3", Vector2(80, 80), Vector2(12, 274), 4, 3),
      ComCB("ind_4", Vector2(80, 80), Vector2(98, 274), 4, 4)
    })
  })
})
ui.pub_r.Visible = false
ui.suc_r.Visible = false
local ui.pow_text.AutoWrap, ShowParAdd = true, ui.pow_text
local ShowParAdd, ShowOneBtn = function(i, p)
  if p and math.floor(p) > 0 then
    ui["main_par_" .. i].TextColor = colg
    return math.floor(p)
  end
  ui["main_par_" .. i].TextColor = colw
  return 0
end, ComFuc.ComControl("coverControl2", Vector2(1600, 1200), Vector2(0, 0), 0, nil, true, true, ARGB(100, 0, 0, 0))
local ShowOneBtn, DealBattleForce = function(p, q, res, grade, r)
  p.Visible = true
  q.Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image(resDir .. res .. ".tga", Vector4(0, 0, 0, 0))
  })
  if grade and 0 < grade then
    r.Skin = SkinF.personalInfo_quality[grade]
  end
end, Gui.Control("main")({
  Size = Vector2(888, 498),
  Dock = "kDockCenter",
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_207,
  Gui.Control({
    Size = Vector2(880, 31),
    Location = Vector2(4, 4),
    ComFuc.ComLabel("name_t", GetUTF8Text("tips_lobby_Common_Desc19"), Vector2(218, 22), Vector2(16, 0), 0, 16, colw),
    Gui.Button("colse")({
      Size = Vector2(24, 24),
      Location = Vector2(848, 1),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_002
    })
  }),
  Gui.Control({
    Size = Vector2(458, 442),
    Location = Vector2(6, 40),
    Gui.CharacterAnimCard({
      ID = 3,
      Size = Vector2(458, 442)
    }),
    Gui.Control({
      Size = Vector2(129, 70),
      Location = Vector2(7, 7),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(119, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Power"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel("info_power", 0, Vector2(120, 36), Vector2(10, 29), 0, 0, colw, nil, nil, true, SkinF.info_number_1)
    }),
    Gui.Control("power_hits")({
      Size = Vector2(400, 120),
      Location = Vector2(6, 80),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_004,
      Visible = false,
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc1"), Vector2(140, 21), Vector2(10, 6), 0, 16, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc2"), Vector2(140, 21), Vector2(210, 6), 0, 16, colw),
      ComFuc.ComLabel("pow_pf", 0, Vector2(100, 21), Vector2(150, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_wf", 0, Vector2(100, 21), Vector2(350, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_text", GetUTF8Text("tips_lobby_Ability_Desc3"), Vector2(380, 78), Vector2(10, 32), 0, 16, colw)
    }),
    Gui.Control({
      Size = Vector2(444, 70),
      Location = Vector2(7, 368),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(434, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 26), 255, SkinF.personalInfo_229[1]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 25), 255, SkinF.personalInfo_229[6]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 25), 255, SkinF.personalInfo_229[2]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 46), 255, SkinF.personalInfo_229[3]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 46), 255, SkinF.personalInfo_229[4]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 46), 255, SkinF.personalInfo_229[5]),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Character_Attribute"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_HP"), Vector2(72, 17), Vector2(34, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Stamina"), Vector2(72, 17), Vector2(172, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Vitality"), Vector2(72, 17), Vector2(310, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Recovery"), Vector2(72, 17), Vector2(34, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Amor"), Vector2(72, 17), Vector2(172, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Armor_Penetration"), Vector2(72, 17), Vector2(310, 43), 0, 14, colw),
      ComFuc.ComLabel("main_par_1", nil, Vector2(90, 17), Vector2(54, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_6", nil, Vector2(90, 17), Vector2(192, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_2", nil, Vector2(90, 17), Vector2(330, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_3", nil, Vector2(90, 17), Vector2(54, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_4", nil, Vector2(90, 17), Vector2(192, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_5", nil, Vector2(90, 17), Vector2(330, 43), 0, 14, colw, "kAlignRightMiddle")
    })
  }),
  Gui.Control({
    Size = Vector2(414, 445),
    Location = Vector2(468, 40),
    BackgroundColor = colw,
    Skin = SkinF.battle_005,
    ComFuc.ComControl("right", Vector2(399, 399), Vector2(8, 40), 255, SkinF.personalInfo_131),
    ComFuc.SecMainTabBtn("btn_" .. 1, GetUTF8Text("button_common_Character_Info") .. " ", Vector2(110, 38), Vector2(26, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 2, GetUTF8Text("button_common_Skill_Info") .. " ", Vector2(110, 38), Vector2(140, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 3, GetUTF8Text("button_common_Equipment_Info") .. " ", Vector2(110, 38), Vector2(254, 4))
  }),
  Gui.Control("tab_1")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Name"), Vector2(64, 22), Vector2(13, 13), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Level"), Vector2(64, 22), Vector2(13, 45), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Class_Type"), Vector2(64, 22), Vector2(13, 77), 0, 16, colt),
    ComFuc.ComLabel("nam_r", "\195\251\179\198 :  HOLD_001", Vector2(375, 22), Vector2(77, 13), 0, 16, colt),
    ComFuc.ComLabel("lev_r", "\181\200\188\182 :  LV.30", Vector2(375, 22), Vector2(77, 47), 0, 16, colt),
    ComFuc.ComLabel("job_r", "\214\176\210\181 ;  \187\164\206\192\177\248", Vector2(375, 22), Vector2(115, 79), 0, 16, colt),
    ComFuc.ComLabel("pub_r", "\185\171\187\225 :  \206\229\185\226\202\174\201\171", Vector2(375, 22), Vector2(77, 111), 0, 16, colt),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Battlefield_Info"), Vector2(376, 24), Vector2(12, 194), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Victory"), Vector2(150, 18), Vector2(13, 228), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kills"), Vector2(150, 18), Vector2(13, 254), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kill_Streak"), Vector2(150, 18), Vector2(13, 280), 0, 16, colt),
    ComFuc.ComLabel("win_r", "", Vector2(260, 22), Vector2(120, 228), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("kil_r", "", Vector2(260, 22), Vector2(120, 254), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("max_r", "", Vector2(260, 22), Vector2(120, 280), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("suc_r", "", Vector2(260, 22), Vector2(120, 306), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComControl("job_h", Vector2(31, 31), Vector2(77, 72), 255, SkinF.personalInfo_job[1]),
    ExpBar.ComExpBar("bar_exp", Vector2(212, 23), Vector2(113, 46), 0, 1, SkinF.lobbyMain_expbar[1], SkinF.lobbyMain_expbar[2], "kAlignLeftMiddle")
  }),
  Gui.Control("tab_2")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Class_Skill"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("ski_1", Vector2(80, 80), Vector2(12, 34), 2, 1),
    ComCB("ski_2", Vector2(80, 80), Vector2(98, 34), 2, 2),
    ComCB("ski_3", Vector2(80, 80), Vector2(184, 34), 2, 3),
    ComCB("ski_4", Vector2(80, 80), Vector2(270, 34), 2, 4),
    ComCB("ski_5", Vector2(80, 80), Vector2(12, 124), 2, 5)
  }),
  Gui.Control("tab_3")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("button_common_Weapon"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Ring_Amor"), Vector2(376, 24), Vector2(12, 126), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Equipment_for_back"), Vector2(376, 24), Vector2(12, 246), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("wea_1", Vector2(80, 80), Vector2(12, 34), 3, 1),
    ComCB("wea_2", Vector2(80, 80), Vector2(98, 34), 3, 2),
    ComCB("wea_3", Vector2(80, 80), Vector2(184, 34), 3, 3),
    ComCB("ind_1", Vector2(80, 80), Vector2(12, 154), 4, 1),
    ComCB("ind_2", Vector2(80, 80), Vector2(98, 154), 4, 2),
    ComCB("ind_3", Vector2(80, 80), Vector2(12, 274), 4, 3),
    ComCB("ind_4", Vector2(80, 80), Vector2(98, 274), 4, 4)
  })
})
local DealBattleForce, DealPlayerInfo = function(data)
  ui.info_power.Text = data.pf + data.wf
  ui.pow_pf.Text = data.pf
  ui.pow_wf.Text = data.wf
end, Gui.Control("main")({
  Size = Vector2(888, 498),
  Dock = "kDockCenter",
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_207,
  Gui.Control({
    Size = Vector2(880, 31),
    Location = Vector2(4, 4),
    ComFuc.ComLabel("name_t", GetUTF8Text("tips_lobby_Common_Desc19"), Vector2(218, 22), Vector2(16, 0), 0, 16, colw),
    Gui.Button("colse")({
      Size = Vector2(24, 24),
      Location = Vector2(848, 1),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_002
    })
  }),
  Gui.Control({
    Size = Vector2(458, 442),
    Location = Vector2(6, 40),
    Gui.CharacterAnimCard({
      ID = 3,
      Size = Vector2(458, 442)
    }),
    Gui.Control({
      Size = Vector2(129, 70),
      Location = Vector2(7, 7),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(119, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Power"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel("info_power", 0, Vector2(120, 36), Vector2(10, 29), 0, 0, colw, nil, nil, true, SkinF.info_number_1)
    }),
    Gui.Control("power_hits")({
      Size = Vector2(400, 120),
      Location = Vector2(6, 80),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_004,
      Visible = false,
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc1"), Vector2(140, 21), Vector2(10, 6), 0, 16, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc2"), Vector2(140, 21), Vector2(210, 6), 0, 16, colw),
      ComFuc.ComLabel("pow_pf", 0, Vector2(100, 21), Vector2(150, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_wf", 0, Vector2(100, 21), Vector2(350, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_text", GetUTF8Text("tips_lobby_Ability_Desc3"), Vector2(380, 78), Vector2(10, 32), 0, 16, colw)
    }),
    Gui.Control({
      Size = Vector2(444, 70),
      Location = Vector2(7, 368),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(434, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 26), 255, SkinF.personalInfo_229[1]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 25), 255, SkinF.personalInfo_229[6]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 25), 255, SkinF.personalInfo_229[2]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 46), 255, SkinF.personalInfo_229[3]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 46), 255, SkinF.personalInfo_229[4]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 46), 255, SkinF.personalInfo_229[5]),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Character_Attribute"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_HP"), Vector2(72, 17), Vector2(34, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Stamina"), Vector2(72, 17), Vector2(172, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Vitality"), Vector2(72, 17), Vector2(310, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Recovery"), Vector2(72, 17), Vector2(34, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Amor"), Vector2(72, 17), Vector2(172, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Armor_Penetration"), Vector2(72, 17), Vector2(310, 43), 0, 14, colw),
      ComFuc.ComLabel("main_par_1", nil, Vector2(90, 17), Vector2(54, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_6", nil, Vector2(90, 17), Vector2(192, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_2", nil, Vector2(90, 17), Vector2(330, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_3", nil, Vector2(90, 17), Vector2(54, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_4", nil, Vector2(90, 17), Vector2(192, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_5", nil, Vector2(90, 17), Vector2(330, 43), 0, 14, colw, "kAlignRightMiddle")
    })
  }),
  Gui.Control({
    Size = Vector2(414, 445),
    Location = Vector2(468, 40),
    BackgroundColor = colw,
    Skin = SkinF.battle_005,
    ComFuc.ComControl("right", Vector2(399, 399), Vector2(8, 40), 255, SkinF.personalInfo_131),
    ComFuc.SecMainTabBtn("btn_" .. 1, GetUTF8Text("button_common_Character_Info") .. " ", Vector2(110, 38), Vector2(26, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 2, GetUTF8Text("button_common_Skill_Info") .. " ", Vector2(110, 38), Vector2(140, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 3, GetUTF8Text("button_common_Equipment_Info") .. " ", Vector2(110, 38), Vector2(254, 4))
  }),
  Gui.Control("tab_1")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Name"), Vector2(64, 22), Vector2(13, 13), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Level"), Vector2(64, 22), Vector2(13, 45), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Class_Type"), Vector2(64, 22), Vector2(13, 77), 0, 16, colt),
    ComFuc.ComLabel("nam_r", "\195\251\179\198 :  HOLD_001", Vector2(375, 22), Vector2(77, 13), 0, 16, colt),
    ComFuc.ComLabel("lev_r", "\181\200\188\182 :  LV.30", Vector2(375, 22), Vector2(77, 47), 0, 16, colt),
    ComFuc.ComLabel("job_r", "\214\176\210\181 ;  \187\164\206\192\177\248", Vector2(375, 22), Vector2(115, 79), 0, 16, colt),
    ComFuc.ComLabel("pub_r", "\185\171\187\225 :  \206\229\185\226\202\174\201\171", Vector2(375, 22), Vector2(77, 111), 0, 16, colt),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Battlefield_Info"), Vector2(376, 24), Vector2(12, 194), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Victory"), Vector2(150, 18), Vector2(13, 228), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kills"), Vector2(150, 18), Vector2(13, 254), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kill_Streak"), Vector2(150, 18), Vector2(13, 280), 0, 16, colt),
    ComFuc.ComLabel("win_r", "", Vector2(260, 22), Vector2(120, 228), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("kil_r", "", Vector2(260, 22), Vector2(120, 254), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("max_r", "", Vector2(260, 22), Vector2(120, 280), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("suc_r", "", Vector2(260, 22), Vector2(120, 306), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComControl("job_h", Vector2(31, 31), Vector2(77, 72), 255, SkinF.personalInfo_job[1]),
    ExpBar.ComExpBar("bar_exp", Vector2(212, 23), Vector2(113, 46), 0, 1, SkinF.lobbyMain_expbar[1], SkinF.lobbyMain_expbar[2], "kAlignLeftMiddle")
  }),
  Gui.Control("tab_2")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Class_Skill"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("ski_1", Vector2(80, 80), Vector2(12, 34), 2, 1),
    ComCB("ski_2", Vector2(80, 80), Vector2(98, 34), 2, 2),
    ComCB("ski_3", Vector2(80, 80), Vector2(184, 34), 2, 3),
    ComCB("ski_4", Vector2(80, 80), Vector2(270, 34), 2, 4),
    ComCB("ski_5", Vector2(80, 80), Vector2(12, 124), 2, 5)
  }),
  Gui.Control("tab_3")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("button_common_Weapon"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Ring_Amor"), Vector2(376, 24), Vector2(12, 126), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Equipment_for_back"), Vector2(376, 24), Vector2(12, 246), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("wea_1", Vector2(80, 80), Vector2(12, 34), 3, 1),
    ComCB("wea_2", Vector2(80, 80), Vector2(98, 34), 3, 2),
    ComCB("wea_3", Vector2(80, 80), Vector2(184, 34), 3, 3),
    ComCB("ind_1", Vector2(80, 80), Vector2(12, 154), 4, 1),
    ComCB("ind_2", Vector2(80, 80), Vector2(98, 154), 4, 2),
    ComCB("ind_3", Vector2(80, 80), Vector2(12, 274), 4, 3),
    ComCB("ind_4", Vector2(80, 80), Vector2(98, 274), 4, 4)
  })
})
local DealPlayerInfo, DealItemInfo = function(data)
  ComFuc.DealLookInfoEquip(data.player.equipAvatar)
  ComFuc.ClearLookInfoIndependentTrinket()
  if data.player.equips then
    for i, v in ipairs(data.player.equips) do
      lg:Set_Other_Player_Independent_Trinket(v.type, v.resource)
    end
  end
  ui.job_h.Skin = SkinF.personalInfo_job[data.player.occupation + 1]
  ui.nam_r.Text = data.player.name
  ui.lev_r.Text = data.player.level
  ui.job_r.Text = jobName[data.player.occupation + 1]
  ui.pub_r.Text = data.player.guildName or ""
  ui.win_r.Text = data.player.winNum .. " " .. GetUTF8Text("UI_lobby_Round_01")
  ui.kil_r.Text = string.format(GetUTF8Text("button_common_num_people"), data.player.killNum)
  ui.max_r.Text = string.format(GetUTF8Text("UI_lobby_Highest_person"), data.player.maxCombo)
  if data.player.totalNum == 0 then
    data.player.totalNum = 1
  end
  ui.suc_r.Text = data.player.winNum * 100 / data.player.totalNum .. "%"
  ExpBar.SetExpBar(ui.bar_exp, ui.bar_exp_c, ui.bar_exp_l, data.player.expCurrentLevelOffset, data.player.expNextLevelOffset)
  ui.main_par_2.Text = math.floor(data.player.cureQuantity) + ShowParAdd(2, data.player.cureQuantity_p)
  ui.main_par_3.Text = math.floor(data.player.recoveryCapacity) + ShowParAdd(3, data.player.recoveryCapacity_p)
  ui.main_par_4.Text = math.floor(data.player.armor) + ShowParAdd(4, data.player.armor_p)
  ui.main_par_5.Text = math.floor(data.player.arp) + ShowParAdd(5, data.player.arp_p)
  ui.main_par_6.Text = math.floor(data.player.stamina) + ShowParAdd(6, data.player.stamina_p)
  local tp = NumeralConst.CharacterTransform("\196\205\193\166", data.player.stamina + data.player.stamina_p, data.player.occupation + 1)
  ui.main_par_1.Text = data.player.life + ShowParAdd(1, tp)
  local tj = 0
  ui.main_par_1.Hint = string.format(GetUTF8Text("tips_lobby_Ability_Desc4"), data.player.life + tp)
  tj = NumeralConst.CharacterTransform("\187\238\193\166", data.player.cureQuantity + data.player.cureQuantity_p)
  local tt, n = string.gsub(GetUTF8Text("tips_lobby_Ability_Desc6"), "%%d", tj)
  ui.main_par_2.Hint = tt
  tj = NumeralConst.CharacterTransform("\187\214\184\180\193\166", data.player.recoveryCapacity + data.player.recoveryCapacity_p)
  ui.main_par_3.Hint = string.format(GetUTF8Text("tips_lobby_Ability_Desc7"), 5, tj)
  tj = NumeralConst.CharacterTransform("\187\164\188\215", data.player.armor + data.player.armor_p)
  tt, n = string.gsub(GetUTF8Text("tips_lobby_Ability_Desc8"), "%%d", tj)
  ui.main_par_4.Hint = tt
  ui.main_par_5.Hint = string.format(GetUTF8Text("tips_lobby_Ability_Desc9"), math.floor(data.player.arp) + math.floor(data.player.arp_p))
  ui.main_par_6.Hint = string.format(GetUTF8Text("tips_lobby_Ability_Desc5"), tp)
end, Gui.Control("main")({
  Size = Vector2(888, 498),
  Dock = "kDockCenter",
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_207,
  Gui.Control({
    Size = Vector2(880, 31),
    Location = Vector2(4, 4),
    ComFuc.ComLabel("name_t", GetUTF8Text("tips_lobby_Common_Desc19"), Vector2(218, 22), Vector2(16, 0), 0, 16, colw),
    Gui.Button("colse")({
      Size = Vector2(24, 24),
      Location = Vector2(848, 1),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_002
    })
  }),
  Gui.Control({
    Size = Vector2(458, 442),
    Location = Vector2(6, 40),
    Gui.CharacterAnimCard({
      ID = 3,
      Size = Vector2(458, 442)
    }),
    Gui.Control({
      Size = Vector2(129, 70),
      Location = Vector2(7, 7),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(119, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Power"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel("info_power", 0, Vector2(120, 36), Vector2(10, 29), 0, 0, colw, nil, nil, true, SkinF.info_number_1)
    }),
    Gui.Control("power_hits")({
      Size = Vector2(400, 120),
      Location = Vector2(6, 80),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_004,
      Visible = false,
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc1"), Vector2(140, 21), Vector2(10, 6), 0, 16, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc2"), Vector2(140, 21), Vector2(210, 6), 0, 16, colw),
      ComFuc.ComLabel("pow_pf", 0, Vector2(100, 21), Vector2(150, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_wf", 0, Vector2(100, 21), Vector2(350, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_text", GetUTF8Text("tips_lobby_Ability_Desc3"), Vector2(380, 78), Vector2(10, 32), 0, 16, colw)
    }),
    Gui.Control({
      Size = Vector2(444, 70),
      Location = Vector2(7, 368),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(434, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 26), 255, SkinF.personalInfo_229[1]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 25), 255, SkinF.personalInfo_229[6]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 25), 255, SkinF.personalInfo_229[2]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 46), 255, SkinF.personalInfo_229[3]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 46), 255, SkinF.personalInfo_229[4]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 46), 255, SkinF.personalInfo_229[5]),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Character_Attribute"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_HP"), Vector2(72, 17), Vector2(34, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Stamina"), Vector2(72, 17), Vector2(172, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Vitality"), Vector2(72, 17), Vector2(310, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Recovery"), Vector2(72, 17), Vector2(34, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Amor"), Vector2(72, 17), Vector2(172, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Armor_Penetration"), Vector2(72, 17), Vector2(310, 43), 0, 14, colw),
      ComFuc.ComLabel("main_par_1", nil, Vector2(90, 17), Vector2(54, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_6", nil, Vector2(90, 17), Vector2(192, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_2", nil, Vector2(90, 17), Vector2(330, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_3", nil, Vector2(90, 17), Vector2(54, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_4", nil, Vector2(90, 17), Vector2(192, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_5", nil, Vector2(90, 17), Vector2(330, 43), 0, 14, colw, "kAlignRightMiddle")
    })
  }),
  Gui.Control({
    Size = Vector2(414, 445),
    Location = Vector2(468, 40),
    BackgroundColor = colw,
    Skin = SkinF.battle_005,
    ComFuc.ComControl("right", Vector2(399, 399), Vector2(8, 40), 255, SkinF.personalInfo_131),
    ComFuc.SecMainTabBtn("btn_" .. 1, GetUTF8Text("button_common_Character_Info") .. " ", Vector2(110, 38), Vector2(26, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 2, GetUTF8Text("button_common_Skill_Info") .. " ", Vector2(110, 38), Vector2(140, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 3, GetUTF8Text("button_common_Equipment_Info") .. " ", Vector2(110, 38), Vector2(254, 4))
  }),
  Gui.Control("tab_1")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Name"), Vector2(64, 22), Vector2(13, 13), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Level"), Vector2(64, 22), Vector2(13, 45), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Class_Type"), Vector2(64, 22), Vector2(13, 77), 0, 16, colt),
    ComFuc.ComLabel("nam_r", "\195\251\179\198 :  HOLD_001", Vector2(375, 22), Vector2(77, 13), 0, 16, colt),
    ComFuc.ComLabel("lev_r", "\181\200\188\182 :  LV.30", Vector2(375, 22), Vector2(77, 47), 0, 16, colt),
    ComFuc.ComLabel("job_r", "\214\176\210\181 ;  \187\164\206\192\177\248", Vector2(375, 22), Vector2(115, 79), 0, 16, colt),
    ComFuc.ComLabel("pub_r", "\185\171\187\225 :  \206\229\185\226\202\174\201\171", Vector2(375, 22), Vector2(77, 111), 0, 16, colt),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Battlefield_Info"), Vector2(376, 24), Vector2(12, 194), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Victory"), Vector2(150, 18), Vector2(13, 228), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kills"), Vector2(150, 18), Vector2(13, 254), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kill_Streak"), Vector2(150, 18), Vector2(13, 280), 0, 16, colt),
    ComFuc.ComLabel("win_r", "", Vector2(260, 22), Vector2(120, 228), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("kil_r", "", Vector2(260, 22), Vector2(120, 254), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("max_r", "", Vector2(260, 22), Vector2(120, 280), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("suc_r", "", Vector2(260, 22), Vector2(120, 306), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComControl("job_h", Vector2(31, 31), Vector2(77, 72), 255, SkinF.personalInfo_job[1]),
    ExpBar.ComExpBar("bar_exp", Vector2(212, 23), Vector2(113, 46), 0, 1, SkinF.lobbyMain_expbar[1], SkinF.lobbyMain_expbar[2], "kAlignLeftMiddle")
  }),
  Gui.Control("tab_2")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Class_Skill"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("ski_1", Vector2(80, 80), Vector2(12, 34), 2, 1),
    ComCB("ski_2", Vector2(80, 80), Vector2(98, 34), 2, 2),
    ComCB("ski_3", Vector2(80, 80), Vector2(184, 34), 2, 3),
    ComCB("ski_4", Vector2(80, 80), Vector2(270, 34), 2, 4),
    ComCB("ski_5", Vector2(80, 80), Vector2(12, 124), 2, 5)
  }),
  Gui.Control("tab_3")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("button_common_Weapon"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Ring_Amor"), Vector2(376, 24), Vector2(12, 126), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Equipment_for_back"), Vector2(376, 24), Vector2(12, 246), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("wea_1", Vector2(80, 80), Vector2(12, 34), 3, 1),
    ComCB("wea_2", Vector2(80, 80), Vector2(98, 34), 3, 2),
    ComCB("wea_3", Vector2(80, 80), Vector2(184, 34), 3, 3),
    ComCB("ind_1", Vector2(80, 80), Vector2(12, 154), 4, 1),
    ComCB("ind_2", Vector2(80, 80), Vector2(98, 154), 4, 2),
    ComCB("ind_3", Vector2(80, 80), Vector2(12, 274), 4, 3),
    ComCB("ind_4", Vector2(80, 80), Vector2(98, 274), 4, 4)
  })
})
local DealItemInfo, SelBtn = function(data)
  itemDt = data
  for i, v in ipairs(data.slots) do
    local tp = v.type
    if tp == 1 then
      for k, p in ipairs(v) do
        ShowOneBtn(ui["ski_" .. k], ui["ski_" .. k .. "_s"], p.resource)
      end
    elseif tp == 2 then
      for k, p in ipairs(v) do
        ShowOneBtn(ui["wea_" .. k], ui["wea_" .. k .. "_s"], p.resource, tonumber(p.grade), ui["wea_" .. k .. "_son"])
      end
    end
  end
  local tj = 1
  for i, v in ipairs(data.equips) do
    local res = v.resource
    if tonumber(v.subType) == 102 then
      local str = "fuck = {" .. res .. "}"
      local a = rpc.load_result(str)
      res = a.fuck[1]
      ShowOneBtn(ui.ind_3, ui.ind_3_s, res, tonumber(v.grade), ui.ind_3_son)
      
      function ui.ind_3_s.EventMouseEnter(sender, e)
        Tip.SetRpc(tip_player_interface[2], {
          t = 2,
          pid = v.itemid
        })
        Tip.SetUseDescription(false)
        Tip.SetOwner(sender)
      end
    elseif tonumber(v.subType) == 103 then
      ShowOneBtn(ui["ind_" .. tj], ui["ind_" .. tj .. "_s"], res, tonumber(v.grade), ui["ind_" .. tj .. "_son"])
      ui["ind_" .. tj .. "_s"].EventMouseEnter = function(sender, e)
        Tip.SetRpc(tip_player_interface[2], {
          t = 2,
          pid = v.itemid
        })
        Tip.SetUseDescription(false)
        Tip.SetOwner(sender)
      end
      tj = tj + 1
    end
  end
end, Gui.Control("main")({
  Size = Vector2(888, 498),
  Dock = "kDockCenter",
  BackgroundColor = colw,
  Skin = SkinF.personalInfo_207,
  Gui.Control({
    Size = Vector2(880, 31),
    Location = Vector2(4, 4),
    ComFuc.ComLabel("name_t", GetUTF8Text("tips_lobby_Common_Desc19"), Vector2(218, 22), Vector2(16, 0), 0, 16, colw),
    Gui.Button("colse")({
      Size = Vector2(24, 24),
      Location = Vector2(848, 1),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_002
    })
  }),
  Gui.Control({
    Size = Vector2(458, 442),
    Location = Vector2(6, 40),
    Gui.CharacterAnimCard({
      ID = 3,
      Size = Vector2(458, 442)
    }),
    Gui.Control({
      Size = Vector2(129, 70),
      Location = Vector2(7, 7),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(119, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Power"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel("info_power", 0, Vector2(120, 36), Vector2(10, 29), 0, 0, colw, nil, nil, true, SkinF.info_number_1)
    }),
    Gui.Control("power_hits")({
      Size = Vector2(400, 120),
      Location = Vector2(6, 80),
      BackgroundColor = colw,
      Skin = SkinF.lookInfo_004,
      Visible = false,
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc1"), Vector2(140, 21), Vector2(10, 6), 0, 16, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_lobby_Ability_Desc2"), Vector2(140, 21), Vector2(210, 6), 0, 16, colw),
      ComFuc.ComLabel("pow_pf", 0, Vector2(100, 21), Vector2(150, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_wf", 0, Vector2(100, 21), Vector2(350, 6), 0, 16, coly),
      ComFuc.ComLabel("pow_text", GetUTF8Text("tips_lobby_Ability_Desc3"), Vector2(380, 78), Vector2(10, 32), 0, 16, colw)
    }),
    Gui.Control({
      Size = Vector2(444, 70),
      Location = Vector2(7, 368),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_225,
      ComFuc.ComControl(nil, Vector2(434, 60), Vector2(5, 3), 255, SkinF.personalInfo_228),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 26), 255, SkinF.personalInfo_229[1]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 25), 255, SkinF.personalInfo_229[6]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 25), 255, SkinF.personalInfo_229[2]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(13, 46), 255, SkinF.personalInfo_229[3]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(151, 46), 255, SkinF.personalInfo_229[4]),
      ComFuc.ComControl(nil, Vector2(20, 17), Vector2(289, 46), 255, SkinF.personalInfo_229[5]),
      ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Character_Attribute"), Vector2(70, 20), Vector2(14, 5), 0, 14, coly),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_HP"), Vector2(72, 17), Vector2(34, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Stamina"), Vector2(72, 17), Vector2(172, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Vitality"), Vector2(72, 17), Vector2(310, 23), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Recovery"), Vector2(72, 17), Vector2(34, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Amor"), Vector2(72, 17), Vector2(172, 43), 0, 14, colw),
      ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Armor_Penetration"), Vector2(72, 17), Vector2(310, 43), 0, 14, colw),
      ComFuc.ComLabel("main_par_1", nil, Vector2(90, 17), Vector2(54, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_6", nil, Vector2(90, 17), Vector2(192, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_2", nil, Vector2(90, 17), Vector2(330, 23), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_3", nil, Vector2(90, 17), Vector2(54, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_4", nil, Vector2(90, 17), Vector2(192, 43), 0, 14, colw, "kAlignRightMiddle"),
      ComFuc.ComLabel("main_par_5", nil, Vector2(90, 17), Vector2(330, 43), 0, 14, colw, "kAlignRightMiddle")
    })
  }),
  Gui.Control({
    Size = Vector2(414, 445),
    Location = Vector2(468, 40),
    BackgroundColor = colw,
    Skin = SkinF.battle_005,
    ComFuc.ComControl("right", Vector2(399, 399), Vector2(8, 40), 255, SkinF.personalInfo_131),
    ComFuc.SecMainTabBtn("btn_" .. 1, GetUTF8Text("button_common_Character_Info") .. " ", Vector2(110, 38), Vector2(26, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 2, GetUTF8Text("button_common_Skill_Info") .. " ", Vector2(110, 38), Vector2(140, 4)),
    ComFuc.SecMainTabBtn("btn_" .. 3, GetUTF8Text("button_common_Equipment_Info") .. " ", Vector2(110, 38), Vector2(254, 4))
  }),
  Gui.Control("tab_1")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Name"), Vector2(64, 22), Vector2(13, 13), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Level"), Vector2(64, 22), Vector2(13, 45), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("tips_abilities_Class_Type"), Vector2(64, 22), Vector2(13, 77), 0, 16, colt),
    ComFuc.ComLabel("nam_r", "\195\251\179\198 :  HOLD_001", Vector2(375, 22), Vector2(77, 13), 0, 16, colt),
    ComFuc.ComLabel("lev_r", "\181\200\188\182 :  LV.30", Vector2(375, 22), Vector2(77, 47), 0, 16, colt),
    ComFuc.ComLabel("job_r", "\214\176\210\181 ;  \187\164\206\192\177\248", Vector2(375, 22), Vector2(115, 79), 0, 16, colt),
    ComFuc.ComLabel("pub_r", "\185\171\187\225 :  \206\229\185\226\202\174\201\171", Vector2(375, 22), Vector2(77, 111), 0, 16, colt),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Battlefield_Info"), Vector2(376, 24), Vector2(12, 194), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Victory"), Vector2(150, 18), Vector2(13, 228), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kills"), Vector2(150, 18), Vector2(13, 254), 0, 16, colt),
    ComFuc.ComLabel(nil, GetUTF8Text("UI_lobby_Kill_Streak"), Vector2(150, 18), Vector2(13, 280), 0, 16, colt),
    ComFuc.ComLabel("win_r", "", Vector2(260, 22), Vector2(120, 228), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("kil_r", "", Vector2(260, 22), Vector2(120, 254), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("max_r", "", Vector2(260, 22), Vector2(120, 280), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComLabel("suc_r", "", Vector2(260, 22), Vector2(120, 306), 0, 16, colb, "kAlignRightMiddle"),
    ComFuc.ComControl("job_h", Vector2(31, 31), Vector2(77, 72), 255, SkinF.personalInfo_job[1]),
    ExpBar.ComExpBar("bar_exp", Vector2(212, 23), Vector2(113, 46), 0, 1, SkinF.lobbyMain_expbar[1], SkinF.lobbyMain_expbar[2], "kAlignLeftMiddle")
  }),
  Gui.Control("tab_2")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("UI_lobby_Class_Skill"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("ski_1", Vector2(80, 80), Vector2(12, 34), 2, 1),
    ComCB("ski_2", Vector2(80, 80), Vector2(98, 34), 2, 2),
    ComCB("ski_3", Vector2(80, 80), Vector2(184, 34), 2, 3),
    ComCB("ski_4", Vector2(80, 80), Vector2(270, 34), 2, 4),
    ComCB("ski_5", Vector2(80, 80), Vector2(12, 124), 2, 5)
  }),
  Gui.Control("tab_3")({
    Size = Vector2(399, 399),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("button_common_Weapon"), Vector2(376, 24), Vector2(12, 6), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Ring_Amor"), Vector2(376, 24), Vector2(12, 126), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComFuc.ComLabel(nil, " " .. GetUTF8Text("tips_abilities_Equipment_for_back"), Vector2(376, 24), Vector2(12, 246), 255, 16, colw, nil, SkinF.lookInfo_003),
    ComCB("wea_1", Vector2(80, 80), Vector2(12, 34), 3, 1),
    ComCB("wea_2", Vector2(80, 80), Vector2(98, 34), 3, 2),
    ComCB("wea_3", Vector2(80, 80), Vector2(184, 34), 3, 3),
    ComCB("ind_1", Vector2(80, 80), Vector2(12, 154), 4, 1),
    ComCB("ind_2", Vector2(80, 80), Vector2(98, 154), 4, 2),
    ComCB("ind_3", Vector2(80, 80), Vector2(12, 274), 4, 3),
    ComCB("ind_4", Vector2(80, 80), Vector2(98, 274), 4, 4)
  })
})

function SelBtn(i)
  if i == 1 and isFirst1 then
    isFirst1 = false
    rpc.safecall("player_info", {playerId = roleId}, DealPlayerInfo)
    rpc.safecall("player_battle_force_get", {cid = roleId}, DealBattleForce)
  end
  if i == 2 and isFirst2 then
    isFirst2 = false
    rpc.safecall("item_info", {playerId = roleId}, DealItemInfo)
  end
  if i == 3 and isFirst2 then
    isFirst2 = false
    rpc.safecall("item_info", {playerId = roleId}, DealItemInfo)
  end
  for k = 1, 3 do
    if i == k then
      ui["btn_" .. k].PushDown = true
      ui["tab_" .. k].Parent = ui.right
    else
      ui["btn_" .. k].PushDown = false
      ui["tab_" .. k].Parent = nil
    end
  end
end

for i = 1, 3 do
  ui["btn_" .. i].EventClick = function(sender, e)
    SelBtn(i)
  end
end

function ui.colse.EventClick(sender, e)
  ui.coverControl2.Parent = nil
  ui.main.Parent = nil
end

function ui.info_power.EventMouseEnter(sender, e)
  ui.power_hits.Visible = true
end

function ui.info_power.EventMouseLeave(sender, e)
  ui.power_hits.Visible = false
end

function Show(pid)
  gui:PlayAudio("prompt")
  isFirst1 = true
  isFirst2 = true
  roleId = pid
  for i = 1, 5 do
    ui["ski_" .. i].Visible = false
    if i <= 4 then
      ui["ind_" .. i].Visible = false
      if i ~= 4 then
        ui["wea_" .. i].Visible = false
      end
    end
  end
  SelBtn(1)
  ui.coverControl2.Parent = gui
  ui.main.Parent = gui
  Gui.Align(ui.main, 0.5, 0.5)
end
