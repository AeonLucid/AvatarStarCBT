module("LevelUpTip", package.seeall)
local taskList = {
  [1] = {
    {
      true,
      GetUTF8Text("id_mission_level_01") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1000")
    },
    {
      true,
      GetUTF8Text("id_mission_level_01") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1001")
    },
    {
      true,
      GetUTF8Text("id_mission_level_01") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1002")
    },
    {
      true,
      GetUTF8Text("id_mission_level_01") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3055")
    }
  },
  [2] = {
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3012")
    },
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3016")
    },
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3017")
    },
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3018")
    },
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3013")
    },
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3014")
    },
    {
      true,
      GetUTF8Text("id_mission_level_02") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3015")
    }
  },
  [3] = {
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1003")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1015")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1017")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1019")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3019")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3020")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3021")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3022")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3023")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3024")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3056")
    },
    {
      true,
      GetUTF8Text("id_mission_level_03") .. " " .. GetUTF8Text("UI_mission_Quest_Name_2000")
    }
  },
  [4] = {
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3025")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3027")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3028")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3029")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3031")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3032")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3033")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3038")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_2001")
    },
    {
      true,
      GetUTF8Text("id_mission_level_04") .. " " .. GetUTF8Text("UI_mission_Quest_Name_2002")
    }
  },
  [5] = {
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3034")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3030")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3035")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3036")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3037")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3039")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3040")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3041")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3042")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_1018")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_2003")
    },
    {
      true,
      GetUTF8Text("id_mission_level_05") .. " " .. GetUTF8Text("UI_mission_Quest_Name_2004")
    }
  },
  [6] = {
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3043")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3044")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3051")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3045")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3052")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3046")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3047")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3048")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3049")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3054")
    },
    {
      true,
      GetUTF8Text("id_mission_level_06") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3050")
    }
  },
  [10] = {
    {
      true,
      GetUTF8Text("id_mission_level_10") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3053")
    }
  },
  [11] = {
    {
      true,
      GetUTF8Text("id_mission_level_11") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3057")
    },
    {
      true,
      GetUTF8Text("id_mission_level_11") .. " " .. GetUTF8Text("UI_mission_Quest_Name_3058")
    }
  }
}
local functionList = {
  [5] = {
    {
      true,
      "skin_menu_enhance.tga",
      "skin_menu_enhance_01.tga"
    }
  },
  [7] = {
    {
      true,
      "skin_menu_tanbao.tga",
      "skin_menu_tanbao_01.tga"
    }
  }
}
local mapList = {}

function GetNewTaskList(level)
  return taskList[level]
end

function GetNewFunctionList(level)
  return functionList[level]
end

function GetNewMapList(level)
  return mapList[level]
end

function GetPublicList(level)
  return publicList[level]
end
