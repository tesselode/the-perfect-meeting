{
  init: =>
    listeners = with conversation\newGroup!
      \listen 'game start', ->
        Sound.Hum\play!
        Sound.Office\play!
      \listen 'corner bounce', (time) ->
        if time == 0
          Sound.Impact\clone!\play!
          Sound.Hum\stop!
          Sound.Office\stop!
          timer.after 1.5, -> Sound.Dream\play!
      \listen 'show timing indicator', -> Sound.Corner\clone!\play!
      \listen 'bounce', (side) ->
        unless conversation\say 'get win state'
          Sound.BounceSide\clone!\play! if side == 'left' or side == 'right'
          Sound.BounceTop\clone!\play! if side == 'top'
          Sound.BounceBottom\clone!\play! if side == 'bottom'
}
