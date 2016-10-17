export lg, lm = love.graphics, love.math

export cargo = require 'lib.cargo'
export conversation = require('lib.talkback').new!
export gamestate = require 'lib.gamestate'
export lume = require 'lib.lume'
export shine = require 'lib.shine'
export timer = require 'lib.timer'

local effect

love.load = ->
  with lg
    .setDefaultFilter 'nearest', 'nearest'
    .setLineStyle 'rough'

  -- todo: make the appropriate sounds loop
  setmetatable _G, {__index: cargo.init 'resources'}
  Font.VcrMedium = Font.Vcr 41

  SoundManager\init!

  with gamestate
    .switch State.Game!
    timer.every 1/60, ->
      Input\update!
      .current!\update!

love.update = (dt) ->
  timer.update dt

love.keypressed = (key) ->
  with gamestate.current!
    \keypressed key if .keypressed
  ScreenManager\toggleFullscreen! if key == 'f4'
  love.event.quit! if key == 'escape'

love.draw = ->
  with gamestate.current!
    \preDraw! if .preDraw
    ScreenManager\draw -> \draw!
