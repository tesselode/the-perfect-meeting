export lg, lm = love.graphics, love.math

export cargo = require 'lib.cargo'
export conversation = require('lib.talkback').new!
export gamestate = require 'lib.gamestate'
export lume = require 'lib.lume'
export ripple = require 'lib.ripple'
export shine = require 'lib.shine'
export timer = require 'lib.timer'

local effect

love.load = ->
  with lg
    .setDefaultFilter 'nearest', 'nearest'
    .setLineStyle 'rough'

  require 'resources'

  with gamestate
    .switch State.Game!
    timer.every 1/60, ->
      Input\update!
      .current!\update!

love.update = (dt) ->
  timer.update dt
  SoundManager\update dt

love.keypressed = (key) ->
  with gamestate.current!
    \keypressed key if .keypressed
  ScreenManager\toggleFullscreen! if key == 'f4'
  love.event.quit! if key == 'escape'

love.draw = ->
  with gamestate.current!
    \preDraw! if .preDraw
    ScreenManager\draw -> \draw!
