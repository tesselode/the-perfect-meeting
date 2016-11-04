export Class = cargo.init 'resources/class'
export Image = cargo.init 'resources/Image'
export State = cargo.init 'resources/State'
export Font = {
  VcrMedium: love.graphics.newFont('resources/Font/Vcr.ttf', 41)
}
export Tag = {
  Sfx: ripple.newTag!
  Music: ripple.newTag!
  Master: ripple.newTag!
}
export Sound = {
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
}

export Input = require 'resources.Input'
export ScreenManager = require 'resources.ScreenManager'
export SoundManager = require 'resources.SoundManager'
SoundManager\init!
