class
  new: =>
    with @menu = Class.Menu HEIGHT/2
      \addOption
        text: => 'GAME A'
        select: => gamestate.switch State.Game!
      \addOption
        text: => 'GAME B'
      \addOption
        text: => 'OPTIONS'
      \addOption
        text: => 'QUIT'
        select: => love.event.quit!

  update: (dt) =>
    @menu\update dt

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
      .setFont Font.VcrMedium
      @menu\draw!
