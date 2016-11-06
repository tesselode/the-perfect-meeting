class
  new: =>
    @generateMenu!

    with @listeners = conversation\newGroup!
      \listen 'leave options menu', -> @generateMenu!

  generateMenu: =>
    with @menu = Class.Menu HEIGHT/2
      \addOption
        text: -> 'GAME A'
        select: -> gamestate.switch State.Game 'a'
      \addOption
        text: -> 'GAME B'
        select: -> gamestate.switch State.Game 'b'
      \addOption
        text: -> 'OPTIONS'
        select: -> @menu = Menu.Options!
      \addOption
        text: -> 'QUIT'
        select: -> love.event.quit!

  update: =>
    @menu\update!

  leave: => conversation\stopListening @listeners

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT

      .setFont Font.VcrMedium
      .setColor 255, 255, 255
      .printc '/\\ THE PERFECT MEETING', WIDTH/2, HEIGHT/2 - 84
      .setFont Font.VcrSmall
      if Input\getActiveDevice! == 'joystick'
        .printc 'LEFT STICK - NAVIGATE / A - SELECT', WIDTH/2, HEIGHT-21
      else
        .printc '↑↓←→ - NAVIGATE / ENTER - SELECT', WIDTH/2, HEIGHT-21
      .setFont Font.VcrMedium
      if @menu.selected == 1 and SaveManager.records.best.a
        s = 'BEST TIME: ' .. string.format '%.2f', SaveManager.records.best.a
        .printc s, WIDTH/2, 16
      if @menu.selected == 2 and SaveManager.records.best.b
        s = 'BEST TIME: ' .. string.format '%.2f', SaveManager.records.best.b
        .printc s, WIDTH/2, 16

      @menu\draw!
