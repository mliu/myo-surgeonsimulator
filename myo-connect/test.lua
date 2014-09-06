scriptId = 'com.michaelyliu.test'

defaultPitch = 0
begin = myo.getTimeMilliseconds()
delay = 0
SHUTTLE_PERIOD = 5000
ACTION_PERIOD = 200
pitch_running_avg = 0
yaw_running_avg = 0
roll_running_avg = 0
ROLL_AVG = 0
YAW_AVG = 0
PITCH_AVG = 0
PITCH_COUNT = 0
grab = false

function onPoseEdge(pose, edge)
  if pose == "fist" and edge == "on" then
    if not grab then
      myo.keyboard("a", "down")
      myo.keyboard("w", "down")
      myo.keyboard("e", "down")
      myo.keyboard("r", "down")
      myo.keyboard("space", "down")
      myo.debug("grab")
      grab = true
    else
      myo.keyboard("a", "up")
      myo.keyboard("w", "up")
      myo.keyboard("e", "up")
      myo.keyboard("r", "up")
      myo.keyboard("space", "up")
      myo.debug("ungrab")
      grab = false
    end
  end
end

function onPeriodic()
  pitch_running_avg = pitch_running_avg + myo.getPitch()
  yaw_running_avg = yaw_running_avg + myo.getYaw()
  roll_running_avg = roll_running_avg + myo.getRoll()
  PITCH_COUNT = PITCH_COUNT + 1
  ROLL_AVG = roll_running_avg / PITCH_COUNT
  YAW_AVG = yaw_running_avg / PITCH_COUNT
  PITCH_AVG = pitch_running_avg / PITCH_COUNT

  myo.keyboard("left_control", "up")
  myo.keyboard("left_alt", "up")
  if myo.getPitch() > PITCH_AVG + .5 then
    myo.keyboard("left_control", "down")
    myo.keyboard("left_alt", "down")
    myo.keyboard("8", "press")
    myo.keyboard("left_control", "up")
    myo.keyboard("left_alt", "up")
  elseif myo.getPitch() < PITCH_AVG - .5 then
    myo.keyboard("left_control", "down")
    myo.keyboard("left_alt", "down")
    myo.keyboard("7", "press")
    myo.keyboard("left_control", "up")
    myo.keyboard("left_alt", "up")      
  end

  if myo.getYaw() > YAW_AVG + .3 then
    myo.keyboard("left_control", "down")
    myo.keyboard("left_alt", "down")
    myo.keyboard("9", "press")
    myo.keyboard("left_control", "up")
    myo.keyboard("left_alt", "up")
  elseif myo.getYaw() < YAW_AVG - .2 then
    myo.keyboard("left_control", "down")
    myo.keyboard("left_alt", "down")
    myo.keyboard("0", "press")
    myo.keyboard("left_control", "up")
    myo.keyboard("left_alt", "up")
  end
end

function onForegroundWindowChange(app, title)
  myo.debug(title)
  return title == "Surgeon Simulator 2013"
end

function activeAppName()
  return "Output Everything"
end

function onActiveChange(isActive)
  myo.debug("onActiveChange")
end