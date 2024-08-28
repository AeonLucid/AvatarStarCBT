module("ParticleEditor", package.seeall)
if Close then
  Close()
end
input_window = nil
emitter_window = nil
particle_window = nil
spline_window = nil
close_window = nil
particle_view = nil
emitter_list = nil
input = nil
input_vars = {}
local LockCamera = false
local ParticleSystem, ParticleResource
local mainstate = ptr_cast(game.CurrentState, "Client.StateMainGame")

function Show()
  InitInputWindow()
  InitCloseWindow()
  InitSplineView()
  InitParticleView()
  InitEmitterList()
  emitter_list = emitter_window.EmitterList
  particle_view = particle_window.ParticleView
  emitter_list:AddColumn("", 278)
  mainstate.EditorOn = true
  
  function particle_view.PropertyGrid.EventSelectItemChange(sender, e)
    local item, value
    if e.Item then
      item = ptr_cast(e.Item)
      value = ptr_cast(item.Value)
    end
  end
  
  LockCamera = true
  cg.LockCamera = LockCamera
end

function Close()
  if input_window then
    input_window.root.Parent = nil
  end
  if emitter_window then
    emitter_window.root.Parent = nil
  end
  if particle_window then
    particle_window.root.Parent = nil
  end
  if spline_window then
    spline_window.root.Parent = nil
  end
  if close_window then
    close_window.root.Parent = nil
  end
  LockCamera = false
  cg.LockCamera = LockCamera
end

function HideWindow()
  input_window.root.Visible = false
  emitter_window.root.Visible = false
  particle_window.root.Visible = false
  spline_window.root.Visible = false
  close_window.root.Visible = true
end

function ShowWindow()
  input_window.root.Visible = false
  emitter_window.root.Visible = true
  particle_window.root.Visible = true
  spline_window.root.Visible = true
  close_window.root.Visible = false
  LockCamera = false
end

function InitCloseWindow()
  close_window = Gui.Create(gui)({
    Gui.WindowUI("root")({
      Size = Vector2(180, 60),
      WorldLocation = Vector3(10, 10),
      ShowCloseButton = true,
      Moveable = false,
      Visible = false,
      Gui.Button("showall")({
        Location = Vector2(20, 30),
        Size = Vector2(60, 20),
        Text = "\207\212\202\190"
      }),
      Gui.Button("closeall")({
        Location = Vector2(100, 30),
        Size = Vector2(60, 20),
        Text = "\185\216\177\213"
      })
    })
  })
  
  function close_window.root.EventClose(sender, e)
    ShowWindow()
  end
  
  function close_window.showall.EventClick(sender, e)
    ShowWindow()
  end
  
  function close_window.closeall.EventClick(sender, e)
    Close()
    mainstate.EditorOn = false
    cg.LockCamera = false
  end
end

function InitInputWindow()
  input_window = Gui.Create(gui)({
    Gui.WindowUI("root")({
      Size = Vector2(200, 180),
      WorldLocation = Vector3(gui.Size.x / 2 - 100, gui.Size.y / 2 - 75, 0),
      Moveable = true,
      Visible = false,
      Gui.FlowLayout({
        Dock = "kDockFill",
        Direction = "kVertical",
        Align = "kAlignCenterMiddle",
        ControlAlign = "kAlignCenterMiddle",
        ControlSpace = 3,
        BackgroundColor = ARGB(192, 0, 0, 0),
        Gui.Label("label")({
          Margin = Vector4(0, 0, 0, 16),
          Size = Vector2(190, 20),
          Text = "\202\228\200\235:"
        }),
        Gui.Textbox("input")({
          Margin = Vector4(0, 0, 0, 16),
          Text = ""
        }),
        Gui.Button("OK")({Text = "\200\183\182\168"})
      })
    })
  })
  
  function input_window.root.EventClose()
    input_window.root.Visible = false
  end
end

function InitSplineView()
  spline_window = Gui.Create(gui)({
    Gui.WindowUI("root")({
      Size = Vector2(500, 200),
      WorldLocation = Vector3(gui.Size.x / 2 - 250, gui.Size.y - 200, 0),
      BackgroundColor = ARGB(192, 0, 0, 0),
      Moveable = true,
      Gui.SplineView("spline_view")({
        Size = Vector2(500, 180),
        Dock = "kDockBottom"
      })
    })
  })
  
  function spline_window.root.EventClose()
    HideWindow()
  end
