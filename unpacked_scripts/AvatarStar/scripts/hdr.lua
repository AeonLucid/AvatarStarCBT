Gui.Clear(gui)
local main_tab = Gui.Create({
  Gui.Tabpad("tab")({
    Location = Vector2(0, 0),
    Size = Vector2(450, 500),
    TabSize = Vector2(88, 22),
    BackgroundColor = ARGB(111, 111, 111, 111),
    Gui.FlowLayout("hdr")({
      Text = "hdr",
      Size = Vector2(450, 650)
    }),
    Gui.FlowLayout("shadow")({
      Text = "shadow dir",
      Size = Vector2(450, 500)
    }),
    Gui.FlowLayout("CA")({
      Text = "color adjust",
      Size = Vector2(450, 500)
    })
  })
})
local sl_ui = {}
local tb_ui = {}
local btn_ui = {}
local func_list = {}
local btn_func_list = {}
local level_sld
local w0 = 25
local w1 = 200
local w2 = 120
local w3 = 100
local x0 = 0
local x1 = x0 + w0
local x2 = x1 + w1
local x3 = x2 + w2
local width, add_pad = x3 + w3 + 10, Gui.Tabpad("tab")({
  Location = Vector2(0, 0),
  Size = Vector2(450, 500),
  TabSize = Vector2(88, 22),
  BackgroundColor = ARGB(111, 111, 111, 111),
  Gui.FlowLayout("hdr")({
    Text = "hdr",
    Size = Vector2(450, 650)
  }),
  Gui.FlowLayout("shadow")({
    Text = "shadow dir",
    Size = Vector2(450, 500)
  }),
  Gui.FlowLayout("CA")({
    Text = "color adjust",
    Size = Vector2(450, 500)
  })
})
local add_pad, add_button = function(p, height, texxx)
  Gui.Control({
    Size = Vector2(width, height),
    Text = texxx
  })(p, nil)
end, Gui.Tabpad("tab")({
  Location = Vector2(0, 0),
  Size = Vector2(450, 500),
  TabSize = Vector2(88, 22),
  BackgroundColor = ARGB(111, 111, 111, 111),
  Gui.FlowLayout("hdr")({
    Text = "hdr",
    Size = Vector2(450, 650)
  }),
  Gui.FlowLayout("shadow")({
    Text = "shadow dir",
    Size = Vector2(450, 500)
  }),
  Gui.FlowLayout("CA")({
    Text = "color adjust",
    Size = Vector2(450, 500)
  })
})
local add_button, add_slider = function(p, texxx, x)
  Gui.Button({
    Size = Vector2(100, 50),
    Text = texxx,
    Location = Vector2(x, 0)
  })(p, btn_ui)
end, Gui.Tabpad("tab")({
  Location = Vector2(0, 0),
  Size = Vector2(450, 500),
  TabSize = Vector2(88, 22),
  BackgroundColor = ARGB(111, 111, 111, 111),
  Gui.FlowLayout("hdr")({
    Text = "hdr",
    Size = Vector2(450, 650)
  }),
  Gui.FlowLayout("shadow")({
    Text = "shadow dir",
    Size = Vector2(450, 500)
  }),
  Gui.FlowLayout("CA")({
    Text = "color adjust",
    Size = Vector2(450, 500)
  })
})

function add_slider(p, min, max, cur, desc)
  local ctrl = Gui.Control({
    BackgroundColor = ARGB(111, 111, 111, 111),
    Size = Vector2(width, 30),
    Gui.Label({
      Size = Vector2(w0, 30),
      Text = min
    }),
    Gui.Label({
      Location = Vector2(x2, 0),
      Size = Vector2(w2, 30),
      Text = max .. "," .. desc .. ":"
    })
  })(p, nil)
  local sl = Gui.Slider({
    Location = Vector2(x1, 0),
    Size = Vector2(w1, 30),
    MinValue = min,
    MaxValue = max
  })(ctrl, sl_ui)
  Gui.Textbox({
    Size = Vector2(w3, 30),
    Location = Vector2(x3, 0),
    Text = string.format("%g", cur),
    SelectionColor = ARGB(255, 255, 0, 0)
  })(ctrl, tb_ui)
  sl.CurValue = cur
end

