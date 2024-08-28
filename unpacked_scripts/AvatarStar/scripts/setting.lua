module("Setting", package.seeall)
local _T = GetUTF8Text
local brown = ARGB(255, 113, 83, 65)
local gray = ARGB(85, 85, 85, 85)
local white = ARGB(255, 255, 255, 255)
local black = ARGB(255, 0, 0, 0)
local blue = ARGB(255, 82, 54, 44)
local red = ARGB(255, 255, 0, 0)
local sel = "graphic"
local s = {
  graphic = {
    title = _T("UI_common_Video_Setting"),
    ui = {}
  },
  audio = {
    title = _T("tips_common_additional_tips18"),
    ui = {}
  },
  action = {
    title = _T("button_common_Hotkey"),
    ui = {}
  },
  interface = {
    title = _T("button_common_Screen_Setting"),
    ui = {}
  },
  switch = {
    title = _T("UI_common_Switch_Screen"),
    ui = {}
  }
}
local ctrl_setting = Gui.Control({
  Dock = "kDockFill",
  BackgroundColor = white,
  Skin = SkinF.personalInfo_207
})()
local lb_title = Gui.Label({
  Size = Vector2(0, 30),
  Dock = "kDockTop",
  FontSize = 16,
  TextPadding = Vector4(10, 0, 0, 0),
  Gui.Button({
    Size = Vector2(24, 24),
    Margin = Vector4(0, 3, 8, 4),
    Dock = "kDockRight",
    Skin = SkinF.lookInfo_002,
    EventClick = function(sender, e)
      Hide()
    end
  })
})()
local ctrl_main, Ctrl = Gui.Control({
  Location = Vector2(7, 47),
  Size = Vector2(410, 602)
})(), {
  Location = Vector2(7, 47),
  Size = Vector2(410, 602)
}
local Ctrl, ComboBox = function(y, t, h, ui)
  local c = Gui.Control({
    Location = Vector2(9, y),
    Size = Vector2(398, h),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.setting_03
  })(nil, ui)
  Gui.Label({
    Location = Vector2(9, 9),
    Size = Vector2(299, 19),
    FontSize = 16,
    Text = t,
    TextColor = blue
  })(c, nil)
end, Vector2(410, 602)
local ComboBox, CheckBox = function(x, y, t, p)
  Gui.Label({
    Location = Vector2(x, y),
    Size = Vector2(199, 19),
    FontSize = 16,
    TextColor = blue,
    Text = t
  })(p, nil)
  return Gui.ComboBox({
    Location = Vector2(x, y + 24),
    Size = Vector2(189, 29)
  })(p, nil)
end, 410
local CheckBox, Slider = function(x, y, w, t, p)
  return Gui.CheckBox({
    Location = Vector2(x, y),
    Size = Vector2(w, 24),
    FontSize = 16,
    TextColor = blue,
    Text = t
  })(p, nil)
end, 602

function Slider(x, y, t, p, is_int, l, r)
  Gui.Label({
    Location = Vector2(x, y),
    Size = Vector2(153, 22),
    TextAlign = "kAlignCenterMiddle",
    FontSize = 16,
    TextColor = blue,
    Text = t
  })(p, nil)
  Gui.Label({
    Location = Vector2(x, y + 54),
    Size = Vector2(153, 19),
    TextAlign = "kAlignLeftMiddle",
    FontSize = 16,
    TextColor = blue,
    Text = _T("tips_common_additional_tips19")
  })(p, nil)
  Gui.Label({
    Location = Vector2(x + 80, y + 54),
    Size = Vector2(73, 19),
    TextAlign = "kAlignRightMiddle",
    FontSize = 16,
    TextColor = blue,
    Text = _T("tips_common_additional_tips20")
  })(p, nil)
  return Gui.Slider({
    Location = Vector2(x, y + 26),
    ThumbSize = Vector2(28, 30),
    Size = Vector2(153, 30),
    IsInt = is_int,
    MinValue = l,
    MaxValue = r
  })(p, nil)
end

