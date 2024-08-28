module("SkinF", package.seeall)
require("iconsD.lua")
require("iconsF.lua")
local Style = Gui.Style
local Vector2 = Vector2
local Vector3 = Vector3
local Vector4 = Vector4
local ARGB = ARGB
local XRGB = XRGB
local white = ARGB(255, 255, 255, 255)
local brown = ARGB(255, 62, 26, 1)
Style("Gui.Control")({
  BackgroundColor = ARGB(0, 255, 255, 255)
})
Style("Gui.Button")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
  }),
  FontSize = 16,
  TextColor = ARGB(255, 255, 255, 255),
  DisabledTextColor = ARGB(255, 192, 192, 192),
  BackgroundColor = ARGB(255, 255, 255, 255),
  Size = Vector2(84, 18),
  ClickAudio = "button"
})
Style("Gui.BarButton_1")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background09_normal.tga", Vector4(35, 0, 35, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_common_background09_hover.tga", Vector4(35, 0, 35, 0)),
    DownImage = Gui.Image("ui/skinF/skin_common_background09_down.tga", Vector4(35, 0, 35, 0)),
    DisabledImage = nil
  })
})
Style("Gui.BarButton_2")({
  Skin = Gui.ButtonSkin({
    HoverImage = Gui.Image("ui/skinF/skin_common_background09_normal.tga", Vector4(35, 0, 35, 0)),
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background09_hover.tga", Vector4(35, 0, 35, 0)),
    DownImage = Gui.Image("ui/skinF/skin_common_background09_down.tga", Vector4(35, 0, 35, 0)),
    DisabledImage = nil
  })
})
Style("Gui.Textbox")({
  Skin = Gui.TextboxSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06.tga", Vector4(6, 6, 6, 6)),
    ActiveImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06_down.tga", Vector4(6, 6, 6, 6)),
    DisabledImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06_disabled_01.tga", Vector4(6, 6, 6, 6))
  }),
  TextPadding = Vector4(6, 2, 6, 2),
  TextColor = ARGB(255, 255, 255, 255),
  SelectionColor = ARGB(255, 128, 0, 0),
  SelectionBgColor = ARGB(255, 255, 255, 128),
  Size = Vector2(100, 18)
})
Style("Gui.Tooltip")({
  Skin = Gui.TooltipSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_tips01_a.tga", Vector4(6, 6, 6, 10))
  }),
  TextColor = ARGB(255, 255, 255, 255),
  TextPadding = Vector4(18, 8, 18, 12),
  MaxWidth = 268,
  ArrowWidth = 18
})
Style("Gui.TextArea")({
  Skin = commonScrTextArea,
  TextColor = ARGB(255, 0, 0, 0),
  SelectionColor = ARGB(255, 255, 255, 255),
  SelectionBgColor = ARGB(255, 80, 80, 80),
  TextPadding = Vector4(6, 4, 6, 4)
})
Style("Gui.Slider")({
  Skin = Gui.SliderSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_common_slider01_bg.tga", Vector4(10, 0, 10, 0)),
    ThumbNormalImage = Gui.Image("/ui/skinF/skinF_common_slider01_button_normal.tga", Vector4(0, 0, 0, 0)),
    ThumbHoverImage = Gui.Image("/ui/skinF/skinF_common_slider01_button_down.tga", Vector4(0, 0, 0, 0)),
    ThumbDownImage = Gui.Image("/ui/skinF/skinF_common_slider01_button_down.tga", Vector4(0, 0, 0, 0)),
    ThumbDisabledImage = nil
  }),
  ThumbSize = Vector2(22, 22)
})
Style("Gui.Label")({
  BackgroundColor = ARGB(0, 0, 0, 0),
  TextColor = ARGB(255, 255, 255, 255)
})
Style("Gui.FlowLayout")({
  BackgroundColor = ARGB(0, 0, 0, 0)
})
Style("Gui.PictureMapInBrowser")({
  Skin = Gui.ItemPictureSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_common_background13.tga", Vector4(10, 10, 10, 10)),
    HoverFrame = Gui.Image("/ui/skinF/skin_common_background08_01.tga", Vector4(8, 8, 8, 8)),
    HighlightFrame = Gui.Image("/ui/skinF/skin_common_background08_01.tga", Vector4(8, 8, 8, 8)),
    EmptyFrame = Gui.Image("/ui/skinF/skin_common_background13.tga", Vector4(10, 10, 10, 10))
  }),
  KeepAspect = false,
  TextColor = ARGB(255, 144, 144, 144),
  Padding = Vector4(6, 6, 6, 6)
})
Style("Gui.Picture")({
  Skin = Gui.PictureSkin({
    HoverFrame = Gui.Image("/ui/skinF/skinF_BG30%.tga", Vector4(3, 3, 3, 3)),
    HighlightFrame = Gui.Image("/ui/skinF/skinF_room_map_down.tga", Vector4(8, 8, 8, 8))
  }),
  TextColor = ARGB(255, 144, 144, 144),
  Padding = Vector4(0, 0, 0, 0)
})
Style("Gui.ImageBrowser")({
  Skin = Gui.ControlSkin({BackgroundImage = nil}),
  PictureStyle = "Gui.Picture"
})
PropertyItemSkin = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinA/skinA_common_propertyitem01_standard01.tga", Vector4(3, 3, 3, 3)),
  BackgroundImageOp = Gui.Image("/ui/skinA/skinA_common_propertyitem01_standard02.tga", Vector4(3, 3, 3, 3)),
  HoverImage = Gui.Image("/ui/skinA/skinA_common_propertyitem01_hover.tga", Vector4(3, 3, 3, 3)),
  SelectedImage = Gui.Image("/ui/skinA/skinA_common_propertyitem01_selected.tga", Vector4(3, 3, 3, 3)),
  DisabledImage = Gui.Image("/ui/skinA/skinA_common_propertyitem01_selected.tga", Vector4(3, 3, 3, 3))
})
Style("Gui.PropertyView")({
  Skin = Gui.ListTreeViewSkin({
    BackgroundImage = Gui.Image("/ui/skinA/skinA_common_border_white_5.tga", Vector4(5, 5, 5, 5)),
    UpButtonNormalImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_up_button_normal.tga", Vector4(3, 3, 3, 3)),
    UpButtonHoverImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_up_button_hover.tga", Vector4(3, 3, 3, 3)),
    UpButtonDownImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_up_button_down.tga", Vector4(3, 3, 3, 3)),
    UpButtonDisabledImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_up_button_disabled.tga", Vector4(3, 3, 3, 3)),
    DownButtonNormalImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_down_button_normal.tga", Vector4(3, 3, 3, 3)),
    DownButtonHoverImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_down_button_hover.tga", Vector4(3, 3, 3, 3)),
    DownButtonDownImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_down_button_down.tga", Vector4(3, 3, 3, 3)),
    DownButtonDisabledImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_down_button_disabled.tga", Vector4(3, 3, 3, 3)),
    LeftButtonNormalImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_left_button_normal.tga", Vector4(3, 3, 3, 3)),
    LeftButtonHoverImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_left_button_hover.tga", Vector4(3, 3, 3, 3)),
    LeftButtonDownImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_left_button_down.tga", Vector4(3, 3, 3, 3)),
    LeftButtonDisabledImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_left_button_disabled.tga", Vector4(3, 3, 3, 3)),
    RightButtonNormalImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_right_button_normal.tga", Vector4(3, 3, 3, 3)),
    RightButtonHoverImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_right_button_hover.tga", Vector4(3, 3, 3, 3)),
    RightButtonDownImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_right_button_down.tga", Vector4(3, 3, 3, 3)),
    RightButtonDisabledImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_right_button_disabled.tga", Vector4(3, 3, 3, 3)),
    VSliderNormalImage = Gui.Image("ui/skinA/skinA_scrollbar_v_slider_normal.tga", Vector4(3, 3, 3, 3)),
    VSliderHoverImage = Gui.Image("ui/skinA/skinA_scrollbar_v_slider_hover.tga", Vector4(3, 3, 3, 3)),
    VSliderDownImage = Gui.Image("ui/skinA/skinA_scrollbar_v_slider_down.tga", Vector4(3, 3, 3, 3)),
    VSliderDisabledImage = Gui.Image("ui/skinA/skinA_scrollbar_v_slider_disabled.tga", Vector4(3, 3, 3, 3)),
    HSliderNormalImage = Gui.Image("ui/skinA/skinA_scrollbar_h_slider_normal.tga", Vector4(3, 3, 3, 3)),
    HSliderHoverImage = Gui.Image("ui/skinA/skinA_scrollbar_h_slider_hover.tga", Vector4(3, 3, 3, 3)),
    HSliderDownImage = Gui.Image("ui/skinA/skinA_scrollbar_h_slider_down.tga", Vector4(3, 3, 3, 3)),
    HSliderDisabledImage = Gui.Image("ui/skinA/skinA_scrollbar_h_slider_disabled.tga", Vector4(3, 3, 3, 3)),
    VBarBackgroundImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_background.tga", Vector4(3, 3, 3, 3)),
    HBarBackgroundImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_background.tga", Vector4(3, 3, 3, 3)),
    BarCornerImage = Gui.Image("ui/skinA/skinA_common_scrollbar01_corner.tga", Vector4(3, 3, 3, 3)),
    ExpandedImage = Gui.Image("/ui/skinA/skinA_common_button02_minus.tga", Vector4(3, 3, 3, 3)),
    CollapsedImage = Gui.Image("/ui/skinA/skinA_common_button02_plus.tga", Vector4(3, 3, 3, 3)),
    VDashImage = Gui.Image("/ui/skinA/skinA_common_line01_vertical.tga", Vector4(3, 3, 3, 3)),
    HalfVDashImage = Gui.Image("/ui/skinA/skinA_common_line02_vertical.tga", Vector4(3, 3, 3, 3)),
    HalfHDashImage = Gui.Image("/ui/skinA/skinA_common_line02_horizontal.tga", Vector4(3, 3, 3, 3)),
    GridLineColor = ARGB(255, 28, 32, 38)
  }),
  ItemSkin = PropertyItemSkin,
  EditorTextboxStyle = "Gui.Textbox",
  EditorComboBoxStyle = "Gui.ComboBox",
  EditorButtonStyle = "Gui.ButtonInfoFW",
  BackgroundColor = ARGB(255, 28, 32, 38),
  TextColor = ARGB(255, 0, 0, 0)
})
Style("Gui.Balloon")({
  Skin = Gui.BalloonSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_tips02_a.tga", Vector4(10, 12, 10, 16)),
    ArrowDownImage = Gui.Image("/ui/skinF/skinF_tips02_b.tga", Vector4(0, 12, 0, 16)),
    ArrowUpImage = Gui.Image("/ui/skinF/skinF_tips02_b2.tga", Vector4(0, 12, 0, 16))
  }),
  TextColor = ARGB(255, 255, 255, 255),
  TextLightSource = -math.pi / 4,
  TextShadowColor = ARGB(128, 0, 0, 0),
  TextPadding = Vector4(26, 28, 26, 32),
  MaxWidth = 240,
  ArrowWidth = 32
})
Style("Gui.Menu")({
  Skin = Gui.MenuSkin({
    BackgroundImage = Gui.Image("ui/SkinF/skin_common_background12.tga", Vector4(16, 16, 16, 16)),
    ItemHoverImage = Gui.Image("ui/SkinF/skin_common_row.tga", Vector4(16, 6, 16, 6)),
    ItemRadioImage = Gui.Image("ui/skinF/skinF_radiobox01_button.tga", Vector4(0, 0, 0, 0)),
    ItemCheckedImage = Gui.Image("ui/skinF/skinF_radiobox01_on.tga", Vector4(0, 0, 0, 0)),
    ItemUncheckImage = Gui.Image("ui/skinF/skinF_radiobox01_BG.tga", Vector4(0, 0, 0, 0)),
    ItemHasSubMenuImage = Gui.Image("ui/skinF/skin_common_menu_01.tga", Vector4(0, 0, 0, 0)),
    SeparatorImage = Gui.Image("ui/skinF/skinF_chat_dropdown01_line.tga", Vector4(6, 0, 32, 0))
  }),
  HighlightTextColor = ARGB(255, 62, 26, 1),
  TextColor = ARGB(255, 255, 255, 255),
  Border = Vector4(0, 16, 0, 24),
  ItemWidth = 148,
  SeparatorHeight = 6,
  ItemHeight = 26
})
Style("Gui.SmallBalloon")({
  Skin = Gui.BalloonSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_tips01_a.tga", Vector4(6, 6, 6, 10)),
    ArrowDownImage = Gui.Image("/ui/skinF/skinF_tips01_b.tga", Vector4(0, 6, 0, 10)),
    ArrowUpImage = Gui.Image("/ui/skinF/skinF_tips01_b2.tga", Vector4(0, 6, 0, 10))
  }),
  TextColor = ARGB(255, 0, 0, 0),
  TextShadowColor = ARGB(128, 255, 255, 255),
  TextPadding = Vector4(18, 8, 18, 12),
  MaxWidth = 360,
  ArrowWidth = 18
})
Style("Tooltip")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_common_tooltipBG.tga", Vector4(3, 3, 3, 3))
  }),
  BackgroundColor = ARGB(255, 255, 255, 255)
})
Style("Gui.TooltipTop")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_tooltips_BG01Top.tga", Vector4(16, 16, 16, 0))
  }),
  BackgroundColor = ARGB(255, 255, 255, 255)
})
Style("Gui.TooltipMiddle")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_tooltips_BG01.tga", Vector4(16, 0, 16, 0))
  }),
  BackgroundColor = ARGB(255, 255, 255, 255)
})
Style("Gui.TooltipBottom")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skinF_tooltips_BG01Bottom.tga", Vector4(16, 0, 108, 28))
  }),
  BackgroundColor = ARGB(255, 255, 255, 255)
})
Style("Gui.CheckBox")({
  Skin = Gui.CheckBoxSkin({
    OnHoverImage = Gui.Image("ui/skinF/skin_login_checkbox_on_hover.tga", Vector4(0, 0, 0, 0)),
    OffImage = Gui.Image("ui/skinF/skin_login_checkbox_off_normal.tga", Vector4(0, 0, 0, 0)),
    OnImage = Gui.Image("ui/skinF/skin_login_checkbox_on_normal.tga", Vector4(0, 0, 0, 0)),
    OffHoverImage = Gui.Image("ui/skinF/skin_login_checkbox_off_hover.tga", Vector4(0, 0, 0, 0)),
    OnDisabledImage = Gui.Image("ui/skinF/skin_login_checkbox_off_disabled.tga", Vector4(0, 0, 0, 0)),
    OffDisabledImage = Gui.Image("ui/skinF/skin_login_checkbox_off_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  TextColor = ARGB(255, 255, 255, 255),
  BackgroundColor = ARGB(0, 0, 0, 0)
})
Style("Gui.CheckBox_01")({
  Skin = Gui.CheckBoxSkin({
    OnImage = Gui.Image("ui/skinF/skin_login_radiobutton_on_normal.tga", Vector4(0, 0, 0, 0)),
    OnHoverImage = Gui.Image("ui/skinF/skin_login_radiobutton_on_hover.tga", Vector4(0, 0, 0, 0)),
    OffImage = Gui.Image("ui/skinF/skin_login_radiobutton_off_normal.tga", Vector4(0, 0, 0, 0)),
    OffHoverImage = Gui.Image("ui/skinF/skin_login_radiobutton_off_hover.tga", Vector4(0, 0, 0, 0)),
    OnDisabledImage = Gui.Image("ui/skinF/skin_login_checkbox_off_disabled.tga", Vector4(0, 0, 0, 0)),
    OffDisabledImage = Gui.Image("ui/skinF/skin_login_radiobutton_off_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  TextColor = ARGB(255, 255, 255, 255),
  BackgroundColor = ARGB(0, 0, 0, 0)
})
Style("Gui.ScrollableControl")({
  Skin = Gui.ScrollableControlSkin({
    UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
    UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
    UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
    UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
    DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
    DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
    DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
    DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
    VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(6, 6, 6, 6)),
    VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(6, 6, 6, 6)),
    VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(6, 6, 6, 6)),
    VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(6, 6, 6, 6)),
    VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(6, 6, 6, 6))
  }),
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22,
  AutoScroll = true,
  AutoSize = true,
  VScrollBarDisplay = "kVisible",
  HScrollBarDisplay = "kHide"
})
Style("Gui.ItemTip")({
  Skin = Gui.ItemTipSkin({
    BackgroundImage = Gui.Image("ui/SkinF/skin_tooltips_BG01.tga", Vector4(15, 15, 15, 15)),
    AvatarImage = Gui.Image("ui/skinF/skin_avatarcard.tga", Vector4(8, 8, 8, 8)),
    ListImage = Gui.Image("ui/SkinF/skin_tooltips_BG02.tga", Vector4(15, 15, 15, 15)),
    DiamondImage = Gui.Image("ui/SkinF/skin_tooltips_icon_rhomboid.tga", Vector4(0, 0, 0, 0)),
    SlotImage = Gui.Image("ui/SkinF/skin_tooltips_bg03.tga", Vector4(0, 0, 0, 0))
  })
})
Style("Gui.ComboList")({
  Skin = Gui.ComboListSkin({
    BackgroundImage = Gui.Image("ui/SkinF/skin_common_background12.tga", Vector4(15, 20, 15, 20)),
    VBarBackgroundImage = Gui.Image("ui/SkinF/skin_gam_scrollbar_BG.tga", Vector4(5, 34, 5, 34)),
    UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
    UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
    UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
    UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
    DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
    DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
    DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
    DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
    VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(6, 6, 6, 6)),
    VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(6, 6, 6, 6)),
    VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(6, 6, 6, 6)),
    VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(6, 6, 6, 6)),
    VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(6, 6, 6, 6)),
    BarCornerImage = nil,
    ItemActiveImage = Gui.Image("ui/SkinF/skin_common_row2.tga", Vector4(8, 0, 8, 0))
  }),
  FontSize = 16,
  TextColor = white,
  HighlightTextColor = brown,
  ItemAlign = "kAlignLeftMiddle",
  Border = Vector4(13, 13, 13, 13)
})
Style("Gui.ComboBox")({
  Skin = Gui.ComboBoxSkin({
    ButtonNormalImage = Gui.Image("ui/SkinF/skin_common_combobox_button_normal.tga", Vector4(8, 8, 8, 8)),
    ButtonHoverImage = Gui.Image("ui/SkinF/skin_common_combobox_button_hover.tga", Vector4(8, 8, 8, 8)),
    ButtonDownImage = Gui.Image("ui/SkinF/skin_common_combobox_button_down.tga", Vector4(8, 8, 8, 8)),
    ButtonDisabledImage = Gui.Image("ui/SkinF/skin_common_combobox_button_disabled.tga", Vector4(8, 8, 8, 8)),
    TextNormalImage = Gui.Image("ui/SkinF/skin_common_combobox_BG_normal.tga", Vector4(6, 6, 0, 6)),
    TextHoverImage = Gui.Image("ui/SkinF/skin_common_combobox_BG_hover.tga", Vector4(6, 6, 0, 6)),
    TextDownImage = Gui.Image("ui/SkinF/skin_common_combobox_BG_down.tga", Vector4(6, 6, 0, 6)),
    TextDisabledImage = Gui.Image("ui/SkinF/skin_common_combobox_BG_disabled.tga", Vector4(6, 6, 0, 6))
  }),
  FontSize = 16,
  Readonly = true,
  TextColor = ARGB(255, 255, 255, 255),
  HighlightTextColor = ARGB(255, 242, 202, 4),
  TextAlign = "kAlignLeftMiddle",
  ChildComboListStyle = "Gui.ComboList",
  DropDownHeight = 300
})
team_num_font_blue = Gui.TextureFont("/ui/skinF/skin_number_blue.tga", Vector2(432, 62))
for i = 0, 8 do
  team_num_font_blue:PushTextureChar(string.byte("0") + i, Vector2(i * 48, 0), Vector2(48, 62), 48)
