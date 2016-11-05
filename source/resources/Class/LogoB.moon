acceleration = 4/60
friction = .99
minSpeed = 4

class extends Class.Logo
  new: =>
    super!
    @w, @h = 128, 96
    @x, @y = love.math.random(WIDTH-@w), love.math.random(HEIGHT-@h)
    @vx, @vy = 0, 0

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

    super speed
