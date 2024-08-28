module("IconsF", package.seeall)
GameTypeIcons = {
  kTeam = Gui.Icon("/ui/skinF/skin_humaninfo_closebutton_normal.tga"),
  kExplode = Gui.Icon("/ui/skinF/skin_humaninfo_closebutton_normal.tga"),
  kBanner = Gui.Icon("/ui/skinF/skin_humaninfo_closebutton_normal.tga"),
  kZombie = Gui.Icon("/ui/skinF/skin_humaninfo_closebutton_normal.tga"),
  kTeamDead = Gui.Icon("/ui/skinF/skin_icon_tuanzhan.tga"),
  kTreasure = Gui.Icon("/ui/skinF/skin_humaninfo_closebutton_normal.tga"),
  kContention = Gui.Icon("/ui/skinF/skin_icon_zhandian.tga"),
  kHero = Gui.Icon("/ui/skinF/skin_humaninfo_closebutton_normal.tga"),
  kOccupy = Gui.Icon("/ui/skinF/skin_icon_duoqi.tga"),
  kSnatch = Gui.Icon("/ui/skinF/skin_icon_duobao.tga"),
  kNovice = Gui.Icon("/ui/skinF/skin_guild_icon03.tga")
}
RoomStatusIcons = {
  PlayingN = Gui.Icon("/ui/skinF/skin_roomlist_icon01.tga"),
  PlayingA = Gui.Icon("/ui/skinF/skin_roomlist_icon01.tga"),
  WaitingN = Gui.Icon("/ui/skinF/skin_roomlist_icon04.tga"),
  WaitingA = Gui.Icon("/ui/skinF/skin_roomlist_icon04.tga"),
  FullN = Gui.Icon("/ui/skinF/skin_roomlist_icon02.tga"),
  FullA = Gui.Icon("/ui/skinF/skin_roomlist_icon02.tga"),
  PasswordN = Gui.Icon("/ui/skinF/skin_roomlist_icon03.tga"),
  PasswordA = Gui.Icon("/ui/skinF/skin_roomlist_icon03.tga")
}
PlayerStatusIcons = {
  HostN = Gui.Icon("/ui/skinF/skin_room_icon_host.tga"),
  HostA = Gui.Icon("/ui/skinF/skin_room_icon_host.tga"),
  ReadyN = Gui.Icon("/ui/skinF/skin_room_icon_ready.tga"),
  ReadyA = Gui.Icon("/ui/skinF/skin_room_icon_ready.tga"),
  PlayingN = Gui.Icon("/ui/skinF/skin_room_icon_play.tga"),
  PlayingA = Gui.Icon("/ui/skinF/skin_room_icon_play.tga")
}
PlayerCareerIcons = {
  Gui.Icon("/ui/skinF/skin_common_icon01.tga"),
  Gui.Icon("/ui/skinF/skin_common_icon02.tga"),
  Gui.Icon("/ui/skinF/skin_common_icon03.tga")
}
SocialityStatusIcons = {
  HeadBg = Gui.Icon("/ui/skinF/skin_common_background06.tga"),
  OnlineN = Gui.Icon("/ui/skinF/skin_gam_humanicon_disabled.tga"),
  OnlineA = Gui.Icon("/ui/skinF/skin_gam_humanicon_normal.tga"),
  PlayingN = nil,
  PlayingA = Gui.Icon("/ui/skinF/skin_gam_playicon.tga")
}
MailStatusIcons = {
  Gift = Gui.Icon("/ui/skinF/skin_mail_icon04.tga"),
  Warning = Gui.Icon("/ui/skinF/skin_mail_icon03.tga"),
  Box = Gui.Icon("/ui/skinF/skin_mail_icon01.tga"),
  MailOn = Gui.Icon("/ui/skinF/skin_mail_icon05.tga"),
  MailOff = Gui.Icon("/ui/skinF/skin_mail_icon06.tga")
}
local LobbySlotIcons = {}

function GetLobbySlotIcon(resource_name)
  if not LobbySlotIcons[resource_name] then
    local icon = Gui.Icon("/ui/SkinF/lobby/" .. resource_name .. ".tga")
    if not icon then
      print("cannot find icon: " .. resource_name)
    else
      LobbySlotIcons[resource_name] = icon
    end
  end
  return LobbySlotIcons[resource_name]
end

local LobbySlotDisableIcons = {}

function GetLobbySlotDisableIcon(resource_name)
  if not LobbySlotDisableIcons[resource_name] then
    LobbySlotDisableIcons[resource_name] = Gui.Icon("/ui/SkinF/lobby/" .. resource_name .. "_disabled.tga")
  end
  return LobbySlotDisableIcons[resource_name]
end

GpIcon = Gui.Icon("/ui/skinF/skin_common_jinbi.tga")
MbIcon = Gui.Icon("/ui/skinF/skin_common_xingbi.tga")
TbIcon = Gui.Icon("/ui/skinF/skin_common_xunzhang.tga")
BigGpIcon = Gui.Icon("/ui/skinF/skin_common_icon_gold01.tga")
BigMbIcon = Gui.Icon("/ui/skinF/xingbi.tga")
BigTbIcon = Gui.Icon("/ui/skinF/xunzhang.tga")