local default_graphic_setting = {
  resolution = "1024x768",
  refresh_rate = 60,
  full_screen = true,
  shadow_quality = 0,
  model_quality = 0,
  shader_quality = 0,
  hdr_quality = 0,
  filter_index = 0,
  msaa_index = 0,
  v_sync = false,
  soft_particle = true
}
Ctrl(6, _T("UI_lobby_Display"), 169, s.graphic.ui)
Ctrl(178, _T("UI_lobby_Visual"), 181, s.graphic.ui)
Ctrl(362, _T("tips_common_additional_tips21"), 181, s.graphic.ui)
local cmb_resolution = ComboBox(9, 41, _T("UI_lobby_Resolution"), s.graphic.ui[1])
local cmb_refresh = ComboBox(9, 102, _T("UI_lobby_Refresh_Rate"), s.graphic.ui[1])
local ckb_full_screen = CheckBox(236, 71, 190, _T("UI_lobby_Window_Mode"), s.graphic.ui[1])
local sld_shadow = Slider(36, 24, _T("UI_lobby_Shadow"), s.graphic.ui[2], true, 0, 2)
local sld_model = Slider(225, 24, _T("UI_common_Model_Quality"), s.graphic.ui[2], true, 0, 2)
local sld_shader = Slider(36, 99, _T("UI_lobby_Shader"), s.graphic.ui[2], true, 0, 2)
local sld_hdr = Slider(225, 99, _T("UI_lobby_HDR"), s.graphic.ui[2], true, 0, 2)
local cmb_filter = ComboBox(9, 41, _T("UI_lobby_Texture"), s.graphic.ui[3])
local cmb_msaa = ComboBox(9, 102, _T("UI_lobby_AntiAliasing"), s.graphic.ui[3])
local ckb_sync = CheckBox(236, 71, 190, _T("UI_lobby_Verticle_Sync"), s.graphic.ui[3])
local ckb_soft_particle, AddResolution = CheckBox(236, 132, 190, _T("UI_lobby_Soft_Particle"), s.graphic.ui[3]), 236
local AddResolution, AddRefreshRate = function()
  cmb_resolution:RemoveAll()
  local count = config:GetDisplayModeCount()
  for i = 0, count - 1 do
    local resolution = config:FillDisplayMode(i)
    local res = resolution.x .. "x" .. resolution.y
    if 0 > cmb_resolution:TextToIndex(res) then
      cmb_resolution:AddItem(res)
    end
  end
end, 132
local AddRefreshRate, AddMSAA = function()
  cmb_refresh:RemoveAll()
  local count = config:GetDisplayModeCount()
  for i = 0, count do
    local refresh_rate = config:FillRefreshRate(i)
    if 0 < refresh_rate and 0 > cmb_refresh:TextToIndex(refresh_rate) then
      cmb_refresh:AddItem(refresh_rate)
    end
  end
end, 190
local AddMSAA, AddTextureFilter = function()
  cmb_msaa:RemoveAll()
  cmb_msaa:AddItem(_T("tips_abilities_None"))
  for i = 2, 16, 2 do
    if config:CheckMultiSamplerType(i) then
      cmb_msaa:AddItem(i .. "X")
    end
  end
end, _T("UI_lobby_Soft_Particle")

function AddTextureFilter()
  cmb_filter:RemoveAll()
  cmb_filter:AddItem(_T("UI_lobby_Trilinear"))
  for i = 1, 4 do
    if config:CheckAnisotropy(2 ^ i) then
      cmb_filter:AddItem(_T("UI_lobby_Anisotropic") .. 2 ^ i .. "X")
    end
  end
end

AddResolution()
AddRefreshRate()
AddMSAA()
AddTextureFilter()
local UpdateGraphicUI = function(data)
  if data then
    ckb_full_screen.Check = data.full_screen
    cmb_refresh.Enable = data.full_screen
    cmb_refresh.Text = data.refresh_rate
    cmb_resolution.SelectedIndex = cmb_resolution:TextToIndex(data.resolution)
    sld_shadow.CurValue = 2 - data.shadow_quality
    sld_model.CurValue = 2 - data.model_quality
    sld_shader.CurValue = 2 - data.shader_quality
    sld_hdr.CurValue = data.hdr_quality
    cmb_filter.SelectedIndex = data.filter_index
    cmb_msaa.SelectedIndex = data.msaa_index / 2
    ckb_sync.Check = data.v_sync
    ckb_soft_particle.Check = data.soft_particle
  else
    ckb_full_screen.Check = not config.FullScreen
    cmb_refresh.Enable = config.FullScreen
    cmb_refresh.Text = config.RefreshRate
    cmb_resolution.SelectedIndex = cmb_resolution:TextToIndex(config.UserResolution)
    sld_shadow.CurValue = 2 - config.Shadow
    sld_model.CurValue = 2 - config.ModelQuality
    sld_shader.CurValue = 2 - config.ShaderQuality
    sld_hdr.CurValue = config.HDR
    cmb_filter.SelectedIndex = config.Anisotropy
    if config.MSAA == 0 then
      cmb_msaa.SelectedIndex = 0
    else
      cmb_msaa.SelectedIndex = math.log(config.MSAA, 2)
    end
    ckb_sync.Check = config.VSync
    ckb_soft_particle.Check = config.SoftParticle
  end
