class
  new: =>
    with @menu = Class.Menu HEIGHT/2
      \addOption
        text: -> 'RESUME'
        select: -> @unpause!
      \addOption
        text: -> 'BACK TO MENU'
        select: ->
          @unpause!
          conversation\say 'return to title'
          gamestate.switch State.Title!

  enter: (@previous) =>

  unpause: => gamestate.pop!

  update: =>
    @menu\update!
    @unpause! if Input\pressed 'pause'

  draw: =>
    with lg
      @previous\draw!
      .setColor 0, 0, 0, 200
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
      .setFont Font.VcrMedium
      @menu\draw!