end
team_num_font_red = Gui.TextureFont("/ui/skinF/skin_number_red.tga", Vector2(432, 62))
for i = 0, 8 do
  team_num_font_red:PushTextureChar(string.byte("0") + i, Vector2(i * 48, 0), Vector2(48, 62), 48)
end
hecheng_number_1 = Gui.TextureFont("/ui/skinF/skin_common_item_number.tga", Vector2(143, 18))
for i = 0, 9 do
  hecheng_number_1:PushTextureChar(string.byte("0") + i, Vector2(i * 13, 0), Vector2(13, 18), 10)
end
hecheng_number_1:PushTextureChar(string.byte("/"), Vector2(130, 0), Vector2(13, 18), 10)
hecheng_number_2 = Gui.TextureFont("/ui/skinF/skin_common_item_number_3.tga", Vector2(143, 18))
for i = 0, 9 do
  hecheng_number_2:PushTextureChar(string.byte("0") + i, Vector2(i * 13, 0), Vector2(13, 18), 11)
end
hecheng_number_2:PushTextureChar(string.byte("/"), Vector2(130, 0), Vector2(13, 18), 11)
hecheng_number_3 = Gui.TextureFont("/ui/skinF/skin_hecheng_number_2.tga", Vector2(168, 15))
for i = 0, 9 do
  hecheng_number_3:PushTextureChar(string.byte("0") + i, Vector2(i * 12, 0), Vector2(12, 15), 10)
end
hecheng_number_3:PushTextureChar(string.byte("+"), Vector2(120, 0), Vector2(12, 15), 10)
hecheng_number_3:PushTextureChar(string.byte("-"), Vector2(132, 0), Vector2(12, 15), 10)
hecheng_number_3:PushTextureChar(string.byte("%"), Vector2(144, 0), Vector2(18, 15), 15)
hecheng_number_3:PushTextureChar(string.byte("."), Vector2(162, 0), Vector2(6, 15), 5)
hecheng_number_4 = Gui.TextureFont("/ui/skinF/skin_hecheng_number_2_blue.tga", Vector2(168, 15))
for i = 0, 9 do
  hecheng_number_4:PushTextureChar(string.byte("0") + i, Vector2(i * 12, 0), Vector2(12, 15), 10)
end
hecheng_number_4:PushTextureChar(string.byte("+"), Vector2(120, 0), Vector2(12, 15), 10)
hecheng_number_4:PushTextureChar(string.byte("-"), Vector2(132, 0), Vector2(12, 15), 10)
hecheng_number_4:PushTextureChar(string.byte("%"), Vector2(144, 0), Vector2(18, 15), 15)
hecheng_number_4:PushTextureChar(string.byte("."), Vector2(162, 0), Vector2(6, 15), 5)
local numScale = 0.7777777777777778
hecheng_number_5 = Gui.TextureFont("/ui/skinF/skin_common_item_number.tga", Vector2(143 * numScale, 18 * numScale))
for i = 0, 9 do
  hecheng_number_5:PushTextureChar(string.byte("0") + i, Vector2(i * 13 * numScale, 0 * numScale), Vector2(13 * numScale, 18 * numScale), 10 * numScale)
end
hecheng_number_5:PushTextureChar(string.byte("/"), Vector2(130 * numScale, 0 * numScale), Vector2(13 * numScale, 18 * numScale), 10 * numScale)
local numScale = 0.7777777777777778
hecheng_number_6 = Gui.TextureFont("/ui/skinF/skin_common_item_number_3.tga", Vector2(143 * numScale, 18 * numScale))
for i = 0, 9 do
  hecheng_number_6:PushTextureChar(string.byte("0") + i, Vector2(i * 13 * numScale, 0 * numScale), Vector2(13 * numScale, 18 * numScale), 10 * numScale)
