nudgeAmount = 2
speed = 1

class
  new: =>
    @x, @y = WIDTH/2, HEIGHT/2
    @w, @h = 64, 48
    @vx = love.math.random! > .5 and -speed or speed
    @vy = love.math.random! > .5 and -speed or speed

  update: =>
    @x += @vx
    @y += @vy

    @x -= nudgeAmount if input\pressed 'left'
    @x += nudgeAmount if input\pressed 'right'
    @y -= nudgeAmount if input\pressed 'up'
    @y += nudgeAmount if input\pressed 'down'

    @bounce!

  bounce: =>
    if @x <= 0 or @x + @w >= WIDTH
      @vx = -@vx
      @x = 0 if @x <= 0
      @x = WIDTH - @w if @x + @w >= WIDTH
    if @y <= 0 or @y + @h >= HEIGHT
      @vy = -@vy
      @y = 0 if @y <= 0
      @y = HEIGHT - @h if @y + @h >= HEIGHT

  draw: =>
    lg.setColor 255, 255, 255
    lg.rectangle 'fill', @x, @y, @w, @h
