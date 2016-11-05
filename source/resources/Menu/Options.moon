->
  with Class.Menu HEIGHT/2
    \addOption
      text: ->
        w, h = ScreenManager\getResolution!
        'RESOLUTION: ' .. w..'X'..h
    \addOption
      text: -> 'FULLSCREEN: ' .. tostring ScreenManager.fullscreen
    \addOption
      text: -> 'AMBIENCE'
    \addOption
      text: -> 'SOUNDS'
    \addOption
      text: -> 'MASTER'
    \addOption
      text: -> 'BACK'
      select: -> conversation\say 'leave options menu'
