export lg = love.graphics

export baton = require 'lib.baton'
export gamestate = require 'lib.gamestate'
export timer = require 'lib.timer'

controls =
  left: {'key:left'}
  right: {'key:right'}
  up: {'key:up'}
  down: {'key:down'}
export input = baton.new controls

export Image = {
  Logo: lg.newImage 'image/logo.png'
}

Game = require 'state.game'

love.load = ->
  with lg
    .setDefaultFilter 'nearest', 'nearest'
    .setLineStyle 'rough'

  with gamestate
    .switch Game!
    timer.every 1/60, ->
      input\update!
      .current!\update!

love.update = (dt) ->
  timer.update dt

love.keypressed = (key) ->
  love.event.quit! if key == 'escape'

love.draw = ->
  with lg
    .push!
    .scale math.min .getWidth! / WIDTH, .getHeight! / HEIGHT
    gamestate.current!\draw!
    .pop!
