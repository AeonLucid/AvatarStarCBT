module("NewLead", package.seeall)
leadVisible = false
leadA = nil
leadB = nil
leadT = nil
leadD = nil
leadFuc = nil
ui = Gui.Create()({
  ComFuc.ComControl("left_h", Vector2(0, 0), Vector2(0, 0)),
  ComFuc.ComControl("up_h", Vector2(0, 0), Vector2(0, 0)),
  ComFuc.ComControl("right_h", Vector2(0, 0), Vector2(0, 0)),
  ComFuc.ComControl("down_h", Vector2(0, 0), Vector2(0, 0)),
  ComFuc.ComFlashNew("region_f", Vector2(0, 0), Vector2(0, 0), 255, SkinF.newLead_001),
  ComFuc.ComFlashArrow("Arrow_f", Vector2(0, 0), Vector2(0, 0), 255, SkinF.fresh_005[1]),
  ComFuc.ComAutoLcLabel("AutoText_f", 255, SkinF.SkinF.fresh_006, false),
  Gui.Control("skill_f")({
    Size = Vector2(294, 342),
    BackgroundColor = ARGB(255, 255, 255, 255),
    Skin = SkinF.fresh_006,
    ComFuc.ComLabel(nil, GetUTF8Text("UI_common_Skill_Tip"), Vector2(274, 43), Vector2(10, 10), 255, 16, ARGB(255, 113, 83, 65), "kAlignCenterMiddle", SkinF.fresh_007),
    ComFuc.ComLabel("skill_f_text", GetUTF8Text("UI_abilities_Skill_Points_Guide"), Vector2(260, 170), Vector2(17, 115), 0, 16, ARGB(255, 255, 255, 255)),
    ComFuc.ComControl(nil, Vector2(24, 45), Vector2(110, 60), 255, SkinF.fresh_008),
    ComFuc.ComControl(nil, Vector2(24, 45), Vector2(140, 60), 255, SkinF.fresh_009),
    Gui.Button({
      Size = Vector2(96, 43),
      Location = Vector2(99, 285),
      Text = GetUTF8Text("button_common_OK"),
      EventClick = function(sender, e)
        sender.Parent.Parent = nil
        leadVisible = false
        ComFuc.SetOneLeadFinish(4)
      end
    })
  }),
  Gui.AutoMissLabel("Anti_addiction")({
    Size = Vector2(1200, 30),
    BackgroundColor = ARGB(178, 0, 0, 0),
    FontSize = 14,
    TextColor = ARGB(255, 255, 0, 0),
    TextAlign = "kAlignCenterMiddle"
  }),
  ComFuc.ComFlashNew("region_skill1", Vector2(0, 0), Vector2(0, 0), 255, SkinF.newLead_001),
  ComFuc.ComFlashNew("region_skill2", Vector2(0, 0), Vector2(0, 0), 255, SkinF.newLead_001),
  ComFuc.ComFlashNew("region_skill3", Vector2(0, 0), Vector2(0, 0), 255, SkinF.newLead_001),
  ComFuc.ComFlashNew("region_skill4", Vector2(0, 0), Vector2(0, 0), 255, SkinF.newLead_001),
  ComFuc.ComFlashNew("region_skill5", Vector2(0, 0), Vector2(0, 0), 255, SkinF.newLead_001),
  ComFuc.ComFlashArrow("Arrow_skill1", Vector2(0, 0), Vector2(0, 0), 255, SkinF.fresh_005[4]),
  ComFuc.ComFlashArrow("Arrow_skill2", Vector2(0, 0), Vector2(0, 0), 255, SkinF.fresh_005[4]),
  ComFuc.ComFlashArrow("Arrow_skill3", Vector2(0, 0), Vector2(0, 0), 255, SkinF.fresh_005[4]),
  ComFuc.ComFlashArrow("Arrow_skill4", Vector2(0, 0), Vector2(0, 0), 255, SkinF.fresh_005[4]),
  ComFuc.ComFlashArrow("Arrow_skill5", Vector2(0, 0), Vector2(0, 0), 255, SkinF.fresh_005[4]),
  ComFuc.ComAutoLcLabel("AutoText_skill1", 255, SkinF.SkinF.fresh_006, false, GetUTF8Text("UI_abilities_skill_guide")),
  ComFuc.ComAutoLcLabel("AutoText_skill2", 255, SkinF.SkinF.fresh_006, false, GetUTF8Text("UI_abilities_skill_guide")),
  ComFuc.ComAutoLcLabel("AutoText_skill3", 255, SkinF.SkinF.fresh_006, false, GetUTF8Text("UI_abilities_skill_guide")),
  ComFuc.ComAutoLcLabel("AutoText_skill4", 255, SkinF.SkinF.fresh_006, false, GetUTF8Text("UI_abilities_skill_guide")),
  ComFuc.ComAutoLcLabel("AutoText_skill5", 255, SkinF.SkinF.fresh_006, false, GetUTF8Text("UI_abilities_skill_guide"))
})
ui.skill_f_text.AutoWrap = true

