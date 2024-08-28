module("Login", package.seeall)
ESCPressed = nil
local connectingMB
local error_message_translate = {
  connect_failed = GetUTF8Text("msgbox_common_num_1300"),
  login_failed = GetUTF8Text("msgbox_common_num_1388"),
  disconnected = GetUTF8Text("msgbox_common_num_1367"),
  login_from_otherip = GetUTF8Text("msgbox_common_num_1299"),
  server_shutdown = GetUTF8Text("msgbox_common_num_1393")
}
local ui = Gui.Create()({
  Gui.Control("login_root_p")({
    Size = Vector2(1600, 1200),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = Gui.ControlSkin({
      BackgroundImage = Gui.Image("ui/SkinF/levellogin/bg_lay_0.dds", Vector4(0, 0, 0, 0))
    })
  }),
  Gui.Control("login_root")({
    Size = Vector2(1200, 900),
    ComFuc.ComLabel(nil, string.format(GetUTF8Text("UI_common_Version"), game.version), Vector2(300, 50), Vector2(24, 840), 0, 16, ARGB(255, 255, 255, 255), "kAlignRightMiddle", nil),
    ComFuc.ComControl(nil, Vector2(541, 230), Vector2(330, 212), 255, SkinF.skin_login_001),
    ComFuc.ComControl(nil, Vector2(76, 23), Vector2(562, 500), 255, SkinF.skin_login_002),
    ComFuc.ComControl(nil, Vector2(76, 23), Vector2(562, 576), 255, SkinF.skin_login_003),
    ComFuc.ComTextBox("player", config.PlayerName, Vector2(258, 30), Vector2(472, 532)),
    ComFuc.ComTextBox("password", nil, Vector2(258, 30), Vector2(472, 608)),
    ComFuc.ComButton("btn_login", GetUTF8Text("button_common_Login"), Vector2(260, 66), Vector2(470, 650), nil, false, true, SkinF.select_character_029)
  })
})
ui.password.TextPassword = true

function ShowLoginWindow()
  rpc.clear()
  local state = ptr_cast(game.CurrentState, "Client.StateLogin")
  if not state then
    return
  end
  ui.login_root_p.Parent = gui
  ui.login_root.Parent = gui
  ui.login_root.Visible = true
  ui.player.Focused = true
  if LobbyBattleGame then
    LobbyBattleGame.Reset(true)
  end
  if ChatBar then
    ChatBar.CloseAllChatPaire()
  end
end

function ShowErrorMessage()
  if connectingMB then
    connectingMB.Close()
    connectingMB = nil
  end
  local msg = game.ErrorMessage
  game.ErrorMessage = ""
  if string.sub(msg, 1, 5) == "auth:" then
    MessageBox.Show(GetUTF8Text("msgbox_common_num_1350"), GetUTF8Text("button_common_OK"), function()
      ShowLoginWindow()
    end)
  else
    msg = error_message_translate[msg] or msg
    if msg ~= "" then
      MessageBox.Show(msg, GetUTF8Text("button_common_OK"), function()
        ShowLoginWindow()
      end)
    end
  end
end

function OnLogin()
  ui.login_root.Visible = false
  connectingMB = MessageBox.Show(GetUTF8Text("msgbox_social_additional_string_159"), GetUTF8Text("button_common_Cancel"), function()
    game:LogoutAccount()
    ShowLoginWindow()
    connectingMB = nil
  end)
end

function OnLoginSuccess()
  if connectingMB then
    connectingMB.Close()
    connectingMB = nil
  end
end

function OnDisconnected()
  ModalWindow.Close()
  ShowErrorMessage()
end

function ui.player.EventValueEnter(sender, e)
  config.PlayerName = ui.player.Text
  ptr_cast(game.CurrentState):Login(ui.player.Text, "")
end

function ui.btn_login.EventClick(sender, e)
  config.PlayerName = ui.player.Text
  ptr_cast(game.CurrentState):Login(ui.player.Text, "")
end

function AlignUI()
  Gui.Align(ui.login_root, 0.5, 0.5)
  Gui.Align(ui.login_root_p, 0.5, 0.5)
end

function Show()
  local state = ptr_cast(game.CurrentState, "Client.StateLogin")
  if not state then
    return
  end
  if game.ErrorMessage ~= "" then
    ShowErrorMessage()
  else
    ShowLoginWindow()
  end
  rpc.clear()
  if NewLead then
    NewLead.HideLead()
  end
  ui.login_root_p.Parent = gui
  ui.login_root.Parent = gui
  if state then
    state.EventLogin = OnLogin
    state.EventLoginSuccess = OnLoginSuccess
    state.EventDisconnected = OnDisconnected
  end
  AlignUI()
end

function Hide()
  ui.login_root_p.Parent = nil
  ui.login_root.Parent = nil
  local state = ptr_cast(game.CurrentState, "Client.StateLogin")
  if state then
    state.EventLogin = nil
    state.EventLoginSuccess = nil
    state.EventDisconnected = nil
  end
end
