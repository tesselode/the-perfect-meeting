lg = love.graphics

timer = require 'lib.timer'

local logo

love.load = ->
  logo =
    x: 640/2
    y: 480/2
    w: 128
    h: 96
    vx: love.math.random! > .5 and -2 or 2
    vy: love.math.random! > .5 and -2 or 2

  timer.every 1/60, ->
    with logo
      .x += .vx
      .y += .vy
      .vx = -.vx if .x <= 0 or .x + .w >= 640
      .vy = -.vy if .y <= 0 or .y + .h >= 480

love.update = (dt) ->
  timer.update dt

love.keypressed = (key) ->
  love.event.quit! if key == 'escape'

  with logo
    .x -= 4 if key == 'left'
    .x += 4 if key == 'right'
    .y -= 4 if key == 'up'
    .y += 4 if key == 'down'

love.draw = ->
  lg.setColor 255, 255, 255
  with logo
    lg.rectangle 'fill', .x, .y, .w, .h
