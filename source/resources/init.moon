export *

lg, lm = love.graphics, love.math

with lg
  .setDefaultFilter 'nearest', 'nearest'
  .setLineStyle 'rough'

cargo = require 'lib.cargo'
conversation = require('lib.talkback').new!
gamestate = require 'lib.gamestate'
lume = require 'lib.lume'
ripple = require 'lib.ripple'
shine = require 'lib.shine'
timer = require 'lib.timer'

Class = cargo.init 'resources/Class'
Image = cargo.init 'resources/Image'
State = cargo.init 'resources/State'
Font =
  VcrMedium: love.graphics.newFont 'resources/Font/Vcr.ttf', 41
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
  Hum: ripple.newSound 'resources/Sound/Hum.ogg',
    loop: true
    tags: {Tag.Music, Tag.Master}
  Office: ripple.newSound 'resources/Sound/Office.ogg',
    loop: true
    tags: {Tag.Music, Tag.Master}
  Dream: ripple.newSound 'resources/Sound/Dream.ogg',
    loop: true
    tags: {Tag.Music, Tag.Master}
Input = require 'resources.Input'
ScreenManager = require 'resources.ScreenManager'
SoundManager = require 'resources.SoundManager'
