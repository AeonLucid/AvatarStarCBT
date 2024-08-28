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
    Vector3(50, 100, -100),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.2
  },
  {
    "hip",
    Vector3(150, 0, -200),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.2
  },
  {
    "wrist_l",
    Vector3(-50, 0, 50),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "wrist_r",
    Vector3(-25, 0, 50),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "ankle_l",
    Vector3(50, 0, 50),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "ankle_r",
    Vector3(-50, 0, 50),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  }
}