function ShowAntiAddiction(e)
  if e.errId == 1000 then
    local msg
    if e.online_time >= 60 and e.online_time < 120 then
      msg = GetUTF8Text("msgbox_grade_chenmi_1")
    elseif e.online_time >= 120 and e.online_time < 180 then
      msg = GetUTF8Text("msgbox_grade_chenmi_2")
    elseif e.online_time >= 180 and e.online_time < 240 then
      msg = GetUTF8Text("msgbox_grade_chenmi_3")
    elseif e.online_time >= 240 and e.online_time < 300 then
      msg = GetUTF8Text("msgbox_grade_chenmi_4")
    elseif e.online_time >= 300 then
      msg = GetUTF8Text("msgbox_grade_chenmi_5")
    end
    if msg and msg ~= "" then
      ui.Anti_addiction.Size = Vector2(gui.Size.x, 30)
      ui.Anti_addiction.Parent = gui
      ui.Anti_addiction.Visible = true
      ui.Anti_addiction.Text = msg
      ui.Anti_addiction.MissTime = 60
    end
  elseif e.errId == 2000 then
  end
end

function ShowSkillNewLead(i, a)
  ui["region_skill" .. i].Parent = PersonalInfo.ui.main_mid
  ui["Arrow_skill" .. i].Parent = PersonalInfo.ui.main_mid
  ui["AutoText_skill" .. i].Parent = PersonalInfo.ui.main_mid
  ui["Arrow_skill" .. i].DirState = 3
  ui["AutoText_skill" .. i].DirState = 3
  b = Vector2(70, 70)
  a = a or Vector2(541, 84 * i - 30)
  ui["region_skill" .. i].Size = b + Vector2(28, 28)
  ui["region_skill" .. i].Location = a - Vector2(14, 14)
  ui["Arrow_skill" .. i].Size = Vector2(58.400000000000006, 45.6)
  ui["Arrow_skill" .. i].FirstLc = Vector2(a.x - 58.400000000000006, a.y + (b.y - 45.6) / 2)
  ui["AutoText_skill" .. i].MiddCenter = Vector2(a.x - 50, a.y + b.y / 2)
end

local HideSkillNewLead, SetComNewLeadLock = function(p, j)
  if p == true then
    for i = 1, 5 do
      ui["region_skill" .. i].Parent = nil
      ui["Arrow_skill" .. i].Parent = nil
      ui["AutoText_skill" .. i].Parent = nil
    end
  else
    ui["region_skill" .. j].Parent = nil
    ui["Arrow_skill" .. j].Parent = nil
    ui["AutoText_skill" .. j].Parent = nil
  end
end, function(p, j)
  if p == true then
    for i = 1, 5 do
      ui["region_skill" .. i].Parent = nil
      ui["Arrow_skill" .. i].Parent = nil
      ui["AutoText_skill" .. i].Parent = nil
    end
  else
    ui["region_skill" .. j].Parent = nil
    ui["Arrow_skill" .. j].Parent = nil
    ui["AutoText_skill" .. j].Parent = nil
  end
end

function SetComNewLeadLock(a, b, t, d, isSizeChanged)
  leadA = a
  leadB = b
  leadT = t
  leadD = d
  if not isSizeChanged then
    ui.region_f.Parent = gui
    if t then
      ui.AutoText_f.Parent = gui
      ui.Arrow_f.Parent = gui
    end
  end
  ui.Arrow_f.DirState = d
  ui.AutoText_f.DirState = d
  ui.region_f.Size = b + Vector2(28, 28)
  ui.region_f.Location = a - Vector2(14, 14) + Vector2(ComFuc.locationChanged, 0)
  if d == 0 then
    ui.Arrow_f.Size = Vector2(45.6, 58.400000000000006)
    ui.Arrow_f.Skin = SkinF.fresh_005[1]
    ui.Arrow_f.FirstLc = Vector2(a.x + b.x / 2 - 22.8 + ComFuc.locationChanged, a.y - 58.400000000000006 - 8)
    ui.AutoText_f.MiddCenter = Vector2(a.x + b.x / 2 + ComFuc.locationChanged, a.y - 56)
  elseif d == 1 then
    ui.Arrow_f.Size = Vector2(45.6, 58.400000000000006)
    ui.Arrow_f.Skin = SkinF.fresh_005[2]
    ui.Arrow_f.FirstLc = Vector2(a.x + b.x / 2 - 22.8 + ComFuc.locationChanged, a.y + b.y - 8)
    ui.AutoText_f.MiddCenter = Vector2(a.x + b.x / 2 + ComFuc.locationChanged, a.y + b.y + 56)
  elseif d == 2 then
    ui.Arrow_f.Size = Vector2(58.400000000000006, 45.6)
    ui.Arrow_f.Skin = SkinF.fresh_005[3]
    ui.Arrow_f.FirstLc = Vector2(a.x + b.x + ComFuc.locationChanged, a.y + (b.y - 45.6) / 2)
    ui.AutoText_f.MiddCenter = Vector2(a.x + b.x + 70 + ComFuc.locationChanged, a.y + b.y / 2)
  elseif d == 3 then
    ui.Arrow_f.Size = Vector2(58.400000000000006, 45.6)
    ui.Arrow_f.Skin = SkinF.fresh_005[4]
    ui.Arrow_f.FirstLc = Vector2(a.x - 58.400000000000006 + ComFuc.locationChanged, a.y + (b.y - 45.6) / 2)
    ui.AutoText_f.MiddCenter = Vector2(a.x - 50 + ComFuc.locationChanged, a.y + b.y / 2)
  elseif d == 4 then
    ui.Arrow_f.DirState = 0
    ui.AutoText_f.DirState = 0
    ui.Arrow_f.Size = Vector2(45.6, 58.400000000000006)
    ui.Arrow_f.Skin = SkinF.fresh_005[1]
    ui.Arrow_f.FirstLc = Vector2(a.x + b.x * 0.33 / 2 - 22.8 + ComFuc.locationChanged, a.y - 58.400000000000006 - 8)
    ui.AutoText_f.MiddCenter = Vector2(a.x + b.x * 0.33 / 2 + ComFuc.locationChanged, a.y - 56)
  end
  ui.AutoText_f.Text = t
  leadVisible = true
