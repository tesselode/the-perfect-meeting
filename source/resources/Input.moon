baton = require 'lib.baton'

controls =
  left: {'key:left'}
  right: {'key:right'}
  up: {'key:up'}
  down: {'key:down'}
return baton.new controls
