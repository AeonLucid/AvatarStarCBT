module("MoveInfo", package.seeall)
if root then
  Hide()
end
local root, LabelValuePair = Gui.Control({
  Location = Vector2(100, 100),
  Size = Vector2(500, 500),
  BackgroundColor = ARGB(125, 0, 0, 0)
})(nil, nil), Gui.Control({
  Location = Vector2(100, 100),
  Size = Vector2(500, 500),
  BackgroundColor = ARGB(125, 0, 0, 0)
})(nil, nil)

function LabelValuePair(parent, y, label, value, edit_table)
  Gui.Label({
    Location = Vector2(10, y),
    Size = Vector2(130, 20),
    BackgroundColor = ARGB(0, 0, 0, 0),
    Text = label,
    TextAlign = "kAlignRightMiddle"
  })(parent, nil)
  Gui.Textbox({
    Location = Vector2(150, y),
    Size = Vector2(130, 20),
    Text = value
  })(parent, edit_table)
end

edit_table = {}
local y = 10
LabelValuePair(root, y, "jump2_v0.x", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "jump2_v0.y", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "jump2_a0.x", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "jump2_a0.y", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "jump2_aa.x", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "jump2_aa.y", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "jump2_total_time", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_v0.x", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_v0.y", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_a0.x", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_a0.y", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_aa.x", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_aa.y", 1, edit_table)
y = y + 30
LabelValuePair(root, y, "fly_total_time", 1, edit_table)
y = y + 30
btn_save = Gui.Button({
  Location = Vector2(100, y),
  Size = Vector2(120, 40),
  Text = "\177\163\180\230"
})(root, nil)

function btn_save.EventClick(sender, e)
  Save()
end

btn_cancel = Gui.Button({
  Location = Vector2(300, y),
  Size = Vector2(120, 40),
  Text = "\205\203\179\246"
})(root, nil)

function btn_cancel.EventClick(sender, e)
  Hide()
end

function Show()
  root.Parent = gui
  ptr_cast(game.CurrentState).EscHasFocus = true
  Read()
end

function Hide()
  root.Parent = nil
  ptr_cast(game.CurrentState).EscHasFocus = false
end

local move_info

function Read()
  move_info = game.Player.MoveController.move_info
  edit_table[1].Text = tostring(move_info.jump2_v0.x)
  edit_table[2].Text = tostring(move_info.jump2_v0.y)
  edit_table[3].Text = tostring(move_info.jump2_a0.x)
  edit_table[4].Text = tostring(move_info.jump2_a0.y)
  edit_table[5].Text = tostring(move_info.jump2_aa.x)
  edit_table[6].Text = tostring(move_info.jump2_aa.y)
  edit_table[7].Text = tostring(move_info.jump2_total_time)
  edit_table[8].Text = tostring(move_info.fly_v0.x)
  edit_table[9].Text = tostring(move_info.fly_v0.y)
  edit_table[10].Text = tostring(move_info.fly_a0.x)
  edit_table[11].Text = tostring(move_info.fly_a0.y)
  edit_table[12].Text = tostring(move_info.fly_aa.x)
  edit_table[13].Text = tostring(move_info.fly_aa.y)
  edit_table[14].Text = tostring(move_info.fly_total_time)
end

function Save()
  assert(move_info)
  move_info.jump2_v0 = Vector2(tonumber(edit_table[1].Text), tonumber(edit_table[2].Text))
  move_info.jump2_a0 = Vector2(tonumber(edit_table[3].Text), tonumber(edit_table[4].Text))
  move_info.jump2_aa = Vector2(tonumber(edit_table[5].Text), tonumber(edit_table[6].Text))
  move_info.jump2_total_time = tonumber(edit_table[7].Text)
  move_info.fly_v0 = Vector2(tonumber(edit_table[8].Text), tonumber(edit_table[9].Text))
  move_info.fly_a0 = Vector2(tonumber(edit_table[10].Text), tonumber(edit_table[11].Text))
  move_info.fly_aa = Vector2(tonumber(edit_table[12].Text), tonumber(edit_table[13].Text))
  move_info.fly_total_time = tonumber(edit_table[14].Text)
  game.Player.MoveController.move_info = move_info
end

Show()