end

function ShowNewLeadNoLock(a, b, t, d, isSizeChanged)
  leadFuc = ShowNewLeadNoLock
  SetComNewLeadLock(a, b, t, d, isSizeChanged)
end

function ShowNewLeadEmptyHasParent(a, b, p)
  ui.region_f.Size = b + Vector2(28, 28)
  ui.region_f.Location = a - Vector2(14, 14)
  ui.region_f.Parent = p
  leadVisible = true
end

function ShowEmptyHasLock(a, b, t, d, isSizeChanged, isp)
  if not isSizeChanged then
    ui.left_h.Parent = gui
    ui.up_h.Parent = gui
    ui.right_h.Parent = gui
    ui.down_h.Parent = gui
  end
  ui.left_h.Location = Vector2(0, 0)
  ui.up_h.Location = Vector2(a.x + ComFuc.locationChanged, 0)
  ui.right_h.Location = Vector2(a.x + b.x + ComFuc.locationChanged, 0)
  ui.down_h.Location = Vector2(a.x + ComFuc.locationChanged, a.y + b.y)
  ui.left_h.Size = Vector2(a.x + ComFuc.locationChanged, 900)
  ui.up_h.Size = Vector2(b.x, a.y)
  ui.right_h.Size = Vector2(1600 - a.x - b.x - ComFuc.locationChanged, 900)
  ui.down_h.Size = Vector2(b.x, 900 - a.y - b.y)
  leadVisible = true
  if not isp then
    leadA = a
    leadB = b
    leadT = t
    leadD = d
    leadFuc = ShowEmptyHasLock
    ui.left_h.BackgroundColor = ARGB(100, 0, 0, 0)
    ui.up_h.BackgroundColor = ARGB(100, 0, 0, 0)
    ui.right_h.BackgroundColor = ARGB(100, 0, 0, 0)
    ui.down_h.BackgroundColor = ARGB(100, 0, 0, 0)
  end
end

function ShowNewLeadHasLock(a, b, t, d, isSizeChanged)
  leadFuc = ShowNewLeadHasLock
  SetComNewLeadLock(a, b, t, d, isSizeChanged)
  ShowEmptyHasLock(a, b, t, d, isSizeChanged, true)
end

function ShowSkillLead(a, b, t, d, isSizeChanged)
  if not isSizeChanged then
    ui.skill_f.Parent = gui
  end
  ui.skill_f.Location = Vector2(157 + ComFuc.locationChanged, 288)
  leadFuc = ShowSkillLead
  leadVisible = true
end

function HideLead()
  if leadVisible then
    ui.left_h.Parent = nil
    ui.up_h.Parent = nil
    ui.right_h.Parent = nil
    ui.down_h.Parent = nil
    ui.region_f.Parent = nil
    ui.AutoText_f.Parent = nil
    ui.Arrow_f.Parent = nil
    ui.skill_f.Parent = nil
    ui.left_h.BackgroundColor = ARGB(0, 0, 0, 0)
    ui.up_h.BackgroundColor = ARGB(0, 0, 0, 0)
    ui.right_h.BackgroundColor = ARGB(0, 0, 0, 0)
    ui.down_h.BackgroundColor = ARGB(0, 0, 0, 0)
    leadFuc = nil
    leadVisible = false
  end
end
