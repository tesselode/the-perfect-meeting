acceleration = 4/60
friction = .99
minSpeed = 4

class
  new: =>
    @w, @h = 128, 96
    @x, @y = love.math.random(WIDTH-@w), love.math.random(HEIGHT-@h)
    @vx, @vy = 0, 0

    @bounceTimer = nil
    @bounceType = nil

  update: (speed = 1) =>
    movement = vector!
    unless conversation\say 'get win state'
      movement = vector Input\getRaw('right') - Input\getRaw('left'),
        Input\getRaw('down') - Input\getRaw('up')
      movement\trimInplace 1
      if movement\len! < Input.deadzone
        movement = vector!
    if movement\len! == 0 and vector(@vx, @vy)\len! > minSpeed
      @vx *= friction
      @vy *= friction
    @vx += movement.x * acceleration
    @vy += movement.y * acceleration

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
