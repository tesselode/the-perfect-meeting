baton = require 'lib.baton'

controls =
  left: {'key:left', 'button:dpleft', 'axis:leftx-'}
  right: {'key:right', 'button:dpright', 'axis:leftx+'}
  up: {'key:up', 'button:dpup', 'axis:lefty-'}
  down: {'key:down', 'button:dpdown', 'axis:lefty+'}
  primary: {'key:x', 'button:a'}
return baton.new controls, love.joystick.getJoysticks![1]
