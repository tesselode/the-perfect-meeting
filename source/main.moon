export lg = love.graphics

export baton = require 'lib.baton'
export gamestate = require 'lib.gamestate'
export shine = require 'lib.shine'
export talkback = require 'lib.talkback'
export timer = require 'lib.timer'

export conversation = talkback.new!

controls =
  left: {'key:left'}
  right: {'key:right'}
  up: {'key:up'}
  down: {'key:down'}
export input = baton.new controls

export Image = {
  Logo: lg.newImage 'image/logo.png'
}

export Font = {
  VCR: lg.newFont 'font/vcr osd mono.ttf', 42
}

export Sound = {
  Hum: with love.audio.newSource 'sound/hum.wav'
    \setLooping true
}

local effect

generateShaders = ->
  scale = math.min lg.getWidth! / WIDTH, lg.getHeight! / HEIGHT

  glow = shine.glowsimple {sigma: 1}
  scalines = shine.scanlines {pixel_size: 4 * scale}
  crt = shine.crt!
  vignette = shine.vignette {radius: 1.25, softness: 1, opacity: .25}
  grain = shine.filmgrain {opacity: .2, grainsize: scale}

  effect = glow\chain scalines\chain crt\chain vignette\chain grain

generateShaders!

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

  if key == 'f4'
    love.window.setFullscreen not love.window.getFullscreen!
    generateShaders!

love.draw = ->
  with lg
    effect\draw ->
      .push!
      scale = math.min .getWidth! / WIDTH, .getHeight! / HEIGHT
      .translate (.getWidth! - WIDTH * scale) / 2, 0
      .scale scale
      gamestate.current!\draw!
      .pop!
