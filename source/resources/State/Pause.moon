class
  new: =>
    conversation\say 'navigate menu'
    @generateMenu!

    with @listeners = conversation\newGroup!
      \listen 'leave options menu', -> @generateMenu!

  generateMenu: =>
    with @menu = Class.Menu HEIGHT/2 - 42
      \addOption
        text: -> 'RESUME'
        select: -> @unpause!
      \addOption
        text: -> 'OPTIONS'
        select: -> @menu = Menu.Options!
      \addOption
        text: -> 'BACK TO MENU'
        select: ->
          @unpause!
          conversation\say 'return to title'
          gamestate.switch State.Title!

  enter: (@previous) =>

  unpause: =>
    conversation\say 'navigate menu'
    gamestate.pop!

  update: =>
    @menu\update!
    @unpause! if Input\pressed 'pause'

  leave: => conversation\stopListening @listeners

  draw: =>
    with lg
      @previous\draw!
      .setColor 0, 0, 0, 200
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
      .setFont Font.VcrMedium
      @menu\draw!
