export *

lg, lm, lf = love.graphics, love.math, love.filesystem

--oldprint = lg.print
--lg.print = (text, x, y) ->
--  color = {lg.getColor!}
--  lg.setColor 0, 0, 0
--  oldprint text, x - 2, y - 2
--  oldprint text, x, y - 2
--  oldprint text, x + 2, y - 2
--  oldprint text, x - 2, y
--  oldprint text, x + 2, y
--  oldprint text, x - 2, y + 2
--  oldprint text, x, y + 2
--  oldprint text, x + 2, y + 2
--  lg.setColor color
--  oldprint text, x, y

lg.printc = (text, x, y) ->
  x -= lg.getFont!\getWidth(text) / 2
  lg.print text, x, y

lg.printr = (text, x, y) ->
  x -= lg.getFont!\getWidth(text)
  lg.print text, x, y

with lg
  .setDefaultFilter 'nearest', 'nearest'
  .setLineStyle 'rough'

cargo = require 'lib.cargo'
conversation = require('lib.talkback').new!
gamestate = require 'lib.gamestate'
inspect = require 'lib.inspect'
lume = require 'lib.lume'
ripple = require 'lib.ripple'
serialize = require 'lib.ser'
shine = require 'lib.shine'
timer = require 'lib.timer'
vector = require 'lib.vector'

Class = cargo.init 'resources/Class'
Image = cargo.init 'resources/Image'
State = cargo.init 'resources/State'
Menu = cargo.init 'resources/Menu'
Font =
  VcrSmall: love.graphics.newFont 'resources/Font/Vcr.ttf', 21
  VcrMedium: love.graphics.newFont 'resources/Font/Vcr.ttf', 42
Tag =
  Sfx: ripple.newTag!
  Music: ripple.newTag!
  Master: ripple.newTag!
Sound =
  BounceBottom: ripple.newSound 'resources/Sound/BounceBottom.ogg',
    tags: {Tag.Sfx, Tag.Master}
  BounceSide: ripple.newSound 'resources/Sound/BounceSide.ogg',
    tags: {Tag.Sfx, Tag.Master}
  BounceTop: ripple.newSound 'resources/Sound/BounceTop.ogg',
    tags: {Tag.Sfx, Tag.Master}
  Corner: ripple.newSound 'resources/Sound/Corner.ogg',
    tags: {Tag.Sfx, Tag.Master}
  Impact: ripple.newSound 'resources/Sound/Impact.ogg',
    tags: {Tag.Sfx, Tag.Master}
  Button: ripple.newSound 'resources/Sound/Button.ogg',
    tags: {Tag.Sfx, Tag.Master}
  Hum: ripple.newSound 'resources/Sound/Hum.ogg',
    loop: true
    tags: {Tag.Music, Tag.Master}
  Office: ripple.newSound 'resources/Sound/Office.ogg',
    loop: true
    tags: {Tag.Music, Tag.Master}
  Dream: ripple.newSound 'resources/Sound/Dream.ogg',
    loop: true
    length: '50s'
    tags: {Tag.Music, Tag.Master}
Input = require 'resources.Input'
ScreenManager = require 'resources.ScreenManager'
SoundManager = require 'resources.SoundManager'
SaveManager = require 'resources.SaveManager'
ScreenManager\apply!
