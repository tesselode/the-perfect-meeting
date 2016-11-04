slomoSpeed = .25

class
  new: (gameType) =>
    @bounceManager = Class.BounceManager!
    @hud = Class.Hud!
    @logo = Class.LogoA! if gameType == 'a'
    @logo = Class.LogoB! if gameType == 'b'

    @won = false
    @time = 0

    @listeners = with conversation\newGroup!
      \listen 'get win state', -> @won
      \listen 'corner bounce', (time) ->
        @win! if time == 0

    @logoCanvas = lg.newCanvas WIDTH, HEIGHT

    conversation\say 'game start'

  win: =>
    @trippyBackground = Class.TrippyBackground!
    @won = true
    conversation\say 'won', @time

  update: =>
    speed = @won and slomoSpeed or 1
    @trippyBackground\update! if @trippyBackground
    @logo\update speed
    @hud\update!
    @bounceManager\update!

    if @won
      if Input\pressed 'primary'
        conversation\say 'return to title'
        gamestate.switch State.Title!
    else
      @time += 1/60

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
