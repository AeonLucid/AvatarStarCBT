Gui.Clear(gui)
local width = 430
local sl_ui = {}
local tb_ui = {}
local sl_func = {}
local tb_func = {}
local shadow_dir = Vector3(-1, 2, 1)
local intensity = Vector4(0, 2, 1, 0)
local sun_direction = Vector3(0, 0, 0.3)
local lp1 = Vector4(0, 0, 0, 0)
local lp2 = Vector4(1.4, 1.4, 1, 0)
local lp3 = Vector4(-1.4, -1.4, -1, 0)
local lp4 = Vector4(-2, 1.4, 0.5, 0)
local lc1 = Vector4(0, 0, 0, 0)
local lc2 = Vector4(0.4, 0.2, 0, 1.2)
local lc3 = Vector4(0.5, 0, 0.5, 0.2)
local lc4 = Vector4(0.1, 0, 0.1, 0.5)
local main_tab, add_pad = Gui.Create({
  Gui.Tabpad("tab")({
    Location = Vector2(750, 0),
    Size = Vector2(width, 650),
    TabSize = Vector2(88, 22),
    BackgroundColor = ARGB(111, 111, 111, 111),
    Gui.FlowLayout("shadow")({
      Text = "\211\176\215\211",
      Size = Vector2(width, 450),
      Gui.Button({
        Size = Vector2(150, 30),
        Text = "\183\181\187\216\180\243\204\252",
        EventClick = function(s, e)
          local state = ptr_cast(game.CurrentState, "Client.StateAvatar")
          if state then
            state:ReturnToLobby()
          end
        end
      })
    }),
    Gui.FlowLayout("sun_light")({
      Text = "\189\199\201\171\181\196\198\189\208\208\185\226",
      Size = Vector2(width, 400)
    }),
    Gui.FlowLayout("light_pos")({
      Text = "\181\227\185\226\212\180\206\187\214\195",
      Size = Vector2(width, 500)
    }),
    Gui.FlowLayout("light_color")({
      Text = "\181\227\185\226\212\180\209\213\201\171",
      Size = Vector2(width, 500)
    })
  })
}), {
  Gui.Tabpad("tab")({
    Location = Vector2(750, 0),
    Size = Vector2(width, 650),
    TabSize = Vector2(88, 22),
    BackgroundColor = ARGB(111, 111, 111, 111),
    Gui.FlowLayout("shadow")({
      Text = "\211\176\215\211",
      Size = Vector2(width, 450),
      Gui.Button({
        Size = Vector2(150, 30),
        Text = "\183\181\187\216\180\243\204\252",
        EventClick = function(s, e)
          local state = ptr_cast(game.CurrentState, "Client.StateAvatar")
          if state then
            state:ReturnToLobby()
          end
        end
      })
    }),
    Gui.FlowLayout("sun_light")({
      Text = "\189\199\201\171\181\196\198\189\208\208\185\226",
      Size = Vector2(width, 400)
    }),
    Gui.FlowLayout("light_pos")({
      Text = "\181\227\185\226\212\180\206\187\214\195",
      Size = Vector2(width, 500)
    }),
    Gui.FlowLayout("light_color")({
      Text = "\181\227\185\226\212\180\209\213\201\171",
      Size = Vector2(width, 500)
    })
  })
}

function add_pad(p, height, texxx)
  Gui.Label({
    Size = Vector2(width, height),
    Text = texxx,
    TextColor = ARGB(255, 0, 255, 0)
  })(p, nil)
end

local add_sl = function(p, min, max, curr, tex)
  local ctrl = Gui.Control({
    BackgroundColor = ARGB(111, 111, 111, 111),
    Size = Vector2(width, 30),
    Gui.Label({
      Size = Vector2(20, 30),
      Text = min
    }),
    Gui.Label({
      Location = Vector2(200, 0),
      Size = Vector2(130, 30),
      Text = max .. "    " .. tex .. ":"
    })
  })(p, nil)
  local sl = Gui.Slider({
    Location = Vector2(20, 0),
    Size = Vector2(180, 30),
    MinValue = min,
    MaxValue = max
  })(ctrl, sl_ui)
  Gui.Textbox({
    Location = Vector2(330, 0),
    Size = Vector2(100, 30),
    SelectionColor = ARGB(255, 255, 0, 0),
    Text = string.format("%g", curr)
  })(ctrl, tb_ui)