end

function InitParticleView()
  particle_window = Gui.Create(gui)({
    Gui.WindowUI("root")({
      Size = Vector2(gui.Size.x * 0.3, gui.Size.y),
      WorldLocation = Vector3(gui.Size.x * 0.7, 0, 0),
      BackgroundColor = ARGB(192, 0, 0, 0),
      Moveable = true,
      Gui.Label("label")({
        Text = "\183\162\201\228\198\247",
        Size = Vector2(60, 18)
      }),
      Gui.PropertyView("ParticleView")({
        Dock = "kDockBottom",
        Size = Vector2(gui.Size.x * 0.3, gui.Size.y - 20)
      })
    })
  })
  
  function particle_window.root.EventClose(sender, e)
    HideWindow()
  end
end

function InitEmitterList()
  emitter_window = Gui.Create(gui)({
    Gui.WindowUI("root")({
      Size = Vector2(280, gui.Size.y),
      WorldLocation = Vector3(0, 0, 0),
      BackgroundColor = ARGB(192, 0, 0, 0),
      Moveable = true,
      Gui.Label("label")({
        Text = "\193\163\215\211\177\224\188\173\198\247",
        Size = Vector2(100, 18)
      }),
      Gui.ListTreeView("EmitterList")({
        Dock = "kDockBottom",
        Size = Vector2(278, gui.Size.y - 70)
      }),
      Gui.Button("NewParticle")({
        Location = Vector2(2, 21),
        Size = Vector2(40, 20),
        Text = "\208\194\189\168"
      }),
      Gui.Button("OpenParticle")({
        Location = Vector2(44, 21),
        Size = Vector2(40, 20),
        Text = "\180\242\191\170"
      }),
      Gui.Button("ModifyParticle")({
        Location = Vector2(86, 21),
        Size = Vector2(40, 20),
        Text = "\208\222\184\196"
      }),
      Gui.Button("SaveParticle")({
        Location = Vector2(128, 21),
        Size = Vector2(40, 20),
        Text = "\177\163\180\230"
      }),
      Gui.Button("Reset")({
        Location = Vector2(180, 21),
        Size = Vector2(40, 20),
        Text = "\214\216\214\195"
      }),
      Gui.Button("Position")({
        Location = Vector2(222, 21),
        Size = Vector2(40, 20),
        Text = "\206\187\214\195"
      }),
      Gui.Button("NewEmitter")({
        Location = Vector2(2, 45),
        Size = Vector2(40, 20),
        Text = "\204\237\188\211"
      }),
      Gui.Button("DeleteEmitter")({
        Location = Vector2(44, 45),
        Size = Vector2(40, 20),
        Text = "\201\190\179\253"
      }),
      Gui.Button("MoveUp")({
        Location = Vector2(86, 45),
        Size = Vector2(40, 20),
        Text = "\201\207\210\198"
      }),
      Gui.Button("MoveDown")({
        Location = Vector2(128, 45),
        Size = Vector2(40, 20),
        Text = "\207\194\210\198"
      }),
      Gui.Button("Camera")({
        Location = Vector2(180, 45),
        Size = Vector2(40, 20),
        Text = "\207\224\187\250"
      })
    })
  })
  
  function emitter_window.root.EventClose(sender, e)
    HideWindow()
  end
  
  function _G.lock()
    cg.LockCamera = true
  end
  
  function _G.unlock()
    cg.LockCamera = false
  end
  
  function emitter_window.Camera.EventClick(sender, e)
    LockCamera = not LockCamera
    cg.LockCamera = LockCamera
  end
  
  function emitter_window.NewParticle.EventClick(sender, e)
    input_window.label.Text = "\202\228\200\235\193\163\215\211\195\251\179\198:"
    input_window.root.Visible = true
    
    function input_window.OK.EventClick(sender, e)
      if input_window.input.Text ~= "" then
        emitter_list:DeleteAll()
        emitter_list:ClearSelection()
        emitter_list.Columns:SetText(0, input_window.input.Text)
        if ParticleResource then
          ParticleResource:ClearEmitterData()
        end
        if not ParticleSystem then
          ParticleSystem = ptr_new("Client.ParticleSystem")
          cg:AddParticle(ParticleSystem)
        end
        if not ParticleResource then
          ParticleResource = ptr_new("Client.ParticleResource")
        end
        ParticleSystem:SetParticleResource(ParticleResource)
        ParticleSystem:Initialize()
        input_window.input.Text = ""
        input_window.root.Visible = false
      end
    end
  end
  
  local position
  
  function emitter_window.OpenParticle.EventClick(sender, e)
    input_window.label.Text = "\202\228\200\235\193\163\215\211\206\196\188\254\195\251\179\198:"
    input_window.root.Visible = true
    
    function input_window.OK.EventClick(sender, e)
      if input_window.input.Text ~= "" then
        Open(input_window.input.Text)
        input_window.input.Text = ""
        input_window.root.Visible = false
        cg:AddParticle(ParticleSystem)
        position = cg:GetParticlePosition()
        ParticleSystem:SetPosition(position)
        ParticleSystem:Reset()
      end
    end
  end
  
  function emitter_window.SaveParticle.EventClick(sender, e)
    input_window.label.Text = "\202\228\200\235\193\163\215\211\206\196\188\254\195\251\179\198:"
    input_window.root.Visible = true
    
    function input_window.OK.EventClick(sender, e)
      Save(input_window.input.Text)
      input_window.root.Visible = false
    end
  end
  
  function emitter_window.Reset.EventClick(sender, e)
    ParticleSystem:Reset()
  end
  
  function emitter_window.Position.EventClick(sender, e)
    position = cg:GetParticlePosition()
    ParticleSystem:SetPosition(cg:GetParticlePosition())
  end
  
  function emitter_window.NewEmitter.EventClick(sender, e)
    input_window.label.Text = "\202\228\200\235\183\162\201\228\198\247\195\251\179\198:"
    input_window.root.Visible = true
    
    function input_window.OK.EventClick(sender, e)
      if input_window.input.Text ~= "" then
        item = emitter_list:AddItem(emitter_list.RootItem, input_window.input.Text)
        item.Tag = ParticleResource:CreateEmitterData()
        ptr_cast(item.Tag).EmitName = input_window.input.Text
        ParticleSystem:Initialize()
        input_window.input.Text = ""
        input_window.root.Visible = false
      end
    end
  end
  
  local CurrentEmit
  
  function emitter_window.DeleteEmitter.EventClick(sender, e)
    if CurrentEmit then
      ParticleResource:DeleteEmitter(ptr_cast(CurrentEmit.Tag))
      emitter_list:DeleteNode(emitter_list.SelectedItem)
      ParticleSystem:Initialize()
    end
  end
  
  function emitter_window.MoveUp.EventClick(sender, e)
    local current = emitter_list.SelectedItem
    if current.Next then
      print("Next")
    end
    if current.Prev then
      print("Prev")
    end
  end
  
  function emitter_window.ModifyParticle.EventClick(sender, e)
    input_window.label.Text = "\202\228\200\235\193\163\215\211\195\251\179\198:"
    input_window.root.Visible = true
    
    function input_window.OK.EventClick(sender, e)
      if ParticleSystem and input_window.input.Text ~= "" then
        emitter_list.Columns:SetText(0, input_window.input.Text)
      end
      input_window.input.Text = ""
      input_window.root.Visible = false
    end
    
    if ParticleSystem and input_window.input.Text ~= "" then
      emitter_list.SelectedItem.Tag:SetEmitName(input_window.input.Text)
      emitter_list.SelectedItem.Text = input_window.input.Text
    end
  end
  
  function emitter_window.EmitterList.EventSelectItemChange(sender, e)
    if e.Item then
      particle_view.SelectedObject = e.Item.Tag
      CurrentEmit = e.Item
    end
  end
  
  function particle_window.ParticleView.PropertyGrid.EventDropDown(sender, e)
    if e.Item then
      local item = ptr_cast(e.Item)
      local spline_value = ptr_cast(item.Value)
      if spline_value then
        spline_window.spline_view.Spline = spline_value
        if item:GetText() == "TextureName" then
          cg:ReloadResource("/vfx/" .. ptr_cast(item.Value))
          cg:LoadResourceByType("/vfx/" .. ptr_cast(item.Value), "dds")
        end
      end
    end
  end
  
  function particle_window.ParticleView.PropertyGrid.EventExpand(sender, e)
  end
