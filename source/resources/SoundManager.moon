SoundManager =
  init: =>
    listeners = with conversation\newGroup!
      \listen 'game start', ->
        Sound.Hum\play!
        Sound.Office\play!

      \listen 'corner bounce', (time) ->
        if time == 0
          Sound.Impact\play!
          Sound.Hum\stop!
          Sound.Office\stop!
          timer.after 1.5, ->
            Sound.Dream.volume.v = 0
            timer.tween 5, Sound.Dream.volume, {v: 1}
            Sound.Dream\play!

      \listen 'show timing indicator', -> Sound.Corner\play!

      \listen 'bounce', (side) ->
        unless conversation\say 'get win state'
          Sound.BounceSide\play! if side == 'left' or side == 'right'
          Sound.BounceTop\play! if side == 'top'
          Sound.BounceBottom\play! if side == 'bottom'

  update: (dt) => sound\update dt for _, sound in pairs Sound

SoundManager\init!
SoundManager