end
local ui_desc = {
  {
    -3,
    3,
    -1,
    "x"
  },
  {
    0,
    3,
    2,
    "y"
  },
  {
    -3,
    3,
    1,
    "z"
  },
  {
    0,
    15,
    5,
    "\210\245\211\176\190\224\192\235"
  },
  {
    0,
    2,
    0,
    "x:\187\183\190\179\185\226\199\191\182\200"
  },
  {
    0,
    4,
    2,
    "y:lightMap\199\191\182\200"
  },
  {
    0,
    4,
    1,
    "z:\198\189\208\208\185\226\199\191\182\200"
  },
  {
    0,
    4,
    0,
    "w:(\206\180\211\195\181\189)"
  },
  {
    -3,
    3,
    0,
    "\198\189\208\208\185\226x"
  },
  {
    -3,
    3,
    0,
    "\198\189\208\208\185\226y"
  },
  {
    -3,
    3,
    0.3,
    "\198\189\208\208\185\226z"
  },
  {
    -5,
    5,
    0,
    "p1.x"
  },
  {
    -5,
    5,
    0,
    "p1.y"
  },
  {
    -5,
    5,
    0,
    "p1.z"
  },
  {
    0,
    2,
    0,
    "p1.\203\165\188\245"
  },
  {
    -5,
    5,
    1.4,
    "p2.x"
  },
  {
    -5,
    5,
    1.4,
    "p2.y"
  },
  {
    -5,
    5,
    1,
    "p2.z"
  },
  {
    0,
    2,
    0,
    "p2.\203\165\188\245"
  },
  {
    -5,
    5,
    -1.4,
    "p3.x"
  },
  {
    -5,
    5,
    -1.4,
    "p3.y"
  },
  {
    -5,
    5,
    -1,
    "p3.z"
  },
  {
    0,
    2,
    0,
    "p3.\203\165\188\245"
  },
  {
    -5,
    5,
    -2,
    "p4.x"
  },
  {
    -5,
    5,
    1.4,
    "p4.y"
  },
  {
    -5,
    5,
    0.5,
    "p4.z"
  },
  {
    0,
    2,
    0,
    "p4.\203\165\188\245"
  },
  {
    0,
    1,
    0,
    "c1.r"
  },
  {
    0,
    1,
    0,
    "c1.g"
  },
  {
    0,
    1,
    0,
    "c1.b"
  },
  {
    0,
    2,
    0,
    "c1\199\191\182\200"
  },
  {
    0,
    1,
    0.4,
    "c2.r"
  },
  {
    0,
    1,
    0.2,
    "c2.g"
  },
  {
    0,
    1,
    0,
    "c2.b"
  },
  {
    0,
    2,
    1.2,
    "c2\199\191\182\200"
  },
  {
    0,
    1,
    0.5,
    "c3.r"
  },
  {
    0,
    1,
    0,
    "c3.g"
  },
  {
    0,
    1,
    0.5,
    "c3.b"
  },
  {
    0,
    2,
    0.2,
    "c3\199\191\182\200"
  },
  {
    0,
    1,
    0.1,
    "c4.r"
  },
  {
    0,
    1,
    0,
    "c4.g"
  },
  {
    0,
    1,
    0.1,
    "c4.b"
  },
  {
    0,
    2,
    0.5,
    "c4\199\191\182\200"
  }
}
add_pad(main_tab.shadow, 30, "ag:SetShadowDirection(x,y,z)")
for i = 1, 3 do
  add_sl(main_tab.shadow, ui_desc[i][1], ui_desc[i][2], ui_desc[i][3], ui_desc[i][4])
end
add_pad(main_tab.shadow, 30, "ag:SetShadowDistance(dis)")
add_sl(main_tab.shadow, ui_desc[4][1], ui_desc[4][2], ui_desc[4][3], ui_desc[4][4])
add_pad(main_tab.sun_light, 30, "ag:SetIntensity(Vector4(x,y,z,w))")
for i = 5, 8 do
  add_sl(main_tab.sun_light, ui_desc[i][1], ui_desc[i][2], ui_desc[i][3], ui_desc[i][4])
