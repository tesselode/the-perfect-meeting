nudgeAmount = 3
speed = 2

class extends Class.Logo
  new: =>
    super!
    @w, @h = 128, 96
    @x, @y = love.math.random(WIDTH-@w), love.math.random(HEIGHT-@h)
    @vx = love.math.random! > .5 and -speed or speed
    @vy = love.math.random! > .5 and -speed or speed

  update: (speed = 1) =>
    unless conversation\say 'get win state'
      @x -= nudgeAmount if Input\pressed 'left'
      @x += nudgeAmount if Input\pressed 'right'
      @y -= nudgeAmount if Input\pressed 'up'
      @y += nudgeAmount if Input\pressed 'down'

    super speed
