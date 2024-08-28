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
    Vector3(-200, 200, 150),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.15
  },
  {
    "chest",
    Vector3(0, 0, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.1
  },
  {
    "hip",
    Vector3(0, 0, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "wrist_l",
    Vector3(-10, 0, 20),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.15
  },
  {
    "wrist_r",
    Vector3(-10, -10, 20),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.15
  },
  {
    "ankle_l",
    Vector3(50, -50, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.35
  },
  {
    "ankle_r",
    Vector3(-20, -50, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  }
}
