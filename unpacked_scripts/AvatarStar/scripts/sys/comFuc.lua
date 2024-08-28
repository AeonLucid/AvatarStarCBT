module("ComFuc", package.seeall)
local moveCtrlScale = 1.1
col0 = ARGB(0, 0, 0, 0)
colw = ARGB(255, 255, 255, 255)
colg = ARGB(255, 0, 255, 198)
coly = ARGB(255, 255, 214, 50)
cols = ARGB(255, 62, 26, 1)
colh = ARGB(255, 160, 160, 160)
colp = ARGB(128, 255, 255, 255)
hkB = Vector2(76, 744)
hkS = Vector2(88, 80)
dtB = Vector2(570, 661)
dtS = Vector2(58, 63)
dtcB = Vector2(464, 639)
dpB = Vector2(602, 314)
dpS = Vector2(86, 84)
dpC = Vector2(6, 4)
dpcB = Vector2(481, 292)
cdB = Vector2(591, 316)
cdS = Vector2(107, 166)
cdC = Vector2(5, 2)
cdcB = Vector2(470, 294)
slB = Vector2(265, 273)
slS = Vector2(80, 80)
csB = Vector2(147, 217)
csS = Vector2(310, 490)
elS = Vector2(80, 80)
epBC = Vector2(214, 218)
hpBC = Vector2(214, 209)
hpBL = {
  Vector2(262, 235),
  Vector2(461, 336),
  Vector2(461, 442),
  Vector2(262, 533),
  Vector2(63, 336),
  Vector2(63, 442)
}
epBL = {
  Vector2(461, 482),
  Vector2(437, 275),
  Vector2(63, 482),
  Vector2(461, 388),
  Vector2(6, 0),
  Vector2(63, 388)
}
rwB = Vector2(257, 350)
rwS = Vector2(80, 80)
icB = Vector2(251, 414)
ilS = Vector2(80, 80)
ilBL = {
  Vector2(262, 616),
  Vector2(110, 406),
  Vector2(407, 406),
  Vector2(110, 553),
  Vector2(407, 553)
}
mlS = Vector2(80, 80)
mlBL = {
  Vector2(258, 302),
  Vector2(403, 406),
  Vector2(355, 575),
  Vector2(159, 575),
  Vector2(114, 406)
}
maS = Vector2(64, 64)
maBl = {
  Vector2(23, 669),
  Vector2(95, 669),
  Vector2(167, 669),
  Vector2(239, 669),
  Vector2(311, 669)
}
depotS = {
  24,
  24,
  24,
  10
}
reinfS = {
  5,
  12,
  36,
  12,
  12
}
skillPointL = {
  0,
  74,
  146,
  218,
  290,
  364
}
equipMapKey = {
  2,
  0,
  3,
  1,
  0,
  4
}
refitHas = {
  2.7,
  5.9,
  9.4,
  13.4,
  18,
  23,
  28.7,
  35,
  42.1,
  50
}
locationChanged = 0
globalGP = 0
globalMB = 0
globalTB = 0
globalLV = 0
globalEXP = 0
globalEXPP = 0
globalEXPN = 0
globalNewMail = false
fromSelToLobby = true
fromSelToLobby2 = true
hasWeaponCount = 0
hasWeaponNoTime = 0
hasEquipNoTime = 0
leadList = 0
isFromNew = 0
taskLists = nil
fromAToL = false
selToLobbyState = 0
isCrossNew = true
taskPart = nil
isReadyStart = false
isReadyMatch = false
isInRoom = false
isVIP = false
isInGame = false
globalGainSkillP = 0
isFromGame = false
local tip_sys_interface = {
  "tip_sys_skill",
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_item",
  "tip_sys_avatar",
  "tip_sys_avatar"
}
local tip_player_interface = {
  "tip_player_skill",
  "tip_player_item",
  "tip_player_item",
  "tip_player_item",
  "tip_player_avatar",
  "tip_player_avatar"
}
partc1 = gui:AddParticle("ingame_loading", Vector2(ComFuc.locationChanged + 1008, 845), Vector3(0, 1, 0))
partc1:SetEnable(false)

function ComComplex(fuc, p, q, d1, d2, d3, d4, d5)
  local a = {}
  for i = p, math.min(q, 240) do
    a[i] = fuc(i, d1, d2, d3, d4, d5)
  end
  return a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30], a[31], a[32], a[33], a[34], a[35], a[36], a[37], a[38], a[39], a[40], a[41], a[42], a[43], a[44], a[45], a[46], a[47], a[48], a[49], a[50], a[51], a[52], a[53], a[54], a[55], a[56], a[57], a[58], a[59], a[60], a[61], a[62], a[63], a[64], a[65], a[66], a[67], a[68], a[69], a[70], a[71], a[72], a[73], a[74], a[75], a[76], a[77], a[78], a[79], a[80], a[81], a[82], a[83], a[84], a[85], a[86], a[87], a[88], a[89], a[90], a[91], a[92], a[93], a[94], a[95], a[96], a[97], a[98], a[99], a[100], a[101], a[102], a[103], a[104], a[105], a[106], a[107], a[108], a[109], a[110], a[111], a[112], a[113], a[114], a[115], a[116], a[117], a[118], a[119], a[120], a[121], a[122], a[123], a[124], a[125], a[126], a[127], a[128], a[129], a[130], a[131], a[132], a[133], a[134], a[135], a[136], a[137], a[138], a[139], a[140], a[141], a[142], a[143], a[144], a[145], a[146], a[147], a[148], a[149], a[150], a[151], a[152], a[153], a[154], a[155], a[156], a[157], a[158], a[159], a[160], a[161], a[162], a[163], a[164], a[165], a[166], a[167], a[168], a[169], a[170], a[171], a[172], a[173], a[174], a[175], a[176], a[177], a[178], a[179], a[180], a[181], a[182], a[183], a[184], a[185], a[186], a[187], a[188], a[189], a[190], a[191], a[192], a[193], a[194], a[195], a[196], a[197], a[198], a[199], a[200], a[201], a[202], a[203], a[204], a[205], a[206], a[207], a[208], a[209], a[210], a[211], a[212], a[213], a[214], a[215], a[216], a[217], a[218], a[219], a[220], a[221], a[222], a[223], a[224], a[225], a[226], a[227], a[228], a[229], a[230], a[231], a[232], a[233], a[234], a[235], a[236], a[237], a[238], a[239], a[240]
end

function ComLabel(name, text, size, lc, alpha, fontSize, textColor, align, skin, visible, textureF)
  return Gui.Label(name)({
    Size = size,
    Location = lc,
    Text = text,
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    FontSize = fontSize,
    TextColor = textColor,
    Skin = skin,
    TextAlign = align,
    Visible = visible,
    TextureFont = textureF
  })
