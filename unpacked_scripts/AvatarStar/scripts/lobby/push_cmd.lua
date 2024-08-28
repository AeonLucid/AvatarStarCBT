module("PushCmd", package.seeall)
local state = ptr_cast(game.CurrentState)
local money = {}

function SubscribeMoney(k, v)
  money[k] = v
end

function FireMoney(gp, mb, tb)
  for k, v in pairs(money) do
    v(gp, mb, tb)
  end
end

function GetGP()
  return ComFuc.globalGP
end

function GetMB()
  return ComFuc.globalMB
end

function GetTB()
  return ComFuc.globalTB
end

function GetLevel()
  return ComFuc.globalLV
end

function GetExp()
  return ComFuc.globalEXP
end

function GetExpP()
  return ComFuc.globalEXPP
end

function GetExpN()
  return ComFuc.globalEXPN
end

local level = {}

function SubscribeLevel(k, v)
  level.k = v
end

function FireLevel(lv)
  for k, v in pairs(level) do
    v(lv)
  end
end

cmdTable = {
  updatePlayer = function(data)
    ComFuc.globalGP = data.gp or ComFuc.globalGP
    ComFuc.globalMB = data.mb or ComFuc.globalMB
    ComFuc.globalTB = data.tb or ComFuc.globalTB
    ComFuc.globalLV = data.lv
    ComFuc.globalExp = data.exp
    ComFuc.globalEXPP = data.expPercent
    ComFuc.globalEXPN = data.expNextLevel
    Lobby.ui.role_dianbi.Text = " " .. ComFuc.globalMB
    Lobby.ui.role_gbi.Text = " " .. ComFuc.globalGP
    Lobby.ui.role_mbi.Text = " " .. ComFuc.globalTB
    Lobby.ui.role_level.Text = ComFuc.globalLV
    ExpBar.SetExpBar(Lobby.ui.bar_exp, Lobby.ui.bar_exp_c, Lobby.ui.bar_exp_l, data.exp, data.expNextLevel)
    FireMoney(ComFuc.globalGP, ComFuc.globalMB, ComFuc.globalTB)
    FireLevel(data.lv)
  end,
  winRollPlayer = function(data)
    if Balance then
    end
  end,
  missionListChanged = function(data)
    ComFuc.TestHasAwardNoReceive()
    if Mission and Mission.Active() then
      Mission.RequestSMList({
        t = data.type .. ";"
      })
    end
  end,
  newMail = function(data)
    ComFuc.globalNewMail = true
    Lobby.SetNewMail()
  end
}

function OnServerCmd(sender, args)
  local data, load_err = rpc.load_result(args.Details)
  if data then
    if data.cmd and cmdTable[data.cmd] then
      cmdTable[data.cmd](data)
    end
  else
    print(load_err)
  end
end
