class
  new: =>
    @bounceTimer = nil
    @bounceType = nil

  update: (speed = 1) =>
    @x += @vx * speed
    @y += @vy * speed

    if @bounceTimer
      @bounceTimer -= 1
      if @bounceTimer == 0
        @bounceTimer = nil
        @bounceType = nil
    @bounce!

  bounce: =>
    if @x <= 0 or @x + @w >= WIDTH
      @vx = -@vx
      if @x <= 0
        @x = 0
        conversation\say 'bounce', 'left'
      if @x + @w >= WIDTH
        @x = WIDTH - @w
        conversation\say 'bounce', 'right'
    if @y <= 0 or @y + @h >= HEIGHT
      @vy = -@vy
      if @y <= 0
        @y = 0
        conversation\say 'bounce', 'top'
      if @y + @h >= HEIGHT
        @y = HEIGHT - @h
        conversation\say 'bounce', 'bottom'

  draw: =>
    lg.setColor 255, 255, 255
    lg.draw Image.Logo, lume.round(@x), lume.round(@y)
