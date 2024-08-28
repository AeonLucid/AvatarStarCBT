module("InputBox", package.seeall)
local ui_input_box = Gui.Create()({
  Gui.Control("root")({
    Dock = "kDockCenter",
    Size = Vector2(372, 264),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    Padding = Vector4(4, 4, 4, 14),
    Gui.Label("title_lbl")({
      Dock = "kDockTop",
      Margin = Vector4(16, 0, 0, 0),
      Size = Vector2(0, 25),
      BackgroundColor = ARGB(0, 255, 0, 0),
      Text = GetUTF8Text("UI_social_Search_Player"),
      TextColor = ARGB(255, 255, 255, 255),
      TextAlign = "kAlignLeftMiddle",
      FontSize = 18,
      Gui.Button("close_btn")({
        Dock = "kDockRight",
        Margin = Vector4(0, 0, 8, 0),
        Size = Vector2(24, 0),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.lookInfo_002
      })
    }),
    Gui.Control({
      Dock = "kDockBottom",
      Size = Vector2(0, 40),
      BackgroundColor = ARGB(0, 0, 0, 0),
      Gui.Control({
        Dock = "kDockRight",
        BackgroundColor = ARGB(0, 255, 0, 0),
        Size = Vector2(208, 40),
        Margin = Vector4(0, 0, 8, 0),
        Gui.Button("cancel_btn")({
          Dock = "kDockRight",
          Size = Vector2(84, 40),
          Text = GetUTF8Text("button_common_Cancel"),
          BackgroundColor = ARGB(255, 255, 255, 255),
          FontSize = 16
        }),
        Gui.Button("ok_btn")({
          Margin = Vector4(0, 0, 8, 0),
          Dock = "kDockRight",
          Size = Vector2(84, 40),
          Text = GetUTF8Text("button_common_OK"),
          BackgroundColor = ARGB(255, 255, 255, 255),
          FontSize = 16
        })
      })
    }),
    Gui.Control({
      Dock = "kDockFill",
      Margin = Vector4(6, 10, 6, 6),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.battle_005,
      Gui.Label("input_lbl")({
        Location = Vector2(22, 28),
        Size = Vector2(199, 19),
        Text = GetUTF8Text("UI_social_Enter_Players_Nickname"),
        TextColor = ARGB(255, 62, 26, 1),
        TextAlign = "kAlignLeftMiddle",
        FontSize = 16
      }),
      Gui.Textbox("input_tb")({
        Location = Vector2(22, 55),
        Size = Vector2(298, 34),
        Text = "",
        TextColor = ARGB(255, 255, 255, 255),
        FontSize = 16
      })
    })
  })
})

function Show(title_name, input_label, OnOkFunc)
  if title_name then
    ui_input_box.title_lbl.Text = title_name
  end
  if input_label then
    ui_input_box.input_lbl.Text = input_label
  end
  ui_input_box.input_tb.Text = ""
  
  function ui_input_box.close_btn.EventClick()
    Hide()
  end
  
  function ui_input_box.cancel_btn.EventClick()
    Hide()
  end
  
  function ui_input_box.ok_btn.EventClick()
    Hide()
    if OnOkFunc then
      OnOkFunc(ui_input_box.input_tb.Text)
    end
  end
  
  function ui_input_box.input_tb.EventValueEnter()
    Hide()
    if OnOkFunc then
      OnOkFunc(ui_input_box.input_tb.Text)
    end
  end
  
  modalWin = ModalWindow.Show("transparent")
  ui_input_box.root.Parent = modalWin.root
  ui_input_box.input_tb.Focused = true
end

function Hide()
  ui_input_box.root.Parent = nil
  ModalWindow.Close()
end