end

function ComControl(name, size, lc, alpha, skin, visible, enable, bg)
  return Gui.Control(name)({
    Size = size,
    Location = lc,
    BackgroundColor = bg or ARGB(alpha, 255, 255, 255),
    Skin = skin,
    Visible = visible,
    Enable = enable
  })
end

function ComControlAddPt(name, size, lc, ptName)
  return Gui.Control(name)({
    Enable = false,
    Size = size,
    Location = lc,
    Particle = gui:CreateParticle(ptName)
  })
end

function ComButton(name, text, size, lc, fontSize, canPD, canmvoe, skin, enable, ado)
  return Gui.Button(name)({
    Size = size or Vector2(84, 40),
    Location = lc,
    Text = text,
    FontSize = fontSize,
    CanPushDown = canPD,
    CanMove = canmvoe,
    Skin = skin,
    Enable = enable,
    ClickAudio = ado
  })
end

function ComLcButton(name, text, size, lc, fontSize, canPD, canmvoe, skin, enable)
  return Gui.LcButton(name)({
    Style = "Gui.Button",
    Size = size,
    Location = lc,
    Text = text,
    FontSize = fontSize,
    CanPushDown = canPD,
    CanMove = canmvoe,
    Skin = skin,
    Enable = enable
  })
end

function ComMenu(name)
  return Gui.Menu(name)({})
end

function ComNumFlash(name, lc)
  return Gui.NumFlash(name)({
    Size = Vector2(125, 36),
    Location = lc
  })
end

function ComBtnHasPreIcon(name, text, size, size2, lc, fontSize, canPD, canmvoe, skin, skin2, lcx, enable, ado)
  return Gui.Button(name)({
    Size = size or Vector2(84, 40),
    Location = lc,
    Text = text,
    FontSize = fontSize,
    CanPushDown = canPD,
    CanMove = canmvoe,
    Enable = enable,
    Skin = skin,
    ClickAudio = ado,
    ComControl(nil, size2, Vector2(lcx, (size.y - size2.y) / 2), 255, skin2)
  })
end

function MainTabBtn(name, text, lc, size, skin)
  return Gui.Button(name)({
    Size = size or Vector2(206, 42),
    Location = lc,
    CanPushDown = true,
    Text = text,
    TextColor = ARGB(255, 255, 255, 255),
    HighlightTextColor = ARGB(0, 0, 0, 0),
    TextShadowColor = ARGB(255, 82, 54, 44),
    FontSize = 16,
    Skin = skin or SkinF.personalInfo_097,
    ClickAudio = "menu2nd"
  })
end

function ComBreathingCtrl(name, size, lc, alpha, skin, visible)
  return Gui.BreathingCtrl(name)({
    Size = size,
    FirstSize = size,
    Location = lc,
    FirstLocation = lc,
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    Skin = skin,
    Visible = visible
  })
end

function ComLobbyBCTip(i, name, size, alpha, skin)
  return Gui.LobbyBCTip("btn_m_" .. i .. "_c")({
    Size = Vector2(72, 73),
    BackgroundColor = ARGB(0, 255, 255, 255),
    Skin = SkinF.personalInfo_230[i][3],
    ComControl(nil, Vector2(72, 73), Vector2(0, 0), 255, SkinF.personalInfo_230[i][1])
  })
end

function LobbyMainTabButton(i, lc)
  return Gui.Button("btn_m_" .. i)({
    Size = Vector2(72, 73),
    Location = lc,
    Skin = SkinF.lobbyMain_057,
    ClickAudio = "",
    ComLobbyBCTip(i),
    ComControl(nil, Vector2(72, 73), Vector2(0, 0), 255, SkinF.personalInfo_230[i][2])
  })
end

function BtmButton(name, lc, skin)
  return Gui.Button(name)({
    Size = Vector2(44, 38),
    Location = lc,
    Skin = SkinF.lobbyMain_059,
    ComControl(name .. "_img", Vector2(44, 38), Vector2(0, 0), 255, skin)
  })
end

function SecMainTabBtn(name, text, size, lc)
  return Gui.Button(name)({
    Size = size,
    Location = lc,
    CanPushDown = true,
    Text = text,
    TextColor = ARGB(255, 82, 54, 44),
    TextShadowColor = ARGB(0, 0, 0, 0),
    HighlightTextColor = ARGB(255, 82, 54, 44),
    DisabledTextColor = ARGB(255, 82, 54, 44),
    FontSize = 16,
    Skin = SkinF.personalInfo_121
  })
end

function ComDragBtn(name, text, size, lc, fontSize, alpha, canPD, skin, visible)
  return Gui.DragBtn(name)({
    Size = size,
    Location = lc,
    Text = text,
    FontSize = fontSize,
    CanPushDown = canPD,
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    Skin = skin,
    Visible = visible
  })
end

function ComHeadPhotoCard(name, lc, id, skin)
  return Gui.Control({
    Size = Vector2(126, 126),
    Location = lc,
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = skin,
    Gui.HeadPhotoCard(name)({
      Size = Vector2(110, 110),
      Location = Vector2(8, 3),
      BackgroundColor = ARGB(0, 0, 0, 0),
      ID = id
    })
  })
end

function ComHeadMessage(lc, id, size, name)
  return Gui.HeadPhotoCard(name)({
    Size = size,
    Location = lc,
    BackgroundColor = ARGB(0, 0, 0, 0),
    ID = id
  })
end

function ComCharacterStaticCard(name, id, enable, fromlobby)
  return Gui.CharacterStaticCard(name)({
    Size = Vector2(79, 116),
    Location = Vector2(13, 21),
    BackgroundColor = ARGB(0, 0, 0, 0),
    ID = id,
    Enable = enable,
    For_Lobby = fromlobby
  })
end

function ComAutoLcLabel(name, alpha, skin, enable, text)
  return Gui.AutoLcLabel(name)({
    AutoSize = true,
    TextPadding = Vector4(18, 12, 18, 18),
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    Skin = skin,
    FontSize = 16,
    Enable = enable,
    Text = text
  })
end

function ComRotateBtn(name, text, size, lc, fontSize, canPD, skin)
  return Gui.RotateBtn(name)({
    Style = "Gui.Button",
    Size = size,
    Location = lc,
    Text = text,
    FontSize = fontSize,
    BackgroundColor = ARGB(255, 255, 255, 255),
    CanPushDown = canPD,
    Skin = skin
  })
end

function ComFloatingControl(name)
  return Gui.FloatingControl(name)({
    BackgroundColor = ARGB(255, 255, 255, 255)
  })