end
local ApplyGraphicSetting = function()
  config.FullScreen = not ckb_full_screen.Check
  config.RefreshRate = tonumber(cmb_refresh.Text)
  config.UserResolution = cmb_resolution.Text
  config.Shadow = 2 - sld_shadow.CurValue
  config.ModelQuality = 2 - sld_model.CurValue
  config.ShaderQuality = 2 - sld_shader.CurValue
  config.HDR = sld_hdr.CurValue
  config.Anisotropy = cmb_filter.SelectedIndex
  if cmb_msaa.SelectedIndex == 0 then
    config.MSAA = 0
  else
    config.MSAA = 2 ^ cmb_msaa.SelectedIndex
  end
  config.SoftParticle = ckb_soft_particle.Check
  config.VSync = ckb_sync.Check
  config:SaveGraphic()
end

function s.graphic.reset()
  UpdateGraphicUI(default_graphic_setting)
end

function s.graphic.confirm()
  ApplyGraphicSetting()
  Hide()
end

function s.graphic.show()
  UpdateGraphicUI()
end

local default_audio_setting = {
  music_on = true,
  music_volume = 30,
  sound_effect_on = true,
  sound_effect_volume = 30,
  error_sound_on = false,
  ambience_effect_on = true,
  ambience_effect_volume = 30,
  player_sound_on = false,
  player_sound_volume = 30,
  player_language_index = 0
}
Ctrl(6, _T("UI_lobby_Game_Music"), 127, s.audio.ui)
Ctrl(136, _T("UI_lobby_Sound_Effect"), 169, s.audio.ui)
Ctrl(308, _T("UI_lobby_Environmental_Sound_Effect"), 127, s.audio.ui)
local ckb_music = CheckBox(24, 63, 190, _T("UI_lobby_Enable_Game_Music"), s.audio.ui[1])
local sld_music = Slider(201, 39, _T("UI_lobby_Volume"), s.audio.ui[1], false, 0, 100)
local ckb_sound_effect = CheckBox(24, 71, 190, _T("UI_lobby_Enable_Sound_Effect"), s.audio.ui[2])
local sld_sound_effect = Slider(201, 47, _T("UI_lobby_Sound_Effect_Volume"), s.audio.ui[2], false, 0, 100)
local ckb_error_sound = CheckBox(24, 129, 190, _T("UI_lobby_Enable_Error_Warning"), s.audio.ui[2])
local ckb_ambience_effect = CheckBox(24, 63, 190, _T("UI_lobby_Enable_Environmental_Sound_Effect"), s.audio.ui[3])
local sld_ambience_effect = Slider(201, 39, _T("UI_lobby_Environmental_Sound_Effect_Volume"), s.audio.ui[3], false, 0, 100)
local ckb_player_sound = CheckBox(24, 71, 190, _T("UI_common_Enable_Character_Sound"), s.audio.ui[4])
local sld_player_sound = Slider(201, 47, _T("tips_common_additional_tips22"), s.audio.ui[4], false, 0, 100)
local cmb_language = ComboBox(9, 119, _T("UI_common_Character_Language"), s.audio.ui[4])
local player_language_list = {
  _T("tips_common_additional_tips23"),
  _T("tips_common_additional_tips24")
}
for _, v in ipairs(player_language_list) do
  cmb_language:AddItem(v)
end

function sld_music.EventValueChange(s, e)
  game:CategorySetVolume("music", s.CurValue)
end

function sld_sound_effect.EventValueChange(s, e)
  game:CategorySetVolume("sound effect", s.CurValue)
end

function sld_ambience_effect.EventValueChange(s, e)
  game:CategorySetVolume("ambience", s.CurValue)
end

function ckb_music.EventCheckChanged(s, e)
  game:CategorySetMute("music", not s.Check)
end

function ckb_sound_effect.EventCheckChanged(s, e)
  game:CategorySetMute("sound effect", not s.Check)
end

function ckb_ambience_effect.EventCheckChanged(s, e)
  game:CategorySetMute("ambience", not s.Check)
end

