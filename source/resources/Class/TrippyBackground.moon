class
  new: =>
    blur = shine.gaussianblur {sigma: 4}
    glow = shine.glowsimple {sigma: 5}
    @effect = blur\chain glow

    @circles = {}
    @createCircle!

  createCircle: =>
    table.insert @circles,
      x: lm.random WIDTH
      y: lm.random HEIGHT
      radius: 0
      growthSpeed: (1 + lm.random!) * .5
      color: {lm.random(255), lm.random(255), lm.random(255)}

  update: =>
    @createCircle! if lm.random(100) == 1
    for circle in *@circles
      with circle
        .radius += .growthSpeed
    @circles = lume.filter @circles, (c) -> c.radius <= 500

  draw: =>
    with lg
      @effect\draw ->
        for circle in *@circles
          .setColor circle.color
          .setLineWidth 5
          .circle 'line', circle.x, circle.y, circle.radius