end

function ComAvtButton(name, size, lc, alpha, canPD, enable, skin)
  return Gui.AvtButton(name)({
    Size = size,
    Location = lc,
    CanPushDown = canPD,
    Enable = enable,
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    Skin = skin
  })
end

function ComNewAvtButton(name, size, lc, canPd, enable, skin)
  return Gui.NewAvtButton(name)({
    Size = size,
    Location = lc,
    CanPushDown = canPD,
    Visible = enable,
    Skin = skin,
    ClickAudio = "pickup_decal"
  })
end

function ComLayerButton(name, size, lc, id)
  return Gui.LayerButton(name)({
    Size = size,
    Location = lc,
    ID = id,
    LayerCurrent = id - 1,
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.avatar_main_074
  })
end

function AvtEditButton(name, lc, skin)
  return Gui.AvtEditBtn(name)({
    Size = Vector2(42, 38),
    Location = lc,
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = skin
  })
end

function ComPersonalMainBtn(name, text, size, lc, fontSize, canPD, skin)
  return Gui.PersonalMainBtn(name)({
    Style = "Gui.Button",
    Size = size,
    Location = lc,
    Text = text,
    FontSize = fontSize,
    CanPushDown = canPD,
    Skin = skin
  })
end

function ComBtnLab(name, size, lc, canPD, skin, skinSelf)
  return Gui.Button(name)({
    Size = size,
    Location = lc,
    CanPushDown = canPD,
    Skin = skinSelf,
    ComControl(nil, size, Vector2(0, 0), 255, skin)
  })
end

function ComTextBox(name, text, size, lc, ml)
  return Gui.Textbox(name)({
    Location = lc,
    Size = size,
    Text = text,
    FontSize = 16,
    BackgroundColor = ARGB(255, 255, 255, 255),
    MaxLength = ml or 50
  })
end

function ComCheckBox(name, text, size, lc, fontSize, textColor, style)
  return Gui.CheckBox(name)({
    Style = style,
    Location = lc,
    Size = size,
    Text = text,
    FontSize = fontSize,
    TextColor = textColor
  })
end

function ComTextArea(name, size, lc, fontSize, textColor, maxLength)
  return Gui.TextArea(name)({
    Style = "Mail.TextArea",
    Size = size,
    Location = lc,
    Text = "hello \196\227\186\195\163\161\n hello \196\227\186\195\163\161hello \196\227\186\195\163\161hello \196\227\186\195\163\161hello \196\227\186\195\163\161",
    FontSize = fontSize,
    TextColor = textColor,
    MaxLength = maxLength
  })
end

function ComPageBar(name, lc)
  return Gui.NewPageBar(name)({
    Size = Vector2(163, 43),
    Location = lc,
    CurrIndex = 1
  })
end

function ComPagesBar(name, lc)
  return Gui.NewPagesBar(name)({
    Size = Vector2(260, 36),
    Location = lc
  })
end

function ComProportionBar(name, size, lc, maxV, currV, icon)
  return Gui.ProportionBar(name)({
    Size = size,
    Location = lc,
    MaxValue = maxV,
    CurrentValue = currV,
    TextColor = ARGB(255, 255, 255, 0),
    TextShadowColor = ARGB(255, 0, 0, 0),
    DrawValueText = true,
    Icon = icon or Gui.ProportionIcon("/ui/skinF/skin_common_expbg.tga", "/ui/skinF/skin_common_exp.tga", Vector4(0, 0, 0, 0), Vector4(0, 0, 0, 0))
  })
end

function ComProBar(name, size, lc, maxV, currV)
  return Gui.Control({})
end

function ComComboBox(name, size, lc)
  return Gui.ComboBox(name)({Size = size, Location = lc})
end

function ComItemCB(name, lc, text)
  return Gui.Control(name)({
    Size = Vector2(80, 80),
    Location = lc,
    ComControl(name .. "_lev", Vector2(80, 80), Vector2(0, 0), 255),
    ComControl(name .. "_res", Vector2(80, 80), Vector2(0, 0), 255),
    ComLabel(name .. "_count", text, Vector2(36, 18), Vector2(43, 59), 0, 0, colw, "kAlignRightMiddle", 0, true, SkinF.hecheng_number_1)
  })
end

function CancelBtn(size, lc)
  return Gui.Button({
    Size = size,
    Location = lc,
    Text = GetUTF8Text("button_common_Cancel"),
    EventClick = function(sender, e)
      ModalWindow.Close()
    end
  })
end

function PopControl(name, size, text, locy, class)
  return Gui.Control(name)({
    Size = size,
    Dock = "kDockCenter",
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    Gui.Control({
      Size = Vector2(size.x, 40),
      ComLabel(name .. "title", "  " .. text, Vector2(size.x - 8, 21), Vector2(4, 4), 0, 16, ARGB(255, 255, 255, 255)),
      Gui.Button(name .. "_cha")({
        Size = Vector2(24, 24),
        Location = Vector2(size.x - 32, 3),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.lookInfo_002,
        EventClick = function(sender, e)
          if class == 1 then
          else
            ModalWindow.Close()
          end
        end
      })
    }),
    Gui.Control(name .. "_son")({
      Size = Vector2(size.x, size.y - 40),
      Location = Vector2(0, locy)
    })
  })
end

function ComGuildIconFlag(name, lc, size)
  return Gui.Control({
    Location = lc,
    Size = size or Vector2(64, 64),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_083[1],
    Gui.Button(name .. "_b")({
      Size = size or Vector2(64, 64),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Visible = false,
      CanPushDown = true,
      Gui.Control(name .. "_c")({
        Size = size or Vector2(64, 64),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.guild_018,
        Visible = false
      })
    })
  })
end

function ComFlashNew(name, size, lc, alpha, skin, visible)
  return Gui.FlashNew(name)({
    Size = size,
    Location = lc,
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    Skin = skin,
    Enable = false,
    Visible = visible
  })
end

function ComFlashArrow(name, size, lc, alpha, skin, visible, text)
  return Gui.FlashArrow(name)({
    FirstSize = size,
    Size = size,
    FirstLc = lc,
    BackgroundColor = ARGB(alpha, 255, 255, 255),
    Skin = skin,
    Enable = false,
    Visible = visible,
    ComLabel(nil, text, size, Vector2(0, 0), 0, 14, colw, "kAlignCenterMiddle")
  })
end

function SetOneLeadFinish(i)
  leadList = leadList - i
  rpc.safecall("player_tutorial_finish", {tutorial = leadList}, nil)
end