function UpdateAudioUI(data)
  if data then
    ckb_music.Check = data.music_on
    sld_music.CurValue = data.music_volume
    ckb_sound_effect.Check = data.sound_effect_on
    sld_sound_effect.CurValue = data.sound_effect_volume
    ckb_error_sound.Check = data.error_sound_on
    ckb_ambience_effect.Check = data.ambience_effect_on
    sld_ambience_effect.CurValue = data.ambience_effect_volume
    ckb_player_sound.Check = data.player_sound_on
    sld_player_sound.CurValue = data.player_sound_volume
    cmb_language.SelectedIndex = data.player_language_index
  else
    ckb_music.Check = not game:CategoryGetMute("music")
    sld_music.CurValue = game:CategoryGetVolume("music")
    ckb_sound_effect.Check = not game:CategoryGetMute("sound effect")
    sld_sound_effect.CurValue = game:CategoryGetVolume("sound effect")
    ckb_ambience_effect.Check = not game:CategoryGetMute("ambience")
    sld_ambience_effect.CurValue = game:CategoryGetVolume("ambience")
    cmb_language.SelectedIndex = 0
  end
end

function ApplyAudioSetting()
  game:CategorySetMute("music", not ckb_music.Check)
  game:CategorySetVolume("music", sld_music.CurValue)
  game:CategorySetMute("sound effect", not ckb_sound_effect.Check)
  game:CategorySetVolume("sound effect", sld_sound_effect.CurValue)
  game:CategorySetMute("ambience", not ckb_ambience_effect.Check)
  game:CategorySetVolume("ambience", sld_ambience_effect.CurValue)
  config:SaveAudio()
end

function s.audio.reset()
  UpdateAudioUI(default_audio_setting)
  ApplyAudioSetting()
end

function s.audio.confirm()
  ApplyAudioSetting()
  Hide()
end

function s.audio.cancle()
  ckb_music.Check = ptr_cast(ckb_music.Tag)
  sld_music.CurValue = ptr_cast(sld_music.Tag)
  ckb_sound_effect.Check = ptr_cast(ckb_sound_effect.Tag)
  sld_sound_effect.CurValue = ptr_cast(sld_sound_effect.Tag)
  ckb_error_sound.Check = ptr_cast(ckb_error_sound.Tag)
  ckb_ambience_effect.Check = ptr_cast(ckb_ambience_effect.Tag)
  sld_ambience_effect.CurValue = ptr_cast(sld_ambience_effect.Tag)
  ckb_player_sound.Check = ptr_cast(ckb_player_sound.Tag)
  sld_player_sound.CurValue = ptr_cast(sld_player_sound.Tag)
  ApplyAudioSetting()
end

function s.audio.show()
  UpdateAudioUI()
  ckb_music.Tag = ckb_music.Check
  sld_music.Tag = sld_music.CurValue
  ckb_sound_effect.Tag = ckb_sound_effect.Check
  sld_sound_effect.Tag = sld_sound_effect.CurValue
  ckb_error_sound.Tag = ckb_error_sound.Check
  ckb_ambience_effect.Tag = ckb_ambience_effect.Check
  sld_ambience_effect.Tag = sld_ambience_effect.CurValue
  ckb_player_sound.Tag = ckb_player_sound.Check
  sld_player_sound.Tag = sld_player_sound.CurValue
end

