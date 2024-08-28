module("PassWordBox", package.seeall)
msgBox = nil
local room_info, STATE, entranceFlag, Hide

function Hide(which)
  if which then
    which.root.Parent = nil
  end
end

function Show(root, state_arg, room_info_arg, entrance)
  entranceFlag = entrance
  STATE = state_arg
  room_info = room_info_arg
  if msgBox == nil then
    local page = {
      Gui.Control("root")({
        Dock = "kDockCenter",
        Size = Vector2(554, 268),
        Padding = Vector4(10, 10, 10, 0),
        BackgroundColor = ARGB(255, 255, 255, 255),
        Skin = SkinF.skin_002,
        Padding = Vector4(52, 39, 52, 39),
        Gui.FlowLayout("txt_area")({
          Size = Vector2(0, 50),
          Dock = "kDockTop",
          Align = "kAlignCenterMiddle",
          ControlAlign = "kAlignCenterMiddle",
          ControlSpace = 6,
          Gui.Label("lb")({
            AutoSize = true,
            FontSize = 20,
            TextColor = ARGB(255, 126, 119, 108),
            Text = "\199\235\202\228\200\235\183\191\188\228\195\220\194\235"
          })
        }),
        Gui.FlowLayout("txt_pw")({
          Size = Vector2(0, 50),
          Dock = "kDockTop",
          Align = "kAlignCenterMiddle",
          ControlAlign = "kAlignCenterMiddle",
          ControlSpace = 6,
          Gui.Textbox("tb")({
            Size = Vector2(150, 40),
            MaxLength = 16,
            TextPassword = true,
            Text = "",
            FontSize = 20
          })
        }),
        Gui.FlowLayout("button_area")({
          Size = Vector2(0, 60),
          Dock = "kDockBottom",
          Align = "kAlignCenterMiddle",
          ControlAlign = "kAlignBottomMiddle",
          ControlSpace = 3,
          Gui.Button("btn_yes")({
            Style = "Gui.Button",
            Text = "\200\183 \182\168",
            Size = Vector2(120, 44),
            Margin = Vector4(15, 0, 15, 0)
          }),
          Gui.Button("btn_no")({
            Style = "Gui.Button",
            Text = "\200\161 \207\251",
            Size = Vector2(120, 44),
            Margin = Vector4(15, 0, 15, 0)
          })
        })
      })
    }
    modal_window = ModalWindow.Show("transparent")
    msgBox = Gui.Create(modal_window.root)(page)
    msgBox.tb.Text = ""
    local funcConfirm = function(sender, e)
      if entranceFlag == 2 then
        if STATE then
          STATE.AutoPassword = msgBox.tb.Text
          STATE:ContinueAutoEnterRoom()
        else
          print("WTF?: No state lobby during auto changing")
        end
      else
        local pwd = msgBox.tb.Text
        if STATE and STATE.AmILeader then
          STATE:TeamEnterRoom(room_info.id, pwd)
        else
          STATE:EnterRoom(room_info.id, pwd)
        end
      end
      msgBox.root.Parent = nil
      ModalWindow.Close()
    end
    msgBox.btn_yes.EventClick = funcConfirm
    msgBox.tb.EventValueEnter = funcConfirm
    
    function msgBox.btn_no.EventClick(sender, e)
      if entranceFlag == 2 then
        if STATE then
          STATE:CancelAutoChange()
        else
          print("WTF?: No state lobby during auto changing")
        end
      end
      msgBox.root.Parent = nil
      ModalWindow.Close()
    end
    
    msgBox.tb.Focused = true
    return
  end
  modalWin = ModalWindow.Show("transparent")
  msgBox.root.Parent = modalWin.root
  msgBox.tb.Text = ""
  msgBox.tb.Focused = true
end
