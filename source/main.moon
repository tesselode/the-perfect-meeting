export lg = love.graphics

export cargo = require 'lib.cargo'
export conversation = require('lib.talkback').new!
export gamestate = require 'lib.gamestate'
export shine = require 'lib.shine'
export timer = require 'lib.timer'

local effect

love.load = ->
  with lg
    .setDefaultFilter 'nearest', 'nearest'
    .setLineStyle 'rough'

  setmetatable _G, {__index: cargo.init 'resources'}
  Font.VcrMedium = Font.Vcr 41

  SoundManager\init!

  with gamestate
    .switch State.Game!
    timer.every 1/60, ->
      input\update!
      .current!\update!

love.update = (dt) ->
  timer.update dt

love.keypressed = (key) ->
  ScreenManager\toggleFullscreen! if key == 'f4'
  love.event.quit! if key == 'escape'

love.draw = -> ScreenManager\draw -> gamestate.current!\draw!
