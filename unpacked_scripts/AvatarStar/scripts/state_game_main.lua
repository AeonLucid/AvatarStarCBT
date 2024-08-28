local state = ptr_cast(game.CurrentState, "Client.StateMainGame")
Gui.Clear(gui)
if not state then
  return
end
if ComFuc.partc1 then
  ComFuc.partc1:SetEnable(false)
end
local esc_ctrl_size = Vector2(251, 317)
local escWindow
local escMenu = Gui.Create()({
  Gui.Control("content")({
    Size = esc_ctrl_size,
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.personalInfo_207,
    Gui.Label({
      Size = Vector2(0, 30),
      Dock = "kDockTop",
      TextPadding = Vector4(15, 0, 0, 0),
      FontSize = 16,
      Text = GetUTF8Text("button_common_Setting"),
      Gui.Button({
        Size = Vector2(24, 24),
        Margin = Vector4(0, 3, 8, 4),
        Dock = "kDockRight",
        Skin = SkinF.lookInfo_002,
        EventClick = function(sender, e)
          if escWindow and escWindow.screen then
            escWindow.screen.Visible = not escWindow.screen.Visible
            state.EscHasFocus = escWindow.screen.Visible
          end
        end
      })
    }),
    Gui.Control("content_area")({
      Location = Vector2(14, 45),
      Size = Vector2(223, 252),
      BackgroundColor = ARGB(255, 255, 255, 255),
      Skin = SkinF.setting_03,
      ComFuc.ComButton("graphic", GetUTF8Text("button_common_Video"), Vector2(193, 37), Vector2(16, 15), 18, false, true),
      ComFuc.ComButton("audio", GetUTF8Text("button_common_Sound"), Vector2(193, 37), Vector2(16, 56), 18, false, true),
      ComFuc.ComButton("action", GetUTF8Text("button_common_Hotkey"), Vector2(193, 37), Vector2(16, 97), 18, false, true),
      ComFuc.ComButton("quit_combat", GetUTF8Text("button_inGame_additional_string_161"), Vector2(193, 37), Vector2(16, 138), 18, false, true),
      ComFuc.ComButton("quit_novice", GetUTF8Text("button_common_Completed_Beginners_Stage"), Vector2(193, 37), Vector2(16, 138), 18, false, true),
      ComFuc.ComButton("cancel", GetUTF8Text("button_common_Back_to_Game"), Vector2(193, 37), Vector2(16, 199), 18, false, true)
    })
  })
})

function InitEscMenu()
  escWindow = ModalWindow.GetNew("transparent")
  escWindow.screen.AllowEscToExit = false
  escWindow.screen.Visible = false
  escWindow.screen.EventEscPressed = SwitchEscMenu
  gui.Focused = true
  escWindow.root.Size = esc_ctrl_size
  escMenu.content.Parent = escWindow.root
  
  function escMenu.cancel.EventClick()
    escWindow.screen.Visible = false
    gui.Focused = true
    state.EscHasFocus = false
  end
  
  function escMenu.graphic.EventClick()
    escWindow.screen.Visible = false
    local settingWin = Setting.Show("graphic")
    
    function settingWin.root.EventClose()
      state.EscHasFocus = false
    end
  end
  
  function escMenu.audio.EventClick()
    escWindow.screen.Visible = false
    local settingWin = Setting.Show("audio")
    
    function settingWin.root.EventClose()
      state.EscHasFocus = false
    end
  end
  
  function escMenu.action.EventClick()
    escWindow.screen.Visible = false
    local settingWin = Setting.Show("action")
    
    function settingWin.root.EventClose()
      state.EscHasFocus = false
    end
  end
  
  function escMenu.quit_combat.EventClick()
    local msgstr
    if state:GetMatching() then
      msgstr = GetUTF8Text("msgbox_inGame_additional_string_160")
    else
      msgstr = GetUTF8Text("msgbox_battlefield_free_combat_msgbox")
    end
    MessageBox.ShowWithConfirmCancel(msgstr, function(sender, e)
      escWindow.screen.Visible = false
      gui.Focused = true
      state.EscHasFocus = false
      MessageBox.ShowWaiter(GetUTF8Text("msgbox_inGame_additional_string_162"))
      state:Quit()
    end, nil)
  end
  
  function escMenu.quit_novice.EventClick()
    local msgstr = GetUTF8Text("msgbox_inGame_additional_string_163")
    MessageBox.ShowWithConfirmCancel(msgstr, function(sender, e)
      SwitchEscMenu()
      state:FinishNovice()
    end, nil)
  end
end

function DestroyEscMenu()
  escMenu.cancel.EventClick = nil
  escMenu.graphic.EventClick = nil
  escMenu.audio.EventClick = nil
  escMenu.action.EventClick = nil
  escMenu.quit_combat.EventClick = nil
  escMenu.content.Parent = nil
  escWindow.screen.EventEscPressed = nil
  escWindow.Close()
  escWindow = nil
end

function SwitchEscMenu()
  if escWindow and escWindow.screen then
    escWindow.screen.Visible = not escWindow.screen.Visible
    if escWindow.screen.Visible then
      if state:IsNovice() then
        escMenu.action.Enable = false
        escMenu.quit_novice.Visible = true
        escMenu.quit_combat.Visible = false
      else
        escMenu.action.Enable = true
        escMenu.quit_novice.Visible = false
        escMenu.quit_combat.Visible = true
      end
    end
    state.EscHasFocus = escWindow.screen.Visible
  end
end

function gui.EventSizeChanged(sender, e)
  ComFuc.locationChanged = (sender.Size.x - 1200) / 2
end

function state.EventLeave()
  MessageBox.CloseWaiter()
  gui.EventSizeChanged = nil
  gui.EventEscPressed = nil
  DestroyEscMenu()
  state.EventLeave = nil
  state.EventServerCmd = nil
  state = nil
  Setting.Hide()
  ModalWindow.CloseAll()
  if ComFuc.isFromNew ~= 1 then
    ComFuc.isInGame = true
  end
end

function state.EventPrtScn(sender, e)
  MessageBox.ShowError(string.format(GetUTF8Text("UI_inGame_additional_string_126"), ptr_cast(e).Details))
end

InitEscMenu()
gui.EventEscPressed = SwitchEscMenu
state.EventServerCmd = PushCmd.OnServerCmd
NewLead.ui.Anti_addiction.MissTime = 0
NewLead.ui.Anti_addiction.Parent = nil
ComFuc.isFromGame = true
