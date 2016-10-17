slomoSpeed = .25

class
  new: =>
    @bounceManager = Class.BounceManager!
    @hud = Class.Hud!
    @logo = Class.Logo!

    @won = false

    @listeners = with conversation\newGroup!
      \listen 'get win state', -> @won
      \listen 'corner bounce', (time) ->
        @win! if time == 0
    conversation\say 'game start'

  win: =>
    @won = true

  update: =>
    speed = @won and slomoSpeed or 1
    @logo\update speed
    @hud\update!
    @bounceManager\update!

  keypressed: (key) =>
    @win! if key == 'f9'

  leave: =>
    @hud\clear!
    @bounceManager\clear!
    conversation\stopListening @listeners

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
    @logo\draw!
    @hud\draw!
