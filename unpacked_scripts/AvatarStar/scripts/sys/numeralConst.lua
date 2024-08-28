module("NumeralConst", package.seeall)
local occ_num = {
  1,
  1.22,
  0.83
}

function CharacterTransform(char_type, char_para, occ_type)
  local char_eff = 0
  if char_type == "\187\164\188\215" then
    char_eff = string.format("%.1f", (1 - 1 / (1 + char_para ^ 1 / 698.92473)) * 100)
  elseif char_type == "\187\238\193\166" then
    char_eff = string.format("%.1f", 0.154 * char_para ^ 1)
  elseif char_type == "\187\214\184\180\193\166" then
    char_eff = math.floor(0.61538 * char_para ^ 1)
  elseif char_type == "\196\205\193\166" then
    char_eff = math.floor(3.29077 * char_para ^ 1 * occ_num[occ_type])
  end
  return char_eff
end

max_stone_combine = 3
box_prize_num_max = 99
lottery_prize_num_max = 240