end
add_pad(main_tab.sun_light, 30, "ag:SetSunDirection(Vector3(x,y,z))")
for i = 9, 11 do
  add_sl(main_tab.sun_light, ui_desc[i][1], ui_desc[i][2], ui_desc[i][3], ui_desc[i][4])
end
add_pad(main_tab.light_pos, 30, "ag:Set4PointLightPos(p1,p2,p3,p4)")
for i = 12, 27 do
  if i % 4 == 0 then
    add_pad(main_tab.light_pos, 30, "position" .. i / 4 - 2)
  end
  add_sl(main_tab.light_pos, ui_desc[i][1], ui_desc[i][2], ui_desc[i][3], ui_desc[i][4])
end
add_pad(main_tab.light_color, 30, "ag:Set4PointLightColor(c1,c2,c3,c4)")
for i = 28, 43 do
  if i % 4 == 0 then
    add_pad(main_tab.light_color, 30, "color" .. i / 4 - 6)
  end
  add_sl(main_tab.light_color, ui_desc[i][1], ui_desc[i][2], ui_desc[i][3], ui_desc[i][4])
end
sl_func[1] = function(val)
  shadow_dir.x = val
  ag:SetShadowDirection(shadow_dir.x, shadow_dir.y, shadow_dir.z)
end
sl_func[2] = function(val)
  shadow_dir.y = val
  ag:SetShadowDirection(shadow_dir.x, shadow_dir.y, shadow_dir.z)
end
sl_func[3] = function(val)
  shadow_dir.z = val
  ag:SetShadowDirection(shadow_dir.x, shadow_dir.y, shadow_dir.z)
end
sl_func[4] = function(val)
  ag:SetShadowDistance(val)
end
sl_func[5] = function(val)
  intensity.x = val
  ag:SetIntensity(intensity)
end
sl_func[6] = function(val)
  intensity.y = val
  ag:SetIntensity(intensity)
end
sl_func[7] = function(val)
  intensity.z = val
  ag:SetIntensity(intensity)
end
sl_func[8] = function(val)
  intensity.w = val
  ag:SetIntensity(intensity)
end
sl_func[9] = function(val)
  sun_direction.x = val
  ag:SetSunDirection(sun_direction)
end
sl_func[10] = function(val)
  sun_direction.y = val
  ag:SetSunDirection(sun_direction)
end
sl_func[11] = function(val)
  sun_direction.z = val
  ag:SetSunDirection(sun_direction)
end
sl_func[12] = function(val)
  lp1.x = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[13] = function(val)
  lp1.y = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[14] = function(val)
  lp1.z = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[15] = function(val)
  lp1.w = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[16] = function(val)
  lp2.x = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[17] = function(val)
  lp2.y = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[18] = function(val)
  lp2.z = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[19] = function(val)
  lp2.w = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[20] = function(val)
  lp3.x = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[21] = function(val)
  lp3.y = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[22] = function(val)
  lp3.z = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[23] = function(val)
  lp3.w = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[24] = function(val)
  lp4.x = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[25] = function(val)
  lp4.y = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[26] = function(val)
  lp4.z = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[27] = function(val)
  lp4.w = val
  ag:Set4PointLightPos(lp1, lp2, lp3, lp4)
end
sl_func[28] = function(val)
  lc1.x = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[29] = function(val)
  lc1.y = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[30] = function(val)
  lc1.z = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[31] = function(val)
  lc1.w = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[32] = function(val)
  lc2.x = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[33] = function(val)
  lc2.y = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[34] = function(val)
  lc2.z = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[35] = function(val)
  lc2.w = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[36] = function(val)
  lc3.x = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[37] = function(val)
  lc3.y = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[38] = function(val)
  lc3.z = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[39] = function(val)
  lc3.w = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[40] = function(val)
  lc4.x = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[41] = function(val)
  lc4.y = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[42] = function(val)
  lc4.z = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
sl_func[43] = function(val)
  lc4.w = val
  ag:Set4PointLightColor(lc1, lc2, lc3, lc4)
end
for i, v in ipairs(sl_ui) do
  sl_ui[i].EventValueChange = function(sender, e)
    sl_func[i](sender.CurValue)
    tb_ui[i].Text = string.format("%g", sender.CurValue)
  end
  sl_ui[i].CurValue = ui_desc[i][3]
  tb_ui[i].EventValueEnter = function(sender, e)
    sl_ui[i].CurValue = tonumber(sender.Text)
  end
end
