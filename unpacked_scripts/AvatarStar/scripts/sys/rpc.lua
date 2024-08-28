module("rpc", package.seeall)
debug = false
debug_count = 5
local debug_result = {}
local debug_code = {}
local rpc_maxclass = 9
local rpc_api = game.RpcCall
local rpc_queue = {}
local rpc_inclass = {}
local rpc_current, rpc_api_test

function rpc_api_test(_, name, args, callback)
  Task.Schedule(function()
    local file = io.open("/rpc_test/" .. name, "r")
    local result, err
    if file then
      result = file:read("*a")
      file:close()
    else
      err = "error open file"
    end
    callback(result, err)
  end, 0.1)
  return true
end

local rpc_new, rpc_update, rpc_completed

function rpc_completed(buff, err)
  local callback
  if rpc_current then
    callback = rpc_current.callback
    rpc_current = nil
  end
  rpc_update()
  if callback then
    callback(buff, err)
  end
end

function rpc_update()
  if not rpc_current then
    rpc_current = rpc_queue[1]
    if rpc_current then
      if rpc_current.api(game, rpc_current.name, rpc_current.args, rpc_completed) then
        table.remove(rpc_queue, 1)
      else
        rpc_current = nil
      end
    else
      local i = 2
      while not rpc_current and i <= rpc_maxclass do
        rpc_current = rpc_inclass[i]
        i = i + 1
      end
      if rpc_current then
        if rpc_current.api(game, rpc_current.name, rpc_current.args, rpc_completed) then
          rpc_inclass[i - 1] = nil
        else
          rpc_current = nil
        end
      end
    end
  elseif rpc_current.class ~= 1 and rpc_inclass[rpc_current.class] then
    rpc_current.callback = nil
  end
end

local rpc_new, print_debug = function(name, args, callback, class, api)
  assert(type(name) == "string")
  rpc_args = {}
  if type(args) == "table" then
    for k, v in pairs(args) do
      if type(k) == "string" then
        rpc_args[k] = tostring(v)
      end
    end
  end
  local t = {
    name = name,
    callback = callback,
    args = rpc_args,
    api = api,
    class = class or 1
  }
  if t.class == 1 then
    table.insert(rpc_queue, t)
  else
    rpc_inclass[class] = t
  end
  rpc_update()
  return t
end, nil
local print_debug, fill_debug_result = function()
  console:Clear()
  for i, v in ipairs(debug_result) do
    print("test code ", i, debug_code[i])
    if debug == 2 then
      print("-- reslut \n", v, "\n")
    end
  end
  local f = io.open("d:/result.lua", "w+") or io.open("c:/result.lua", "w+")
  if f then
    f:write("-- set \"rpc.debug_count\" to change result count\n")
    for i, v in ipairs(debug_result) do
      f:write("-- test code ", i, "  ", debug_code[i], "\n")
      f:write([[
-- reslut
 ]], v, "\n")
    end
    f:close()
  end
  console.Text = debug_code[#debug_code]
end, nil
local fill_debug_result, fill_debug_code = function(result)
  if result == nil then
    result = "error = nil"
  end
  local len_result = 1
  if type(debug_count) == "number" and debug_count > 0 then
    len_result = math.floor(debug_count)
  end
  table.insert(debug_result, result)
  while len_result < #debug_result do
    table.remove(debug_result, 1)
  end
  if debug_code[#debug_result] == nil then
    debug_code[#debug_result] = "not rpc call "
  end
end, nil

function fill_debug_code(interface, args)
  local args_table = {}
  local code = ""
  if type(args) == "table" then
    for k, v in pairs(args) do
      args_table[#args_table + 1] = k .. " = " .. (type(v) == "string" and "\"" .. v .. "\"" or tostring(v))
    end
  end
  code = "rpc.safecall(\"" .. interface .. "\",{" .. table.concat(args_table, ",") .. "},function(data) end)"
  local len_code = 1
  if type(debug_count) == "number" and debug_count > 0 then
    len_code = math.floor(debug_count)
  end
  table.insert(debug_code, code)
  while len_code < #debug_code do
    table.remove(debug_code, 1)
  end
end

function call(name, args, callback, class)
  if debug then
    fill_debug_code(name, args)
  end
  return rpc_new(name, args, callback, class, rpc_api)
end

function clear()
  rpc_queue = {}
  rpc_inclass = {}
  if rpc_current then
    rpc_current = nil
  end
end

function cancel(rpc_struct)
  if not rpc_struct then
    return
  end
  if rpc_struct == rpc_current then
    rpc_current.callback = nil
    return
  end
  found = -1
  for i = 1, #rpc_queue do
    if rpc_struct == rpc_queue[i] then
      found = i
    end
  end
  if found > 0 then
    table.remove(rpc_queue, found)
    return
  end
  for i = 2, rpc_maxclass do
    if rpc_struct == rpc_inclass[i] then
      rpc_inclass[i] = nil
    end
  end
end

function test_call(name, args, callback, class)
  rpc_new(name, args, callback, class, rpc_api_test)
end

function load_result(result, env)
  if debug then
    fill_debug_result(result)
    print_debug()
  end
  env = env or {}
  local func, err = loadin(env, result)
  if func then
    func, err = pcall(func)
  end
  if func then
    if env.error == nil then
      return env
    else
      return env, tostring(env.error)
    end
  else
    return nil, err
  end
end

function ErrorHandler(callback, callbackfailed)
  return function(result, err)
    if result then
      local data, load_err = load_result(result)
      if data then
        if data.error then
          if callbackfailed then
            callbackfailed()
          end
          s = GetMatchedUTF8Text(data.error)
          MessageBox.ShowError(s)
        elseif callback then
          local status, call_err = pcall(callback, data)
          if not status then
            if type(callbackfailed) == "function" then
              callbackfailed()
            end
            print("callback error", call_err)
          end
        end
      else
        if callbackfailed then
          callbackfailed()
        end
        print("load data error", load_err)
      end
    else
      if callbackfailed then
        callbackfailed()
      end
      print("error : invalid interface", err)
    end
  end
end

function safecall(name, args, callback, callbackfailed, class)
  call(name, args, ErrorHandler(callback, callbackfailed), class)
end
