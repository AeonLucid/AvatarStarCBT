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
    "head",
    Vector3(0, 300, 500),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.1
  },
  {
    "chest",
    Vector3(0, 0, 100),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.1
  },
  {
    "hip",
    Vector3(0, 0, -100),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.15
  },
  {
    "wrist_l",
    Vector3(0, -50, 20),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.55
  },
  {
    "wrist_r",
    Vector3(-50, -50, 20),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.55
  },
  {
    "ankle_l",
    Vector3(10, 0, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "ankle_r",
    Vector3(0, 0, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.15
  },
  {
    "knee_l",
    Vector3(40, -80, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "knee_r",
    Vector3(-10, -80, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  }
}