function ComIconButton(name, size, lc, icon, text, skin, eventClick)
  return Gui.Button(name)({
    Size = size,
    Location = lc,
    TextAlign = "kAlignLeftMiddle",
    CanMove = true,
    Skin = skin,
    EventClick = eventClick,
    Gui.Label(name .. "_lbl")({
      Dock = "kDockFill",
      Margin = Vector4(2, 0, 0, 0),
      Text = text,
      FontSize = 16,
      TextColor = ARGB(255, 255, 255, 255),
      TextAlign = "kAlignLeftMiddle",
      Icon = icon,
      IconTextSpace = -2
    })
  })
end

function ComMoveControl()
  return Gui.Control("moveControl")({
    BackgroundColor = colw,
    Skin = SkinF.skin_touming,
    ComControl("moveControl_son", Vector2(0, 0), Vector2(0, 0), 255)
  })
end

function ComMoveCard()
  return Gui.Control("moveCard")({
    BackgroundColor = colw,
    Skin = SkinF.skin_touming,
    Gui.Control("moveCard_son")({
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_143,
      ComFuc.ComCharacterStaticCard("moveCard_s", -1),
      ComFuc.ComControl("moveCard_c", Vector2(0, 0), Vector2(0, 0), 255, SkinF.personalInfo_144)
    })
  })
end

function LimitControl(name, size, lc, skin, alp)
  local a = 255
  if alp then
    a = alp
  end
  return Gui.Control(name)({
    Location = lc,
    ComControl(name .. "_s", size, Vector2(0, 0), a, skin)
  })
end

