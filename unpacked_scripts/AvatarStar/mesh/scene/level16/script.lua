level:SetMapInfo(1.069, 0.351, 144.4, 114, 1, 0.75)
level:SetMapTexture("ui/MapsAndBG/mapTextures/level16_map_image.dds")
level:AddMesh("level13/scene_as03.mesh")
level:AddMesh("level16/flag_pole.mesh")
level:AddPhysx("level13/scene_as03.mesh")
level:AddPhysx("level16/flag_pole.mesh")
level:AddEdgeMesh("level16/flag_pole.mesh", Vector3(0, 0, 0))
level:AddFlagStickMesh("", 2.317)
level:SetFlagTransform(0, "flag_red.mesh", "flag_blue.mesh", "flag05.skel", "flag", Vector3(4.2, 0.14, 29), Quaternion(0, -4.37114E-8, 0, -1))
level:SetFlagTransform(1, "flag_red.mesh", "flag_blue.mesh", "flag05.skel", "flag", Vector3(-13.32, 4.1, 2.57), Quaternion(0, -4.37114E-8, 0, -1))
level:SetFlagTransform(2, "flag_red.mesh", "flag_blue.mesh", "flag05.skel", "flag", Vector3(13.34, 4.1, -2.57), Quaternion(0, -4.37114E-8, 0, -1))
level:SetFlagTransform(3, "flag_red.mesh", "flag_blue.mesh", "flag05.skel", "flag", Vector3(-4.2, 0.14, -29.8), Quaternion(0, -4.37114E-8, 0, -1))
level:SetSunDirection(0.6, 0.4, 0)
level:SetShadowDirection(0.6, 0.7, 0)
level:SetShadowDistance(5)
level:SetShadowMapSize(1024, 1024)
level:SetFog(1, 43, 336, 0.812, 0.765, 0.957)
level:SetYFog(0, 0, 200, 1, 1, 1)
level:SetLightmapIntensity(2)
level:SetCharacterLightIntensity(1.5)
level:SetAmbientIntensity(0)
level:SetFar(2000)
level:SetNear(0.05)
level:SetCameraPosition(12.4683, 8.5563, -17.0762)
level:SetCameraRotation(0.0165528, -0.979734, -0.0913785, -0.177473)
level:SetFaceToLastPos(false)
level:AddParticle("s_flag_normal", Vector3(4.2, 0.14, 28.9), Vector3(0, 1, 0), 2)
level:AddParticle("s_flag_blue", Vector3(4.2, 0.14, 28.9), Vector3(0, 1, 0), 1)
level:AddParticle("s_flag_red", Vector3(4.2, 0.14, 28.9), Vector3(0, 1, 0), 0)
level:AddParticle("s_flag_normal", Vector3(-13.3, 4.18, 2.57), Vector3(0, 1, 0), 2)
level:AddParticle("s_flag_blue", Vector3(-13.3, 4.18, 2.57), Vector3(0, 1, 0), 1)
level:AddParticle("s_flag_red", Vector3(-13.3, 4.18, 2.57), Vector3(0, 1, 0), 0)
level:AddParticle("s_flag_normal", Vector3(13.34, 4.18, -2.57), Vector3(0, 1, 0), 2)
level:AddParticle("s_flag_blue", Vector3(13.34, 4.18, -2.57), Vector3(0, 1, 0), 1)
level:AddParticle("s_flag_red", Vector3(13.34, 4.18, -2.57), Vector3(0, 1, 0), 0)
level:AddParticle("s_flag_normal", Vector3(-4.2, 0.14, -29.79), Vector3(0, 1, 0), 2)
level:AddParticle("s_flag_blue", Vector3(-4.2, 0.14, -29.79), Vector3(0, 1, 0), 1)
level:AddParticle("s_flag_red", Vector3(-4.2, 0.14, -29.79), Vector3(0, 1, 0), 0)
cg:SetStar(false)
local lev = 0
cg:Set_BLOOM_COMBINE_VECTOR(lev, 2, 0.9)
cg:Set_LUM_ADAPTED_SPEED(lev, 0.65)
cg:Set_BLOOM_COMBINE_VECTOR(lev, 3, 0.45)
cg:Set_MiddleGray(lev, 0.5)
cg:Set_BRIGHT_PASS_THRESHOLD(lev, 0.07)
cg:Set_BRIGHT_PASS_OFFSET(lev, 2)
cg:Set_STAR_COMBINE_VECTOR(lev, 1)
cg:Set_Attenuation(lev, 1)
cg:Set_StarRot(lev, 1)
cg:Set_Sample_Len(lev, 1)
lev = 1
cg:Set_BLOOM_COMBINE_VECTOR(lev, 2, 0.85)
cg:Set_LUM_ADAPTED_SPEED(lev, 0.65)
cg:Set_BLOOM_COMBINE_VECTOR(lev, 3, 0.45)
cg:Set_MiddleGray(lev, 0.5)
cg:Set_BRIGHT_PASS_THRESHOLD(lev, 0.07)
cg:Set_BRIGHT_PASS_OFFSET(lev, 1)
cg:Set_STAR_COMBINE_VECTOR(lev, 1)
cg:Set_Attenuation(lev, 1)
cg:Set_StarRot(lev, 1)
cg:Set_Sample_Len(lev, 1)
level:AddDeadAABB(Vector3(-0.181, -8.746, 44.302), Vector3(17.13, 1.254, 55.928))
level:AddDeadAABB(Vector3(2.181, -4.869, 41.235), Vector3(8.176, 5.773, 45.688))
level:AddDeadAABB(Vector3(-3.313, -5.564, 40.118), Vector3(2.039, 3.425, 49.571))
level:AddDeadAABB(Vector3(-3.465, -8.872, 49.648), Vector3(1.468, -0.186, 53.327))
level:AddDeadAABB(Vector3(-7.036, -4.66, 29.207), Vector3(-4.018, 2.692, 33.46))
level:AddDeadAABB(Vector3(-10.579, -4.66, 15.059), Vector3(-7.588, 2.692, 23.791))
level:AddDeadAABB(Vector3(-1.448, -4.445, 20.827), Vector3(7.33, 2.906, 23.768))
level:AddDeadAABB(Vector3(17.732, -4.916, 21.884), Vector3(20.749, 2.435, 26.137))
level:AddDeadAABB(Vector3(9.905, -4.66, -8.352), Vector3(20.303, 3.838, 3.205))
level:AddDeadAABB(Vector3(10.021, -5.356, -11.098), Vector3(13.7, 2.265, -8.45))
level:AddDeadAABB(Vector3(13.471, -7.459, -11.098), Vector3(18.164, 0.162, -8.45))
level:AddDeadAABB(Vector3(-1.579, -4.66, -0.773), Vector3(4.681, 3.544, 2.407))
level:AddDeadAABB(Vector3(-4.736, -6.788, -2.315), Vector3(1.487, 1.416, 0.611))
level:AddDeadAABB(Vector3(-0.535, -7.975, -2.515), Vector3(4.759, 0.228, -0.801))
level:AddDeadAABB(Vector3(-19.753, -5.671, -3.205), Vector3(-9.976, 2.533, 8.363))
level:AddDeadAABB(Vector3(-13.791, -6.49, 8.435), Vector3(-9.889, 1.713, 11.028))
level:AddDeadAABB(Vector3(-16.822, -8.267, 8.437), Vector3(-12.829, -0.064, 11.144))
level:AddDeadAABB(Vector3(-0.62, -4.916, 8.544), Vector3(3.575, 2.435, 11.628))
level:AddDeadAABB(Vector3(-4.975, -4.916, -12.033), Vector3(-0.302, 2.435, -8.8))
level:AddDeadAABB(Vector3(-7.916, -4.916, -23.93), Vector3(3.271, 2.435, -20.194))
level:AddDeadAABB(Vector3(8.714, -4.916, -24.227), Vector3(11.897, 2.435, -15.032))
level:AddDeadAABB(Vector3(4.09, -4.916, -33.468), Vector3(7.177, 2.435, -28.778))
level:AddDeadAABB(Vector3(-20.959, -4.916, -27.254), Vector3(-17.916, 2.435, -22.247))
level:AddDeadAABB(Vector3(-11.888, -6.494, -62.922), Vector3(0.549, 0.857, -44.131))
level:AddDeadAABB(Vector3(-8.098, -3.147, -49.709), Vector3(0.609, 4.204, -41.312))
level:AddDeadAABB(Vector3(-2.04, -3.147, -49.696), Vector3(3.316, 4.204, -40.2))
level:AddDeadAABB(Vector3(0.516, -3.585, -52.865), Vector3(3.331, -0.209, -50.049))
level:AddDeadAABB(Vector3(12.782, -0.621, 3.265), Vector3(17.421, 1.334, 4.969))
level:AddDeadAABB(Vector3(12.764, 3.385, 1.381), Vector3(15.703, 5.34, 2.854))
level:AddDeadAABB(Vector3(19.423, -0.67, 20.125), Vector3(20.8, 1.286, 21.755))
level:AddDeadAABB(Vector3(-15.744, 1.918, -2.826), Vector3(-12.805, 5.34, -1.353))
level:AddDeadAABB(Vector3(-17.448, -0.621, -4.967), Vector3(-12.813, 1.334, -3.263))
level:AddDeadAABB(Vector3(-20.785, -0.67, -22.117), Vector3(-19.408, 1.286, -20.487))
level:AddDeadAABB(Vector3(-3.176, -2.109, 0.949), Vector3(-0.237, 1.313, 2.501))
