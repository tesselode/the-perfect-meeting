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

    @logoCanvas = lg.newCanvas WIDTH, HEIGHT

    conversation\say 'game start'

  win: =>
    @trippyBackground = Class.TrippyBackground!
    @won = true

  update: =>
    speed = @won and slomoSpeed or 1
    @trippyBackground\update! if @trippyBackground
    @logo\update speed
    @hud\update!
    @bounceManager\update!

  keypressed: (key) =>
    conversation\say 'corner bounce', 0 if key == 'f9'

  leave: =>
    @hud\clear!
    @bounceManager\clear!
    conversation\stopListening @listeners

  preDraw: =>
    with lg
      @logoCanvas\renderTo ->
        if @won == false
          .clear!
        else
          @trippyBackground\draw!
        @logo\draw!

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
      .setColor 255, 255, 255
      .draw @logoCanvas
      @hud\draw!