function HotKeyCB(i)
  return Gui.Control({
    Size = Vector2(80, 80),
    Location = Vector2(-60 + 88 * i, 33),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_064,
    ComControl("hot_key_p_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_094),
    Gui.DragBtn("hot_key_b_" .. i)({
      Size = Vector2(80, 80),
      Skin = SkinF.skin_touming2,
      ComControl("hot_key_bs_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_231, false),
      Gui.FlashNew("hot_key_c_" .. i)({
        Size = Vector2(80, 80),
        BackgroundColor = colw,
        Skin = SkinF.personalInfo_065[1],
        IsReady = false,
        ComLabel("hot_key_l_" .. i, nil, Vector2(70, 23), Vector2(5, 61), 0, 14, colw, "kAlignCenter"),
        ComLabel("hot_key_l2_" .. i, nil, Vector2(36, 18), Vector2(43, 4), 0, 0, col0, "kAlignRightMiddle", nil, false, SkinF.hecheng_number_1),
        Gui.Control({
          Size = Vector2(80, 80),
          BackgroundColor = colw,
          Skin = SkinF.skin_touming,
          EventMouseEnter = function(sender, e)
            if PersonalInfo and PersonalInfo.htkDt[i] and PersonalInfo.htkDt[i].type then
              ShowDepotTips(sender, PersonalInfo.htkDt[i].type, PersonalInfo.htkDt[i].type, PersonalInfo.htkDt[i].itemid)
            end
            sender.Skin = SkinF.personalInfo_210
          end,
          EventMouseLeave = function(sender, e)
            sender.Skin = SkinF.skin_touming
          end
        })
      })
    })
  })
end

function DepotCB(i, name, beginX, beginY, type, mud)
  return Gui.Control({
    Location = ComputLocation(i, beginX, beginY, 6, 86, 84),
    Size = Vector2(80, 80),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_083[1],
    ComControl(name .. "_p_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_092),
    Gui.DragBtn(name .. "_b_" .. i)({
      Size = Vector2(80, 80),
      Skin = SkinF.skin_touming2,
      ComControl(name .. "_bs_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_231, false),
      Gui.Control(name .. "_c_" .. i)({
        Size = Vector2(80, 80),
        Skin = SkinF.personalInfo_140[1],
        ComLabel(name .. "_l_" .. i, nil, Vector2(60, 18), Vector2(20, 59), 0, 0, col0, "kAlignRightMiddle", nil, false, SkinF.hecheng_number_1),
        ComControl(name .. "_new_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_233[1], false),
        Gui.Control({
          Size = Vector2(80, 80),
          BackgroundColor = colw,
          Skin = SkinF.skin_touming,
          EventMouseEnter = function(sender, e)
            sender.Skin = SkinF.personalInfo_210
            local data = mud.dptDt
            if mud and mud.IsCallDepot and mud.IsCallDepot ~= 1 and mud.mainCurr == 4 and mud.reinforceCurr == 3 and type == 3 then
              data = mud.dptDt2
            end
            if data and data[i] and data[i].pid then
              ShowDepotTips(sender, data[i].pid, type, data[i].pid, true)
            end
          end,
          EventMouseLeave = function(sender, e)
            sender.Skin = SkinF.skin_touming
          end
        })
      })
    })
  })
end

function EquipCB(hint, i, lc, skin, type, m)
  return Gui.Control("equip_pp_" .. i)({
    Location = lc,
    Size = Vector2(80, 80),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_103[1],
    Visible = false,
    ComControl("equip_p_" .. i, Vector2(80, 80), Vector2(0, 0), 255, skin),
    Gui.DragBtn("equip_b_" .. i)({
      Size = Vector2(80, 80),
      Skin = SkinF.skin_touming2,
      Gui.Control("equip_c_" .. i)({
        Size = Vector2(80, 80),
        Skin = SkinF.skin_touming,
        Gui.Control({
          Size = Vector2(80, 80),
          BackgroundColor = colw,
          Skin = SkinF.skin_touming,
          EventMouseEnter = function(sender, e)
            sender.Hint = hint
            sender.Skin = SkinF.personalInfo_210
            if type and type == 2 then
              for i, v in ipairs(PersonalInfo.independentTrinket) do
                if v.type == m then
                  sender.Hint = ""
                  ShowDepotTips(sender, m, 2, v.playerItemId)
                  break
                end
              end
            end
          end,
          EventMouseLeave = function(sender, e)
            sender.Skin = SkinF.skin_touming
          end
        })
      })
    }),
    ComFlashNew("equip_c2_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_104, false)
  })
end

function CardKeyCB(i, name, beginX, beginY, type, mud)
  local tI = i
  if 9 <= i then
    tI = i + 8
  end
  return Gui.Control({
    Location = ComputLocation(i, beginX, beginY, 5, 107, 166),
    Size = Vector2(104, 163),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_083[1],
    Gui.Control(name .. "_card_p_" .. i)({
      Size = Vector2(104, 163),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_145,
      Gui.Control({
        Size = Vector2(104, 163),
        BackgroundColor = colw,
        Skin = SkinF.skin_touming,
        EventMouseEnter = function(sender, e)
          sender.Skin = SkinF.personalInfo_210
        end,
        EventMouseLeave = function(sender, e)
          sender.Skin = SkinF.skin_touming
        end
      })
    }),
    Gui.DragBtn(name .. "_card_b_" .. i)({
      Size = Vector2(104, 163),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_143,
      Visible = false,
      ComCharacterStaticCard(name .. "_card_s_" .. i, tI),
      ComControl(name .. "_card_bs_" .. i, Vector2(104, 163), Vector2(0, 0), 255, SkinF.personalInfo_231, false),
      ComControl(nil, Vector2(104, 163), Vector2(0, 0), 255, SkinF.personalInfo_144),
      ComControl(name .. "_card_new_" .. i, Vector2(104, 163), Vector2(0, 0), 255, SkinF.personalInfo_233[2], false),
      Gui.Control(name .. "_card_c_" .. i)({
        Size = Vector2(104, 163),
        Skin = SkinF.personalInfo_139,
        Gui.Control({
          Size = Vector2(104, 163),
          BackgroundColor = colw,
          Skin = SkinF.skin_touming,
          EventMouseEnter = function(sender, e)
            sender.Skin = SkinF.personalInfo_210
            local data = mud.dptDt
            if mud and mud.IsCallDepot and mud.IsCallDepot ~= 1 and mud.mainCurr == 4 then
              data = mud.dptDt2
            end
            if data[i] and data[i].pid then
              ShowDepotTips(sender, data[i].pid, 5, data[i].pid, true)
            end
          end,
          EventMouseLeave = function(sender, e)
            sender.Skin = SkinF.skin_touming
          end
        })
      })
    })
  })
end

function SkillPointItem(i)
  return Gui.Control({
    Size = Vector2(568, 83),
    Location = Vector2(10, -47 + 84 * i),
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_204,
    ComLabel("skill_name_" .. i, nil, Vector2(300, 21), Vector2(110, 9), 0, 16, colw),
    ComButton("skill_dec_" .. i, nil, Vector2(32, 60), Vector2(495, 8), nil, false, true, SkinF.personalInfo_133),
    ComButton("skill_add_" .. i, nil, Vector2(32, 60), Vector2(527, 8), nil, false, true, SkinF.personalInfo_134),
    Gui.Control({
      Size = Vector2(70, 70),
      Location = Vector2(7, 2),
      Gui.DragBtn("skill_b_" .. i)({
        Size = Vector2(70, 70),
        Enable = false,
        Gui.Control("skill_c_" .. i)({
          Size = Vector2(70, 70),
          EventMouseEnter = function(sender, e)
            Tip.SetRpc(tip_sys_interface[1], {
              t = 1,
              sid = PersonalInfo.sklDt[i].id,
              level = PersonalInfo.skillTemLevel[i]
            })
            Tip.SetUseDescription(true)
            Tip.SetOwner(sender)
          end
        })
      }),
      Gui.Control("skill_c2_" .. i)({
        Size = Vector2(70, 70),
        EventMouseEnter = function(sender, e)
          Tip.SetRpc(tip_sys_interface[1], {
            t = 1,
            sid = PersonalInfo.sklDt[i].id,
            level = PersonalInfo.skillTemLevel[i]
          })
          Tip.SetUseDescription(false)
          Tip.SetOwner(sender)
        end
      })
    }),
    ComControl(nil, Vector2(364, 31), Vector2(111, 33), 255, SkinF.personalInfo_135),
    LimitControl("skill_size_v_" .. i, Vector2(364, 31), Vector2(111, 33), SkinF.personalInfo_136),
    LimitControl("skill_size_" .. i, Vector2(364, 31), Vector2(111, 33), SkinF.personalInfo_137)
  })
end

function InsertSlot(i, lc)
  return Gui.Control({
    Size = Vector2(92, 136),
    Location = lc,
    Gui.Control("insert_p_" .. i)({
      Size = Vector2(92, 95),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_172,
      ComLabel("insert_pd_" .. i, GetUTF8Text("tips_abilities_Gem"), Vector2(80, 80), Vector2(6, 6), 0, 16, colh, "kAlignCenterMiddle"),
      Gui.DragBtn("insert_b_" .. i)({
        Size = Vector2(80, 80),
        Location = Vector2(6, 6),
        BackgroundColor = colw,
        Visible = false,
        ComControl("insert_c3_" .. i, Vector2(80, 80), Vector2(0, 0))
      }),
      ComFlashNew("insert_c_" .. i, Vector2(80, 80), Vector2(6, 6), 255, SkinF.personalInfo_173, false),
      ComControl("insert_c2_" .. i, Vector2(92, 95), Vector2(0, 0), 255, SkinF.personalInfo_174, false)
    }),
    ComControl("insert_l_" .. i, Vector2(84, 40), Vector2(4, 96), 255, SkinF.personalInfo_224),
    ComButton("insert_kb_" .. i, GetUTF8Text("button_common_Punch"), Vector2(72, 40), Vector2(10, 96), 16, false, false, SkinF.personalInfo_200)
  })
end

function MixSlot(i, lc)
  return Gui.Label("mix_p_" .. i)({
    Size = Vector2(80, 80),
    Location = lc,
    TextAlign = "kAlignCenterMiddle",
    FontSize = 16,
    Text = GetUTF8Text("tips_abilities_Gem"),
    TextColor = colh,
    Hint = GetUTF8Text("UI_enhance_Please_drag_in_the_gem"),
    Gui.DragBtn("mix_b_" .. i)({
      Size = Vector2(80, 80),
      BackgroundColor = colw,
      Visible = false,
      ComControl("mix_b_s_" .. i, Vector2(80, 80), Vector2(0, 0))
    }),
    ComFlashNew("mix_c_" .. i, Vector2(80, 80), Vector2(0, 0), 255, SkinF.personalInfo_173, false)
  })
end

function RefitMetrial(i, lc)
  local tp = ComLabel("refMtr_name_" .. i, nil, Vector2(130, 20), Vector2(90, 12), 0, 16, colw)
  if i == 3 then
    tp = ComCheckBox("useLucyReel", GetUTF8Text("UI_common_Use_Stabilizer"), Vector2(130, 20), Vector2(90, 12), 16, colw)
  end
  return Gui.Control("tiao_" .. i)({
    Size = Vector2(223, 80),
    Location = lc,
    Gui.Control("refMtr_res_p_" .. i)({
      Size = Vector2(80, 80),
      BackgroundColor = colw,
      Skin = SkinF.personalInfo_quality[1],
      ComControl("refMtr_res_" .. i, Vector2(80, 80), Vector2(0, 0), 255),
      ComLabel("refMtr_count_" .. i, "0/0", Vector2(72, 14), Vector2(2, 60), 0, 14, colw, "kAlignRightMiddle")
    }),
    ComControl(nil, Vector2(142, 75), Vector2(81, 3), 255, SkinF.personalInfo_224),
    tp,
    ComButton("refit_buy_" .. i, GetUTF8Text("button_common_Buy"), Vector2(72, 40), Vector2(91, 37), 14, false, true, SkinF.personalInfo_200)
  })
end

function DepotCtrl(i, fuc, count, name, bx, by, type, mud)
  return Gui.Control("ctrl_depot_" .. i)({
    Size = Vector2(573, 357),
    ComComplex(fuc, 1, count, name, bx, by, type, mud)
  })
end

function ReinDepotCtrl(size, lc, lc2, text, name, fuc, count, bx, by, type, mud)
  return Gui.Control({
    Size = size,
    Location = lc,
    BackgroundColor = colw,
    Skin = SkinF.personalInfo_206,
    ComLabel(nil, text, Vector2(582, 21), Vector2(14, 4), 0, 16, colw),
    ComPagesBar("pb_" .. name, lc2),
    ComComplex(fuc, 1, count, name, bx, by, type, mud)
  })
end

function V3ToV4(v3, radio, w)
  return Vector4(v3.r * radio, v3.g * radio, v3.b * radio, w)
end

function NumToStr(num)
  return string.format("%s", num)
end

function V3ToStr(v)
  return string.format("%g,%g,%g", v.x, v.y, v.z)
end

function V4ToStr(v)
  return string.format("%g,%g,%g,%g", v.x, v.y, v.z, v.w)
end

function Table2str(t)
  local str = "{"
  for i, v in ipairs(t) do
    if type(v) == "string" then
      str = str .. "'" .. v .. "',"
    elseif type(v) == "table" then
      str = str .. Table2str(v) .. ","
    else
      str = str .. v .. ","
    end
  end
  return str .. "}"
end

function ComputLocation(i, beginX, beginY, numL, spaceX, spaceY)
  local lcx, lcy
  if i % numL == 0 then
    lcx = beginX + numL * spaceX
    lcy = beginY + math.floor(i / numL) * spaceY
  else
    lcx = beginX + i % numL * spaceX
    lcy = beginY + (1 + math.floor(i / numL)) * spaceY
  end
  return Vector2(lcx, lcy)
end

function DoWingRes(s, p, q)
  if p == q then
    local str = "fuck = {" .. s .. "}"
    local a = rpc.load_result(str)
    return a.fuck[1]
  else
    return s
  end
end

function OnMouseMove(up, isCard, u1, u2, p)
  if isCard then
    if p then
      u1.Location = up.CurrentCursorPosition - Vector2(u1.Size.x / 2 - 10, u1.Size.y / 2 - 10)
    else
      u1.Location = up.CurrentCursorPosition + Vector2(locationChanged, 0) - Vector2(u1.Size.x / 2 - 10, u1.Size.y / 2 - 10)
    end
  elseif p then
    u2.Location = up.CurrentCursorPosition - Vector2(u2.Size.x / 2 - 10, u2.Size.y / 2 - 10)
  else
    u2.Location = up.CurrentCursorPosition + Vector2(locationChanged, 0) - Vector2(u2.Size.x / 2 - 10, u2.Size.y / 2 - 10)
  end
end

function ShowOneButton(ut, up, dir, name, quiltyLevel, v, us, class)
  if quiltyLevel then
    if quiltyLevel == 0 then
      quiltyLevel = 1
    end
    ut.Skin = SkinF.personalInfo_quality[quiltyLevel]
    ut.Visible = true
  else
    ut.Visible = false
  end
  up.Visible = true
  up.Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image(dir .. name .. ".tga", Vector4(0, 0, 0, 0))
  })
  if us then
    us.Visible = v and v.unitType and v.unit and (v.unitType == 2 and v.unit <= 20 or (v.unitType == 3 or v.unitType == 4 or v.unitType == 5) and 0 >= v.unit) and not class or v and class and (v.isBind and (v.isBind == "true" or v.isBind == "Y") or v.isEquip and v.isEquip == "Y")
  end
end

function GetMoveMesg(up)
  up.IsCapture = not up.IsCapture
  local s = up.Size * Vector2(moveCtrlScale, moveCtrlScale)
  local c = up.CurrentCursorPosition
  local l = c + Vector2(locationChanged, 0) - Vector2(s.x / 2 - 10, s.y / 2 - 10)
  return s, l, c
end

function ResetAnim()
  lg:PlayAnim("idlea")
  lg:SetWeapon(0, "")
  lg:ResetVanRotation()
  ClearIndependentTrinket()
  for i, v in ipairs(PersonalInfo.independentTrinket) do
    lg:Set_Independent_Trinket(v.type, v.resource, false, 0, true)
  end
end

function ShowMoveControl(size, lc, dir, name, quiltyLevel, u1, u2, p)
  gui:PlayAudio("pickup")
  u1.Parent = gui
  if p then
    u1.Location = lc - Vector2(locationChanged, 0)
  else
    u1.Location = lc
  end
  u1.Size = size
  u2.Size = size
  u2.Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image(dir .. name .. ".tga", Vector4(0, 0, 0, 0))
  })
  if quiltyLevel and 1 <= quiltyLevel then
    u1.Skin = SkinF.personalInfo_quality[quiltyLevel]
  else
    u1.Skin = SkinF.skin_touming
  end
end

function ShowMoveCard(size, lc, up, grade, u1, u2, u3, u4, p)
  gui:PlayAudio("pickup")
  u1.Parent = gui
  u1.Size = size
  if IsCallDepot == 1 then
    u1.Location = lc - Vector2(locationChanged, 0)
  else
    u1.Location = lc
  end
  u1.Skin = SkinF.personalInfo_quality[grade]
  u2.Size = size
  u3.Size = Vector2(79, 116) * Vector2(moveCtrlScale, moveCtrlScale)
  u3.Location = Vector2(13, 21) * Vector2(moveCtrlScale, moveCtrlScale)
  u3.ID = up.ID
  u4.Size = size
end

function ShowQuaity(u1, c, isShowOne)
  local t = 2
  if isShowOne then
    t = 1
  end
  u1.Visible = false
  if c >= t then
    u1.Visible = true
    u1.Text = string.format("%d", c)
  end
end

function ShowIsEquiped(v, name, k, u1, u2)
  local tOc = 1
  if tonumber(SelectCharacter.role_job_id) == 1 then
    tOc = 2
  elseif tonumber(SelectCharacter.role_job_id) == 2 then
    tOc = 4
  end
  if v and (v.isEquip == "Y" or (k == 1 or k == 2) and (v.level > globalLV or v.occupation and bit.band(tonumber(v.occupation), tOc) == 0 and v.occupation ~= 0)) then
    u1.BackgroundColor = colw
    if k ~= 4 then
      if v.isEquip == "Y" then
        u1.Skin = SkinF.personalInfo_140[1]
      else
        u1.Skin = SkinF.personalInfo_140[2]
      end
    end
  else
    u1.BackgroundColor = col0
  end
  u2.Visible = v.isNew
end

function ComputeInsertP(a, b, c)
  local tc = 1
  if c then
    tc = c
  end
  if a then
    local tnc = tonumber(b.Text) + tc * a
    b.Text = "+" .. tnc
  end
end

function ShowParAdd(p, u1)
  if p and math.floor(p) > 0 then
    u1.TextColor = colg
    return math.floor(p)
  end
  u1.TextColor = colw
  return 0
end

function IsInAABB(c, b, s)
  if c.x >= b.x and c.x <= b.x + s.x and c.y >= b.y and c.y <= b.y + s.y then
    return true
  end
  return false
end

function IsOutAABB(c, b, s)
  if c.x < b.x or c.x > b.x + s.x or c.y < b.y or c.y > b.y + s.y then
    return true
  end
  return false
end

function ShowDepotTips(tc, data, type, id, isBag)
  if data and data ~= 0 then
    Tip.SetRpc(tip_player_interface[type], {t = type, pid = id})
    Tip.SetUseDescription(isBag)
    Tip.SetOwner(tc)
  end
end

function ShowSecTap(ui, name, i, isShow, p)
  if isShow then
    ui["btn_" .. name .. "_" .. i].PushDown = true
    ui["ctrl_" .. name .. "_" .. i].Parent = p
  else
    ui["btn_" .. name .. "_" .. i].PushDown = false
    ui["ctrl_" .. name .. "_" .. i].Parent = nil
  end
end

function HideDepotBtn(ui, name, c)
  for i = 1, c do
    ui[name .. "_p_" .. i].Skin = SkinF.personalInfo_092
    ui[name .. "_b_" .. i].Skin = SkinF.skin_touming2
    ui[name .. "_c_" .. i].BackgroundColor = col0
    ui[name .. "_l_" .. i].Visible = false
    ui[name .. "_bs_" .. i].Visible = false
    ui[name .. "_new_" .. i].Visible = false
  end
end

function HideCardBtn(ui, name, c)
  for i = 1, c do
    ui[name .. "_card_p_" .. i].Skin = SkinF.personalInfo_145
    ui[name .. "_card_b_" .. i].Visible = false
    ui[name .. "_card_bs_" .. i].Visible = false
    ui[name .. "_card_new_" .. i].Visible = false
    ui[name .. "_card_c_" .. i].BackgroundColor = col0
    local id = i
    if 9 <= i then
      id = i + 8
    end
    lg:ClearPersonCardData(id)
  end
end

function CleanDepotTap(ui, mud, i)
  mud.dptDt = {}
  if 1 == i then
    ComFuc.HideDepotBtn(ui, "weapon", 24)
  elseif 2 == i then
    ComFuc.HideDepotBtn(ui, "prop", 24)
  elseif 3 == i then
    ComFuc.HideDepotBtn(ui, "pose", 24)
  elseif 4 == i then
    ComFuc.HideCardBtn(ui, "person", 10)
  end
end

function ClearEquipButton(ui, p, q)
  for i = p, q do
    if i ~= 2 then
      ui["equip_b_" .. i].Skin = SkinF.skin_touming2
    end
  end
  if p <= 6 then
    ui["equip_p_" .. 1].Skin = SkinF.personalInfo_089
    ui["equip_p_" .. 3].Skin = SkinF.personalInfo_089
    ui["equip_p_" .. 4].Skin = SkinF.personalInfo_090
    ui["equip_p_" .. 6].Skin = SkinF.personalInfo_138
  end
end

function ShowEquipButton(ui)
  for i = 1, 12 do
    ui["equip_pp_" .. i].Visible = false
  end
  if PersonalInfo.mainCurr == 2 then
    if PersonalInfo.depotCurr == 1 then
      ui["equip_pp_" .. 1].Visible = true
      ui["equip_pp_" .. 3].Visible = true
      ui["equip_pp_" .. 4].Visible = true
      ui["equip_pp_" .. 6].Visible = true
    elseif PersonalInfo.depotCurr == 3 then
      for i = 7, 12 do
        ui["equip_pp_" .. i].Visible = true
      end
    elseif PersonalInfo.depotCurr == 4 then
      ui["equip_pp_" .. 2].Visible = true
    end
  end
end

function FillInfoByData(info, data)
  info:ClearPartString()
  local t = {
    data.skin,
    data.eye,
    data.mouth,
    data.nose,
    data.ear,
    data.beard,
    data.hair,
    data.helmet,
    data.underwear,
    data.outerwear,
    data.trousers,
    data.glove,
    data.shoes,
    data.decal,
    data.movable,
    data.immobile,
    data.immobileUp,
    data.immobileDown
  }
  for i, v in ipairs(t) do
    if v then
      if type(v) == "string" then
        info:SetAvatarPartString(i - 1, v)
      else
        local tempstr = Table2str(v)
        info:SetAvatarPartString(i - 1, tempstr)
      end
    end
  end
end

function DealAvatarPreviewEquip(data)
  local info = lg:GetCurrCharInfo()
  FillInfoByData(info, data)
  lg:UpdateVanByInfoString()
end

function DealLookInfoEquip(data)
  local info = lg:GetOtherPlayerInfo()
  FillInfoByData(info, data)
  lg:UpdateOtherPlayerByInfoString()
end

function DealAvatarEquip(data)
  local info = lg:GetCurrCharInfo()
  FillInfoByData(info, data)
  lg:UpdateVanByInfoString()
  lg:SaveInfoToTag()
end

function DealAvatarEquipRoom(data)
  local info = ag:GetVanInfo()
  FillInfoByData(info, data)
  ag:UpdateVanByInfoString()
end

function SetPersonCardData(info_table, i)
  if not info_table then
    lg:ClearPersonCardData(i)
    return
  end
  local info = lg:GetStaticCardInfo(i)
  FillInfoByData(info, info_table)
  lg:UpdateStaticCardByInfoString(i)
end

function SetPersonCardDataARoom(info_table, i)
  if not info_table then
    ag:ClearPersonCardData(i)
    return
  end
  local info = ag:GetStaticCardInfo(i)
  FillInfoByData(info, info_table)
  ag:UpdateStaticCardByInfoString(i)
end

function SetHeadPhotoCardData(info_table, i)
  local info = lg:GetHeadPhotoInfo(i)
  FillInfoByData(info, info_table)
  lg:UpdateHeadPhotoByInfoString(i)
end

function Code(s)
  return (string.gsub(s, "\\(.)", function(x)
    return string.format("\\%03d", string.byte(x))
  end))
end

function Decode(s)
  return (string.gsub(s, "\\(%d%d%d)", function(d)
    return "\\" .. stringchar(d)
  end))
end

function TableValue2Key(t, v)
  for k, _v in pairs(t) do
    if _v == v then
      return k
    end
  end
  print("cannot find " .. v .. "from table: " .. t)
  return nil
end

function ClearIndependentTrinket()
  for i = 1, 4 do
    lg:Set_Independent_Trinket(i, "", false)
  end
end

function ClearLookInfoIndependentTrinket()
  for i = 1, 4 do
    lg:Set_Other_Player_Independent_Trinket(i, "")
  end
end

function GetChannelInfoStr(data)
  local channelNum = data.num_of_channel
  local ret = "" .. channelNum
  for i = 1, channelNum do
    local color = data:GetColorAtId(i - 1)
    local color_i = Vector3(math.floor(color.x * 255), math.floor(color.y * 255), math.floor(color.z * 255))
    ret = ret .. "," .. V3ToStr(color_i)
  end
  for i = 1 + channelNum, 3 do
    ret = ret .. ",0,0,0"
  end
  return ret
end

function GetMTrinketInfo(data)
  local ret = string.format("{'%s',%d,%d,%s,%s,%g,%s,%s,%s}", data.res_name, data.part_id, data.index_in_layer, V3ToStr(data.offset_pos), V4ToStr(data.rot_quat), data.scale, V4ToStr(data.dual0), V3ToStr(data.hit_nor), GetChannelInfoStr(data))
  return ret
end

function GetDecalInfo(data)
  local pos_scale = Vector4(data.pos.x, data.pos.y, data.pos.z, data.scale)
  local nor_theta = Vector4(data.normal.x, data.normal.y, data.normal.z, data.theta)
  local ret = string.format("{'%s',%d,%s,%s,%s,%s,'%s',%g,%s}", data.res_name, data.part_id, V4ToStr(pos_scale), V4ToStr(nor_theta), V3ToStr(data.van_pos), V4ToStr(data.van_rot), data.animation_name, data.animation_time, GetChannelInfoStr(data))
  return ret
end

function GetSpartInfo(data)
  return string.format("{'%s',%d,%d,%s}", data.res_name, data.part_id, data.index_in_layer, GetChannelInfoStr(data))
end

function GetDressInfo(data, index_in_layer, pid)
  if data.part_id == pid then
    return string.format("{'%s',%d,%d,%s}", data.res_name, pid, index_in_layer, GetChannelInfoStr(data))
  else
    return ""
  end
end

function GetFaceAnimInfo(data)
  if data.tex_res_name == "onecolor_a" then
    return "{}"
  else
    return string.format("{'%s',%d,%g,%g,%g,%g,%g,%s}", data.tex_res_name, data.part_id, data.translate_x, data.translate_y, data.theta, data.scale_x, data.scale_y, GetChannelInfoStr(data))
  end
  return ret
end

function GetEarInfo(data)
  if not data or data.empty then
    return "{}"
  end
  return string.format("{'%s',%d,%d,%s,%s,%s,%s,%g,%s,%s,%s,%g,%s,%s}", data.res_name, data.part_id, data.i_id, tostring(data.empty), V4ToStr(data.dual0), V3ToStr(data.pos_l), V4ToStr(data.rot_l), data.scale_l, V3ToStr(data.hit_nor_l), V3ToStr(data.pos_r), V4ToStr(data.rot_r), data.scale_r, V3ToStr(data.hit_nor_r), GetChannelInfoStr(data))
end

function GetImmovealbeHeadUpDown(info, p_i_d)
  local ret = "{"
  local Count = info:GetImmTrinketInfoArrCount(p_i_d)
  for i = 1, Count do
    ret = ret .. GetSpartInfo(info:GetImmTrinketByID(p_i_d, i - 1)) .. ","
  end
  ret = ret .. "}"
  return ret
end

function SetCtrlColor(ParentCtrl, cola)
  if ParentCtrl then
    local pControl = ParentCtrl.FirstChild
    while pControl do
      pControl.BackgroundColor = cola
      if pControl.Text and pControl.Text ~= "" then
        pControl.TextColor = cola
      end
      SetCtrlColor(pControl, cola)
      pControl = pControl.Next
    end
  end
end

function SetCtrlColorLcSize(p, size, lc, cola)
  p.Size = size
  p.Location = lc
  SetCtrlColor(p, cola)
end

function InitSocialityMenu(menu, t)
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

function TestHasAwardNoReceive()
  rpc.safecall("player_quest_list", {}, function(data)
    taskLists = data.quests
    Mission.pm_list_data = data
    if Lobby.mainBtnPushDown == 8 then
      Mission.UpdatePMList()
    end
    if taskPart then
      gui:RemoveParticle(taskPart)
      taskPart = nil
    end
    if Lobby then
      Lobby.ui.btn_m_8_c.IsBegin = false
    end
    if Avatar then
      Avatar.ui.btn_m_8_c.IsBegin = false
    end
    if taskLists then
      for i, v in ipairs(taskLists) do
        if tonumber(v.state) == 2 then
          taskPart = gui:AddParticle("ui_renwu_star", Vector2(557 + locationChanged - 75, 114), Vector3(0, 1, 0))
          if Lobby then
            Lobby.ui.btn_m_8_c.IsGo = true
            Lobby.ui.btn_m_8_c.IsBegin = true
          end
          if Avatar then
            Avatar.ui.btn_m_8_c.IsGo = true
            Avatar.ui.btn_m_8_c.IsBegin = true
          end
          return
        end
      end
    end
  end)
end

function TestIsFinishOneTask(tid)
  if taskLists then
    for i, v in ipairs(taskLists) do
      if tonumber(v.qid) == tid and v.state == 1 then
        rpc.safecall("player_quest_accompish_client", {
          questId = v.id
        }, nil)
        if Lobby.mainBtnPushDown == 8 then
          return true
        end
        break
      end
    end
  end
  return false
end

function MovePlayer(x, y, z)
  local p = game.Player:GetPosition()
  p.x = p.x + x
  p.y = p.y + y
  p.z = p.z + z
  game.Player:SetPosition(p)
end
