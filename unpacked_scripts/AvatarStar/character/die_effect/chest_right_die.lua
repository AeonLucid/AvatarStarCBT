local NX_FORCE = 0
local NX_IMPULSE = 1
local NX_VELOCITY_CHANGE = 2
local NX_SMOOTH_IMPULSE = 3
local NX_SMOOTH_VELOCITY_CHANGE = 4
local NX_ACCELERATION = 5
local kForceSpaceLocal = 0
local kForceSpaceModel = 1
local kForceSpaceWorld = 2
force_set = {
  {
    "chest",
    Vector3(100, 400, -200),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.2
  },
  {
    "hip",
    Vector3(50, 50, -50),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.15
  },
  {
    "wrist_l",
    Vector3(50, 0, 100),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "wrist_r",
    Vector3(-50, -50, 100),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "ankle_l",
    Vector3(50, -30, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.43
  },
  {
    "ankle_r",
    Vector3(-50, -30, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.43
  }
}