add_button(main_tab.hdr, "\191\170\198\244bloom", 0)
add_button(main_tab.hdr, "\191\170\198\244star", 100)
add_button(main_tab.hdr, "\183\181\187\216\180\243\204\252", 200)
btn_ui[1].Visible = false
add_slider(main_tab.hdr, 0, 1, 1, "       scene\199\191\182\200")
add_slider(main_tab.hdr, 0.5, 1, 0.7, "       \189\165\177\228\203\217\182\200")
add_pad(main_tab.hdr, 30, "bloom setting")
add_slider(main_tab.hdr, 0, 1, 1, "       bloom\199\191\182\200")
add_slider(main_tab.hdr, 0, 1, 0.5, "       \214\208\187\210")
add_slider(main_tab.hdr, 0, 5, 0.8, "       \193\193\182\200\185\253\194\203")
add_slider(main_tab.hdr, 0, 5, 0.5, "       \193\193\182\200\198\171\210\198")
add_pad(main_tab.hdr, 30, "star setting")
add_slider(main_tab.hdr, 0, 1, 1, "       star\199\191\182\200")
add_slider(main_tab.hdr, 0.7, 1, 0.8, "       star\203\165\188\245")
add_slider(main_tab.hdr, 0, 3.14, 0, "   star\189\199\182\200")
add_slider(main_tab.hdr, 0.2, 4, 3, "       star\179\164\182\200")
add_slider(main_tab.shadow, 0, 5, 1, "lightIntensity")
add_slider(main_tab.shadow, -1, 1, 1, "SunDirection x")
add_slider(main_tab.shadow, -1, 1, 1, "SunDirection y")
add_slider(main_tab.shadow, -1, 1, 1, "SunDirection z")
add_pad(main_tab.shadow, 30, "shadow")
add_slider(main_tab.shadow, -1, 1, 1, "\210\245\211\176\183\189\207\242 x")
add_slider(main_tab.shadow, -1, 1, 1, "\210\245\211\176\183\189\207\242 y")
add_slider(main_tab.shadow, -1, 1, 1, "\210\245\211\176\183\189\207\242 z")
add_button(main_tab.CA, "\191\170\198\244\209\213\201\171\208\163\213\253", 100)
add_slider(main_tab.CA, 0, 2, 1, "\193\193\182\200")
add_slider(main_tab.CA, 0, 3, 1, "\182\212\177\200\182\200")
add_pad(main_tab.CA, 30, "color offset")
add_slider(main_tab.CA, -1, 1, 0, "color r")
add_slider(main_tab.CA, -1, 1, 0, "color g")
add_slider(main_tab.CA, -1, 1, 0, "color b")
local lev = -1
local ReadParamToSetUI = function(level)
  if level < 0 then
    return
  end
  sl_ui[1].CurValue = cg:Get_BLOOM_COMBINE_VECTOR(level, 2)
  sl_ui[2].CurValue = cg:Get_LUM_ADAPTED_SPEED(level)
  sl_ui[3].CurValue = cg:Get_BLOOM_COMBINE_VECTOR(level, 3)
  sl_ui[4].CurValue = cg:Get_MiddleGray(level)
  sl_ui[5].CurValue = cg:Get_BRIGHT_PASS_THRESHOLD(level)
  sl_ui[6].CurValue = cg:Get_BRIGHT_PASS_OFFSET(level)
  sl_ui[7].CurValue = cg:Get_STAR_COMBINE_VECTOR(level)
  sl_ui[8].CurValue = cg:Get_Attenuation(level)
  sl_ui[9].CurValue = cg:Get_StarRot(level)
  sl_ui[10].CurValue = cg:Get_Sample_Len(level)
end
level_sld = Gui.Slider({
  Location = Vector2(x1, 0),
  Size = Vector2(w1, 30),
  MinValue = 0,
  MaxValue = 2,
  IsInt = true,
  CurValue = 0,
  EventValueChange = function(sender, e)
    config.HDR = sender.CurValue
    lev = sender.CurValue - 1
    if 0 <= lev then
      print("lev = " .. lev)
      ReadParamToSetUI(lev)
    end
  end
})(main_tab.hdr, nil)
local b_hdr = false
local b_star = false
local b_CA = false
btn_func_list[1] = function()
  cg:SetHDR(b_hdr)
  b_hdr = not b_hdr
  if b_hdr then
    btn_ui[1].Text = "\191\170\198\244hdr"
  else
    btn_ui[1].Text = "\185\216\177\213hdr"
  end