end

function Open(path)
  emitter_list:DeleteAll()
  emitter_list:ClearSelection()
  if not _G.particle_system then
    _G.particle_system = ptr_new("Client.ParticleResource")
  end
  _G.particle_system:ClearEmitterData()
  dofile("../vfx/ReadParticle.lua")
  dofile("../vfx/" .. path)
  if not ParticleSystem then
    ParticleSystem = ptr_new("Client.ParticleSystem")
  end
  ParticleSystem:SetParticleResource(_G.particle_system)
  ParticleSystem:Initialize()
  ParticleResource = _G.particle_system
  ParticleResource:AddEmitToList(emitter_list)
  emitter_list.Columns:SetText(0, ParticleResource.Name)
end

function Save(path)
  io.output("../vfx/" .. path)
  local pos, writeline = 0, "../vfx/" .. path
  local writeline, writelinef = function(v, c)
    pos = pos + c
    for i = 1, pos do
      io.write("\t")
    end
    io.write(v)
    io.write("\n")
  end, path
  
  function writelinef(f, ...)
    io.write("\t")
    io.write(string.format(f, ...))
    io.write("\n")
  end
  
  writeline("ParticleSystem", 0)
  writeline("{", 0)
  writeline("ParticleSystemName = " .. "\"" .. emitter_list.Columns:GetText(0) .. "\"", 1)
  writeline("}", -1)
  local property_writer = {
    ["unsigned long"] = function(k, v)
      writelinef("%s = %s,", k, v)
    end,
    long = function(k, v)
      writelinef("%s = %s,", k, v)
    end,
    float = function(k, v)
      writelinef("%s = %s,", k, v)
    end,
    bool = function(k, v)
      writelinef("%s = %s,", k, tostring(v))
    end,
    ["Core.Identifier"] = function(k, v)
      writelinef("%s = %q,", k, v)
    end,
    ["Core.String"] = function(k, v)
      writelinef("%s = %q,", k, v)
    end,
    ["Core.Vector3"] = function(k, v)
      writelinef("%s = Vector3(%g, %g, %g),", k, v.x, v.y, v.z)
    end,
    ["Core.Vector2"] = function(k, v)
      writelinef("%s = Vector2(%g, %g),", k, v.x, v.y)
    end,
    ["Core.Color3"] = function(k, v)
      writelinef("%s = Color3(%g, %g, %g),", k, v.g, v.g, v.b)
    end,
    ["Core.Color3"] = function(k, v)
      writelinef("%s = Color3(%g, %g, %g),", k, v.g, v.g, v.b)
    end
  }
  local iter = emitter_list.RootItem.FirstChild
  while iter do
    writeline("Emitter", 0)
    writeline("{", 0)
    pos = pos + 1
    local emmiter = ptr_cast(iter.Tag)
    if emmiter then
      local emmiter_type = ptr_typeof(emmiter)
      if emmiter_type then
        local member_count = emmiter_type:GetMemberCount()
        for i = 0, member_count - 1 do
          local member = emmiter_type:GetMemberById(i)
          if member and member:GetMemberKind() == "kProperty" then
            local property = ptr_cast(member)
            local name = property:GetName()
            local typename = property:GetPropertyType()
            local value = emmiter[name]
            local writer = property_writer[typename]
            if writer then
              writer(name, value)
            else
              local param = ptr_cast(value, "Client.Parameter")
              if param then
                writelinef("%s = %s", name, ptr_cast(param):SaveToStream(1))
              else
                writelinef("%s = %q,", name, tostring(value))
              end
            end
          end
        end
      end
    end
    iter = iter.Next
    pos = pos - 1
    writeline("}", 0)
  end
  io.close()
  print(path .. " saved at " .. "../vfx/" .. path)
end

Show()
