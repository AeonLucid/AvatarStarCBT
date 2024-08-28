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
    "shoulder_l",
    Vector3(30, 0, 30),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "chest",
    Vector3(30, 20, 30),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "hip",
    Vector3(30, 40, -30),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "wrist_l",
    Vector3(10, -10, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "wrist_r",
    Vector3(-10, -10, 20),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "leg_l",
    Vector3(0, 0, 30),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "leg_r",
    Vector3(0, 0, -10),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "knee_l",
    Vector3(0, 0, 30),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "knee_r",
    Vector3(-50, 0, 0),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "ankle_l",
    Vector3(80, 50, -200),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  },
  {
    "ankle_r",
    Vector3(-10, -5, -50),
    Vector3(0, 0, 0),
    kForceSpaceModel,
    NX_FORCE,
    0.25
  }
}
