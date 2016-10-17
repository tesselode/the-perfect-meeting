nudgeAmount = 4
speed = 2

class
  new: =>
    @x, @y = WIDTH/2, HEIGHT/2
    @w, @h = 128, 96
    @vx = love.math.random! > .5 and -speed or speed
    @vy = love.math.random! > .5 and -speed or speed

    @bounceTimer = nil
    @bounceType = nil

  update: =>
    @x += @vx
    @y += @vy

    @x -= nudgeAmount if input\pressed 'left'
    @x += nudgeAmount if input\pressed 'right'
    @y -= nudgeAmount if input\pressed 'up'
    @y += nudgeAmount if input\pressed 'down'

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
    lg.draw Image.Logo, @x, @y