Ctrl(6, _T("UI_lobby_Mouse"), 127, s.action.ui)
Ctrl(136, _T("tips_common_additional_tips26"), 407, s.action.ui)
local sld_sensitivity = Slider(30, 39, _T("UI_lobby_Sensitivity"), s.action.ui[1], false, 0.05, 2.5)
local sld_sniper = Slider(220, 39, _T("UI_lobby_Sighting_Sensitivity"), s.action.ui[1], false, 0.05, 2.5)
s.action.ui[2].Padding = Vector4(0, 40, 10, 10)
local src = Gui.ScrollableControl({
  Dock = "kDockFill",
  AutoScroll = true,
  AutoSize = true
})(s.action.ui[2], nil)
local fl = Gui.FlowLayout({
  Size = Vector2(358, 767),
  Padding = Vector4(4, 4, 4, 4),
  LineSpace = 4,
  Align = "kAlignCenterMiddle"
})(src, nil)
local key = {
  {
    _T("UI_lobby_Forward"),
    "kActionMoveForward"
  },
  {
    _T("UI_lobby_Backward"),
    "kActionMoveBackward"
  },
  {
    _T("UI_lobby_Left"),
    "kActionMoveLeft"
  },
  {
    _T("UI_lobby_Right"),
    "kActionMoveRight"
  },
  {
    _T("UI_lobby_additional_string_083"),
    "kActionJump"
  },
  {
    _T("UI_lobby_Roll"),
    "kActionCrouch"
  },
  {
    _T("UI_lobby_additional_string_085"),
    "kActionChangeWeapon"
  },
  {
    _T("UI_lobby_additional_string_086"),
    "kActionReload"
  },
  {
    _T("UI_lobby_Special_Action"),
    "kActionPickUpDropItem"
  },
  {
    _T("UI_lobby_additional_string_088"),
    "kActionMotionMenu"
  },
  {
    _T("UI_lobby_additional_string_089"),
    "kActionChangeView"
  },
  {
    _T("UI_lobby_additional_string_090"),
    "kActionUIMap"
  },
  {
    _T("UI_lobby_additional_string_091"),
    "kActionMenu1"
  },
  {
    _T("UI_lobby_additional_string_092"),
    "kActionMenu2"
  },
  {
    _T("UI_lobby_additional_string_093"),
    "kActionMenu3"
  },
  {
    _T("UI_lobby_additional_string_094"),
    "kActionMenu4"
  },
  {
    _T("UI_lobby_additional_string_095"),
    "kActionMenu5"
  },
  {
    _T("UI_lobby_additional_string_096"),
    "kActionMenu6"
  },
  {
    _T("UI_lobby_additional_string_097"),
    "kActionMenu7"
  },
  {
    _T("UI_lobby_additional_string_098"),
    "kActionMenu8"
  },
  {
    _T("UI_lobby_additional_string_099"),
    "kActionMenu9"
  },
  {
    _T("UI_lobby_additional_string_100"),
    "kActionMenu10"
  },
  {
    _T("UI_lobby_additional_string_101"),
    "kActionMenu11"
  },
  {
    _T("UI_lobby_additional_string_102"),
    "kActionMenu12"
  }
}
local key2 = {
  {
    _T("UI_lobby_additional_string_103"),
    _T("UI_lobby_Tab")
  },
  {
    _T("UI_lobby_additional_string_104"),
    _T("UI_lobby_Esc")
  },
  {
    _T("UI_lobby_additional_string_109"),
    _T("UI_lobby_Enter_Key")
  },
  {
    _T("UI_lobby_Screenshot_Button"),
    _T("UI_lobby_PrtScn")
  }
}
local kb_ui = {}
local control_kb_list
for _, v in ipairs(key) do
  Gui.Control({
    Size = Vector2(303, 23),
    Gui.Label({
      Location = Vector2(0, 2),
      Size = Vector2(103, 19),
      FontSize = 16,
      Text = v[1],
      TextColor = blue
    }),
    Gui.KeyBox(v[2])({
      Location = Vector2(195, 0),
      Size = Vector2(103, 23),
      Skin = SkinF.setting_01,
      EventKeyNameChanged = function(sender)
        for k, v in ipairs(control_kb_list) do
          if v ~= sender and v.KeyName == sender.KeyName then
            v:Empty()
          end
        end
      end,
      EventKeyConflict = function(sender)
        MessageBox.ShowError(_T("UI_common_This_key_has_been_used"))
      end,
      EventKeyForbidden = function()
        MessageBox.ShowError(_T("tips_common_additional_tips28"))
      end
    })
  })(fl, kb_ui)
end
control_kb_list = {
  kb_ui.kActionMoveForward,
  kb_ui.kActionMoveBackward,
  kb_ui.kActionMoveLeft,
  kb_ui.kActionMoveRight,
  kb_ui.kActionJump,
  kb_ui.kActionCrouch,
  kb_ui.kActionChangeWeapon,
  kb_ui.kActionReload,
  kb_ui.kActionPickUpDropItem,
  kb_ui.kActionMotionMenu,
  kb_ui.kActionChangeView,
  kb_ui.kActionUIMap,
  kb_ui.kActionMenu1,
  kb_ui.kActionMenu2,
  kb_ui.kActionMenu3,
  kb_ui.kActionMenu4,
  kb_ui.kActionMenu5,
  kb_ui.kActionMenu6,
  kb_ui.kActionMenu7,
  kb_ui.kActionMenu8,
  kb_ui.kActionMenu9,
  kb_ui.kActionMenu10,
  kb_ui.kActionMenu11,
  kb_ui.kActionMenu12
}
for _, v in ipairs(key2) do
  Gui.Control({
    Size = Vector2(303, 23),
    Gui.Label({
      Location = Vector2(0, 2),
      Size = Vector2(153, 19),
      FontSize = 16,
      Text = v[1],
      TextColor = blue
    }),
    Gui.Label({
      Location = Vector2(195, 0),
      Size = Vector2(103, 23),
      TextAlign = "kAlignCenterMiddle",
      FontSize = 16,
      Text = v[2],
      TextColor = brown,
      Skin = SkinF.sociality_text_002,
      BackgroundColor = gray
    })
  })(fl, nil)
