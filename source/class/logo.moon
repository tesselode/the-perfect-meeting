nudgeAmount = 4
speed = 2
bounceTime = 60

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

  registerBounce: (type) =>
    if @bounceType == 'horizontal' and type == 'vertical' or @bounceType == 'vertical' and type == 'horizontal'
      time = bounceTime - @bounceTimer
      conversation\say 'corner bounce', time
      @bounceType = nil
      @bounceTimer = nil
    else
      @bounceType = type
      @bounceTimer = bounceTime

  bounce: =>
    if @x <= 0 or @x + @w >= WIDTH
      @vx = -@vx
      @x = 0 if @x <= 0
      @x = WIDTH - @w if @x + @w >= WIDTH
      @registerBounce 'horizontal'
    if @y <= 0 or @y + @h >= HEIGHT
      @vy = -@vy
      @y = 0 if @y <= 0
      @y = HEIGHT - @h if @y + @h >= HEIGHT
      @registerBounce 'vertical'

  draw: =>
    lg.setColor 255, 255, 255
    lg.draw Image.Logo, @x, @y
