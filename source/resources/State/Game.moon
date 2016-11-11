slomoSpeed = .25

class
  new: (@gameType) =>
    @bounceManager = Class.BounceManager!
    @hud = Class.Hud @gameType
    @logo = Class.LogoA! if gameType == 'a'
    @logo = Class.LogoB! if gameType == 'b'

    @won = false
    @time = 0

    @slideshow = Class.Slideshow! if TRAILER

    @listeners = with conversation\newGroup!
      \listen 'get win state', -> @won
      \listen 'corner bounce', (time) ->
        @win! if time == 0

    @logoCanvas = lg.newCanvas WIDTH, HEIGHT

    conversation\say 'game start'

  win: =>
    @trippyBackground = Class.TrippyBackground!
    @won = true
    best = SaveManager.records.best[@gameType]
    newBest = not best or @time < best
    conversation\say 'won', @time, newBest, @gameType

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

    gamestate.push State.Pause! if not @won and Input\pressed 'pause'

  keypressed: (key) =>
    @slideshow\keypressed key if TRAILER
    conversation\say 'corner bounce', 0 if key == 'f9' and DEBUG

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
      .draw @logoCanvas unless COVER
      @hud\draw! unless TRAILER or COVER
      @slideshow\draw! if TRAILER

      if COVER
        .setColor 0, 255, 0
        .setFont Font.VcrHuge
        .printc '/\\', WIDTH/2, HEIGHT/2 - 192
        .setColor 0, 255, 255
        .setFont Font.VcrBig
        .printc 'THE PERFECT', WIDTH/2, HEIGHT/2
        .printc 'MEETING', WIDTH/2, HEIGHT/2 + 84