end
local default_action_setting, UpdateAction = {
  sensitivity = 1,
  sniper_sensitivity = 0.6,
  mouse_filter = true,
  forward = "W",
  backward = "S",
  left = "A",
  right = "D",
  jump = "SPACE",
  crouch = "LCONTROL",
  change_weapon = "Q",
  reload = "R",
  pickupitem = "E",
  motion_menu = "LMENU",
  changeview = "F",
  map = "M",
  slot1 = "1",
  slot2 = "2",
  slot3 = "3",
  slot4 = "4",
  slot5 = "5",
  slot6 = "6",
  slot7 = "7",
  slot8 = "8",
  slot9 = "9",
  slot10 = "0",
  slot11 = "MINUS",
  slot12 = "EQUALS"
}, "slot12"
local UpdateAction, SaveAction = function(data)
  if data then
    sld_sensitivity.CurValue = data.sensitivity
    sld_sniper.CurValue = data.sniper_sensitivity
    kb_ui.kActionMoveForward.KeyName = data.forward
    kb_ui.kActionMoveBackward.KeyName = data.backward
    kb_ui.kActionMoveLeft.KeyName = data.left
    kb_ui.kActionMoveRight.KeyName = data.right
    kb_ui.kActionJump.KeyName = data.jump
    kb_ui.kActionCrouch.KeyName = data.crouch
    kb_ui.kActionChangeWeapon.KeyName = data.change_weapon
    kb_ui.kActionReload.KeyName = data.reload
    kb_ui.kActionPickUpDropItem.KeyName = data.pickupitem
    kb_ui.kActionMotionMenu.KeyName = data.motion_menu
    kb_ui.kActionChangeView.KeyName = data.changeview
    kb_ui.kActionUIMap.KeyName = data.map
    kb_ui.kActionMenu1.KeyName = data.slot1
    kb_ui.kActionMenu2.KeyName = data.slot2
    kb_ui.kActionMenu3.KeyName = data.slot3
    kb_ui.kActionMenu4.KeyName = data.slot4
    kb_ui.kActionMenu5.KeyName = data.slot5
    kb_ui.kActionMenu6.KeyName = data.slot6
    kb_ui.kActionMenu7.KeyName = data.slot7
    kb_ui.kActionMenu8.KeyName = data.slot8
    kb_ui.kActionMenu9.KeyName = data.slot9
    kb_ui.kActionMenu10.KeyName = data.slot10
    kb_ui.kActionMenu11.KeyName = data.slot11
    kb_ui.kActionMenu12.KeyName = data.slot12
  else
    print("update action(data) failed! data = nil")
  end