end
btn_func_list[2] = function()
  cg:SetStar(b_star)
  b_star = not b_star
  if b_star then
    btn_ui[2].Text = "\191\170\198\244star"
  else
    btn_ui[2].Text = "\185\216\177\213star"
  end
end
btn_func_list[3] = function()
  local state = ptr_cast(game.CurrentState, "Client.StateMainGame")
  if state then
    state:Quit()
  end
end
btn_func_list[4] = function()
  cg:SetColorAdjust(b_CA)
  b_CA = not b_CA
  if b_CA then
    btn_ui[4].Text = "\191\170\202\188\209\213\201\171\208\163\213\253"
  else
    btn_ui[4].Text = "\185\216\177\213\209\213\201\171\208\163\213\253"
  end
end
func_list[1] = function(val)
  if 0 <= lev then
    cg:Set_BLOOM_COMBINE_VECTOR(lev, 2, val)
  end
end
func_list[2] = function(val)
  if 0 <= lev then
    cg:Set_LUM_ADAPTED_SPEED(lev, val)
  end
end
func_list[3] = function(val)
  if 0 <= lev then
    cg:Set_BLOOM_COMBINE_VECTOR(lev, 3, val)
  end
end
func_list[4] = function(val)
  if 0 <= lev then
    cg:Set_MiddleGray(lev, val)
  end
end
func_list[5] = function(val)
  if 0 <= lev then
    cg:Set_BRIGHT_PASS_THRESHOLD(lev, val)
  end
end
func_list[6] = function(val)
  if 0 <= lev then
    cg:Set_BRIGHT_PASS_OFFSET(lev, val)
  end
end
func_list[7] = function(val)
  if 0 <= lev then
    cg:Set_STAR_COMBINE_VECTOR(lev, val)
  end
end
func_list[8] = function(val)
  if 0 <= lev then
    cg:Set_Attenuation(lev, val)
  end
end
func_list[9] = function(val)
  if 0 <= lev then
    cg:Set_StarRot(lev, val)
  end
end
func_list[10] = function(val)
  if 0 <= lev then
    cg:Set_Sample_Len(lev, val)
  end
end
func_list[11] = function(val)
  cg:SetCharacterLightIntensity(val)
end
func_list[12] = function(val)
  cg:SetSunDirection(sl_ui[12].CurValue, sl_ui[13].CurValue, sl_ui[14].CurValue)
end
func_list[13] = function(val)
  cg:SetSunDirection(sl_ui[12].CurValue, sl_ui[13].CurValue, sl_ui[14].CurValue)
end
func_list[14] = function(val)
  cg:SetSunDirection(sl_ui[12].CurValue, sl_ui[13].CurValue, sl_ui[14].CurValue)
end
func_list[15] = function(val)
  cg:SetShadowDirection(sl_ui[15].CurValue, sl_ui[16].CurValue, sl_ui[17].CurValue)
end
func_list[16] = function(val)
  cg:SetShadowDirection(sl_ui[15].CurValue, sl_ui[16].CurValue, sl_ui[17].CurValue)
end
func_list[17] = function(val)
  cg:SetShadowDirection(sl_ui[15].CurValue, sl_ui[16].CurValue, sl_ui[17].CurValue)
end
func_list[18] = function(val)
  cg:SetCABrightness(val)
end
func_list[19] = function(val)
  cg:SetCAConstract(val)
end
func_list[20] = function(val)
  cg:SetCAColorOffset(sl_ui[20].CurValue, sl_ui[21].CurValue, sl_ui[22].CurValue)
end
func_list[21] = function(val)
  cg:SetCAColorOffset(sl_ui[20].CurValue, sl_ui[21].CurValue, sl_ui[22].CurValue)
end
func_list[22] = function(val)
  cg:SetCAColorOffset(sl_ui[20].CurValue, sl_ui[21].CurValue, sl_ui[22].CurValue)
end
for i, v in ipairs(sl_ui) do
  function v.EventValueChange(sender, e)
    func_list[i](sender.CurValue)
    
    tb_ui[i].Text = string.format("%g", sender.CurValue)
  end
  
  tb_ui[i].EventValueEnter = function(sender, e)
    sl_ui[i].CurValue = tonumber(sender.Text)
  end
end
for i, v in ipairs(btn_ui) do
  function v.EventClick(sender, e)
    btn_func_list[i]()
  end
end
