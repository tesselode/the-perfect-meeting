class
  new: =>
    @bounceManager = Class.BounceManager!
    @hud = Class.Hud!
    @logo = Class.Logo!
    Sound.Hum\play!
    Sound.Office\play!

  update: =>
    @logo\update!
    @hud\update!
    @bounceManager\update!

  leave: =>
    @hud\clear!
    @bounceManager\clear!

  draw: =>
    with lg
      .setColor 0, 0, 255
      .rectangle 'fill', 0, 0, WIDTH, HEIGHT
    @logo\draw!
    @hud\draw!