end, "EQUALS"
local SaveAction, ApplyAction = function()
  local t = {}
  t.sniper_sensitivity = sld_sniper.CurValue
  t.sensitivity = sld_sensitivity.CurValue
  t.forward = kb_ui.kActionMoveForward.KeyName
  t.backward = kb_ui.kActionMoveBackward.KeyName
  t.left = kb_ui.kActionMoveLeft.KeyName
  t.right = kb_ui.kActionMoveRight.KeyName
  t.jump = kb_ui.kActionJump.KeyName
  t.crouch = kb_ui.kActionCrouch.KeyName
  t.change_weapon = kb_ui.kActionChangeWeapon.KeyName
  t.reload = kb_ui.kActionReload.KeyName
  t.pickupitem = kb_ui.kActionPickUpDropItem.KeyName
  t.motion_menu = kb_ui.kActionMotionMenu.KeyName
  t.changeview = kb_ui.kActionChangeView.KeyName
  t.map = kb_ui.kActionUIMap.KeyName
  t.slot1 = kb_ui.kActionMenu1.KeyName
  t.slot2 = kb_ui.kActionMenu2.KeyName
  t.slot3 = kb_ui.kActionMenu3.KeyName
  t.slot4 = kb_ui.kActionMenu4.KeyName
  t.slot5 = kb_ui.kActionMenu5.KeyName
  t.slot6 = kb_ui.kActionMenu6.KeyName
  t.slot7 = kb_ui.kActionMenu7.KeyName
  t.slot8 = kb_ui.kActionMenu8.KeyName
  t.slot9 = kb_ui.kActionMenu9.KeyName
  t.slot10 = kb_ui.kActionMenu10.KeyName
  t.slot11 = kb_ui.kActionMenu11.KeyName
  t.slot12 = kb_ui.kActionMenu12.KeyName
  local str = [[
list = 
{
]]
  for k, v in pairs(t) do
    local value = v
    if type(value) == "boolean" then
      value = value and "true" or "false"
    elseif type(value) == "string" then
      value = "\"" .. value .. "\""
    end
    str = str .. "\t" .. k .. " = " .. value .. ",\n"
  end
  str = str .. "}"
  config.ProfileStream = str
  config:SaveProfile()
end, kb_ui.kActionMoveLeft

function ApplyAction(boolSave)
  config.Sensitivity = sld_sensitivity.CurValue
  config.SensitivitySniper = sld_sniper.CurValue
  config:BindAction("kActionMoveForward", kb_ui.kActionMoveForward.KeyName)
  config:BindAction("kActionMoveBackward", kb_ui.kActionMoveBackward.KeyName)
  config:BindAction("kActionMoveLeft", kb_ui.kActionMoveLeft.KeyName)
  config:BindAction("kActionMoveRight", kb_ui.kActionMoveRight.KeyName)
  config:BindAction("kActionJump", kb_ui.kActionJump.KeyName)
  config:BindAction("kActionCrouch", kb_ui.kActionCrouch.KeyName)
  config:BindAction("kActionChangeWeapon", kb_ui.kActionChangeWeapon.KeyName)
  config:BindAction("kActionReload", kb_ui.kActionReload.KeyName)
  config:BindAction("kActionPickUpDropItem", kb_ui.kActionPickUpDropItem.KeyName)
  config:BindAction("kActionMotionMenu", kb_ui.kActionMotionMenu.KeyName)
  config:BindAction("kActionChangeView", kb_ui.kActionChangeView.KeyName)
  config:BindAction("kActionUIMap", kb_ui.kActionUIMap.KeyName)
  config:BindAction("kActionMenu1", kb_ui.kActionMenu1.KeyName)
  config:BindAction("kActionMenu2", kb_ui.kActionMenu2.KeyName)
  config:BindAction("kActionMenu3", kb_ui.kActionMenu3.KeyName)
  config:BindAction("kActionMenu4", kb_ui.kActionMenu4.KeyName)
  config:BindAction("kActionMenu5", kb_ui.kActionMenu5.KeyName)
  config:BindAction("kActionMenu6", kb_ui.kActionMenu6.KeyName)
  config:BindAction("kActionMenu7", kb_ui.kActionMenu7.KeyName)
  config:BindAction("kActionMenu8", kb_ui.kActionMenu8.KeyName)
  config:BindAction("kActionMenu9", kb_ui.kActionMenu9.KeyName)
  config:BindAction("kActionMenu10", kb_ui.kActionMenu10.KeyName)
  config:BindAction("kActionMenu11", kb_ui.kActionMenu11.KeyName)
  config:BindAction("kActionMenu12", kb_ui.kActionMenu12.KeyName)
  if boolSave then
    SaveAction()
  end
end

function s.action.show()
  local data, load_err = rpc.load_result(config.ProfileStream)
  if load_err then
    data = {}
  end
  local my_action_settings = data.list
  if my_action_settings then
    setmetatable(my_action_settings, {__index = default_action_setting})
    UpdateAction(my_action_settings)
  else
    UpdateAction(default_action_setting)
  end
end

function s.action.reset()
  UpdateAction(default_action_setting)
end

function s.action.confirm()
  ApplyAction(true)
  Hide()
end

Ctrl(6, _T("tips_common_additional_tips21"), 137, s.interface.ui)
local ckb_invite = CheckBox(17, 48, 190, _T("UI_common_Do_not_accept_mission_party_invite"), s.interface.ui[1])
local ckb_guide, UpdateInterface = CheckBox(17, 91, 190, _T("UI_common_Close_guide"), s.interface.ui[1]), 17
local UpdateInterface, ApplyInterface = function(data)
  if data then
    ckb_invite.Check = data.invite_off
    ckb_guide.Check = data.guide_off
  else
    local cp = game.CharacterProfile
    if cp then
      ckb_invite.Check = cp.InviteOff
      ckb_guide.Check = cp.GuideOff
    end
  end
end, 91

function ApplyInterface()
  local cp = game.CharacterProfile
  if cp then
    cp.InviteOff = ckb_invite.Check
    cp.GuideOff = ckb_guide.Check
    cp:Save()
  end
end

function s.interface.show()
  UpdateInterface()
end

function s.interface.reset()
  ckb_invite.Check = false
  ckb_guide.Check = false
  ApplyInterface()
end

function s.interface.confirm()
  ApplyInterface()
  Hide()
end

function s.switch.show()
end

function s.switch.reset()
  MessageBox.ShowError(_T("UI_common_Invalid_Key"))
end

function s.switch.confirm()
  MessageBox.ShowError(_T("UI_common_Invalid_Key"))
end

local btn_go_1 = Gui.Button({
  Location = Vector2(9, 5),
  Size = Vector2(398, 70),
  Text = _T("tips_common_additional_tips29"),
  EventClick = function(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateLogin")
    if state ~= nil then
    end
  end
})(nil, s.switch.ui)
local btn_go_2 = Gui.Button({
  Location = Vector2(9, 80),
  Size = Vector2(398, 70),
  Text = _T("tips_common_additional_tips30"),
  EventClick = function(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateSelectCharacter")
    if state ~= nil then
    end
  end
})(nil, s.switch.ui)
local btn_go_3 = Gui.Button({
  Location = Vector2(9, 155),
  Size = Vector2(398, 70),
  Text = _T("tips_common_additional_tips31"),
  EventClick = function(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateAvatar")
    if state ~= nil then
    end
  end
})(nil, s.switch.ui)
local btn_go_4 = Gui.Button({
  Location = Vector2(9, 230),
  Size = Vector2(398, 70),
  Text = _T("UI_common_Lobby"),
  EventClick = function(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateLobby")
    if state ~= nil then
    end
  end
})(nil, s.switch.ui)
local btn_go_5 = Gui.Button({
  Location = Vector2(9, 305),
  Size = Vector2(398, 70),
  Text = _T("UI_common_Clearance_Settlement"),
  EventClick = function(sender, e)
    local state = ptr_cast(game.CurrentState, "Client.StateBalance")
    if state ~= nil then
    end
  end
})(nil, s.switch.ui)
local btn_reset = Gui.Button({
  Location = Vector2(10, 550),
  Size = Vector2(124, 37),
  Text = _T("button_common_Default"),
  EventClick = function(sender, e)
    s[sel].reset()
  end
})(ctrl_main, nil)
local btn_confirm = Gui.Button({
  Location = Vector2(178, 550),
  Size = Vector2(105, 37),
  Text = _T("button_common_OK"),
  EventClick = function(sender, e)
    s[sel].confirm()
  end
})(ctrl_main, nil)
local btn_cancel = Gui.Button({
  Location = Vector2(291, 550),
  Size = Vector2(105, 37),
  Text = _T("button_common_Cancel"),
  EventClick = function(sender, e)
    if s[sel].cancle then
      s[sel].cancle()
    end
    Hide()
  end
})(ctrl_main, nil)

function Init()
  UpdateInterface()
  UpdateAudioUI()
  UpdateGraphicUI()
  ApplyAudioSetting()
  ApplyGraphicSetting()
  ApplyInterface()
  
  function config.EventLoadSettings(sender, e)
    if e.Details then
      local data, load_err = rpc.load_result(config.SettingStream)
      if load_err then
        data = {}
      end
    end
  end
  
  function config.EventLoadProfile(sender, e)
    local cProfile = game.CharacterProfile
    if e.Details and cProfile then
      local data, load_err = rpc.load_result(e.Details)
      if load_err then
        data = {}
      end
      local my_settings = data.list
      if type(my_settings) ~= "table" then
        my_settings = {}
      end
      setmetatable(my_settings, {__index = default_action_setting})
      UpdateAction(my_settings)
      ApplyAction(true)
    end
  end
  
  function config.EventSaveProfile(sender, e)
    if PersonalInfo then
      PersonalInfo.SetHotKeyName()
    end
  end
end

function Show(t)
  local m = ModalWindow.Show("transparent")
  m.root.Size = Vector2(430, 650)
  ctrl_setting.Parent = m.root
  Gui.Clear(s[sel].ui)
  sel = t
  for _, v in ipairs(s[sel].ui) do
    v.Parent = ctrl_main
  end
  lb_title.Text = s[t].title
  lb_title.Parent = ctrl_setting
  ctrl_main.Parent = ctrl_setting
  s[sel].show()
  return m
end

function Hide()
  ModalWindow.Close()
end
