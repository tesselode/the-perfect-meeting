generateVolumeDisplay = (v) ->
  str = ''
  for i = .1, 1, .1
    if i <= v
      str ..= '\\'
    else
      str ..= '.'
  str

->
  with Class.Menu HEIGHT/2 - 42
    .resolution = ScreenManager.resolution
    .fullscreen = ScreenManager.fullscreen

    \addOption
      text: ->
        w, h = ScreenManager\getResolution!
        'RESOLUTION  ' .. w..'X'..h
      decrement: ->
        with ScreenManager
          .resolution -= 1 if .resolution > 1
      increment: ->
        with ScreenManager
          .resolution += 1 if .resolution < #.modes
    \addOption
      text: ->
        if ScreenManager.fullscreen
          return 'FULLSCREEN         ON'
        else
          return 'FULLSCREEN        OFF'
      increment: -> ScreenManager.fullscreen = not ScreenManager.fullscreen
      decrement: -> ScreenManager.fullscreen = not ScreenManager.fullscreen
    \addOption
      text: -> 'AMBIENCE' .. '   ' .. generateVolumeDisplay Tag.Music.volume.v
      increment: ->
        with Tag.Music.volume
          .v += .1 if .v < 1
      decrement: ->
        with Tag.Music.volume
          .v -= .1 if .v > 0
    \addOption
      text: -> 'SOUNDS' .. '     ' .. generateVolumeDisplay Tag.Sfx.volume.v
      increment: ->
        with Tag.Sfx.volume
          .v += .1 if .v < 1
      decrement: ->
        with Tag.Sfx.volume
          .v -= .1 if .v > 0
    \addOption
      text: -> 'MASTER' .. '     ' .. generateVolumeDisplay Tag.Master.volume.v
      increment: ->
        with Tag.Master.volume
          .v += .1 if .v < 1
      decrement: ->
        with Tag.Master.volume
          .v -= .1 if .v > 0
    \addOption
      text: -> 'BACK'
      select: ->
        if ScreenManager.resolution ~= .resolution or ScreenManager.fullscreen ~= .fullscreen
          ScreenManager\apply!
        SaveManager\save!
        conversation\say 'leave options menu'
