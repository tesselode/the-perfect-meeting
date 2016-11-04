local dreamMusicTimer
local dreamMusicTween

SoundManager =
  init: =>
    Sound.Hum\play!
    Sound.Office\play!

    listeners = with conversation\newGroup!
      \listen 'won', ->
        Sound.Impact\play!
        Sound.Hum\stop!
        Sound.Office\stop!
        dreamMusicTimer = timer.after 1.5, ->
          Sound.Dream.volume.v = 0
          dreamMusicTween = timer.tween 5, Sound.Dream.volume, {v: 1}
          Sound.Dream\play!

      \listen 'show timing indicator', -> Sound.Corner\play!

      \listen 'bounce', (side) ->
        unless conversation\say 'get win state'
          Sound.BounceSide\play! if side == 'left' or side == 'right'
          Sound.BounceTop\play! if side == 'top'
          Sound.BounceBottom\play! if side == 'bottom'

      \listen 'return to title', ->
        timer.cancel dreamMusicTimer if dreamMusicTimer
        timer.cancel dreamMusicTween if dreamMusicTween
        timer.tween 1, Sound.Dream.volume, {v: 0}, 'linear', ->
          Sound.Dream\stop!
        Sound.Hum.volume.v = 0
        Sound.Office.volume.v = 0
        Sound.Hum\play!
        Sound.Office\play!
        timer.tween 1, Sound.Hum.volume, {v: 1}
        timer.tween 1, Sound.Office.volume, {v: 1}

  update: => sound\update 1/60 for _, sound in pairs Sound

SoundManager\init!
SoundManager
