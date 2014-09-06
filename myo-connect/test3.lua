scriptId = 'com.michaelyliu.test'

defaultPitch = 0
begin = myo.getTimeMilliseconds()
SHUTTLE_PERIOD = 5000
pitch_running_avg = 0
yaw_running_avg = 0
roll_running_avg = 0
ROLL_AVG = 0
YAW_AVG = 0
PITCH_AVG = 0
PITCH_COUNT = 0
grab = false
roll = false

function onPoseEdge(pose, edge)
  if pose == "fist" and edge == "on" then
    if not grab then
      myo.debug("grab")
      grab = true
    else
      myo.debug("ungrab")
      grab = false
    end
  end

  if pose == "thumbToPinky" then
    if not roll then
      myo.debug("rotate")
      roll = true
    else
      myo.debug("unrotate")
      roll = false
    end
  end
end

function onPeriodic()
  local now = myo.getTimeMilliseconds()
  if (now - begin) < SHUTTLE_PERIOD then
    myo.debug("1")
    pitch_running_avg = pitch_running_avg + myo.getPitch()
    yaw_running_avg = yaw_running_avg + myo.getYaw()
    roll_running_avg = roll_running_avg + myo.getRoll()
    PITCH_COUNT = PITCH_COUNT + 1
  elseif PITCH_AVG == 0 then
    myo.debug("2")
    ROLL_AVG = roll_running_avg / PITCH_COUNT
    YAW_AVG = yaw_running_avg / PITCH_COUNT
    PITCH_AVG = pitch_running_avg / PITCH_COUNT
  end

  if not (PITCH_AVG == 0) then
    if myo.getPitch() > PITCH_AVG + .5 then
      myo.debug("up")
    elseif myo.getPitch() < PITCH_AVG - .5 then
      myo.debug("down")     
    end

    if myo.getYaw() > YAW_AVG + .3 then
      myo.debug("right")
    elseif myo.getYaw() < YAW_AVG - .2 then
      myo.debug("left")
    end
  end      
  -- if myo.getRoll() > ROLL_AVG + .3 then
  --   myo.debug("roll right")
  -- elseif myo.getRoll() < ROLL_AVG - .3 then
  --   myo.debug("roll left")
  -- end   
end

function onForegroundWindowChange(app, title)
  myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
  return true
end

function activeAppName()
  return "Output Everything"
end

function onActiveChange(isActive)
  myo.debug("onActiveChange")
end