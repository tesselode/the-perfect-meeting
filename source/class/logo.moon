nudgeAmount = 4
speed = 2

class
  new: =>
    @x, @y = 640/2, 480/2
    @w, @h = 128, 96
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
    if @x <= 0 or @x + @w >= 640
      @vx = -@vx
      @x = 0 if @x <= 0
      @x = 640 - @w if @x + @w >= 640
    if @y <= 0 or @y + @h >= 480
      @vy = -@vy
      @y = 0 if @y <= 0
      @y = 480 - @h if @y + @h >= 480

  draw: =>
    lg.setColor 255, 255, 255
    lg.rectangle 'fill', @x, @y, @w, @h