end
hecheng_number_6:PushTextureChar(string.byte("/"), Vector2(130 * numScale, 0 * numScale), Vector2(13 * numScale, 18 * numScale), 10 * numScale)
jiesuan_number_1 = Gui.TextureFont("/ui/skinF/skin_jiesuan_score_number.tga", Vector2(250, 36))
for i = 0, 9 do
  jiesuan_number_1:PushTextureChar(string.byte("0") + i, Vector2(i * 25, 0), Vector2(25, 36), 25)
end
info_number_1 = Gui.TextureFont("/ui/skinF/skin_info_numbers.tga", Vector2(230, 30))
for i = 0, 9 do
  info_number_1:PushTextureChar(string.byte("0") + i, Vector2(i * 23, 0), Vector2(23, 30), 20)
end
level_number_1 = Gui.TextureFont("/ui/skinF/skinF_ranknumber.tga", Vector2(190, 24))
for i = 0, 9 do
  level_number_1:PushTextureChar(string.byte("0") + i, Vector2(i * 19, 0), Vector2(19, 24), 15)
end
Style("jiesuan.numFlash")({
  TextureFont = SkinF.jiesuan_number_1
})
skin_002 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background01.tga", Vector4(16, 16, 16, 16))
})
skin_login_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_login_logo.tga", Vector4(0, 0, 0, 0))
})
skin_login_002 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_login_account.tga", Vector4(0, 0, 0, 0))
})
skin_login_003 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_login_password.tga", Vector4(0, 0, 0, 0))
})
skin_touming = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/bucunzaidetu.tga", Vector4(0, 0, 0, 0))
})
skin_touming2 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/bucunzaidetu.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_013 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_button01_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_playgame_button01_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_playgame_button01_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_playgame_button01_disabled.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_033 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_windowtop_background01_02.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_057 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_menu_normal_01.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_menu_hover_01.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_menu_down_01.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_menu_disabled_01.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_058 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_info.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_guild.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_mission.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_enhance.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_auction.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_shop.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_avatar.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_lottery.tga", Vector4(0, 0, 0, 0))
  })
}
lobbyMain_059 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_menu_2_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_menu_2_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_menu_2_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_menu_2_disabled.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_060 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_sign.tga", Vector4(0, 0, 0, 0))
  }),
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_mail.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_mail_new.tga", Vector4(0, 0, 0, 0))
    })
  },
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_friend.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_setup.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_message.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_message_2.tga", Vector4(0, 0, 0, 0))
  })
}
lobbyMain_062 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_common_online_award.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_063 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_online_award_button_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_online_award_button_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_online_award_button_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_online_award_button_disabled.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_064 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_common_online_award_icon02.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_065 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_menu_light.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_066 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_gerenxinxi_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_gerenxinxi_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_gerenxinxi_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_gerenxinxi_disabled.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_067 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_zaixianchongzhi_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_zaixianchongzhi_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_zaixianchongzhi_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_zaixianchongzhi_disabled.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_068 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_windowtop_background03_under.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_069 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_menu_2_message.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_menu_2_message_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_menu_2_message_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_menu_2_message.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_070 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_menu_2_message_2.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_menu_2_message_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_menu_2_message_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_menu_2_message.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_071 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_playgame_bg27.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_072 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_playgame_countdown_hover.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_073 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_menu_2_mail_new2.tga", Vector4(0, 0, 0, 0))
})
lobbyMain_expbar = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_expbg.tga", Vector4(20, 0, 20, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_exp.tga", Vector4(20, 0, 20, 0))
  })
}
select_character_024 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_chara_button03_normal.tga", Vector4(16, 16, 16, 16)),
  HoverImage = Gui.Image("ui/skinF/skin_chara_button03_hover.tga", Vector4(16, 16, 16, 16)),
  DownImage = Gui.Image("ui/skinF/skin_chara_button03_down.tga", Vector4(16, 16, 16, 16))
})
select_character_029 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button01_normal_10.tga", Vector4(40, 25, 40, 25)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button01_hover_10.tga", Vector4(40, 25, 40, 25)),
  DownImage = Gui.Image("ui/skinF/skin_common_button01_down_10.tga", Vector4(40, 25, 40, 25)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button01_disabled_10.tga", Vector4(40, 25, 40, 25))
})
select_character_031 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_zhiye02_down.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_zhiye01_down.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_zhiye03_down.tga", Vector4(0, 0, 0, 0))
  })
}
select_character_032 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_chara_BG01_10.tga", Vector4(25, 25, 25, 25))
})
select_character_033 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_icon02_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_chara_icon02_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_chara_icon02_down.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_icon01_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_chara_icon01_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_chara_icon01_down.tga", Vector4(0, 0, 0, 0))
  })
}
select_character_035 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_title1_1.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_title2_1.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_title3_1.tga", Vector4(0, 0, 0, 0))
  })
}
select_character_037 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_windowtop_background01_03.tga", Vector4(0, 0, 0, 0))
})
select_character_038 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button02_normal_10.tga", Vector4(40, 25, 40, 25)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button02_hover_10.tga", Vector4(40, 25, 40, 25)),
  DownImage = Gui.Image("ui/skinF/skin_common_button02_down_10.tga", Vector4(40, 25, 40, 25)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button02_disabled_10.tga", Vector4(40, 25, 40, 25))
})
select_character_039 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_chara_BG02_11.tga", Vector4(0, 35, 0, 35))
})
select_character_040 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_chara_BG01_title01.tga", Vector4(30, 0, 30, 0))
})
select_character_041 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_icon_02.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_chara_icon_01.tga", Vector4(0, 0, 0, 0))
  })
}
select_character_042 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_chara_BG01_title02.tga", Vector4(80, 0, 40, 0))
})
select_character_043 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_zhiye02_icon.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_zhiye01_icon.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_zhiye03_icon.tga", Vector4(0, 0, 0, 0))
  })
}
select_character_044 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guardian_title.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_rocker_title.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hunter_title.tga", Vector4(0, 0, 0, 0))
  })
}
select_character_045 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_backsmall.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_setupsmall.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_minus.tga", Vector4(0, 0, 0, 0))
  })
}
avatar_main_044 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_mouse01.tga", Vector4(0, 0, 0, 0))
})
avatar_main_048 = Gui.ColorContainerSkin({
  ColorBackgroundImage1 = Gui.Image("ui/skinF/skin_avatarroom_BG09.tga", Vector4(0, 0, 0, 0)),
  ColorBackgroundImage2 = nil,
  ColorBtnImage1 = Gui.Image("ui/skinF/skin_color_button01.tga", Vector4(0, 0, 0, 0)),
  ColorBtnImage2 = Gui.Image("ui/skinF/skin_color_button02.tga", Vector4(0, 0, 0, 0)),
  ColorChannelImage1 = Gui.Image("ui/skinF/skin_common_background14.tga", Vector4(0, 0, 0, 0)),
  ColorChannelImage2 = Gui.Image("ui/skinF/skin_common_background15.tga", Vector4(0, 0, 0, 0))
})
avatar_main_062 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab01_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab01_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab01_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button01_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_063 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab02_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab02_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab02_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button02_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_064 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab03_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab03_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab03_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button03_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_065 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab04_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab04_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab04_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button04_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_066 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab05_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab05_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab05_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button05_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_067 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab06_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab06_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab06_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button06_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_068 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab07_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab07_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab07_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button07_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_070 = Gui.ButtonSkin({
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_BG01_01.tga", Vector4(20, 20, 20, 20)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_BG01_01.tga", Vector4(20, 20, 20, 0))
})
avatar_main_071 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_button_01_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_button_01_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_button_01_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button_01_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_072 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_button_02_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_button_02_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_button_02_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button_02_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_073 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_button_03_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_button_03_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_button_03_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_button_03_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_074 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_BG20_normal.tga", Vector4(60, 20, 30, 20))
})
avatar_main_075 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_BG20_down.tga", Vector4(60, 20, 30, 20))
})
avatar_main_076 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab08_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab08_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab08_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab08_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_077 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab13_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab13_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab13_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab13_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_078 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab09_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab09_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab09_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab09_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_079 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab10_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab10_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab10_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab10_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_080 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab11_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab11_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab11_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab11_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_081 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab16_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab16_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab16_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab16_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_082 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab12_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab12_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab12_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab12_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_084 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_tab14_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_avatarroom_tab14_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_avatarroom_tab14_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_avatarroom_tab14_disabled.tga", Vector4(0, 0, 0, 0))
})
avatar_main_085 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_windowtop_background03_02.tga", Vector4(0, 220, 0, 70))
})
avatar_main_086 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_price_bg.tga", Vector4(40, 0, 40, 0))
})
avatar_mian_087 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_createcard.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_deletecard.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_cancelcreate.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_finishcreate.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_buyall.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_plus.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_button_icon_cancelsmall.tga", Vector4(0, 0, 0, 0))
  })
}
avatar_main_088 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_jinbi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_xingbi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_xunzhang.tga", Vector4(0, 0, 0, 0))
  })
}
avatar_main_089 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button03_normal.tga", Vector4(20, 18, 20, 18)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button03_hover.tga", Vector4(20, 18, 20, 18)),
  DownImage = Gui.Image("ui/skinF/skin_common_button03_down.tga", Vector4(20, 18, 20, 18)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button02_disabled_10.tga", Vector4(20, 18, 20, 18))
})
avatar_layer_stamp = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon07.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon08.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon09.tga", Vector4(0, 0, 0, 0))
  })
}
Style("AvtButton.BC_2")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_BG02_01.tga", Vector4(0, 0, 0, 0))
  })
})
Style("LayerButton.NumberBG")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_BG03_001.tga", Vector4(0, 0, 0, 0))
  })
})
skin_playgame_006 = Gui.ScrollableControlSkin({
  BackgroundImage = nil,
  UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
  UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
  UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
  UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
  DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
  DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
  DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
  DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
  VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(5, 4, 5, 4)),
  VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(5, 4, 5, 4)),
  VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(5, 4, 5, 4)),
  VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(5, 4, 5, 4)),
  VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(16, 45, 16, 45)),
  BarCornerImage = nil
})
skin_playgame_007 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_playgame_BG01_normal.tga", Vector4(66, 8, 8, 8)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_playgame_BG01_normal.tga", Vector4(66, 8, 8, 8)),
  HoverImage = Gui.Image("/ui/skinF/skin_playgame_BG01_hover.tga", Vector4(66, 8, 8, 8)),
  SelectedImage = Gui.Image("/ui/skinF/skin_playgame_BG01_down.tga", Vector4(66, 8, 8, 8)),
  DisabledImage = nil,
  FrameImage = nil,
  CheckOnIcon = nil,
  CheckOffIcon = nil
})
skin_playgame_008 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_room_BG02_normal.tga", Vector4(52, 0, 12, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_room_BG02_normal.tga", Vector4(52, 0, 12, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_room_BG02_hover.tga", Vector4(52, 0, 12, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_room_BG03.tga", Vector4(52, 0, 12, 0)),
  DisabledImage = Gui.Image("/ui/skinF/skin_guild_list_bg_disabled.tga", Vector4(52, 0, 12, 0)),
  FrameImage = nil,
  CheckOnIcon = nil,
  CheckOffIcon = nil
})
skin_playgame_009 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_room_BG03_normal.tga", Vector4(52, 0, 12, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_room_BG03_normal.tga", Vector4(52, 0, 12, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_room_BG03_hover.tga", Vector4(52, 0, 12, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_room_BG03.tga", Vector4(52, 0, 12, 0)),
  DisabledImage = Gui.Image("/ui/skinF/skin_guild_list_bg_disabled.tga", Vector4(52, 0, 12, 0)),
  FrameImage = nil,
  CheckOnIcon = nil,
  CheckOffIcon = nil
})
skin_playgame_010 = Gui.HeaderSkin({
  NormalImage = Gui.Image("/ui/skinF/skin_playgame_BG20_normal.tga", Vector4(4, 4, 4, 4)),
  HoverImage = Gui.Image("/ui/skinF/skin_playgame_BG20_hover.tga", Vector4(4, 4, 4, 4)),
  DownImage = Gui.Image("/ui/skinF/skin_playgame_BG20_down.tga", Vector4(4, 4, 4, 4)),
  DisabledImage = nil,
  SortNormalImage = Gui.Image("/ui/skinF/skin_playgame_arrow_2.tga", Vector4(0, 0, 0, 0)),
  SortReverseImage = Gui.Image("/ui/skinF/skin_playgame_arrow.tga", Vector4(0, 0, 0, 0))
})
Style("Gui.AvatarListTreeView")({
  ItemGap = 2,
  ItemHeight = 41,
  HeaderHeight = 29,
  TreeVisible = false,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = true,
  Skin = skin_playgame_006,
  ItemSkin = skin_playgame_007,
  HeaderSkin = skin_playgame_010,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kVisible",
  BackgroundColor = ARGB(255, 255, 255, 255),
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22
})
Style("Gui.AvatarListTreeView002")({
  ItemGap = 1,
  ItemHeight = 46,
  HeaderHeight = 32,
  TreeVisible = false,
  HeaderVisible = false,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = nil,
  ItemSkin = skin_playgame_008,
  HeaderSkin = skin_playgame_010,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kHide",
  BackgroundColor = ARGB(0, 0, 0, 0),
  FontSize = 16
})
Style("Gui.AvatarListTreeView003")({
  ItemGap = 1,
  ItemHeight = 46,
  HeaderHeight = 32,
  TreeVisible = false,
  HeaderVisible = false,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = nil,
  ItemSkin = skin_playgame_009,
  HeaderSkin = skin_playgame_010,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kHide",
  BackgroundColor = ARGB(0, 0, 0, 0),
  FontSize = 16
})
skin_playgame_013 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_room_point_title01.tga", Vector4(0, 0, 0, 0))
})
skin_playgame_015 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG05.tga", Vector4(6, 6, 6, 6))
})
skin_playgame_016 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG04.tga", Vector4(6, 6, 6, 6))
})
skin_playgame_017 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background21.tga", Vector4(35, 35, 35, 35))
})
skin_playgame_023 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_smallmapBG01.tga", Vector4(50, 0, 50, 0))
})
skin_playgame_024 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background25.tga", Vector4(10, 0, 10, 0))
})
skin_playgame_030 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_tanchubox.tga", Vector4(35, 35, 35, 35))
})
skin_playgame_032 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background24.tga", Vector4(14, 14, 14, 14))
})
skin_playgame_033 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background23.tga", Vector4(14, 14, 14, 14))
})
skin_playgame_034 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG19.tga", Vector4(0, 0, 0, 0))
})
skin_playgame_035 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode6_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_playgame_mode6_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_playgame_mode6_hover.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode6_disabled.tga", Vector4(0, 0, 0, 0))
})
skin_playgame_036 = Gui.ButtonSkin({
  BackgroundImage = nil,
  HoverImage = nil,
  DownImage = nil,
  DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode_blank.tga", Vector4(0, 0, 0, 0))
})
skin_playgame_036 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_button04_normal.tga", Vector4(20, 18, 20, 18)),
  HoverImage = Gui.Image("ui/skinF/skin_common_button04_hover.tga", Vector4(20, 18, 20, 18)),
  DownImage = Gui.Image("ui/skinF/skin_common_button04_down.tga", Vector4(20, 18, 20, 18)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_button02_disabled_10.tga", Vector4(20, 18, 20, 18))
})
icon_playgame_001 = Gui.Icon("ui/skinF/skin_button_icon_novice.tga", Vector4(0, 0, 0, 0))
icon_playgame_002 = Gui.Icon("ui/skinF/skin_button_icon_newroom.tga", Vector4(0, 0, 0, 0))
icon_playgame_003 = Gui.Icon("ui/skinF/skin_button_icon_enter.tga", Vector4(0, 0, 0, 0))
icon_playgame_004 = Gui.Icon("ui/skinF/skin_button_icon_back.tga", Vector4(0, 0, 0, 0))
icon_playgame_005 = Gui.Icon("ui/skinF/skin_button_icon_invite.tga", Vector4(0, 0, 0, 0))
icon_playgame_006 = Gui.Icon("ui/skinF/skin_button_icon_roomsetup.tga", Vector4(0, 0, 0, 0))
icon_playgame_007 = Gui.Icon("ui/skinF/skin_button_icon_start.tga", Vector4(0, 0, 0, 0))
icon_playgame_008 = Gui.Icon("ui/skinF/skin_button_icon_notready.tga", Vector4(0, 0, 0, 0))
icon_playgame_009 = Gui.Icon("ui/skinF/skin_button_icon_ready.tga", Vector4(0, 0, 0, 0))
personalInfo_064 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background07_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_065 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background09_01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background08_01.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_068 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background02_01.tga", Vector4(20, 20, 20, 20))
})
personalInfo_083 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_01.tga", Vector4(40, 40, 40, 40))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_hover.tga", Vector4(40, 40, 40, 40))
  })
}
personalInfo_085 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background10_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_088 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_BG.tga", Vector4(10, 10, 10, 10))
})
personalInfo_089 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_090 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon02.tga", Vector4(0, 0, 0, 0))
})
personalInfo_091 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon03.tga", Vector4(0, 0, 0, 0))
})
personalInfo_092 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon04.tga", Vector4(0, 0, 0, 0))
})
personalInfo_094 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon05.tga", Vector4(0, 0, 0, 0))
})
personalInfo_095 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/lobby/humancard.tga", Vector4(0, 0, 0, 0))
})
personalInfo_097 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_tab11_normal.tga", Vector4(30, 20, 30, 20)),
  HoverImage = Gui.Image("ui/skinF/skin_tab11_hover.tga", Vector4(30, 20, 30, 20)),
  DownImage = Gui.Image("ui/skinF/skin_tab11_down.tga", Vector4(30, 20, 30, 20)),
  DisabledImage = Gui.Image("ui/skinF/skin_tab11_disabled.tga", Vector4(30, 20, 30, 20))
})
personalInfo_098 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background18.tga", Vector4(40, 40, 40, 40))
})
personalInfo_099 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background19.tga", Vector4(20, 40, 20, 28))
})
personalInfo_101 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_left_normal_01.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_pagebar_left_hover_01.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_pagebar_left_down_01.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_pagebar_left_disabled_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_102 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_right_normal_01.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_pagebar_right_hover_01.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_pagebar_right_down_01.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_pagebar_right_disabled_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_103 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_1_01.tga", Vector4(40, 40, 40, 40))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_1_hover.tga", Vector4(40, 40, 40, 40))
  })
}
personalInfo_104 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background17_01.tga", Vector4(40, 40, 40, 40))
})
personalInfo_121 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_tab01_normal.tga", Vector4(20, 0, 40, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_tab01_hover.tga", Vector4(20, 0, 40, 0)),
  DownImage = Gui.Image("ui/skinF/skin_tab01_down.tga", Vector4(20, 0, 40, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_tab01_disabled.tga", Vector4(20, 0, 40, 0))
})
personalInfo_124 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background22.tga", Vector4(35, 35, 35, 35))
})
personalInfo_128 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_line.tga", Vector4(1, 1, 1, 1))
})
personalInfo_131 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background11_01.tga", Vector4(30, 30, 30, 30))
})
personalInfo_133 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill_minus_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_skill_minus_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_skill_minus_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_skill_minus_disabled.tga", Vector4(0, 0, 0, 0))
})
personalInfo_134 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill_plus_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_skill_plus_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_skill_plus_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_skill_plus_disabled.tga", Vector4(0, 0, 0, 0))
})
personalInfo_135 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_136 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill03.tga", Vector4(0, 0, 0, 0))
})
personalInfo_137 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill02.tga", Vector4(0, 0, 0, 0))
})
personalInfo_138 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background_icon10.tga", Vector4(0, 0, 0, 0))
})
personalInfo_139 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background16_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_140 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_lock01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_lock04.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_143 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarcard.tga", Vector4(0, 0, 0, 0))
})
personalInfo_144 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarcard_top.tga", Vector4(0, 0, 0, 0))
})
personalInfo_145 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarcard_shuiying.tga", Vector4(0, 0, 0, 0))
})
personalInfo_146 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_shuxing001.tga", Vector4(70, 0, 20, 0))
})
personalInfo_147 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_shuxing02.tga", Vector4(70, 0, 20, 0))
})
personalInfo_148 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_shuxing03.tga", Vector4(70, 0, 20, 0))
})
personalInfo_149 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_shuxing04.tga", Vector4(70, 0, 20, 0))
})
personalInfo_150 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_shuxing05.tga", Vector4(70, 0, 20, 0))
})
personalInfo_171 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg01.tga", Vector4(20, 0, 20, 0))
})
personalInfo_172 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon02_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_173 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon01_light_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_174 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon04.tga", Vector4(0, 0, 0, 0))
})
personalInfo_175 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon03_light_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_176 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg02.tga", Vector4(0, 0, 0, 0))
})
personalInfo_177 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_BG02_hover_01.tga", Vector4(0, 0, 0, 0))
})
personalInfo_179 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light1.tga", Vector4(0, 0, 0, 0))
})
personalInfo_180 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light3.tga", Vector4(0, 0, 0, 0))
})
personalInfo_181 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light5.tga", Vector4(0, 0, 0, 0))
})
personalInfo_182 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light4.tga", Vector4(0, 0, 0, 0))
})
personalInfo_183 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light2.tga", Vector4(0, 0, 0, 0))
})
personalInfo_184 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_button1_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_hecheng_button1_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_hecheng_button1_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_hecheng_button1_disabled.tga", Vector4(0, 0, 0, 0))
})
personalInfo_185 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_button2_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_hecheng_button2_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_hecheng_button2_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_hecheng_button2_disabled.tga", Vector4(0, 0, 0, 0))
})
personalInfo_186 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_button3_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_hecheng_button3_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_hecheng_button3_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_hecheng_button3_disabled.tga", Vector4(0, 0, 0, 0))
})
personalInfo_200 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_buy_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_hecheng_buy_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_hecheng_buy_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_hecheng_buy_disabled.tga", Vector4(0, 0, 0, 0))
})
personalInfo_202 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_center1.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_center2.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_203 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_tabicon_wuqi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_tabicon_daoju.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_tabicon_shoushi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_tabicon_zaoxingka.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_204 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background23_02.tga", Vector4(0, 0, 0, 0))
})
personalInfo_206 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background32.tga", Vector4(35, 35, 35, 35))
})
personalInfo_207 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background31.tga", Vector4(35, 35, 35, 35))
})
personalInfo_208 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background22.tga", Vector4(35, 35, 35, 35))
})
personalInfo_209 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_success_01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_fail_01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_fail_04.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_fail_09.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_210 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background05.tga", Vector4(35, 35, 35, 35))
})
personalInfo_211 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_lajitong_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_common_lajitong_hover.tga", Vector4(20, 0, 40, 0)),
    DownImage = Gui.Image("ui/skinF/skin_common_lajitong_down.tga", Vector4(20, 0, 40, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_lajitong_disabled.tga", Vector4(20, 0, 40, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_lajitong_down.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_212 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_repair_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_common_repair_hover.tga", Vector4(20, 0, 40, 0)),
    DownImage = Gui.Image("ui/skinF/skin_common_repair_down.tga", Vector4(20, 0, 40, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_repair_disabled.tga", Vector4(20, 0, 40, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_repair_down.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_213 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_allrepair_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_allrepair_hover.tga", Vector4(20, 0, 40, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_allrepair_down.tga", Vector4(20, 0, 40, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_allrepair_disabled.tga", Vector4(20, 0, 40, 0))
})
personalInfo_214 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg08.tga", Vector4(0, 0, 0, 0))
})
personalInfo_215 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg04.tga", Vector4(14, 20, 14, 20))
})
personalInfo_217 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg05.tga", Vector4(0, 0, 0, 0))
})
personalInfo_218 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon09.tga", Vector4(0, 0, 0, 0))
})
personalInfo_219 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_02.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_03.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_04.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_05.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_06.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon10_07.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_220 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon07.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon08.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_221 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon05.tga", Vector4(0, 0, 0, 0))
})
personalInfo_222 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon06.tga", Vector4(0, 0, 0, 0))
})
personalInfo_223 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon_gate01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon_gate02.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_224 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg03.tga", Vector4(20, 20, 20, 20))
})
personalInfo_225 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_info_bg03.tga", Vector4(30, 0, 30, 0))
})
personalInfo_226 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg09.tga", Vector4(0, 0, 0, 0))
})
personalInfo_227 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_icon11.tga", Vector4(0, 0, 0, 0))
})
personalInfo_228 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_info_bg04.tga", Vector4(100, 0, 20, 0))
})
personalInfo_229 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_info_icon01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_info_icon02.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_info_icon03.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_info_icon04.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_info_icon05.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_info_icon06.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_230 = {
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_info.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_info_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_info_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {},
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_guild.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_guild_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_guild_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_shop.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_shop_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_shop_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_auction.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_auction_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_auction_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_avatar.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_avatar_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_avatar_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_enhance.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_enhance_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_enhance_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_mission.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_mission_01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_mission_light.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_tanbao.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_tanbao_01.tga", Vector4(0, 0, 0, 0))
    }),
    {}
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_lottery.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_menu_lottery_01.tga", Vector4(0, 0, 0, 0))
    }),
    {}
  }
}
personalInfo_231 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_lock05.tga", Vector4(20, 20, 20, 20))
})
personalInfo_232 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light10.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light06.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light08.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light07.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_light09.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_233 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_new.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background07_new.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_234 = {
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_common_buff_vip.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_common_buff_exp01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_common_buff_exp02.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_common_buff_gb01.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_common_buff_gb02.tga", Vector4(0, 0, 0, 0))
    })
  }
}
personalInfo_235 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg04_bar.tga", Vector4(10, 0, 10, 0))
})
personalInfo_236 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_fail_05.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_fail_07.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_fail_08.tga", Vector4(0, 0, 0, 0))
  })
}
personalInfo_237 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_hecheng_bg10.tga", Vector4(20, 20, 20, 20))
})
personalInfo_238 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_tab13_normal.tga", Vector4(30, 20, 30, 20)),
  HoverImage = Gui.Image("ui/skinF/skin_tab13_hover.tga", Vector4(30, 20, 30, 20)),
  DownImage = Gui.Image("ui/skinF/skin_tab13_down.tga", Vector4(30, 20, 30, 20)),
  DisabledImage = Gui.Image("ui/skinF/skin_tab11_disabled.tga", Vector4(30, 20, 30, 20))
})
personalInfo_quality = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_weapon_bg01.tga", Vector4(30, 30, 30, 30))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_weapon_bg02.tga", Vector4(30, 30, 30, 30))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_weapon_bg03.tga", Vector4(30, 30, 30, 30))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_weapon_bg04.tga", Vector4(30, 30, 30, 30))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_weapon_bg05.tga", Vector4(30, 30, 30, 30))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_weapon_bg06.tga", Vector4(30, 30, 30, 30))
  })
}
personalInfo_job = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_icon01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_icon02.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_icon03.tga", Vector4(0, 0, 0, 0))
  })
}
Style("LayerButton.DeleteButton")({Skin = personalInfo_200})
guild_018 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guild_BG04_04.tga", Vector4(0, 0, 0, 0))
})
guild_019 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guild_signbg.tga", Vector4(40, 40, 40, 40))
})
guild_020 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guild_list_bg_normal_online.tga", Vector4(40, 20, 40, 20)),
    HoverImage = Gui.Image("ui/skinF/skin_guild_list_bg_hover.tga", Vector4(40, 20, 40, 20)),
    DownImage = Gui.Image("ui/skinF/skin_guild_list_bg_down.tga", Vector4(40, 20, 40, 20)),
    DisabledImage = Gui.Image("ui/skinF/skin_guild_list_bg_disabled.tga", Vector4(40, 20, 40, 20))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guild_list_bg_normal_offline.tga", Vector4(40, 20, 40, 20)),
    HoverImage = Gui.Image("ui/skinF/skin_guild_list_bg_hover.tga", Vector4(40, 20, 40, 20)),
    DownImage = Gui.Image("ui/skinF/skin_guild_list_bg_down.tga", Vector4(40, 20, 40, 20)),
    DisabledImage = Gui.Image("ui/skinF/skin_guild_list_bg_disabled.tga", Vector4(40, 20, 40, 20))
  })
}
guild_021 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guild_list_bg_normal_online.tga", Vector4(40, 20, 40, 20))
})
guild_022 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_arrow_2.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_arrow.tga", Vector4(0, 0, 0, 0))
  })
}
guild_023 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_playgame_BG20_normal.tga", Vector4(4, 4, 4, 4)),
  HoverImage = Gui.Image("/ui/skinF/skin_playgame_BG20_hover.tga", Vector4(4, 4, 4, 4)),
  DownImage = Gui.Image("/ui/skinF/skin_playgame_BG20_down.tga", Vector4(4, 4, 4, 4))
})
guild_025 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guild_BG10.tga", Vector4(0, 0, 0, 0))
})
guild_026 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guild_tempicon.tga", Vector4(0, 0, 0, 0))
})
lookInfo_002 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_info_closebutton_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_info_closebutton_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_info_closebutton_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_info_closebutton_disabled.tga", Vector4(0, 0, 0, 0))
})
lookInfo_003 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_info_BG02.tga", Vector4(130, 0, 20, 0))
})
lookInfo_004 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skinF_tips01_a.tga", Vector4(6, 6, 6, 10))
})
openBox_002 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background24_01.tga", Vector4(20, 20, 20, 20))
})
openBox_004 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_baoxiang_bg01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_baoxiang_bg02.tga", Vector4(0, 0, 0, 0))
  })
}
openBox_005 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_baoxiang_icon01_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_baoxiang_icon01_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_baoxiang_icon01_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_baoxiang_icon01_disabled.tga", Vector4(0, 0, 0, 0))
})
gainGoods_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background27.tga", Vector4(360, 0, 360, 0))
})
game_loading_001 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_loading.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_loadingbg.tga", Vector4(0, 0, 0, 0))
  })
}
lockDraw_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_BG01.tga", Vector4(0, 0, 0, 0))
})
lockDraw_002 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_baoshi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_cailiao.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_chibang.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_huifu.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_jiezhi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_jinbi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_weizhi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_wuqi.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/choujiang_zaoxingka.tga", Vector4(0, 0, 0, 0))
  })
}
lockDraw_003 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_touxiang02.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_touxiang01.tga", Vector4(0, 0, 0, 0))
  })
}
lockDraw_004 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_button_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_choujiang_button_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_choujiang_button_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_choujiang_button_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_button_stop_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_choujiang_button_stop_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_choujiang_button_stop_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_choujiang_button_stop_disabled.tga", Vector4(0, 0, 0, 0))
  })
}
lockDraw_005 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_01.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_02.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_03.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_04.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_05.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_06.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_07.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_08.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_09.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_00.tga", Vector4(0, 0, 0, 0))
  })
}
lockDraw_006 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_choujiang_chakan_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_choujiang_chakan_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_choujiang_chakan_down.tga", Vector4(0, 0, 0, 0))
})
balance_018 = {
  {
    Gui.ButtonSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_redBG02.tga", Vector4(10, 10, 10, 10))
    }),
    Gui.ButtonSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_redBG02_mine.tga", Vector4(10, 10, 10, 10))
    })
  },
  {
    Gui.ButtonSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_blueBG02.tga", Vector4(10, 10, 10, 10))
    }),
    Gui.ButtonSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_blueBG02_mine.tga", Vector4(10, 10, 10, 10))
    })
  }
}
balance_022 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG11.tga", Vector4(30, 30, 30, 30))
})
balance_023 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_team1.tga", Vector4(92, 10, 10, 10))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_team2.tga", Vector4(92, 10, 10, 10))
  })
}
balance_024 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_teamwin.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_teamlose.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_teamdraw.tga", Vector4(0, 0, 0, 0))
  })
}
balance_025 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_jiesuan_shengli.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_jiesuan_shibai.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_jiesuan_pingju.tga", Vector4(0, 0, 0, 0))
  })
}
balance_027 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG12.tga", Vector4(30, 30, 30, 30))
})
balance_028 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_line.tga", Vector4(1, 1, 1, 1))
})
balance_029 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG14.tga", Vector4(30, 30, 30, 30))
})
balance_030 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG15.tga", Vector4(30, 30, 30, 30))
})
balance_031 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG17.tga", Vector4(30, 15, 30, 15))
})
balance_032 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG16.tga", Vector4(30, 15, 30, 15))
})
balance_033 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_BG02.tga", Vector4(30, 25, 30, 25))
})
balance_034 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_icon03.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_icon04.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_icon05.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_icon06.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_icon07.tga", Vector4(0, 0, 0, 0))
  })
}
balance_035 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_BG05.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/ingameF/skin_assignment_BG06.tga", Vector4(0, 0, 0, 0))
  })
}
balance_037 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_card_1star.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_card_2star.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_card_3star.tga", Vector4(0, 0, 0, 0))
  })
}
balance_038 = {
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_normal_disabled.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_normal_normal.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_MVP_disabled.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_MVP_normal.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_VIP_disabled.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_VIP_normal.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_NET_disabled.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_NET_normal.tga", Vector4(0, 0, 0, 0))
    })
  },
  {
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_ACT_disabled.tga", Vector4(0, 0, 0, 0))
    }),
    Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon_ACT_normal.tga", Vector4(0, 0, 0, 0))
    })
  }
}
balance_039 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_cardget.tga", Vector4(0, 0, 0, 0))
})
balance_040 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_MVP_BG.tga", Vector4(220, 0, 30, 0))
})
balance_041 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_MVP.tga", Vector4(0, 0, 0, 0))
})
balance_042 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_card2.tga", Vector4(0, 0, 0, 0))
})
balance_043 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_assignment_BG02.tga", Vector4(0, 0, 0, 0))
})
balance_044 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_card_star.tga", Vector4(0, 0, 0, 0))
})
balance_045 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_icon_easy.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_icon_normal.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_icon_hard.tga", Vector4(0, 0, 0, 0))
  })
}
balance_046 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/l.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/e.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/v.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/u.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/p.tga", Vector4(0, 0, 0, 0))
  })
}
balance_047 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_expmax.tga", Vector4(0, 0, 0, 0))
})
balance_048 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_bg18.tga", Vector4(0, 0, 0, 0))
})
Style("OpenTreasure.Self")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG05.tga", Vector4(0, 0, 0, 0))
  })
})
Style("OpenTreasure.Hook")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon05.tga", Vector4(0, 0, 0, 0))
  })
})
Style("OpenTreasure.BarDown")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG06.tga", Vector4(20, 0, 20, 0))
  })
})
Style("OpenTreasure.BarUp")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_BG06_row.tga", Vector4(20, 0, 20, 0))
  })
})
Style("OpenTreasure.Cancel")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_jiesuan_icon01_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_jiesuan_icon01_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_jiesuan_icon01_down.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_jiesuan_icon01_disabled.tga", Vector4(0, 0, 0, 0))
  })
})
fresh_005 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guide_arrow_down.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guide_arrow_up.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guide_arrow_left.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_guide_arrow_right.tga", Vector4(0, 0, 0, 0))
  })
}
fresh_006 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guide_bg01.tga", Vector4(18, 18, 18, 18))
})
fresh_007 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guide_bg02.tga", Vector4(20, 20, 20, 20))
})
fresh_008 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill_minus_normal.tga", Vector4(0, 0, 0, 0))
})
fresh_009 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_skill_plus_normal.tga", Vector4(0, 0, 0, 0))
})
newLead_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_guide_light.tga", Vector4(25, 25, 25, 25))
})
levelUpTipShow_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background34.tga", Vector4(80, 40, 80, 160))
})
levelUpTipShow_002 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background35.tga", Vector4(20, 20, 20, 20))
})
levelUpTipShow_003 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_mission_bg11.tga", Vector4(10, 10, 10, 10))
})
levelUpTipShow_004 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_new_mission.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_new_menu.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_new_map.tga", Vector4(0, 0, 0, 0))
  })
}
levelUpTipShow_005 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background36.tga", Vector4(10, 10, 10, 10))
})
battle_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG11.tga", Vector4(0, 0, 0, 0))
})
battle_002 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG15.tga", Vector4(20, 35, 20, 35))
})
battle_004 = {
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode1_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_playgame_mode1_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_playgame_mode1_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode1_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode2_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_playgame_mode2_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_playgame_mode2_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode2_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode3_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_playgame_mode3_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_playgame_mode3_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode3_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode4_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_playgame_mode4_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_playgame_mode4_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode4_disabled.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode5_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_playgame_mode5_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_playgame_mode5_hover.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_playgame_mode5_disabled.tga", Vector4(0, 0, 0, 0))
  })
}
battle_005 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG13.tga", Vector4(30, 30, 30, 30))
})
battle_011 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode1_hover.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode2_hover.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode3_hover.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode4_hover.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode5_hover.tga", Vector4(0, 0, 0, 0))
  })
}
battle_012 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG18.tga", Vector4(20, 16, 20, 16))
})
battle_013 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG17.tga", Vector4(7, 7, 7, 7))
})
battle_014 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_countdown_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_playgame_countdown_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_playgame_countdown_normal.tga", Vector4(0, 0, 0, 0))
})
battle_015 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_exit_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_playgame_exit_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_playgame_exit_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_playgame_exit_disabled.tga", Vector4(0, 0, 0, 0))
})
battle_016 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/baoxiang_tong.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/baoxiang_yin.tga", Vector4(0, 0, 0, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/lobby/baoxiang_jin.tga", Vector4(0, 0, 0, 0))
  })
}
battle_017 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_bg23.tga", Vector4(0, 0, 0, 0))
})
battle_018 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_bg21.tga", Vector4(40, 160, 40, 40))
})
battle_019 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_mode_tab.tga", Vector4(0, 0, 0, 0))
})
signPresent_001 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_sign_bg01.tga", Vector4(0, 0, 0, 0))
})
signPresent_002 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_button_sign.tga", Vector4(0, 0, 0, 0))
})
signPresent_003 = Gui.ProportionIcon("/ui/skinF/skin_sign_exp_bg.tga", "/ui/skinF/skin_sign_exp.tga", Vector4(0, 0, 0, 0), Vector4(0, 0, 0, 0))
signPresent_004 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_sign_bg04.tga", Vector4(48, 0, 12, 0))
})
signPresent_005 = {
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_sign_icon03.tga", Vector4(48, 0, 12, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_sign_icon01.tga", Vector4(48, 0, 12, 0))
  }),
  Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_sign_icon02.tga", Vector4(48, 0, 12, 0))
  })
}
signPresent_006 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_sign_bg02.tga", Vector4(48, 0, 12, 0))
})
signPresent_007 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_sign_bg03.tga", Vector4(48, 0, 12, 0))
})
Style("Gui.ModalWindow")({
  Skin = skin_playgame_017,
  Padding = Vector4(8, 8, 10, 10)
})
Style("MessageBoxStyle.Text")({
  Dock = "kDockFill",
  TextAlign = "kAlignCenterMiddle",
  BackgroundColor = ARGB(255, 255, 255, 255),
  Skin = SkinF.battle_005,
  TextColor = ARGB(255, 82, 54, 44),
  FontSize = 20,
  Margin = Vector4(8, 0, 8, 0),
  AutoWrap = true
})
Style("MessageBoxStyle.Button")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(10, 10, 10, 13)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(10, 10, 10, 13)),
    DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(10, 10, 10, 13)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(10, 10, 10, 13))
  }),
  FontSize = 16,
  TextColor = ARGB(255, 255, 255, 255),
  DisabledTextColor = ARGB(255, 192, 192, 192),
  BackgroundColor = ARGB(255, 255, 255, 255),
  Size = Vector2(100, 40)
})
page_001 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_left_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_pagebar_left_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_pagebar_left_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_pagebar_left_disabled.tga", Vector4(0, 0, 0, 0))
})
page_002 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_right_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_pagebar_right_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_pagebar_right_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_pagebar_right_disabled.tga", Vector4(0, 0, 0, 0))
})
page_003 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_BG.tga", Vector4(10, 10, 10, 10))
})
Style("NewPageBar.Label")({Skin = page_003})
Style("NewPageBar.LeftBtn")({Skin = page_001})
Style("NewPageBar.RightBtn")({Skin = page_002})
Style("NewPagesBar.LeftBtn")({Skin = page_001})
Style("NewPagesBar.RightBtn")({Skin = page_002})
Style("NewPagesBar.IndexBtn")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(12, 12, 12, 12)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(12, 12, 12, 12)),
    DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(12, 12, 12, 12)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(12, 12, 12, 12))
  }),
  FontSize = 16
})
Style("TabControl_01")({
  Skin = Gui.TabControlSkin({
    CtrlImage = Gui.Image("ui/skinF/skin_common_background18.tga", Vector4(40, 40, 40, 40)),
    NormalImage = Gui.Image("ui/skinF/skin_tab11_normal.tga", Vector4(30, 20, 30, 20)),
    HoverImage = Gui.Image("ui/skinF/skin_tab11_hover.tga", Vector4(30, 20, 30, 20)),
    DownImage = Gui.Image("ui/skinF/skin_tab11_down.tga", Vector4(30, 20, 30, 20)),
    DisabledImage = Gui.Image("ui/skinF/skin_tab11_disabled.tga", Vector4(30, 20, 30, 20))
  }),
  ItemSize = Vector2(124, 42),
  ItemSpace = 4,
  ItemPadding = Vector4(21, 0, 0, 0),
  CtrlPadding = Vector4(0, 40, 0, 0),
  FontSize = 16,
  TextColor = white,
  TextShadowColor = ARGB(255, 82, 54, 44),
  HighlightTextColor = ARGB(0, 0, 0, 0),
  TextShadow = true
})
Style("TabControl_02")({
  Skin = Gui.TabControlSkin({
    NormalImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(8, 8, 8, 8)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(8, 8, 8, 8)),
    DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(8, 8, 8, 8)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(8, 8, 8, 8))
  }),
  ItemPadding = Vector4(14, 0, 0, 0),
  ItemSize = Vector2(144, 40),
  ItemSpace = 2,
  FontSize = 16,
  TextColor = white,
  HighlightTextColor = white,
  TextShadow = true
})
Style("BuyBox_01")({
  Skin = Gui.BuyBoxSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_shop_BG03.tga", Vector4(40, 40, 40, 40)),
    AvatarImage = Gui.Image("ui/skinF/skin_avatarcard.tga", Vector4(8, 8, 8, 8)),
    PriceBgImage = Gui.Image("/ui/skinF/skin_shop_BG04.tga", Vector4(10, 0, 10, 0)),
    NAImage = Gui.Image("/ui/skinF/skin_common_background06_lock04.tga", Vector4(0, 0, 0, 0))
  })
})
Style("ExchangeBox_01")({
  Skin = Gui.ExchangeBoxSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_background33.tga", Vector4(40, 40, 40, 40)),
    NAImage = Gui.Image("/ui/skinF/skin_common_background06_lock04.tga", Vector4(0, 0, 0, 0)),
    IconBgImage = Gui.Image("/ui/skinF/skin_shop_BG05.tga", Vector4(20, 20, 20, 20)),
    PriceBgImage = Gui.Image("/ui/skinF/skin_shop_BG04.tga", Vector4(10, 0, 10, 0))
  })
})
Style("ButtonShopTabExchange")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_tab12_normal.tga", Vector4(30, 20, 30, 20)),
    HoverImage = Gui.Image("ui/skinF/skin_tab12_hover.tga", Vector4(30, 20, 30, 20)),
    DownImage = Gui.Image("ui/skinF/skin_tab12_down.tga", Vector4(30, 20, 30, 20)),
    DisabledImage = Gui.Image("ui/skinF/skin_tab12_disabled.tga", Vector4(30, 20, 30, 20))
  }),
  TextColor = white,
  HighlightTextColor = ARGB(0, 0, 0, 0),
  TextShadowColor = ARGB(255, 82, 54, 44),
  FontSize = 16
})
Style("ButtonShopBuy")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button2_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button2_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button2_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button2_disabled.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = white,
  HighlightTextColor = white,
  DisabledTextColor = ARGB(255, 255, 239, 123),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
