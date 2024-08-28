lg:Set4PointLightPos(Vector4(0, 0, 0, 0), Vector4(1.4, 1.4, 1, 0), Vector4(-1.4, -1.4, -1, 0), Vector4(-2, 1.4, 0.5, 0))
lg:Set4PointLightColor(Vector4(0, 0, 0, 0), Vector4(0.4, 0.2, 0, 1.6), Vector4(0.5, 0, 0.5, 0.2), Vector4(0.1, 0, 0.1, 0.5))
local cid = 6
local r1 = 2
local r2 = 16
local theta = 5
local offset = Vector3(0, -0.75, 0)
lg:SetREVanPos(cid, offset + Vector3(0, -r1 * math.sin(theta * math.pi / 180), -r1 * math.cos(theta * math.pi / 180)))
lg:SetRECameraPitch(cid, -theta)
lg:SetRECameraPos(cid, Vector3(0, r2 * math.sin(theta * math.pi / 180), r2 * math.cos(theta * math.pi / 180)))
lg:SetREFov(cid, 10)
cid = 7
r1 = 0
r2 = 16
theta = 5
offset = Vector3(0, -0.75, 0)
lg:SetREVanPos(cid, offset + Vector3(0, -r1 * math.sin(theta * math.pi / 180), -r1 * math.cos(theta * math.pi / 180)))
lg:SetRECameraPitch(cid, -theta)
lg:SetRECameraPos(cid, Vector3(0, r2 * math.sin(theta * math.pi / 180), r2 * math.cos(theta * math.pi / 180)))
lg:SetREFov(cid, 10)
cid = 4
lg:SetREVanPos(cid, Vector3(0, -0.9, 0))
lg:SetRECameraPos(cid, Vector3(0, 0, 140))
lg:SetREFov(cid, 1)
cid = 0
lg:SetREVanPos(cid, Vector3(0, 0, 0))
cid = 1
lg:SetREVanPos(cid, Vector3(0, -0.12, 0))
cid = 3
lg:SetREVanPos(cid, Vector3(0, -0, 0))
cid = 5
lg:SetREVanPos(cid, Vector3(0.03, -1.05, 55))
lg:SetRECameraPos(cid, Vector3(0, 0, 110))
lg:SetREFov(cid, 1)
