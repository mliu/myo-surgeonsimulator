scriptId = 'com.michaelyliu.test'

function onPoseEdge(pose, edge)
end

function onPeriodic()
   myo.debug(myo.getYaw())
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