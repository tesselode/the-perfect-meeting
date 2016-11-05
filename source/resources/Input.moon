baton = require 'lib.baton'

controls =
  left: {'key:left', 'button:dpleft', 'axis:leftx-'}
  right: {'key:right', 'button:dpright', 'axis:leftx+'}
  up: {'key:up', 'button:dpup', 'axis:lefty-'}
  down: {'key:down', 'button:dpdown', 'axis:lefty+'}
  primary: {'key:return', 'button:a'}
  secondary: {'key:escape', 'button:b'}
  pause: {'key:escape', 'button:start'}
return baton.new controls, love.joystick.getJoysticks![1]
