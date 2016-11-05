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
      @menu\draw!
