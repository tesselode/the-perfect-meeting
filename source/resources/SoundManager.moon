local dreamMusicTimer
local dreamMusicTween

SoundManager =
  init: =>
    Sound.Hum\play!
    Sound.Office\play!

    listeners = with conversation\newGroup!
      \listen 'navigate menu', ->
        Sound.Button\stop!
        Sound.Button\play
          volume: .25 + .25*love.math.random!
          pitch: .975 + .05*love.math.random!

      \listen 'won', ->
        timer.cancel dreamMusicTween if dreamMusicTween
        Sound.Impact\play!
        Sound.Hum.volume.v = 0
        Sound.Office.volume.v = 0
        dreamMusicTimer = timer.after 1.5, ->
          Sound.Dream.volume.v = 1
          Sound.Dream\stop!
          Sound.Dream\play!

      \listen 'show timing indicator', -> Sound.Corner\play! unless TRAILER

      \listen 'bounce', (side) ->
        unless conversation\say 'get win state'
          Sound.BounceSide\play! if side == 'left' or side == 'right'
          Sound.BounceTop\play! if side == 'top'
          Sound.BounceBottom\play! if side == 'bottom'

      \listen 'return to title', ->
        timer.cancel dreamMusicTimer if dreamMusicTimer
        timer.cancel dreamMusicTween if dreamMusicTween
        dreamMusicTween = timer.tween 5, Sound.Dream.volume, {v: 0}, 'out-expo', ->
          Sound.Dream\stop!
        timer.tween 1, Sound.Hum.volume, {v: 1}
        timer.tween 1, Sound.Office.volume, {v: 1}

  update: (dt) => sound\update dt for _, sound in pairs Sound

SoundManager\init!
SoundManager
