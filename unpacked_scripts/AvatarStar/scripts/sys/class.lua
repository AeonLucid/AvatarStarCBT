module("class", package.seeall)
local class_cache = {}

function import(name)
  local m = class_cache[name]
  if m then
    return m
  end
  local typeInfo = ptr_typeof(name)
  if typeInfo then
    m = {}
    for i = 0, typeInfo:GetMemberCount() - 1 do
      local member = typeInfo:GetMemberById(i)
      if member:GetMemberKind() == "kStaticMethod" then
        m[member:GetName()] = ptr_cast(member):ToDelegate()
      end
    end
    local ctor = typeInfo:GetConstructor()
    if ctor then
      m[".ctor"] = ctor
      local __ptr_mt_call = getmetatable(ctor).__call
      local __ptr_ctor_call = function(self, arg1, ...)
        if type(arg1) == "table" then
          local ret = __ptr_mt_call(ctor, ...)
          for key, value in pairs(arg1) do
            if type(key) == "string" then
              ret[key] = value
            end
          end
          return ret
        else
          return __ptr_mt_call(ctor, arg1, ...)
        end
      end
      setmetatable(m, {__call = __ptr_ctor_call})
    end
  end
  class_cache[name] = m
  return m
end

_G.Vector2 = import("Core.Vector2")
_G.Vector3 = import("Core.Vector3")
_G.Vector4 = import("Core.Vector4")
_G.Quaternion = import("Core.Quaternion")
_G.Color3 = import("Core.Color3")
_G.Color4 = import("Core.Color4")
_G.Matrix44 = import("Core.Matrix44")
_G.ARGB = import("Core.ARGB")
_G.XRGB = import("Core.XRGB")
_G.Module = import("Core.Module")
_G.Task = import("Core.Task")
_G.Thread = import("Core.Thread")
_G.Path = import("Core.Path")