Style("ButtonShopPresent")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = white,
  HighlightTextColor = white,
  DisabledTextColor = ARGB(255, 255, 239, 123),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
Style("ButtonShopCart")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = white,
  HighlightTextColor = white,
  DisabledTextColor = ARGB(255, 255, 239, 123),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
Style("ButtonShopExchange")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button3_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button3_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button3_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = white,
  HighlightTextColor = white,
  DisabledTextColor = ARGB(255, 255, 239, 123),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
Style("ButtonShopBuyAll")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button03_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button03_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button03_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button02_disabled_10.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = white,
  HighlightTextColor = ARGB(255, 255, 239, 123),
  DisabledTextColor = ARGB(255, 255, 239, 123),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
Style("ButtonShopPresentAll")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button02_normal_10.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button02_hover_10.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button02_down_10.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button02_disabled_10.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = white,
  HighlightTextColor = ARGB(255, 255, 239, 123),
  DisabledTextColor = ARGB(255, 255, 239, 123),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
setting_01 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_avatarroom_BG06.tga", Vector4(20, 18, 20, 18))
})
setting_03 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_playgame_BG13.tga", Vector4(20, 20, 20, 20))
})
Style("ButtonShopPrepaid")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_button4_normal.tga", Vector4(20, 18, 20, 18)),
    HoverImage = Gui.Image("ui/skinF/skin_common_button4_hover.tga", Vector4(20, 18, 20, 18)),
    DownImage = Gui.Image("ui/skinF/skin_common_button4_down.tga", Vector4(20, 18, 20, 18)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(20, 18, 20, 18))
  }),
  TextColor = ARGB(255, 255, 239, 123),
  HighlightTextColor = ARGB(255, 255, 239, 123),
  DisabledTextColor = ARGB(255, 192, 192, 192),
  TextShadowColor = ARGB(150, 0, 0, 0),
  FontSize = 16
})
shop_01 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background02_01.tga", Vector4(5, 5, 5, 5))
})
shop_02 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_jinbi.tga", Vector4(0, 0, 0, 0))
})
shop_03 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background33.tga", Vector4(40, 40, 40, 40))
})
shop_04 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_shop_BG05.tga", Vector4(20, 20, 20, 20))
})
shop_06 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_shop_zengsong.tga", Vector4(5, 5, 5, 5))
})
shop_10 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_xingbi.tga", Vector4(5, 5, 5, 5))
})
shop_12 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_shop_BG11.tga", Vector4(10, 10, 10, 10))
})
shop_16 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_shop_BG12.tga", Vector4(10, 10, 10, 10))
})
shop_17 = Gui.Icon("ui/skinF/skin_button_icon_buyall.tga", Vector4(0, 0, 0, 0))
shop_18 = Gui.Icon("ui/skinF/skin_button_icon_sendall.tga", Vector4(0, 0, 0, 0))
shop_19 = Gui.Image("/ui/skinF/skin_shop_preview.tga", Vector4(0, 0, 0, 0))
shop_20 = Gui.Image("/ui/skinF/skin_shop_preview2.tga", Vector4(0, 0, 0, 0))
shop_feature = {
  Gui.Image("ui/skinF/skin_shop_new.tga", Vector4(0, 0, 0, 0)),
  Gui.Image("ui/skinF/skin_shop_hot.tga", Vector4(0, 0, 0, 0)),
  nil,
  Gui.Image("ui/skinF/skin_shop_discount.tga", Vector4(0, 0, 0, 0))
}
Style("Gui.Pager")({
  Skin = Gui.ControlSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_BG.tga", Vector4(0, 0, 0, 0))
  }),
  FontSize = 16,
  TextColor = white
})
Style("Gui.PagerUp")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_left_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_common_pagebar_left_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_common_pagebar_left_down.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_pagebar_left_disabled.tga", Vector4(0, 0, 0, 0))
  })
})
Style("Gui.PagerDown")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_common_pagebar_right_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_common_pagebar_right_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_common_pagebar_right_down.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_pagebar_right_disabled.tga", Vector4(0, 0, 0, 0))
  })
})
Style("Gui.AuctionItem")({
  Skin = Gui.AuctionItemSkin({
    NormalImage = Gui.Image("ui/skinF/skin_avatarroom_BG04.tga", Vector4(10, 10, 10, 10)),
    DownImage = Gui.Image("ui/skinF/skin_avatarroom_BG05.tga", Vector4(10, 10, 10, 10)),
    IconImage = Gui.Image("ui/skinF/skin_common_background06_01.tga", Vector4(8, 8, 8, 8)),
    CountImage = Gui.Image("ui/skinF/skin_common_item_number.tga", Vector4(0, 0, 0, 0))
  })
})
Style("Gui.AuctionHeader")({
  Skin = Gui.AuctionHeaderSkin({
    ItemNormalImage = Gui.Image("ui/skinF/skin_playgame_BG20_normal.tga", Vector4(10, 10, 10, 10)),
    ItemHoverImage = Gui.Image("ui/skinF/skin_playgame_BG20_hover.tga", Vector4(10, 10, 10, 10)),
    ItemDownImage = Gui.Image("ui/skinF/skin_playgame_BG20_down.tga", Vector4(10, 10, 10, 10)),
    SortUpImage = Gui.Image("ui/skinF/skin_playgame_arrow_2.tga", Vector4(10, 10, 10, 10)),
    SortDownImage = Gui.Image("ui/skinF/skin_playgame_arrow.tga", Vector4(10, 10, 10, 10))
  })
})
auction_01 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_shop_BG01.tga", Vector4(10, 40, 10, 10))
})
auction_02 = Gui.ListTreeViewSkin({
  UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_up_normal.tga", Vector4(0, 0, 0, 0)),
  UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_up_hover.tga", Vector4(0, 0, 0, 0)),
  UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_up_down.tga", Vector4(0, 0, 0, 0)),
  UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_up__disabled.tga", Vector4(0, 0, 0, 0)),
  DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_down_normal.tga", Vector4(0, 0, 0, 0)),
  DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_down_hover.tga", Vector4(0, 0, 0, 0)),
  DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_down_down.tga", Vector4(0, 0, 0, 0)),
  DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
  VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_normal.tga", Vector4(5, 11, 5, 11)),
  VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_hover.tga", Vector4(5, 11, 5, 11)),
  VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_down.tga", Vector4(5, 11, 5, 11)),
  VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar_button_normal.tga", Vector4(5, 11, 5, 11)),
  VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar_BG.tga", Vector4(5, 34, 5, 34)),
  CollapsedImage = Gui.Image("ui/skinF/skin_filtrate_plusbutton_normal.tga", Vector4(0, 0, 0, 0)),
  ExpandedImage = Gui.Image("ui/skinF/skin_filtrate_decreasebutton_normal.tga", Vector4(0, 0, 0, 0))
})
auction_03 = Gui.ListItemSkin({
  SelectedImage = Gui.Image("/ui/skinF/skin_common_row2.tga", Vector4(12, 12, 12, 12))
})
auction_05 = Gui.ProportionIcon("/ui/skinF/skin_info_BG01.tga", "/ui/skinF/skin_info_low.tga", Vector4(30, 10, 30, 10), Vector4(0, 0, 0, 0))
auction_06 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_common_line.tga", Vector4(0, 0, 0, 0))
})
auction_07 = Gui.CartBoxSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background06_01.tga", Vector4(8, 8, 8, 8)),
  CountImage = Gui.Image("ui/skinF/skin_common_item_number.tga", Vector4(0, 0, 0, 0))
})
Style("AuctionListTreeView")({
  Skin = auction_02,
  ItemSkin = auction_03,
  ItemHeight = 30,
  ItemGap = 0,
  HeaderVisible = false,
  TreeVisible = true,
  FontSize = 16,
  BackgroundColor = ARGB(255, 255, 255, 255),
  AutoScroll = true,
  AutoSize = true
})
Style("Gui.ButtonCancel")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_shop_closebutton_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_shop_closebutton_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_shop_closebutton_down.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = Gui.Image("ui/skinF/skin_shop_closebutton_disabled.tga", Vector4(0, 0, 0, 0))
  })
})
mission_01 = Gui.Icon("ui/skinF/skin_common_new.tga", Vector4(0, 0, 0, 0))
mission_02 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_line.tga", Vector4(0, 0, 0, 0))
})
mission_03 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg12.tga", Vector4(0, 220, 0, 10))
})
mission_04 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg13.tga", Vector4(0, 0, 0, 0))
})
mission_10 = Gui.ListTreeViewSkin({
  UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
  UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
  UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
  UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
  DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
  DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
  DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
  DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
  VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(6, 6, 6, 6)),
  VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(6, 6, 6, 6)),
  VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(6, 6, 6, 6)),
  VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(6, 6, 6, 6)),
  VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(0, 0, 0, 0)),
  CollapsedImage = Gui.Image("ui/skinF/skin_filtrate_plusbutton_normal.tga", Vector4(0, 0, 0, 0)),
  ExpandedImage = Gui.Image("ui/skinF/skin_filtrate_decreasebutton_normal.tga", Vector4(0, 0, 0, 0))
})
mission_11 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg05_normal.tga", Vector4(60, 0, 20, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mission_bg05_normal.tga", Vector4(60, 0, 20, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_mission_bg05_hover.tga", Vector4(60, 0, 20, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mission_bg05_down.tga", Vector4(60, 0, 20, 0)),
  DisabledImage = Gui.Image("/ui/skinF/skin_mission_bg05_disabled.tga", Vector4(60, 0, 20, 0))
})
mission_13 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg01.tga", Vector4(10, 10, 10, 10))
})
mission_14 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg06_normal.tga", Vector4(12, 12, 12, 12)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mission_bg06_normal.tga", Vector4(12, 12, 12, 12)),
  HoverImage = Gui.Image("/ui/skinF/skin_mission_bg06_hover.tga", Vector4(12, 12, 12, 12)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mission_bg06_down.tga", Vector4(12, 12, 12, 12)),
  DisabledImage = Gui.Image("/ui/skinF/skin_mission_bg06_disabled.tga", Vector4(12, 12, 12, 12))
})
mission_15 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg02_normal.tga", Vector4(36, 0, 80, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mission_bg02_normal.tga", Vector4(36, 0, 80, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_mission_bg02_hover.tga", Vector4(36, 0, 80, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mission_bg02_down.tga", Vector4(36, 0, 80, 0)),
  DisabledImage = Gui.Image("/ui/skinF/skin_mission_bg02_disabled.tga", Vector4(36, 0, 80, 0))
})
mission_16 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg03_normal.tga", Vector4(36, 0, 80, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mission_bg03_normal.tga", Vector4(36, 0, 80, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_mission_bg03_hover.tga", Vector4(36, 0, 80, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mission_bg03_down.tga", Vector4(36, 0, 80, 0)),
  DisabledImage = Gui.Image("/ui/skinF/skin_mission_bg03_disabled.tga", Vector4(36, 0, 80, 0))
})
mission_17 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mission_bg04_normal.tga", Vector4(36, 0, 80, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mission_bg04_normal.tga", Vector4(36, 0, 80, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_mission_bg04_hover.tga", Vector4(36, 0, 80, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mission_bg04_down.tga", Vector4(36, 0, 80, 0)),
  DisabledImage = Gui.Image("/ui/skinF/skin_mission_bg04_disabled.tga", Vector4(36, 0, 80, 0))
})
mission_18 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/ingameF/skin_assignment_BG03.tga", Vector4(0, 0, 0, 0))
})
mission_19 = Gui.CartBoxSkin({
  BackgroundImage = nil,
  CountImage = Gui.Image("ui/skinF/skin_common_item_number.tga", Vector4(0, 0, 0, 0))
})
mission_21 = Gui.Icon("ui/skinF/skin_assignment_icon01.tga", Vector4(0, 0, 0, 0))
mission_22 = Gui.Icon("ui/skinF/skin_assignment_icon02.tga", Vector4(0, 0, 0, 0))
mission_23 = Gui.Icon("ui/skinF/skin_assignment_icon08.tga", Vector4(0, 0, 0, 0))
mission_24 = Gui.Icon("ui/skinF/skin_mission_icon_normal02.tga", Vector4(0, 0, 0, 0))
mission_25 = Gui.Icon("ui/skinF/skin_mission_icon_elite02.tga", Vector4(0, 0, 0, 0))
mission_26 = Gui.Icon("ui/skinF/skin_mission_icon_hero02.tga", Vector4(0, 0, 0, 0))
mission_27 = Gui.Icon("ui/skinF/skin_mission_icon_normal.tga", Vector4(0, 0, 0, 0))
mission_28 = Gui.Icon("ui/skinF/skin_mission_icon_elite.tga", Vector4(0, 0, 0, 0))
mission_29 = Gui.Icon("ui/skinF/skin_mission_icon_hero.tga", Vector4(0, 0, 0, 0))
mission_30 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/SkinF/skin_mission_bg14.tga", Vector4(0, 0, 0, 0))
})
mission_31 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/SkinF/skin_mission_bg15.tga", Vector4(0, 90, 0, 20))
})
mission_32 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/SkinF/skin_mission_bg10.tga", Vector4(0, 77, 0, 65))
})
mission_33 = Gui.ControlSkin({
  BackgroundImage = Gui.Image("/ui/SkinF/skin_mission_bg11.tga", Vector4(0, 0, 0, 0))
})
Style("MissionListTreeView_01")({
  Skin = mission_10,
  ItemSkin = mission_11,
  ItemGap = 0,
  ItemHeight = 30,
  HeaderVisible = false,
  TreeVisible = true,
  AlwaysSelect = false,
  DrawItemBgWhenEmpty = false,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kVisible",
  BackgroundColor = ARGB(255, 255, 255, 255),
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22
})
Style("MissionListTreeView_02")({
  Skin = mission_10,
  ItemSkin = mission_14,
  ItemGap = 0,
  ItemHeight = 30,
  HeaderHeight = 35,
  HeaderVisible = false,
  TreeVisible = false,
  AlwaysSelect = false,
  DrawItemBgWhenEmpty = false,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kHide",
  BackgroundColor = ARGB(255, 255, 255, 255),
  FontSize = 16
})
sociality_button_001 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_minimize_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_minimize_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_minimize_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_common_minimize_disabled.tga", Vector4(0, 0, 0, 0))
})
sociality_button_003 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_gam_setbutton_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_gam_setbutton_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_gam_setbutton_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_gam_setbutton_disabled.tga", Vector4(0, 0, 0, 0))
})
sociality_button_009 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_common_background09_normal.tga", Vector4(35, 0, 35, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_common_background09_hover.tga", Vector4(35, 0, 35, 0)),
  DownImage = Gui.Image("ui/skinF/skin_common_background09_down.tga", Vector4(35, 0, 35, 0)),
  DisabledImage = nil
})
sociality_item_001 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mail_BG03_normal.tga", Vector4(16, 16, 16, 16)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mail_BG03_normal.tga", Vector4(16, 16, 16, 16)),
  HoverImage = Gui.Image("/ui/skinF/skin_mail_BG03_hover.tga", Vector4(16, 16, 16, 16)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mail_BG03_down.tga", Vector4(16, 16, 16, 16))
})
sociality_item_002 = Gui.ListItemSkin({
  BackgroundImage = nil,
  BackgroundImageOp = nil,
  HoverImage = nil,
  SelectedImage = Gui.Image("/ui/skinF/skin_common_row2.tga", Vector4(12, 12, 12, 12)),
  DisabledImage = nil,
  FrameImage = nil,
  CheckOnIcon = nil,
  CheckOffIcon = nil
})
sociality_item_003 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mail_BG03_normal.tga", Vector4(16, 0, 16, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mail_BG03_normal.tga", Vector4(16, 0, 16, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_mail_BG03_hover.tga", Vector4(16, 0, 16, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mail_BG03_down.tga", Vector4(16, 0, 16, 0))
})
sociality_item_004 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_common_background09_normal.tga", Vector4(32, 0, 16, 0)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_common_background09_normal.tga", Vector4(32, 0, 16, 0)),
  HoverImage = Gui.Image("/ui/skinF/skin_common_background09_hover.tga", Vector4(32, 0, 16, 0)),
  SelectedImage = Gui.Image("/ui/skinF/skin_common_background09_down.tga", Vector4(32, 0, 16, 0))
})
sociality_scrollview_001 = Gui.ScrollableControlSkin({
  UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
  UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
  UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
  UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
  DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
  DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
  DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
  DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
  VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(6, 6, 6, 6)),
  VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(6, 6, 6, 6)),
  VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(6, 6, 6, 6)),
  VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(6, 6, 6, 6)),
  VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(6, 6, 6, 6)),
  BarCornerImage = nil
})
sociality_text_002 = Gui.TextboxSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_textbar01_disabled.tga", Vector4(6, 6, 6, 6)),
  ActiveImage = Gui.Image("/ui/skinF/skin_textbar01_disabled.tga", Vector4(6, 6, 6, 6)),
  DisabledImage = Gui.Image("/ui/skinF/skin_textbar01_disabled.tga", Vector4(6, 6, 6, 6))
})
Style("Sociality.TitleBtn")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_friend_list_normal.tga", Vector4(13, 13, 8, 8)),
    HoverImage = Gui.Image("ui/skinF/skin_friend_list_hover.tga", Vector4(13, 13, 8, 8)),
    DownImage = Gui.Image("ui/skinF/skin_friend_list_down.tga", Vector4(13, 13, 8, 8)),
    DisabledImage = Gui.Image("ui/skinF/skin_common_button_disabled.tga", Vector4(13, 13, 8, 8))
  }),
  FontSize = 16,
  TextColor = ARGB(255, 255, 255, 255),
  HighlightTextColor = ARGB(255, 62, 26, 1),
  DisabledTextColor = ARGB(255, 62, 26, 1),
  TextShadowColor = ARGB(0, 255, 249, 242),
  TextShadowWhenNormal = false,
  BackgroundColor = ARGB(255, 255, 255, 255)
})
Style("Sociality.CloseBtn")({
  Skin = Gui.ButtonSkin({
    BackgroundImage = Gui.Image("ui/skinF/skin_shop_closebutton_normal.tga", Vector4(0, 0, 0, 0)),
    HoverImage = Gui.Image("ui/skinF/skin_shop_closebutton_hover.tga", Vector4(0, 0, 0, 0)),
    DownImage = Gui.Image("ui/skinF/skin_shop_closebutton_down.tga", Vector4(0, 0, 0, 0)),
    DisabledImage = nil
  })
})
Style("Sociality.ChannelList")({
  ItemGap = 3,
  ItemHeight = 58,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = sociality_scrollview_001,
  ItemSkin = sociality_item_001,
  HeaderVisible = false,
  TreeVisible = false,
  BackgroundColor = ARGB(255, 255, 255, 255),
  AutoScroll = true,
  VScrollBarDisplay = "kAuto",
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22
})
Style("Sociality.ChannelList2")({
  ItemGap = 3,
  ItemHeight = 32,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = sociality_scrollview_001,
  ItemSkin = sociality_item_003,
  HeaderVisible = false,
  TreeVisible = false,
  BackgroundColor = ARGB(255, 255, 255, 255),
  AutoScroll = false,
  VScrollBarDisplay = "kAuto",
  FontSize = 16
})
Style("Sociality.FriendsList")({
  ItemGap = 0,
  ItemHeight = 25,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = sociality_scrollview_001,
  ItemSkin = sociality_item_002,
  HeaderVisible = false,
  TreeVisible = false,
  BackgroundColor = ARGB(255, 255, 255, 255),
  VScrollBarDisplay = "kVisible",
  HScrollBarDisplay = "kHide",
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22
})
Style("Sociality.UnReadList")({
  ItemGap = 0,
  ItemHeight = 34,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = sociality_scrollview_001,
  ItemSkin = sociality_item_004,
  HeaderVisible = false,
  TreeVisible = false,
  BackgroundColor = ARGB(255, 255, 255, 255),
  AutoScroll = true,
  VScrollBarDisplay = "kVisible",
  HScrollBarDisplay = "kHide",
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22
})
Style("Sociality.MessagePanel")({
  BackgroundColor = ARGB(255, 255, 255, 255),
  Skin = SkinF.personalInfo_068,
  ScrollBarSkin = SkinF.sociality_scrollview_001,
  Margin = Vector4(0, 0, 0, 4),
  Padding = Vector4(6, 6, 6, 6),
  FontSize = 16,
  ScrollBarWidth = 22,
  ScrollBarButtonSize = 22
})
Style("LobbyBattleGame.MessagePanel")({
  ScrollBarSkin = SkinF.sociality_scrollview_001,
  Margin = Vector4(0, 0, 0, 4),
  Padding = Vector4(8, 6, 6, 6),
  FontSize = 16,
  ScrollBarWidth = 22,
  ScrollBarButtonSize = 22
})
Style("LobbyBattleGame.tip_panel")({
  ScrollBarSkin = SkinF.sociality_scrollview_001,
  FontSize = 16,
  MaxTextWidth = 280,
  LineGap = 10,
  VScrollBarDisplay = false
})
mail_button_004 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_mail_newinfo_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_mail_newinfo_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_mail_newinfo_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_mail_newinfo_disabled.tga", Vector4(0, 0, 0, 0))
})
mail_button_006 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_mail_addressee_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_mail_addressee_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_mail_addressee_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_mail_addressee_disabled.tga", Vector4(0, 0, 0, 0))
})
mail_button_007 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_mail_getset_normal.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_mail_getset_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_mail_getset_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_mail_getset_disabled.tga", Vector4(0, 0, 0, 0))
})
mail_button_008 = Gui.ButtonSkin({
  BackgroundImage = Gui.Image("ui/skinF/skin_mail_newinfo_full.tga", Vector4(0, 0, 0, 0)),
  HoverImage = Gui.Image("ui/skinF/skin_mail_newinfo_hover.tga", Vector4(0, 0, 0, 0)),
  DownImage = Gui.Image("ui/skinF/skin_mail_newinfo_down.tga", Vector4(0, 0, 0, 0)),
  DisabledImage = Gui.Image("ui/skinF/skin_mail_newinfo_disabled.tga", Vector4(0, 0, 0, 0))
})
mail_textarea_001 = Gui.ScrollableControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06.tga", Vector4(6, 6, 6, 6)),
  ActiveBgImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06_down.tga", Vector4(6, 6, 6, 6)),
  UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
  UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
  UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
  UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
  DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
  DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
  DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
  DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
  VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(6, 6, 6, 6)),
  VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(6, 6, 6, 6)),
  VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(6, 6, 6, 6)),
  VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(6, 6, 6, 6)),
  VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(6, 6, 6, 6))
})
mail_textarea_001_readonly = Gui.ScrollableControlSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06.tga", Vector4(6, 6, 6, 6)),
  ActiveBgImage = Gui.Image("/ui/skinF/skin_avatarroom_BG06.tga", Vector4(6, 6, 6, 6)),
  UpButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_normal.tga", Vector4(0, 0, 0, 0)),
  UpButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_hover.tga", Vector4(0, 0, 0, 0)),
  UpButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_down.tga", Vector4(0, 0, 0, 0)),
  UpButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_up_disabled.tga", Vector4(0, 0, 0, 0)),
  DownButtonNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_normal.tga", Vector4(0, 0, 0, 0)),
  DownButtonHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_hover.tga", Vector4(0, 0, 0, 0)),
  DownButtonDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_down.tga", Vector4(0, 0, 0, 0)),
  DownButtonDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down_disabled.tga", Vector4(0, 0, 0, 0)),
  VSliderNormalImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_normal.tga", Vector4(6, 6, 6, 6)),
  VSliderHoverImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_hover.tga", Vector4(6, 6, 6, 6)),
  VSliderDownImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_down.tga", Vector4(6, 6, 6, 6)),
  VSliderDisabledImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_button_disabled.tga", Vector4(6, 6, 6, 6)),
  VBarBackgroundImage = Gui.Image("ui/skinF/skin_gam_scrollbar2_BG.tga", Vector4(6, 6, 6, 6))
})
mail_item_001 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_mail_letter_normal.tga", Vector4(16, 16, 16, 16)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_mail_letter_normal.tga", Vector4(16, 16, 16, 16)),
  HoverImage = Gui.Image("/ui/skinF/skin_mail_letter_hover.tga", Vector4(16, 16, 16, 16)),
  SelectedImage = Gui.Image("/ui/skinF/skin_mail_letter_down.tga", Vector4(16, 16, 16, 16)),
  CheckOnIcon = Gui.Icon("ui/skinF/skin_login_checkbox_on_normal.tga", Vector4(0, 0, 0, 0)),
  CheckOffIcon = Gui.Icon("ui/skinF/skin_login_checkbox_off_normal.tga", Vector4(0, 0, 0, 0))
})
friend_item_001 = Gui.ListItemSkin({
  BackgroundImage = Gui.Image("/ui/skinF/skin_guild_list_bg_normal.tga", Vector4(16, 16, 16, 16)),
  BackgroundImageOp = Gui.Image("/ui/skinF/skin_guild_list_bg_normal.tga", Vector4(16, 16, 16, 16)),
  HoverImage = Gui.Image("/ui/skinF/skin_guild_list_bg_hover.tga", Vector4(16, 16, 16, 16)),
  SelectedImage = Gui.Image("/ui/skinF/skin_guild_list_bg_down.tga", Vector4(16, 16, 16, 16)),
  CheckOnIcon = Gui.Icon("ui/skinF/skin_login_checkbox_on_normal.tga", Vector4(0, 0, 0, 0)),
  CheckOffIcon = Gui.Icon("ui/skinF/skin_login_checkbox_off_normal.tga", Vector4(0, 0, 0, 0))
})
Style("Mail.List")({
  ItemGap = 2,
  ItemHeight = 60,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = sociality_scrollview_001,
  ItemSkin = mail_item_001,
  HeaderVisible = false,
  TreeVisible = false,
  BackgroundColor = ARGB(255, 255, 255, 255),
  AutoScroll = true,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kVisible",
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22,
  CheckIndex = 0
})
Style("Friend.List")({
  ItemGap = 2,
  ItemHeight = 38,
  AlwaysSelect = true,
  DrawItemBgWhenEmpty = false,
  Skin = sociality_scrollview_001,
  ItemSkin = friend_item_001,
  HeaderVisible = false,
  TreeVisible = false,
  BackgroundColor = ARGB(255, 255, 255, 255),
  AutoScroll = true,
  HScrollBarDisplay = "kHide",
  VScrollBarDisplay = "kVisible",
  FontSize = 16,
  VScrollBarWidth = 22,
  VScrollBarButtonSize = 22,
  CheckIndex = 0
})
Style("Mail.TextArea")({
  Skin = mail_textarea_001,
  FontSize = 16,
  TextColor = ARGB(255, 52, 112, 153),
  SelectionColor = ARGB(255, 255, 255, 255),
  SelectionColor = ARGB(255, 128, 0, 0),
  SelectionBgColor = ARGB(255, 255, 255, 128),
  TextPadding = Vector4(6, 4, 6, 4),
  Fold = true
})
